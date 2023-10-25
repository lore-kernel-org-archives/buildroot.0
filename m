Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A908C0032E
	for <buildroot@archiver.kernel.org>; Wed, 25 Oct 2023 20:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE2FB404D8;
	Wed, 25 Oct 2023 20:52:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE2FB404D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RkLSiSTvgl4Y; Wed, 25 Oct 2023 20:52:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B15DE404E0;
	Wed, 25 Oct 2023 20:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B15DE404E0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 433041BF476
 for <buildroot@lists.busybox.net>; Wed, 25 Oct 2023 20:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28D204180B
 for <buildroot@lists.busybox.net>; Wed, 25 Oct 2023 20:52:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28D204180B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id abp3Q5R2OC-e for <buildroot@lists.busybox.net>;
 Wed, 25 Oct 2023 20:52:42 +0000 (UTC)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0008741803
 for <buildroot@buildroot.org>; Wed, 25 Oct 2023 20:52:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0008741803
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-53d9b94731aso234436a12.1
 for <buildroot@buildroot.org>; Wed, 25 Oct 2023 13:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698267160; x=1698871960;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R4vW4541C7hno4j8Rike1CuCBoDQ/B0UuVNx3Cus4Eg=;
 b=HYhX7prDDIhP1C3FMiarR76vchp4nFeGd7NMBz/MCqHyTTsenDBlY3O/iaNtgkJHF9
 wObIa1/XYKuRhDHxKATvWDYW6wmnF+VgLNgX6y0Gv4oe3O4rHtupvCfW52TRicm1j93r
 UDnIP6ulGIm4Y9zW9hmymo6lw2QXi+qNBcpMsMWq/pAynNuUoLeXupkIcv1sa7yoViaN
 7sAsq+UMgF8nJmm6ANokr8vwhVgUFFo43bE6Bbeo3lFxBcTqeXhA69+ITQKez9AvnaBU
 aezVg42WhIUqPxVptVSKnlhYmR2kevMArU8l23BsYfpVsuD8C5HXqWiJy/KbyxFNOFWO
 G6rg==
X-Gm-Message-State: AOJu0YybhDg7cf/g5/VizdtThoCs/yRep0qMcJpiSqBYoHkyJbkfcXs4
 xm6TnbGIMUqBFQ0aqjSKwW1760TPIjEcOg==
X-Google-Smtp-Source: AGHT+IH1i4QoAZ1oDQYx6QYe5akfihAy21FkC9ltlZ0Uo+mMe+GKhSHeaw5TkInTIUcUA0H84xzrYQ==
X-Received: by 2002:a17:907:3f09:b0:9b0:552c:b36c with SMTP id
 hq9-20020a1709073f0900b009b0552cb36cmr14234475ejc.21.1698267159330; 
 Wed, 25 Oct 2023 13:52:39 -0700 (PDT)
Received: from p15.dynamic.ziggo.nl
 (2001-1c00-0f38-4500-3e41-8c79-4e8a-6bec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:f38:4500:3e41:8c79:4e8a:6bec])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a17090612d100b0099cd1c0cb21sm10350038ejb.129.2023.10.25.13.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 13:52:38 -0700 (PDT)
From: Kadir Yilmaz <kadir.c.yilmaz@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 25 Oct 2023 22:52:33 +0200
Message-Id: <20231025205233.1925727-1-kadir.c.yilmaz@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698267160; x=1698871960; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R4vW4541C7hno4j8Rike1CuCBoDQ/B0UuVNx3Cus4Eg=;
 b=UQOGlhgLTvTRpWrJE/MwfQhuKcw9rBOUAIrV7X/JHA0QOovTxxT5pigRC5m+RmXH4Z
 oktpP94hJP4RIG/ZRDNAV8DQFtPQtE9beWFwjAwcw2/pERhN2zPQrMa3CtU8o04ifE04
 Iz1Cfm6Y+SJiJTBN1NtKIlTNmjdOp3xBz7ZFlA6DUrJw/2WgTrStXr5cB/46cIQEVLn4
 qBJC1HJKDQ1xNKk5/wPjOPMfrXr5Gw0jyHzQOY3uVfbOZq/z5oE2698ycj8l4vs/Jf/E
 Vh+HH/lMtgY2G+Gwd0xJANjfKdz1d8zObQfh6/jH8VLQ6WV8j9Zk0gwsfM2dpnvmBWZ6
 CJZA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UQOGlhgL
Subject: [Buildroot] [PATCH 1/1] package/qt5webengine-chromium: fix
 python3.11 build errors
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Kadir Yilmaz <kadir.c.yilmaz@gmail.com>, Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cXQ1d2ViZW5naW5lIGZhaWxzIHRvIGJ1aWxkIGR1ZSB0byBjaGFuZ2VzIGludHJvZHVjZWQgaW4g
cHl0aG9uMy4xMToKCi0gWzg2NC8yMzE5Ml0gQUNUSU9OIC8vc2VydmljZXMvbWV0cmljcy9wdWJs
aWMvY3BwOmdlbl91a21fYnVpbGRlcnMoL2hvCiAgbWUvdmFncmFudC9vdXRwdXRfcmFzcGJlcnJ5
cGkzX3F0NXdlL2J1aWxkL3F0NXdlYmVuZ2luZS01LjE1Ljgvc3JjL3RvCiAgb2xjaGFpbjp0YXJn
ZXQpCiAgLi4uCiAgcmUuZXJyb3I6IGdsb2JhbCBmbGFncyBub3QgYXQgdGhlIHN0YXJ0IG9mIHRo
ZSBleHByZXNzaW9uIGF0IHBvc2l0aW9uIDEKCiAgICBodHRwczovL2RvY3MucHl0aG9uLm9yZy8z
LjExL2xpYnJhcnkvcmUuaHRtbAogICAgKD9haUxtc3V4KQogICAgQ2hhbmdlZCBpbiB2ZXJzaW9u
IDMuMTE6IFRoaXMgY29uc3RydWN0aW9uIGNhbiBvbmx5IGJlIHVzZWQgYXQgdGhlCiAgICBzdGFy
dCBvZiB0aGUgZXhwcmVzc2lvbi4KCi0gWzM3NDIvMjIzMjNdIEFDVElPTiAvL2Nocm9tZS9hcHA6
Y2hyb21pdW1fc3RyaW5nc19ncml0KC9ob21lL3ZhZ3JhbnQvCiAgb3V0cHV0X3Jhc3BiZXJyeXBp
M19xdDV3ZS9idWlsZC9xdDV3ZWJlbmdpbmUtNS4xNS44L3NyYy90b29sY2hhaW46dGFyCiAgZ2V0
KQogIC4uLgogIFZhbHVlRXJyb3I6IGludmFsaWQgbW9kZTogJ3JVJwoKICAgIG9wZW4oKSwgaW8u
b3BlbigpLCBjb2RlY3Mub3BlbigpIGFuZCBmaWxlaW5wdXQuRmlsZUlucHV0IG5vIGxvbmdlcgog
ICAgYWNjZXB0ICdVJyAo4oCcdW5pdmVyc2FsIG5ld2xpbmXigJ0pIGluIHRoZSBmaWxlIG1vZGUu
IEluIFB5dGhvbiAzLAogICAg4oCcdW5pdmVyc2FsIG5ld2xpbmXigJ0gbW9kZSBpcyB1c2VkIGJ5
IGRlZmF1bHQgd2hlbmV2ZXIgYSBmaWxlIGlzCiAgICBvcGVuZWQgaW4gdGV4dCBtb2RlLCBhbmQg
dGhlICdVJyBmbGFnIGhhcyBiZWVuIGRlcHJlY2F0ZWQgc2luY2UKICAgIFB5dGhvbiAzLjMuIFRo
ZSBuZXdsaW5lIHBhcmFtZXRlciB0byB0aGVzZSBmdW5jdGlvbnMgY29udHJvbHMgaG93CiAgICB1
bml2ZXJzYWwgbmV3bGluZXMgd29yay4gKENvbnRyaWJ1dGVkIGJ5IFZpY3RvciBTdGlubmVyIGlu
IGJwby0zNzMzMC4pCgpTaWduZWQtb2ZmLWJ5OiBLYWRpciBZaWxtYXogPGthZGlyLmMueWlsbWF6
QGdtYWlsLmNvbT4KLS0tCiAuLi54LWJ1aWxkLXRvb2xzLXRvLXJ1bi13aXRoLXB5dGhvbjMuMTEu
cGF0Y2ggfCA3MiArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNzIgaW5zZXJ0
aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcXQ1L3F0NXdlYmVuZ2luZS1jaHJv
bWl1bS8wMDAzLUZpeC1idWlsZC10b29scy10by1ydW4td2l0aC1weXRob24zLjExLnBhdGNoCgpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9xdDUvcXQ1d2ViZW5naW5lLWNocm9taXVtLzAwMDMtRml4LWJ1
aWxkLXRvb2xzLXRvLXJ1bi13aXRoLXB5dGhvbjMuMTEucGF0Y2ggYi9wYWNrYWdlL3F0NS9xdDV3
ZWJlbmdpbmUtY2hyb21pdW0vMDAwMy1GaXgtYnVpbGQtdG9vbHMtdG8tcnVuLXdpdGgtcHl0aG9u
My4xMS5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi40NGM4MzM3
ZjgwCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9xdDUvcXQ1d2ViZW5naW5lLWNocm9taXVt
LzAwMDMtRml4LWJ1aWxkLXRvb2xzLXRvLXJ1bi13aXRoLXB5dGhvbjMuMTEucGF0Y2gKQEAgLTAs
MCArMSw3MiBAQAorRnJvbSA4MmM5YjFkM2Y0MzgzY2Q4MDU5NjkwYmQzNGM5ZDdmYTg2Mzk4Yjc4
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogS2FkaXIgWWlsbWF6IDxrYWRpci5jLnlp
bG1hekBnbWFpbC5jb20+CitEYXRlOiBTYXQsIDIxIE9jdCAyMDIzIDIyOjQ1OjAzICswMjAwCitT
dWJqZWN0OiBbUEFUQ0hdIEZpeCBidWlsZCB0b29scyB0byBydW4gd2l0aCBweXRob24zLjExCitN
SU1FLVZlcnNpb246IDEuMAorQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04
CitDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CisKK1Vwc3RyZWFtOiBOL0EgYnVpbGRy
b290IHVzZXMgcHl0aG9uMy4xMSB3aGljaCBhcHBhcmVudGx5IGlzIG5vdCB5ZXQKK3N1cHBvcnRl
ZCBieSB1cHN0cmVhbQorCistIHJlIGVycm9yOiBnbG9iYWwgZmxhZ3Mgbm90IGF0IHRoZSBzdGFy
dAorCisgICAgaHR0cHM6Ly9kb2NzLnB5dGhvbi5vcmcvMy9saWJyYXJ5L3JlLmh0bWwjcmUtc3lu
dGF4CisgICAgKD9haUxtc3V4KQorICAgIC4uLi4KKyAgICBDaGFuZ2VkIGluIHZlcnNpb24gMy4x
MTogVGhpcyBjb25zdHJ1Y3Rpb24gY2FuIG9ubHkgYmUgdXNlZCBhdCB0aGUKKyAgICBzdGFydCBv
ZiB0aGUgZXhwcmVzc2lvbgorCistIFZhbHVlRXJyb3I6IGludmFsaWQgbW9kZTogJ3JVJworCisg
ICAgb3BlbigpLCBpby5vcGVuKCksIGNvZGVjcy5vcGVuKCkgYW5kIGZpbGVpbnB1dC5GaWxlSW5w
dXQgbm8gbG9uZ2VyCisgICAgYWNjZXB0ICdVJyAo4oCcdW5pdmVyc2FsIG5ld2xpbmXigJ0pIGlu
IHRoZSBmaWxlIG1vZGUuIEluIFB5dGhvbiAzLAorICAgIOKAnHVuaXZlcnNhbCBuZXdsaW5l4oCd
IG1vZGUgaXMgdXNlZCBieSBkZWZhdWx0IHdoZW5ldmVyIGEgZmlsZSBpcworICAgIG9wZW5lZCBp
biB0ZXh0IG1vZGUsIGFuZCB0aGUgJ1UnIGZsYWcgaGFzIGJlZW4gZGVwcmVjYXRlZCBzaW5jZQor
ICAgIFB5dGhvbiAzLjMuIFRoZSBuZXdsaW5lIHBhcmFtZXRlciB0byB0aGVzZSBmdW5jdGlvbnMg
Y29udHJvbHMgaG93CisgICAgdW5pdmVyc2FsIG5ld2xpbmVzIHdvcmsuIChDb250cmlidXRlZCBi
eSBWaWN0b3IgU3Rpbm5lciBpbiBicG8tMzczMzAuKQorCitTaWduZWQtb2ZmLWJ5OiBLYWRpciBZ
aWxtYXogPGthZGlyLmMueWlsbWF6QGdtYWlsLmNvbT4KKy0tLQorIGNocm9taXVtL3Rvb2xzL2dy
aXQvZ3JpdC91dGlsLnB5ICAgICAgICB8IDIgKy0KKyBjaHJvbWl1bS90b29scy9tZXRyaWNzL3Vr
bS91a21fbW9kZWwucHkgfCA0ICsrLS0KKyAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKKworZGlmZiAtLWdpdCBhL2Nocm9taXVtL3Rvb2xzL2dyaXQvZ3Jp
dC91dGlsLnB5IGIvY2hyb21pdW0vdG9vbHMvZ3JpdC9ncml0L3V0aWwucHkKK2luZGV4IDUyOGQ3
NjZhZDZiLi42ZThjZGIwZWJmYSAxMDA2NDQKKy0tLSBhL2Nocm9taXVtL3Rvb2xzL2dyaXQvZ3Jp
dC91dGlsLnB5CisrKysgYi9jaHJvbWl1bS90b29scy9ncml0L2dyaXQvdXRpbC5weQorQEAgLTIx
MSw3ICsyMTEsNyBAQCBkZWYgUmVhZEZpbGUoZmlsZW5hbWUsIGVuY29kaW5nKToKKyAgICAgbW9k
ZSA9ICdyYicKKyAgICAgZW5jb2RpbmcgPSBOb25lCisgICBlbHNlOgorLSAgICBtb2RlID0gJ3JV
JworKyAgICBtb2RlID0gJ3InCisgCisgICB3aXRoIGlvLm9wZW4oYWJzKGZpbGVuYW1lKSwgbW9k
ZSwgZW5jb2Rpbmc9ZW5jb2RpbmcpIGFzIGY6CisgICAgIHJldHVybiBmLnJlYWQoKQorZGlmZiAt
LWdpdCBhL2Nocm9taXVtL3Rvb2xzL21ldHJpY3MvdWttL3VrbV9tb2RlbC5weSBiL2Nocm9taXVt
L3Rvb2xzL21ldHJpY3MvdWttL3VrbV9tb2RlbC5weQoraW5kZXggZWMyNGRkNTczNjAuLjU3ZGVj
YWIzY2NjIDEwMDY0NAorLS0tIGEvY2hyb21pdW0vdG9vbHMvbWV0cmljcy91a20vdWttX21vZGVs
LnB5CisrKysgYi9jaHJvbWl1bS90b29scy9tZXRyaWNzL3VrbS91a21fbW9kZWwucHkKK0BAIC00
Miw3ICs0Miw3IEBAIF9JTkRFWF9UWVBFID0gbW9kZWxzLk9iamVjdE5vZGVUeXBlKAorIF9TVEFU
SVNUSUNTX1RZUEUgPSAgbW9kZWxzLk9iamVjdE5vZGVUeXBlKAorICAgICAnc3RhdGlzdGljcycs
CisgICAgIGF0dHJpYnV0ZXM9WworLSAgICAgICgnZXhwb3J0Jywgc3RyLCByJ14oP2kpKHx0cnVl
fGZhbHNlKSQnKSwKKysgICAgICAoJ2V4cG9ydCcsIHN0ciwgcicoP2kpXih8dHJ1ZXxmYWxzZSkk
JyksCisgICAgIF0sCisgICAgIGNoaWxkcmVuPVsKKyAgICAgICAgIG1vZGVscy5DaGlsZFR5cGUo
X1FVQU5USUxFU19UWVBFLnRhZywgX1FVQU5USUxFU19UWVBFLCBtdWx0aXBsZT1GYWxzZSksCitA
QCAtOTQsNyArOTQsNyBAQCBfRVZFTlRfVFlQRSA9ICBtb2RlbHMuT2JqZWN0Tm9kZVR5cGUoCisg
ICAgICdldmVudCcsCisgICAgIGF0dHJpYnV0ZXM9WworICAgICAgICgnbmFtZScsIHN0ciwgcide
W0EtWmEtejAtOS5dKyQnKSwKKy0gICAgICAoJ3Npbmd1bGFyJywgc3RyLCByJ14oP2kpKHx0cnVl
fGZhbHNlKSQnKSwKKysgICAgICAoJ3Npbmd1bGFyJywgc3RyLCByJyg/aSleKHx0cnVlfGZhbHNl
KSQnKSwKKyAgICAgXSwKKyAgICAgYWxwaGFiZXRpemF0aW9uPVsKKyAgICAgICAgIChfT0JTT0xF
VEVfVFlQRS50YWcsIF9LRUVQX09SREVSKSwKKy0tIAorMi4yNS4xCisKLS0gCjIuMjUuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
