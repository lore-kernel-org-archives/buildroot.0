Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0F4C4706F
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 22:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0FA740A50;
	Mon,  1 Jan 2024 22:13:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0FA740A50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e0dd96tiN07j; Mon,  1 Jan 2024 22:13:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3F9C411A8;
	Mon,  1 Jan 2024 22:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3F9C411A8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 375761BF3BE
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 22:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D9B2420A4
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 22:13:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D9B2420A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7JmnWLPuxwGM for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 22:13:27 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07D5F42096
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 22:13:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07D5F42096
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40d604b4b30so22515215e9.1
 for <buildroot@buildroot.org>; Mon, 01 Jan 2024 14:13:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704147205; x=1704752005;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=APDrXonqimY25yTPUjvFZAAm21nODlk9YrR1h4IRzCs=;
 b=IWnXQEXdB4c742rXxoUsrAk5q4rUdGBVPoNS0xWAxvSzEOJel0i6dmy9GkibHcSh5R
 is16SnsbArJXZ9P96+jx98WpoWcoWhr55bGcHRviVuUw7cqVIxq1yiebBqwYDsBjftmq
 SoxjXBac4HN+RQeoLu14QGBWdheyy6P+yDSrXBkZtKJmS8m8cb2C4mM+fD8KP9UTye/+
 TPgLJve+t3rL4loy0UwFyZzA5rRqSD5/kZwgFooctbCFsKcDJyw15f+Ndwv4u5z80qEi
 PYaDkELALlbBLKYrVYQVOwrNXvOvUKf4VMjpZYq0ulBf3kYWYwMrTd0dEyLJgQTcJe94
 AI2w==
X-Gm-Message-State: AOJu0YyTeGDqeft+LiPRYexzPW/il7NzDG/GyJboskhk1XEsFHxQMlBo
 JZCQ6ho/JCElDbEZD3JLAX3flMjyhGw=
X-Google-Smtp-Source: AGHT+IGtkCtYy7jbhrG65RVvZWzCK8eMjEVDzr8ANI+xZvUn96rj32jZigNgIr9/sEebNGfJfxS1wQ==
X-Received: by 2002:a7b:c390:0:b0:40d:594b:7c64 with SMTP id
 s16-20020a7bc390000000b0040d594b7c64mr5563667wmj.163.1704147204638; 
 Mon, 01 Jan 2024 14:13:24 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 j36-20020a05600c1c2400b0040d5bc2ea43sm22779104wms.31.2024.01.01.14.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jan 2024 14:13:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jan 2024 23:13:17 +0100
Message-ID: <20240101221317.39694-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704147205; x=1704752005; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=APDrXonqimY25yTPUjvFZAAm21nODlk9YrR1h4IRzCs=;
 b=kfOElzRlwJVG6mURCj87Djy0fR03L8QUmexdbZokHzRLOxFjYeDPsNkK67wtUFhcgL
 e0H8rI7+d1gxelY2xuckydDcE1lhWNygXoGaxG5lzItokUV6V4WkiS2SUHri1z4qzgwf
 Dk+Yno79YTZvoJCOPOm9QK+5zUymJ0LTP1w5wSx7diFiRdKxXFPuSd9XWByaR0XmrNTq
 BQ3wgD2pwsgB77aupjBGDcg6QB6gVHHBk2pJmfcfgcGedb6Zm4jd1tzEMlxkj6mEBU5H
 2c3OgBHOqfgpmFBy9X2ZjDxzw00EvX5RxDFPbAgneWW2pVlVHVEk4IplDQY2ZRukiYGe
 0W7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kfOElzRl
Subject: [Buildroot] [PATCH 1/1] package/python-paramiko: security bump to
 version 3.4.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkcmVzcyBDVkUgMjAyMy00ODc5NSAoYWthIHRoZSDigJxUZXJyYXBpbiBBdHRhY2vigJ0sIGEg
dnVsbmVyYWJpbGl0eSBmb3VuZAppbiB0aGUgU1NIIHByb3RvY29sIHJlCgpodHRwczovL2dpdGh1
Yi5jb20vcGFyYW1pa28vcGFyYW1pa28vYmxvYi8zLjQuMC9zaXRlcy93d3cvY2hhbmdlbG9nLnJz
dAoKU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFp
bC5jb20+Ci0tLQogcGFja2FnZS9weXRob24tcGFyYW1pa28vcHl0aG9uLXBhcmFtaWtvLmhhc2gg
fCA0ICsrLS0KIHBhY2thZ2UvcHl0aG9uLXBhcmFtaWtvL3B5dGhvbi1wYXJhbWlrby5tayAgIHwg
NCArKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1wYXJhbWlrby9weXRob24tcGFyYW1pa28uaGFz
aCBiL3BhY2thZ2UvcHl0aG9uLXBhcmFtaWtvL3B5dGhvbi1wYXJhbWlrby5oYXNoCmluZGV4IGFi
YzYyZmM4YzIuLjg5M2FhYzA3NGUgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcHl0aG9uLXBhcmFtaWtv
L3B5dGhvbi1wYXJhbWlrby5oYXNoCisrKyBiL3BhY2thZ2UvcHl0aG9uLXBhcmFtaWtvL3B5dGhv
bi1wYXJhbWlrby5oYXNoCkBAIC0xLDUgKzEsNSBAQAogIyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBz
Oi8vcHlwaS5vcmcvcHlwaS9wYXJhbWlrby9qc29uCi1tZDUgIDA4YjE2MTBlM2JhOWZhODllMTM5
NzM3MTBjZDQ4ZTM1ICBwYXJhbWlrby0zLjMuMS50YXIuZ3oKLXNoYTI1NiAgNmEzNzc3YTk2MWFj
ODZkYmVmMzc1YzVmNWI4ZDUwMDE0YTFhOTZkMGZkN2YwNTRhNDNiYzg4MDEzNGIwZmY3NyAgcGFy
YW1pa28tMy4zLjEudGFyLmd6CittZDUgIGJlNDg1YmE2NmI1NzZkOGJjN2UxYzBhZDk2ZTg3MTA4
ICBwYXJhbWlrby0zLjQuMC50YXIuZ3oKK3NoYTI1NiAgYWFjMDhmMjZhMzFkYzRkZmZkOTI4MjE1
MjdkMTY4MmQ5OWQ1MmY5ZWY2ODUxOTY4MTE0YTg3MjhmM2MyNzRkMyAgcGFyYW1pa28tMy40LjAu
dGFyLmd6CiAjIExvY2FsbHkgY29tcHV0ZWQgc2hhMjU2IGNoZWNrc3Vtcwogc2hhMjU2ICA1ZmEy
NWJmNWYzOTVmZDI2ZTcwMWMyZTFkZTRjYTdkMTYyODE2OTg2ZGM3OTFjMjJmOGY0MjI2ODU3YWQx
YmIyICBMSUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1wYXJhbWlrby9weXRob24t
cGFyYW1pa28ubWsgYi9wYWNrYWdlL3B5dGhvbi1wYXJhbWlrby9weXRob24tcGFyYW1pa28ubWsK
aW5kZXggNTEyYTQ2MzBmNS4uOGQ5MjE0ODZjNyAxMDA2NDQKLS0tIGEvcGFja2FnZS9weXRob24t
cGFyYW1pa28vcHl0aG9uLXBhcmFtaWtvLm1rCisrKyBiL3BhY2thZ2UvcHl0aG9uLXBhcmFtaWtv
L3B5dGhvbi1wYXJhbWlrby5tawpAQCAtNCw5ICs0LDkgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjCiAKLVBZVEhPTl9QQVJBTUlLT19WRVJTSU9OID0gMy4zLjEKK1BZVEhPTl9QQVJBTUlL
T19WRVJTSU9OID0gMy40LjAKIFBZVEhPTl9QQVJBTUlLT19TT1VSQ0UgPSBwYXJhbWlrby0kKFBZ
VEhPTl9QQVJBTUlLT19WRVJTSU9OKS50YXIuZ3oKLVBZVEhPTl9QQVJBTUlLT19TSVRFID0gaHR0
cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzQ0LzAzLzE1OGFlMWRjYjk1MGJk
OTZmMDQwMzg1MDIyMzgxNTllMTE2ZmFmYjI3YWRkZjVkZjFiYTM1MDY4ZjJkNgorUFlUSE9OX1BB
UkFNSUtPX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvY2Mv
YWYvMTE5OTZjNGRmNGY5Y2FmZjg3OTk3YWQyZDNmZDg4MjUwNzhjMjc3ZDZhOTI4NDQ2ZDJiNmNm
MjQ5ODg5CiBQWVRIT05fUEFSQU1JS09fU0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKIFBZVEhPTl9Q
QVJBTUlLT19MSUNFTlNFID0gTEdQTC0yLjErCiBQWVRIT05fUEFSQU1JS09fTElDRU5TRV9GSUxF
UyA9IExJQ0VOU0UKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
