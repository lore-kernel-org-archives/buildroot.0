From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 11 May 2011 20:32:00 +0000 (UTC)
Subject: [Buildroot] [Bug 3703] Consider using /usr/bin/env bash in scripts
In-Reply-To: <bug-3703-163@https.bugs.busybox.net/>
References: <bug-3703-163@https.bugs.busybox.net/>
Message-ID: <20110511203200.AC3E68349F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3703

--- Comment #2 from holger+br at freyther.de  ---
I am hacking my way... so here is my incomplete list
I do have symlinks to help me.. with GNU coreutils
  mktemp -> gmktemp
  sed -> gsed
  install -> ginstall

uclibc fails to build a host utility... but on the second gmake just
continues...
  HOSTCC utils/ldconfig.host
In file included from ../utils/ldconfig.c:170:
../utils/readsoname2.c: In function 'readsoname32':
../utils/readsoname2.c:3: warning: implicit declaration of function 'ElfW'
(and more pointers to Elf names)


busybox fails with a include of shadow.h (not present on FreeBSD)

so I do have a basic gcc/uclibc toolchain for mips right now with the below
hacky changes


diff --git a/Makefile b/Makefile
index 5f61b93..599e7f5 100644
--- a/Makefile
+++ b/Makefile
@@ -108,9 +108,10 @@ else
 endif

 # we want bash as shell
-SHELL:=$(shell if [ -x "$$BASH" ]; then echo $$BASH; \
-       else if [ -x /bin/bash ]; then echo /bin/bash; \
-       else echo sh; fi; fi)
+SHELL:=/usr/local/bin/bash
+#$(shell if [ -x "$$BASH" ]; then echo $$BASH; \
+       #else if [ -x /bin/bash ]; then echo /bin/bash; \
+       #else echo sh; fi; fi)

 # kconfig uses CONFIG_SHELL
 CONFIG_SHELL:=$(SHELL)

 # Check if we can link to ncurses
diff --git a/toolchain/patch-kernel.sh b/toolchain/patch-kernel.sh
index 76cb9f7..1e64d8d 100755
--- a/toolchain/patch-kernel.sh
+++ b/toolchain/patch-kernel.sh
@@ -1,4 +1,4 @@
-#! /bin/bash
+#! /usr/bin/env bash
 # A little script I whipped up to make it easy to
 # patch source trees and have sane error handling
 # -Erik

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
