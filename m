Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D779D2A551
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 22:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D4B240964;
	Thu,  4 Dec 2025 22:39:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lG06Hc473b6d; Thu,  4 Dec 2025 22:39:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55A2D4094C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764887942;
	bh=iXSgR81K1bnyNgvI6Sx47vgZc+Tqu4nRKZYOE29VzvA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qV7KnCYaT1C17hxQcgAPB8qLG569Y570av6MQl4lJOyFrZYAx7Q3HgesNlAs/jjMn
	 DErCxbkxqsxlmbDY84f65pYhti27FHwVs0D/fAx101PZ0aSv6uBAMDwVTe3rqUJuE4
	 d/epDpkoPjEHWFFkjAtpxkHWaBX8MG4/+kUCTldPoBnpT1Ypa5EkdFjgiUzhr4+WbS
	 U8qZMifSADsa/dRXyIsutTHvSzps2GNCk5A05ofN9IxDVThAUJihbYDjMj6iN8nMQL
	 3OeWgirL0dreqK2G0NGcbMR4NFQwNyY355kMTR1zNgCTR3p533E2bGLaDjS1ACrk+X
	 oMAzThjrDv1Cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55A2D4094C;
	Thu,  4 Dec 2025 22:39:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E0BC3E7
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 22:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D23EB4094B
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 22:39:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iqeEQuE80QkN for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 22:39:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8061140949
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8061140949
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8061140949
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 22:38:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7461CA4C7866
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 23:38:56 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45984)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vRHyR-0000000034S-327m
 for buildroot@buildroot.org; Thu, 04 Dec 2025 22:38:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  4 Dec 2025 23:38:55 +0100
Message-ID: <20251204223855.3571710-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764887936;
 bh=9URAxHYIJO7AeT5i8qJ6+9qnEaiBJITKNS1gi0Kk3iw=;
 h=From:To:Subject:Date:From;
 b=RnS01sTYHe9s/5Ml6XoRQmhlynnc25IVnldVadAa4/5U2h/tByRNj0igkY7qYOW5+
 xubZyKebmgUnecL1taT+n4pEjaWvVVq/GzNCa1wxOr1SByHg+VGtbcblQrRx2SNptp
 ZpP0OmBfDy0utplHA2UbelMDgbiA0jTsW09ntzeYxP3n3wHwJUPEmecFaFyqlN4zN1
 6FeYgCazWAHL6nHIxmPG4K2GR1IvvQnJgdojo4WybiVwBu7PetHhjlQyzp8lSSvp6z
 ZJe0Jmf9A8Elhls0OjqOVINJKa9pGvW6e0I+Fy0RpQdIjIqCzVuPcwRR5WhEF0BXuO
 H+VB6phkY3Y+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=RnS01sTY
Subject: [Buildroot] [PATCH 1/1] package/vsftpd: fix build with newer gcc
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
https://autobuild.buildroot.net/results/661/661edeafc949390df397fd40a8035330238cbe8a/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...ted-non-prototype-warning-with-clang.patch | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 package/vsftpd/0004-Fix-Wdeprecated-non-prototype-warning-with-clang.patch

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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
