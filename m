Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC1FC46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 22:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AABE40020;
	Tue, 26 Dec 2023 22:47:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AABE40020
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I-tYNxemhskW; Tue, 26 Dec 2023 22:47:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD0874192A;
	Tue, 26 Dec 2023 22:47:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD0874192A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BEA851BF2AB
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 22:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93D41825B9
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 22:47:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93D41825B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XP-N0tK2qK40 for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 22:47:43 +0000 (UTC)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0642D82591
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 22:47:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0642D82591
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-336990fb8fbso3126124f8f.1
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 14:47:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703630860; x=1704235660;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oEHUNWk38Su2EDiZGMfkFNXyGiVLfCgl3F4AQMbY6o0=;
 b=URvKhdh2m31I5Pbf1c6rItWE6s3YKQHSrvk1MMpx5tx0+3KsELjYJEeEQ6fUqttApE
 Gdth6SegiWUhjVJLs+IIqfDx19/dhbWouTzPhyvfhoTUxi7w1EorYmibq6edos3drjzO
 ytyjEOFKxqNzmlmNuiKuGqjqWWbzbIpKYUlaZVSY6VhfY+ls79A9U5PGfsxZn7GN+eNe
 /Ksu+Ge0w01VOfrRUCfckXpy2tEoqFVh7SxZERJipD4GezowHRjKNiCAezO2MHNcTnJL
 Hp8Jct+B7llHOt64izfOUZ3h+ntjT/5b89+t+tOQ527cKnLFic4SeI5NvuWyX3Fwfh4q
 SZ9A==
X-Gm-Message-State: AOJu0YxSVlSe4On75d6t1q4AUddr2Bpqr7LbssvKEUHEuSFjFH6kCsO6
 prIDjsioWO1cr77kEugBlN1B1MeNsy0=
X-Google-Smtp-Source: AGHT+IEXSU9uxnK+7h9+ujAncV2rbbZu2Lu0NP103iPb/rZx1PWitsI/qGq+zlJHmCsK6pPhMYHi4g==
X-Received: by 2002:a5d:4ad1:0:b0:336:6db9:6a7e with SMTP id
 y17-20020a5d4ad1000000b003366db96a7emr3396579wrs.8.1703630860117; 
 Tue, 26 Dec 2023 14:47:40 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 e18-20020a056000121200b0033660aabe76sm13369791wrx.39.2023.12.26.14.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Dec 2023 14:47:39 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 23:47:33 +0100
Message-ID: <20231226224733.2073200-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703630860; x=1704235660; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oEHUNWk38Su2EDiZGMfkFNXyGiVLfCgl3F4AQMbY6o0=;
 b=XdbHXhDRwTR+mmXrC3od1b+e2MWaNSqKbUov+A7QlG5Wm6cCGFo//0ysbQqivwQ1sL
 Mq9CrLxohcdKQ0KgCebMBYebyHpqVa+orR1jxD6t++bgE4LJcIUVnHPiagZXPStOwNQQ
 R1lhtgQdTkTpXYNecTz6wTUd52EPDa1G68SwIdkamtccA14UHR36PlzTVeW7zT3SzLNW
 W3PREvYHoD7IcOS9cIJxgXlto7zYxbX5xtBkrQ8dYEPdgU2BbuoG/14tYGCkYpKYJYSF
 Irihf98Pgne66AsMKLU9uRL/VEaPaHprgiZ9IWhwCUjR+4nutu9zbTzwjxlZ0mSHn3qd
 JEjg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XdbHXhDR
Subject: [Buildroot] [PATCH 1/1] package/wavpack: bump to version 5.6.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/dbry/WavPack/releases/tag/5.6.0
https://github.com/dbry/WavPack/blob/5.6.0/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wavpack/wavpack.hash | 2 +-
 package/wavpack/wavpack.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wavpack/wavpack.hash b/package/wavpack/wavpack.hash
index 021703df74..2a2317a86c 100644
--- a/package/wavpack/wavpack.hash
+++ b/package/wavpack/wavpack.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  ef749d98df46925bc2916993e601cc7ee9114d99653e63e0e304f031ba73b8e6  wavpack-5.5.0.tar.xz
+sha256  af8035f457509c3d338b895875228a9b81de276c88c79bb2d3e31d9b605da9a9  wavpack-5.6.0.tar.xz
 sha256  275d65ec11a78d552d078b9c26d950e3075892bca895a415ceaaec33bcfabff9  COPYING
diff --git a/package/wavpack/wavpack.mk b/package/wavpack/wavpack.mk
index a3d952e29b..b393a75197 100644
--- a/package/wavpack/wavpack.mk
+++ b/package/wavpack/wavpack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAVPACK_VERSION = 5.5.0
+WAVPACK_VERSION = 5.6.0
 WAVPACK_SITE = \
 	https://github.com/dbry/WavPack/releases/download/$(WAVPACK_VERSION)
 WAVPACK_SOURCE = wavpack-$(WAVPACK_VERSION).tar.xz
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
