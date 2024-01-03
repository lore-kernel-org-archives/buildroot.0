Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD65C3DA6E
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 06:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2462281ECF;
	Wed,  3 Jan 2024 06:33:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2462281ECF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UD5Q_PQ58pIr; Wed,  3 Jan 2024 06:33:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8139681E9E;
	Wed,  3 Jan 2024 06:33:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8139681E9E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2B4681BF346
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 06:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F404E400E2
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 06:33:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F404E400E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0IHxd6kqLiwR for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 06:33:01 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31349400DD
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 06:33:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31349400DD
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a2330a92ae6so1108528566b.0
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 22:33:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704263579; x=1704868379;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qUGzV46X6ASKPlkz+N7BmK7eOPI3GWnMYmRWEsO5kTQ=;
 b=P4FsGIv59whnXDitkmvgTyq/oDc7UaWqt4AVqzmoa0SXOUwdslREgXJnxMwQpbdJCb
 IX2s8GplgUvZjcjwXuWpSoazIlm3eM+oAGrvlleN8vDU6E9y4VhQ8LY2s9iWT90APU3S
 R/86DFrJzGYeqfVszK3XamzSeHCRJGov0ab64qZjpjdjHMfuIyGPbFChWfmKPcUG2otf
 q1ulxxFEh1dgK0bgHQIlKy645rhVEaW9L9JPTjZFiqnqYox0zXFwdqPTAuezISd2fISb
 SHyW8s4HZnRdIjzw+FhLot59q6+bytItbYsOhyH4qzphLNPo2Eis4PWd+Fil+bf6u+PO
 RtWw==
X-Gm-Message-State: AOJu0YxpXWZUvob2lmQVMx7RtFgoWBLy8BagxWtBPFtf4guHUbOymHNe
 ovoYR5b/dSF6ioyf+LJ+sv3Uvqvfo5E=
X-Google-Smtp-Source: AGHT+IG89Uhqdw/pMulG/oKOVqZOV6/x7BEGOZxP7X67papnByz2ofF58BHtdvmBzzy2SNFxN8CjIA==
X-Received: by 2002:a17:906:31da:b0:a28:8cb2:e5a3 with SMTP id
 f26-20020a17090631da00b00a288cb2e5a3mr164257ejf.148.1704263578896; 
 Tue, 02 Jan 2024 22:32:58 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl.
 [31.11.218.106]) by smtp.gmail.com with ESMTPSA id
 vw17-20020a170907059100b00a26f3d6062csm8289690ejb.50.2024.01.02.22.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 22:32:58 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Jan 2024 07:32:53 +0100
Message-Id: <20240103063253.6833-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704263579; x=1704868379; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qUGzV46X6ASKPlkz+N7BmK7eOPI3GWnMYmRWEsO5kTQ=;
 b=AyhEmpS0LEAEYXH4s6AW5jfA1ftCKmTo98hH/4wDR5ETr6sYPHHVz13ahjJTzzTgsK
 FMg4Jghiap3zcduTXlLHU/TiF20z2EcWq/Y4Oh+dQ0Z+RH/XSrSsjOrFhMebgjnPnJor
 juqVvA32MVMfTGID6EqQeJd66vWBw4DPN4iK8Oxh6efXPE2txwQS808HuMvniN+eI83t
 oMCAs4DePcXYibXdvcUuIXGbj/Ilr5A0dh1RHNUJ9WSlhgNuvshmHDAnrKripJqBSnZ+
 5Bt+qKObUUezYWm3xyskmTK93sKJzyP8yIZwo6a5kvJ7Ip157sdLiiuSzC1FBjHQR6FN
 +9OQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AyhEmpS0
Subject: [Buildroot] [PATCH] board/broadcom/northstar: fix building custom
 images
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
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKQ3VzdG9tIE5vcnRoc3Rh
ciBpbWFnZXMgYWxsb3cgaW5zdGFsbGluZyAoZmxhc2hpbmcpIHRoZW0gdXNpbmcgdmVuZG9yIFVJ
Cm9yIENGRSBib290bG9hZGVyLiBDaGFuZ2Ugb2YgRFRTIGZpbGVzIHBhdGhzICgiYnJvYWRjb20v
IiBwcmVmaXgKaW50cm9kdWN0aW9uKSBwcmV2ZW50ZWQgcG9zdCBzY3JpcHQgZnJvbSBnZW5lcmF0
aW5nIHRoZW0uCgpBZGp1c3QgcG9zdC1pbWFnZS5zaCB0byBkZWFsIHdpdGggbmV3IHBhdGhzLgoK
U2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgotLS0KIGJv
YXJkL2Jyb2FkY29tL25vcnRoc3Rhci9wb3N0LWltYWdlLnNoIHwgMyArKy0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9ib2FyZC9i
cm9hZGNvbS9ub3J0aHN0YXIvcG9zdC1pbWFnZS5zaCBiL2JvYXJkL2Jyb2FkY29tL25vcnRoc3Rh
ci9wb3N0LWltYWdlLnNoCmluZGV4IGI2MTUwZmM1MzkuLjU1OWVkOGJmNGIgMTAwNzU1Ci0tLSBh
L2JvYXJkL2Jyb2FkY29tL25vcnRoc3Rhci9wb3N0LWltYWdlLnNoCisrKyBiL2JvYXJkL2Jyb2Fk
Y29tL25vcnRoc3Rhci9wb3N0LWltYWdlLnNoCkBAIC0yNyw4ICsyNyw5IEBAIGJ1aWxkX3RyeCgp
IHsKIAlybSAtZiAkaW1hZ2VzL3pJbWFnZS4kZGV2aWNlLmx6bWEKIH0KIAotZGV2aWNlcz0iJChz
ZWQgLW4gJ3MvXkJSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RUU19OQU1FPSJcKFthLXowLTkgXC1d
KlwpIiQvXDEvcCcgJHtCUjJfQ09ORklHfSkiCitkZXZpY2VzPSIkKHNlZCAtbiAncy9eQlIyX0xJ
TlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9IlwoW14iXSpcKSIkL1wxL3AnICR7QlIyX0NPTkZJ
R30pIgogZm9yIGRldmljZSBpbiAkZGV2aWNlczsgZG8KKwlkZXZpY2U9IiR7ZGV2aWNlI2Jyb2Fk
Y29tL30iCiAJY2FzZSAiJGRldmljZSIgaW4KIAkJImJjbTQ3MDgtc21hcnRyZy1zcjQwMGFjIikK
IAkJCWJ1aWxkX3RyeCAiJDEiICIkZGV2aWNlIgotLSAKMi4zNS4zCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
