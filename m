Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE2AC369B8
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 08:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EB28820D7;
	Tue, 15 Apr 2025 08:57:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lJqqY-qULh35; Tue, 15 Apr 2025 08:57:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42A0A836F0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42A0A836F0;
	Tue, 15 Apr 2025 08:57:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 281F0109
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 08:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6B354192A
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 08:57:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oKI1mSD5ZCQP for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 08:57:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=gael.portay+rtone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C129C41973
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C129C41973
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C129C41973
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 08:57:48 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-39127effa72so443361f8f.2
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 01:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744707466; x=1745312266;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5iy9fD8pi3oiQtum9ZJrFHk+y5bcp3yEla4dEqRSkKs=;
 b=XOBmQr9qERekD0Ps3v/tskWKzNEUVlqFu+8H9NIE3/Jn413XTfqdT75LU7Tq2byjPv
 Pf1NUvD1ZtfdkxpvVu4TVWkrYwC3YPoVelT1hd0MTGb2QQTvUDvBJndUMRSSzYXp7vgq
 fMRnb6LMHistA5OlbBO+yuJbqzOH9L7IyqsbpSWnIJQzBjeOQCkvYpIL/0aPjeWMe4Gk
 dWBYHBid6B26sUTsnNS/tBYI6TMJLrkl4P2cHWSAveeEwPCHRBi6wyN24HOXUpIaWQGs
 qcigqswHT56pKfXrgmLEw4j0NwaOxe5BDhjMH+Sp7LLoT0ldKcCQON0OQEXqNEeqeHqt
 sbIA==
X-Gm-Message-State: AOJu0YyOOay7p/Z6Lw5/y+ksY4+8dFLb9On1Vka9xLufwhdDetzfpNKr
 FdSkb++QWP2OzZ5rdr1DbDdrVg100mIVcSf4p+yeUjERQl1svOU2dpv0CMFb
X-Gm-Gg: ASbGnctFbVDTYd260Hno2X2hb9i+pas2HNhL8dYkOx1A64uL3PmZofFVQJrm4H9KPtK
 3oW6W+m3ZLW0sjclAPrsRecZyAJFMyIsvrIm2TL65Y5FgB2/hOQiQ+CSbLugvF6g5vYN9d32f8i
 mLJyuZEpMNOglnkjXOOjG5zSGbxO2Acqd2djjDA2goaXfUdW3ZNpkgsxO9BpTQ5fHEiKLzZeetV
 2Y/oDB6JPxA7O6Bb7B7BIZwPCd2/hfv+vmAoDjqe3G379Lq7Spm44bwFCahsEkSSinWJy2hQmYI
 rFmaaSD2/pPMMoCGR+djeqaxwYNY/uyIEaOaH8kdUrW0qov/ErM=
X-Google-Smtp-Source: AGHT+IE26myp1/iCvIg0ngocTKkwGc0K4Gy8bdBev2b4jSjSulwXwu/hsJB7ae9fG0rmeJ5e1tAnYg==
X-Received: by 2002:a05:6000:1a8e:b0:38d:d743:7d36 with SMTP id
 ffacd0b85a97d-39eaaec4957mr4397973f8f.10.1744707465881; 
 Tue, 15 Apr 2025 01:57:45 -0700 (PDT)
Received: from archlinux.. ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae96c661sm13357921f8f.29.2025.04.15.01.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 01:57:45 -0700 (PDT)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>
Date: Tue, 15 Apr 2025 10:57:34 +0200
Message-ID: <20250415085737.1827669-1-gael.portay+rtone@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744707466; x=1745312266; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=5iy9fD8pi3oiQtum9ZJrFHk+y5bcp3yEla4dEqRSkKs=;
 b=WIgv1mop+xnxvRRnG0aXUQt/z3SZAVxqUhIFGZIMyLUKu19tcPwIEKfUDk93t+bUsT
 4kQNBmdLJEjnyKmjqi9OZS8et6xENMNKkBauqvu/sdW+pXpdFtHV+JYdi0swvROCblIN
 WtE2/I0rdGhF7exZnhYDoNy0LeO+DYek2LWBR8sIvYl0mRBBq01f0p1jtVvOdAnr2z58
 TH2piv7Y+IVGGWzrW4CnjOd3F1o0F19cqEnC0KCyWoQopN6e8qO1ZcMVuQlMF8XEfnRR
 vc54abWfeuhb08mntATrVhR8aXsiveV5ZSfJ5UIwwPXpY3AlqGA/QF8IPUlfjxBazJcs
 L0Ww==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WIgv1mop
Subject: [Buildroot] [PATCH 0/3] configs/raspberrypi*: bump
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpUaGlzIHBhdGNoIHNlcmllcyBidW1wcyB0aGUgbGludXgga2VybmVsIG9mIHRoZSBS
YXNwYmVycnkgUGkgaGFyZHdhcmVzCmZyb20gNi42IHRvIDYuMTIuCgpUaGUgZmlyc3QgcGF0Y2gg
dXBkYXRlcyB0aGUgZGVmY29uZmlnIHNldCB0byBidWlsZCB0aGUgNjQtYml0IGtlcm5lbHMKZm9y
IHRoZSBCQ00yNzEwL0JDTTI4MzcgaGFyZHdhcmVzIChpLmUuIFJhc3BiZXJyeSBQaSAzLCBhbmQg
UmFzcGJlcnJ5IFBpClplcm8gMlcpLCBhcyBpdCB3YXMgZGVsZXRlZC4gSSB0aGluayB0aGUgZm9y
bWVyIGRlZmNvbmZpZyBoYXMgbmV2ZXIgYmVlbgp1c2VkIG9mZmljaWFsbHkgdG8gcmVsZWFzZSBh
IDY0LWJpdCBrZXJuZWwgb2YgUmFzcGJlcnJ5IFBpIE9TIDY0LWJpdC4gSQpoYXZlIHRlc3RlZCB0
aGUgbmV3IGRlZmNvbmZpZyBvbiBSYXNwYmVycnkgUGkgMyBhbmQgUmFzcGJlcnJ5IFplcm8gMlcs
CmFuZCB0aGV5IGJvdGggYm9vdHMgdGhlIDY0LWJpdCBrZXJuZWwuCgpUaGUgc2Vjb25kIHBhdGNo
IGJ1bXBzIHRoZSByYXNwYmVycnktZmlybXdhcmUgdG8gMS4yMDI1MDMyNiB0byBpbnN0YWxsCnRo
ZSBkZXZpY2UtdHJlZSBvdmVybGF5IGJsb2JzIG1hdGNoaW5nIHRoZSB1cGNvbWluZyBidW1wIG9m
IHRoZSBrZXJuZWwuCgpOb3RlOiBUaGUgYnVtcCBvZiBwYWNrYWdlcyBycGktZmlybXdhcmUgYW5k
IGxpbnV4IGhhdmUgdG8gYnkgc3luY2VkLApzaW5jZSB0aGUgbGludXggcGFja2FnZSBkb2VzIG5v
dCBpbnN0YWxsIHlldCBpdHMgZGV2aWNlLXRyZWUgb3ZlcmxheQpibG9icy4KClRoZSB0aGlyZCBw
YXRjaCBidW1wcyB0aGUgZG93bnN0cmVhbSBsaW51eCBrZXJuZWwgdG8gNi4xMi4yMCBmb3IgZXZl
cnkKUmFzcGJlcnJ5IFBpIGRlZmNvbmZpZ3MuCgpJbXBvcnRhbnQ6IEV2ZXJ5IGRlZmNvbmZpZyBv
dXRwdXQgYm9vdCBzdWNjZXNzZnVsbHkgb24gcmVhbCBoYXJkd2FyZXMuCgpSZWdhcmRzLApHYcOr
bCBQT1JUQVkgKDMpOgogIGNvbmZpZ3MvcmFzcGJlcnJ5cGl7emVybzJ3LDN9XzY0OiB1cGRhdGUg
ZGVmY29uZmlnCiAgcGFja2FnZS9ycGktZmlybXdhcmU6IGJ1bXAgdmVyc2lvbiB0byAxLjIwMjUw
MzI2CiAgY29uZmlncy9yYXNwYmVycnlwaSo6IGJ1bXAga2VybmVsIHZlcnNpb24gdG8gY2QyMzFk
NCAoNi4xMi4yMCkKCiBib2FyZC9yYXNwYmVycnlwaS9wYXRjaGVzL2xpbnV4L2xpbnV4Lmhhc2gg
fCAyICstCiBjb25maWdzL3Jhc3BiZXJyeXBpMF9kZWZjb25maWcgICAgICAgICAgICAgfCA0ICsr
LS0KIGNvbmZpZ3MvcmFzcGJlcnJ5cGkwd19kZWZjb25maWcgICAgICAgICAgICB8IDQgKystLQog
Y29uZmlncy9yYXNwYmVycnlwaTJfZGVmY29uZmlnICAgICAgICAgICAgIHwgNCArKy0tCiBjb25m
aWdzL3Jhc3BiZXJyeXBpM182NF9kZWZjb25maWcgICAgICAgICAgfCA2ICsrKy0tLQogY29uZmln
cy9yYXNwYmVycnlwaTNfZGVmY29uZmlnICAgICAgICAgICAgIHwgNCArKy0tCiBjb25maWdzL3Jh
c3BiZXJyeXBpM19xdDV3ZV9kZWZjb25maWcgICAgICAgfCA0ICsrLS0KIGNvbmZpZ3MvcmFzcGJl
cnJ5cGk0XzY0X2RlZmNvbmZpZyAgICAgICAgICB8IDQgKystLQogY29uZmlncy9yYXNwYmVycnlw
aTRfZGVmY29uZmlnICAgICAgICAgICAgIHwgNCArKy0tCiBjb25maWdzL3Jhc3BiZXJyeXBpNV9k
ZWZjb25maWcgICAgICAgICAgICAgfCA0ICsrLS0KIGNvbmZpZ3MvcmFzcGJlcnJ5cGlfZGVmY29u
ZmlnICAgICAgICAgICAgICB8IDQgKystLQogY29uZmlncy9yYXNwYmVycnlwaWNtNGlvXzY0X2Rl
ZmNvbmZpZyAgICAgIHwgNCArKy0tCiBjb25maWdzL3Jhc3BiZXJyeXBpY200aW9fZGVmY29uZmln
ICAgICAgICAgfCA0ICsrLS0KIGNvbmZpZ3MvcmFzcGJlcnJ5cGl6ZXJvMndfNjRfZGVmY29uZmln
ICAgICB8IDQgKystLQogY29uZmlncy9yYXNwYmVycnlwaXplcm8yd19kZWZjb25maWcgICAgICAg
IHwgNCArKy0tCiBwYWNrYWdlL3JwaS1maXJtd2FyZS9ycGktZmlybXdhcmUuaGFzaCAgICAgfCAy
ICstCiBwYWNrYWdlL3JwaS1maXJtd2FyZS9ycGktZmlybXdhcmUubWsgICAgICAgfCAyICstCiAx
NyBmaWxlcyBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCAzMiBkZWxldGlvbnMoLSkKCi0tIAoy
LjQ5LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
