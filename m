Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF5FC3DA49
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 17:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54DDA40158;
	Thu, 11 Jul 2024 17:51:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fMwIxKcRMycl; Thu, 11 Jul 2024 17:51:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1EA340210
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1EA340210;
	Thu, 11 Jul 2024 17:51:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C7051BF47D
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 17:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 767736066D
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 17:51:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o4Ksyzqp4uav for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 17:51:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2B4AB60603
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B4AB60603
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B4AB60603
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 17:51:19 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a77d85f7fa3so180533366b.0
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 10:51:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720720277; x=1721325077;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JguE6JIRJemMD62fSbpQG2qsUI3x7O3V7PolR0byLg8=;
 b=vB/5hh5wBxYnHp+UYGUsX8Xar8yolpGoJjP7LjEUJb8cjbEYPBXDXFDkeGRKM2a1+S
 N+KFsoD4Vjx432qwZRiPDUkVgfU1v9HivKUyW3A4jm5UAUcv+xyI8d/7KBKu+lPWsIxy
 DEKsfkB4/+95CpBZsgSM54oAJdjTSZqNzr+tB+pHdfgKlqi9JuhVmYvu7LwR0u+9YBZ4
 wzJF3D1AN9LrJxgB8iUbZ1TY7aCXD7UblniBz31hueC6Vyk/RwUbwVuroT3fnQvo+MVP
 /K4VzYQknx7+uyPaiwTm4eYeBOys0xA2W7iUBM/1AWXTCCbaBTK9bABcN4PysidzdT6Y
 /Iww==
X-Gm-Message-State: AOJu0YxPoYV9Vs/xnrotnGIKG0m7+TDt6me68P7CO9jKWMX0TNTufsBL
 YvHBsx5De7L7dvT9CUR1uLSvz6hlT5zw3jAis0M+rshYIElRQcUjKDJHswM4xzy4AgI8S+l6Qat
 YcSU=
X-Google-Smtp-Source: AGHT+IE/nV9hgnuotUblpj6hI13oHhl9QyV7YBR7+7tBbLEEm/Vf9HO1//k/m5OSvDRNTC8CO6FYbw==
X-Received: by 2002:a17:907:97cf:b0:a77:e420:9e5d with SMTP id
 a640c23a62f3a-a799d3a44e5mr22821366b.34.1720720277035; 
 Thu, 11 Jul 2024 10:51:17 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.36])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a6e0633sm269905066b.81.2024.07.11.10.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 10:51:16 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 19:51:03 +0200
Message-ID: <20240711175104.2989194-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720720277; x=1721325077;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JguE6JIRJemMD62fSbpQG2qsUI3x7O3V7PolR0byLg8=;
 b=gVc7Zy/VTVCb4xSyW3GQJgzVRzq/ATcI0qXxXOGOK0ovqRkW0bybCZ5CgD7gnaxLf6
 hEaLkdS8ZAO03Evcbh4BFWTSOUyLTojMIGRk1L8ysWREga6JA0REAFaLsYidX2ZV3zmq
 DNcTdhTa9CNUwTphH3zIWX68qPxrAvM9IrKlo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=gVc7Zy/V
Subject: [Buildroot] [PATCH v2 1/2] package/snappy: fix compilation error
 raised by vqtbl1q_u8 instruction
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIHBhY2thZ2UgY29tcGlsYXRpb24gZm9yIHRoZSByYXNwYmVycnlwaTNfcXQ1d2VfZGVmY29u
ZmlnIHJhaXNlcyB0aGUKZm9sbG93aW5nIGVycm9yOgoKSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGJ1
aWxkcm9vdC9vdXRwdXQvYnVpbGQvc25hcHB5LTEuMS4xMC9zbmFwcHkuY2M6Mjk6CmJ1aWxkcm9v
dC9vdXRwdXQvYnVpbGQvc25hcHB5LTEuMi4xL3NuYXBweS1pbnRlcm5hbC5oOiBJbiBmdW5jdGlv
biDigJhzbmFwcHk6OmludGVybmFsOjpWMTI4IHNuYXBweTo6aW50ZXJuYWw6OlYxMjhfU2h1ZmZs
ZShWMTI4LCBWMTI4KeKAmToKYnVpbGRyb290L291dHB1dC9idWlsZC9zbmFwcHktMS4yLjEvc25h
cHB5LWludGVybmFsLmg6MTA5OjEwOiBlcnJvcjog4oCYdnF0YmwxcV91OOKAmSB3YXMgbm90IGRl
Y2xhcmVkIGluIHRoaXMgc2NvcGU7IGRpZCB5b3UgbWVhbiDigJh2dGJsMV91OOKAmT8KICAxMDkg
fCAgIHJldHVybiB2cXRibDFxX3U4KGlucHV0LCBzaHVmZmxlX21hc2spOwogICAgICB8ICAgICAg
ICAgIF5+fn5+fn5+fn4KICAgICAgfCAgICAgICAgICB2dGJsMV91OAptYWtlWzRdOiAqKiogW0NN
YWtlRmlsZXMvc25hcHB5LmRpci9idWlsZC5tYWtlOjExODogQ01ha2VGaWxlcy9zbmFwcHkuZGly
L3NuYXBweS5jYy5vXSBFcnJvciAxCgpUaGUgaXNzdWUgd2FzIHJhaXNlZCBieSBjb21taXQgYjNm
YjBiNWI0YjA3NiAoIkVuYWJsZSB2ZWN0b3IgYnl0ZQpzaHVmZmxlIG9wdGltaXphdGlvbnMgb24g
QVJNIE5FT04iKSBjb250YWluZWQgaW4gdmVyc2lvbiAxLjEuMTAuCgpTaWduZWQtb2ZmLWJ5OiBE
YXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Ci0tLQpD
aGFuZ2VzIHYxIC0+IHYyOgogLSBTd2FwIHBvc2l0aW9uIHdpdGggdGhlIG90aGVyIHBhdGNoLiBT
byBmaXJzdCBhcHBseSB0aGUgZml4aW5nCiAgIGNvbXBpbGF0aW9uIGVycm9yIHBhdGNoIGFuZCB0
aGVuIGJ1bXAgdG8gdmVyc2lvbiAxLjIuMS4KCiAuLi5lcnJvci1yYWlzZWQtYnktdnF0YmwxcV91
OC1pbnN0cnVjdGkucGF0Y2ggfCA1MiArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgNTIgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvc25hcHB5LzAw
MDEtRml4LWNvbXBpbGF0aW9uLWVycm9yLXJhaXNlZC1ieS12cXRibDFxX3U4LWluc3RydWN0aS5w
YXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc25hcHB5LzAwMDEtRml4LWNvbXBpbGF0aW9uLWVy
cm9yLXJhaXNlZC1ieS12cXRibDFxX3U4LWluc3RydWN0aS5wYXRjaCBiL3BhY2thZ2Uvc25hcHB5
LzAwMDEtRml4LWNvbXBpbGF0aW9uLWVycm9yLXJhaXNlZC1ieS12cXRibDFxX3U4LWluc3RydWN0
aS5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmIxMGVhN2Vj
ZGZiZQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2Uvc25hcHB5LzAwMDEtRml4LWNvbXBpbGF0
aW9uLWVycm9yLXJhaXNlZC1ieS12cXRibDFxX3U4LWluc3RydWN0aS5wYXRjaApAQCAtMCwwICsx
LDUyIEBACitGcm9tIDI4NGQ1YTZmMjY3ZDQ5NjJiMmI4ODU0MGYyMThjMTA3NDBhNmMwNTMgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNj
aGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+CitEYXRlOiBTYXQsIDggSnVuIDIwMjQgMTg6NDI6MTYg
KzAyMDAKK1N1YmplY3Q6IFtQQVRDSF0gRml4IGNvbXBpbGF0aW9uIGVycm9yIHJhaXNlZCBieSB2
cXRibDFxX3U4IGluc3RydWN0aW9uCitNSU1FLVZlcnNpb246IDEuMAorQ29udGVudC1UeXBlOiB0
ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CitDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0
CisKK1RoZSBjb21waWxhdGlvbiBpbiBCdWlsZHJvb3QgZm9yIHRoZSByYXNwYmVycnlwaTNfcXQ1
d2VfZGVmY29uZmlnCitjb25maWd1cmF0aW9uOgorCittYWtlIHJhc3BiZXJyeXBpM19xdDV3ZV9k
ZWZjb25maWcKK21ha2UKKworcmFpc2VzIHRoZSBmb2xsb3dpbmcgZXJyb3I6CisKK0luIGZpbGUg
aW5jbHVkZWQgZnJvbSBidWlsZHJvb3Qvb3V0cHV0L2J1aWxkL3NuYXBweS0xLjIuMS9zbmFwcHku
Y2M6Mjk6CitidWlsZHJvb3Qvb3V0cHV0L2J1aWxkL3NuYXBweS0xLjIuMS9zbmFwcHktaW50ZXJu
YWwuaDogSW4gZnVuY3Rpb24g4oCYc25hcHB5OjppbnRlcm5hbDo6VjEyOCBzbmFwcHk6OmludGVy
bmFsOjpWMTI4X1NodWZmbGUoVjEyOCwgVjEyOCnigJk6CitidWlsZHJvb3Qvb3V0cHV0L2J1aWxk
L3NuYXBweS0xLjIuMS9zbmFwcHktaW50ZXJuYWwuaDoxMDk6MTA6IGVycm9yOiDigJh2cXRibDFx
X3U44oCZIHdhcyBub3QgZGVjbGFyZWQgaW4gdGhpcyBzY29wZTsgZGlkIHlvdSBtZWFuIOKAmHZ0
YmwxX3U44oCZPworICAxMDkgfCAgIHJldHVybiB2cXRibDFxX3U4KGlucHV0LCBzaHVmZmxlX21h
c2spOworICAgICAgfCAgICAgICAgICBefn5+fn5+fn5+CisgICAgICB8ICAgICAgICAgIHZ0Ymwx
X3U4CittYWtlWzRdOiAqKiogW0NNYWtlRmlsZXMvc25hcHB5LmRpci9idWlsZC5tYWtlOjExODog
Q01ha2VGaWxlcy9zbmFwcHkuZGlyL3NuYXBweS5jYy5vXSBFcnJvciAxCisKK0FzIHJlcG9ydGVk
IGJ5IFsxXSwgdGhlIHZxdGJsMXFfdTggaW5zdHJ1Y3Rpb24gaXMgc3VwcG9ydGVkIGJ5IEE2NAor
YXJjaGl0ZWN0dXJlcy4gRm9yIHRoaXMgcmVhc29uLCB0aGUgcGF0Y2ggZW5hYmxlcyB0aGUgdXNl
IG9mIHRoZQoraW5zdHJ1Y3Rpb24gb25seSBmb3IgTkVPTiBvZiBzdWNoIGFyY2hpdGVjdHVyZS4K
KworWzFdIGh0dHBzOi8vZGV2ZWxvcGVyLmFybS5jb20vYXJjaGl0ZWN0dXJlcy9pbnN0cnVjdGlv
bi1zZXRzL2ludHJpbnNpY3MvdnF0YmwxcV91OAorCitTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5h
Y2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+CitVcHN0cmVhbTogaHR0
cHM6Ly9naXRodWIuY29tL2dvb2dsZS9zbmFwcHkvcHVsbC8xODUKKy0tLQorIHNuYXBweS1pbnRl
cm5hbC5oIHwgMiArLQorIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQorCitkaWZmIC0tZ2l0IGEvc25hcHB5LWludGVybmFsLmggYi9zbmFwcHktaW50ZXJuYWwu
aAoraW5kZXggYWU3ODI0N2RiYmM5Li4yNTZkMzIzNDRkMWEgMTAwNjQ0CistLS0gYS9zbmFwcHkt
aW50ZXJuYWwuaAorKysrIGIvc25hcHB5LWludGVybmFsLmgKK0BAIC00Niw3ICs0Niw3IEBACisg
I2luY2x1ZGUgPGFybV9uZW9uLmg+CisgI2VuZGlmCisgCistI2lmIFNOQVBQWV9IQVZFX1NTU0Uz
IHx8IFNOQVBQWV9IQVZFX05FT04KKysjaWYgU05BUFBZX0hBVkVfU1NTRTMgfHwgKFNOQVBQWV9I
QVZFX05FT04gJiYgZGVmaW5lZChfX2FhcmNoNjRfXykpCisgI2RlZmluZSBTTkFQUFlfSEFWRV9W
RUNUT1JfQllURV9TSFVGRkxFIDEKKyAjZWxzZQorICNkZWZpbmUgU05BUFBZX0hBVkVfVkVDVE9S
X0JZVEVfU0hVRkZMRSAwCistLSAKKzIuNDMuMAorCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
