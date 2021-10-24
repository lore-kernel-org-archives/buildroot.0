Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73CFC433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 18:14:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBCBA61052
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 18:14:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EBCBA61052
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C25646081E;
	Sun, 24 Oct 2021 18:14:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xumvtvkmzjrY; Sun, 24 Oct 2021 18:14:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A9BF6081C;
	Sun, 24 Oct 2021 18:14:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8012C1BF420
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 18:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D1EE80EE3
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 18:13:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RRQJxWFf9bC1 for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 18:13:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 68ED880DC8
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 18:13:47 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id 5so16496483edw.7
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 11:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+Ggci7OZsfdjesCx9O88Kb8GxjYoOCCnj6HU+X8itw8=;
 b=aBH0wgBSoC64iwy+UffwO/oslE0Lwbdow5dz1PUxyiVU54TO5jqYl16A5ln0QnMC/U
 ps4Sl/DXObknt0lajX0pOWszWHfqARhv80+a/6LQW+PIW8mitO5PQkQ5/zwPcJ7GkYyD
 2irdexq9OdWMPUv/5qcBXDiqUTH9gZ5e03YbTz2cR1WEd8N81cSWs9Sf5yUnzGwsoF8u
 LlaM8+MT5pvp5e6xVV7FPC1hHcfxTh3m29NSd8esEjKvUYNPofIuZwjfnnbxLWgVYHpr
 40Xfh7hYFb2rBFXzPDcmTtdUWO2c2PDntpCe0PHEnh4swzICamavRbY9CXI5NvXvFgqK
 vMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+Ggci7OZsfdjesCx9O88Kb8GxjYoOCCnj6HU+X8itw8=;
 b=kz4aMIUheM0ATPSFCYaogAoWlGsB4gzgFTUlsaTiJyS//TW5vmnEoREI/IxX4H3mEQ
 Ej8msWT0KrRHVAZYijhy7QsyNLdNL8Ir5wx2YksAPyJfTynYjS3bWS+xsvy0GIVstaci
 tcN8t2L475pQbu9l3+KJjoLY55qCTE+oZPeQXbWoF50qaVHr9nDdzGKqGp1BCieQUAgW
 aykF6VE3YHyjB+I90xrmLLGv31a2BKAoWW+yJycRAiEC5yfEwK/LyqjMpyvcUayC9E3h
 k307w3BMbaOooV0PamnI1fdRYrZKwdGxbiHhHVjd+ki1Bmu/7Bd9RGqf2K4jN0k7XABr
 VpZg==
X-Gm-Message-State: AOAM532UIDnPxdO5oaKLtrHWvFmPo2+gkwGY1LfY12NCxFWG5IKp709G
 OyjAll4G1YxEI6doiG4yE2VnX+1QFEGQkexj
X-Google-Smtp-Source: ABdhPJx/GFsBS9P3JzFitM9WDO4tShG6bGS91LrFwbPrk7EBeQPUUboTUOavS9cy5pmuGMztA+LuSw==
X-Received: by 2002:aa7:d2d7:: with SMTP id k23mr3571036edr.50.1635099225503; 
 Sun, 24 Oct 2021 11:13:45 -0700 (PDT)
Received: from localhost.localdomain (5.26-130-109.adsl-dyn.isp.belgacom.be.
 [109.130.26.5])
 by smtp.gmail.com with ESMTPSA id v15sm7555367edi.89.2021.10.24.11.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 11:13:45 -0700 (PDT)
From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Oct 2021 20:12:19 +0200
Message-Id: <20211024181221.2608908-4-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211024181221.2608908-1-raphael.melotte@mind.be>
References: <20211024181221.2608908-1-raphael.melotte@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/5] support/testing: add new test for
 python-boto3
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIGEgcnVkaW1lbnRhcnkgdGVzdCBpbnNwaXJlZCBmcm9tIHRoZSAiVXNpbmcgYm90bzMiIHNl
Y3Rpb24gaW4KdGhlIHBhY2thZ2UgUkVBRE1FIChbMV0pLgoKTm90ZSB0aGF0IGl0IGRvZXNuJ3Qg
dHJ5IHRvIGRvIGFueXRoaW5nIHdpdGggdGhlIGluc3RhbmNpYXRlZApyZXNvdXJjZSwgYXMgdGhp
cyB3b3VsZCByZXF1aXJlIGEgbmV0d29yayBjb25uZWN0aW9uIHdoZW4gdGhlIHRlc3QKcnVucy4K
ClsxXTogaHR0cHM6Ly9naXRodWIuY29tL2JvdG8vYm90bzMKClNpZ25lZC1vZmYtYnk6IFJhcGhh
w6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4KLS0tCiBzdXBwb3J0L3Rlc3Rp
bmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX2JvdG8zLnB5IHwgIDIgKysKIHN1cHBvcnQv
dGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX2JvdG8zLnB5ICAgfCAxMiArKysrKysr
KysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25fYm90bzMucHkK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5
dGhvbl9ib3RvMy5weQoKZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdl
L3NhbXBsZV9weXRob25fYm90bzMucHkgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9z
YW1wbGVfcHl0aG9uX2JvdG8zLnB5Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAw
MDAuLmU2OWVmYzc4NjAKLS0tIC9kZXYvbnVsbAorKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMv
cGFja2FnZS9zYW1wbGVfcHl0aG9uX2JvdG8zLnB5CkBAIC0wLDAgKzEsMiBAQAoraW1wb3J0IGJv
dG8zCitzMyA9IGJvdG8zLnJlc291cmNlKCdzMycpCmRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3Rp
bmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9ib3RvMy5weSBiL3N1cHBvcnQvdGVzdGluZy90
ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX2JvdG8zLnB5Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAwMDAuLjc1NjQ5NWZlYzkKLS0tIC9kZXYvbnVsbAorKysgYi9zdXBwb3J0L3Rl
c3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9ib3RvMy5weQpAQCAtMCwwICsxLDEyIEBA
Citmcm9tIHRlc3RzLnBhY2thZ2UudGVzdF9weXRob24gaW1wb3J0IFRlc3RQeXRob25QYWNrYWdl
QmFzZQorCisKK2NsYXNzIFRlc3RQeXRob25QeTNCb3RvMyhUZXN0UHl0aG9uUGFja2FnZUJhc2Up
OgorICAgIF9fdGVzdF9fID0gVHJ1ZQorICAgIGNvbmZpZyA9IFRlc3RQeXRob25QYWNrYWdlQmFz
ZS5jb25maWcgKyBcCisgICAgICAgICIiIgorICAgICAgICBCUjJfUEFDS0FHRV9QWVRIT04zPXkK
KyAgICAgICAgQlIyX1BBQ0tBR0VfUFlUSE9OX0JPVE8zPXkKKyAgICAgICAgIiIiCisgICAgc2Ft
cGxlX3NjcmlwdHMgPSBbInRlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9ib3RvMy5weSJdCisg
ICAgdGltZW91dCA9IDEwCi0tIAoyLjMzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
