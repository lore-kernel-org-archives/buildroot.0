Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B57FCC6B08
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 09:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4056160629;
	Tue, 13 Oct 2026 09:43:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XsGetqiGmL8R; Tue, 13 Oct 2026 09:43:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 54E5D60679
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791884583;
	b=YJk+Szq9s7tswJ1in0GaDYMafSNmlZvO+90dkFp4/fcqllLWOwo5EzYXWgP3kVUlVTks
	 eIwiJtVNi2b37mQHLFX+ztGPkGJZVHQT3wnRwUDowfWOsdtLCvNI3+mbzUx7p+l2Y9CE2
	 O4oa/2lxCy5lv3CLbrjgqVLMIIsbfo7rzDrehyWxvo8HiEPsSJMFMW4iJZl08Xr+AIjrH
	 BuylLhICsPSR1vdv+NAEttyaYFhsWougWzxkAl0oXH35Zmli1dcOhjQEljYrwlFSu0ZyR
	 vRzUQXADzjwdKGaSgpsO+3P4gcAL5F5aYqDOl9pIw7MZHbJRBdOInoD9jnriaK2XMNg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791884583;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=XvzKtrOdCBZP3T7VkqlNXZXHytb1q14iURpl1ZcAd4k=;
	b=jhgRIB/8ieq7ABpJQHW5zRYWWC2nfFlaKh0t23WadpSxfJqkMp4bktIXhAyum2y4QYVm
	 xQjaUYVohezfb5wER/tfuEi3gBXTPEXv+RFrj99R2kcqp55WqN/P2rw7lm5gA1lNCA4Nz
	 7lG63XqJzsW2N+kWYumTJjpJGoTr8qmGJMLmV4B2nvIfUM2o2kOn6hwcXI14YYD1+k0mu
	 qW7EYqaNxOvIWfGn79hF8Irt+3CrkFxFM/qJsFi/GOLJqVLu6/nSWMlya6frM7KCVttLk
	 T160PsdhDmqOXKxrs1JB3lfwdCmtUWLtOI0cSTJI+qwY/7lRuE4C9TquZhI7yTGy+rg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791884583;
	bh=XvzKtrOdCBZP3T7VkqlNXZXHytb1q14iURpl1ZcAd4k=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Mls4hR3xe0MVxE8MzEoUA5vS1zU+7MHvD3hgfcbA1lTeCxo4YZBsrS7kl6qpuOVyc
	 k7LCy2sia/iphdqhJ1f9j4EXYBFiDhG6g1Dshw6UPjT2YpVI6LMkRTDzG3y0MRGe1F
	 QpTR3UGaYpsvtZIXiR+mZXReCewrMW9IFmDYtROD8tuZ9GeruJy2HVqlnHsg8hfXEf
	 /Nlplu7AgVSF/TuOXWR3iWAOiNbGo5PfyiNLNcQ7/a4UpcPsu/vgoIJOBFwNlMi069
	 McJhZffr57PlX5L0aH6wkOoWsJwdMWZWfIY8NqtlheJeNSiAcyX8r14JbMOOtyJnsD
	 4m3Hm/OmSeTvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54E5D60679;
	Tue, 13 Oct 2026 09:43:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F2D45362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E46C080C71
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k1L6YQYb7TSS for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 09:43:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C9E4480B97
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::430"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791884581;
 b=kVJAcMoDqzGfFJouCVSTHRnZH6n9k7/Nzro1hyZiiQ+4GuYKCU2gMohkMTc62p4dcf9r
 /bhlzpUEdQQ3jdMgXixcQ91//aZHMk/wVY5v0RvEwAYCiDU6ds9cqhlsQGfiGX245HsWe
 BftygM4Ta5hKNFuJlbt1bzMUERl7m5oa6FIdxjt9+7Q+k0uHJNolteZ90CPv5tPys7YmV
 Or1p0/ri2yC6EkdhqqUY5GeCEG6tj3xWreUtLN049MvgUkK7m9X/iJwSjg4veHUbSc4yF
 y+bAfNDSCRSePr4hkUn5vF/rRAz+wtYJunKxdUtofha2lmTh1YD4tO6NVUhp2OY5epw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791884581;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=S5C9iXz/8mWONfOL2LOKANiHg1aD2ytXP7pRPYlhYx8=;
 b=EUsuHonu/u8J8OtcckmGPBnJ/XpC1fi/Q67bMoo0Owh5UWIUdgXybeGtRUK3BaVBmQQa
 t2zjJtZBQQM9Rn9JyBNz2f6eIcYSJGFc7tOe9VYwirZjfQRAqo/zAsL5DcmlXrpNafV6H
 ktivxsgut5dUV6sgQ7QokLfPm05If3nA27VqC7E8VcTQI+BxvX5TDeaTG0uIPBQQQ0mRh
 2Au3jBDGI716ALiNaF8XELCQ4kmh8WrSGovaiTm9r1tv+usgWG2/XlRk/HTQ1FFrgWgaD
 CrI7HAVlbymJ7lp6GhGDFXzyXNsJvGTW6ULTkwdpwP6raSjQmgLk9ULiGJHhQdDDDwA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=CMqlGJ5S; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::430"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=CMqlGJ5S
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C9E4480B97
 for <buildroot@busybox.net>; Tue, 13 Oct 2026 09:43:00 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-48c4d99c32bso2623638f8f.1
 for <buildroot@busybox.net>; Tue, 13 Oct 2026 02:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791884578; x=1792489378; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=S5C9iXz/8mWONfOL2LOKANiHg1aD2ytXP7pRPYlhYx8=;
 b=CMqlGJ5SlmG8YzZ2pF6GoAnEUE0zjYUduUosmxl+z0Kfk6C37DnVzzqx+zCPmYrbIx
 fQ+R8UCRexqu4BEUz/AmhGThfn3+tIqXZuRWqHbSZHSfZZKTx/NrJNSMJMNYzumZ7Y2U
 K0z5QCMVah4rZishMf8OYNzDjlhi3VTwZ3yWXpR0TPxXyoMQ5gIwQDAGX0CjYwk0VJr7
 2eE8yvcUw1/ZFWxMTtseFym2cYsi3gH1vUMY8y6CZFQRpqinM3ZB5ssfYv3myJBtZ5gJ
 fFBita6rE41tsqFtbHew8o1nR7u95nnepqEYOAEg5H0ZGCvz94B75xHon4QhapdkO1YU
 ECgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791884578; x=1792489378;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=S5C9iXz/8mWONfOL2LOKANiHg1aD2ytXP7pRPYlhYx8=;
 b=zsUA65sAtN0FpT+biKqCDVMC7MqtQxg3tRR6yh8glKGfVixfgIIdvN+kjAvDHunQ7r
 le3TU5Q5m8BpuyMoKge9zHBC1UvVbPQc6aLlV8GcQWXxaBKtnYp6mLe5UnUqXD/soInV
 0JoKObnjhzBLFZDASHT6NXuu3aYMgp1UCbfHkuKCGNa1XBnNdeyTlW0RJqk2qJzZ32tc
 ztrFLKiKKkNvXWv8+s4HNeXBoShmA0m7YZl+y9JgsMFT28ugj8TNPc+CDUeASaWA3rsa
 Fcrw+305b+OXWRoXeqEdHffr5xV7MjfnLjZQZLJMEizcFxDb+OhH157ym+ASVqeJ3cpv
 anUg==
X-Gm-Message-State: AFq9FYJ96pbgnSwYWCItFjlGjIBjAZZ/dPX8FxEvuNxX9gMx4HclEn1v
 oBTeBrZdziSbFgjOrIWnmONPV96uGnK9Ri6augF5+vOzpctmzSFPUeYe3MBozA==
X-Gm-Gg: AYBFou3v3LVAxq+K6K/tiFnT90a9pNlbyBHeJlhg6K10INzRkvosgZq8BMfcHQCjyjm
 Ffsc/4oKA8qxqaoVLESOZR3XUKe2RwFDJKK3lWIW8Iy+/qygZaATrtyhP26WO1HKhqfMImSO0+T
 BU3FWy0Z0CmylJKzB0shNKXEvfzOimKeF+1hu0RMTTk2Y8BSw9AbYI2rLBK1lfuGLBzETvxQC7k
 eoehO8b4sTgRk90qx0Lxj/t5ac0cEqxcjhnOdR8e7UyASPanmkWf6hXV2khgWmR4wzYEHafWx3E
 9o6TXSzOqvaxCUp50t0JFLPLWmSHZ+Iy7ikEkOVdUjTYZ1JDEecf0oVWyTVwBAXQAaKNFQCqrFQ
 GJX0hNUzfogjIVSdRrm2EZBMgKndm6BZwHWZZTKWpvywCQ9QTkE8K8l60kEPHl4qq0d7ewGvtjL
 ZnEXrkC/TFA96tHqELU7HrzNGJHNu+0WAdCoE+R9HGIGM98V7oYIYB9R+obkKe/vZf34OToP3EN
 pQBGUxLyyxZZw/dXlmJQMVuzQl4E4QyKbvkYyHoTpzlyxJVTnk=
X-Received: by 2002:a05:600c:1909:b0:4a1:722a:d2a3 with SMTP id
 5b1f17b1804b1-4a18e4a3f5amr265898595e9.23.1791884577820; 
 Tue, 13 Oct 2026 02:42:57 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1972eaed8sm238665595e9.1.2026.10.13.02.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 02:42:57 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Tue, 13 Oct 2026 11:42:39 +0200
Message-ID: <20261013094252.96761-1-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 01/14] package/perl-clone: bump to version 0.51
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

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/perl-clone/perl-clone.hash | 6 +++---
 package/perl-clone/perl-clone.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-clone/perl-clone.hash b/package/perl-clone/perl-clone.hash
index 2cd62648a..0a75d5afc 100644
--- a/package/perl-clone/perl-clone.hash
+++ b/package/perl-clone/perl-clone.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  62ff032a4df0c4abb74f76adf519361e  Clone-0.47.tar.gz
-sha256  4c2c0cb9a483efbf970cb1a75b2ca75b0e18cb84bcb5c09624f86e26b09c211d  Clone-0.47.tar.gz
+md5  dfd3f7bffd1c2725f0d114c2ee2880a5  Clone-0.51.tar.gz
+sha256  f17f66fec97dacca67ac9585701d2d079cfc80539fe6e8160c201c4e55f67507  Clone-0.51.tar.gz
 
 # computed by scancpan
-sha256  40aa7eb133e97b075024380640528760a54aefc344781741ed02539a375db5ac  README.md
+sha256  ef9ff0dfbd1bda7c74ad764a806ddafc976f2d5b6568b16a3ede8bdd2e8469e2  README.md
diff --git a/package/perl-clone/perl-clone.mk b/package/perl-clone/perl-clone.mk
index a5d18558b..43a038188 100644
--- a/package/perl-clone/perl-clone.mk
+++ b/package/perl-clone/perl-clone.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_CLONE_VERSION = 0.47
+PERL_CLONE_VERSION = 0.51
 PERL_CLONE_SOURCE = Clone-$(PERL_CLONE_VERSION).tar.gz
 PERL_CLONE_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AT/ATOOMIC
 PERL_CLONE_LICENSE = Artistic or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
