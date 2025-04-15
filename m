Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD74EC369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 15:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74BC060BBA;
	Tue, 15 Apr 2025 15:31:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YSmnI67PXfwr; Tue, 15 Apr 2025 15:31:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA8E860BA8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA8E860BA8;
	Tue, 15 Apr 2025 15:31:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 864EF200
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 15:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 754AD81277
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 15:31:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6SdIC075mP87 for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 15:31:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=gael.portay+rtone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0B4AA80834
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B4AA80834
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B4AA80834
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 15:31:36 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3978ef9a778so280505f8f.0
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 08:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744731094; x=1745335894;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c8nAsBw6AbZyhdYz72p28pTl9BYI4/EEtEGt9RqDZO4=;
 b=KGFMhuaKK2iiRUeCDuDFTX90n25qMPCRDydN+VwGbhlflD/DH3uL/35qqB5mTrJmkQ
 GJJGDQYhb5Fzmn3JHJFYZyG/vR5bxQjgWD304zASUUydSNKhnEdI4BZQViaXVz1MGWXU
 NVn5RafkQhk+V9xVCTY8MXbxPsYT4leoezVmXh2EqfIajUllHhcHKkGOuIuCiJMuONQf
 PRR7URN1eXaONWuesaqFC5DdZys8E5qyCTzcNYg3NMsF/MqE82drG88uf5NUQ0YwpZ8F
 wwyxWUJLE+Wp9Kxy2Xo+0uLxRNWAF6cCVwDXdwVoXsOyYVifBT1mWwEGgo7ayFZLljAC
 0gvg==
X-Gm-Message-State: AOJu0Yxaw5aeFmSfdCRSrT8jU0THMf/UFzZEyzy4izu1cbhWQ0sOYZz/
 D1nw0U+iK00rbWAo0OxhibnYH+FcKq4tfO8EerKGzwDe2FMHssL8jcY3zEBd
X-Gm-Gg: ASbGncthzBhMf69KEUTRPat+X94flYnCrM/cBx8qjvZSs/1sH6UEw1lt1vDvvCxeVyX
 tiRcnc7OUXQlZcgOBcwl5nf2crD9x0G75HuiDrjLtGq/XByqQSnRd71K4pbr+GOtGH6xDCXwYbM
 6Q2dotStsBjKNMTZzAyvtc9IO6CQ+TzAqS5G9sTbhdzIPSWebtKx71qYQV7UV3ulLJ/GDAlQdlU
 R1LmAWXmquoWF/9i8S/PhwhB44TnFREjzaq92NH+JOJcJqO3SRZ5xePF0P7qCRGyVMYa4Z6AABl
 nvjmrh8qxxSoldClCkfg2lKxqSYUVTkxDRnbzCoFAKjl9DN89WQ=
X-Google-Smtp-Source: AGHT+IFMWkdxaDga5OoNxgbk5iG4JsPhX2RSwbpsCOnMpsggMX/GM5cjQ80l/1xkd2q8xY8yCmq+BQ==
X-Received: by 2002:a05:6000:2907:b0:391:29ab:c9df with SMTP id
 ffacd0b85a97d-39ea5201ac6mr4917335f8f.4.1744731093978; 
 Tue, 15 Apr 2025 08:31:33 -0700 (PDT)
Received: from archlinux.. ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae963fccsm14458950f8f.3.2025.04.15.08.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 08:31:33 -0700 (PDT)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>
Date: Tue, 15 Apr 2025 17:31:22 +0200
Message-ID: <20250415153127.1868025-1-gael.portay+rtone@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744731094; x=1745335894; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=c8nAsBw6AbZyhdYz72p28pTl9BYI4/EEtEGt9RqDZO4=;
 b=l93GP5IeXgxPJJSZTSzuOe/8oj3vJzM/YNWPuajsKPoMpMxNNbiQ9TFM26Hk4U8ISu
 wc3bcvnVpuC6s5Nc9jkPhpXeHQ8AoE2OQ3qc+l+d/+DPt1YdLtfwXp7Ahaapoc4ILvAW
 Gc6OS3zWi+6A7ysovXwXuCy9v7KPEGZBeH8+fbcEwx6LtOjb8mq4JTHwBAyexuttEnDB
 3igkkGnpx+sqqL6daWUW/iciZrn+A2b3+nhK4+zWnFQw0KnpZdDLmoERgqsCB31mljKI
 ko1NRUKdH0WCxQHCJGtuQcDz2Xs4IH9M6hbNXMqilIs7TBuDyAa6pedydIrChyTMRUlK
 oioQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=l93GP5Ie
Subject: [Buildroot] [PATCH 1/6] board/raspberrypi/readme.txt: add note for
 bootcode.bin
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

VGhlIHNlY29uZC1zdGFnZSBib290bG9hZGVyIGlzIGNvbnRhaW5lZCBpbiB0aGUgb25ib2FyZCBF
RVBST01bMV0gc2luY2UKdGhlIFJhc3BiZXJyeSBQaSA0IChpLmUuIGZvciBwaTQsIHBpNDAwLCBj
bTQsIGNtNHMgYW5kIHBpNSkuCgpUaGVyZWZvcmUsIHRoZSBmaWxlIGJvb3Rjb2RlLmJpblsyXSBp
cyBuZWVkZWQgZm9yIHRoZSBmb3JtZXIgUmFzcGJlcnJ5ClBpIG9ubHkgKGkuZS4gcGkxLCBwaTIs
IHBpMywgcGkwLCBwaTB3IGFuZCBwaXplcm8ydykuCgpUaGlzIGFkZHMgYSBub3RlIHByZWNpc2lu
ZyB0aGUgZmlsZSBib290Y29kZS5iaW4gaXMgcHJlc2VudCBmb3IgdGhlCmZvcm1lciB2ZXJzaW9u
cyBvZiB0aGUgUmFzcGJlcnJ5IFBpLgoKWzFdOiBodHRwczovL3d3dy5yYXNwYmVycnlwaS5jb20v
ZG9jdW1lbnRhdGlvbi9jb21wdXRlcnMvcmFzcGJlcnJ5LXBpLmh0bWwjcmFzcGJlcnJ5LXBpLWJv
b3QtZWVwcm9tClsyXTogaHR0cHM6Ly93d3cucmFzcGJlcnJ5cGkuY29tL2RvY3VtZW50YXRpb24v
Y29tcHV0ZXJzL2NvbmZpZ3VyYXRpb24uaHRtbCNib290Y29kZS1iaW4KClNpZ25lZC1vZmYtYnk6
IEdhw6tsIFBPUlRBWSA8Z2FlbC5wb3J0YXkrcnRvbmVAZ21haWwuY29tPgotLS0KIGJvYXJkL3Jh
c3BiZXJyeXBpL3JlYWRtZS50eHQgfCAxMCArKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2JvYXJkL3Jhc3BiZXJy
eXBpL3JlYWRtZS50eHQgYi9ib2FyZC9yYXNwYmVycnlwaS9yZWFkbWUudHh0CmluZGV4IDY0ZjBl
MmEyNmYuLjVmNmIxYzNlN2QgMTAwNjQ0Ci0tLSBhL2JvYXJkL3Jhc3BiZXJyeXBpL3JlYWRtZS50
eHQKKysrIGIvYm9hcmQvcmFzcGJlcnJ5cGkvcmVhZG1lLnR4dApAQCAtMTEyLDE0ICsxMTIsMTQg
QEAgQWZ0ZXIgYnVpbGRpbmcsIHlvdSBzaG91bGQgb2J0YWluIHRoaXMgdHJlZToKICAgICArLS0g
Ym9vdC52ZmF0CiAgICAgKy0tIHJvb3Rmcy5leHQ0CiAgICAgKy0tIHJwaS1maXJtd2FyZS8KLSAg
ICB8ICAgKy0tIGJvb3Rjb2RlLmJpbgorICAgIHwgICArLS0gYm9vdGNvZGUuYmluICAgICAgICAg
ICAgWzJdCiAgICAgfCAgICstLSBjbWRsaW5lLnR4dAogICAgIHwgICArLS0gY29uZmlnLnR4dAog
ICAgIHwgICArLS0gZml4dXAuZGF0ICAgICAgICAgICAgICAgWzFdCiAgICAgfCAgICstLSBmaXh1
cDQuZGF0ICAgICAgICAgICAgICBbMV0KICAgICB8ICAgKy0tIHN0YXJ0LmVsZiAgICAgICAgICAg
ICAgIFsxXQogICAgIHwgICArLS0gc3RhcnQ0LmVsZiAgICAgICAgICAgICAgWzFdCi0gICAgfCAg
IGAtLSBvdmVybGF5cy8gICAgICAgICAgICAgICBbMl0KKyAgICB8ICAgYC0tIG92ZXJsYXlzLyAg
ICAgICAgICAgICAgIFszXQogICAgICstLSBzZGNhcmQuaW1nCiAgICAgKy0tIEltYWdlICAgICAg
ICAgICAgICAgICAgICAgICBbMV0KICAgICBgLS0gekltYWdlICAgICAgICAgICAgICAgICAgICAg
IFsxXQpAQCAtMTI3LDcgKzEyNywxMSBAQCBBZnRlciBidWlsZGluZywgeW91IHNob3VsZCBvYnRh
aW4gdGhpcyB0cmVlOgogWzFdIE5vdCBhbGwgb2YgdGhlbSB3aWxsIGJlIHByZXNlbnQsIGRlcGVu
ZGluZyBvbiB0aGUgUmFzcGJlcnJ5UGkKICAgICBtb2RlbCB5b3UgYXJlIHVzaW5nLgogCi1bMl0g
T25seSBmb3IgdGhlIFJhc3BiZXJyeSBQaSAzLzQgTW9kZWxzIChvdmVybGF5IG1pbml1YXJ0LWJ0
IGlzIG5lZWRlZAorWzJdIE9ubHkgZm9yIHRoZSBSYXNwYmVycnkgUGkgMSwgMiwgMywgWmVybywg
WmVybyBXIGFuZCBaZXJvIDIgVy4gVGhlIFJhc3BiZXJyeQorICAgIFBpIDQsIDQwMCwgNSBhbmQg
dGhlIENvbXB1dGUgTW9kdWxlIDQsIDRzIGFuZCA1IGxvYWQgdGhlIHNlY29uZCBzdGFnZQorICAg
IGJvb3Rsb2FkZXIgZnJvbSBhIFNQSSBmbGFzaCBFRVBST00uCisKK1szXSBPbmx5IGZvciB0aGUg
UmFzcGJlcnJ5IFBpIDMvNCBNb2RlbHMgKG92ZXJsYXkgbWluaXVhcnQtYnQgaXMgbmVlZGVkCiAg
ICAgdG8gZW5hYmxlIHRoZSBSUGkzIHNlcmlhbCBjb25zb2xlIG90aGVyd2lzZSBvY2N1cGllZCBi
eSB0aGUgYmx1ZXRvb3RoCiAgICAgY2hpcCkuIEFsdGVybmF0aXZlIHdvdWxkIGJlIHRvIGRpc2Fi
bGUgdGhlIHNlcmlhbCBjb25zb2xlIGluIGNtZGxpbmUudHh0CiAgICAgYW5kIC9ldGMvaW5pdHRh
Yi4KLS0gCjIuNDkuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
