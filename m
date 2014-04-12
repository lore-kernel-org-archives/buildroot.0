From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Apr 2014 17:42:10 +0200
Subject: [Buildroot] [git commit] exim: use a more standard build-time
	configuration
Message-ID: <20140412160618.2ACCF9C749@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8956779d5d224cc98e7d8d0b2ad121e895866bdc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot currently ships a very minimal build configuration file for exim,
which disables most optional features. This is not coherent with the runtime
configuration file, taken verbatim from the exim distribution, which enables
some of these features.

The visible symptom is an error during boot that prevents exim from starting:

  Exim configuration error in line 541 of /etc/exim/configure:
    router dnslookup: cannot find router driver "dnslookup"

In order to fix this problem, we change the way exim is configured at build
time. Instead of blindly copying a minimal Buildroot-provided configuration
file, we now copy the exim-provided one and then tweak it to change the needed
options. This actually makes the configuration closer to standard exim.
As the amount of tweaking is remarkable, we also define a few macros to make
it easier and more readable.

This new approach was suggested by Bernd Kuhls.

Reported-By: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/exim/exim.mk |   43 +++++++++++++++++++++++++++++++++++--------
 1 files changed, 35 insertions(+), 8 deletions(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 3e8404b..bfb138e 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -11,15 +11,42 @@ EXIM_LICENSE = GPLv2+
 EXIM_LICENSE_FILES = LICENCE
 EXIM_DEPENDENCIES = pcre berkeleydb
 
-# These echos seem to be the sanest way to feed CC and CFLAGS to exim
+# Modify a variable value. It must already exist in the file, either
+# commented or not.
+define exim-config-change # variable-name, variable-value
+	$(SED) 's,^[#[:space:]]*$1[[:space:]]*=.*$$,$1=$2,' \
+		$(@D)/Local/Makefile
+endef
+
+# Comment-out a variable. Has no effect if it does not exits.
+define exim-config-unset # variable-name
+	$(SED) 's,^\([[:space:]]*$1[[:space:]]*=.*$$\),# \1,' \
+		$(@D)/Local/Makefile
+endef
+
+# Add a variable definition. It must not already exist in the file,
+# otherwise it would be defined twice with potentially different values.
+define exim-config-add # variable-name, variable-value
+	echo "$1=$2" >>$(@D)/Local/Makefile
+endef
+
 define EXIM_CONFIGURE_CMDS
-	$(INSTALL) -m 0644 -D package/exim/Local-Makefile $(@D)/Local/Makefile
-	echo "CC=$(TARGET_CC)" >>$(@D)/Local/Makefile
-	echo "CFLAGS=$(TARGET_CFLAGS)" >>$(@D)/Local/Makefile
-	echo "AR=$(TARGET_AR) cq" >>$(@D)/Local/Makefile
-	echo "RANLIB=$(TARGET_RANLIB)" >>$(@D)/Local/Makefile
-	echo "HOSTCC=$(HOSTCC)" >>$(@D)/Local/Makefile
-	echo "HOSTCFLAGS=$(HOSTCFLAGS)" >>$(@D)/Local/Makefile
+	$(INSTALL) -m 0644 $(@D)/src/EDITME $(@D)/Local/Makefile
+	$(call exim-config-change,BIN_DIRECTORY,/usr/sbin)
+	$(call exim-config-change,CONFIGURE_FILE,/etc/exim/configure)
+	$(call exim-config-change,EXIM_USER,ref:exim)
+	$(call exim-config-change,EXIM_GROUP,mail)
+	$(call exim-config-change,TRANSPORT_LMTP,yes)
+	$(call exim-config-change,PCRE_LIBS,-lpcre)
+	$(call exim-config-change,PCRE_CONFIG,no)
+	$(call exim-config-change,HAVE_ICONV,no)
+	$(call exim-config-unset,EXIM_MONITOR)
+	$(call exim-config-add,CC,$(TARGET_CC))
+	$(call exim-config-add,CFLAGS,$(TARGET_CFLAGS))
+	$(call exim-config-add,AR,$(TARGET_AR) cq)
+	$(call exim-config-add,RANLIB,$(TARGET_RANLIB))
+	$(call exim-config-add,HOSTCC,$(HOSTCC))
+	$(call exim-config-add,HOSTCFLAGS,$(HOSTCFLAGS))
 endef
 
 # "The -j (parallel) flag must not be used with make"
