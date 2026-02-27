Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EB1FEFB6A
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 16:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57E4560B33;
	Fri, 27 Feb 2026 16:09:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DLZfxbTWFoPW; Fri, 27 Feb 2026 16:09:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2510E60B25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772208542;
	bh=t3dOQv+vIcfYfyVL5JsdQckD54eXtDGwf66v6S4Pa+s=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JIKEwkcF72cNGQmwfX+h7f0ibDIQjJPatLClkd1dOzB9rp9c24VHwjrnFMjlxrhK2
	 ynhENKLTsv7vouBmnQ4jjV8MoY2fRMxiwZJ9p1BYLcw95b5YspkSWHjjYqMzvJwBed
	 DGK0KNMhAV1gclFpt1DaQ21wCfiT2OpDDsXpl9O8OB+raQWReDBVgAMYp+lgyf8bMx
	 VHAm0jUfGMAKCgUCkv33TIvwlCtWiyv6RlzySJ1DXjcRznNbx+R0eIdnlNhkC++tLI
	 20ouuBYINTQSW3gOjhRh8RS7z6NqB4ojkx1vTeV1I/E+5yyD82gFUD+8szD0TcLbVk
	 jaYeqpuLVz1GQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2510E60B25;
	Fri, 27 Feb 2026 16:09:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 06F5B1F3
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 16:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ECFE9406F8
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 16:09:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AeeAGRUh0Xfo for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 16:09:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8D336406EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D336406EB
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8D336406EB
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 16:08:59 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-3870778358aso27342661fa.1
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 08:08:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772208537; x=1772813337;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=a2B82XjKW5DO8VqRhR+KiIQkD7iRIGZB7O/9CZmw4cM=;
 b=Ecyu1K+Zr6liAOyvB0l+dwPqVD7LXYfq3I+2AmZhX0sZ3XUwTj/F3N0Fy6COl/eO+x
 UTVsHYU2FRpJaIW+rFf6W8XRYP4HMHSRxAq5ilIMpialIWbr7laUbP/H7XWCcO0MxxZU
 Cp+pwDAMvg3WLadnbFFe+zA1qf5Wyy789YpSXJlUdcqh5rD95ALQ5eQvuPhtWC9DoA4z
 4+fbXaOGV9S2vQzYicteWLFX0ouQUmAZ5e8tJ8JUiuJKwPkSNEI9W2azNNnpXdPSddWM
 U9hGueehj6qHo9Bmg4sW+8Or8mBUSzpFgBTSRo/DUdJQ/44M9pWvF4f8989PFyBm+LL3
 AGUA==
X-Gm-Message-State: AOJu0YygRuqig7B/jLRNLNjS/4I7sxQM+8ce5R7LFSsfPyLbkqv+me5R
 OjZl9MZy1Tr1Ww3rVEnpPe1uRrqd8W0mUwYL0/s94ngqQFjive/M8/Lhwv92Kg==
X-Gm-Gg: ATEYQzz6q0CTMJo5SuxIef9AIV7QcJc83HAZetK85T66iNog8r7ULkZr6zc4PO76H5l
 Tdt8uYJaxzwO8MudZ1S1KVzhC4mD3s0cI2fVKA0CcbYPSBPFglJwzAdmklDIoaZB3noo5NFNsPh
 270e8IJkeHkknymxy0SwzQnElmnNYOHiEzIRD4HQhS5dGrVZQB28wa/gbvfTPEqH/JO5kAm6ilG
 JOky1aJS5+VCuwqGjzqWI7YhHCdTEJ64aLRBWSdPnHRgAsOLlHGI0MquipGfJTgp/tJaeN3Dpxv
 uj5sVYYo9UITRZJy0Jxtl30ODA2puFhFBHE1OpwmHPP0VWTVnrJTMPcO2Kzzv4pVgtsZd9VthLP
 bxzu3KGZKbrZzrRnMSYBSuTHirdOt/MZ4Zrm9jn8+T9OfxBXc9v+02Ry6vjZvlUkDfXPGDTmhi9
 318SEFGTyLtOJuuVRvriSIkBok1prO6XfsaZGm+e3dRDTGSnvNQMqgLLQv8xXNqA==
X-Received: by 2002:a05:651c:324e:b0:383:1b4b:c2b7 with SMTP id
 38308e7fff4ca-389ff34fa4amr23050601fa.19.1772208536546; 
 Fri, 27 Feb 2026 08:08:56 -0800 (PST)
Received: from tollan.addiva.ad (h-79-136-37-74.A259.priv.bahnhof.se.
 [79.136.37.74]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389f2f6388asm15582621fa.16.2026.02.27.08.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 08:08:55 -0800 (PST)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E . MORIN" <yann.morin@orange.com>,
 =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Date: Fri, 27 Feb 2026 17:08:42 +0100
Message-ID: <20260227160842.2905924-1-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772208537; x=1772813337; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=a2B82XjKW5DO8VqRhR+KiIQkD7iRIGZB7O/9CZmw4cM=;
 b=T1f7QH9it1D6uFF3WuIC4hrk2daqtJ3xS0SafMILFO09W4UJuxBBx398b4H2FW/cnR
 5sW+3d4OSFLOLSSkRDLpxipkxojp9VsG93GpJmPFbiF61XeM2u5+bCkZou1m2Y0LQv4f
 w15bOgUNP/G2evkBXFJxVmIykfRoXnNXUKoohsdixXtEahx5U4qmFyl+HCDNbDFMPOQV
 9/yR24QUw5IVK1wYQtzPm3T6418rx3Yp+U1rq5qTOSBU3A8Dmtwcv3xt9ft1IAAjZzLS
 cR47LIrdtaf4AxyM9fQL1UCVvvkhwKo0PTr06bXGgaC78EDO9WwYrViGMU38a0eh+MNf
 iLcA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=T1f7QH9i
Subject: [Buildroot] [PATCH 1/1] package/gpsd: Bump version to 3.27.5
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

U2lnbmVkLW9mZi1ieTogTWF0dGlhcyBXYWxzdHLDtm0gPGxhenplckBnbWFpbC5jb20+Ci0tLQog
cGFja2FnZS9ncHNkL2dwc2QuaGFzaCB8IDIgKy0KIHBhY2thZ2UvZ3BzZC9ncHNkLm1rICAgfCAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9wYWNrYWdlL2dwc2QvZ3BzZC5oYXNoIGIvcGFja2FnZS9ncHNkL2dwc2QuaGFz
aAppbmRleCBhN2I3NmFmYmM2Li4zODYwNGM3MmI4IDEwMDY0NAotLS0gYS9wYWNrYWdlL2dwc2Qv
Z3BzZC5oYXNoCisrKyBiL3BhY2thZ2UvZ3BzZC9ncHNkLmhhc2gKQEAgLTEsMyArMSwzIEBACiAj
IExvY2FsbHkgY2FsY3VsYXRlZAotc2hhMjU2ICBlYmI2NmVkOTIwMThiNzljZWM4OGVmYjYwZTM1
YTU5NjkyNWVlZjQ2NTAyY2YwM2Q2ZmYwYWVhNjM2ZWU3NDYxICBncHNkLTMuMjcuMi50YXIuZ3oK
K3NoYTI1NiAgNDA5ODczZjUwNDg0NjJlZjFhYzQxM2E1MWFiMzVjYWE4YjUwYjMxYmU2MmIzMzQ3
YmVlMWNjMjk5NGU3YzY0OSAgZ3BzZC0zLjI3LjUudGFyLmd6CiBzaGEyNTYgIGZkZjMzOTk5N2Ji
Y2E5ZWFmNTA3NDc2YjgyZmJjYWM2MDhmYzM5YTNkODliODZiNTFlMTZkYjRjOWY5MzM3MTYgIENP
UFlJTkcKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ3BzZC9ncHNkLm1rIGIvcGFja2FnZS9ncHNkL2dw
c2QubWsKaW5kZXggNmRjMDEyNTNhNS4uMjdhMDJjMTc1NCAxMDA2NDQKLS0tIGEvcGFja2FnZS9n
cHNkL2dwc2QubWsKKysrIGIvcGFja2FnZS9ncHNkL2dwc2QubWsKQEAgLTQsNyArNCw3IEBACiAj
CiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1HUFNEX1ZFUlNJT04gPSAzLjI3LjIKK0dQU0Rf
VkVSU0lPTiA9IDMuMjcuNQogR1BTRF9TSVRFID0gaHR0cDovL2Rvd25sb2FkLW1pcnJvci5zYXZh
bm5haC5nbnUub3JnL3JlbGVhc2VzL2dwc2QKIEdQU0RfTElDRU5TRSA9IEJTRC0yLUNsYXVzZQog
R1BTRF9MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwotLSAKMi40My4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
