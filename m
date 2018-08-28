From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Aug 2018 09:54:05 +0200
Subject: [Buildroot] [PATCH] mbedtls: fix x86 PIC build with GCC < 5
In-Reply-To: <20180827211642.1599-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 27 Aug 2018 23:16:42 +0200")
References: <20180827211642.1599-1-peter@korsgaard.com>
Message-ID: <87lg8r6i5e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/d6d/d6dc9a640aa1f6650a3e7b9397f2fe2ae3433f4d/
 > http://autobuild.buildroot.net/results/ab5/ab5a58ea7845f9f378454ee1aa7e872448618ba9/

 > ebx was recently added to the x86 inline asm MULADDC_STOP clobber list to
 > fix #1550, but this causes the build to fail with GCC < 5 when building in
 > PIC mode with errors like:

 > include/mbedtls/bn_mul.h:46:13: error: PIC register clobbered by ?ebx? in ?asm?

 > This is because older GCC versions treated the x86 ebx register (which is
 > used for the GOT) as a fixed reserved register when building as PIC.

 > This is fixed by an improved register allocator in GCC 5+.  From the release
 > notes:

 > Register allocation improvements: Reuse of the PIC hard register, instead of
 > using a fixed register, was implemented on x86/x86-64 targets.  This
 > improves generated PIC code performance as more hard registers can be used.

 > https://www.gnu.org/software/gcc/gcc-5/changes.html

 > As a workaround, add a patch to detect this situation and disable the inline
 > assembly, similar to the MULADDC_CANNOT_USE_R7 logic.

 > Patch submitted upstream: https://github.com/ARMmbed/mbedtls/pull/1986

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
