Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6CEC982D6
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 16:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BED16085C;
	Thu, 17 Sep 2026 16:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CfuECiwes0xk; Thu, 17 Sep 2026 16:06:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 50AD5608A8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789661166;
	b=Pq8I3C5mMy5LFVDCWIJGww9NVFyJz/pHuZ/4FanZAvCqxJ1QseiIe8reuO6ZTw4Scl8q
	 D6NXsdYJj3qLQppQOQhUJ72yImZPMMGZ7o2fspTM4WEw1iEyhlXIUdtmEZjE/CNRmtc3l
	 hSV2BIIIFi9q4avRHNDsRGois150OgbAhBJLi5+v01kqgk2berT17rHeQpJQ2h+hOzNxs
	 bdjym4bQBBDl3vco82G6JETzK9iJDAQTwQ0le3k30pWoULOzG7CxvycrR27b3ZDlNv5QZ
	 jPcBwK61j6ZBf7OoPVzUkxd+gvi0P0CO5JW70JD5ZlIs4FF+Q8bki/kFD+SmygJsADA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789661166;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Organization:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=kbLK5vxW9mURLZzhbTKYecZAYTVRDq4Df2fog+8ydsg=;
	b=rWaneRYhBOmjAI1bhbdXfLjcrxI8P/p9JXmWdscmRXuuhzxmy2pcc5WdAr9jWuZa5eXD
	 Yi3Q/5rFAEfaYKYIy919OAyS6iKI4z2TncLPeREXXE93G4NVh2Sd+kl2c9MS0RGkXeUtN
	 UXMwfLSW2MdOwaNbfEZTEDbUGb9473/Hb4PvX1mv3Ur32sbOwheoZDuX4g3lJoZnwP7xJ
	 67bWhLFaAH3IiSuvHRjpv1PCnwhdb6a+IcjFL2xIvbVdMV2aJksdHrmmk+TXobg4aOX67
	 O5Ebifp9s/HmRQeed0iOi7ptjfdYulTyDdbtwIHv9McwDxybYyjaKMiY+QXcaTPkJ+A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789661166;
	bh=kbLK5vxW9mURLZzhbTKYecZAYTVRDq4Df2fog+8ydsg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=epWJA71oC0iu8L9rg1Jwo+5vm/8+4mIczk6uDGb2SRZUKIIKWme02ZB6dn/zPEHT3
	 ZxYwj+whUvorcOcMSdZrhFenZ3rAdUwFTgSTjtaVMZa+6w0Y7JCzldSUJdTWe7K1+k
	 H4nek5Pu65Ozfv5lMEKzB2r6AqKaICLfL7Jgyq4EDfjWK5qJUBOcyyc/sRj1jVM+BG
	 d3fin8rX43vq96Y9TjQ94wxPWQ0PWUlAk+uRRGPEqz/KcE8EMqgcry6C2Y/FPOk98i
	 Ok0jUrwna6eZb0pvMRl+e8Q4pRSWHt0ZeSKJNJ9xOOHaGtVwwmXeQk9wtJZqmMUUOB
	 mjiFPmht3nxyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50AD5608A8;
	Thu, 17 Sep 2026 16:06:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 862B023F
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 16:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7578E8109C
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 16:06:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rn3qH88JW_AJ for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 16:06:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 583CD81094
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:34::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789661163;
 b=e5CoAM1BIL4oFc0fG4gJBUwtGk+YgcLkXFYl5792SqvNfDtKyiY/DHjPrCyklWWYNrsw
 KGAiHS36wfzVd2XZsdU10ywDcZj/rLto9Dy8FqcMsk+VX1rURPU94JtHxKdPlFlGnhWFI
 CMo2bdRyxzEgrt87WgFp9X3ZnbO8ooZjGl+gbOCdfDf5Y+ocYP3Nm9IB2qi08Pq536Sgk
 pyVrFScbHiV10fy7zihlBoc9ULbAOUu69w38Xsgsoz0y4lm6BRC9WttOFjGqywCyhHd52
 GrB9wpmSEAWcPfUPM+gMlg8eOOyA3LzqRSAMOwdCtPtEEOR/cnE8w5OKTgXof1dP+4Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789661163;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Organization:Content-Transfer-Encoding;
 bh=X7tF4D/o8dBUD7+QbSZc9GRSJrvhNk4y2LfSv+D9KoU=;
 b=rDXyyaI5G1q0DBFa3Uzk/x3e9F1kWGKnZ0vMWQXoTlv56vqaRz88Xnf+bWlonb3sRaEm
 BxcUmmH1hWxbLA+YV2nclKgDkcjZ6+rtHk+8rEBuSNbUMjTMZFDS2vH/fBK5NveASlIHE
 7JJvmg+d496Mr5R4cFRTWOHntdWdu8Shbwg4H4cOf9ORzx0nZS6LZNRS/FRWS06ntYval
 XPxZPlT65AN/7p6wdzE/wpdzEXV5NE9VllfgQ29jr7VdYcSZLzJMAZuBzUVNEe6/uewVX
 27cJdi7woerqfUU99Uw531M6m8grv73o9vYJTFqbN4Z/6cD6SDk7WfGZXhjFzk/jiCg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=KgCK3qzp; 
 arc=none smtp.remote-ip="2a00:1450:4864:34::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:34::10; helo=mail-ej2-x10.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=KgCK3qzp
Received: from mail-ej2-x10.google.com (mail-ej2-x10.google.com
 [IPv6:2a00:1450:4864:34::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 583CD81094
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 16:06:03 +0000 (UTC)
Received: by mail-ej2-x10.google.com with SMTP id
 a640c23a62f3a-c254f55eff0so161659566b.0
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789661161; x=1790265961; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=X7tF4D/o8dBUD7+QbSZc9GRSJrvhNk4y2LfSv+D9KoU=;
 b=KgCK3qzpjzVAqUHu2ldGNKDpx/q4IGYBxmrLY8nAzOq+iwswShvKD1OgXV7nm5y5JX
 cAi9tb5zi+JKoeQrbujCsrsEGQucea1B3vwrJO5VOdA0iZLyMTLckDG4qrN+DK40JZsD
 M8FFyPZh1M1t7JDaD/6stUBNB7FVEWQoLm9miRQEANua9iX8C8o9XbClqIBH0KDzxJs7
 62dw6/djLV8xxz8DlVWM5XnxYuhOjw1cHTiMLLzwPvw32dElnQUjvVs+m2dhujV9JyM2
 aRScg0IsSxSktpj+c+qXDQF2KfWbIsjOvVkcADH/NsBDgsp1kq1tGX89GXv3/BN/OOfh
 tHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789661161; x=1790265961;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=X7tF4D/o8dBUD7+QbSZc9GRSJrvhNk4y2LfSv+D9KoU=;
 b=A5nBFeI1yZ3D0iicqtOyfXeLFTWHEYkqyImf2572K5l+q9LOvRX9JdCJE1GbWE0CNx
 3uwkhxkB3HHaoHDXbP3R002fs0nQqL4yQk5lL2Ke9yvMoovyAMuShqvtq9qiuQwd+vOx
 Kws9ruEFgy3m45u7paqcsgaen/KizAn1z9KSoMnA7iJMNW3blBYax52c1ONKhpzfCXjP
 mERB/uOjbftxw4FCviw7vh7hqCxe5TI50nOx04Vaf91yJU3GoivzlF87f2q8uqC5f3f3
 BF1PTHugTO7bPQ48sT6rZzf3iFIXR82Km4kU5AfyLB/5nR2JqE42Cu5fSLbsqUxIM/3Y
 zNIA==
X-Gm-Message-State: AFuF++l28bs/kw6lrzxah9/a6saXbKvHRwcOjXg59v+Zcm2OIyMT54dE
 c0CrodM3+DjAxK9c9l0fAF5MUlhtvyzxfJ5RqH4n3gPpHIg4ZCAnSCRg67oRbeIy
X-Gm-Gg: AYBFou0ZhqICGMv9EtJohz4vS58JNw9cdDjqAfjT5q/yy1x5TNyym3BbZNHikJG3ysu
 Jefl3ibD78EV0HPHcjf6pv/oSQmoT+4arIXGER95r/hBrvQmuahIrtDJCx3vXqeUAl1WrQ18r8l
 hZTAIxlZOeUqll7Ag0Dfz2h1+EdsFhYSdLci0A1/kdu57sUQsmpN7hp8hQ904yBoyR3lpUeCYV/
 +b/tO4S7AdTK/FfykBs55rDHtvvHJ4Ibgrce89qXnyI6l7auxvuIadq6zf7xQzEnOHHJfMDHlly
 rwvszUbt/BoV6hk4iQYD72j4tgzo5gCILsRxCgl/W2l+Lpuz79CNgxRzX8ysA58TjUtb+0oB86R
 HwPsfvfq5iuwbllkWsZPhdqMtxt5idchH3LNyaMlTvION0YHXff4QH0tnIu7PtVoGBwd07cQDbQ
 4BCVMyPqO+RfkDQq9Y5WpIsEzO6+aw2HIDTbR8MITufg4hCxnjAn46iO0esOi5vJHfFITrj1fFA
 4S2M+Iorop3HGBtFa+kOFIDyw==
X-Received: by 2002:a17:906:f585:b0:c26:1691:b36d with SMTP id
 a640c23a62f3a-c29e52da9dfmr515582166b.38.1789661160807; 
 Thu, 17 Sep 2026 09:06:00 -0700 (PDT)
Received: from gimli.. (h-158-174-22-6.NA.cust.bahnhof.se. [158.174.22.6])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c29de6903e2sm314189966b.60.2026.09.17.09.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 09:06:00 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>, Joachim Wiberg <troglobit@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Thu, 17 Sep 2026 18:05:42 +0200
Message-ID: <20260917160543.243218-2-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914103020.3485030-1-troglobit@gmail.com>
References: <20260914103020.3485030-1-troglobit@gmail.com>
MIME-Version: 1.0
Organization: Wires
Subject: [Buildroot] [PATCH v2 1/2] package/lldpd: security bump to version
 1.0.22
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

https://github.com/lldpd/lldpd/releases/tag/1.0.22
https://github.com/lldpd/lldpd/releases/tag/1.0.21

Fixes CVE-2026-46433, an out-of-bound read access when removing the
VLAN tag.  1.0.21 fixes path traversal vulnerabilities and arbitrary
file deletion in the privileged process.

GPG signature verified with key AEF2348766F371C689A7360095A42FE8353525F9,
LICENSE hash unchanged.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lldpd/lldpd.hash | 6 +++---
 package/lldpd/lldpd.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lldpd/lldpd.hash b/package/lldpd/lldpd.hash
index f3cefe7b73..46f2b9b476 100644
--- a/package/lldpd/lldpd.hash
+++ b/package/lldpd/lldpd.hash
@@ -1,6 +1,6 @@
 # Locally computed after checking gpg key
-# https://media.luffy.cx/files/lldpd/lldpd-1.0.20.tar.gz.gpg
+# https://media.luffy.cx/files/lldpd/lldpd-1.0.22.tar.gz.gpg
 # using key AEF2348766F371C689A7360095A42FE8353525F9
-# gpg --verify lldpd-1.0.20.tar.gz.gpg lldpd-1.0.20.tar.gz
-sha256  61b8cb22d4879e68f7825a2fb8e1e92abb4aba4773977cf0258bc32ed9f55450  lldpd-1.0.20.tar.gz
+# gpg --verify lldpd-1.0.22.tar.gz.gpg lldpd-1.0.22.tar.gz
+sha256  9587940ed2314a86774c5499f3dfb13a8eb86232a62d243a83a1f09886848e03  lldpd-1.0.22.tar.gz
 sha256  0e96a5aea65f16e2239231ce4ab90497f8bc3bb8fe6abe9299aade4726ff7c8d  LICENSE
diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index a3015e9e7d..f0cbc7e436 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LLDPD_VERSION = 1.0.20
+LLDPD_VERSION = 1.0.22
 LLDPD_SITE = https://media.luffy.cx/files/lldpd
 LLDPD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_CHECK),check) \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
