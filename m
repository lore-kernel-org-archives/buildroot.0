Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 242C6D5AE41
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 14:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF06D60D71;
	Sat, 13 Dec 2025 14:07:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ttBPC73mGX2F; Sat, 13 Dec 2025 14:06:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7BAB60860
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765634819;
	bh=xVLBKAHWh4K3zVgyNymgZKgllkPlvpzBtVZQlHyGlE4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mK8cccNM5/2OnXMUEkn5iGpcyrQc15ZHZ1cGmj9LbImvHYLltJQM03f/y945uzQzb
	 KMk5wMCd4u6fukdFv6H/LlYUDxRfzKuXAIRqYtswDLcC1kRQ+h/x1vVnhbgYpZU5ax
	 /eEe695zmcWVsQUAJ3M4JEHpQ37YHixuOxjjTEnyXvvdsSbjxrpwjz6Ti1oPvrB2nA
	 40PE5EBNFMOTWV6L38pwTV6jyyXtiqPd5zWy6G2ZpUELskWePKmXwL5t3znmKcACvF
	 JxOHmPcmF7K3LDpAe9eN+efFgXP2VgAPqAEle45pol4kunvycr9/PlOW7eIfF9cx2z
	 7OL28q01qwo/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7BAB60860;
	Sat, 13 Dec 2025 14:06:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DACC13D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3D9640544
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:06:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T-ek4akn6U24 for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 14:06:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D5BF7402FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5BF7402FB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D5BF7402FB
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:06:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc21.dip0.t-ipconnect.de [79.214.204.33])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1CF2BA4C407D;
 Sat, 13 Dec 2025 15:05:29 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49778)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vUQFP-000000004dt-0DfE;
 Sat, 13 Dec 2025 14:05:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 15:05:19 +0100
Message-ID: <20251213140522.1322763-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251213140522.1322763-1-bernd@kuhls.net>
References: <20251213140522.1322763-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765634729;
 bh=FCOGiBQNAQXUf29htiD41Xs9PrscbXpLu26GNosC+1A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=uhm79nVRJO9y+udrsj00Foi7N7EAKG7VaVJiCrI6krLAD4/GA8M6RUHnjgjOk8Y8Y
 3A4iBcBiZNIjUFR+KclE6rhwv1jObFf4JrzPfn/5xWYz+85Qh8NsOYcT4wWVx2L5Zj
 Pi3IBCRXqUSYiEogjxbKVyRHCoE2WPnJY6yUqAcZ4iY0flusz29d0f74bgpv2RU4v0
 T/34GkJnVJuUpNzy3NNXKonpyrYMp1M8gth9eqVmQKNzpbIbG2f91qSfjq43Y5nlh8
 XWaGQOs6cKVTUHdnPJHSYoHuUmyPrmDB4jgkLWxC7rkE43DQlPkRPPb3H30f540JI6
 vk6yjrsbc23rA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=uhm79nVR
Subject: [Buildroot] [PATCH 11/14] package/python-more-itertools: bump
 version to 10.8.0
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/more-itertools/more-itertools/blob/v10.8.0/docs/versions.rst

Renamed tarball according to scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-more-itertools/python-more-itertools.hash | 4 ++--
 package/python-more-itertools/python-more-itertools.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-more-itertools/python-more-itertools.hash b/package/python-more-itertools/python-more-itertools.hash
index a9b5d00f6b..113c243e8b 100644
--- a/package/python-more-itertools/python-more-itertools.hash
+++ b/package/python-more-itertools/python-more-itertools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/more-itertools/json
-md5  48da05632079828fd2e89e238192bb69  more-itertools-10.6.0.tar.gz
-sha256  2cd7fad1009c31cc9fb6a035108509e6547547a7a738374f10bd49a09eb3ee3b  more-itertools-10.6.0.tar.gz
+md5  05fc46d7baf167d89c82a383c9f0c2fa  more_itertools-10.8.0.tar.gz
+sha256  f638ddf8a1a0d134181275fb5d58b086ead7c6a72429ad725c67503f13ba30bd  more_itertools-10.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  09f1c8c9e941af3e584d59641ea9b87d83c0cb0fd007eb5ef391a7e2643c1a46  LICENSE
diff --git a/package/python-more-itertools/python-more-itertools.mk b/package/python-more-itertools/python-more-itertools.mk
index 8c520c790a..befbb80402 100644
--- a/package/python-more-itertools/python-more-itertools.mk
+++ b/package/python-more-itertools/python-more-itertools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MORE_ITERTOOLS_VERSION = 10.6.0
-PYTHON_MORE_ITERTOOLS_SOURCE = more-itertools-$(PYTHON_MORE_ITERTOOLS_VERSION).tar.gz
-PYTHON_MORE_ITERTOOLS_SITE = https://files.pythonhosted.org/packages/88/3b/7fa1fe835e2e93fd6d7b52b2f95ae810cf5ba133e1845f726f5a992d62c2
+PYTHON_MORE_ITERTOOLS_VERSION = 10.8.0
+PYTHON_MORE_ITERTOOLS_SOURCE = more_itertools-$(PYTHON_MORE_ITERTOOLS_VERSION).tar.gz
+PYTHON_MORE_ITERTOOLS_SITE = https://files.pythonhosted.org/packages/ea/5d/38b681d3fce7a266dd9ab73c66959406d565b3e85f21d5e66e1181d93721
 PYTHON_MORE_ITERTOOLS_SETUP_TYPE = flit
 PYTHON_MORE_ITERTOOLS_LICENSE = MIT
 PYTHON_MORE_ITERTOOLS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
