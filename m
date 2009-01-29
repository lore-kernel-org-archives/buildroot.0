From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 29 Jan 2009 16:46:24 +0100
Subject: [Buildroot] meaning of BR2_arm_dunno
In-Reply-To: <1233243053.15375.33.camel@sven> (Sven Neumann's message of "Thu\,
	29 Jan 2009 16\:30\:53 +0100")
References: <1233243053.15375.33.camel@sven>
Message-ID: <87eiymru7j.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@phase-zero.de> writes:

 Sven> Hi,

 Sven> I wonder if anyone could explain to me the purpose of
 Sven> BR2_arm_dunno as used in target/Config.in.arch. The reason I am
 Sven> asking is that we've run into the problem of ending up with a
 Sven> misconfigured gcc (as reported earlier on this list). I would
 Sven> like to find out how this can be avoided in the future, but I
 Sven> seem to be unable to understand the mechanism that selects the
 Sven> default values for BR2_GCC_TARGET_TUNE, BR2_GCC_TARGET_ARCH and
 Sven> BR2_GCC_TARGET_ABI.

It takes a bit of searching as the lines have moved around the tree a
few times, but they were originally added by Bernhard in r19040 with
the nice commit message:

- populate some BR2_GCC_TARGET_ARCH, BR2_GCC_TARGET_ABI, BR2_GCC_TARGET_TUNE defaults (hand-waving mode, of course untested.. ;)

In other words it seems pretty half baked. Taking a look at Bernhard's
git tree I see he has:

        default apcs-gnu        if BR2_ARM_OABI
        default atpcs           if BR2_arm_dunno
        default aapcs           if BR2_arm_dunno
        default aapcs-linux     if BR2_ARM_EABI

Which confusingly comes from the following commit:

commit 7f7aac5d32ba677e8be386afa6ca121af00fbf1a
Author: Bernhard Fischer <rep.dot.nop@gmail.com>
Date:   Thu Sep 18 23:47:23 2008 +0200

    remove dependency on iwmmxt

Could you give it a try with those 2 lines changed?

-- 
Bye, Peter Korsgaard
