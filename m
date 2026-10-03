Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98902CA5FE4
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 22:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3908440AB8;
	Sat,  3 Oct 2026 22:44:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lvTF1B5-h5Au; Sat,  3 Oct 2026 22:44:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 585B840AC0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791067495;
	b=tS1qgUD/jGu8wyc4KL5MqHh2c4nPAGH1qbxGfnqVWTmSuHFYvH8rh9DMsGkep/MCW8vh
	 0K2zXM0Tjqkfz3GedJ46tOaf3XC2jxdxDjrb5bIfHWWrbal3mco5lf/+4Y3k9VpQDqBrQ
	 dcrKf9m4E8Ibw3AvD9fDYDE31au49nlnqFBEq4nPMsynsryl293YWo8V77iaRn6JDagkO
	 dlQMWnY41DHseBMHtbjUdKCjNvJI+26am6CMdUs9crUvxmT1yyGZvMBjJcWVWUBTOZCt9
	 nxF0Bpf2CA3XLFhLlrGf7TzHMrZqs4LLO+vPpnqg933z541L2H+McUhzQsdMVlEArHQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791067495;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6PLZONH8WwOGSusADp1ymMVblf75qq4X70ZiFh1dcEM=;
	b=Jm5hR1hYg84pmiQHleMF5p9syEPwNBanokxstkVZvvsfIun/e5SlpFAiayvsdQj6H2bI
	 KokLquj3IeaxKtjpCmhaHRJ15hDGV4Qg/wnR6MTSQdvWnc1elAnL5ZLnXVT1UmCzFgJaK
	 50ZkmVAcZ2Y7aaWqgFN8pnCtQ1E+OFB+LEWZ1jGpiiBZRHwDd+n9ZqU1FTHDhMKtyRdKm
	 QnL081jqxIdpW4Q+rjp7izYy5hA9b1ZyBsFE0zc+J3lvVieZYMNCrSwr3TzdkIyo3xTF4
	 1gQYEPSCfmvnNRRRIA1MqTtPLYRRAz+F1+8Uq4A7LvLfbxMKywGILmTg4UQhfoLIUvw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791067495;
	bh=6PLZONH8WwOGSusADp1ymMVblf75qq4X70ZiFh1dcEM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=F/QefF5iuVJOT879brRoRJpfWpEw5HKk2P6nR7WGw5hnCQzcsA2PltlhkTCeEAoO5
	 rid8tlZEDuTz5AZ2NfOiPqGThSOBxj1LEIxAGqJ18U6e4jlhH1pHszzubY16l29wfk
	 wlfwN/Vb4z1MvCJUnmKZC1STNLFEOKiXI+N4Oo7QZ5ZrnuSETLRaGk6W1q3gcHPuw/
	 UPb+ULBAyQqDWYgcVatJU6n96UWrtOYP5Jn6itWCmv1pJfm6cPAEm8YGQL9I7acJut
	 HctCv2DkvjKXU/PGZhAei6wznI7eDBqmNLL+CvxXE4dJxtaJX5hLlnhbAlkvMuIrvz
	 Eb/UgvXsR6MZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 585B840AC0;
	Sat,  3 Oct 2026 22:44:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C0370263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 22:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1FAF60644
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 22:44:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o7pEaoeOA1JK for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 22:44:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C5BA660624
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791067493;
 b=bYiRkS6MxD9wT5pL2SPQZHZICRjExPsGyEOlFJNv/KAxqHYJOOvSYhgUNrBQn0GAjywK
 mWT1M/0Yl9boRjuBDaEM6CRPiwBP8FVnMxwHkAj+GVS1a44yLtQvcH8HjRn9lOInlhS9L
 hX/FXONaQGg4w/4A6MNbr/G/bkwIvPhLCRrmzn30C5tVgwn+hhiS3xN0ff+2VCFmWzDtB
 Tf5kuEC4Ad17rWK8ZB/+d3kl312s0R73+qm8rHdsuC4+lKFOF0lJVWp8XBbBolf9kta90
 LOvXwsrot2E78wrkTziXIt0iaSyP+RJ8XN+2BUF5buqoyTP3N8ahkZbxPl1l6Q+mjyg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791067493;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=D6bWJkpmBzMyCOos4kNvxjV8y6a2dVxUVvQPgHth1w8=;
 b=eYz/HXDLaxSDO2s+wLUUW2tUBwJ7o/o40iarA8iF+urFPUu2ApFY6tRI7ai8ERd3ymtw
 EwlcoVJ7dH15TKziof24uhbr8XrL66rLaSFdFAQF2cFwTTRNKO3O4eu/lyr7PdC1dcjqF
 VmL8BYxjlcE93pF0X6Pasv45fqdalaO/aJfw2H5/05TjtN4dmvEnq2lkT+5vXUL+5Imnw
 DdJimjIPyMx2v894WNqfaG1GgXKAyHk2pYxtJijaaRH7y6h8PqJgjIBRbwCijAgYgdd5J
 WygoIVzsdGJh977cZI9VIcAYwtMDTBdcb8rjzUcOk7Gu5HeiQo4dwSeQzzcE8iY6wJA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=bQ6Y9hDR; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::e"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:31::e;
 helo=mail-oo2-x0e.google.com; envelope-from=james.hilliard1@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=bQ6Y9hDR
Received: from mail-oo2-x0e.google.com (mail-oo2-x0e.google.com
 [IPv6:2607:f8b0:4864:31::e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C5BA660624
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 22:44:52 +0000 (UTC)
Received: by mail-oo2-x0e.google.com with SMTP id
 46e09a7af769-81be5042c51so1142350a34.1
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 15:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791067491; x=1791672291; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=D6bWJkpmBzMyCOos4kNvxjV8y6a2dVxUVvQPgHth1w8=;
 b=bQ6Y9hDR85H+uS+gpD8AxfXKhf+japHsg7WlLskMKIwWZgp7qsHJTI/TmIB8I+vtGl
 KifZcVsIBgk6+F8R24V4Vg0FOFVTiX61CnXy4kDWFvLcy2g9+VtgUuaTLIx5BPC+SAyF
 rECdkszeZqAuFz3u6rcehd+NMVmEWijodFE7uXDpPXh5DhhxvTDf/UVQsem+0M92imDP
 o2EguKYOHAA/3YLbg5EOwfFf+feV/Jjcjk4e8UR6X8EJFm67eLH7mnEiy1wHyyFwKF+l
 ndt0O6/5MoxU+MJJcrqmzMKaL9P5qpmhByxYs/gno0JudZGteeEBUHYja9Gg3r2vzLRV
 1UsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791067491; x=1791672291;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=D6bWJkpmBzMyCOos4kNvxjV8y6a2dVxUVvQPgHth1w8=;
 b=HtsRWl6sFvBgcp3cW9bJSRfovPdZceFUODf7HGvCmnTx2CRmnVYzE6k8d826dW7Ghw
 tWVK1+zOmGKs2h1fDum+Ds2IZpSOQI6F1a5q7I2zImLzs+I7fSaoMKk2mZa6wzPSXHiq
 P26rhhD9MF7l4X1QUwrUoNEzPct06jj1t+xA2Oxs/GYVTTLrfMN+DnZYc+lxo6+572jR
 CtV9penTnMQGW3nA6pq0FDBHurK4f2W7pqeL/DeIMAMjCpC0PMJGDhaZdytQnfMbqrVK
 IdGKygmREBMBLllgQzIP68+x3JgPCqd7v8DOsdhGHdsGVOSCMn/bJUOnZE1xRVgydfHQ
 WDRQ==
X-Gm-Message-State: AFuF++kad2YwwuxmTPvFbxNjZJLvzJ6mwVERgAN2rhZZOPi/ae2NkrEJ
 /wG4rFeZZeLyJ9U6krfvFNHJbHHJS/l429+rOEuO69K2qokj+RJ0WcKwy2Mmcg==
X-Gm-Gg: AYBFou0xt0sg2NkoRAalPom1ZhfpIVNsMW7qU9cfxY544z8PuQJ9wN517hP7Ddo+U+u
 L+7z/1pGcpywRr1QRa5E/xk2yA0HP0zkq5PqETDjHCxkveUfhDTRcz4+g0kd+bcGKycLyH7HTRh
 JAoFgw0q0P4mRvT6vjj2WkIpgA1JqYioL7o+ClkZ2fw/4fZvUUZXPzsev8IRUO5OodkoAKRjfv1
 nIalZXBkbkz9LFirfw7xEPRrkXq4tQeSjQ+ob1HCHnkDpo0cM19wgKJdJSzDRRxpkbdU7S8LR/P
 TMS75rZtLI81YywTA4rMKsW/p6BmFqYBy+XWywUuChFy/lo5sI534u9Kf0PnYW53sxoidYA/eNw
 6wM7gdCXCIFB7PCIwykEcLLPirXBi0mWWoiZbVY+qtT3sr2DyXFYCL6y65y8YdoDyxsikPByxn8
 EI7jHHaSk/RR34cvoTM/64wTDDz5+IDtGpZTkVC+0vv82j1Y9rKXptI8FSPdK932e3NLFuUcmJi
 jnMbS5NAOnfhRK+vfOjhgZSWe2S8fibHNQIe7OSOE3c90NEgSoo1yYSbTN/ZYxZpHW+zBLlVgHO
 ZEsqMOj1T4lasjnUrgI2cGfS53t7VU4e4QjfaIlCNx/VeWp7GFRfgPEcVW8dkM2XqgH5QWSaKRw
 CegyZc56KrLykM5SvqjmTvdJEApD6pY+ygKsKdWE9Dw==
X-Received: by 2002:a05:6830:6c0c:b0:81b:ac9a:5681 with SMTP id
 46e09a7af769-82283677064mr6941420a34.29.1791067491234; 
 Sat, 03 Oct 2026 15:44:51 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a36943bsm7262522a34.19.2026.10.03.15.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 15:44:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 16:44:26 -0600
Message-ID: <20261003224447.744966-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-chardet: bump to version
 7.6.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to the hatchling build backend.

Add the host-python-hatch-vcs build dependency.

Update license to 0BSD:
https://github.com/chardet/chardet/commit/64eac3b1824913a001ce255f766a54d423fed5c6

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-chardet/python-chardet.hash | 6 +++---
 package/python-chardet/python-chardet.mk   | 9 +++++----
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/python-chardet/python-chardet.hash b/package/python-chardet/python-chardet.hash
index 87a5567636..154986d735 100644
--- a/package/python-chardet/python-chardet.hash
+++ b/package/python-chardet/python-chardet.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/chardet/json
-md5  cc2d8cc9a751641463b4f7cfecad2ffa  chardet-5.2.0.tar.gz
-sha256  1b3b6ff479a8c414bc3fa2c0852995695c4a026dcd6d0633b2dd092ca39c1cf7  chardet-5.2.0.tar.gz
+md5  728517f43e9a435a3239d60d1ab35270  chardet-7.6.0.tar.gz
+sha256  93d9df6089ded42ed1fe9f57e272c0b74bd0464d45c0c7d50f09f26f31105c3c  chardet-7.6.0.tar.gz
 # Locally computed sha256 checksums
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE
+sha256  0d4cf67e7a26e9957b8948e7dfc0e380e61b427a94b061e618889aba89bb9616  LICENSE
diff --git a/package/python-chardet/python-chardet.mk b/package/python-chardet/python-chardet.mk
index 16e5f303b6..4087c1cfc6 100644
--- a/package/python-chardet/python-chardet.mk
+++ b/package/python-chardet/python-chardet.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_CHARDET_VERSION = 5.2.0
+PYTHON_CHARDET_VERSION = 7.6.0
 PYTHON_CHARDET_SOURCE = chardet-$(PYTHON_CHARDET_VERSION).tar.gz
-PYTHON_CHARDET_SITE = https://files.pythonhosted.org/packages/f3/0d/f7b6ab21ec75897ed80c17d79b15951a719226b9fababf1e40ea74d69079
-PYTHON_CHARDET_SETUP_TYPE = setuptools
-PYTHON_CHARDET_LICENSE = LGPL-2.1+
+PYTHON_CHARDET_SITE = https://files.pythonhosted.org/packages/b1/51/cd61c567092a6cec796144510a68aff158ebfc1df82950a45bae65f28413
+PYTHON_CHARDET_SETUP_TYPE = hatch
+PYTHON_CHARDET_LICENSE = 0BSD
 PYTHON_CHARDET_LICENSE_FILES = LICENSE
+PYTHON_CHARDET_DEPENDENCIES = host-python-hatch-vcs
 
 $(eval $(python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
