Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8114CC6B08
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 09:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4F3960776;
	Tue, 13 Oct 2026 09:43:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id chkWUt9a_6Ks; Tue, 13 Oct 2026 09:43:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 563B6607A9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791884597;
	b=afFjqux8nJd5tqAZjRjT3gdx14H/Cf2jYGbd1u0O9V7SIHUIJ1mI0YWY8orIv60yTE8U
	 ln5IfcZsg0xElK+V+YvS/+yMxHBpDZN+pG9Ji53Oojg2sMSvjKtEH1Q7ho0nhcIFHg5hh
	 YdYm3WzCzBys5hQvvRfxnfek4ncIB94O/cWF40ei5Zk3O8CYgZ59N6go8IvXFJYSyb9D4
	 rwb4FTPvi8ihRxXEfuNZu7UDIqtoEwqwl9Oh/9C8F98bU8kLVK8gfu9zRRK/l6SvS9Yrt
	 Hhy4sFCJsR1D7iH9tRGLQUiaQP2kAmD7VayDfNFe15ubE2pRB97i6//3t4TaNADfjmQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791884597;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=sDqn4dydbZI4La9uI5Nl9HFzX7qmBxwfXj9VjcsIKCU=;
	b=U1jAfTUqzR33QZl3k8qqTR2P3SIm48TsdzcgW4TV9zvUZGr3L29hWY84RoJnfzCB5Mm4
	 xJfUcagNiWvDCZPub6saizPAe86w9n5Vm8tr2L16uANM2T6P1UTk2TUiAVl0oekrEltm/
	 AVPW4zW+sYB3jqCXPmlggz5C2EEsxpbH3BEJQSHAC2YEVxdf81D4fiR+pcjLfXdF9cHxI
	 3/HKje+DpaP1Dr04VURIp/FdBCaTIAh5GgySwEZZDqMMHg6Ja41Z0c4c5yODkJjv/LpEy
	 DHjP9UNT+QLx3va1GN36eYdaMaSEaujj37HnRrGLFxdJVYlHsR9qZOfDZLexqdKhlpw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791884597;
	bh=sDqn4dydbZI4La9uI5Nl9HFzX7qmBxwfXj9VjcsIKCU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OvmNb8ktDcbjw2Bwp4sVcghYCsptxMFoh0URrcumlMsERhJoLY/Ev6VYjVVYsKnRW
	 aNSjOBJc/jeixLbNVnEkP32EUt7QEWd0rKFsYfIpDpp0yLa69cHBB3xqz3v/7oXrPq
	 OjwbuCW39GbZqcfRSqDbB8lbc3433rlyfhoobJgpPVijHuNXbHfxYcCDQBuU3rNxnK
	 dvcrzw8h5Vi1Af3EIDqnpmUSpLPxuud0q06FXeBDDg5piWgloQTANPK2UO2xcMHmr7
	 qHEcfAElvugJ5FMGpTv/e9UlcUtZm3M5IDdjovXO1IVPiDDSJEBWYr6opM53bLLT4j
	 KdFOeyJanvIxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 563B6607A9;
	Tue, 13 Oct 2026 09:43:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BBE8129B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E9EF80C8A
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 28Q9zmYDtxGR for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 09:43:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 530C480BB8
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791884584;
 b=iTTxFyilprumde3yXxw5u+T2DTZHy9MxD136ndO7CcBVh7h/DUsmzZaCBl72lq4OJsJF
 PjlcSZZPTdZbpe67jkmADKIIvt0qsLQ/4169qW+IWEosvtEVQMqcec4WQIdUrdgMt3ViH
 ZrF9oYk56A3b7BhdE+XznA1D4g0B5e8TRXEe2TWOm1ewfWtf+6WJmZ8IyByEI6QVerUtw
 YdoKLvHFxt9Ej/QqyUiIqJo9Gjjr6Vi6nBlsBiZif9T+NJyvr+SeVe+qn2dSkZjigupO0
 BZxMh8IaCBSeKrX3UjsIgcVkg/Eq264hwVpQxRnEJjTx2IZrsz29i+6XRmE6HtFQyZQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791884584;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=bLU77swBM3odarSJ1iQuVhf0PAojltc/9WYPU59Tm2E=;
 b=RyivgRJ4R6WKOfV8pfl5fS9SO/6P7KrWwXzzo61W8nayOXmrocXFv00ohDFUJNYF77l1
 l8PzmIPpVUfRM/sOKJPhlcynjK8c/yci/JhofLBgUAn867gUJraitY2f6+oQoVUEV8u/g
 EB/XoFAYBi35U9UiRSgDzzhBM64osLoIfHTzb0YXGZ2F5Wm4i/z6u14+ijsCzcIYmex0V
 2iLTXIheXoaY1bcM1ZNKJDB1lIoweRsJQJt0CCbRnVBArj98fJIBM7q+OZmzG5kig3t69
 NGVHoadphQXork6pnx2xJhio+jC5JChgPraK34nH4PGHW9QKB8llHDzuzoeoKhqawvA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=GoRxQfW5; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=GoRxQfW5
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 530C480BB8
 for <buildroot@busybox.net>; Tue, 13 Oct 2026 09:43:03 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a19cba5c14so20629545e9.3
 for <buildroot@busybox.net>; Tue, 13 Oct 2026 02:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791884581; x=1792489381; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bLU77swBM3odarSJ1iQuVhf0PAojltc/9WYPU59Tm2E=;
 b=GoRxQfW5vXRhvbIXQB45do4v6y7hmaU0IjFk1Sot1HivFISxTD7x0CwQFGNc3+SCah
 qmI/icSpTTnwgQI5NfR1nho4ufXlYP/78/IQQRoOXN1iNKjDX5rutA0ooiVBz1STFxU6
 se4wc+odVYBZaRJX2bzzqiGOtczgJhzD3blC94SIi+Ij9F/Aqxr/JZTjUETaaLnAhdI2
 pxqpoinzdjm03ROIdDxaCllQSmUdENxIUFFw2Uev8iUdNu9VVt8/+hk68GB4S1uXOifE
 cROGVucqmfWJ8hj7+iTFSGx6Bp3mnfnjUuEYoe+jPU8SVFGdcs4dQyqE9GuqxQC17N8l
 MhBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791884581; x=1792489381;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=bLU77swBM3odarSJ1iQuVhf0PAojltc/9WYPU59Tm2E=;
 b=VyS3YvBBy+Cj6WCD0keg9U+i5YTUuNaR+mG85UdmkN7Su4E0uf1tgedt2mdb18XqOd
 wpE4QAaZCCOjwhTewiSw+edHJ63QDWMkxhaae2VC8xp1ELoqrW7+nQdMHaDOq8r9bQUZ
 EmKkcd0BIQ4pik+GOyzR1PLMqtMbrkar8Yd22pG5u/kkko1E1vFEY/UgVSKvVpRCk+7R
 cUiiIFZV47umS5FQ+Bd6D/AQJzb3Vyj2QQZIHxzhHsZFSuwN9baVqdIshIGqZP8k53QX
 xcGJcW7tYuKKOUguLoRcsQWpiS+V8+pXSwelgFEDn+r/CVAXY0RBWyi5qYpF1XO09n8v
 SOcQ==
X-Gm-Message-State: AFq9FYJpTMdutp/TBye6nHDSLKEfZyfpJj9M5MoqlDNzWJR3IMAgAfwg
 H+pCLjLCd5AnRgOjLOG+Fo6gnl9DUfkK594Rh61E6hiTcyfKVGrA7zm1gxy3Mw==
X-Gm-Gg: AYBFou1EJHCxZSGOCiZd/4IcJCE2YJxRSaW6qUmX5QuVQKneCIFSQM2t3CRxy/98rVM
 p+LlxZXDJhyGo2qjK+KbF72PznlE1ZNvdigHXYuDHs6bksUsbZ9G1TDS8ekPqeQi0R4sJO/KHtt
 Ent8lNzE/dab5Yksgyre+8oqdmBXp1WpdCDNQL2vqH0Rw3bdr8O/GWSy2mzGOk5/URxJHNsj/Iv
 r7e+YtGBHjYoG9GnzWZlQROIYkYOfTVFS4B5qyLKcXAhqDaakBcqBcJFiv4x5P8imr7+sji16uK
 PdBylSV20OPax02CQ3dG0xgJBMbdL2AFdihc9zgM22W/SOOGpGeoE0MMUy3Wg3yWNFnV78VrOh2
 Pb17C3Nw5/mxA0mA9XeDcdgzmtum5Gytj/+Mw2L9QSeVebVBQRByYiiTkIbv0e7stK0WejLkmbS
 GfGU0VOsVdZXOcjhhtgGEmxv4BYV4Oh0vLBBrj7OM+qX03CEl14FddF1rZt+rTiW85jXIPUpjXC
 iea4YR6npSKXgfolnKWQrTj1nKgfxjRoGrqfo0Q
X-Received: by 2002:a05:600c:1c21:b0:49c:cee0:f383 with SMTP id
 5b1f17b1804b1-4a18e4b6241mr282246315e9.16.1791884581348; 
 Tue, 13 Oct 2026 02:43:01 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1972eaed8sm238665595e9.1.2026.10.13.02.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 02:43:01 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Tue, 13 Oct 2026 11:42:45 +0200
Message-ID: <20261013094252.96761-7-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013094252.96761-1-francois.perrad.86@gmail.com>
References: <20261013094252.96761-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 07/14] package/perl-lwp-protocol-https: bump to
 version 6.17
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

diff LICENSE:
see https://metacpan.org/release/OALDERS/LWP-Protocol-https-6.17/diff/OALDERS/LWP-Protocol-https-6.14#LICENSE

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 .../perl-lwp-protocol-https/perl-lwp-protocol-https.hash    | 6 +++---
 package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk  | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash
index 658eb6234..7bcbe32fb 100644
--- a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash
+++ b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  65401e3e34be653c9e3b31f798ed5454  LWP-Protocol-https-6.14.tar.gz
-sha256  59cdeabf26950d4f1bef70f096b0d77c5b1c5a7b5ad1b66d71b681ba279cbb2a  LWP-Protocol-https-6.14.tar.gz
+md5  ec336ad8e2cd3dabf8db3d31f40beb80  LWP-Protocol-https-6.17.tar.gz
+sha256  361c7c1eee8cf66812958f975f26ef2e2272a0c6221d2043477cb9c22b8d1c23  LWP-Protocol-https-6.17.tar.gz
 
 # computed by scancpan
-sha256  e4def55436b2bd99fe2cdbf546a72ad5958327e28831db9b5adb497c6bd580ba  LICENSE
+sha256  ae31d234f4c72051ff9c8eb439a85f2cc11ddfbf776b748864ab7f7727e1c4d0  LICENSE
diff --git a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
index 1b4482e16..c67fa40e0 100644
--- a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
+++ b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_LWP_PROTOCOL_HTTPS_VERSION = 6.14
+PERL_LWP_PROTOCOL_HTTPS_VERSION = 6.17
 PERL_LWP_PROTOCOL_HTTPS_SOURCE = LWP-Protocol-https-$(PERL_LWP_PROTOCOL_HTTPS_VERSION).tar.gz
 PERL_LWP_PROTOCOL_HTTPS_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_LWP_PROTOCOL_HTTPS_LICENSE = Artistic-1.0-Perl or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
