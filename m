Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422B4C433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 11:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D56C483F17;
	Thu, 13 Jan 2022 11:57:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pfs8qxV_WMdu; Thu, 13 Jan 2022 11:57:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31DFE83E5F;
	Thu, 13 Jan 2022 11:57:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CA38F1BF350
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 11:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4DFD6FC25
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 11:57:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S8nvmTd4EPnV for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 11:57:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 89DA16064D
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 11:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ajFrxUCRMGc5EtDghuz002DD6da60A1rtYVwwcV5wj4=; b=bA+LlArxLLbLvhrxw8RIgDTiGP
 br8Seiqok9VzXMMgtfHUNGkqiMC7fRteA8JEd7KAxTDss2CKWEf/qMxG5oxulFwOq0kZhlS8qG0aq
 QeHqwe180UXxRajCJWO4uVrDZ7n1BZwuTRa1TBfvIWfn2HRG1UT2o4qxTKmbMo6kovxFbxesF3DUN
 8+AgaBLJg0Ft6dNPsfgWaKAKRkt/ck/EGw40dtyg+4nU2z6ad4pcml3weJ9ITN6EG42G6NykW08IU
 0X2GSxCdZyZ2ojYKEAjq06e53nj2izBhXIvhJKziVH2of8Rylp81umHb+RkeT8llw9RMDBVYuJpbT
 gQqmtCMA==;
Received: from 91-153-34-128.elisa-laajakaista.fi ([91.153.34.128] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1n7yjE-0005DU-K8; Thu, 13 Jan 2022 12:57:16 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 15b8170f;
 Thu, 13 Jan 2022 11:57:05 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Thu, 13 Jan 2022 13:57:04 +0200
Message-Id: <20220113115704.2354150-1-aperez@igalia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/meson: add upstream patch to fix
 vapigen support
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Import an upstream patch which fixes a typo in the Meson source code
which caused a wrong command line option to be passed to the vapigen
program. This fixes the build for all packages which use Meson and
provide API bindings generated using said tool.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 ...x-typo-in-vapigen-option-metadatadir.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/meson/0003-gnome-fix-typo-in-vapigen-option-metadatadir.patch

diff --git a/package/meson/0003-gnome-fix-typo-in-vapigen-option-metadatadir.patch b/package/meson/0003-gnome-fix-typo-in-vapigen-option-metadatadir.patch
new file mode 100644
index 0000000000..f8cc30ec29
--- /dev/null
+++ b/package/meson/0003-gnome-fix-typo-in-vapigen-option-metadatadir.patch
@@ -0,0 +1,31 @@
+From 5385e4c0a4dd4f9cf1e15c9c321b22d19cc0011a Mon Sep 17 00:00:00 2001
+From: Michal Vasilek <michal.vasilek@nic.cz>
+Date: Mon, 10 Jan 2022 21:27:30 +0100
+Subject: [PATCH] gnome: fix typo in vapigen option metadatadir
+
+This typo was introduced in 9ef36fa80bf4483bcd837ea3985a51ab533c7972 and
+can cause a build failure, because --metadatdir is not a valid vapigen
+option.
+
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+Upstream-Status: https://github.com/mesonbuild/meson/pull/9806
+---
+ mesonbuild/modules/gnome.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
+index 1125e56e7..dfc66c2e3 100644
+--- a/mesonbuild/modules/gnome.py
++++ b/mesonbuild/modules/gnome.py
+@@ -1934,7 +1934,7 @@ class GnomeModule(ExtensionModule):
+         cmd: T.List[T.Union[str, 'ExternalProgram']]
+         cmd = [state.find_program('vapigen'), '--quiet', f'--library={library}', f'--directory={build_dir}']
+         cmd.extend([f'--vapidir={d}' for d in kwargs['vapi_dirs']])
+-        cmd.extend([f'--metadatdir={d}' for d in kwargs['metadata_dirs']])
++        cmd.extend([f'--metadatadir={d}' for d in kwargs['metadata_dirs']])
+         cmd.extend([f'--girdir={d}' for d in kwargs['gir_dirs']])
+         cmd += pkg_cmd
+         cmd += ['--metadatadir=' + source_dir]
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
