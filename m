From: Roberto A. Foglietta <roberto.foglietta@gmail.com>
Date: Wed, 19 Nov 2008 00:19:16 +0100
Subject: [Buildroot] [PATCH] small patches (was: skeleton patch)
In-Reply-To: <e4c675870811181146g39352c46tcaaa832bde6cf4c@mail.gmail.com>
References: <e4c675870811181121r169f9fcej6f8c2470bb46d34d@mail.gmail.com>
	<e4c675870811181146g39352c46tcaaa832bde6cf4c@mail.gmail.com>
Message-ID: <e4c675870811181519k155d9ea7w7fdcebd5ad53e7e4@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

 the command "make BOARD=$PROJECT getconfig" fails if it called at the
beginning of the project. It makes sense doing it because local could
be copied from another project in order to start it from scratch
again. This patch try to fix the problem (bug report n.6044)


--- project/project.mk.prev	2008-11-09 12:03:47.000000000 +0100
+++ project/project.mk	2008-11-09 12:04:31.000000000 +0100
@@ -46,8 +46,10 @@ saveconfig: $(CONFIG)/conf
 			$(LOCAL)/$(PROJECT)/u-boot/$(PROJECT).h; \
 	fi

-getconfig: $(CONFIG)/conf
+getconfig:
+	-@$(MAKE) CC="$(HOSTCC)" -C $(CONFIG) conf mconf
 	-cp $(LOCAL)/$(PROJECT)/$(PROJECT).config .config
+	- at yes "" | $(MAKE) config

 vendor-dbg:
 	@echo VENDOR_SITE=$(BR2_VENDOR_SITE)
--- Makefile.prev	2008-11-09 12:04:41.000000000 +0100
+++ Makefile	2008-11-09 12:05:02.000000000 +0100
@@ -512,5 +512,5 @@ help:
 	@echo

 .PHONY: dummy subdirs release distclean clean config oldconfig \
-	menuconfig tags check test depend defconfig help
+	menuconfig tags check test depend defconfig help .config.cmd


 Ciao,
-- 
/roberto
