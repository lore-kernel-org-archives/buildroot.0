Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9611FCCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 18:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FDB760644;
	Sun, 18 Oct 2026 18:25:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s5Qh_wz7YDr3; Sun, 18 Oct 2026 18:25:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3EF95606C8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792347937;
	b=Mp908JHAlhiMk58VG2uN6Q04nCh9BepU+5DZMs+3oV8Ucff+FuEaRB5+cbdT+lcaKtO/
	 mGsenBm8hys+8zoh1lyhy0REO9Jb/8TWo4nd0EUBepyXkBDzdxgGjxWLKg30C+c1nU/7A
	 SHhXBI4FUsnNsjAAtaHiMYz0MDxxDlyhNiAH9KGHVWXUZTgIXB65OOncQBEJWibz0i5B9
	 P3HnN+BNab/X07a8nt5oTQeLADOJ0BhbO+Beh8m75p0O2UA6fzDHNl1YCg120ha/FllgC
	 IAb5llfS2CSF2DexrKzmvLt5PAhlSASx1DvL5KtV1XYgL20Y+nc12rkeXPqk/FVaE7w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792347937;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=efPQQLdN4rtBEplO+AyOL9B9a0HefKZrjhnOhsiM6jU=;
	b=LF6tdUvY9pFmol/Rpbg5f4o1/yLll0N8B98YQIIqtEf9rwlYVwoQO2K5q9TPSHkPQu1G
	 xXm+LZoHoL9K82nbGdvj/lsbpA6/8HluEzSh97J7nRhaB6NsmbejlDu9sCJmbGx9+mAOL
	 sL8vJ4Jg8J6n+y0TvGZcTnCOslP2dpN/7KfcysOZ0wkaaCx/bPFCzoKrons3ImNkgIrF2
	 5qDUy1ujN+LLiiXzKLJtAWzroxJ4yIVLUKj2phxKxwpda/6cshlV5CODDxyv+u4kd+6Wy
	 /M+63R+1ym+PnPItfeSkt6I4JvxQOmBvp3G94CdV0HDCIQw2jY3geAJFvS3K5R9UfuQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792347937;
	bh=efPQQLdN4rtBEplO+AyOL9B9a0HefKZrjhnOhsiM6jU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=MexqFFXQStmh3oi7t/mU7PZH++6mWKAF4sSAAjUbOLczKvY790akFZNldeuM7a3nA
	 4EfM5j9gQKIh+CHlwJVqsLgI5pHQOm9N462bJ53uXWc9xh32KY+r9kCltmA9o7DC4D
	 66ifX5bAZCwruoIZwvJpLTqzenjVOJwSGcgqX4/zzlQpqycRfHYknFfMNi/5IH+nEN
	 0SY8v/MrF6yYeepkKjuF5Nqrelv70wYs7PPLN6lBHF/26JafCD2zsdGg2I48wSp8Y8
	 eeJ11ORUJaPfQhwCQ27kY+Dv0/1fnDz1bzY0/LUqQciN+MbbD41zu6QNOJbSWvd8/b
	 smLWLugol7XcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EF95606C8;
	Sun, 18 Oct 2026 18:25:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3184561
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BA3840707
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bt9tRtchPQBa for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 18:25:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2A510406E7
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::35"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792347932;
 b=laBvwkLStBT8JLqTHtTcWksnNJSCJwcukp/EX6Vy1wbiJUzUG0hBS4K/FV7TG/GcBvvg
 53glv76jMapRaZfrk8CkHP3hpV12T8+kncJJNWkeFTGlKKwoHS9Gm08SK99aDmDg9lHq7
 ECba9jif1GyIIu2hsGOaMlyXFntgdQfSYaElM9n6YwLpdxGWPto9kHOh17wGAx8iSculN
 FECpzTe0naZRStdCMQI2I05WO9EMn5k//d2BlAWaBrSE6sqkHTb3ji5hmR4ScPyNyTQIc
 awgnOdDAVDt51EuY7Qi/0g91HPGvQ6Xpc0WheTIOhLRe+yJeFRnRgfcxjfjdW4oz2fw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792347932;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=NrVEm2PbMH4myG9VcvrldKdbwf55j8x2vir1dnjPCtM=;
 b=Prca2eh28+8ReUKrPjaTY0FevfZN1aLA3o9zh8TLx486SQXAbuwt5ajjPM7/asHcLoIC
 CDX2RgmdWBQ86JC6LkNETN3FgknA9EfKb9zDC0mmLLyEY8kaxkEK9Ub8Wtj/oza9JXqOh
 9HiBxrj5SixEwO6zYL7gs6K5Ks/1y3p//OF7zJNXnUvNRT/DuIP+oCYb28zjOHHA3ahB6
 wXyxjxGWZOfQhQm4NHMiq4UeyiMRTv1Xce1CrcJLH9gxKlw+vhCnta6PSwwtHVHzMsg2M
 LbVFMjNuaQsdaTQYy6NGEJ+WR3s8XZEWcjS0qlTnNZqJBL81Ao7fO/hiedSsNPLr1hw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=jK31HHAj; 
 arc=none smtp.remote-ip="2001:4860:4864:20::35"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::35; helo=mail-oa1-x35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=jK31HHAj
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2A510406E7
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:31 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-4a76f63b243so844588fac.0
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 11:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792347931; x=1792952731; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=NrVEm2PbMH4myG9VcvrldKdbwf55j8x2vir1dnjPCtM=;
 b=jK31HHAj2qetKUJta1p68ZvoTlkGzNv1RpyiCwahaX8x+n6JoYVzjxZ+jiQUJoPeQP
 nf/kHiUXdH2MbD2ChmwfxHNDbOABQGwghEhAX0SNm+uwlDOT7pzEeVRyFr5OBiOl3GMf
 +s9lq9VKAP7mSJmS0hlh5WsJ7uSu0KtZIL5GB9Hak1mZ3WLOn1gqYLr2Z8M9qZWKFxoq
 d2/NPjHXBFbPj334Kjwye3ttQQI4nJuSLmFmwJcrNKb9Nj1VLNRuJ/AEceAMs9FyR7vW
 R8vLKsbYtpPazSMvQL+JrI45fQAl/ioTarmqSvJRTCqDva1iUHTjVYPTm2OtsLtbDN+n
 rRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792347931; x=1792952731;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NrVEm2PbMH4myG9VcvrldKdbwf55j8x2vir1dnjPCtM=;
 b=ClLIe27xS43xpEE73NN43vUv/HjZupGqM/7DMqBfSXa5myKmAh891dz8xBDtIdLo+z
 9Wzh4LMlc61ANQnX5gKOA9kCsthxZ2rO/bZDHrgI/7t2zpdEUFj/1xn0inDT5FnS1ZXP
 cSIqYfaeWqXLV8iazHm6E19MdfOChgTqe2MoxG137gL0WdkyyzVaRsEwPnguRoOWj0To
 9gLid0lyIW3cM+8HvVt8lrx9iMKG78KHL+yX+PhvN348PL8TklK/WBMOz/3cvx7DpflX
 292Oo9eCfYvj9X08wGMpogx/169oq9HaLz+9p8iyyudErVpxvbO39p6L2JhnytyD2Jph
 urkg==
X-Gm-Message-State: AFq9FYJSFjcWeMXU/37RFucUQpv3JN1HxnpwqMhpGH2aO/XpOB4VOubo
 QMX6qu90fNtd/MykuOMftVzFG/R95yaDEFOKTUyEvr8/sSyLHM1Nk+QQ2nD7Cw==
X-Gm-Gg: AYBFou0xlsvaprJH2wRO4pA38Jd8oPvJ7aeynPpmB0+JMOl6+frFo/ymdE74wjoF0Jo
 PrzoF/AB4zAKK7Tk6tyF9GmvCQDi9jOEu8ha1K3K/YwVODRlCsnFK5eO90x31cDN+D4S4fMSLaB
 AGUv5KmsBJw/R7WEQlbd6d1gpXVyy8y0QBWC8f5dOKy//jlCPV5L4oQHas/f2+y7oQQw7dB3uGW
 Lxwskp5Ys+FNW27nJNsxmy3SDDNwe9FeKVMEi8OP12QDGQMM+623o0sYR53j3/EbtMZdgD8Ka7b
 /oo/WM8QxSMSyPp1+iK/EZqGrQlazydQ5gnfYWMYOg+6ZiQ/TUIhl9y6iVNRX1SmdPL21Prjsxi
 eZKeLOzPmUEURf73BqPKELLK/nRX0j4ErPAzRKXSn32La/oxXBphi/0LuKxZr1AXqeZL+1uutQo
 PkBzy3sNT/nJ3qp6CruMZ5pg6heQY4tJjl15t0dVkphGxdwnURfR7gvlYqF045F5IIwj8MlWdxp
 KBNX0AWzq2kFVy9rl/A8Y2ARSSiWhZI5y+iC8vSKnzPQzuUF+TbSg9ZvQO2aXfcXjP1Ix2cEC9y
 B1QW7R7B1uekJ4U65YWfpJHaZVDZ03gkc5TJi5upeJ+l0TYyOGB/hb6NeHSGmBuFUzo/zxd6UmZ
 4MBtpVxbuOXQb5cIJRyhteiW49kYWll8n6J4b0QvW9Sc=
X-Received: by 2002:a05:6808:23ce:b0:4fc:32cc:6c0e with SMTP id
 5614622812f47-536f241da2amr5775943b6e.6.1792347930887; 
 Sun, 18 Oct 2026 11:25:30 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-5388a5572b4sm5715659b6e.6.2026.10.18.11.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2026 11:25:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 12:24:52 -0600
Message-ID: <20261018182507.536698-12-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-starlette: bump to version 1.9.0
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
 package/python-starlette/python-starlette.hash | 4 ++--
 package/python-starlette/python-starlette.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
index b6b013ad17..1794b6b28b 100644
--- a/package/python-starlette/python-starlette.hash
+++ b/package/python-starlette/python-starlette.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/starlette/json
-md5  ed1e744017cf7bcd9097e0cf7c0f7578  starlette-1.8.0.tar.gz
-sha256  1565dc0b35d5737a271ed1e0e04e949f4e81198799f216d2667b0a0fb9cf9522  starlette-1.8.0.tar.gz
+md5  b5dd1c0ce8c69609544f47cdc76417c3  starlette-1.9.0.tar.gz
+sha256  3d931de246ed870e35ce605974440816ef895e592f255d1396cfdf191d4c4318  starlette-1.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index 4c94f1853a..d9fc4a221c 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_STARLETTE_VERSION = 1.8.0
+PYTHON_STARLETTE_VERSION = 1.9.0
 PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
-PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/e9/0c/6efb252d091ecccd7d62048ae11f0ea35cd75a4fbaeea5e30f9c3bf91d10
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/ad/eb/4e197bf26b023abafc5e9043ec8710d7de0fcb032d0969045236d72aa0b1
 PYTHON_STARLETTE_SETUP_TYPE = hatch
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
