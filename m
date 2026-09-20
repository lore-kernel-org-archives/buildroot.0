Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE02C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0490B40D92;
	Sun, 20 Sep 2026 14:55:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UrejzcFM9BD9; Sun, 20 Sep 2026 14:55:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0F6A940ED5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789916101;
	b=lqN0mQD9/dLFMykyX4ScWiNOG5df17H0eA4qSZjt5YryQHJzKb1SEZGv7nkBGiopcBAp
	 TpxdnH+FsYBAUpSF6lpw+SMZvFgpzGKWP3LUH7IYuuj9IH/H9c0E+4rU50D2OPMrDPwIU
	 l1CZ/fDtFGgp9y6tkSKb9UgKPTZ9CNMeZpV1mxuG/5BYg43UKwitGlkNtRXLCpCaU8DJt
	 EHUy5/I9J1FnFh+aLm0mTnQd0mcZ1uzkgmQ0l1ZrxahBOcHRivbWONIooC6Rl06ayOZJp
	 wdnawcrlVOEtuauYTqa5Xhp34Z6ofssaDFoAweX93ZpDDBRHkhUDMMb34sFY+lhDyzQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789916101;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+ad4XvIk8KRN3crymuuUiV/3f/jcXmWAX8WkfdtfKG0=;
	b=dy9/l2y55mPv5N/y3NpyKrfAvDrKX4DfUeyfLagx5aSDNkVt1J3aqts+k9ycLVfMGesM
	 xVi9PJ1cEpYnMIiWQdCDGVT7Ztfm3Tw4Ac0w5k6n5ZuP9EzZxcsuHSFdZUJ9RZS6G8yYE
	 TVLNMapzqN2Vdaw93hU2+iJ9jDBM7W01jWHalnbI5jNLIi7SiTjYOLqJCND2WqhSSwvVV
	 8K3jyZ0OwrnTKrK7tQq39m++hro/oHjAx50gDSPZtbCOHOHwAtfo2uuFIcmr9Hb4nm1lD
	 hOUaMIdbzyrHjv7GDRRtm4DeqcNFY1zVCNg8zgmhgTTfG86sN+BKqYo1QZKp79ITvHw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789916101;
	bh=+ad4XvIk8KRN3crymuuUiV/3f/jcXmWAX8WkfdtfKG0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NA3Gj+zM3RrUsKebzm54bZWwC/rNIVWyIdI44OtretvNgNARuah4K1jED4Ge/WDQN
	 l918M3VX6tBwVZfQF5ZAuidDz2IsB9MSiyR+dQ1tl1nk7CkI86Ntx3URf0fCugNMjo
	 +Y1nZ44Pn/anKvGqJ9A0nrDAdQNXHWDXSdSOVYG4dwyMktDL6ALAWBhrIIjueSlrpF
	 6LRlSeofkKgTn7J7RdrTstHnElbN/u7fxLB2h7V7YZ0Lz60K0UVcwb7NBn+AkaoMKF
	 X3N/9Hr9ttVU/UkVx9cWOl8KFpWMLg4y3/6+Z6egrIMeATWt6LA7+YodPj2lXE2weh
	 P8khnW09lG32g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F6A940ED5;
	Sun, 20 Sep 2026 14:55:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E3A7024D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4D308101F
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:54:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 15oxLGyY1vq7 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:54:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EB35D80F9F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789916099;
 b=coMD2hCP5YMuAkj5Bc0WhHr/7dzuBrfKlkPmUdawuvsyfXwxeWadZPL+LtgcjTKKPbx5
 +IDmvLDLWB3mtVmrR5yxqdzFWvBfAR6vtzEZqHiO0sH904vBquUj7EblZyZltiGjo4Iia
 53sNqXwtU0kkRUFM4Y74pv/btoIAB+Bx4MhyXCk0WE6+rEmunI+UOx7CT1Jwd0cnUb+0J
 yHD8noFGOY6D5rtdAe/tWvOosFIl9c6YMtgdW4f4s2vYxIqhtFINcT+yDE9SmeqnRxU3W
 xWmdPoGWLbXF4uX+EWopKm1VzQYZKpriKTrTKjHhCpNsHLw9MQ9V/mzFArXkua+s8Ww==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789916099;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=5gDvCJ+UXhkxW77CQFBghKeHwlvChzvv2/WWLjOyl5E=;
 b=JTD4GjR9CsMSAkZwSm7dCLaqtTr7zTjpVVfOziq8mp3zbv0xyJ1VGzghUw7n/u2DIjD0
 Zqvci45f83GmzD+X6HjGNpZiLDBJoV5lBwreEncdf68HG1bY9LnPoXTRiudzcX7+3Z3NH
 7gF5Za8m9A3AQ6fUA14/mJXJ5N3EUhS/SkncQscGpqbyEjRnYVYOiQoiLTeC1dCr3WLrl
 MpeGU5GY4aZkxcZ4btQLCy2xcM/QU38uH/XyKXeGRJR9o9Ld5IX7gaThECiVJUD/u6SrQ
 QbsFPAf9002/DvxlGRMviIX10MtG/eAuDEVSH1ewdPY3hNXaI9mrXCwJVb2jzHTH7Uw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=s5gjVuO3; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=s5gjVuO3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB35D80F9F
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915505;
 bh=5gDvCJ+UXhkxW77CQFBghKeHwlvChzvv2/WWLjOyl5E=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=s5gjVuO3rIicc6zlmTm87uW6xi9PfiNY5HLZ46C1h+/+lvKcxUcf5S/nZ5Jej+p6I
 h54AQ3J+Cax2vgbNturBc27ZSP7usGNxR9ZVUND8WUyrXRYVHEAaPVtnGZzg4OweBX
 II6Jo2pKbGCVEv2AecnnbZVtVapn4ClPlybBBI+UrViroVKB28z3b57rqG+TesgFPv
 aRFaxpltW7BTMMixCQfP78PgGi2P0uz2VBuSQopq9mcaaOR0gxL5YHC73gXR381mbG
 RqFrUxx2wHOfxs5kVRssZD05tsQA8ygCG5DoBFCtTAkw0/DU+84KwgakERcNvTm6PU
 ln/hlaIfIWIOw==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:xDeGQFwlyGV804aAjaMGOHlZs4JoN7N35waFtyo9AORhzSf3J/p7bxiO2KgrrXGOhef6fE5RTFLkCVXm1SZ9K7ha2CWnCy4mFFxkrSR2xdL2ovAedjZeydON7RDCdGI55ygoL7U7xy4xUYrIjqfJtE4qI4NNvmwpB0tlzBqHjzbTPahZDrJcpBa1AbLLVjuk07utbLOUrHVtTdhRi5CmFXrbtE2vJm8MTH4bRqqGxceFMHhydaTk8oSiLwP/XdXisuglv1YZY4qD4E9H6rRoURwyNel5kPRd5PWLV05qC2eYeOnCWZbKMN965uySh55enXhXaTKjsA+rLb1puEgkQTQj17L7muKO8joxw996sp42GkzqqaXxmipHwphFHPkbRCAEldvS8UrKrkyZwY0GnM86K5VJK0dWoqbLxi/cRey9yKHFKGfDQZIjKB/s+gHgl7qAlOzC4wqa/jDaAJqI9yucf2wTLDpGzcgGwSVCGXZ3/4+najsITzg8e0FMfhXTQ6f1PfCby5CUz09eqr5gStseJJ3CaM+l0nmP4v8lV8wgceGa03Nu2fgnbgyQWn2Bxv7CD787bHi/8AJghQ9KqlttgG3JxAI=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3C904A4C48A8
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:45:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Imm-000000000hB-2OAD
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:44:13 +0200
Message-ID: <20260920144428.3009612-53-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v4 52/66] package/redis: Fix build with OpenSSL
 4.0.0
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

tls.c:676:5: error: 'X509_NAME_get_text_by_NID' is deprecated: Since OpenSSL 4.0 [-Werror=deprecated-declarations]
  676 |     int len = X509_NAME_get_text_by_NID(subject, nid, buf, sizeof(buf));
      |     ^~~
In file included from ../../../per-package/redis/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/openssl/ssl.h:34,
                 from tls.c:22:
../../../per-package/redis/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/openssl/x509.h:1041:27: note: declared here
 1041 | OSSL_DEPRECATEDIN_4_0 int X509_NAME_get_text_by_NID(const X509_NAME *name,
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors

Upstream PR exists to fix the build problem:
https://github.com/redis/redis/pull/15227

Added buildroot-specific patch to remove -Werror=deprecated-declarations
from CFLAGS to not block the bump of OpenSSL to 4.0.2.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...emove-Werror-deprecated-declarations.patch | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/redis/0004-Remove-Werror-deprecated-declarations.patch

diff --git a/package/redis/0004-Remove-Werror-deprecated-declarations.patch b/package/redis/0004-Remove-Werror-deprecated-declarations.patch
new file mode 100644
index 0000000000..3c33456d52
--- /dev/null
+++ b/package/redis/0004-Remove-Werror-deprecated-declarations.patch
@@ -0,0 +1,28 @@
+From b42c0326b542b0e5d29cbfef2ab08d0d36430803 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Thu, 17 Sep 2026 23:58:19 +0200
+Subject: [PATCH] Remove -Werror=deprecated-declarations
+
+Upstream: not applicable
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 205508596..4f31a3af0 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -52,7 +52,7 @@ ifneq (,$(findstring FreeBSD,$(uname_S)))
+   STD+=-Wno-c11-extensions
+ endif
+ endif
+-WARN=-Wall -W -Wno-missing-field-initializers -Werror=deprecated-declarations -Wstrict-prototypes
++WARN=-Wall -W -Wno-missing-field-initializers -Wstrict-prototypes
+ OPT=$(OPTIMIZATION)
+ 
+ SKIP_VEC_SETS?=no
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
