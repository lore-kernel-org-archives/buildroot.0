Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C2AC77B61
	for <buildroot@archiver.kernel.org>; Tue, 25 Apr 2023 17:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92DD561121;
	Tue, 25 Apr 2023 17:17:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92DD561121
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CHjgj6fAgHCR; Tue, 25 Apr 2023 17:17:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 991A7614A5;
	Tue, 25 Apr 2023 17:17:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 991A7614A5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 709141BF82D
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 17:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B71B61121
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 17:15:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B71B61121
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gs4p9hnMLP7U for <buildroot@lists.busybox.net>;
 Tue, 25 Apr 2023 17:15:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 595C36145E
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 595C36145E
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 17:15:14 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-63b67a26069so7930360b3a.0
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 10:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682442913; x=1685034913;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qVnx8uhUMBtkiUNj44OVEuTghkrIamLKjdK+q1Ok+nI=;
 b=bW0VwJGG5L/iYh68qd1CAlS3O8RO5tezyxZICrcXm4sztinNBnZ4NC1nzJAlOmqdgO
 RjuppuiFIFH7x3woIIhhl/nnc3YltcO4l3NttK3Als1pwVl4QsR60uPDu72TebBD2jzd
 ZHj2qrce+A1gaG3TIBdIG3tiYT5JNhpBkX5sK3tLnNWoQBOqSgqBTK4eO7iXh1LRZJjW
 JMgwRgPiJQFzFAB9dBktNnwBg/DeuntUAObq0VGlzrvXIgrXWW672x9cObUsBzZFOjRb
 PatByP3cRbmJwKvkKKu7Zei3/RREFZLXnhLlqLcx2XNISBXoNFG9eZMX3lBw89FOD0T7
 agrw==
X-Gm-Message-State: AAQBX9cQWVFhZQGcWmmtFkDIJ7Bk/iIGNp+Jm9lGZIoK9oo8BPzeJ/u8
 XwegUpvtCOAH2dSey74jk4XtNfcwqTBtXg==
X-Google-Smtp-Source: AKy350YaFXfItQTQUeQd629cdfuiLbC+DOthdXfJ33uO33f3aBoCVG2aNz8j2CA2zGR1vQ5kz+iY0Q==
X-Received: by 2002:a05:6a00:1911:b0:63b:599b:a2e6 with SMTP id
 y17-20020a056a00191100b0063b599ba2e6mr25495927pfi.27.1682442913170; 
 Tue, 25 Apr 2023 10:15:13 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:603:2180:ebe0::51c9])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a056a00218b00b0063b8ada8777sm9582454pfi.112.2023.04.25.10.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 10:15:12 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Apr 2023 10:14:54 -0700
Message-Id: <20230425171454.48802-14-aduskett@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230425171454.48802-1-aduskett@gmail.com>
References: <20230425171454.48802-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682442913; x=1685034913;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qVnx8uhUMBtkiUNj44OVEuTghkrIamLKjdK+q1Ok+nI=;
 b=n/+JdNE8COVXBtbSEyMfIPDOqep/ki2a6slLqzJuzgKudnaBzkk51VRwifGVlaUudw
 v1BCQvPZovz/b8aemIJaHsi86Gv8btZ635zH+2eWrRyYhLHGlbjx9iuu8sbpohEcC8NW
 u+xoXLUfTOnlp0uVrD0rbq2MX6wyRu/5lYdjBzGTjWJxQNGW/JU7mqKPuiLURZMyBStq
 lcCvt5PxaubdaWbf67dUo7x7gAO2gfyk14uapFfQ9Pvb7H3csq1VaTBgedRHtz59vjwa
 jOY9EWv9EN9PuNMi0ErnZQJZnmKyWYQ7uVS1OsEjPT6J2eProM4IuRCiEeX6iKNMF5rT
 Ommw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=n/+JdNE8
Subject: [Buildroot] [PATCH v2 13/13] package/refpolicy: bump to version
 2.20221101
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add an upstream patch in package/refpolicy/2.20221101 that makes dbus optional
for the mount interface. The patch must go in the 2.20221101 directory or else
the build system will automatically attempt to apply the patch to a custom git
version of refpolicy if chosen.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - Added 2.20221101/0001-mount-dbus-interface-must-be-optional.patch

 ...ount-dbus-interface-must-be-optional.patch | 33 +++++++++++++++++++
 package/refpolicy/refpolicy.hash              |  2 +-
 package/refpolicy/refpolicy.mk                |  2 +-
 3 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 package/refpolicy/2.20221101/0001-mount-dbus-interface-must-be-optional.patch

diff --git a/package/refpolicy/2.20221101/0001-mount-dbus-interface-must-be-optional.patch b/package/refpolicy/2.20221101/0001-mount-dbus-interface-must-be-optional.patch
new file mode 100644
index 0000000000..dec0af828f
--- /dev/null
+++ b/package/refpolicy/2.20221101/0001-mount-dbus-interface-must-be-optional.patch
@@ -0,0 +1,33 @@
+From 6c6be65ccf0891391681d4662cc11f508c0f4aeb Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Mon, 24 Apr 2023 14:24:49 -0700
+Subject: [PATCH] mount: dbus interface must be optional
+
+If DBus isn't built, the build process fails due to mount.te always using a
+dbus interface even if the dbus module. Fix this by setting the dbus interface
+as optional.
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+Upstream-status: accepted. 207b09a656c2c3ac5c286d3f7eef085325e35408
+---
+ policy/modules/system/mount.te | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/policy/modules/system/mount.te b/policy/modules/system/mount.te
+index d028723..af84af0 100644
+--- a/policy/modules/system/mount.te
++++ b/policy/modules/system/mount.te
+@@ -145,7 +145,9 @@ selinux_getattr_fs(mount_t)
+ 
+ userdom_use_all_users_fds(mount_t)
+ 
+-dbus_dontaudit_write_system_bus_runtime_named_sockets(mount_t)
++optional_policy(`
++	dbus_dontaudit_write_system_bus_runtime_named_sockets(mount_t)
++')
+ 
+ ifdef(`distro_redhat',`
+ 	optional_policy(`
+-- 
+2.40.0
+
diff --git a/package/refpolicy/refpolicy.hash b/package/refpolicy/refpolicy.hash
index b08c22ed4e..a09e59c270 100644
--- a/package/refpolicy/refpolicy.hash
+++ b/package/refpolicy/refpolicy.hash
@@ -1,5 +1,5 @@
 # From https://github.com/SELinuxProject/refpolicy/releases
-sha256  965f98f0b68a24fd0b8e8d973d319332aea88973e1d6c455ef9c2a31aefaeaa6  refpolicy-2.20220106.tar.bz2
+sha256  44f88e62c8efcef54d019b9ca077520d5993de580926bd7575788cfa78515396  refpolicy-2.20221101.tar.bz2
 
 # Locally computed
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index f11b72755a..8fea7cc254 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -23,7 +23,7 @@ REFPOLICY_SITE = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL))
 REFPOLICY_SITE_METHOD = git
 BR_NO_CHECK_HASH_FOR += $(REFPOLICY_SOURCE)
 else
-REFPOLICY_VERSION = 2.20220106
+REFPOLICY_VERSION = 2.20221101
 REFPOLICY_SOURCE = refpolicy-$(REFPOLICY_VERSION).tar.bz2
 REFPOLICY_SITE = https://github.com/SELinuxProject/refpolicy/releases/download/RELEASE_$(subst .,_,$(REFPOLICY_VERSION))
 endif
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
