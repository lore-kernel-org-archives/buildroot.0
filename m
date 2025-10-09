Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A19CCD184
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 15:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DF5080D12;
	Thu,  9 Oct 2025 15:24:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bG-HmqF2Zlpb; Thu,  9 Oct 2025 15:24:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 862D880D1C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 862D880D1C;
	Thu,  9 Oct 2025 15:24:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1691021B
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 15:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 000F4410EB
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 15:24:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3EUZZwJZ9J-G for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 15:24:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3DF4840F28
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DF4840F28
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3DF4840F28
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 15:24:29 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-793021f348fso1026596b3a.1
 for <buildroot@buildroot.org>; Thu, 09 Oct 2025 08:24:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760023468; x=1760628268;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mvOmtEU6OCIncdjl1kVnC77oTGCuzxXxIL+fPIsBIGU=;
 b=g+BXYXgmX8ETiQB6S+Ud3ELhkUZYjJfrsbf0vGlVvNccrx1QefPmZJtoTb05yEuoZa
 zMVXY6jahdEFlyBSepc+AM9zjNiVQoqVVXEYkDWbP/DXSH2VlU2xfUpOwKZjDQOMwWlk
 B9VS6CgXZXf/KAqgZyMqx2mEsAivMU8W3a4PnqKtg2RlcEujkOxhjjmW/DETwRvjEsVk
 dxlUBot9ODd65FnYWn+2ZyiRp8LG27I1wlKmEhS3uqChXMiLs8mk7sUfCSM9cyit1oTK
 KZ/cyaYy9lGvhKlzlQ8gF6rRY4/UDA8cxF7+DO5wG1Q+JBJefTcoFQdjt/wixvkOHSya
 flNw==
X-Gm-Message-State: AOJu0YwPpgMKalClEaNd/hzk0V/Rugz+8hI1LGsnwFgu1K+5y9lDh7e0
 Zrjw2X/ipyrBj9t6ZLxVSjJ0E8gmSBTTE/BbAyoVw8zSnlpc+qhgIHGeVX77FA==
X-Gm-Gg: ASbGncuIQHh9btKNn2Sn6sanRm/ff7CjPZeSXM0QeNOL3WJdEo0R4NtJwft1ZR28AD7
 vmkKsoUsxSljOGrdX7MvDNFqvyDe9brWbF75+c6B/f3Sw5O2HrkIrdz45Oxt9EMBvN57/fmr3j+
 oaDLVqwxwYyS+2+Y5cVTahTg5KTycJr04EDCP8bRUMvz9p1QW4urrNyfiiYnHGozfbCNYYythLW
 yVjLhyBzquXAQtfc41vP0BYRz7y1D1suBYGnDlQtP40ggriGQE7PzcesAtkuafElxgvtXA11Orf
 sXLhUIAdqWY2Tbh14dhwqUhBscOHfjatqGQJoyaZYUY7HNiigVuXemtUfZYdfdoXrw4G5qvlfXb
 n9c3EW22uIlyH1chRHsxt1CPGpOkJ5h9q0ePY0GkjMAo=
X-Google-Smtp-Source: AGHT+IG4Lc+iJHtZq1m9FUYhrCaOsAYNCcM4GQEHDxH9dTi3yC6jZwfGeGrWsEy3Rft+oAKQ/QB8lA==
X-Received: by 2002:a05:6a21:6d84:b0:2f1:302d:1275 with SMTP id
 adf61e73a8af0-32da816d51bmr10916763637.17.1760023467778; 
 Thu, 09 Oct 2025 08:24:27 -0700 (PDT)
Received: from localhost ([66.112.214.180])
 by smtp.gmail.com with UTF8SMTPSA id
 41be03b00d2f7-b678df24ac2sm6168a12.22.2025.10.09.08.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 08:24:27 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>
Date: Thu,  9 Oct 2025 23:24:08 +0800
Message-ID: <20251009152409.186241-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760023468; x=1760628268; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mvOmtEU6OCIncdjl1kVnC77oTGCuzxXxIL+fPIsBIGU=;
 b=RtSI/8EnmdBwezuPlZtzW1ZQg8iqyYM0g3X08byJk6Ao8RjxLrCGnXFZ44Y28hl0hN
 qsziHVNHH9BBcgHuibpIwl1dnkyRPEfDm/e7o3+69RI3JuF8rPM9VchyIQ0l46pLk31Y
 +2lOc9MbqyXg9wIHJi2ZXTX7G2x0mHabwrT/NdBFa3nIowRqlPrGHZLVeXjwYaQQpsyj
 EWZv4eA/tFstgxkiA6spvNGk3O90KlwbYrGefE9oNyk5S28AqNF5Dsq2k/l44twQbRTF
 5uciyUogllTxXu8ABK5P4wvNS3g0nnUwTENKqaIm3ygk0nOyhQ4ozy5K/svJl06pnrxH
 S8xA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RtSI/8En
Subject: [Buildroot] [PATCH] package/paho-mqtt-c: bump version to 1.3.15
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

Release notes:
https://github.com/eclipse-paho/paho.mqtt.c/releases/tag/v1.3.15

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/paho-mqtt-c/paho-mqtt-c.hash | 2 +-
 package/paho-mqtt-c/paho-mqtt-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/paho-mqtt-c/paho-mqtt-c.hash b/package/paho-mqtt-c/paho-mqtt-c.hash
index 915897d082..8ca597c4f9 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.hash
+++ b/package/paho-mqtt-c/paho-mqtt-c.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  7af7d906e60a696a80f1b7c2bd7d6eb164aaad908ff4c40c3332ac2006d07346  paho-mqtt-c-1.3.14.tar.gz
+sha256  60ce2cfdc146fcb81c621cb8b45874d2eb1d4693105d048f60e31b8f3468be90  paho-mqtt-c-1.3.15.tar.gz
 sha256  83bbba033dc985487e321b6dfde111772affb73460be48726299fed3da684b1c  edl-v10
 sha256  0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  epl-v20
 sha256  bc0f3f447097eb82a29ad6c2f4929572bb548b6bd4c9e38fde1bf131a771b7a0  LICENSE
diff --git a/package/paho-mqtt-c/paho-mqtt-c.mk b/package/paho-mqtt-c/paho-mqtt-c.mk
index 0486d2ce80..acff7d5cc3 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.mk
+++ b/package/paho-mqtt-c/paho-mqtt-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PAHO_MQTT_C_VERSION = 1.3.14
+PAHO_MQTT_C_VERSION = 1.3.15
 PAHO_MQTT_C_SITE = $(call github,eclipse,paho.mqtt.c,v$(PAHO_MQTT_C_VERSION))
 PAHO_MQTT_C_LICENSE = EPL-2.0 or BSD-3-Clause
 PAHO_MQTT_C_LICENSE_FILES = epl-v20 edl-v10 LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
