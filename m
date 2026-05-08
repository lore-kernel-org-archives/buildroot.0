Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF12CD3445
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 18:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D18B847E0;
	Fri,  8 May 2026 18:43:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kBn2xOkuXfcC; Fri,  8 May 2026 18:43:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98C3E847D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778265828;
	bh=xJnNWz2xPzE4avR0MGJsVB1Ghx5EpHX6vHA+HJAMpwQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Mm9TF/KWjxhKFPdQOhhwvf+t3GCuLodh3c3nrKeK2zcZ0sxEGSjLIQxVW5PWsZkHH
	 QZMrwcMN01KhvTW9h8hOdyndgE9dROGJ15s5JPixdoXo6fXm22OeqWUQp0WhuucckN
	 5paOlhWy9YEYKVJQUCYDk3C+zXjEWFepqdw/gCUqRk8zcNSP0o07KYlaaj+qa5Xg9q
	 hc47WtjUB9GxjbCnciuLrNr5/J8UzpEm970ZZ5SlKEDUOeDBBAOLOeMbMEghnQnJKC
	 aLZg+ue4T12huBBCoH0tP5qaBDBEWcXVFxK5U3rCNmDOHRmVwN4piZn7IALfMKWHvD
	 kd4UCh8yEViFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98C3E847D4;
	Fri,  8 May 2026 18:43:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BACD272
 for <buildroot@buildroot.org>; Fri,  8 May 2026 18:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D09841063
 for <buildroot@buildroot.org>; Fri,  8 May 2026 18:43:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V9dy44H6TG5c for <buildroot@buildroot.org>;
 Fri,  8 May 2026 18:43:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 05CAA4105C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05CAA4105C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 05CAA4105C
 for <buildroot@buildroot.org>; Fri,  8 May 2026 18:43:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a05da.dip0.t-ipconnect.de [91.58.5.218])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D5E36A4C1EE0
 for <buildroot@buildroot.org>; Fri,  8 May 2026 20:43:29 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56888)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wLQAb-000000003Wm-2zXv
 for buildroot@buildroot.org; Fri, 08 May 2026 18:43:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  8 May 2026 20:43:27 +0200
Message-ID: <20260508184329.3669575-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778265809;
 bh=ePz3/LKV7ZHxbDYwvWHGjA39ERpT9G0rZSlMU9i4tZc=;
 h=From:To:Subject:Date:From;
 b=qzuUULv2wnpjL5fHVL7ZAp90f/so5R+F84ymkMumG3Q6m2M12i24+MEfnT3oTDAqB
 0ZoHHVtEqgfMsVxYTGcn3DnYCJjF3Tg+0+CaznH88676TtXLL643I59jBoHaPX22Ql
 HXMw6N65/sjnBHS6NtFfCMp34it7Yt69VddCnsuQN2XN4Rwy5RY6eoKM+vG+zKBJlC
 x8IOjFrJokXBcQYwR5N6FsOXT7Rky/Je9GAphKAwP7I/ID4KSiYYRsDONE0sUoqIDy
 78/y7gHLbUwfRJzLVdW5XtB9OHvypk57lGBsP81FsjvMb4/L2h5Ox7HDTXz1flPkus
 QNXSm/Mn8ETnA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=qzuUULv2
Subject: [Buildroot] [PATCH 1/3] package/libks: select
 BR2_PACKAGE_LIBOPENSSL_ENGINES
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

libks makes use of ERR_* functions defined in openssl/err.h which are
included by openssl/engine.h resulting in a build failure when
!BR2_PACKAGE_LIBOPENSSL_ENGINES since commit
623d3bbe43e9193aa8e3395367d01af59071b859:

/home/buildroot/instance-0/output-1/build/libks-2.0.5/src/ks_ssl.c:111:17:
 error: implicit declaration of function 'ERR_free_strings'; did you mean
 'ERR_load_EC_strings'? [-Wimplicit-function-declaration]
  111 |                 ERR_free_strings();

Fixes:
https://autobuild.buildroot.net/results/aac/aac25e5c584ede962cac95c353afd64bf720199c/

The oldest build error on the master branch dates back to Feb 2025:
https://autobuild.buildroot.net/results/83a/83a207bee796afbc619b62c5ecf89c662484170f/
so a backport to LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libks/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libks/Config.in b/package/libks/Config.in
index 4781d188bf..17a008d7a0 100644
--- a/package/libks/Config.in
+++ b/package/libks/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LIBKS
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_setname_np()
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
