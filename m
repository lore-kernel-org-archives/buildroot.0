Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B35EEB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 14:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEC07415CA;
	Sun, 25 Jun 2023 14:44:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEC07415CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JXKE558c8ZyQ; Sun, 25 Jun 2023 14:44:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76BEE415C9;
	Sun, 25 Jun 2023 14:44:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76BEE415C9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A68191BF3BD
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 14:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8027D60BD3
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 14:44:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8027D60BD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AqZEMdqGf9WO for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 14:44:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61D6A60B73
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 61D6A60B73
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 14:44:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D1DC2A4C0780;
 Sun, 25 Jun 2023 16:44:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35240)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qDQyP-0004Zs-0c;
 Sun, 25 Jun 2023 16:44:17 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 25 Jun 2023 16:44:16 +0200
Message-Id: <20230625144417.293506-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687704257;
 bh=IKHRQfGf+TPVYgy9iuwdh956LVv0GkMbWZXTDdtln0Y=;
 h=From:To:Cc:Subject:Date:From;
 b=wh/fxJkjyl7FqSVVPqA+ZX/8lELSvgAwIwcdkARJZ6gtCPODOklZooRsnU1AhzfVl
 lU7bcWQ+bC6ZXFFd8D1itT08ZF3pivGov2Vz/LmS+7HjXoVozcWzO+s1nBgGueJWFU
 jKvgid4mMXwcI2v6XYS7VtsS4BDmQjvNNc5i438HFw89BkI2fqZQy5thZozRX9ik1S
 pv2ubGmgEDZr7dSt6w4WxgFJqAxKjpzjvTOIq943Zmuk2amoScf39aibzmdOkynGAi
 v2C0ovokcORfj/mqSPaD38y7+pWDCONSIGmhU+OxlRYAnJNy+VbmivBN5rLSk5SUmo
 +pFhNN41eoCjQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=wh/fxJkj
Subject: [Buildroot] [PATCH 1/2] package/audit: fix musl build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/a52/a52ff08c3373ffb253b89e9197671583354d1360/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...ute_malloc__-with-__attribute__-__ma.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch

diff --git a/package/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch b/package/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch
new file mode 100644
index 0000000000..1a276ca2df
--- /dev/null
+++ b/package/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch
@@ -0,0 +1,39 @@
+From 79c8d6a2755c9dfa00a5e86378e89a94eef0504d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 9 Aug 2022 23:57:03 -0700
+Subject: [PATCH] Replace __attribute_malloc__ with 
+ __attribute__((__malloc__))
+
+__attribute_malloc__ is not available on musl
+
+Fixes
+| ../../git/auparse/auparse.h:54:2: error: expected function body after function declarator
+|         __attribute_malloc__ __attr_dealloc (auparse_destroy, 1);
+|         ^
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream: https://github.com/linux-audit/audit-userspace/pull/311
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+
+ auparse/auparse.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/auparse/auparse.h b/auparse/auparse.h
+index 95cf256d..c7dbe5ff 100644
+--- a/auparse/auparse.h
++++ b/auparse/auparse.h
+@@ -51,7 +51,7 @@ typedef void (*auparse_callback_ptr)(auparse_state_t *au,
+ void auparse_destroy(auparse_state_t *au);
+ void auparse_destroy_ext(auparse_state_t *au, auparse_destroy_what_t what);
+ auparse_state_t *auparse_init(ausource_t source, const void *b)
+-	__attribute_malloc__ __attr_dealloc (auparse_destroy, 1);
++	__attribute__((__malloc__)) __attr_dealloc (auparse_destroy, 1);
+ int auparse_new_buffer(auparse_state_t *au, const char *data, size_t data_len)
+ 	__attr_access ((__read_only__, 2, 3));
+ int auparse_feed(auparse_state_t *au, const char *data, size_t data_len)
+-- 
+2.37.1
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
