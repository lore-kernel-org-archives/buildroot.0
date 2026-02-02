Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A49E7DEEF
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 14:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B301606BD;
	Mon,  2 Feb 2026 14:20:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZOmg6-MFxnvL; Mon,  2 Feb 2026 14:20:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66C56606FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770042033;
	bh=I3JN8aK0Sv7nZccKxkQVuBjm/xe1Qnjbl702QfqN7RA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QTL2nC+khuPf8+s1W07+vAkBMKhdkchk1rCw7VXRzGt490/cXy0iBIUgNdrWeobGl
	 vM3op6uLpTCoQTjuLY1jede2U01PPMqEwRN0N2pgRAwh6rvL52wROyKU3KIkh5kl4r
	 YwcsMxZfs3VAKdYXLgPmXHMwD31eeDDjiKdhbNQi2Y7Y76WWtdrBgJGVCNW79jW/yd
	 t9U5AHJOf8/h08T+QsqkmPSgMi+pXvuYmVNswDlPl+ifofSo+JUfDd2ayYrisEBUJn
	 5iyvM1E/CyYoNMuGneAm271uRklmwTbKAgsV8EDJbIzKYGa/5ycf2jtc9jQUJAzgu5
	 RXbMN4oiMQ3pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66C56606FA;
	Mon,  2 Feb 2026 14:20:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2346734E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0556E40A48
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:20:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nWklqqLcaCy8 for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 14:20:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EE3D40A47
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EE3D40A47
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:20:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3663086353; Mon,  2 Feb 2026 14:20:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 15:18:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eed531873019f695437f1252c16a8e5b5393835f
X-Git-Newrev: 1063c73edccd3c027d8e76d5e97941624e137873
X-Patchwork-Hint: ignore
Message-Id: <20260202142030.3663086353@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vsftpd: fix build with gcc >= 15.x
 when openssl is enabled
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1063c73edccd3c027d8e76d5e97941624e137873
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  https://autobuild.buildroot.net/results/661edeafc949390df397fd40a8035330238cbe8a/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...precated-non-prototype-warning-with-clang.patch | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/package/vsftpd/0004-Fix-Wdeprecated-non-prototype-warning-with-clang.patch b/package/vsftpd/0004-Fix-Wdeprecated-non-prototype-warning-with-clang.patch
new file mode 100644
index 0000000000..ec305bf6bc
--- /dev/null
+++ b/package/vsftpd/0004-Fix-Wdeprecated-non-prototype-warning-with-clang.patch
@@ -0,0 +1,25 @@
+From 2bdb7ddbfcf6481ed7662d3d4eb5a3dc83d50224 Mon Sep 17 00:00:00 2001
+From: Tom Stellard <tstellar@redhat.com>
+Date: Fri, 28 Oct 2022 05:35:11 +0000
+Subject: [PATCH] Fix -Wdeprecated-non-prototype warning with clang
+
+Upstream: https://github.com/InfrastructureServices/vsftpd/pull/6
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ ssl.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ssl.c b/ssl.c
+index d401203..8826b05 100644
+--- a/ssl.c
++++ b/ssl.c
+@@ -36,7 +36,7 @@
+ static char* get_ssl_error();
+ static SSL* get_ssl(struct vsf_session* p_sess, int fd);
+ static int ssl_session_init(struct vsf_session* p_sess);
+-static void setup_bio_callbacks();
++static void setup_bio_callbacks(SSL *p_ssl);
+ static long bio_callback(
+   BIO* p_bio, int oper, const char* p_arg, int argi, long argl, long retval);
+ static int ssl_verify_callback(int verify_ok, X509_STORE_CTX* p_ctx);
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
