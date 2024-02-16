Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DECC48BF3
	for <buildroot@archiver.kernel.org>; Fri, 16 Feb 2024 21:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0C47421E6;
	Fri, 16 Feb 2024 21:15:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VwT33NBHAXd8; Fri, 16 Feb 2024 21:15:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0331C42238
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0331C42238;
	Fri, 16 Feb 2024 21:15:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6A4AB1BF287
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 21:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 584536069B
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 21:15:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9oI1mWdSXQHh for <buildroot@lists.busybox.net>;
 Fri, 16 Feb 2024 21:15:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0197560680
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0197560680
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0197560680
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 21:15:23 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4124d5ab11aso5733785e9.0
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 13:15:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708118122; x=1708722922;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/v92DtwUfLa/M/5MXP0I/yKFbAB5JBXyI+B+Acq3nLw=;
 b=udHmhyNi+15hTwCnxB6YYFfAwQoOHPQiYIOnRIyPwLQ0dRIFIiXq/T7/z9k5cKJ+He
 teJP7kOhWN3zju+mzLr+VhQL/rHTIVilyksyZnUo1+xk8LQY+DQCHBbTCrXl2AhKkZt5
 2JuI6WPCEnM7/56YYE5AVTYeI9/alUOdhBrSG1bH/fJYGjLHqk/r7nmfbfegz9SdYuIu
 yuThv6Hau7z+/kbxuRnvruODJhybjpbCfCXE3ydCTUliJuhOmIXsFuTCGwDUmFFsJy8x
 IPQvMHleTugIBz2TRl6htmMWtGe8ZdbhQcztwl0plvVP/ovXWAigST/MP0rLKrV4i3xK
 gl3A==
X-Gm-Message-State: AOJu0YwzB+dhDwIyqk2sUlFmQmzugzOJAuIBVEoS3Co506d6G+Ep4+el
 qmIdo7wgxfh9FztVypIAuxQaJjrkgBXVdOuZtf0yefSC6d90jVoXqZI+dELzojfYYAYJ44hotQZ
 HMRs=
X-Google-Smtp-Source: AGHT+IFjGwZsDjXf0FiEjzwf67xqU+3vHj0OQ/B5eomCDrAu0jXP6RPb3LyyTQ7qii1GvAGn4rfFGw==
X-Received: by 2002:a05:600c:190e:b0:410:78fb:bed2 with SMTP id
 j14-20020a05600c190e00b0041078fbbed2mr5380472wmq.19.1708118121967; 
 Fri, 16 Feb 2024 13:15:21 -0800 (PST)
Received: from junian.fritz.box (94.105.103.7.dyn.edpnet.net. [94.105.103.7])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a05600c444b00b00410d7e55e5asm3451234wmn.3.2024.02.16.13.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 13:15:21 -0800 (PST)
To: buildroot@buildroot.org
Date: Fri, 16 Feb 2024 22:13:42 +0100
Message-Id: <20240216211344.1807353-5-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240216211344.1807353-1-raphael.melotte@mind.be>
References: <20240216211344.1807353-1-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1708118122; x=1708722922; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/v92DtwUfLa/M/5MXP0I/yKFbAB5JBXyI+B+Acq3nLw=;
 b=YLsTghixhygoz2XUUz3Gm6ZXIHWZLpto5dgLikZyarEPrpw0Ki81HoMhS3JVaT8Yqj
 pyJ7mssDX4yq6eJIAaq3aBnIo8uSdnwWJ6L04nX04epxzJhRGMQovT4UBaYyI36LzBn6
 uActbM/2VlXCDJU+yL4rDKUB6d6f+Mas7ien9hyoxfoZDRCp9DaLGDm2D51EMKgx9eO5
 1nc/BOvOjst1AAtDaxqLz0f10wEAH2DgfaCzNO++64YF7ifKiKLe0FyeIazFM6hS16Ct
 JVCvEYUJJG8Oyx313UVNwnVS08rxYP7Bhsl6ABz9xSOPW9n650IUTq0OCy02wSUpUEzG
 YxGg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=YLsTghix
Subject: [Buildroot] [PATCH 4/5] package/mupdf: bump to version 1.23.9
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: james.hilliard1@gmail.com,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+CgpEcm9wIHBh
dGNoIHdoaWNoIGlzIG5vdyB1cHN0cmVhbS4KClNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJk
IDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgpbYnVtcCB0byAxLjIzLjldClNpZ25lZC1vZmYt
Ynk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4KLS0tCiAuLi5p
c3NpbmctbGltaXRzLmgtaW5jbHVkZS1mb3ItVUlOVF9NQVgucGF0Y2ggfCA3MCAtLS0tLS0tLS0t
LS0tLS0tLS0tCiBwYWNrYWdlL211cGRmL211cGRmLmhhc2ggICAgICAgICAgICAgICAgICAgICAg
fCAgNCArLQogcGFja2FnZS9tdXBkZi9tdXBkZi5tayAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA3MyBkZWxldGlvbnMoLSkK
IGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL211cGRmLzAwMDEtQWRkLW1pc3NpbmctbGltaXRz
LmgtaW5jbHVkZS1mb3ItVUlOVF9NQVgucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL211cGRm
LzAwMDEtQWRkLW1pc3NpbmctbGltaXRzLmgtaW5jbHVkZS1mb3ItVUlOVF9NQVgucGF0Y2ggYi9w
YWNrYWdlL211cGRmLzAwMDEtQWRkLW1pc3NpbmctbGltaXRzLmgtaW5jbHVkZS1mb3ItVUlOVF9N
QVgucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDk1ZjJmODY2NjYuLjAwMDAw
MDAwMDAKLS0tIGEvcGFja2FnZS9tdXBkZi8wMDAxLUFkZC1taXNzaW5nLWxpbWl0cy5oLWluY2x1
ZGUtZm9yLVVJTlRfTUFYLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsNzAgKzAsMCBAQAotRnJv
bSBlYmNlOWYxYjEyOWViYzhmMmIxN2FmYTAyYTRmZmNiOTQ1M2MxMWQ5IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQotRnJvbTogPT9VVEYtOD9xP1JhcGhhPUMzPUFCbD0yME09QzM9QTlsb3R0ZT89
IDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4KLURhdGU6IE1vbiwgMjQgQXByIDIwMjMgMTc6Mjc6
MzUgKzAyMDAKLVN1YmplY3Q6IFtQQVRDSF0gQWRkIG1pc3NpbmcgbGltaXRzLmggaW5jbHVkZSBm
b3IgVUlOVF9NQVgKLU1JTUUtVmVyc2lvbjogMS4wCi1Db250ZW50LVR5cGU6IHRleHQvcGxhaW47
IGNoYXJzZXQ9VVRGLTgKLUNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKLQotZW5jb2Rl
LWJhc2ljLmMgdXNlcyAnVUlOVF9NQVgnLCB3aGljaCBpcyBhdmFpbGFibGUgaW4gdGhlICdsaW1p
dHMuaCcKLWhlYWRlci4KLQotSW4gc29tZSBjb25maWd1cmF0aW9ucyB0aGF0IGJ1aWxkIHdpdGgg
emxpYiBmcm9tIFsxXSwgYnkgY2hhbmNlCi1saW1pdHMuaCBnZXRzIGluZGlyZWN0bHkgaW5jbHVk
ZWQgd2hlbiBpbmNsdWRpbmcgJ3otaW1wLmgnICh0aGUKLWluY2x1ZGVzIGFyZTogJ3otaW1wLmgn
IC0+ICd6bGliLmgnIC0+ICd6Y29uZi5oJyAtPiAnbGltaXRzLmgnKSwgc28KLXRoZSBidWlsZCBz
dWNjZWVkcy4KLQotV2hlbiB1c2luZyBvdGhlciB6bGliIGltcGxlbWVudGF0aW9ucyBob3dldmVy
IChmb3IgZXhhbXBsZSBmcm9tIFsyXSksCi1saW1pdHMuaCBpcyBub3QgbmVjZXNzYXJpbHkgaW5j
bHVkZWQgaW5kaXJlY3RseSwgd2hpY2ggbGVhZHMgdG8gdGhlCi1idWlsZCBmYWlsaW5nIGluIHRo
ZSBmb2xsb3dpbmcgd2F5OgotCi1zb3VyY2UvZml0ei9lbmNvZGUtYmFzaWMuYzogSW4gZnVuY3Rp
b24gJ2RlZmxhdGVfd3JpdGUnOgotc291cmNlL2ZpdHovZW5jb2RlLWJhc2ljLmM6MzQzOjI3OiBl
cnJvcjogJ1VJTlRfTUFYJyB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbikK
LSAgMzQzIHwgICAgICAgICBuZXdidWZzaXplID0gbiA+PSBVSU5UX01BWCA/IFVJTlRfTUFYIDog
ZGVmbGF0ZUJvdW5kKCZzdGF0ZS0+eiwgbik7Ci0gICAgICB8ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXn5+fn5+fn4KLXNvdXJjZS9maXR6L2VuY29kZS1iYXNpYy5jOjI2OjE6IG5vdGU6ICdV
SU5UX01BWCcgaXMgZGVmaW5lZCBpbiBoZWFkZXIgJzxsaW1pdHMuaD4nOyBkaWQgeW91IGZvcmdl
dCB0byAnI2luY2x1ZGUgPGxpbWl0cy5oPic/Ci0KLUFkZCB0aGUgbWlzc2luZyBpbmNsdWRlLCBz
byB0aGF0IHRoZSBidWlsZCBzdWNjZWVkcyBubyBtYXR0ZXIgaWYgemxpYgotaW5kaXJlY3RseSBp
bmNsdWRlcyAnbGltaXQuaCcgb3Igbm90LgotCi1TaW1pbGFybHksIGFsc28gYWRkIGl0IGluIG91
dHB1dC1wcy5jIHdoZXJlIGl0J3MgYWxzbyBtaXNzaW5nLgotCi1bMV06IGh0dHBzOi8vemxpYi5u
ZXQvCi1bMl06IGh0dHBzOi8vZ2l0aHViLmNvbS96bGliLW5nL3psaWItbmcKLQotU2lnbmVkLW9m
Zi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgotVXBzdHJl
YW06IGh0dHBzOi8vYnVncy5naG9zdHNjcmlwdC5jb20vc2hvd19idWcuY2dpP2lkPTcwNjY2Nwot
LS0tCi0gc291cmNlL2ZpdHovZW5jb2RlLWJhc2ljLmMgfCAyICsrCi0gc291cmNlL2ZpdHovb3V0
cHV0LXBzLmMgICAgfCAyICsrCi0gMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKLQot
ZGlmZiAtLWdpdCBhL3NvdXJjZS9maXR6L2VuY29kZS1iYXNpYy5jIGIvc291cmNlL2ZpdHovZW5j
b2RlLWJhc2ljLmMKLWluZGV4IDAzYTRmZjc2Yi4uODRmMGMzNWU2IDEwMDY0NAotLS0tIGEvc291
cmNlL2ZpdHovZW5jb2RlLWJhc2ljLmMKLSsrKyBiL3NvdXJjZS9maXR6L2VuY29kZS1iYXNpYy5j
Ci1AQCAtMjQsNiArMjQsOCBAQAotIAotICNpbmNsdWRlICJ6LWltcC5oIgotIAotKyNpbmNsdWRl
IDxsaW1pdHMuaD4KLSsKLSBzdHJ1Y3QgYWh4Ci0gewotIAlmel9vdXRwdXQgKmNoYWluOwotZGlm
ZiAtLWdpdCBhL3NvdXJjZS9maXR6L291dHB1dC1wcy5jIGIvc291cmNlL2ZpdHovb3V0cHV0LXBz
LmMKLWluZGV4IGVmMjJjM2NkNi4uM2RjOGVhMTdkIDEwMDY0NAotLS0tIGEvc291cmNlL2ZpdHov
b3V0cHV0LXBzLmMKLSsrKyBiL3NvdXJjZS9maXR6L291dHB1dC1wcy5jCi1AQCAtMjQsNiArMjQs
OCBAQAotIAotICNpbmNsdWRlICJ6LWltcC5oIgotIAotKyNpbmNsdWRlIDxsaW1pdHMuaD4KLSsK
LSB0eXBlZGVmIHN0cnVjdCBwc19iYW5kX3dyaXRlcl9zCi0gewotIAlmel9iYW5kX3dyaXRlciBz
dXBlcjsKLS0tIAotMi4zOS4xCi0KZGlmZiAtLWdpdCBhL3BhY2thZ2UvbXVwZGYvbXVwZGYuaGFz
aCBiL3BhY2thZ2UvbXVwZGYvbXVwZGYuaGFzaAppbmRleCAxZjYzNjA5N2VkLi41ODAyMzVlZWNh
IDEwMDY0NAotLS0gYS9wYWNrYWdlL211cGRmL211cGRmLmhhc2gKKysrIGIvcGFja2FnZS9tdXBk
Zi9tdXBkZi5oYXNoCkBAIC0xLDggKzEsOCBAQAogIyBGcm9tIGh0dHBzOi8vbXVwZGYuY29tL2Rv
d25sb2Fkcy9pbmRleC5odG1sOgotc2hhMSAgYjk5MDc3MjlkNjA0ZjBiZjM4NDZiNDVjZDU4OTFl
MTBkN2E2NmUyNCAgbXVwZGYtMS4yMi4wLXNvdXJjZS50YXIubHoKK3NoYTEgIGQ3OTYwMGJjY2Q3
MGFiOWQwZThlZTE5ZGFlNGUyNzVmMmFmOTVjZWQgIG11cGRmLTEuMjMuOS1zb3VyY2UudGFyLmx6
CiAKICMgTG9jYWxseSBjb21wdXRlZDoKLXNoYTI1NiAgYmVkNzhhMGFiZjg0OTZiMzBjNTIzNDk3
MjkyZGU5NzlkYjYzM2VjYTU3ZTAyZjZjZDBmM2M3YzA0MjU1MWMzZSAgbXVwZGYtMS4yMi4wLXNv
dXJjZS50YXIubHoKK3NoYTI1NiAgMmMyZjg5ZGViOWY0MjViYTYzN2RhYzIyNjE5MWQ1NDdmMmI0
MDk3NWM0ZDIxYTM0MDk2NWY1MmMwMDFlMTVjNSAgbXVwZGYtMS4yMy45LXNvdXJjZS50YXIubHoK
IAogIyBIYXNoIGZvciBsaWNlbnNlIGZpbGVzOgogc2hhMjU2ICA1N2M4ZmYzM2M5YzBjZmMzZWYw
MGU2NTBhMWNjOTEwZDdlZTQ3OWE4YmM1MDlmNmM5MjA5YTdjMmExMTM5OWQ2ICBDT1BZSU5HCmRp
ZmYgLS1naXQgYS9wYWNrYWdlL211cGRmL211cGRmLm1rIGIvcGFja2FnZS9tdXBkZi9tdXBkZi5t
awppbmRleCBkMjEwNTQ5N2JlLi4xN2JkNDMyMGI5IDEwMDY0NAotLS0gYS9wYWNrYWdlL211cGRm
L211cGRmLm1rCisrKyBiL3BhY2thZ2UvbXVwZGYvbXVwZGYubWsKQEAgLTUsNyArNSw3IEBACiAj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCiAjIHB5dGhvbi1weW11cGRmJ3MgdmVyc2lvbiBtdXN0
IG1hdGNoIG11cGRmJ3MgdmVyc2lvbgotTVVQREZfVkVSU0lPTiA9IDEuMjIuMAorTVVQREZfVkVS
U0lPTiA9IDEuMjMuOQogTVVQREZfU09VUkNFID0gbXVwZGYtJChNVVBERl9WRVJTSU9OKS1zb3Vy
Y2UudGFyLmx6CiBNVVBERl9TSVRFID0gaHR0cHM6Ly9tdXBkZi5jb20vZG93bmxvYWRzL2FyY2hp
dmUKIE1VUERGX0xJQ0VOU0UgPSBBR1BMLTMuMCsKLS0gCjIuMzcuMwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
