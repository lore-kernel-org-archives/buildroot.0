Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D754CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5340C81291;
	Sat,  3 Oct 2026 08:46:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SVE-xPvNWozk; Sat,  3 Oct 2026 08:46:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 81CA281222
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791017186;
	b=SCA4K3eWjFdfA3ARMek0WVhkfVx3zZmc6I9BWHPMI5wi2ERp0abqAKfzK1dn7Jm6AnCc
	 tZl0GcrsVuEZMNK5xS/59juyiqn6xFcI7UpjIGSzRHQJFQ6P4YdOhNE3SIfMFLinMeNur
	 iJpPVbILnmLXj3eigVDyr7VGQVnnmLCinyHSXvxrSC98lKtJY5nISC8FMFJD2gBZv0IyH
	 oY/W6vBkpE5vbHHnG8G5xeRUphvJtf7krWxqMEfmUdg6nm/RN6WMN4cRdNStYMGFNkEHk
	 /ecFOAVtrDKT39rxOoQc6hOkRERj/2W4ZLFfqz7CcnMqUL7+ZmWnesBJHLjdhaLxvKQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791017186;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=nDfg12l3rHNtbEK8Bh0Hk9Umjuh55qAPKpOo4JfVpLU=;
	b=cmQhVtvQ5S3OrOv64CyI+Oq4N7EvdPr4wBCQ++pWk4PHM6RyZXspoyOBe8a1W+0aiiU7
	 i+HauQRhKnl6KGufY0sCEN+O+Vi4D6Qh5jfYcqdLwIda68TJcBBdRsdFJrN5Hm5+lcGSJ
	 s13mBdm/hcePxd/RdudGu6QYyHIGPC7YZ+426M3kkYo5p6W3bNZyuTPwHaXko1cpj1P1F
	 eYl67f++J5/Rp/2vsl74dzU5zdsgGIXrTOhw1oQbVjRCPYkzJkuIOEJGKD61tifj0B/wo
	 m/06maOxkPKCCzM5WtLawOnP5zVLWC8BVlbLpLAzgFp9YRoRtn7/ZqepMbt54pnz0eA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791017186;
	bh=nDfg12l3rHNtbEK8Bh0Hk9Umjuh55qAPKpOo4JfVpLU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qHk9DnsoIxIF9ultJpyni2x7CQ2nmz4vjNYxSFEejvg5kGQgQ7xAGW3TNAIYxhqg6
	 Kv5Tfx/xa88JlE19ixDCdllhQAHIS3DiSw/62bMxcxhIhhxwq2nkDF3MudEWN7cdnC
	 ZNknzNvyggvnru6HcXz787XmYXwB0G5WrPMi97jLmtI3uFWuS4J31GDtkW68k8FbVb
	 6lVLd9qRZW3YtIZM6qPGGxjL+dmtbnt9LGM/7kCKlb/NLlZQpwcNokq0HwdQjZhKF2
	 EmPnbxfAiiSYL18z3xmJtM4KThZxc8zw462q75el3687kOPw0eFDXuVHBSkXFLfBd7
	 IN4PQPd5sPcJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81CA281222;
	Sat,  3 Oct 2026 08:46:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B737B2E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:46:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D08C60E3F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:46:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xb8_wLNZt3mr for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:46:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D0E7C60E1C
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791017164;
 b=X0MuRYdqu78ixhfae9NrIi7gLwQa6QxhEJHAYvZ/SgGYQW3EcoJgx08LegcfJTL9yXr2
 0eTt4lMmQJLqBuS57nHg/2jrQ1YU6ZMxJQ8euMu78cz175pC4ewBxfINvbSqt1inAKgSl
 sPEvyNaStt1yMoklh0N+xud6jVCPcxhgc5iGX0aoww8Ts7I7biJudXin0OnBsXBEwYnct
 bhz8HpQTj9ZGFsnxTkWWqTMvYlClfT5OH6c0PFpReGGZ28QrC9PIuOs12k2FQ5oVMBW8P
 yhwdveKV7Cnwo0q4aqF0k87TahNJxhtI9tfjIlFQqpCSOEcq/6M33wAemFJkVD8gmWQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791017164;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=8brkZ+HImdwRY0mvKyeD2b8iRXljQuKpeMUf51cKfhI=;
 b=PQqXpJOhfuzfXF3gcojsrqXtmYFQ0t2sYIgqzhyEDrv/3PgKK2rGkTIc7xieNif8LmIY
 ReOTwsvz0gdSXVMBWjuwFIMxbyHpChOKmvrFC758OJvjxOg1OLF/qm5jnioUf6jE46ccC
 Vq4MWtOAuKESmuMYAI/76gnf9LlMuku89ceFPc58+fao4AYXpMGZt/vZ2Qjwc+QxhahC8
 LJ2AbRzMceAh2tBxaawSm3+lvqQ/gwW/psFxtstyKhO7NapjP0FhAFW9r1ZtueMe+RxSp
 mz1697MFcNaUb7e9ivOWRex/YzKuMWOykAOBGbo7VFMyGCJJsf3Tlfq9MrU3Ft2SNGQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=DWP4FlQr; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2b; helo=mail-oo2-x2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=DWP4FlQr
Received: from mail-oo2-x2b.google.com (mail-oo2-x2b.google.com
 [IPv6:2607:f8b0:4864:31::2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D0E7C60E1C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:46:03 +0000 (UTC)
Received: by mail-oo2-x2b.google.com with SMTP id
 46e09a7af769-823d139c181so487633a34.2
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 01:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791017163; x=1791621963; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=8brkZ+HImdwRY0mvKyeD2b8iRXljQuKpeMUf51cKfhI=;
 b=DWP4FlQrp2YhqQfGEKfMYyr5vldQjnGRezqbOAw/NtL+MQT5lmMTEz34GAOTC3P+S4
 Le4SvtOjy/mgttYrZ6jtFgsT+dYy+Sn7K0nopgPseSsP8CRudjF9V9bAWRql/OXOg1XN
 H/Fgvca1QaZTtciQ8bb7EkLcYjA9BOMqjmdd5AGAw0JnUQ1PfmMYN/jcoNq0Dav8+jXB
 TJOPBS/FBwuLKdsqyqNgX6cNW44+f9xIbZbS2fUxfZNpASLPPpQrRbDmKW8cuPtbQ0jS
 RwjlJJ3KOdppnFr+kUk34wQYAzAVpzL7cQbuALrXatlme7zQrdQvvSswWv2saVNILmt9
 eT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791017163; x=1791621963;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8brkZ+HImdwRY0mvKyeD2b8iRXljQuKpeMUf51cKfhI=;
 b=csgEtD1R/o/yRdTaOnZNqOwNymUEmGvgz+OeF9ss5MDvI3NiTHsKKRZtsDG59Klf15
 xbcCelXU39LMozSp7WJYJVYTMQQih/e8HoT1izn97p5kXsZwVXq457qwhSrHT79tYY5Y
 1nWhKWj98uEXD4O94Es4htOnmTfdig1xi5zmGFDRuR7w5PAfSwljM+FLWSzGnCyK1nGB
 whzmOCDTanynDWO8hXx7DitFGmCZjhYl0c4LaOg6uVOTz77YXrjPsjVkuvqC50GwjqJN
 h+hLR4/LqtX8wS+QpL+LTj4r2ks1rpC0Vr3LCQrGeOyy7Y/7FuySjRD0sUeV5Ly/7l6R
 irKg==
X-Gm-Message-State: AFuF++kJ6Ean0bsXp9sz21cqOgwuV6THaGec+jMMLG3mSkR4AWSowbEg
 GTXed7p978kzxqyYP6kHnj+aSu/Af7OdR+lAu8gWVIFm/zz20uN9vdP8lVypCw==
X-Gm-Gg: AYBFou0aemxx1jkklRApmWc+EOv+NhHgQag8kDKFERYV06xBbDZbtm9OTyu0giNRrmb
 EOfMLT0hSAfVmHBuTNsFVyk71piRhVFL1/rgxtsJjKoR46ipTqoPWIfoePTMs07kpDd4JWKdfbS
 mWHWdESaxv03gZui1Z/H2xR85Sxn0kWID0ubC7QvrIamiDZ/d/i3c3zE56c+vY5TMlcn8L19nf2
 2CZ2F3TRouOit8dHyVOdXh7zCCrsx6qZNaQhYEEeTMj9iz9NZQDGxjkr/MC5Htjr4mrCok/vMmk
 TnJLiO5q0z6sTrovQyJMg2VC8YPRM+677477Ggt8wW5t0/wZvCWaLoPXpnr+x59g43xHQx6sGDr
 bG4/lxnMikDFj8HblSIB5K4JunYryXT9LUbd/su3mPxNDcJHVIn6zOVEk2pwUBgB3ybv/8CW0Uf
 5P9FbQ2QOcPz7UGzlUbQXC0m4EKBIia2/RSwvaAABJegJbiRO9wFzw5cEr71vVXN8TnIFpkPXxl
 Imy2XMOMsT+QzFtWjzUpFJo66jvvZb45KJ/FPQSDjS/RWhVpTo+ezO86nxWQ1doYk+zTtl6wTba
 XEB1RxoUHLqW0pRqW08cz9SrkDnDG9wMQTmUzdhOhxC3djDk7b7myTl3fAklIfOhpu4MPVR3d7r
 wA1IuVExkKt9GBKVhPRmXeuTFx4XZufa2xkGlgpE18DCFxQX8TlZg
X-Received: by 2002:a05:6820:a50c:b0:6cd:3ffc:ad01 with SMTP id
 006d021491bc7-6df3554e7cemr3434137eaf.81.1791017162861; 
 Sat, 03 Oct 2026 01:46:02 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82273e27adesm5208385a34.0.2026.10.03.01.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 01:46:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  3 Oct 2026 02:44:20 -0600
Message-ID: <20261003084453.545653-35-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/scons: bump to version 4.11.1
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/scons/scons.hash | 4 ++--
 package/scons/scons.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/scons/scons.hash b/package/scons/scons.hash
index 3a8a942ee8..56f9f1db51 100644
--- a/package/scons/scons.hash
+++ b/package/scons/scons.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/scons/json
-md5  37ad818d24ad2f44d6bee5b0f3838706  scons-4.8.1.tar.gz
-sha256  5b641357904d2f56f7bfdbb37e165ab996b6143c948b9df0efc7305f54949daa  scons-4.8.1.tar.gz
+md5  c382470963a5a836e45972e61f0f038d  scons-4.11.1.tar.gz
+sha256  4210d1a80a62e986029208117991b6347ccaaaab37b67463a3ff31ee065dc487  scons-4.11.1.tar.gz
 # Locally computed sha256 checksums
 sha256  2f6ac9a1fc98394d18b80dba9bedb9d5626006d44db3fecf7cf3e21cff7e8b1c  LICENSE
diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index f1f76f38a6..d9a38c0be3 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SCONS_VERSION = 4.8.1
-SCONS_SITE = https://files.pythonhosted.org/packages/b9/76/a2c1293642f9a448f2d012cabf525be69ca5abf4af289bc0935ac1554ee8
+SCONS_VERSION = 4.11.1
+SCONS_SITE = https://files.pythonhosted.org/packages/42/b9/b7a5c88f348a0c34594d88100872c55fa1cae863ccb222c1c438341b5503
 SCONS_LICENSE = MIT
 SCONS_LICENSE_FILES = LICENSE
 SCONS_SETUP_TYPE = setuptools
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
