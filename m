From: Celso Varella <celso.neto.cwi@datacom.com.br>
Date: Fri,  6 Jul 2018 11:36:12 -0300
Subject: [Buildroot] [PATCH 1/3] efitools: new package
In-Reply-To: <1530887774-19479-1-git-send-email-celso.neto.cwi@datacom.com.br>
References: <1530887774-19479-1-git-send-email-celso.neto.cwi@datacom.com.br>
Message-ID: <1530887774-19479-2-git-send-email-celso.neto.cwi@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Linux user-space application to manipulate UEFI signatures database

Patches 1 and 2 remove dependencies from sbsigntools and perl scripts

Patch 3 remove "-l" option from mount command in lib/kernel_efivars.c
for compatibility with Busybox mount command

https://git.kernel.org/pub/scm/linux/kernel/git/jejb/efitools.git/about/

Signed-off-by: Celso Varella <celso.neto.cwi@datacom.com.br>
---
 package/Config.in                                  |   1 +
 ...kefile-remove-all-dependencies-from-sbsig.patch | 155 ++++++++++++++++++++
 ...ke.rules-remove-all-dependencies-from-sbs.patch | 159 +++++++++++++++++++++
 ...tion-of-mount-command-to-turn-compatible-.patch |  27 ++++
 package/efitools/Config.in                         |   9 ++
 package/efitools/efitools.hash                     |   3 +
 package/efitools/efitools.mk                       |  21 +++
 7 files changed, 375 insertions(+)
 create mode 100644 package/efitools/0001-Efitools-Makefile-remove-all-dependencies-from-sbsig.patch
 create mode 100644 package/efitools/0002-Efitools-Make.rules-remove-all-dependencies-from-sbs.patch
 create mode 100644 package/efitools/0003-remove-l-option-of-mount-command-to-turn-compatible-.patch
 create mode 100644 package/efitools/Config.in
 create mode 100644 package/efitools/efitools.hash
 create mode 100644 package/efitools/efitools.mk

diff --git a/package/Config.in b/package/Config.in
index 20fe5ad..a61ace3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2011,6 +2011,7 @@ menu "System tools"
 	source "package/docker-proxy/Config.in"
 	source "package/dsp-tools/Config.in"
 	source "package/efibootmgr/Config.in"
+	source "package/efitools/Config.in"
 	source "package/efivar/Config.in"
 	source "package/emlog/Config.in"
 	source "package/ftop/Config.in"
diff --git a/package/efitools/0001-Efitools-Makefile-remove-all-dependencies-from-sbsig.patch b/package/efitools/0001-Efitools-Makefile-remove-all-dependencies-from-sbsig.patch
new file mode 100644
index 0000000..ac624b3
--- /dev/null
+++ b/package/efitools/0001-Efitools-Makefile-remove-all-dependencies-from-sbsig.patch
@@ -0,0 +1,155 @@
+From 396c7592005c62a2a12a0311fe480454e48b294c Mon Sep 17 00:00:00 2001
+From: "celso.neto.cwi" <celso.neto.cwi@datacom.ind.br>
+Date: Mon, 25 Jun 2018 10:45:27 -0300
+Subject: [PATCH 1/2] Efitools - Makefile remove all dependencies from
+ sbsigntools and perl script
+
+Signed-off-by: celso.neto.cwi <celso.neto.cwi@datacom.ind.br>
+---
+ Makefile | 87 ++++++++++++++++++++++++++++++++--------------------------------
+ 1 file changed, 44 insertions(+), 43 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 774ee0a..6f6674d 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,4 +1,4 @@
+-EFIFILES = HelloWorld.efi LockDown.efi Loader.efi ReadVars.efi UpdateVars.efi \
++#EFIFILES = HelloWorld.efi LockDown.efi Loader.efi ReadVars.efi UpdateVars.efi \
+ 	KeyTool.efi HashTool.efi SetNull.efi ShimReplace.efi
+ BINARIES = cert-to-efi-sig-list sig-list-to-certs sign-efi-sig-list \
+ 	hash-to-efi-sig-list efi-readvar efi-updatevar cert-to-efi-hash-list \
+@@ -8,34 +8,35 @@ ifeq ($(ARCH),x86_64)
+ EFIFILES += PreLoader.efi
+ endif
+ 
+-MSGUID = 77FA9ABD-0359-4D32-BD60-28F4E78F784B
++#MSGUID = 77FA9ABD-0359-4D32-BD60-28F4E78F784B
+ 
+-KEYS = PK KEK DB
+-EXTRAKEYS = DB1 DB2
+-EXTERNALKEYS = ms-uefi ms-kek
++#KEYS = PK KEK DB
++#EXTRAKEYS = DB1 DB2
++#EXTERNALKEYS = ms-uefi ms-kek
+ 
+-ALLKEYS = $(KEYS) $(EXTRAKEYS) $(EXTERNALKEYS)
++#ALLKEYS = $(KEYS) $(EXTRAKEYS) $(EXTERNALKEYS)
+ 
+-KEYAUTH = $(ALLKEYS:=.auth)
+-KEYUPDATEAUTH = $(ALLKEYS:=-update.auth) $(ALLKEYS:=-pkupdate.auth)
+-KEYBLACKLISTAUTH = $(ALLKEYS:=-blacklist.auth)
+-KEYHASHBLACKLISTAUTH = $(ALLKEYS:=-hash-blacklist.auth)
++#KEYAUTH = $(ALLKEYS:=.auth)
++#KEYUPDATEAUTH = $(ALLKEYS:=-update.auth) $(ALLKEYS:=-pkupdate.auth)
++#KEYBLACKLISTAUTH = $(ALLKEYS:=-blacklist.auth)
++#KEYHASHBLACKLISTAUTH = $(ALLKEYS:=-hash-blacklist.auth)
+ 
+ export TOPDIR	:= $(shell pwd)/
+ 
+ include Make.rules
+ 
+-EFISIGNED = $(patsubst %.efi,%-signed.efi,$(EFIFILES))
++#EFISIGNED = $(patsubst %.efi,%-signed.efi,$(EFIFILES))
+ 
+-all: $(EFISIGNED) $(BINARIES) $(MANPAGES) noPK.auth $(KEYAUTH) \
++#all: $(EFISIGNED) $(BINARIES) $(MANPAGES) noPK.auth $(KEYAUTH) \
+ 	$(KEYUPDATEAUTH) $(KEYBLACKLISTAUTH) $(KEYHASHBLACKLISTAUTH)
+ 
++all: $(BINARIES) 
+ 
+ install: all
+-	$(INSTALL) -m 755 -d $(MANDIR)
+-	$(INSTALL) -m 644 $(MANPAGES) $(MANDIR)
+-	$(INSTALL) -m 755 -d $(EFIDIR)
+-	$(INSTALL) -m 755 $(EFIFILES) $(EFIDIR)
++#	$(INSTALL) -m 755 -d $(MANDIR)
++#	$(INSTALL) -m 644 $(MANPAGES) $(MANDIR)
++#	$(INSTALL) -m 755 -d $(EFIDIR)
++#	$(INSTALL) -m 755 $(EFIFILES) $(EFIDIR)
+ 	$(INSTALL) -m 755 -d $(BINDIR)
+ 	$(INSTALL) -m 755 $(BINARIES) $(BINDIR)
+ 	$(INSTALL) -m 755 mkusb.sh $(BINDIR)/efitool-mkusb
+@@ -48,44 +49,44 @@ lib/lib.a lib/lib-efi.a: FORCE
+ lib/asn1/libasn1.a lib/asn1/libasn1-efi.a: FORCE
+ 	$(MAKE) -C lib/asn1 $(notdir $@)
+ 
+-.SUFFIXES: .crt
++#.SUFFIXES: .crt
+ 
+-.KEEP: PK.crt KEK.crt DB.crt PK.key KEK.key DB.key PK.esl DB.esl KEK.esl \
++#.KEEP: PK.crt KEK.crt DB.crt PK.key KEK.key DB.key PK.esl DB.esl KEK.esl \
+ 	$(EFIFILES)
+ 
+-LockDown.o: PK.h KEK.h DB.h
+-PreLoader.o: hashlist.h
++#LockDown.o: PK.h KEK.h DB.h
++#PreLoader.o: hashlist.h
+ 
+-PK.h: PK.auth
++#PK.h: PK.auth
+ 
+-KEK.h: KEK.auth
++#KEK.h: KEK.auth
+ 
+-DB.h: DB.auth
++#DB.h: DB.auth
+ 
+-noPK.esl:
+-	> noPK.esl
++#noPK.esl:
++#	> noPK.esl
+ 
+-noPK.auth: noPK.esl PK.crt sign-efi-sig-list
+-	./sign-efi-sig-list -t "$(shell date --date='1 second' +'%Y-%m-%d %H:%M:%S')" -c PK.crt -k PK.key PK $< $@
++#noPK.auth: noPK.esl PK.crt sign-efi-sig-list
++#	./sign-efi-sig-list -t "$(shell date --date='1 second' +'%Y-%m-%d %H:%M:%S')" -c PK.crt -k PK.key PK $< $@
+ 
+-ms-%.esl: ms-%.crt cert-to-efi-sig-list
+-	./cert-to-efi-sig-list -g $(MSGUID) $< $@
++#ms-%.esl: ms-%.crt cert-to-efi-sig-list
++#	./cert-to-efi-sig-list -g $(MSGUID) $< $@
+ 
+-hashlist.h: HashTool.hash
+-	cat $^ > /tmp/tmp.hash
+-	./xxdi.pl /tmp/tmp.hash > $@
+-	rm -f /tmp/tmp.hash
++#hashlist.h: HashTool.hash
++#	cat $^ > /tmp/tmp.hash
++#	./xxdi.pl /tmp/tmp.hash > $@
++#	rm -f /tmp/tmp.hash
+ 
+ 
+-Loader.so: lib/lib-efi.a
+-ReadVars.so: lib/lib-efi.a lib/asn1/libasn1-efi.a
+-UpdateVars.so: lib/lib-efi.a
+-LockDown.so: lib/lib-efi.a
+-KeyTool.so: lib/lib-efi.a lib/asn1/libasn1-efi.a
+-HashTool.so: lib/lib-efi.a
+-PreLoader.so: lib/lib-efi.a
+-HelloWorld.so: lib/lib-efi.a
+-ShimReplace.so: lib/lib-efi.a
++#Loader.so: lib/lib-efi.a
++#ReadVars.so: lib/lib-efi.a lib/asn1/libasn1-efi.a
++#UpdateVars.so: lib/lib-efi.a
++#LockDown.so: lib/lib-efi.a
++#KeyTool.so: lib/lib-efi.a lib/asn1/libasn1-efi.a
++#HashTool.so: lib/lib-efi.a
++#PreLoader.so: lib/lib-efi.a
++#HelloWorld.so: lib/lib-efi.a
++#ShimReplace.so: lib/lib-efi.a
+ 
+ cert-to-efi-sig-list: cert-to-efi-sig-list.o lib/lib.a
+ 	$(CC) $(ARCH3264) -o $@ $< -lcrypto lib/lib.a
+@@ -115,7 +116,7 @@ flash-var: flash-var.o lib/lib.a
+ 	$(CC) $(ARCH3264) -o $@ $< lib/lib.a
+ 
+ clean:
+-	rm -f PK.* KEK.* DB.* $(EFIFILES) $(EFISIGNED) $(BINARIES) *.o *.so
++	rm -f PK.* KEK.* DB.* $(BINARIES) *.o *.so
+ 	rm -f noPK.*
+ 	rm -f doc/*.1
+ 	$(MAKE) -C lib clean
+-- 
+2.7.4
+
diff --git a/package/efitools/0002-Efitools-Make.rules-remove-all-dependencies-from-sbs.patch b/package/efitools/0002-Efitools-Make.rules-remove-all-dependencies-from-sbs.patch
new file mode 100644
index 0000000..20d72f2
--- /dev/null
+++ b/package/efitools/0002-Efitools-Make.rules-remove-all-dependencies-from-sbs.patch
@@ -0,0 +1,159 @@
+From bbefa8ec090a0df4ecb31b734d3a1d41d8aadad4 Mon Sep 17 00:00:00 2001
+From: "celso.neto.cwi" <celso.neto.cwi@datacom.ind.br>
+Date: Mon, 25 Jun 2018 11:27:43 -0300
+Subject: [PATCH 2/2] Efitools - Make.rules remove all dependencies from
+ sbsigntools and perl script
+
+Signed-off-by: celso.neto.cwi <celso.neto.cwi@datacom.ind.br>
+---
+ Make.rules | 94 +++++++++++++++++++++++++++++++-------------------------------
+ 1 file changed, 47 insertions(+), 47 deletions(-)
+
+diff --git a/Make.rules b/Make.rules
+index 903a5a4..446f9e8 100644
+--- a/Make.rules
++++ b/Make.rules
+@@ -1,6 +1,6 @@
+-EFISIGNED = $(patsubst %.efi,%-signed.efi,$(EFIFILES))
+-MANPAGES = $(patsubst doc/%.1.in,doc/%.1,$(wildcard doc/*.1.in))
+-HELP2MAN = help2man
++#EFISIGNED = $(patsubst %.efi,%-signed.efi,$(EFIFILES))
++#MANPAGES = $(patsubst doc/%.1.in,doc/%.1,$(wildcard doc/*.1.in))
++#HELP2MAN = help2man
+ ARCH	 = $(shell uname -m | sed 's/i.86/ia32/;s/arm.*/arm/')
+ ifeq ($(ARCH),ia32)
+ ARCH3264 = -m32
+@@ -31,8 +31,8 @@ OBJCOPY		= objcopy
+ MYGUID		= 11111111-2222-3333-4444-123456789abc
+ INSTALL		= install
+ BINDIR		= $(DESTDIR)/usr/bin
+-MANDIR		= $(DESTDIR)/usr/share/man/man1
+-EFIDIR		= $(DESTDIR)/usr/share/efitools/efi
++#MANDIR		= $(DESTDIR)/usr/share/man/man1
++#EFIDIR		= $(DESTDIR)/usr/share/efitools/efi
+ DOCDIR		= $(DESTDIR)/usr/share/efitools
+ 
+ # globally use EFI calling conventions (requires gcc >= 4.7)
+@@ -56,71 +56,71 @@ ifeq ($(ARCH),aarch64)
+   FORMAT = -O binary
+ endif
+ 
+-%.efi: %.so
+-	$(OBJCOPY) -j .text -j .sdata -j .data -j .dynamic -j .dynsym \
+-		   -j .rel -j .rela -j .rel.* -j .rela.* -j .rel* -j .rela* \
+-		   -j .reloc $(FORMAT) $*.so $@
++#%.efi: %.so
++#	$(OBJCOPY) -j .text -j .sdata -j .data -j .dynamic -j .dynsym \
++#		   -j .rel -j .rela -j .rel.* -j .rela.* -j .rel* -j .rela* \
++#		   -j .reloc $(FORMAT) $*.so $@
+ %.so: %.o
+ 	$(LD) $(LDFLAGS) $^ -o $@ $(LOADLIBES)
+ 	# check we have no undefined symbols
+ 	nm -D $@ | grep ' U ' && exit 1 || exit 0
+ 
+-%.h: %.auth
+-	./xxdi.pl $< > $@
++#%.h: %.auth
++#	./xxdi.pl $< > $@
+ 
+-%.hash: %.efi hash-to-efi-sig-list
+-	./hash-to-efi-sig-list $< $@
++#%.hash: %.efi hash-to-efi-sig-list
++#	./hash-to-efi-sig-list $< $@
+ 
+-%-blacklist.esl: %.crt cert-to-efi-hash-list
+-	./cert-to-efi-sig-list $< $@
++#%-blacklist.esl: %.crt cert-to-efi-hash-list
++#	./cert-to-efi-sig-list $< $@
+ 
+-%-hash-blacklist.esl: %.crt cert-to-efi-hash-list
+-	./cert-to-efi-hash-list $< $@
++#%-hash-blacklist.esl: %.crt cert-to-efi-hash-list
++#	./cert-to-efi-hash-list $< $@
+ 
+-%.esl: %.crt cert-to-efi-sig-list
+-	./cert-to-efi-sig-list -g $(MYGUID) $< $@
++#%.esl: %.crt cert-to-efi-sig-list
++#	./cert-to-efi-sig-list -g $(MYGUID) $< $@
+ 
+-getcert = $(shell if [ "$(1)" = "PK" -o "$(1)" = "KEK" ]; then echo "-c PK.crt -k PK.key"; else echo "-c KEK.crt -k KEK.key"; fi)
+-getvar = $(shell if [ "$(1)" = "PK" -o "$(1)" = "KEK" ]; then echo $(1); else echo db; fi)
++#getcert = $(shell if [ "$(1)" = "PK" -o "$(1)" = "KEK" ]; then echo "-c PK.crt -k PK.key"; else echo "-c KEK.crt -k KEK.key"; fi)
++#getvar = $(shell if [ "$(1)" = "PK" -o "$(1)" = "KEK" ]; then echo $(1); else echo db; fi)
+ 
+-%.auth: %.esl PK.crt KEK.crt sign-efi-sig-list
+-	./sign-efi-sig-list $(call getcert,$*) $(call getvar,$*) $< $@
++#%.auth: %.esl PK.crt KEK.crt sign-efi-sig-list
++#	./sign-efi-sig-list $(call getcert,$*) $(call getvar,$*) $< $@
+ 
+-%-update.auth: %.esl PK.crt KEK.crt sign-efi-sig-list
+-	./sign-efi-sig-list -a $(call getcert,$*) $(call getvar,$*) $< $@
++#%-update.auth: %.esl PK.crt KEK.crt sign-efi-sig-list
++#	./sign-efi-sig-list -a $(call getcert,$*) $(call getvar,$*) $< $@
+ 
+-%-pkupdate.auth: %.esl PK.crt sign-efi-sig-list
+-	./sign-efi-sig-list -a -c PK.crt -k PK.key $(call getvar,$*) $< $@
++#%-pkupdate.auth: %.esl PK.crt sign-efi-sig-list
++#	./sign-efi-sig-list -a -c PK.crt -k PK.key $(call getvar,$*) $< $@
+ 
+-%-blacklist.auth: %-blacklist.esl KEK.crt sign-efi-sig-list
+-	./sign-efi-sig-list -a -c KEK.crt -k KEK.key dbx $< $@
++#%-blacklist.auth: %-blacklist.esl KEK.crt sign-efi-sig-list
++#	./sign-efi-sig-list -a -c KEK.crt -k KEK.key dbx $< $@
+ 
+-%-pkblacklist.auth: %-blacklist.esl PK.crt sign-efi-sig-list
+-	./sign-efi-sig-list -a -c PK.crt -k PK.key dbx $< $@
++#%-pkblacklist.auth: %-blacklist.esl PK.crt sign-efi-sig-list
++#	./sign-efi-sig-list -a -c PK.crt -k PK.key dbx $< $@
+ 
+ %.o: %.c
+ 	$(CC) $(INCDIR) $(CFLAGS) $(CPPFLAGS) -c $< -o $@
+ 
+-%.efi.o: %.c
+-	$(CC) $(INCDIR) $(CFLAGS) $(CPPFLAGS) -fno-toplevel-reorder -DBUILD_EFI -c $< -o $@
++#%.efi.o: %.c
++#	$(CC) $(INCDIR) $(CFLAGS) $(CPPFLAGS) -fno-toplevel-reorder -DBUILD_EFI -c $< -o $@
+ 
+-%.efi.s: %.c
+-	$(CC) -S $(INCDIR) $(CFLAGS) $(CPPFLAGS) -fno-toplevel-reorder -DBUILD_EFI -c $< -o $@
++#%.efi.s: %.c
++#	$(CC) -S $(INCDIR) $(CFLAGS) $(CPPFLAGS) -fno-toplevel-reorder -DBUILD_EFI -c $< -o $@
+ 
+-%.crt:
+-	openssl req -new -x509 -newkey rsa:2048 -subj "/CN=$*/" -keyout $*.key -out $@ -days 3650 -nodes -sha256
++#%.crt:
++#	openssl req -new -x509 -newkey rsa:2048 -subj "/CN=$*/" -keyout $*.key -out $@ -days 3650 -nodes -sha256
+ 
+-%.cer: %.crt
+-	openssl x509 -in $< -out $@ -outform DER
++#%.cer: %.crt
++#	openssl x509 -in $< -out $@ -outform DER
+ 
+-%-subkey.csr:
+-	openssl req -new -newkey rsa:2048 -keyout $*-subkey.key -subj "/CN=Subkey $* of KEK/" -out $@ -nodes
++#%-subkey.csr:
++#	openssl req -new -newkey rsa:2048 -keyout $*-subkey.key -subj "/CN=Subkey $* of KEK/" -out $@ -nodes
+ 
+-%-subkey.crt: %-subkey.csr KEK.crt
+-	openssl x509 -req -in $< -CA DB.crt -CAkey DB.key -set_serial 1 -out $@ -days 365
++#%-subkey.crt: %-subkey.csr KEK.crt
++#	openssl x509 -req -in $< -CA DB.crt -CAkey DB.key -set_serial 1 -out $@ -days 365
+ 
+-%-signed.efi: %.efi DB.crt
+-	sbsign --key DB.key --cert DB.crt --output $@ $<
++#%-signed.efi: %.efi DB.crt
++#	sbsign --key DB.key --cert DB.crt --output $@ $<
+ 
+ ##
+ # No need for KEK signing
+@@ -131,5 +131,5 @@ getvar = $(shell if [ "$(1)" = "PK" -o "$(1)" = "KEK" ]; then echo $(1); else ec
+ %.a:
+ 	ar rcv $@ $^
+ 
+-doc/%.1: doc/%.1.in %
+-	$(HELP2MAN) --no-info -i $< -o $@ ./$*
++#doc/%.1: doc/%.1.in %
++#	$(HELP2MAN) --no-info -i $< -o $@ ./$*
+-- 
+2.7.4
+
diff --git a/package/efitools/0003-remove-l-option-of-mount-command-to-turn-compatible-.patch b/package/efitools/0003-remove-l-option-of-mount-command-to-turn-compatible-.patch
new file mode 100644
index 0000000..680e69f
--- /dev/null
+++ b/package/efitools/0003-remove-l-option-of-mount-command-to-turn-compatible-.patch
@@ -0,0 +1,27 @@
+From ccd65d5fa22a95c48c1301ab50d3547f162e3e54 Mon Sep 17 00:00:00 2001
+From: "celso.neto.cwi" <celso.neto.cwi@datacom.ind.br>
+Date: Tue, 26 Jun 2018 08:31:51 -0300
+Subject: [PATCH 3/3] remove "-l" option of mount command to turn compatible
+ with mount of busybox
+
+Signen-off-by: celso.neto.cwi <celso.neto.cwi@datacom.ind.br>
+---
+ lib/kernel_efivars.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/kernel_efivars.c b/lib/kernel_efivars.c
+index 630088b..636217b 100644
+--- a/lib/kernel_efivars.c
++++ b/lib/kernel_efivars.c
+@@ -38,7 +38,7 @@ kernel_variable_init(void)
+ 	if (kernel_efi_path)
+ 		return;
+ 	mktemp(fname);
+-	snprintf(cmdline, sizeof(cmdline), "mount -l > %s", fname);
++	snprintf(cmdline, sizeof(cmdline), "mount > %s", fname);
+ 	ret = system(cmdline);
+ 	if (WEXITSTATUS(ret) != 0)
+ 		/* hopefully stderr said what was wrong */
+-- 
+2.7.4
+
diff --git a/package/efitools/Config.in b/package/efitools/Config.in
new file mode 100644
index 0000000..83894a1
--- /dev/null
+++ b/package/efitools/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_EFITOOLS
+	bool "efitools"
+	select BR2_PACKAGE_GNU_EFI
+	select BR2_PACKAGE_OPENSSL
+	help
+	  A Linux user-space application to manipulate UEFI signatures
+	  database
+
+	  https://git.kernel.org/pub/scm/linux/kernel/git/jejb/efitools.git/about/
diff --git a/package/efitools/efitools.hash b/package/efitools/efitools.hash
new file mode 100644
index 0000000..2346ed7
--- /dev/null
+++ b/package/efitools/efitools.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256 64f4f53a1a1b92f38c4cfae9edcb5ba3eb4ef0e8c5d079e04cc03204699d3d38 efitools-1.8.1.tar.gz
+sha256 824d6063f4319acb32fe5de52738c72e54ce8ff3dea3470462ff135b958480b5 COPYING
diff --git a/package/efitools/efitools.mk b/package/efitools/efitools.mk
new file mode 100644
index 0000000..4257b2a
--- /dev/null
+++ b/package/efitools/efitools.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# efitools
+#
+################################################################################
+
+EFITOOLS_VERSION = 1.8.1
+EFITOOLS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/jejb/efitools.git/snapshot
+EFITOOLS_LICENSE = GPL-2.0+
+EFITOOLS_LICENSE_FILES = COPYING
+EFITOOLS_DEPENDENCIES = gnu-efi openssl
+
+define EFITOOLS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define EFITOOLS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
2.7.4
