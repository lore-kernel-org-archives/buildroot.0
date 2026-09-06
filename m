Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80DD9C79F85
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 09:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D827860616;
	Sun,  6 Sep 2026 09:50:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TWApxCDDV3-p; Sun,  6 Sep 2026 09:50:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 91A3D605F3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788688205;
	b=NE3wYU6ytZhaMqEJmyfY1ZA12cMgsO6+0YrXTgYUgK2G64Cl/DZ6mzpi2cV1KMPyiPLG
	 35/JvaHFLAesY1+GlwHgtO42ewqtn3vI2obPkJd3vdqRtNF6cvztxkQv560l56Vew7Mmo
	 o8rPWLKoMVV8iqimYh3vwLdE22AyQr70d6Dy0Q0i4HdPlOz3F7/bkgYDxH9H+RfE9zReh
	 W2tL3KZqayNKvA1qiPMa2aYvB47e2DKYX2QFXTPL6iDRV3E1ptOPC+ZgEsGuNlhZlpSwy
	 LG9mYVCQslVUyeCnTAzilz2ZYIGr/EstuAwmY9qt7n93AzVxsMu0KsYp/ajma+zISXA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788688205;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ncYl8gkXuLZ1T+WahsJzQyym9jj/b8uz5htyHerM8wQ=;
	b=Vjgky71qxpzpeBdCQAmxtt7CT1FRFC7R2BYHmKOUE5XKdEWr7hsLfKgEvp//+S3xDwR2
	 jo672fkd+EWbPZcbHr76nORdYedrAZgM/2V6IilGd4CeRUfKzzTMFWbaX6i8Hj4OgRzNO
	 ikLgpyXq/TvQRKqwM7KeOTiazT1QPvo5v1PZSC0CWrE9xuDEEpXl2AvP4YCxlRSYrSveK
	 ANzM8CLnTc8yVEKRekTa6EezdJs0t5BRJUptUcgPSp4EjrtxoCVT3QqvDnPgGGjMyb/UA
	 zDbtLAZI8fdWTRJQWfcAa7C5BrUEz9Zfuq+CWuN8W7OO2Yb/mT5AHQRj52/ZY7zF2pQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788688205;
	bh=ncYl8gkXuLZ1T+WahsJzQyym9jj/b8uz5htyHerM8wQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JyA9GhnxrmqTi1vsZ1tiqXA4zMIDV/2yC49UbHIuauEdFvjIpQheDoXA8koHqJtEu
	 1WCC6wqtO6VIDlxvhFMwJ3le0jVPHbHq+2PU/gG1pSo+tjzIjMqBhQMI1S1n1qDaib
	 LtHUbVH11jh9vnoEtjIEeYJn7tfIT6/jHDxHMeRq3FCc1G2yM3cSn+14vxfNy1KrFM
	 p41qs8s97/h/yO6JOgVmTa4v9Ey0knzjUnypYQJwRZsV5RBK8ZIK7wlp9kklEIl48D
	 RkOvFTm5lX30DlPzHyAz3Jbzb1egaBHQJlpoZE6cNOWIwNR8CNtxRwI5h0K0OTOCtk
	 gqCTyuVsPoI5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91A3D605F3;
	Sun,  6 Sep 2026 09:50:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 94254372
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79F7E80DBA
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:50:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GhCVaP7gDvbU for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 09:50:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0C6C380D15
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788688201;
 b=nI60NBsmK9ZQthE9XsmFJ9bqEm4EZeiTz4ZG/aHUFa/xWcGdxdGczmTQre6Y3U1QDb50
 LqVlQm1ZiQ4XeiciJ88AN5QN2CDl6CHHMKyl5iryO2OXLngbRuChL9rjjzbq5hxuoo90E
 qUTaarcxhPwVKxknYaE2FAiyvwS3mrGFtgGk9A4/tRBrDP1SIr/473KrjOtiU7IM+CYnj
 a1Gvd0a0o/QgH/2UnkZa4uoTsKW9V4iHirv7o/qTzN3IoWoOkFkEV0i4e3Svif8uQe10Y
 kUc1RkeskK5dVozpK0vVivUqPljARxg67vPHMv8fzQQHwNw8HyQG7D7TkvqHTGHbShg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788688201;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 bh=XpgsQ6T76BIhgb6PCvTt8iCXguK1GqTUKtXB7E/6Csc=;
 b=DhNDxrnuB4ShGUJu7+k/9riybTZ6BOl6MkdoQd3wfwDBF7xQaV4mopGbYCWo6V4JLmtF
 QfeOZ6XJ7b2XnepvHoATwcB800r1OScA2vc4nxFQ+9mJrw8vYxOxkSmKRbEma3TS6NWfE
 DCacm1Me2A9zJ/I9rB4+JjjgAPiJCyKsPCZDFFoZkDBbof0i09vMVuRvZqTmeEgnAiFvZ
 Avl7+UijNxV9yrAbmc/8CAwGyle2DRqYcMX2yg6fsS3U33xxCNlhj+++fidlt3tGykqCm
 4ENUSN0s0f0H8Lg7MrV4SMYLVcSDRd6a5S/r02xwtHdAjj8qPu1RGMpPbm+5iAB37Sg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=UQhCIkD3; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=UQhCIkD3
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C6C380D15
 for <buildroot@busybox.net>; Sun,  6 Sep 2026 09:50:00 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-499ae1c6471so23427275e9.3
 for <buildroot@busybox.net>; Sun, 06 Sep 2026 02:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788688198; x=1789292998; darn=busybox.net;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=XpgsQ6T76BIhgb6PCvTt8iCXguK1GqTUKtXB7E/6Csc=;
 b=UQhCIkD3jSl4FA7AMwdyC+schxjN5wcxeheIJ3c/5vZRuz6noYVkzgp165lCLEbbG3
 GPjsObl+NxRidv5VQmi2gu/Vjnk9lNqtkvxLuP78WXIylYWUO3ISGTA4+j9IkzI7uPor
 I/XR5u3D5OebmW1886s56gUWh0vV5xvcx6Me9a7xe7Fb9Y5uPPYBTu4D/IwoUuqK0Rvn
 b9Q1j9slv+qkoFm6kHkpaL9GpsPDUrhVKhHZalpKKqJ1T/lsB8U1Rtx7q+6lpgrQe5ai
 VeNJpoyXafjwypRtWqWAbpGWYhxcqpys2ooh6XMa9KBVSnoxwTNMJEjBubRdsgDjV/I7
 ttTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788688198; x=1789292998;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=XpgsQ6T76BIhgb6PCvTt8iCXguK1GqTUKtXB7E/6Csc=;
 b=ATvQdFUFeuxBCrUX+ISpQXl2HEsyol9xTyIyvr4t873RXsxP0JPgw+Zv4dLQZoLJA9
 VUJcTvsgXg6JidNf6eubi2Qxnx/cM02CF7tkUgNSDQBtXC56AAJsj14IbC71nUv1EOnH
 UFdMENq6iTkrMlOdt4qXqL5CWT1yb2qOofVZjWUrzo9Bgq1SMYqE1qz0nZFy5SGZwUZ3
 LXsvCJzDVnYfRfXRxj/1p7ajYMDOvSBbXhj33mlK8d2TI3XSWtHIL8uAtRAQLnkrGlst
 SYgqntb6xo3ENsCiMtL5PT23qzPsy6bub/z/HZ/uaqBzy62nYD2px/0hMXiKveqO4ZCx
 07Aw==
X-Gm-Message-State: AFuF++n+y8YoQkcvbZUOvb7g/3P1p7iifeu61owJ+let3QAMVOMKo5jX
 XEOgNxSYSE37r0rM16O2gB5rtLIsF03YsqgrXGhRqG4oE2GgR45u/qEX9xQnpg==
X-Gm-Gg: AYBFou3yp2rpFnbGxD87KthyhKsuEQgAbyUGiI0yDDaM29PrZMGQN1WocrDWb3JK+eq
 czM21t5VBlAPUzDnCVUWiz1XtkrxSYqmcDDWkKpk42UqPBlt05PRPdtnNsTeQHVjFY2rd/xYA+C
 GnRzkQwv81GWBNwnGXNixMm4phoYJor9plCXW2pG+9IeBuSG/3VJVGvtCPsz6B2F0D6bOwhffeV
 wSm6uZXJcgiEX0BwvTr8+y9E/hS9MY/HU6BR4wHtpyYN7Nqzux/0RTjw6XXeTZJTaw14ZSGJDPf
 MKR6lJ6CV5fq3pPqUITanz52QW/U0obq4iv+tFljqP+C8UAIwfVIhLrgZAfPxKo6Nw/WkwNWkhi
 EGhEKeWupkMcL7+HL6x/f1lzI6uwzHbxEBiLp84b7stbW/qA74xMQq2G3FTa2Xf98CU7RHq//v0
 2OpJveUOG2XYLOotrv3ClA8mbOLElkNTyDg+ccx/mSugSzY7Wj61hgRfIWYgJp9nIG3cG31EbYP
 0IK4DsDrmFn41CYZpLTz+8RYxE1zQ==
X-Received: by 2002:a05:600c:6290:b0:499:8174:9f39 with SMTP id
 5b1f17b1804b1-49cf7f3d239mr353982445e9.0.1788688198002; 
 Sun, 06 Sep 2026 02:49:58 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf770fcf5sm217467155e9.6.2026.09.06.02.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Sep 2026 02:49:57 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Sun,  6 Sep 2026 11:49:31 +0200
Message-ID: <20260906094932.638444-1-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/lpty: bump to version 1.2.2
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

c3dpdGNoIHRvIGdlbmVyaWMgaW5mcmFzdHJ1Y3R1cmUKCmRpZmYgTElDRU5TRTogdXBkYXRlIGNv
cHlyaWdodCB5ZWFycwogICAgLSBDb3B5cmlnaHQgKGMpIDIwMTAtMjAxMyBHdW5uYXIgWsO2dGwg
PGd6QHRzZXQuZGU+CiAgICArIENvcHlyaWdodCAoYykgMjAxMC0yMDE1IEd1bm5hciBaw7Z0bCA8
Z3pAdHNldC5kZT4KClNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNvaXMucGVy
cmFkLjg2QGdtYWlsLmNvbT4KLS0tCiBwYWNrYWdlL2xwdHkvQ29uZmlnLmluIHwgIDIgKy0KIHBh
Y2thZ2UvbHB0eS9scHR5Lmhhc2ggfCAgNiArKystLS0KIHBhY2thZ2UvbHB0eS9scHR5Lm1rICAg
fCAyNCArKysrKysrKysrKysrKysrKysrKy0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0
aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xwdHkvQ29uZmln
LmluIGIvcGFja2FnZS9scHR5L0NvbmZpZy5pbgppbmRleCBlZTJkNGMyMGIuLjVkNmJjNTQxMiAx
MDA2NDQKLS0tIGEvcGFja2FnZS9scHR5L0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL2xwdHkvQ29u
ZmlnLmluCkBAIC00LDQgKzQsNCBAQCBjb25maWcgQlIyX1BBQ0tBR0VfTFBUWQogCSAgQSBzaW1w
bGUgZmFjaWxpdHkgZm9yIGx1YSB0byBjb250cm9sIG90aGVyIHByb2dyYW1zIHZpYQogCSAgUFRZ
cy4KIAotCSAgaHR0cDovL3d3dy50c2V0LmRlL2xwdHkvCisJICBodHRwczovL3d3dy50c2V0LmRl
L2xwdHkvCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xwdHkvbHB0eS5oYXNoIGIvcGFja2FnZS9scHR5
L2xwdHkuaGFzaAppbmRleCAxZmU4ODEwN2UuLmI2ODMyMTA4MiAxMDA2NDQKLS0tIGEvcGFja2Fn
ZS9scHR5L2xwdHkuaGFzaAorKysgYi9wYWNrYWdlL2xwdHkvbHB0eS5oYXNoCkBAIC0xLDMgKzEs
MyBAQAotIyBjb21wdXRlZCBieSBsdWFyb2Nrcy9idWlsZHJvb3QKLXNoYTI1NiAgY2YyNjNlY2U5
YjUwYTc4YTdmYjIyNzdlMzU0NmZiYmYwYmY2ODU4ZjQxODIxOTMyZDkyZjJlM2Q4YTA2NTA5MSAg
bHB0eS0xLjAuMS0xLnNyYy5yb2NrCi1zaGEyNTYgIGM1YTEyOGE3M2NhZDVmNmUxMTFlYmQ4ZjRh
OWZhMzUwMDU2MmM1NzkxMjk3MmViMTU2MjdkYjk2MTBkNDNkZWMgIGxwdHktMS4wLjEtMS9kb2Mv
TElDRU5TRQorIyBMb2NhbGx5IGNvbXB1dGVkCitzaGEyNTYgIDJiOGQxZGViNDczZTI5Y2I0NGI3
NjRhN2Y5ZmNlZmIyODdmMTczMTc4MjE1MWFmZDQ4MjJkYjM2MzYyNDliYTMgIHZlcnNpb25fMS4y
LjIudGFyLmd6CitzaGEyNTYgIGFkN2ZkZThiOGYyY2E1NTU3YmU0ODFjZDFhYjZlYmMzN2I3MGQ2
OGY3OGVhODFjM2UwODNiYjY0NGJkMWYzMzMgIHNyYy9kb2MvTElDRU5TRQpkaWZmIC0tZ2l0IGEv
cGFja2FnZS9scHR5L2xwdHkubWsgYi9wYWNrYWdlL2xwdHkvbHB0eS5tawppbmRleCA1YTY5MTI1
NmMuLjhhODdmODZkYyAxMDA2NDQKLS0tIGEvcGFja2FnZS9scHR5L2xwdHkubWsKKysrIGIvcGFj
a2FnZS9scHR5L2xwdHkubWsKQEAgLTQsOSArNCwyNSBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMKIAotTFBUWV9WRVJTSU9OID0gMS4wLjEtMQotTFBUWV9TVUJESVIgPSBscHR5LSQoTFBU
WV9WRVJTSU9OKQorTFBUWV9WRVJTSU9OID0gMS4yLjIKK0xQVFlfU09VUkNFID0gdmVyc2lvbl8k
KExQVFlfVkVSU0lPTikudGFyLmd6CitMUFRZX1NJVEUgPSBodHRwczovL2NvZGViZXJnLm9yZy9n
bmFyei9scHR5L2FyY2hpdmUKIExQVFlfTElDRU5TRSA9IE1JVAotTFBUWV9MSUNFTlNFX0ZJTEVT
ID0gJChMUFRZX1NVQkRJUikvZG9jL0xJQ0VOU0UKK0xQVFlfTElDRU5TRV9GSUxFUyA9IHNyYy9k
b2MvTElDRU5TRQorTFBUWV9ERVBFTkRFTkNJRVMgKz0gaG9zdC1sdWFpbnRlcnByZXRlciBsdWFp
bnRlcnByZXRlcgogCi0kKGV2YWwgJChsdWFyb2Nrcy1wYWNrYWdlKSkKK2RlZmluZSBMUFRZX0JV
SUxEX0NNRFMKKwkkKFRBUkdFVF9NQUtFX0VOVikgJChNQUtFKSBcCisJCUxVQT0iJChIT1NUX0RJ
UikvYmluL2x1YSIgXAorCQlMVUFfSU5DRElSPSIkKFNUQUdJTkdfRElSKS91c3IvaW5jbHVkZSIg
XAorCQlMVUFfTElCRElSPSIkKFNUQUdJTkdfRElSKS91c3IvbGliIiBcCisJCUNDPSIkKFRBUkdF
VF9DQykiIFwKKwkJQ0ZMQUdTPSIkKFRBUkdFVF9DRkxBR1MpIC1mUElDIiAtQyAkKEBEKS9zcmMK
K2VuZGVmCisKK2RlZmluZSBMUFRZX0lOU1RBTExfVEFSR0VUX0NNRFMKKwkkKElOU1RBTEwpIC1E
IC1tIDA3NTUgJChARCkvc3JjL2xwdHkuc28gXAorCQkkKFRBUkdFVF9ESVIpL3Vzci9saWIvbHVh
LyQoTFVBSU5URVJQUkVURVJfQUJJVkVSKS9scHR5LnNvCitlbmRlZgorCiskKGV2YWwgJChnZW5l
cmljLXBhY2thZ2UpKQotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
