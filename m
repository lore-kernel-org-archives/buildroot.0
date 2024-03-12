Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0B8C54E58
	for <buildroot@archiver.kernel.org>; Tue, 12 Mar 2024 01:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62037819C8;
	Tue, 12 Mar 2024 01:08:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1FT2Dx6nIQJo; Tue, 12 Mar 2024 01:08:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B0D681951
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B0D681951;
	Tue, 12 Mar 2024 01:08:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1CD201BF95F
 for <buildroot@lists.busybox.net>; Tue, 12 Mar 2024 01:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A4B78176E
 for <buildroot@lists.busybox.net>; Tue, 12 Mar 2024 01:08:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EtjkW9vkKnjw for <buildroot@lists.busybox.net>;
 Tue, 12 Mar 2024 01:08:50 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=jeremy@jeremypeper.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3D3268176A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D3268176A
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D3268176A
 for <buildroot@buildroot.org>; Tue, 12 Mar 2024 01:08:50 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-7c842725564so81883339f.0
 for <buildroot@buildroot.org>; Mon, 11 Mar 2024 18:08:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710205728; x=1710810528;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=We+Hy0PT7JOeHqbB4DGGMY0jDGpv2KSPw+4iooWFQKU=;
 b=PHJWKsxXDQTxiTeS5TgXx4aKkHnF+6oSlZIu+A/6ttj6vwY1NUOT2mkFhAZjF6NfS1
 DkHrrjYdMLCREKvuHlunTv3P8VSbHPCMpoSPU/HSp6nWlK8qoGgjH2tYzevQiz8nKCiz
 zYaARt3m6a+0jNLHxQkFLaLQFxLta9lx4h/5k5cihISpTBTcmGEb7xmQxeq6LQXweJOn
 TeL/PucCR05dRBb8fLdIy/AQO4Zjqjr3fWhzFgPk+NI0v4dubYu1jpXRcYcrUR/QRYO5
 AO4BBIV5IQv0dMjDT+8mvxwNNlY1gIu2RPu6h7xRyabiU/0frqpln8lIHfpPrlMr6FN6
 D0kg==
X-Gm-Message-State: AOJu0Yy1SSb2V7nU2TDAPbkuW1mqRcc4YZ2K1naFsnjQW1cf8+e7KgbL
 olc4um1E41OqKXrTwZMdrQKkoAmrTwY9+/qCbAO4Ba+zvQuwjiQM/RskKpmApo6fjsJshPSiINf
 F4Q==
X-Google-Smtp-Source: AGHT+IHfx1bYZ/aozjHBFbOdzRGhexbDUVYb4QrH/QorkJuAh+pzegqTs5F9xDhT2sX/VWt/nLD6SQ==
X-Received: by 2002:a6b:cf0a:0:b0:7c8:4208:9b30 with SMTP id
 o10-20020a6bcf0a000000b007c842089b30mr9605460ioa.7.1710205728595; 
 Mon, 11 Mar 2024 18:08:48 -0700 (PDT)
Received: from earth (97-127-36-49.mpls.qwest.net. [97.127.36.49])
 by smtp.gmail.com with ESMTPSA id
 m20-20020a6b5814000000b007c8adc92f27sm1501000iob.41.2024.03.11.18.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Mar 2024 18:08:48 -0700 (PDT)
Received: by earth (Postfix, from userid 1000)
 id 6DC461063540; Mon, 11 Mar 2024 20:08:47 -0500 (CDT)
From: "Jeremy J. Peper" <jeremy@jeremypeper.com>
To: buildroot@buildroot.org
Date: Mon, 11 Mar 2024 20:08:28 -0500
Message-Id: <20240312010828.1955076-3-jeremy@jeremypeper.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240312010828.1955076-1-jeremy@jeremypeper.com>
References: <20240312010828.1955076-1-jeremy@jeremypeper.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jeremypeper-com.20230601.gappssmtp.com; s=20230601; t=1710205728;
 x=1710810528; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=We+Hy0PT7JOeHqbB4DGGMY0jDGpv2KSPw+4iooWFQKU=;
 b=Awd+DSsusXnv0NgCA2zewi6hMafl2rLSXU3kiFMKhP8i7vwG5+V977GcAgRDVcUtv6
 Y6YF0TkCjP5uymHE98bu14iYDvylisDAP/VoYfrP9b9uyMc2le4o97eR4eAR/dAhGkDW
 R5vOol9KbVbRG67RC1vn8RVsqSv6wINO5ae1x3r4jSVjCHvitXMOHXfGT4MWKoXYdvLo
 zpyaT+vgU+HdtHk14x/fPLpcX66ANcoESUQJIqS4JYwZS4L23C1Qu8/v/ArMH1jDTR4b
 SQL38OkOs1iVaCBVZ2djchm8O7zZdvGbvJEbGFuMj4enVRIno7NLG8vHGnmqfJZwsoi5
 t13A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=jeremypeper.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=jeremypeper-com.20230601.gappssmtp.com
 header.i=@jeremypeper-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Awd+DSsu
Subject: [Buildroot] [PATCH 3/3] package/python-rtslib-fb: 2.1.76
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
Cc: "Jeremy J. Peper" <jeremy@jeremypeper.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

bump to latest version because previous version did not work with python 3.11

Signed-off-by: Jeremy J. Peper <jeremy@jeremypeper.com>
---
 package/python-rtslib-fb/python-rtslib-fb.hash | 2 +-
 package/python-rtslib-fb/python-rtslib-fb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-rtslib-fb/python-rtslib-fb.hash b/package/python-rtslib-fb/python-rtslib-fb.hash
index 3c2e39ff..39c390ed 100644
--- a/package/python-rtslib-fb/python-rtslib-fb.hash
+++ b/package/python-rtslib-fb/python-rtslib-fb.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  9f581c4bcffebc60be236af8a6ebdeccdb66d0435eeb04ab1b743c170b95d046  python-rtslib-fb-2.1.74.tar.gz
+sha256  ac15c113d09209c7b0d14d94a12ed88205a7c2feadd1096f573049fd737f7e74  python-rtslib-fb-2.1.76.tar.gz
 sha256  5df2a0d87d6c562f0ea11c688ac52532aa28d744cabc7994ff0537f64b3b3320  COPYING
diff --git a/package/python-rtslib-fb/python-rtslib-fb.mk b/package/python-rtslib-fb/python-rtslib-fb.mk
index 09bde874..6396d26a 100644
--- a/package/python-rtslib-fb/python-rtslib-fb.mk
+++ b/package/python-rtslib-fb/python-rtslib-fb.mk
@@ -6,7 +6,7 @@
 
 # When upgrading the version, be sure to also upgrade
 # python-configshell-fb and targetcli-fb at the same time.
-PYTHON_RTSLIB_FB_VERSION = 2.1.74
+PYTHON_RTSLIB_FB_VERSION = 2.1.76
 # Do not switch site to PyPI: it does not contain the latest version.
 PYTHON_RTSLIB_FB_SITE = $(call github,open-iscsi,rtslib-fb,v$(PYTHON_RTSLIB_FB_VERSION))
 PYTHON_RTSLIB_FB_LICENSE = Apache-2.0
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
