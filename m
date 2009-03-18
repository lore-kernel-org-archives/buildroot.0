From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 18 Mar 2009 11:08:07 +0000 (UTC)
Subject: [Buildroot] [Bug 191] New: alsa-lib ARM binaries always built with
	EABI
Message-ID: <bug-191-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=191

            Target: xscale dev board
             Build: buildroot-2009.02
           Summary: alsa-lib ARM binaries always built with EABI
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: per-henrik.lundblom at connectblue.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.5


When configuring buildroot-2009.02 for OABI binaries (both uClibc/GCC and
kernel) and enabling ALSA lib, the output binaries always will be EABI
binaries.

Relevant buildroot config options:

BR2_VERSION="2009.02"
BR2_arm=y
BR2_xscale=y
BR2_ARM_TYPE="ARM_XSCALE"
BR2_ARM_OABI=y
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="xscale"
BR2_GCC_TARGET_ABI="apcs-gnu"
BR2_PACKAGE_ALSA_LIB=y

This is due to a misconfiguration in package/multimedia/alsa-lib/alsa-lib.mk

Supplied patch should fix everything:

--- buildroot-2009.02/package/multimedia/alsa-lib/alsa-lib.mk   2009-02-12
09:49:56.000000000 +0100
+++ buildroot-2009.02-patched/package/multimedia/alsa-lib/alsa-lib.mk  
2009-03-18 11:16:01.000000000 +0100
@@ -13,7 +13,7 @@ ALSA_LIB_TARGET_BINARY:=usr/lib/$(ALSA_L

 ALSA_LIB_CFLAGS=$(TARGET_CFLAGS)

-ifeq ($(BR2_arm),y)
+ifeq ($(BR2_ARM_EABI),y)
 ALSA_LIB_CFLAGS+=-mabi=aapcs-linux
 endif


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
