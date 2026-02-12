Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49539EF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AEFD847F5;
	Fri, 13 Feb 2026 19:38:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 761p6lVQT8H7; Fri, 13 Feb 2026 19:38:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C4B484812
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011521;
	bh=0LQjHPVoRFfTpmX4K27uhR0u52t7rvcCbMOaT4ytaNA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NNC6RrYGvPtB87cqSaMivWCunP41Dn3kTRYn/WGg86tazJ6TpqxLZT66x2kkNLf7V
	 mjNYPGr6coLYsUJv/Y6tC5V+sonHPcz9MO+fmiuZ70abNIJ0fEIXoahjsDWGGHaaEX
	 MRJJp0HeecP+tbB26H8VXaM0Kb3y4PHwzsJw+HgtXpGxoiLxtrBUAqVuNWnf+45rR/
	 PnkJCD8UCn3w7h13ouTd19aInldc3rkIQAiXo1/cp8pvz5+j/wfnikT+cQg82Uv/B/
	 zRKRmXMxcOg3h6n4pkfbfwuXSOnYLu78dBuIr1ydRLVT8OPFlMcmoCK7Eew24tXGfx
	 lTLUqfkQ7ty0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C4B484812;
	Fri, 13 Feb 2026 19:38:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7524BEC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27EBA4132D
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j7CUrVW47FXr for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F0C94129A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F0C94129A
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 643D584169; Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:19:03 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 18223bc071eec1f87cc267fff37950a075376a67
X-Git-Newrev: 1bbf192cfbe819b424ae3493be382455a3647586
X-Patchwork-Hint: ignore
Message-Id: <20260213193701.643D584169@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/vsftpd: fix build
 with gcc >= 15.x when openssl is enabled
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1bbf192cfbe819b424ae3493be382455a3647586
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Fixes:

  https://autobuild.buildroot.net/results/661edeafc949390df397fd40a8035330238cbe8a/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1063c73edccd3c027d8e76d5e97941624e137873)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
