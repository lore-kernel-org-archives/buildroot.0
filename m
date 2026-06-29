Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5201C43602
	for <buildroot@archiver.kernel.org>; Mon, 29 Jun 2026 07:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A35B460E14;
	Mon, 29 Jun 2026 07:42:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MA2-VkS-f4_h; Mon, 29 Jun 2026 07:42:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEE6360B23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782718973;
	bh=jT6eBxpAjfgWTap6FLWADArvzDKFbQXDh9chpgnKHI0=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=XhqqNFXVQyE6jXoRqsDUdLM6jvmUv7oNyEOwDUP8qYmZzlzgS1Mi1XsL58p4eYpSe
	 S7/NS8NEBCxxd0XNDQaWMmPGUzC/PFmNX3cfN1Soy943/a6asxQvLc3rnabMm9bZSe
	 /RluFyEIN0sY6hDxrehtOWyAIjan32rJdmjjfg3fUI5sknJARsCSGc897HM6ixh7Ji
	 SE+hA2TSigpBGKpcHhCu0ynWQxjNNHeevHevvX1aQsXl2ZeXMpfLoYITUvaTfftXje
	 kiC1CEiLzbUMiXXHS83RUu+VmsVVv4Douqx0KQRoppoflIT8NG76YbkZjE/MHrYPa7
	 hyR+0eXuLCPiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEE6360B23;
	Mon, 29 Jun 2026 07:42:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BC512F3
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 07:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DA88816E1
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 07:42:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zuhsJd8AOW9Q for <buildroot@buildroot.org>;
 Mon, 29 Jun 2026 07:42:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EE5478169B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE5478169B
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE5478169B
 for <buildroot@busybox.net>; Mon, 29 Jun 2026 07:42:50 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4938d60c035so13689345e9.0
 for <buildroot@busybox.net>; Mon, 29 Jun 2026 00:42:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782718969; x=1783323769;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dRo+FLCPSy77NppOc12LJkd71yZvh6ob2ChcA0HI5UA=;
 b=Jeyydeuk70tALuQyKfRSpXsFYCWc5Nh2HsNRoE7VxTUqNi8UsU2ZgE5RW9+oyjRyWy
 tu5EEvPqKEu3Ik4hGruCSluTm4v4TeLUbg8XTyiyUk4zyHvfdor5NI2OaqP4ZOtz5ofl
 fEGIwb3kpnRlT6QkragH04caczndl21wz2o6TkYsxEuI5GuLabWLyEa60HcopWE0K5g1
 YMz8+9gaCiCj3MvaN4Z1ApqtuL5hsFA2Aj7+HfqUKeDbQsof+pA1860z3m5W29D/3+WH
 yWzUxXLH21pa7APqLEIIBbaxfHbSwF0BYgG5MYoCHhNP14BP92KWnYbQwWRe129sSrlK
 D6nA==
X-Gm-Message-State: AOJu0YyrNxCZYqLfCM+kop17UYTOGNJqjZPJgXwJg1o8/GUGiE8Xn8PI
 G2vuO/D1I9zi+m1LQccKXRqVu4ohMJ86Egq6JE9M5msEDda/Hl8Tl3HvzUAUy7DjHyf9dt5hhH6
 5d6uLUu+t
X-Gm-Gg: AfdE7ckQXK6RQ6gtqWNIT/Qmr5QzAzM27I11lZT7vz4AtbkXLfiBgwLyKQYRgyXeg4c
 +gFk/U8goSp0JOSJvLcNEiHnQxTo/apg7EzmAo+cHwd2EUF5k5Nbu3Fat0tEd9GLN9jPDyg9BFN
 MvQZVyO2JfQDStJJgHn5tRkGUvIqitui9oms8tCd7XXaE1EdiY+EDzK9mf+YPeSMENLqUtbE2D8
 adX7L0jwZWKHt2aF01O4Qnw636hdVn9jEgDo/4JdfTRq8M0Cegr9XU5XXLDpq1bcZH5CnuzUPrz
 O+CEKJwYC1ZPk59QWD0oie9voHaY/0qzt9Bqww8dyOa19sJ0r7AzwVlVZG/nbWpJlVfU44hzWZ3
 4mTwZnOrZquSPrSZBj2nnMOKmh9PHqv70rdR2gEFQhw2E2T/F+89pZzEs9SOXfvNN+apaBdEHK8
 gDXeN28yzEeOJKRgyAOuwJidnRJrpHUHXbRMy85smga6OVIjaoNA==
X-Received: by 2002:a05:600c:4f92:b0:493:aa0a:4a04 with SMTP id
 5b1f17b1804b1-493aa0a4b8fmr47921245e9.9.1782718968057; 
 Mon, 29 Jun 2026 00:42:48 -0700 (PDT)
Received: from vm-2404.. (165.186.66.37.rev.sfr.net. [37.66.186.165])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49269071e49sm299747395e9.10.2026.06.29.00.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 00:42:47 -0700 (PDT)
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad@gadz.org>
Date: Mon, 29 Jun 2026 09:42:42 +0200
Message-ID: <20260629074243.301420-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1782718969; x=1783323769; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dRo+FLCPSy77NppOc12LJkd71yZvh6ob2ChcA0HI5UA=;
 b=Cb8njDJv9KttUYsvm38NmibVMjdzo5Ngsh2Um7eXc/3b26YZElP/k9lxG3x1G+b5zG
 ewDQOBAuV5b6eJl4IRWYDulkpfQePE1EJ0655qW+IsjAczwqIQze6KGbunS5Kj8mmmZc
 Y/B2MAl6D6Qv4QlImX/pA54Uek3acLRCQd0ereFULfF0rhXZClOOBiio75jAqZZRp3zF
 IoIkSKBkdpTETD4Lrx9VrkAfSumpwVlZAYm/RvZxEUvEkGwF00UuOrmeWchJBe4CZ9qN
 350967eB/waguJ9C/aMa6CANJJrlCuuihiz8nSJAd15skJxIFXduAO66qtqOR/B3N6Mg
 NoFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=Cb8njDJv
Subject: [Buildroot] [PATCH] package/lynis: bump to version 3.1.7
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release notes, see:
https://github.com/CISOfy/lynis/releases/tag/3.1.7

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lynis/lynis.hash | 2 +-
 package/lynis/lynis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lynis/lynis.hash b/package/lynis/lynis.hash
index a8b1d87a0..682efb741 100644
--- a/package/lynis/lynis.hash
+++ b/package/lynis/lynis.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2a31e3e028d6b9f0e8f502402ad6752b069f9082893514c8c023962f5786b3b6  lynis-3.1.6.tar.gz
+sha256  48d829d0dc2c583a3e838cc09a7190b69a3af844bcb913c7cf9c0226b04b95c5  lynis-3.1.7.tar.gz
 sha256  57151f0fa287550534af08facb1c6693ca803ffa65b512da38b55c3130810bcf  LICENSE
diff --git a/package/lynis/lynis.mk b/package/lynis/lynis.mk
index d63018273..bda55a541 100644
--- a/package/lynis/lynis.mk
+++ b/package/lynis/lynis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LYNIS_VERSION = 3.1.6
+LYNIS_VERSION = 3.1.7
 LYNIS_SITE = $(call github,CISOfy,lynis,$(LYNIS_VERSION))
 LYNIS_LICENSE = GPL-3.0
 LYNIS_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
