From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Sat, 30 Apr 2016 09:49:30 +0200
Subject: [Buildroot] [PATCH 34/34] reproducible/grub2: get a reproducible
	grub2 full installation
In-Reply-To: <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <1462002570-14706-34-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Get a reproducible modules dependencies file by fixing the awk script to
avoid depending on awk hash order, in order to get the same result
independently of the particular variant of awk used.
Compile grub2 with the target toolchain in the "full install" case, so
that the generated binaries do not depend on the host toolchain used.
---
 boot/grub2/grub2-deterministic-awk.patch | 68 ++++++++++++++++++++++++++++++++
 boot/grub2/grub2.mk                      | 34 ++++++++++------
 2 files changed, 91 insertions(+), 11 deletions(-)
 create mode 100644 boot/grub2/grub2-deterministic-awk.patch

diff --git a/boot/grub2/grub2-deterministic-awk.patch b/boot/grub2/grub2-deterministic-awk.patch
new file mode 100644
index 0000000..7f4d886
--- /dev/null
+++ b/boot/grub2/grub2-deterministic-awk.patch
@@ -0,0 +1,68 @@
+--- grub2-2.00/grub-core/genmoddep.awk~	2016-03-27 15:36:25.138050578 +0200
++++ grub2-2.00/grub-core/genmoddep.awk	2016-03-27 15:39:33.704636947 +0200
+@@ -15,17 +15,21 @@
+ BEGIN {
+   error = 0
+   lineno = 0;
++  i = 1;
+   while (getline <"/dev/stdin") {
+     lineno++;
+     if ($1 == "defined") {
+       symtab[$3] = $2;
+-      modtab[$2] = "" modtab[$2]
++      if (!modtab_index[$2])
++        modtab_index[$2]=i++
+     } else if ($1 == "undefined") {
++      if (!modtab_index[$2])
++        modtab_index[$2]=i++
+       if ($3 in symtab)
+-	modtab[$2] = modtab[$2] " " symtab[$3];
++        modtab[modtab_index[$2]] = modtab[modtab_index[$2]] " " symtab[$3];
+       else if ($3 != "__gnu_local_gp") {
+-	printf "%s in %s is not defined\n", $3, $2 >"/dev/stderr";
+-	error++;
++        printf "%s in %s is not defined\n", $3, $2 >"/dev/stderr";
++        error++;
+       }
+     }
+     else {
+@@ -41,24 +45,28 @@ END {
+   if (error >= 1)
+     exit 1;
+ 
+-  for (mod in modtab) {
++  for (j = 1; j < i; j++) {
++    for (mod in modtab_index)
++      if (modtab_index[mod] == j)
++        break;
+     # Remove duplications.
+-    split(modtab[mod], depmods, " ");
++    len=split(modtab[j], depmods, " ");
+     for (depmod in uniqmods) {
+       delete uniqmods[depmod];
+     }
+-    for (i in depmods) {
+-      depmod = depmods[i];
+-      # Ignore kernel, as always loaded.
+-      if (depmod != "kernel" && depmod != mod)
+-	uniqmods[depmod] = 1;
+-    }
+     modlist = ""
+-    for (depmod in uniqmods) {
+-      modlist = modlist " " depmod;
++    for (k = 1; k <= len; k++) {
++      depmod = depmods[k]
++      if (uniqmods[depmod])
++        continue
++      # Ignore kernel, as always loaded.
++      if (depmod != "kernel" && depmod != mod) {
++        uniqmods[depmod] = 1;
++        modlist = modlist " " depmod;
++      }
+     }
+     if (mod == "all_video") {
+-	continue;
++       continue;
+     }
+     printf "%s:%s\n", mod, modlist;
+   }
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index e2352b6..e94f524 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -46,17 +46,6 @@ endif
 # bootloader itself; none of these are used to build the native
 # tools.
 
-GRUB2_CONF_ENV = \
-	$(HOST_CONFIGURE_OPTS) \
-	CPP="$(HOSTCC) -E" \
-	TARGET_CC="$(TARGET_CC)" \
-	TARGET_CFLAGS="$(TARGET_CFLAGS)" \
-	TARGET_CPPFLAGS="$(TARGET_CPPFLAGS)" \
-	TARGET_LDFLAGS="$(TARGET_LDFLAGS)" \
-	NM="$(TARGET_NM)" \
-	OBJCOPY="$(TARGET_OBJCOPY)" \
-	STRIP="$(TARGET_STRIP)"
-
 GRUB2_CONF_OPTS = \
 	--target=$(GRUB2_TARGET) \
 	--with-platform=$(GRUB2_PLATFORM) \
@@ -68,6 +57,17 @@ GRUB2_CONF_OPTS = \
 	--disable-werror
 
 ifneq ($(BR2_TARGET_FULL_INSTALL),y)
+GRUB2_CONF_ENV = \
+	$(HOST_CONFIGURE_OPTS) \
+	CPP="$(HOSTCC) -E" \
+	TARGET_CC="$(TARGET_CC)" \
+	TARGET_CFLAGS="$(TARGET_CFLAGS)" \
+	TARGET_CPPFLAGS="$(TARGET_CPPFLAGS)" \
+	TARGET_LDFLAGS="$(TARGET_LDFLAGS)" \
+	NM="$(TARGET_NM)" \
+	OBJCOPY="$(TARGET_OBJCOPY)" \
+	STRIP="$(TARGET_STRIP)"
+
 # We don't want all the native tools and Grub2 modules to be installed
 # in the target. So we in fact install everything into the host
 # directory, and the image generation process (below) will use the
@@ -104,6 +104,18 @@ define GRUB2_EFI_STARTUP_NSH
 endef
 GRUB2_POST_INSTALL_TARGET_HOOKS += GRUB2_EFI_STARTUP_NSH
 endif
+
+else
+GRUB2_CONF_ENV = \
+	$(TARGET_CONFIGURE_OPTS) \
+	CPP="$(TARGET_CC) -E" \
+	TARGET_CC="$(TARGET_CC)" \
+	TARGET_CFLAGS="$(TARGET_CFLAGS)" \
+	TARGET_CPPFLAGS="$(TARGET_CPPFLAGS)" \
+	TARGET_LDFLAGS="$(TARGET_LDFLAGS)" \
+	NM="$(TARGET_NM)" \
+	OBJCOPY="$(TARGET_OBJCOPY)" \
+	STRIP="$(TARGET_STRIP)"
 endif
 
 $(eval $(autotools-package))
-- 
2.7.4
