Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1EEC79F85
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 16:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0E336061A;
	Sun,  6 Sep 2026 16:33:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GvrCGXq679et; Sun,  6 Sep 2026 16:33:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 05ACA605F0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788712389;
	b=mw0en2DfwTctEEp/jt6ZHYrTTc+eXorUIluDblt3PhEnIAvaV6amYdjdidxvEiIrZ9Wk
	 xGEw/ytGFSNBQpnVCWB2rogQI/Lj5W2MMLWkVfyhYUcVpiNboW+Sa6IaNM7AXrA4vgSBv
	 dX6tTjthe1nwOO5fVQ4qlnyjVlHgVlWchJP1CppmjyTwr4hZx2eHhZBauUZI9lO9wVu+F
	 nOdhlwrkNjBjMJdkqYpspEidQV7FR5sN6R7hj2LDggli2+tZNuJiaSTiUlaNN21+JC1Px
	 KfnWkjyF+ktbjgh9r3cK7tf3fTRBVhLJSDPdd7rR1+N0cXp6FD6wbeuKHoSFCWiEbtA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788712389;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=foA/m31bHcRTsH6osuxu3ckFeHwlnqco7pVFpJHoK9U=;
	b=HQNcuaenl/IFzWlxHlXPsMnNKhENBISGRgkOY/VyHCnwpDO+PdgLR/dfMQglyJwd5E6E
	 BKJ1yBfRWSSvueH1uFzBF1CkyECwcMgRCiEGypcUzskiPf8mdDS1Rhb0SHaYpw821PE+P
	 qg2nHaJCmNDSv6JrXCPykQKHfK+FQzAGwZD5zik3ZrKXo+E07C7iRrd7OSRdFpMNt/zyt
	 SpY+eL4UYxnGBsy0lBPGO5brYQSJt9/V072O1VB4fP7oXXDRc6hMwzDg4+3RKyo31C32+
	 vEsuAPCGDvlfk+dwydYmskqFVddTvmfA7QMFc0CdYe5a5LXjSD9JWgpsA8ORTsSPnDQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788712389;
	bh=foA/m31bHcRTsH6osuxu3ckFeHwlnqco7pVFpJHoK9U=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EOPYIYeBvxTrDsX9MDFtvj946WngY4WTQYASwRZhSEKc6JGH/t+UY8ewTQpVbmeRG
	 p9r/xO+h8hHm229+p04bZr1F9vyaFnpX4DCPeNk88i4EehWve4F3phSmkjlQbfQLyf
	 35ffDM3a+J3rOVe0Cu8qZ0QcQwlHFIhyPmPmtGLGK4TgOu19Snw0RPOm91x/6x3bHd
	 lJgAyvsUt7SWJQS9vNnhumAZPwFlDx+qjX/twfwQKAJc9jvU1lIAMejLSjL9jBE9ky
	 jLPu9QyJoKEFWx/yEGHpdbTC/zBMW4E2NENGviF3JaQxNZlYLuRF4CI6eaqiTobGn/
	 FfjKuMDaxXwMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05ACA605F0;
	Sun,  6 Sep 2026 16:33:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FB42118
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 16:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 716084059B
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 16:33:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H2gnnO4o9m0n for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 16:33:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 509BF4059A
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788712386;
 b=EKtyB/XmYjLwRLS2nV0vIFLj4B7kOZIA/QbsTcWz3Xvc3IZtVwkKCVsfo3thXyfTst+W
 JLNcCKj+gaeYAIm7b8f9ceUHMfkxcjFogt2PaN3cBycFKwzWbqow6Xv3dj+8ZbZmtmsEF
 yelZwG6rYPjmWmBlMs9Uk+fa6ujyccmUzWYaYgiXSPA8XlxC8edfTHBgwMCa53omEyJAn
 CUjs4QSHCz3r9MTTOeTHHp7YiwhTYs3SPNIwqp/jWVa8UHdKZc99gJuSNt9kepEaAtqpl
 dl640A56/wqU3w6lXiJhxEVAPAuTt0gxetguUXgWvw5n9hZpa6gHK4XDUax2WzzNLzA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788712386;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=bp35J0iN0bxZyeOrxV9vD1EjG6zueGI04Y7ubZA/mBs=;
 b=FgoLX+9qGibmnYES/DERpojjqsbtdexJLjwjU5bvA4AcLL2hvDqAEUJsIGJVXMEo61Hs
 dQbjwcsBMo2DdYzxObZvQBm89jh8wBO9hjxCZFiLIxcqsEMi6YGlYPMIyCeKNhuCcnUrQ
 yLHYvIXwBcsUUKXB98ZhJDNbG3BQ4rMUiU9c+SVYobukg2w3IUc/jgkgK3QWdQJXiitZO
 heVvRnzac6ZIRjr0ogY8LKdnkFMlzfXEq6rL8fbz5qtq3K520gHa7APbGrLwzj8qyAdgs
 QZCynye06IrWrPzjjxHI+bkn7ohOcspJ5gnGesyq3/4T3dQmSNIflhw7a238AZyXwBQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=SAhZmg+8; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=SAhZmg+8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 509BF4059A
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 16:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788712383;
 bh=bp35J0iN0bxZyeOrxV9vD1EjG6zueGI04Y7ubZA/mBs=;
 h=From:To:Subject:Date:From;
 b=SAhZmg+8AzLeMnVcLxdGir5kja/SGoNH+QjEldY+BCAuY+YMxVi1T/AVnfNxoUBH3
 R1xdy2hqWg1DW3YQXa2spccvrEkkQz+q7vrfo75DRDmu3PZLjDUlkmEzVLQHHtt0TW
 Me6wH5h1K6OFcQy0YJUgogqzRQPHL/kP+nEltNymQRC5BTHOkJMC2zJcNVuFpU+Rcw
 MWEpsZ3xAvTJsgYogDJ8OVa8/YmFGQXiVAM92P/xaHfrRZbTnAIPOk9/4ful6T8pIf
 V8FVi3tRshiTJU7+Kgx0thnBNNYCoHmVZGVby2G119OWu88VL2HPmhNm8wlhYqdmxh
 xyJXWd5D70/mQ==
Received: from fli4l.lan.fli4l (p5b3a02ab.dip0.t-ipconnect.de [91.58.2.171])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4BDC7A4C3794
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 18:33:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34186)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x3Fnj-000000000cA-0iXd
 for buildroot@buildroot.org; Sun, 06 Sep 2026 16:33:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  6 Sep 2026 18:33:02 +0200
Message-ID: <20260906163303.3704352-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/libp11: bump version to 0.4.20
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

https://github.com/OpenSC/libp11/blob/libp11-0.4.20/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/14a896cfa094cd6a59cb2671903d054b8ae4bf7e

 package/libp11/libp11.hash | 4 ++--
 package/libp11/libp11.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libp11/libp11.hash b/package/libp11/libp11.hash
index 8a31a6f39e..10ab7388ad 100644
--- a/package/libp11/libp11.hash
+++ b/package/libp11/libp11.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OpenSC/libp11/releases/tag/libp11-0.4.18
-sha256  9292de67ca73aba1deacf577c9086b595765f36ef47712cfeb49fa31f6e772fb  libp11-0.4.18.tar.gz
+# From https://github.com/OpenSC/libp11/releases/tag/libp11-0.4.20
+sha256  a125e0310ff10c189fc1b32a9652101486ea94a6b07c677a30e90e3638d2db48  libp11-0.4.20.tar.gz
 # Locally computed:
 sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING
diff --git a/package/libp11/libp11.mk b/package/libp11/libp11.mk
index 51a44f5b3d..38cc1c2e6d 100644
--- a/package/libp11/libp11.mk
+++ b/package/libp11/libp11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBP11_VERSION = 0.4.18
+LIBP11_VERSION = 0.4.20
 LIBP11_SITE = https://github.com/OpenSC/libp11/releases/download/libp11-$(LIBP11_VERSION)
 LIBP11_DEPENDENCIES = openssl host-pkgconf
 LIBP11_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
