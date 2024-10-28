Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9C6D3E2BB
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 19:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93FCA400F3;
	Mon, 28 Oct 2024 19:26:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rylku-kiuxlL; Mon, 28 Oct 2024 19:26:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0454040873
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0454040873;
	Mon, 28 Oct 2024 19:26:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 16823AEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 19:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB39A40821
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 19:26:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aNENmQt3fvth for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 19:26:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7621F40830
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7621F40830
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7621F40830
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 19:26:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02c6.dip0.t-ipconnect.de [91.58.2.198])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 91BD0A4C0AF6
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:26:09 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44626)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t5VNQ-0000000030d-3avd
 for buildroot@buildroot.org; Mon, 28 Oct 2024 19:26:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 28 Oct 2024 20:26:09 +0100
Message-Id: <20241028192609.459318-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1730143569;
 bh=KukMgMTixMnFNJdpYFrjrXxXyHznIO0K8RQnXVrhgdo=;
 h=From:To:Subject:Date:From;
 b=us/xDZkFOPKDmxaeRkLbv82Cf9dUoJEWRpbUAai33w4sn7tAsphpB69sdTKj3hH1V
 333+fyhTPMvHmwD36pXCa0VpYjYGytR89N8lV1K8m3d2VHjSfnVfMQR+cOgH+BM65Q
 KXvU0vmJwiIAJPzo98mljvJwQgwy3bkh0T26F4xuZwbn/uUNapmgcK5o5Nhxcs4cvj
 v22nNn950uxjVPaXrJ6LqstJjeQvi5bd24/C2Pr2WSTW6YAd9DYc88tNqW5W/XZBcl
 YJftLWAdfSigQNay/B0SDqnZY4p6qf+/Pe9mMwom9TnEjlABtYaLIDSBaOeC9aninI
 QIpVp/Vnzu95w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=us/xDZkF
Subject: [Buildroot] [PATCH 1/1] package/apache: fix build
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

When cross-compiling apache wrongly detects that gettid is usable via
syscall() due to AC_TRY_RUN being used in configure.in:
https://github.com/apache/httpd/blob/2.4.62/configure.in#L533

Add ac_cv_func_gettid=no to fix the problem.

Fixes:
http://autobuild.buildroot.net/results/2f6/2f6b7bbb4c97e4c91b3abd6bb205e237e57045fa/
and many more.

The bug was introduced by bumping apache to 2.4.59 with buildroot commit
e0bbfaea0e983c1ce42a9c3085f3ca3dd796852f which includes
https://github.com/apache/httpd/commit/008e6afcfdae36bce1b5f3fc0cb9519375fd99cf

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/apache/apache.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 0a0a0b3de4..d081bbce89 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -21,6 +21,7 @@ APACHE_DEPENDENCIES = host-pkgconf apr apr-util pcre2
 
 APACHE_CONF_ENV= \
 	ap_cv_void_ptr_lt_long=no \
+	ac_cv_func_gettid=no \
 	PCRE_CONFIG=$(STAGING_DIR)/usr/bin/pcre2-config
 
 ifeq ($(BR2_PACKAGE_APACHE_MPM_EVENT),y)
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
