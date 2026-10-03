Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B72CA5FE6
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 21:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0167860E91;
	Sat,  3 Oct 2026 21:09:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CGiKUFXnjYnW; Sat,  3 Oct 2026 21:09:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C19D260E86
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791061741;
	b=DLVZ8OO8JDiuxaF2KL+YYcdjZKRDRa0N1mHfuh67ENJ6NQKvGstg1mzjQmvFh5jIYfXg
	 r5bxow0gombCTn0oIPjWY0hxZMiNCkbkbc/YetUrGRq2T2qP2nTifeIkH0nxwLwd27vsm
	 1+yM+WLWp1LdkvzV7sJmiBVa/v02sBk+o2ty6tB2qEFAyMRMUOGukIdt1V5OhptjDKtUQ
	 HopZzHrN2PowqhMn3fNxT7oq9EMcp/v574xGNSM6Sht7FtX4wYYi2v8rnf9l0Nks6mqLh
	 xxpIm1GBev7QRZ57UErfpRZwjfvvxZm+jC3jkFRjpXFQ57WEpZhhYuO14rKgzTvtKGg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791061741;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=wjOTZSdudLPa4uU9I/J1dvg0ioRWEQ2TVdPvXps513g=;
	b=I3CEN/VBDWh4JWc6XEOb5pTCnZ5lAEg1jTpCzLuVMxR032fmq8eNq6DWzOlnCHtJscSq
	 zTc00wk6+I5yZrhvkVQfOLrTvqvJZ5oRvgIsVQyzmg7OsuoxIScPdDGWjVIBUHPQTlMKd
	 dBZKh4kK2BTJGV5BoxhgnO+OfiAyF+qBhMajJbGVpS+MBGkgKP7aZ7Fuh6Th4Aws/VJWm
	 jO24vdHSIG1zhOzl6tDcMgz9wzZwjcbIsbFJLKPvaDwVt2EDRVkGUe6hxObEeo+3kw82g
	 +eYNIDGOuuN6K3pe4PxBFw+AbwFTeT8nARCbeudm7J7t47/OXYaRQjpUcJFcGroYkeQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Pk03FjIB;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791061741;
	bh=wjOTZSdudLPa4uU9I/J1dvg0ioRWEQ2TVdPvXps513g=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=YkZswHLWpROAJqybbJ2Fn6oTsoog9AFucqHQy1CNCU0H9YcZfVc1g+kDVbmkuop0l
	 MwBqFAlrUJqOF/n31rKB3eH+FHpAU2IfH9XSkpTGH/1+llJj2QVqa/YGzEwQp/F9nQ
	 T9FHuOx2dNdq9mgFicVZf+ZCDVVlPQTI4b30k1axEO3IfLQRlowqDWfICsbfTlNlPT
	 mXltqqHc27umsCakhhOCtLVlf0NsMtytnJzHK6Rzbkf86boak2v66zZtr+F78j/mvd
	 q4u4l+zK1ZeYwNy/wo6RBMD1QmX7ObMMO1YU4C9pXZ01+FL9hEnNdY3sD7TiSrF5g6
	 5LBMf47aUD93Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C19D260E86;
	Sat,  3 Oct 2026 21:09:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 615A91A6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D1E360E6B
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:08:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D7q0YAOoceSr for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 21:08:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 868056066E
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791061733;
 b=DzWst6p8BruUvaMvwFh5M+LjAUoiYXgkPRYrnF3QCjL1x9osp72zpWqLLLXbTy9RUNQq
 v+agVNbZ5Ww7sFbDqQGET7l1Zaf2R0Dck9EUwKt7L+iAjBj7dqomyF95PyfsT2As14XUb
 ELPYgo9r57ITczWJTIg8JHZ40XTtsNEE8auTeBzNaLbGLMrD9B98QXXgaUrKdIsLtZIpk
 XbqGWiLy3CEwZtCXJi+KsV8npHAXG802THKRXfxAp8iaVG5h6OYfn23tQT5D96N6zYz9A
 Rw5iNhaSdT18AoLvX7dhrR9WqkAzbNQTYGiMZ7dc9HregVMBKeL4dnkrmuhi57ksE+A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791061733;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=T6BQaXlKvtDaoMmx+K5OgNy25eirVGbuGjZ5r+IKx34=;
 b=ggrB9l9wV8DU0oyuylnVv61QT35QPIMKkz0Bz2VYjD4ETpwoa04TuBw4rCO16CGxJJGD
 nDqJBvgHE7Hd0UBqbOX2VSLdO8mvikIVZoGhCAZOtmNW8BP5Ca3ZYDIs6qkFMCDYybMeN
 zX0dfOS+laR2Tdh/xTFqOIc90LU2fhoEUEmbskplqgf/Rkdpi+lbr5dWijkyIKn/Ju3aE
 x197DnX6eVO3SDIclIt5MFInfq7xjKzB41a5xug/AUzYaE8ary6qoDJpKAw8W/V7XxE8t
 AU0yItl9dBLYLom7ROLGsTFRZehABx5MswpZdwpWGz3wRbvk/5GVDuNEPwZ9YPHC5bw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Pk03FjIB; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:31::f;
 helo=mail-oo2-x0f.google.com; envelope-from=james.hilliard1@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Pk03FjIB
Received: from mail-oo2-x0f.google.com (mail-oo2-x0f.google.com
 [IPv6:2607:f8b0:4864:31::f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 868056066E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:08:53 +0000 (UTC)
Received: by mail-oo2-x0f.google.com with SMTP id
 46e09a7af769-81b15bca7dfso725296a34.0
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 14:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791061732; x=1791666532; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=T6BQaXlKvtDaoMmx+K5OgNy25eirVGbuGjZ5r+IKx34=;
 b=Pk03FjIB9YcX9o5mRb7JKU6GdulTXjvHuRUmqnXZKxS1dKgG3X6I5nx30dYjc4KW3V
 0vN+44us0bdUf++qcjhlrCwn7PKzj2eUkIokk/31rRp3AhVQm1dwChl436vE4KD5SQGE
 IvlpdyOSwOaKsD9Cz3oBjw1LAOWy/7hS0i51YOe0tK+kqVC4Gx7Y8HRnEI9zpLYd/8Gb
 gE8hdiYXc8fBx9ebUTyoVuRH3r65fx+FA/1l6NxaGbSqNLYM0udGYJQtoPVeCB7T16c9
 WjkHTkaKDwqLLfWp54LTOBvERJ5PcjKhSy7S7y+rvbrutwk36AY87fbnKsgyJPftRO9m
 0Y/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791061732; x=1791666532;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=T6BQaXlKvtDaoMmx+K5OgNy25eirVGbuGjZ5r+IKx34=;
 b=k77sul8MI2YmhaxCys/obiv7GjtTW4WBerDJbNeBNHvEd3k6/O5Sp9OVtQogMid4KX
 fmagzsH/RwoasWHnMZoK//+liJlHWNWbpvL0vQqafP8y3Y/oQRWA2tR3XJmIa12kDjXD
 wXMenvXw2rZEsEPZ5OuPKrLSw3IdHG35lUWuRdAI5Fh0R1FNU587YCfAS5S0y79yjWaq
 ZIRmiaNjStQJ5Ytw8coENYxAlOwBOzfwC2kqp8HlOGLYuC54cRm4M4KH6L6UwORMW56K
 rfTfF9BWoivloP+RhDy2VTq4xsm0DhUAIIRx1Doxv8YFgEJoAMLvwcM0vnbKYB6mZsuY
 xgbA==
X-Gm-Message-State: AFuF++nl3lNZuUVZ11STX2BMk0079xhqAaXuy7ON88oeNtal0Enoen/R
 Ulc7rsgtyGuuSyjFwsAcysvyMnbuWM9Vd8iqckHuwUSDCqwu00nm+6b4jEZqRg==
X-Gm-Gg: AYBFou1PHt9oh1ay3Z7kJYlg4q0LmK4wj7gOoKAtK//cQ3bJ7xefC81Q1/DH5T1FTNK
 YwEAr/px3e+H9/HIdCTxzOaIQ/BTiMdGLwzIKZv8G3TILukaS0xHLF/Ly+3x7eoMaoY+AioInPl
 REHq8urIno8AvV8gSMrkrWUJ7RdPwOULtOPcTqMRB6zxFvrgTY+JqXnjJn0mHxEoEP3XngQGLi7
 PDv7GDS5/BsaytxI3ADwtVn6px5daRvivZCn4WDTt8AA/kFeP8PhAmmF767jyfc/SYZrAKFnunK
 1J2Fu70+ONp3yazecQVopKarNjyDYoh78zM3ZJFdn2j0AVLFDBVsppvw3JvcjBmoai7QZEWydzC
 YdgrXiPOmE/OAy9pbHIcAZOVOcj7QZ4CYCTPMjD8eKIJk7LQNYcoqFsG9K24BnoZFKJ/Z1atP0c
 l2MEPUUOKA8aqR5pOqvkwlFTQciE6qE16Qx/svxhjRVDfoMLmZq0WNbaVbkMBbqXofyNf3trk3h
 o8d3yCaoC6ckiYJnVHO2rzQ9Lomds+omB0K3+Qa46jH0E6sHUGH14Qo8lkCZFfA1eMBLdIW4gdQ
 Czay7zR/YQDqLj+22UGGSbWAxJDqP7NZNjDy5U49LEJb/szg8xljNpxGklFtRX2hnTgW5H8SbVJ
 PpI4HUuM7hOiQE0WqaTLdNcr3Jao+LQoqDtc1cOgfcUWu+efPB+0b
X-Received: by 2002:a05:6830:4890:b0:821:1471:74c8 with SMTP id
 46e09a7af769-8228286dac4mr6785747a34.16.1791061732193; 
 Sat, 03 Oct 2026 14:08:52 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82409c586d3sm3119917a34.11.2026.10.03.14.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 14:08:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 15:07:59 -0600
Message-ID: <20261003210833.735937-9-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-librt: bump to version 0.16.0
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-librt/python-librt.hash | 4 ++--
 package/python-librt/python-librt.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-librt/python-librt.hash b/package/python-librt/python-librt.hash
index 30ab711042..850d8cc3a5 100644
--- a/package/python-librt/python-librt.hash
+++ b/package/python-librt/python-librt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/librt/json
-md5  25cc9fb4e0c47582ff60ee5985cacc6d  librt-0.9.0.tar.gz
-sha256  a0951822531e7aee6e0dfb556b30d5ee36bbe234faf60c20a16c01be3530869d  librt-0.9.0.tar.gz
+md5  d5f38ab06cf4e27cc33a94ba86553d57  librt-0.16.0.tar.gz
+sha256  ac38d6d8d66bf3d744148dbbc0b8e193e195a51e364ed55e224631f5721891fc  librt-0.16.0.tar.gz
 # Locally computed sha256 checksums
 sha256  88f9e379c684580053c58e75e296ca2eb243b6edcc6e5357f247310e96eeef8a  LICENSE
diff --git a/package/python-librt/python-librt.mk b/package/python-librt/python-librt.mk
index 264fe83281..615ef880ef 100644
--- a/package/python-librt/python-librt.mk
+++ b/package/python-librt/python-librt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LIBRT_VERSION = 0.9.0
+PYTHON_LIBRT_VERSION = 0.16.0
 PYTHON_LIBRT_SOURCE = librt-$(PYTHON_LIBRT_VERSION).tar.gz
-PYTHON_LIBRT_SITE = https://files.pythonhosted.org/packages/eb/6b/3d5c13fb3e3c4f43206c8f9dfed13778c2ed4f000bacaa0b7ce3c402a265
+PYTHON_LIBRT_SITE = https://files.pythonhosted.org/packages/04/f5/9dc696772d241814bacac7880bac32f2930b5a6ebc1f85317b83161a011c
 PYTHON_LIBRT_SETUP_TYPE = setuptools
 PYTHON_LIBRT_LICENSE = MIT
 PYTHON_LIBRT_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
