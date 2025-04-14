Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58094C369B2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 10:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 033C080B9D;
	Mon, 14 Apr 2025 10:46:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dNb5kEzl6SXu; Mon, 14 Apr 2025 10:46:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 345E980AB6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 345E980AB6;
	Mon, 14 Apr 2025 10:46:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 725F0250
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 10:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55DB140787
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 10:46:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 50lOEVY3Ui0N for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 10:46:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E51F2403D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E51F2403D7
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E51F2403D7
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 10:46:35 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so43198375e9.3
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 03:46:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744627593; x=1745232393;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v3J2jfps9IoGwaQbJqBlybeJjFQFkoj74EemG6j7aQ0=;
 b=uizDfwTOjPAtmRCv/1JbPU1T5qvuuhCG8dG6Fmi6BzGAv6DJiDY13v3AbZ7UVFs+DN
 Jj5SiTEJUvDMT2ZOr2GySPQOPEMXM1mPfw6Ubwr+WxHx8XbJ8YUelY13+BvB//NINuef
 oW+bBnTkcbCvl5EnlJ/Uldqpvp+NnserwDDc7QnWMp/V8GxOlwZY1UWe8ycTwCrPK6Mp
 dFPX6z2aVdvxB8b6QI1Po9oHmmbucMOLLJcVljyVvOnWWPges3CGewj8HgCHlaS4Lhnf
 Fp9UWVhuB5lSIDbd+IWXBuRSZyAgfqNtwKgK55lrDNBZwtDT/iJPwRLfBQFeN8Qs9d/2
 4ElA==
X-Gm-Message-State: AOJu0YzCDMZmn9KxELmpV8ie0LDazHoPiEntRJCPV9KTPpJLVpn0Lk+T
 RHySCcZg3IYnJdnOOS7DHLeZjO5pDAdYDl4dvlVcFtUhAmQrUeaAnneWWPMSvrTONlVNpxjdVH5
 EpQcLxw==
X-Gm-Gg: ASbGncs2kdbLS1GTiZb9XcA+pFY8gHhkc93olt2z78SF/OzahP7yYUngC+GYSlIkGh2
 tIwXRh1jjTq9GtzFS5OerQ6cTQmhj0JeBVuWyTTn3nGsPUGUmMHZml/4c+PqDW73XStsT1Jp798
 HhBeC0VmBfMH4/i6XJJSFmdATcFEmBxGSB4gwVF/w8eRl653wrUaf+h07vclqae6qPkrVGulNMC
 2DPGun4AAO8Yhqwsaf+0UP99rd//KAKSg3yKYAZVyQvHa8a+DeX35diA4wl2fjiq/+EQJd5AIv9
 yYfBIz0FzY4HrwshVMZAaNWMEu7k5rIQJ1aKHZ434mpsxt7P0QJEfFet+Oaw
X-Google-Smtp-Source: AGHT+IH+0EzMCdGVXotTqLlvLR8edTeSfbRmFjG+27nBd5UiRe3PNV+lT17ZOxcvdC4u1LkyFyq+hA==
X-Received: by 2002:a05:600c:1c8e:b0:43c:fe15:41cb with SMTP id
 5b1f17b1804b1-43f3a95dc30mr97944795e9.15.1744627593221; 
 Mon, 14 Apr 2025 03:46:33 -0700 (PDT)
Received: from debian-hp-1.fritz.box ([213.211.140.212])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf43cf42sm10701562f8f.64.2025.04.14.03.46.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 03:46:32 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 David GOUARIN <dgouarin@gmail.com>
Date: Mon, 14 Apr 2025 12:46:12 +0200
Message-ID: <20250414104614.973244-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1744627593; x=1745232393; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v3J2jfps9IoGwaQbJqBlybeJjFQFkoj74EemG6j7aQ0=;
 b=DvBICymtl6HGd+Ub4LbX1Lpq9gWS76I/MPCeGzXB7bpv+Shz4VeAlXYO57iWfOfBo6
 8oFv342tJjd8XGdeUYiYoRea6H6YYGSZ4ar4LyWpMVZ9nOji1fB0X63u2MeqqW8x9uTi
 y9nhyV/COANXJq29fkamnGzED0uMWL/LjfT0RG+PNdEucxgMliMfYUE/F1TyPgAlhlXm
 PA4W64qzWXgqCggF6ohiDXF9kZbAo77J5S3NlskZJj1/JAEtb52wuyxbqYcXCR5P5RkE
 1A23KwTqjo+m4bh3H1EIk/y0wkQvxr2rLLDWYf3OVHRt0Ajkhl16qei0w+uycqYEVrw0
 MeaA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=DvBICymt
Subject: [Buildroot] [PATCH 1/1] package/freeradius-server: ignore
 CVE-2002-0318 and CVE-2011-4966
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q1ZFLTIwMDItMDMxOCBoYXMgYmVlbiBtaXRpZ2F0ZWQgYnkgYWRkaW5nIGEgbmV3IGNvbmZpZyBv
cHRpb24gaW4KZnJlZXJhZGl1cy1zZXJ2ZXIgY29tbWl0IGYwZjc2MmQxNDM5MzM2ZmZmOWM4Yjkw
MjkxMzY0ZGRmZjU4M2Y2OTgsCndoaWNoIGlzIHBhcnQgb2YgcmVsZWFzZV8wXzVfMCBvbndhcmRz
LgpTZWUgYWxzbyB0aGUgb3JpZ2luYWwgcmVwb3J0IChbMV0pLgpUaGUgTlZEIGRhdGFiYXNlJ3Mg
Q1BFIGNvbmZpZ3VyYXRpb24gZG9lc24ndCBoYXZlIGFuIGFzc29jaWF0ZWQKdmVyc2lvbiBudW1i
ZXIsIHdoaWNoIGlzIHdoeSBvdXIgQ1ZFIGNoZWNrIHN0aWxsIHJlcG9ydHMgaXQuCgpGb3IgQ1ZF
LTIwMTEtNDk2NiwgdGhlIENWRSBkZXNjcmlwdGlvbiAoc2VlIFsyXSkgbWVudGlvbnMgdGhlIGlz
c3VlIGlzCmZpeGVkIGluIHZlcnNpb24gMi4yLjAgb253YXJkcywgYnV0IHRoZSBDUEUgYWdhaW4g
ZG9lc24ndCB1c2UgYQp2ZXJzaW9uIG51bWJlci4KClRvIHJlZHVjZSB0aGUgbm9pc2UgaW4gdGhl
IGxpc3Qgb2YgQ1ZFcyB0aGF0IHBrZy1zdGF0cyByZXBvcnRzLCBpZ25vcmUKdGhlbS4KCkZXSVcs
IHlvY3RvL29lIGFsc28gaWdub3JlcyB0aGVtIChzZWUgWzNdKS4KClsxXTogaHR0cHM6Ly9tYXJj
LmluZm8vP2w9YnVndHJhcSZtPTEwMTQ0MDExMzQxMDA4MyZ3PTIjMgpbMl06IGh0dHBzOi8vbnZk
Lm5pc3QuZ292L3Z1bG4vZGV0YWlsL0NWRS0yMDExLTQ5NjYKWzNdIGh0dHBzOi8vcGF0Y2h3b3Jr
LnlvY3RvcHJvamVjdC5vcmcvcHJvamVjdC9vZS9wYXRjaC8yMDIyMDcxNTEzMzUxNS4xNDI5OC0x
LWRhdmlkZS5nYXJkZW5hbEBodWF3ZWkuY29tLwoKU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOp
bG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgotLS0KIHBhY2thZ2UvZnJlZXJhZGl1cy1z
ZXJ2ZXIvZnJlZXJhZGl1cy1zZXJ2ZXIubWsgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZnJlZXJhZGl1cy1zZXJ2ZXIvZnJl
ZXJhZGl1cy1zZXJ2ZXIubWsgYi9wYWNrYWdlL2ZyZWVyYWRpdXMtc2VydmVyL2ZyZWVyYWRpdXMt
c2VydmVyLm1rCmluZGV4IDk0YzkzMzFiM2QuLjI1ZWRhMGNkNjMgMTAwNjQ0Ci0tLSBhL3BhY2th
Z2UvZnJlZXJhZGl1cy1zZXJ2ZXIvZnJlZXJhZGl1cy1zZXJ2ZXIubWsKKysrIGIvcGFja2FnZS9m
cmVlcmFkaXVzLXNlcnZlci9mcmVlcmFkaXVzLXNlcnZlci5tawpAQCAtMTUsNiArMTUsMTIgQEAg
RlJFRVJBRElVU19TRVJWRVJfQ1BFX0lEX1BST0RVQ1QgPSBmcmVlcmFkaXVzCiBGUkVFUkFESVVT
X1NFUlZFUl9ERVBFTkRFTkNJRVMgPSBsaWJ0YWxsb2MKIEZSRUVSQURJVVNfU0VSVkVSX0FVVE9S
RUNPTkYgPSBZRVMKIAorIyBUaGUgTlZEIGRhdGFiYXNlIGRvZXNuJ3QgaGF2ZSBhIHZlcnNpb24g
bnVtYmVyIGNvbmZpZ3VyZWQgZm9yIHRoZQorIyBmb2xsb3dpbmcgQ1ZFcworRlJFRVJBRElVU19T
RVJWRVJfSUdOT1JFX0NWRVMgKz0gXAorCUNWRS0yMDAyLTAzMTggXAorCUNWRS0yMDExLTQ5NjYK
KwogIyBXZSdyZSBwYXRjaGluZyBzcmMvbW9kdWxlcy9ybG1fa3JiNS9jb25maWd1cmUuYWMKIGRl
ZmluZSBGUkVFUkFESVVTX1NFUlZFUl9SVU5fS1JCNV9BVVRPUkVDT05GCiAJY2QgJChARCkvc3Jj
L21vZHVsZXMvcmxtX2tyYjU7ICQoQVVUT1JFQ09ORikgLUkkKEBEKS9tNAotLSAKMi40OS4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
