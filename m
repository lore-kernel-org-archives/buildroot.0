From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 17 Aug 2012 12:28:37 +0000 (UTC)
Subject: [Buildroot] [Bug 5450] AT91SAM9260 Bootstrap compilation problem
In-Reply-To: <bug-5450-163@https.bugs.busybox.net/>
References: <bug-5450-163@https.bugs.busybox.net/>
Message-ID: <20120817122837.D041D971EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5450

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-08-17 12:28:37 UTC ---
Thanks for reporting this bug!

After a quick analysis, it sounds like the AT91Bootstrap makefile is not
parallel-build capable: it runs the "clean" procedure and the build procedure
in parallel, so depending on the scheduling and other conditions, it may happen
that some .o files get removed after they have been produced.

Can you try the below change and see if it fixes the problem for you:

diff --git a/boot/at91bootstrap/at91bootstrap.mk
b/boot/at91bootstrap/at91bootstrap.mk
index d8caed7..35f6260 100644
--- a/boot/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -31,7 +31,7 @@ AT91BOOTSTRAP_POST_PATCH_HOOKS +=
AT91BOOTSTRAP_APPLY_CUSTOM_PATCHES
 endif

 define AT91BOOTSTRAP_BUILD_CMDS
-       $(MAKE) CROSS_COMPILE=$(TARGET_CROSS) -C
$(@D)/$(AT91BOOTSTRAP_MAKE_SUBDIR)
+       $(MAKE1) CROSS_COMPILE=$(TARGET_CROSS) -C
$(@D)/$(AT91BOOTSTRAP_MAKE_SUBDIR)
 endef

 define AT91BOOTSTRAP_INSTALL_IMAGES_CMDS

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
