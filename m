From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 May 2019 13:49:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/gdb: fix build of 8.1.1 on ARM
 cortex A8
In-Reply-To: <20190513212412.7de78aa5@windsurf.home> (Thomas Petazzoni's
 message of "Mon, 13 May 2019 21:24:12 +0200")
References: <20190512101147.7967-1-fontaine.fabrice@gmail.com>
 <20190513212412.7de78aa5@windsurf.home>
Message-ID: <87d0k5l9l9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello Fabrice,
 > On Sun, 12 May 2019 12:11:47 +0200
 > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

 >> Fixes:
 >> - http://autobuild.buildroot.org/results/a81eb395bd95306fcbb07c1443c9134fd63fa379
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 > This commit log was a bit terse, and the issue is not related to ARM
 > Cortex-A8: it happens on all architectures. You only see it on ARM
 > Cortex A8 in the autobuilders because it's the only architecture with
 > an internal glibc configuration, which means it's the only testing
 > glibc 2.29. Indeed the root source of the build failure is the bump
 > from glibc 2.28 to 2.29.

 > If you look at http://autobuild.buildroot.net/?reason=gdb% you can
 > clearly see the pattern that the issue started appearing on March 17,
 > 2019. Guess what was merged on March 15, 2019 ? The bump to glibc 2.29.

 > So, I improved the commit log to explain which glibc change broke this,
 > and why an IA64-related build fix in gdb is in fact needed on other
 > architectures. So the commit log now goes like this:

 >     package/gdb: fix build of 8.1.1 since the bump to glibc 2.29
    
 >     Between glibc 2.28 and glibc 2.29, commit
 >     89983cb37c9319806a551e8fe9f3a11ff8f973e1 ("Update siginfo constants
 >     from Linux kernel (bug 21286)") was merged. This commit moved the
 >     TRAP_HWBKPT definition from an IA64-specific header to an
 >     architecture-agnostic header.
    
 >     This change exhibited a build issue that until then was only visible
 >     on IA64 (which Buildroot does not support). This Buildroot commit
 >     backports a patch from gdb upstream (which is in gdb since 8.2) which
 >     mentions IA64 because it was originally meant to fix only the
 >     IA64-related issue. But the glibc change, this change has become
 >     visible on all architectures.

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
