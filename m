From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Feb 2018 10:39:25 +0100
Subject: [Buildroot] [PATCH] pcre2: add patch fixing a build issue on
 m68k
In-Reply-To: <87r2p6pype.fsf@dell.be.48ers.dk>
References: <20180226224301.5826-1-thomas.petazzoni@bootlin.com>
 <87r2p6pype.fsf@dell.be.48ers.dk>
Message-ID: <20180227103925.7a07408e@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 27 Feb 2018 10:29:49 +0100, Peter Korsgaard wrote:

>  > A pretty nasty difference in alignment rules between most
>  > architectures and m68k lead pcre2 to fail building its 16-bit and
>  > 32-bit variants on m68k. This commit adds a patch that fixes that.  
> 
>  > +Index: src/pcre2_intmodedep.h
>  > +===================================================================
>  > +--- a/src/pcre2_intmodedep.h	(revision 923)
>  > ++++ b/src/pcre2_intmodedep.h	(working copy)
>  > +@@ -797,8 +797,10 @@
>  > +   PCRE2_UCHAR occu[6];       /* Used for other case code units */
>  > + #elif PCRE2_CODE_UNIT_WIDTH == 16
>  > +   PCRE2_UCHAR occu[2];       /* Used for other case code units */
>  > ++  uint8_t     unused[2];     /* Ensure 32 bit alignment */
>  > + #else
>  > +   PCRE2_UCHAR occu[1];       /* Used for other case code units */
>  > ++  uint8_t     unused[2];     /* Ensure 32 bit alignment */  
> 
> I haven't looked at the code, but doesn't this #else refer to the 32bit
> variant, which may require 4 byte alignment depending on architecture,
> so the 2 bytes padding you are adding would cause eptr to move to offset
> 0x3c instead of 0x38?

Without this additional unused[2] for the 32-bit variant, pcre2 32-bit
variant would not build on m68k.

Indeed, the occu[] array starts at offset 0x32, which is a multiple of
2, but not a multiple of 4. Then you add a single PCRE2_UCHAR, which in
the 32-bit variant is 32-bit long, you end up with the eptr pointer at
offset 0x32 + 4, which is 0x36, which again is a multiple of 2, but not
a multiple of 4.

By adding these additional two bytes, I make sure that the eptr field
is at offset 0x38. This is why the unused[2] in the #else case is
needed for the m68k to build.

However, it is true that on non-m68k platform, the single PCRE2_UCHAR
occu[1] will probably be aligned on a 32-bit boundary, which indeed
would shift the rest of the structure.

So perhaps I should instead do something like this:

  uint8_t return_id;
  uint8_t op;

#if PCRE2_CODE_UNIT_WIDTH == 8
  PCRE2_UCHAR occu[6];       /* Used for other case code units */
#elif PCRE2_CODE_UNIT_WIDTH == 16
  PCRE2_UCHAR occu[2];       /* Used for other case code units */
  uint8_t     unused[2];     /* Ensure 32 bit alignment */
#else
  uint8_t     unused[2];     /* Ensure 32 bit alignment */
  PCRE2_UCHAR occu[1];       /* Used for other case code units */
#endif

  PCRE2_SPTR eptr;

This should give the same offset for the different fields, regardless
of the architecture, correct ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
