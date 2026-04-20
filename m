Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D55CF5A8A3
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 17:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2313D82D04;
	Mon, 20 Apr 2026 17:19:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BOzuZECaHm9j; Mon, 20 Apr 2026 17:19:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BD0882CB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776705555;
	bh=9qEvh4FrjyC5pOea9hMkGVG7mCTB8JWcPWiVFHj76g8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=E6mkUeH83kteH0uHUPaKWsomiRe915Y2pmMZ4E+A3+EWf5oEOSqXYhBAU6NnA2dOu
	 gBCYCH68KmomD4xpFfnfsovQDH9H/zUubXV8RCDCJJtU2l7h+me34RrK4tpfe5UxFZ
	 cVpYjN9C2qBHx2o0TEvHFIeyPSRQLLkHlFciqmzzVGy/XHefyJxULXfm+tBqUr3D8d
	 XD7CPJIb4UnXh8fH5CNJ/a6i9iCb/RK1w43SYO2S/dliTHt4J4rJ7O37znaDbNzJ5B
	 nw8Cg1b55gSlmysc4p9AKZx2GkOZcM4rf4JL5DPgpNYx0l5GgKzsfwL8V32T80z/lk
	 9mJbHXznbQRPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BD0882CB7;
	Mon, 20 Apr 2026 17:19:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 588B7257
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E97C4085C
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:19:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v45z-GZsmpEB for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 17:19:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D36B740847
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D36B740847
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D36B740847
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:19:12 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id AADCE60136;
 Mon, 20 Apr 2026 19:19:08 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Mon, 20 Apr 2026 19:18:37 +0200
Message-ID: <20260420171837.470571-1-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776705550;
 bh=zDYElK9oXzmSMJPuDTy8H8Ds258GTkcfd8WeRabbt64=;
 h=From:To:Cc:Subject:Date:From;
 b=drN24mEWFpmvtn9PaWlVgvnSN5EcDd0MortA8J6msJaNkwC82D9YxNiHQ46D0RHLT
 Beu28CwP/B7DQq3Ib3/CyEsvOltxb1DV5r7KndUOnXsDTa2gJusOizyhS7lFKrdFJG
 HycpJ4+GYxBIKOsf0Py4t3sJJQ3m8WtPY+AUhnvB2nHp4ukHLfa8IZEraWm5VcC8tc
 endylHQXjWrxU6fVSMSTWtDMKTyiNl4iyizscnE/5WGeMe1AGEI1jHf/Id4sQAZVSK
 BZr7b1BchSOeqXUNdjD1HMXECmuhx8wQHMriMru2i3II4KIqs64BiL4kuK+stfDAkE
 KoxK1Bo2mpujQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=drN24mEW
Subject: [Buildroot] [PATCH 1/1] package/fakeroot: fix hash file format
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit [1] "package/fakeroot: bump to version 1.37.2" introduced an
incorrect hash file format. The command "make check-package" reports
the error:

    package/fakeroot/fakeroot.hash:2: expected three fields (https://nightly.buildroot.org/#adding-packages-hash)

This commit fixes that.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/a4f2419164c4f3514e573427f6537f94c2878837

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fakeroot/fakeroot.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fakeroot/fakeroot.hash b/package/fakeroot/fakeroot.hash
index 13e8695128..82a6214380 100644
--- a/package/fakeroot/fakeroot.hash
+++ b/package/fakeroot/fakeroot.hash
@@ -1,5 +1,5 @@
 # From https://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.37.2-1.dsc
-sha1  1a721c2b4093a4e83dc091dc41a028f19340c1b3 595964 fakeroot_1.37.2.orig.tar.gz
+sha1  1a721c2b4093a4e83dc091dc41a028f19340c1b3  fakeroot_1.37.2.orig.tar.gz
 sha256  0eea60fbe89771b88fcf415c8f2f0a6ccfe9edebbcf3ba5dc0212718d98884db  fakeroot_1.37.2.orig.tar.gz
 # License files, locally calculated
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
