Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F0CC61D97
	for <buildroot@archiver.kernel.org>; Wed, 22 Nov 2023 01:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D224C40425;
	Wed, 22 Nov 2023 01:41:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D224C40425
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m2zRXRophPKw; Wed, 22 Nov 2023 01:41:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 116C840925;
	Wed, 22 Nov 2023 01:41:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 116C840925
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EB6141BF3B0
 for <buildroot@lists.busybox.net>; Wed, 22 Nov 2023 01:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C249A4023D
 for <buildroot@lists.busybox.net>; Wed, 22 Nov 2023 01:41:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C249A4023D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EKgkXKrp4Ozt for <buildroot@lists.busybox.net>;
 Wed, 22 Nov 2023 01:41:22 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F061401AE
 for <buildroot@buildroot.org>; Wed, 22 Nov 2023 01:41:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F061401AE
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40b2a8c7ca9so9503455e9.2
 for <buildroot@buildroot.org>; Tue, 21 Nov 2023 17:41:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700617280; x=1701222080;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YjPDO9J6LcUCP8g8IKZhlGe7Bhu+eo4Dnb5kYLDr8BI=;
 b=HAhF37thX647s4RigI427bX/A56GB4kgjOTqNBIpS8cyTlILH55QFbJT5oTluo9KSh
 KQ4lO8SPckua1LyofB5889hcxoSgZRjqsOSGa22jh5Wj8afbPiVLOyzEsn520ySXWsIK
 fM9+QnEo7m1H3HZJVTwRLPe4z0beJfmll6JvF0rdClZ0PPXC0BN+flLV/es0WHtqiLZa
 Uy8svCzaIDyL/RwddvdOrehp9qF1LU7Z4TIavBGG8+sozEUiv5tKjWT6533/dVU8Iuj5
 1/zIWCDGdv0YwJnFzk+6mB3CZ57lMTdIsA8dbWxtozPLvTxBgrAtwW+at2EgWKOdsGN8
 lgEQ==
X-Gm-Message-State: AOJu0YwVKOhhN/dFDscJoMAPMHhh7pHsZ2Sc5O15K2o+jcyPcXZwFWXs
 420YVF4r1PA4BFKwYPwDfSfaQcv7kJ95aYVjIeQ=
X-Google-Smtp-Source: AGHT+IGROAvGMQ32EFmrgiVdRhoRHWFHZUkS+bKz9T5QqoCH6ymTbtjgDGOMFC9BFpu6ScsOe2tYsw==
X-Received: by 2002:a05:600c:4ecd:b0:406:84a0:bc87 with SMTP id
 g13-20020a05600c4ecd00b0040684a0bc87mr658438wmq.15.1700617280194; 
 Tue, 21 Nov 2023 17:41:20 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a05600c4f9300b0040a43d458c9sm440753wmq.25.2023.11.21.17.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 17:41:19 -0800 (PST)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Wed, 22 Nov 2023 02:41:07 +0100
Message-ID: <20231122014108.2430309-1-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtone.fr; s=google; t=1700617280; x=1701222080; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YjPDO9J6LcUCP8g8IKZhlGe7Bhu+eo4Dnb5kYLDr8BI=;
 b=JAzZBndyhEEBRXpZpj70H+S2ZSBrSFeSaFyDXGudF8MhOdX65QlX9VYx8glOgaZonL
 72AEkUNDRLSrGumhJO3Tn9/Y7H+JGApdeSlVNfCdgDCtYYrY+vWkNI+2/Mue/Xq68W8N
 nmrGH5lj1cI8+aQlJ+UOJJfmF1O8IFqTOBS4o=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=rtone.fr header.i=@rtone.fr
 header.a=rsa-sha256 header.s=google header.b=JAzZBndy
Subject: [Buildroot] [PATCH 1/2] Revert "board/raspberrypi: handle dtb
 overlays for all variants"
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
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyByZXZlcnRzIGNvbW1pdCA2MDIxZjM2NzhiNDRkNDNkYTcwNTdlMzEzNWRhODQyY2RlMWZm
YTA1LgoKVGhhdCBjaGFuZ2UgaXMgbm8gbW9yZSByZWxldmFudCBzaW5jZSB0aGUgZ2VuaW1hZ2Uu
Y2ZnIGZpbGVzIGFyZQpnZW5lcmF0ZWQgYnkgdGhlIGNvbW1pdCBlMzdlZTVhY2RjIChib2FyZC9y
YXNwYmVycnlwaS9wb3N0LWltYWdlLnNoOgpnZW5lcmF0ZSBnZW5pbWFnZSBjb25maWcgZnJvbSB0
ZW1wbGF0ZSBpZiBub3QgcHJlc2VudCksIGFuZCBzaW5jZSB0aGUKdmFyaWFudC1zcGVjaWZpYyBm
aWxlcyB3ZXJlIGRyb3BwZWQgb2ZmIGJ5IHRoZSBjb21taXQgZmM1Y2RlZWQ3MgooYm9hcmQvcmFz
cGJlcnJ5cGk6IGRyb3AgdmFyaWFudC1zcGVjaWZpYyBnZW5pbWFnZSBmaWxlcykuCgpUaGlzIHJl
bW92ZXMgdGhlIHZlcnkgbGFzdCBhbGl2ZSBwaWVjZSBvZiBjaGFuZ2Ugb2YgdGhlIGNvbW1pdAo2
MDIxZjM2NzhiIChib2FyZC9yYXNwYmVycnlwaTogaGFuZGxlIGR0YiBvdmVybGF5cyBmb3IgYWxs
IHZhcmlhbnRzKTsKdGhlIGNvbW1pdCBpcyBmdWxseSByZXZlcnRlZCBub3cuCgpTaWduZWQtb2Zm
LWJ5OiBHYcOrbCBQT1JUQVkgPGdhZWwucG9ydGF5QHJ0b25lLmZyPgotLS0KTWFpbnRhaW5lcnMs
CgpVbmxlc3MgSSBhbSBtaXN0YWtlbiwgdGhpcyBjb3VsZCBnb25lLCByaWdodD8KClJlZ2FyZHMs
Ckdhw6tsCiBib2FyZC9yYXNwYmVycnlwaS9wb3N0LWJ1aWxkLnNoIHwgMyAtLS0KIDEgZmlsZSBj
aGFuZ2VkLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2JvYXJkL3Jhc3BiZXJyeXBpL3Bv
c3QtYnVpbGQuc2ggYi9ib2FyZC9yYXNwYmVycnlwaS9wb3N0LWJ1aWxkLnNoCmluZGV4IDBiZDdi
YzNkMTcuLjczMDI2ZTU5MjIgMTAwNzU1Ci0tLSBhL2JvYXJkL3Jhc3BiZXJyeXBpL3Bvc3QtYnVp
bGQuc2gKKysrIGIvYm9hcmQvcmFzcGJlcnJ5cGkvcG9zdC1idWlsZC5zaApAQCAtMTQsNiArMTQs
MyBAQCBlbGlmIFsgLWQgJHtUQVJHRVRfRElSfS9ldGMvc3lzdGVtZCBdOyB0aGVuCiAgICAgbG4g
LXNmIC9saWIvc3lzdGVtZC9zeXN0ZW0vZ2V0dHlALnNlcnZpY2UgXAogICAgICAgICIke1RBUkdF
VF9ESVJ9L2V0Yy9zeXN0ZW1kL3N5c3RlbS9nZXR0eS50YXJnZXQud2FudHMvZ2V0dHlAdHR5MS5z
ZXJ2aWNlIgogZmkKLQotIyBlbnN1cmUgb3ZlcmxheXMgZXhpc3RzIGZvciBnZW5pbWFnZQotbWtk
aXIgLXAgIiR7QklOQVJJRVNfRElSfS9ycGktZmlybXdhcmUvb3ZlcmxheXMiCi0tIAoyLjQyLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
