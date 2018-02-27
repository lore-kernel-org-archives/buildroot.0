From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Feb 2018 11:20:55 +0100
Subject: [Buildroot] [PATCH] pcre2: add patch fixing a build issue on
 m68k
In-Reply-To: <20180227103925.7a07408e@windsurf.lan> (Thomas Petazzoni's
 message of "Tue, 27 Feb 2018 10:39:25 +0100")
References: <20180226224301.5826-1-thomas.petazzoni@bootlin.com>
 <87r2p6pype.fsf@dell.be.48ers.dk>
 <20180227103925.7a07408e@windsurf.lan>
Message-ID: <87muzupwc8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 > However, it is true that on non-m68k platform, the single PCRE2_UCHAR
 > occu[1] will probably be aligned on a 32-bit boundary, which indeed
 > would shift the rest of the structure.

 > So perhaps I should instead do something like this:

 >   uint8_t return_id;
 >   uint8_t op;

 > #if PCRE2_CODE_UNIT_WIDTH == 8
 >   PCRE2_UCHAR occu[6];       /* Used for other case code units */
 > #elif PCRE2_CODE_UNIT_WIDTH == 16
 >   PCRE2_UCHAR occu[2];       /* Used for other case code units */
 >   uint8_t     unused[2];     /* Ensure 32 bit alignment */
 > #else
 >   uint8_t     unused[2];     /* Ensure 32 bit alignment */
 >   PCRE2_UCHAR occu[1];       /* Used for other case code units */
 > #endif

 >   PCRE2_SPTR eptr;

 > This should give the same offset for the different fields, regardless
 > of the architecture, correct ?

Yes, indeed!

-- 
Bye, Peter Korsgaard
