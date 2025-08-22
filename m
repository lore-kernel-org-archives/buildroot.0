Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11CBCA0EEB
	for <buildroot@archiver.kernel.org>; Fri, 22 Aug 2025 20:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EBEA60E20;
	Fri, 22 Aug 2025 20:16:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VC5sVzqXNapv; Fri, 22 Aug 2025 20:16:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C433A60DEE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C433A60DEE;
	Fri, 22 Aug 2025 20:16:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 748D042E
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 20:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65DDE83B88
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 20:16:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ccQSIfLgT3No for <buildroot@buildroot.org>;
 Fri, 22 Aug 2025 20:16:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBEF5811E7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBEF5811E7
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 20:16:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B8A7C8779B; Fri, 22 Aug 2025 20:16:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 22 Aug 2025 22:14:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 90be04d4d31c1f5dfec9cb5822fe016a4b4b9608
X-Git-Newrev: c53f5e78fcd0c6af9174c76d381a44aa48fb4f24
X-Patchwork-Hint: ignore
Message-Id: <20250822201626.B8A7C8779B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/proftpd: fix build w/ gcc-15
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3855737323487906231=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3855737323487906231==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c53f5e78fcd0c6af9174c76d381a44aa48fb4f24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The source code contains a number of variables named 'bool', which conflicts
with the C23 keyword.  This is fixed upstream in 1.3.9 with
https://github.com/proftpd/proftpd/commit/61be7eb14f200b97804a3cfa85fed51661067c62
but that unfortunately does not cleanly backport to 1.3.8, so instead use
-std=gnu18 when building with GCC >= 15 to fix the following issues:

table.c:1280:31: error: ‘bool’ cannot be used here
 1280 | int table_handling_signal(int bool) {
      |                               ^~~~
table.c:1280:31: note: ‘bool’ is a keyword with ‘-std=c23’ onwards

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/proftpd/proftpd.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 84a499a5c0..d450489cb0 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -27,6 +27,14 @@ PROFTPD_CONF_OPTS = \
 	--with-gnu-ld \
 	--without-openssl-cmdline
 
+# source code contains a number of variables named 'bool', which
+# conflicts with the C23 keyword. Fixed upstream in 1.3.9 with
+# https://github.com/proftpd/proftpd/commit/61be7eb14f200b97804a3cfa85fed51661067c62
+# so can be dropped when bumping to that
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_15),y)
+PROFTPD_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu18"
+endif
+
 ifeq ($(BR2_PACKAGE_LIBIDN2),y)
 PROFTPD_DEPENDENCIES += libidn2
 endif

--===============3855737323487906231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3855737323487906231==--
