From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Feb 2018 10:29:49 +0100
Subject: [Buildroot] [PATCH] pcre2: add patch fixing a build issue on
 m68k
In-Reply-To: <20180226224301.5826-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 26 Feb 2018 23:43:01 +0100")
References: <20180226224301.5826-1-thomas.petazzoni@bootlin.com>
Message-ID: <87r2p6pype.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 > A pretty nasty difference in alignment rules between most
 > architectures and m68k lead pcre2 to fail building its 16-bit and
 > 32-bit variants on m68k. This commit adds a patch that fixes that.

 > +Index: src/pcre2_intmodedep.h
 > +===================================================================
 > +--- a/src/pcre2_intmodedep.h	(revision 923)
 > ++++ b/src/pcre2_intmodedep.h	(working copy)
 > +@@ -797,8 +797,10 @@
 > +   PCRE2_UCHAR occu[6];       /* Used for other case code units */
 > + #elif PCRE2_CODE_UNIT_WIDTH == 16
 > +   PCRE2_UCHAR occu[2];       /* Used for other case code units */
 > ++  uint8_t     unused[2];     /* Ensure 32 bit alignment */
 > + #else
 > +   PCRE2_UCHAR occu[1];       /* Used for other case code units */
 > ++  uint8_t     unused[2];     /* Ensure 32 bit alignment */

I haven't looked at the code, but doesn't this #else refer to the 32bit
variant, which may require 4 byte alignment depending on architecture,
so the 2 bytes padding you are adding would cause eptr to move to offset
0x3c instead of 0x38?

That in itself may not be an issue, but it is a change of behaviour.

-- 
Bye, Peter Korsgaard
