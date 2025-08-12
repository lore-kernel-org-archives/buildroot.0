Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D40CA0EC4
	for <buildroot@archiver.kernel.org>; Tue, 12 Aug 2025 17:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01B714292B;
	Tue, 12 Aug 2025 17:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tACcdERq1i5F; Tue, 12 Aug 2025 17:18:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB0624291F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB0624291F;
	Tue, 12 Aug 2025 17:18:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 95EEC1D1
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 17:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C0FC42920
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 17:18:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wuMR9g2CWfR1 for <buildroot@buildroot.org>;
 Tue, 12 Aug 2025 17:18:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 652534291C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 652534291C
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 652534291C
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 17:18:29 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-458bece40fcso29240155e9.3
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 10:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755019107; x=1755623907;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yp4a30O5YwcQbc7Z8af4oc17xFl0mEzFWoAxuMpuXMA=;
 b=eEcyACBRjIkgCkFaOk1gUqUaCb1swgepUMJZi0nePXb2ylhQ5WSioaOjdnlV5cGq0G
 VVa7m1qXktRFDtW8GzWWEWvg6mRhz0pg7uiKn0zptE6Xjpym0CVtD15X1xowFiotBCNg
 QqHVOk7RqOkf2Kpt+GAZSuOxgMdRPQzWfya2pN7t8pz3zfihCWTdxvOCYtuF7jy3o7Ar
 1vBT9iX1G6kHedjQkhrEBQHxP9b/N9vdE/IgfXS9Prfryspdi1FXM0yXbqPKgpbJ7QTr
 AMyPu+CNaI/vyITrH0TfATp+oV21OZCX1AVNngsoJm99SaRgdTZYX60nUzreafhqxPVY
 jRSg==
X-Gm-Message-State: AOJu0Yx/VXTYiMfSa0wOGpv6h+kg2Wv1207auq5E1oNyGpERAYk3r88Y
 Zgf8krJeOB+d/IyBlenFYgTZHZnSc3jPPfjsWQH6TqSdZcukUJI1W4KlG9EsWC5VXUJEH3nb/Uy
 I8KWv
X-Gm-Gg: ASbGncsME7XU5Klr/KEdVyhEGbJz8pDRknFbON4ATcR0HfDYrMkm8EZ2DWMxu74l/Mk
 jZPn0wIHnM4ATpYyZg13nQfyFbhUKjsLCR4kwprbP28+7e+uyT9KM/sfgYrCVHj7LblBMJYeVrE
 Ay3UHqerQlT/pIztM/N+Mk/1IbqnM4teskj94cgYO0/5E66m+AQh1Eu0uHztEx0GBDNjl4Q8fvq
 Y5geYs28+J86dlO5nQF8w0rAiOUXxJK9OsHjyXzHQTkKaIqozn1OcRF/5T1zcca0lhz3umo/lWk
 BqQj78v8bVctauR8dOEhMdrAoGpc/mZ6P6DnpVtoXX+cMZXpwVqVhsMm+Wtvrs85XvtXk8S706s
 2+64bU0isuqgTZQ==
X-Google-Smtp-Source: AGHT+IHDVlRdcqWMV2n91NohhgNQkDejl42LBSBbL7vqXkTSeRwFrTiv0TmWw6nfzMDUwiJB7nyM0g==
X-Received: by 2002:a05:6000:2902:b0:3b8:893f:a17d with SMTP id
 ffacd0b85a97d-3b917307715mr145650f8f.49.1755019107007; 
 Tue, 12 Aug 2025 10:18:27 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c338c7dsm45125353f8f.0.2025.08.12.10.18.26
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 10:18:26 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 12 Aug 2025 19:18:25 +0200
Message-ID: <20250812171825.1942608-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250812171825.1942608-1-thomas.perale@mind.be>
References: <20250812171825.1942608-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755019107; x=1755623907; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yp4a30O5YwcQbc7Z8af4oc17xFl0mEzFWoAxuMpuXMA=;
 b=BM9bAaTLYuyJppmW1mbf9mtz+R+wNGXvWklmKmXUrrVj8l5W6DWGMG1szX6YzKjDsd
 wKbq1t99h4xMegde0b/ABbzfKZ7Il0NNgSJEjbz7DLUP4kpL464tf7hwXmrsUinWeKfP
 zi+U/TkRIlD0ucrGsZi2rZN73PA7I1kH/vwudb2eFXYciJWRo0meqehwbkpqc7O/ZB59
 E8+GRq2M6rUaSp6121jrsRPq9ckWg1wRh4s5zDl/5q6lOfdUYGOrBXaHjvDqpMKA2jfr
 eE5hOzjf2eqBWIFRIm602r4uMnuitt6/ASMQ1uy+FKgP9F0ocv+xaKsAqRrGco+1cucD
 Dbtg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BM9bAaTL
Subject: [Buildroot] [PATCH 2/2] package/prboom: fix build w/ gcc-15
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBwYXRjaCBmb3JjZSB0aGUgdXNhZ2Ugb2YgYC1zdGQ9Z251MThgIGZvciBHQ0MxNSB0b29s
Y2hhaW5zIHRvIGZpeAp0aGUgZm9sbG93aW5nIGlzc3VlczoKCi0gVGhlIGJvb2xlYW4gaXNzdWUg
d2l0aCBDMjMKCmBgYApJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi4vLi4vc3JjL2lfc291bmQuaDoz
OCwKICAgICAgICAgICAgICAgICBmcm9tIGlfc291bmQuYzo1ODoKLi4vLi4vc3JjL2Rvb210eXBl
Lmg6NDg6MTU6IGVycm9yOiBjYW5ub3QgdXNlIGtleXdvcmQg4oCYZmFsc2XigJkgYXMgZW51bWVy
YXRpb24gY29uc3RhbnQKICAgNDggfCB0eXBlZGVmIGVudW0ge2ZhbHNlLCB0cnVlfSBib29sZWFu
OwogICAgICB8ICAgICAgICAgICAgICAgXn5+fn4KLi4vLi4vc3JjL2Rvb210eXBlLmg6NDg6MTU6
IG5vdGU6IOKAmGZhbHNl4oCZIGlzIGEga2V5d29yZCB3aXRoIOKAmC1zdGQ9YzIz4oCZIG9ud2Fy
ZHMKYGBgCgotIFRoZSB1c2FnZSBvZiBgdXNsZWVwYCAmIGBzdHJ1Y3QgdGltZXpvbmVgIHJlcXVp
cmUgdXNhZ2Ugb2YgR05VCiAgZXh0ZW5zaW9ucy4KCmBgYAppX3N5c3RlbS5jOjU4OjM6IGVycm9y
OiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJh1c2xlZXDigJk7IGRpZCB5b3Ug
bWVhbiDigJhzbGVlcOKAmT8gWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCiAgIDU4
IHwgICB1c2xlZXAodXNlY3MpOwogICAgICB8ICAgXn5+fn5+CiAgICAgIHwgICBzbGVlcAppX3N5
c3RlbS5jOiBJbiBmdW5jdGlvbiDigJhJX0dldFRpbWVfUmVhbFRpbWXigJk6Cmlfc3lzdGVtLmM6
Nzg6MTk6IGVycm9yOiBzdG9yYWdlIHNpemUgb2Yg4oCYdHrigJkgaXNu4oCZdCBrbm93bgogICA3
OCB8ICAgc3RydWN0IHRpbWV6b25lIHR6OwogICAgICB8ICAgICAgICAgICAgICAgICAgIF5+Cmlf
c3lzdGVtLmM6IEluIGZ1bmN0aW9uIOKAmElfR2V0UmFuZG9tVGltZVNlZWTigJk6Cmlfc3lzdGVt
LmM6MTA1OjE5OiBlcnJvcjogc3RvcmFnZSBzaXplIG9mIOKAmHR64oCZIGlzbuKAmXQga25vd24K
ICAxMDUgfCAgIHN0cnVjdCB0aW1lem9uZSB0ejsKICAgICAgfCAgICAgICAgICAgICAgICAgICBe
fgpgYGAKClNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXJhbGUgPHRob21hcy5wZXJhbGVAbWluZC5i
ZT4KLS0tCiBwYWNrYWdlL3ByYm9vbS9wcmJvb20ubWsgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3ByYm9vbS9wcmJvb20ubWsg
Yi9wYWNrYWdlL3ByYm9vbS9wcmJvb20ubWsKaW5kZXggZmM0NDBlNWNmOC4uYWI5YWIwOTkxMyAx
MDA2NDQKLS0tIGEvcGFja2FnZS9wcmJvb20vcHJib29tLm1rCisrKyBiL3BhY2thZ2UvcHJib29t
L3ByYm9vbS5tawpAQCAtMTgsNiArMTgsMTAgQEAgaWZlcSAoJChCUjJfVE9PTENIQUlOX0hBU19H
Q0NfQlVHXzg1MTgwKSx5KQogUFJCT09NX0NGTEFHUyArPSAtTzAKIGVuZGlmCiAKK2lmZXEgKCQo
QlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfMTUpLHkpCitQUkJPT01fQ0ZMQUdTICs9IC1zdGQ9
Z251MTgKK2VuZGlmCisKIFBSQk9PTV9DT05GX0VOViArPSBDRkxBR1M9IiQoUFJCT09NX0NGTEFH
UykiCiAKIGlmZXEgKCQoQlIyX1BBQ0tBR0VfTElCUE5HKSx5KQotLSAKMi41MC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
