Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE1DC433EF
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:34:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9F2961AD0
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B9F2961AD0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 883BB60A89;
	Wed, 17 Nov 2021 21:33:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kUsveWjKnIz5; Wed, 17 Nov 2021 21:33:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E80C260A86;
	Wed, 17 Nov 2021 21:33:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 05D2B1BF307
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F082F60A86
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:33:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vjFTXVh-RMBr for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 21:33:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0551060A73
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 21:33:55 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso5936554wmr.4
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 13:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CsavBfauK5DJ85tXyggwdHUE9W/GznLGTPwZEWDtx98=;
 b=DY8z5HdQIidwo1PFIny9gcZMZgEx2Q/T9h3Sw43HVj3+oO+ltcFocxSrkHDE6hyL5e
 r6Q8DxaL+k2pBEfb6S1Uz0gaT9ww7lm90CqBfhzINwnylfvQxIdTnyU+9uVkg84gdt4x
 YZ0JiQ44eeTBSzEuRGaoDLFHETL+G+zCCP8aHq/qu/K2lysFFYuMO1s6JpItiTGQDg5H
 N7XT34Wy9elsAg4Wyxh3oRlRSD+FwmwJbEwGnX3cKZa1ABW3jdKbBIdGoTcNSbd09ghP
 C8DVbGssfbplHBofIYWx1HlBRES20QPqjFI5OfOBQfBGf4GFuO9hhj3oohTZ6R/iFY1c
 +5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CsavBfauK5DJ85tXyggwdHUE9W/GznLGTPwZEWDtx98=;
 b=p5FtyompxVnd/u0tsRrMokxwh6ebFM2wqoAfS40mUfCiWQnwaS6Wr84cuv8mdgki1P
 9b3UNnFiHjjWbqxme8dFIx8XNxaQHJBjVUFvXOHEtSKBZArMmOc/x8wsdIDFxMK+hGXT
 n9Cg6Be7K9MJj3MP/+mfz5fNC9YFHim3X0jEmQiMit2/4diIK5wbCpekOFQz3yUgt0MA
 kgLIshL+Rz9oX7WJSaLRXR7m/utZE5Vnrg1J8QdONHr3bLygeepKm7gZ6cgzqGaHf09m
 5ZyNekznE0EqBJMqHLKdJAhGBAx6rvx8BNc02W/KSbgK6mnorZHGAQzRzjW3yYJOXpbi
 tNWA==
X-Gm-Message-State: AOAM532ObbrY42nNwq0f2SR65zxhOi7dRQlngpBlW7CIIAagsNvncax2
 H3oXq81rt50Q1VJmDNDq8QpOVQKfWH8=
X-Google-Smtp-Source: ABdhPJzdiD3WC5KwiMhlYjdknwpldlxNwtt8JdWAaGVthkitVPKXZ3mzcHZWlV+3WygpaXf8YvWQSw==
X-Received: by 2002:a05:600c:2118:: with SMTP id
 u24mr3490242wml.0.1637184834265; 
 Wed, 17 Nov 2021 13:33:54 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id z15sm977347wrr.65.2021.11.17.13.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 13:33:53 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 22:33:48 +0100
Message-Id: <20211117213348.231529-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for-2021.08.x] support/docker: remove expired
 mozilla/DST_Root_CA_X3.crt
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2luY2UgdGhlIDMwdGggU2VwIDIwMjEgdGhlIGRvY2tlciBpbWFnZSB1c2VkIHRoZSBnaXRsYWIt
Y2kgaXMgbm90IGFibGUKdG8gZG93bmxvYWQgdGhlIHRvb2xjaGFpbiBhcmNoaXZlIGZyb20gaHR0
cHM6Ly90b29sY2hhaW5zLmJvb3RsaW4uY29tIGR1ZQp0byBhbiBleHBpcmVkIGNlcnRpZmljYXRl
LgoKd2dldCBodHRwczovL3Rvb2xjaGFpbnMuYm9vdGxpbi5jb20vZG93bmxvYWRzL3JlbGVhc2Vz
L3Rvb2xjaGFpbnMvYWFyY2g2NC90YXJiYWxscy9hYXJjaDY0LS1nbGliYy0tYmxlZWRpbmctZWRn
ZS0yMDIwLjA4LTEudGFyLmJ6MgpDb25uZWN0aW5nIHRvIHRvb2xjaGFpbnMuYm9vdGxpbi5jb20g
KHRvb2xjaGFpbnMuYm9vdGxpbi5jb20pfDUxLjI1NC4xNDkuMTk5fDo0NDMuLi4gY29ubmVjdGVk
LgpFUlJPUjogVGhlIGNlcnRpZmljYXRlIG9mIOKAmHRvb2xjaGFpbnMuYm9vdGxpbi5jb23igJkg
aXMgbm90IHRydXN0ZWQuCkVSUk9SOiBUaGUgY2VydGlmaWNhdGUgb2Yg4oCYdG9vbGNoYWlucy5i
b290bGluLmNvbeKAmSBoYXMgZXhwaXJlZC4KClJlbW92ZSBleHBpcmVkIG1vemlsbGEvRFNUX1Jv
b3RfQ0FfWDMuY3J0IFsxXS4KClsxXSBodHRwczovL3N0YWNrb3ZlcmZsb3cuY29tL3F1ZXN0aW9u
cy82OTQwODc3Ni9ob3ctdG8tZm9yY2Utb2xkZXItZGViaWFuLXRvLWZvcmdldC1hYm91dC1kc3Qt
cm9vdC1jYS14My1leHBpcmF0aW9uLWFuZC11c2UtaXNyZwoKU2lnbmVkLW9mZi1ieTogUm9tYWlu
IE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgpDYzogWWFubiBFLiBNT1JJTiA8eWFubi5t
b3Jpbi4xOTk4QGZyZWUuZnI+Ci0tLQpCYWNrcG9ydCB0aGlzIHBhdGNoIGZvciAyMDIxLjA4Lngg
YW5kIDIwMjEuMDIueCB1c2luZyBidWlsZHJvb3QvYmFzZToyMDIwMDgxNC4yMjI4Ci0tLQogc3Vw
cG9ydC9kb2NrZXIvRG9ja2VyZmlsZSB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9zdXBwb3J0L2RvY2tlci9Eb2NrZXJmaWxlIGIvc3VwcG9ydC9k
b2NrZXIvRG9ja2VyZmlsZQppbmRleCBhOWJhY2NhM2EwLi5lNjVmODQwZGE4IDEwMDY0NAotLS0g
YS9zdXBwb3J0L2RvY2tlci9Eb2NrZXJmaWxlCisrKyBiL3N1cHBvcnQvZG9ja2VyL0RvY2tlcmZp
bGUKQEAgLTQ3LDYgKzQ3LDggQEAgUlVOIGFwdC1nZXQgaW5zdGFsbCAteSAtLW5vLWluc3RhbGwt
cmVjb21tZW5kcyBcCiAgICAgICAgIHVuemlwIFwKICAgICAgICAgd2dldCBcCiAgICAgICAgICYm
IFwKKyAgICBzZWQgLWkgJy9ebW96aWxsYVwvRFNUX1Jvb3RfQ0FfWDMuY3J0JC8gcy9eLyEvJyAv
ZXRjL2NhLWNlcnRpZmljYXRlcy5jb25mICYmIFwKKyAgICB1cGRhdGUtY2EtY2VydGlmaWNhdGVz
ICYmIFwKICAgICBhcHQtZ2V0IC15IGF1dG9yZW1vdmUgJiYgXAogICAgIGFwdC1nZXQgLXkgY2xl
YW4KIAotLSAKMi4zMS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
