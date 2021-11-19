Return-Path: <SRS0=y7vk=QG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1464EC433F5
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 07:47:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7943661108
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 07:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7943661108
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BD3661BDF;
	Fri, 19 Nov 2021 07:47:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jLKBnOMTAWSc; Fri, 19 Nov 2021 07:47:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A83D61BDC;
	Fri, 19 Nov 2021 07:47:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 016F81BF2E5
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 07:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6B0B81D2D
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 07:47:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dty4PxTayTtj for <buildroot@lists.busybox.net>;
 Fri, 19 Nov 2021 07:47:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A0DF681D4D
 for <buildroot@buildroot.org>; Fri, 19 Nov 2021 07:47:35 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso9728178wms.2
 for <buildroot@buildroot.org>; Thu, 18 Nov 2021 23:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dzTqiM4yjhpWtABl8/9DkpbjiV3q5q0ba5gb0dkH8rA=;
 b=R+o3bhwPg2fezJdLez4ZetMmiKU+t6nyKP+idJ97hIZHRm9VnPldfEXgH06SNWyAVr
 i4E9CwmG8L9FjjbdB7KVuQrhPlmcXEM4E+revYllgMNgw/cuSAlTEs8B+9qXo7drhvPe
 BmFunzPof7SqDlZqh+zU4y83Z3hzzi8A/FpHTOMfAwKpvk/GNb+NJOuGUC83F+rDSx2o
 ui9xspuGW0B9o7yD+uBJ7RsW5fCGVNLX+qPYQ7Hdh3eGrwswosuAiFYMjUErim/Ddnv9
 MOWhdszuK4xcnvIuLa1HNh1phaYkoO35oTpS6pj64OgOumvXa80e/xrIyXoQ5kpQWj30
 wVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dzTqiM4yjhpWtABl8/9DkpbjiV3q5q0ba5gb0dkH8rA=;
 b=lLDhyWWY7jB6Dr6NiUj1n3aGDOAD9vzIzvUKBWhKDwHAsxmVTWW4Bd7JIA9qQlaeSI
 Y8vH7EZi7nCkLeoG2nwr3uZgFVBqj3q3VjVyWH9tH7dE126mJHBrk3v76IPQdBIIsTsT
 7USRyD0Ahcl+xGEMDJSZgiaqJf448hg4QAmDVi648+D5w4OKSCwfX1QMenN++EQz0Fk0
 KeCVRHUV/38HPqlKZKaQkQ/Qj6pa800GK+gMFy3ARH/VJkeSaogBMKL9IL3F4BkqHZkE
 s33Xirn92gLWMpYm56usftYuxbnqAbvL0LVzorfos9ORV5Vapd82GczJ9NmeOB4+Jofa
 +lNQ==
X-Gm-Message-State: AOAM530SJMLWBa2vi+PQJi2Z/Fg1eyQhQg2NErlRiGX0RLYZNqR094VX
 lqSBs/oYTovZfFteIT1qZ+Xi+Mnt6jE=
X-Google-Smtp-Source: ABdhPJyFg0bUk4CIWcQcsSDYFXbDdl2NWiysD0ZPX5YijLfIhvncV/D9buJUAa0WdYxTikIQUHm+/g==
X-Received: by 2002:a7b:c85a:: with SMTP id c26mr4389375wml.53.1637308053561; 
 Thu, 18 Nov 2021 23:47:33 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id l22sm1980930wmp.34.2021.11.18.23.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 23:47:33 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 19 Nov 2021 08:45:23 +0100
Message-Id: <20211119074523.2115307-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gdb: fix NLS build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since version 10.1 and
https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=9a665d62266e75f0519f3a663784c458885b5c63:

  CXXLD  libinproctrace.so
/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: gdbsupport/tdesc-ipa.o: in function `print_xml_feature::visit(tdesc_type_builtin const*)':
/home/buildroot/autobuild/instance-2/output-1/build/gdb-10.2/build/gdbserver/../../gdbserver/../gdbsupport/tdesc.cc:310: undefined reference to `libintl_gettext'

Fixes:
 - http://autobuild.buildroot.org/results/faacc874fe9d32b74cb3d3dea988ef661cb0e3d0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-gdbserver-Makefile.in-fix-NLS-build.patch | 38 +++++++++++++++++++
 ...-gdbserver-Makefile.in-fix-NLS-build.patch | 38 +++++++++++++++++++
 package/gdb/gdb.mk                            |  1 +
 3 files changed, 77 insertions(+)
 create mode 100644 package/gdb/10.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch
 create mode 100644 package/gdb/11.1/0009-gdbserver-Makefile.in-fix-NLS-build.patch

diff --git a/package/gdb/10.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch b/package/gdb/10.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch
new file mode 100644
index 0000000000..3d7534a48a
--- /dev/null
+++ b/package/gdb/10.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch
@@ -0,0 +1,38 @@
+From c098500aee945ee7a3021649eb0a2655b004103c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 18 Nov 2021 22:52:08 +0100
+Subject: [PATCH] gdbserver/Makefile.in: fix NLS build
+
+Fix the following build failure raised since gdb version 10.1 and
+https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=9a665d62266e75f0519f3a663784c458885b5c63:
+
+  CXXLD  libinproctrace.so
+/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: gdbsupport/tdesc-ipa.o: in function `print_xml_feature::visit(tdesc_type_builtin const*)':
+/home/buildroot/autobuild/instance-2/output-1/build/gdb-10.2/build/gdbserver/../../gdbserver/../gdbsupport/tdesc.cc:310: undefined reference to `libintl_gettext'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/faacc874fe9d32b74cb3d3dea988ef661cb0e3d0
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://sourceware.org/pipermail/gdb-patches/2021-November/183580.html]
+---
+ gdbserver/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gdbserver/Makefile.in b/gdbserver/Makefile.in
+index 71c3c4ad959..e69fbc4dae4 100644
+--- a/gdbserver/Makefile.in
++++ b/gdbserver/Makefile.in
+@@ -383,7 +383,7 @@ $(IPA_LIB): $(sort $(IPA_OBJS)) ${CDEPS}
+	$(SILENCE) rm -f $(IPA_LIB)
+ 	$(ECHO_CXXLD) $(CC_LD) -shared -fPIC -Wl,--soname=$(IPA_LIB) \
+ 		-Wl,--no-undefined $(INTERNAL_CFLAGS) $(INTERNAL_LDFLAGS) \
+-		-o $(IPA_LIB) ${IPA_OBJS} -ldl -pthread
++		-o $(IPA_LIB) ${IPA_OBJS} -ldl -pthread $(INTL)
+ 
+ # Put the proper machine-specific files first, so M-. on a machine
+ # specific routine gets the one for the correct machine.
+-- 
+2.33.0
+
diff --git a/package/gdb/11.1/0009-gdbserver-Makefile.in-fix-NLS-build.patch b/package/gdb/11.1/0009-gdbserver-Makefile.in-fix-NLS-build.patch
new file mode 100644
index 0000000000..903dc61df8
--- /dev/null
+++ b/package/gdb/11.1/0009-gdbserver-Makefile.in-fix-NLS-build.patch
@@ -0,0 +1,38 @@
+From c098500aee945ee7a3021649eb0a2655b004103c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 18 Nov 2021 22:52:08 +0100
+Subject: [PATCH] gdbserver/Makefile.in: fix NLS build
+
+Fix the following build failure raised since gdb version 10.1 and
+https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=9a665d62266e75f0519f3a663784c458885b5c63:
+
+  CXXLD  libinproctrace.so
+/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: gdbsupport/tdesc-ipa.o: in function `print_xml_feature::visit(tdesc_type_builtin const*)':
+/home/buildroot/autobuild/instance-2/output-1/build/gdb-10.2/build/gdbserver/../../gdbserver/../gdbsupport/tdesc.cc:310: undefined reference to `libintl_gettext'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/faacc874fe9d32b74cb3d3dea988ef661cb0e3d0
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://sourceware.org/pipermail/gdb-patches/2021-November/183580.html]
+---
+ gdbserver/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gdbserver/Makefile.in b/gdbserver/Makefile.in
+index 71c3c4ad959..e69fbc4dae4 100644
+--- a/gdbserver/Makefile.in
++++ b/gdbserver/Makefile.in
+@@ -383,7 +383,7 @@ $(IPA_LIB): $(sort $(IPA_OBJS)) ${CDEPS}
+ 	$(ECHO_CXXLD) $(CC_LD) -shared -fPIC -Wl,--soname=$(IPA_LIB) \
+ 		-Wl,--no-undefined $(INTERNAL_CFLAGS) $(INTERNAL_LDFLAGS) \
+ 		 $(CXXFLAGS) \
+-		-o $(IPA_LIB) ${IPA_OBJS} $(LIBIBERTY_FOR_SHLIB) -ldl -pthread
++		-o $(IPA_LIB) ${IPA_OBJS} $(LIBIBERTY_FOR_SHLIB) -ldl -pthread $(INTL)
+ 
+ # Put the proper machine-specific files first, so M-. on a machine
+ # specific routine gets the one for the correct machine.
+-- 
+2.33.0
+
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 15515d6d33..4ff498230a 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -171,6 +171,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
 GDB_CONF_OPTS += --enable-gdbserver
+GDB_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)
 else
 GDB_CONF_OPTS += --disable-gdbserver
 endif
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
