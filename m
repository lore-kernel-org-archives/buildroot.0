Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C09E668BC
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 21:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBDA18211B;
	Sat, 20 Dec 2025 21:40:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 37yyS1GuECIt; Sat, 20 Dec 2025 21:40:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEDEE82051
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766266843;
	bh=6EliC1fmFurEcGic+tBEAPp0YFBFksK7AvkRFFVuJzw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=blzAdtaYDG9Ixj1FV7OhyTScSuFoAUIRz0lxTpA2SJYs+dGgz15Mngsk/7XrYy4CY
	 zVPKfcR28dR1vDWrwdODd82Bpt0k4d8C7tQlhW6LOyaN/zmUTo9RTIArxzAO11LrMH
	 G0CR0wm9z2UsWMYfQFwlh6YCXmTqEZ1ID1fRFEioWX0kc5Oh5EInE488sCmgcH5xig
	 ik5i/Y4R0QlQgB2Qk3apcgKgHZ0WgpepGmpFq3EbNkOymCVOXE2b7EXLAeIS+Z3hpo
	 4KNQInJE9on2lL0Iv8aUqJU+CKUjjMG8ESftLPb31WZyg+ABVRwlzLupAvi7UqxHMP
	 +d7FkhqUXw75g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEDEE82051;
	Sat, 20 Dec 2025 21:40:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 855CC23D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B086681E3D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:40:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id scvgVljrOO_d for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 21:40:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ACA1081EBE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACA1081EBE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ACA1081EBE
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:40:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 895F9A4C4D52;
 Sat, 20 Dec 2025 22:39:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57228)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX4fz-000000001mj-0Ryk;
 Sat, 20 Dec 2025 21:39:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 22:39:38 +0100
Message-ID: <20251220213946.1088820-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251220213946.1088820-1-bernd@kuhls.net>
References: <20251220213946.1088820-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766266795;
 bh=5kSByQ/MGTIKsu6wpWzU4MtlWpS2VBpxRA5ZnqJTfoU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=gu33DnivXBXna9gDWD6gBy7xXKe5epewZjKojIp8ipaLMggvDBnR3GVxG6PewHGqK
 eOis5Y0YFzsE/YyVXs6q7OLE9Ek7yNEXVgyNNc9VQ3IyStz61LXu6YvaQij0WhQJR6
 0HT4lHhvXjSRRlrTMSfoZjxBgkb10O5qJN/0quSbSkLCfs9WRk8Da1XwmJSAexGig7
 mMfzz2TNiAMwBYPcKNCaYzhkczyNZ1Siuzbra44hPXMY0rC76MYum+9lwAVR4i8M5a
 +dgcBJpZItvCh+IKq1dt6HabAyJHBQhxmYcKIyRyNeeZukVAO59ZWaZ3DAWkQXsqAB
 KPmyQHmCEjFjw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=gu33Dniv
Subject: [Buildroot] [PATCH 07/15] package/python-fs: add md5 hash
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-fs/python-fs.hash | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-fs/python-fs.hash b/package/python-fs/python-fs.hash
index 5ebb49128d..a7c416af0d 100644
--- a/package/python-fs/python-fs.hash
+++ b/package/python-fs/python-fs.hash
@@ -1,5 +1,5 @@
-# From https://pypi.org/project/fs/#fs-2.4.16.tar.gz
+# md5, sha256 from https://pypi.org/pypi/fs/json
+md5  2c9dae3d52950407fe265c3576396c33  fs-2.4.16.tar.gz
 sha256  ae97c7d51213f4b70b6a958292530289090de3a7e15841e108fbe144f069d313  fs-2.4.16.tar.gz
-
-# Locally calculated
+# Locally computed sha256 checksums
 sha256  bcc1fbae1da071a15d17fd7609519af1160a3d72c65622047b61e19ba63e780d  LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
