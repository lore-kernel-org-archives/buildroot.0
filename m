Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA85AD1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 23:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FBD340667;
	Sun,  7 Dec 2025 23:33:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h9Dhc_1SkoDP; Sun,  7 Dec 2025 23:33:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2105406DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765150403;
	bh=r5ONZFd2n+GhCWsUwhB2ynKbb4iC3vrFppBfmExUVpw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SF288J2Bw/bMYMyZHHadbcq7yDnS3ptTgGa9pyGVWFd4ASPigrIEpFag8WMMHSi1W
	 TySXpopqn9WWcSkewQLuMinR+b7q+Y/RhOwVojt4mhF2B7bm+jKvaicOIwVVUMPW3p
	 Js50FuRW78N5+gSvqri+fZI+R7P2D8i47qe5YbHSZcDe0KGm5O0e4oJAKAfKOhjIfq
	 mp4r66aHCas3qrZmNZuAEu3grLXruqWhkSPCM8zUc4LDyeKshZQ5afYWTZ6ABm++j+
	 aa4eoJWLSXhwkFu6KiNjPyipfNLTEc7e9YM14qROintY+w9OsmISaTp6tBw/xZHDQ8
	 B6hE6ROJaG/Tg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2105406DE;
	Sun,  7 Dec 2025 23:33:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A9FC92CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 23:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90AD74023A
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 23:33:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id buoFErpJV1CM for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 23:33:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com;
 envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CC7C040054
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC7C040054
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC7C040054
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 23:33:20 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-7bab7c997eeso4565402b3a.0
 for <buildroot@buildroot.org>; Sun, 07 Dec 2025 15:33:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765150399; x=1765755199;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7yfmsrqhAT9I1/V44Xtj5SRRk8yOt5DORuo/+IzZhBo=;
 b=ThqzD81D0vKI4ycdVE1WISlYwpS0QBiDnpDW+guEqQ7mFQmcpUXCPM3nzKl2sU8WdC
 WOzn6SjAYbOaOPkwQp2UzIgD4Z6GAszS1gYmPjAZb0GNOtwKZXsDvMeLrzyFP52dth3l
 eiwNUQmaG42IhXtKMZRdG4+hRysfx8HwtehftmBiKEHymI7yEQQy42+vs6Kfg6lzviQc
 nwc4f54vsIBIzO/T7uIdG1kMDP/8pljL8MLYzEhO+3YZis7rtoNm5uYSK1Gf7I6l1YNi
 sIG2P2sFuQq7bflELu8BdvWZSbZ+N5knhX6jVxDgeCHAazOIULqXnb1GX+ExksUqqfKo
 zQcg==
X-Gm-Message-State: AOJu0YwPaYJqmqoIJBA/0cgMJHEBfkGQUUTAyJpShL7EAERCab4fR8Sn
 NXn4EWANCwdR9xjjTBgSf4rPXQzyVHijVMS6iDUVLLHZ1qaLi9vUj740pQUT+kqy
X-Gm-Gg: ASbGnctls0vP/Unr+DC/hpjaH+DZ9mBEYyy7dchwKzEruhyIpu7/cXR7cVEE6A+7xRq
 LLU3pXboRdoqeGMhS/r6WEwiJ//bZu2UkvW9yTCkOTtD0QP2H7dtl2g4AaUMqDIfsgDS1aDBhfg
 qa2rUc/rfRVgv0aVndc5nKNUvNzY7K+mE8WoCmZhMTgbDXRhlZt3vt9u8nfTgT0eztH47he0W9A
 8XP9seAPbKpLjAEAC5EdcYC0UMJEIE6DPNr4J3yj0l8E5UJVOfhrkYOtJS+CmZsB47k0JBbdIN6
 YmI/JVyT4d0JjdJisvN0YIXfEjNJjTPkKLWUtZiUlC5nb0YY0PD+erNtG27mAo5MqSSUZNZmDle
 aKzq94cHIZuanpOKVbG+WraGrLysY3sPx7pg3OI2PuwVk8MCeU4k7AqrYOPNGhCqiXfw3t+jo8K
 FA/p6+wAzRbKE=
X-Google-Smtp-Source: AGHT+IEomA6M4ayvCUGz5BVSeJx9fT0gMTn4HtAaM7z4eNs8ed78KPt4kWoZ+mzzlrU6fwV+gyQeKQ==
X-Received: by 2002:a05:6a00:390d:b0:7b8:8d43:fcd2 with SMTP id
 d2e1a72fcca58-7e8c1755b45mr4593275b3a.14.1765150399532; 
 Sun, 07 Dec 2025 15:33:19 -0800 (PST)
Received: from archie.me ([210.87.74.117]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7e2adc5bf26sm11169754b3a.39.2025.12.07.15.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Dec 2025 15:33:18 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id 91F34421DA1F; Mon, 08 Dec 2025 06:33:15 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Buildroot Development <buildroot@buildroot.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>
Date: Mon,  8 Dec 2025 06:33:07 +0700
Message-ID: <20251207233306.10587-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1443; i=bagasdotme@gmail.com;
 h=from:subject; bh=PuO8UnIOyAhpP2rnAyIzMI1jpntW+yC9xN6fjTI4Qqg=;
 b=owGbwMvMwCUmqirOYPHY4znjabUkhkwzvk1lO9sWr9/bYON678Uvt/MffhkVVZ5XOSIgrvXKz
 Eqk8mh8RykLgxgXg6yYIkv0Wtldxrx7L5nFJBTBzGFlAhnCwMUpABN55sTI8LN6ev0HYe14Di/7
 4EaBreYX1wl9Xv532rfi7SGMMYnroxgZOvOt+ori9JXNbgg5Hineskum8vvuIOeNKodrONXfsnS
 wAgA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=5BAD1DBA330DBDD2365C60721525170038E348E7
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765150399; x=1765755199; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7yfmsrqhAT9I1/V44Xtj5SRRk8yOt5DORuo/+IzZhBo=;
 b=CmwHZidqh8QhoEqUYT2bt+pmwJ+g92t2u6zaCvJ7CxehJLhgOg8diPLUmyAd2dcoU6
 7iJ7cLwn+ayOVJiEI9IuzclCTZ2Ou67sQ6iNOgULgua5X+8Df17y8fKRULAQIig0MWzU
 4qND5abN+Asc+QRgcW+/8foi3yFJDZvrPur2c6DMYf9jEJNa+mGcOkAtl8iOn/+YFBYZ
 Zm4RrDMARHs0gkaMy7wqV7nwYtcSOXvCBIF2JXPLPe0nfROKsU6SvY3jh7n0VwVLw3yC
 kSu/VRghcEsQE7WKpAMBgrk8QemajnDhTc5dF0xraUsTaGX45Kd6YPu/DoH/DCnDNa6X
 4pxA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CmwHZidq
Subject: [Buildroot] [PATCH] package/git: bump to version 2.52.0
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

Bump the package version to v2.52.0.

Release notes:
https://lore.kernel.org/git/xmqqh5usmvsd.fsf@gitster.g/

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 19b212cd0d..3dcd1d4437 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  60a7c2251cc2e588d5cd87bae567260617c6de0c22dca9cdbfc4c7d2b8990b62  git-2.51.0.tar.xz
+sha256  3cd8fee86f69a949cb610fee8cd9264e6873d07fa58411f6060b3d62729ed7c5  git-2.52.0.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index a01e7c9d53..bd1c1eeb61 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.51.0
+GIT_VERSION = 2.52.0
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+

base-commit: 7bd818a06726b3bde02282bb9ae382a8e3af93be
-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
