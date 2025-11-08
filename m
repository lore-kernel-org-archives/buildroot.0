Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6605CCFA13
	for <buildroot@archiver.kernel.org>; Sat,  8 Nov 2025 10:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DC2880AD6;
	Sat,  8 Nov 2025 10:33:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JNP5pweDPcnP; Sat,  8 Nov 2025 10:33:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CB5D80A93
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CB5D80A93;
	Sat,  8 Nov 2025 10:33:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 230A41CD
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 10:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14F2760773
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 10:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NNPIV0SaxTLS for <buildroot@buildroot.org>;
 Sat,  8 Nov 2025 10:33:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A2B760771
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A2B760771
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 10:33:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2790283F79; Sat,  8 Nov 2025 10:33:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 8 Nov 2025 11:32:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 582ee9c2fdcc864a86e8726c0594b27791e52b6a
X-Git-Newrev: c03296348660a3fef2a5f431ef6caaebe38fbfba
X-Patchwork-Hint: ignore
Message-Id: <20251108103322.2790283F79@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/janet: don't use
 posix_spawn_file_actions_addchdir
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c03296348660a3fef2a5f431ef6caaebe38fbfba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fix build, see https://autobuild.buildroot.org/results/c3378c138980b77ad5202223e7e1dbd8443bcf93/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/janet/janet.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/janet/janet.mk b/package/janet/janet.mk
index e076f7c461..cf4113fb17 100644
--- a/package/janet/janet.mk
+++ b/package/janet/janet.mk
@@ -11,6 +11,9 @@ JANET_LICENSE_FILES = LICENSE
 
 JANET_INSTALL_STAGING = YES
 
+# don't use posix_spawn_file_actions_addchdir[_np] (in src/core/os.c since 1.39.0)
+JANET_CFLAGS = "-DJANET_SPAWN_NO_CHDIR $(TARGET_CFLAGS)"
+
 ifeq ($(BR2_STATIC_LIBS),y)
 JANET_CONF_OPTS += -Ddynamic_modules=false
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
