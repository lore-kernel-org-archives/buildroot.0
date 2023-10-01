Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F7CE748ED
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 15:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB7C881E44;
	Sun,  1 Oct 2023 15:20:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB7C881E44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hD6BvxdYIcCx; Sun,  1 Oct 2023 15:20:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D870E818DC;
	Sun,  1 Oct 2023 15:20:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D870E818DC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EE55E1BF42E
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 15:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4EFF818DC
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 15:20:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4EFF818DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AueCJKos9d4N for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 15:20:10 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7ACAC818A7
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 15:20:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7ACAC818A7
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3214cdb4b27so14668315f8f.1
 for <buildroot@buildroot.org>; Sun, 01 Oct 2023 08:20:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696173608; x=1696778408;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VyxvewxCFYhI3rW3QI6nguL1flGjYWUwkfE3iN7WumI=;
 b=Wh64EneGL7VXGpvMdpuDb3WgTdw1wYSLhoHB8S958s7h59FIxf9/Xq2Q4dtn6bG7l8
 FzqKcVuh3Qqa2qfgw8mXSYJhAEehY9x0D6cobwjb/fiJPhwpy+TDqrxUTXdJ9iqJcXai
 fo1ABBZvmkA8o9Pn3o9p++zk0NkGg/n2Xiupda8HeRPw2wvnuFGmhTav5U2zU+lwHzNs
 NwNASjf5WXdem02PkY6oP6s5tdxg6H7UJ5iaz71YgU88jvHcTUx2y4BOwaxJN/hwduYH
 6lrD6KmIEE+G4yWTKHniynIbaNVNTjZZ75ikNWL1iQLucmnL8WPlA+hyBFu2ZNWfz2Ik
 vmEw==
X-Gm-Message-State: AOJu0YxIW19Zy9BPD7FVZly62X+wFwBWjPNnV144MRda5bUV9o7a4Xjb
 MI/zzYPoll09d6C2n3hsBWwySdbfXDw=
X-Google-Smtp-Source: AGHT+IGKWtPohAfipCoFe5tEMqt03p8ChTGQGxe4kSX+Lj3db+KRTFNf3e4xNDCmQoSNiGNwKUlp8A==
X-Received: by 2002:a5d:4049:0:b0:320:933:4524 with SMTP id
 w9-20020a5d4049000000b0032009334524mr8333326wrp.2.1696173607667; 
 Sun, 01 Oct 2023 08:20:07 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 o14-20020a05600c4fce00b004065d67c3c9sm5422344wmq.8.2023.10.01.08.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Oct 2023 08:20:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 17:20:05 +0200
Message-Id: <20231001152005.1015070-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696173608; x=1696778408; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VyxvewxCFYhI3rW3QI6nguL1flGjYWUwkfE3iN7WumI=;
 b=LAXiVuZOQWuptJCUg4ecxwrU7YmOa/0rSWMOKWaT2TV/2ZziJh74GAsGGTmCdCH5i/
 xuWLtJSfoGp5de8Q15qKZtfMv6ZzDlfgVqow0AA7SGPX61iG4U0xeow1XU0XBInP7jZS
 3Hxt7RDSkaqZ7Zbu2Fe3gUPmKMPGacSQPOZLfeDzp2bma1sZ60vHlCArAVHQR9KnRFYz
 B95QuwGQ3BaUxJKfxxycKU3axkxmy66zUXx2tZrJ3Oxk4Zuxt8ooiGWR7ilpoS4PgiYq
 +WvLubQeA/j3dJKNENhZyANozhYr2ctPwUhFMof7h6wx1D8TYEtCStkvXoEk/HSSkrAe
 eXGg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LAXiVuZO
Subject: [Buildroot] [PATCH v2,1/1] package/libnfs: bump to version 5.0.2
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LSBVcGRhdGUgcGF0Y2gKLSBIYW5kbGUgcHRocmVhZCBzdXBwb3J0IGFkZGVkIHdpdGgKICBodHRw
czovL2dpdGh1Yi5jb20vc2FobGJlcmcvbGlibmZzL2NvbW1pdC9mNTU2Mzc2MTllY2JlYjdjN2Ji
ZDQxNDM3NjhiNmI0NTEwMGJlODZjCgpodHRwczovL2dpdGh1Yi5jb20vc2FobGJlcmcvbGlibmZz
L2Jsb2IvbGlibmZzLTUuMC4yL0NIQU5HRUxPRwoKU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250
YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Ci0tLQpDaGFuZ2VzIHYxIC0+IHYyOgog
LSBSZWJhc2UgcGF0Y2ggb24gY3VycmVudCBtYXN0ZXIKCiAuY2hlY2twYWNrYWdlaWdub3JlICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxIC0KIHBhY2thZ2UvbGlibmZzLzAwMDEtRml4
LWluY2x1ZGUtc3lzLXRpbWUuaC5wYXRjaCB8IDkgKysrKystLS0tCiBwYWNrYWdlL2xpYm5mcy9s
aWJuZnMuaGFzaCAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCiBwYWNrYWdlL2xpYm5mcy9s
aWJuZnMubWsgICAgICAgICAgICAgICAgICAgICAgICAgfCA4ICsrKysrKystCiA0IGZpbGVzIGNo
YW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvLmNo
ZWNrcGFja2FnZWlnbm9yZSBiLy5jaGVja3BhY2thZ2VpZ25vcmUKaW5kZXggOTU2OTVmYTI0My4u
NDQ1YmQ2MzgyNyAxMDA2NDQKLS0tIGEvLmNoZWNrcGFja2FnZWlnbm9yZQorKysgYi8uY2hlY2tw
YWNrYWdlaWdub3JlCkBAIC03MTYsNyArNzE2LDYgQEAgcGFja2FnZS9saWJtcGVnMi8wMDA0LWZp
eC1zcGFyYy5wYXRjaCBVcHN0cmVhbQogcGFja2FnZS9saWJuZXQvMDAwMS1Vc2Utc3RhbmRhcmQt
aW50NjRfdC1pbnN0ZWFkLW9mLV9faW50NjRfdC1mb3ItbWluZ3ctY3Jvc3MtYnVpbGQucGF0Y2gg
VXBzdHJlYW0KIHBhY2thZ2UvbGlibmV0ZmlsdGVyX2Nvbm50cmFjay8wMDAxLWNvbm50cmFjay1m
aXgtYnVpbGQtd2l0aC1rZXJuZWwtNS0xNS1hbmQtbXVzbC5wYXRjaCBVcHN0cmVhbQogcGFja2Fn
ZS9saWJuZmMvMDAwMS1hdXRvdG9vbHMtbWFrZS1leGFtcGxlLWJ1aWxkLW9wdGlvbmFsLnBhdGNo
IFVwc3RyZWFtCi1wYWNrYWdlL2xpYm5mcy8wMDAxLUZpeC1pbmNsdWRlLXN5cy10aW1lLmgucGF0
Y2ggVXBzdHJlYW0KIHBhY2thZ2UvbGlibmlkcy8wMDAxLWxpYnBjYXAtdXNlLXBrZy1jb25maWcu
cGF0Y2ggVXBzdHJlYW0KIHBhY2thZ2UvbGlibmwvMDAwMS1BZGQtbXVzbC13b3JrYXJvdW5kLXRv
LXRoZS1saWJjLWNvbXBhdC5oLWNvcHkucGF0Y2ggVXBzdHJlYW0KIHBhY2thZ2UvbGlibnNzLzAw
MDEtQnVnLTE4MDExODItQWxsb3ctb3ZlcnJpZGluZy1PU19BUkNILU9TX1RFU1QtYW5kLU9TXy5w
YXRjaCBVcHN0cmVhbQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJuZnMvMDAwMS1GaXgtaW5jbHVk
ZS1zeXMtdGltZS5oLnBhdGNoIGIvcGFja2FnZS9saWJuZnMvMDAwMS1GaXgtaW5jbHVkZS1zeXMt
dGltZS5oLnBhdGNoCmluZGV4IDE1YjI4MTY3MmEuLmMzNzc5ZjEzYTIgMTAwNjQ0Ci0tLSBhL3Bh
Y2thZ2UvbGlibmZzLzAwMDEtRml4LWluY2x1ZGUtc3lzLXRpbWUuaC5wYXRjaAorKysgYi9wYWNr
YWdlL2xpYm5mcy8wMDAxLUZpeC1pbmNsdWRlLXN5cy10aW1lLmgucGF0Y2gKQEAgLTExLDEwICsx
MSwxMSBAQCBQT1NJWCBzYXlzIGBzdHJ1Y3QgdGltZXZhbGAgaXMgZGVmaW5lZCBpZiA8c3lzL3Rp
bWUuaD4gaXMgaW5jbHVkZWQuCiBJbnN0ZWFkIG9mIHRoZSBtZXNzIHRoYXQgaXMgY3VycmVudGx5
IGRvbmUgYmFzZWQgb24gdGhlIHN5c3RlbSBvbiB3aGljaAogdGhlIHN0dWZmIGlzIGJlaW5nIGNv
bXBpbGVkLCBpbmNsdWRlIGl0IHVuY29uZGl0aW9uYWxseS4KIAotUmVwb3J0ZWQgdXBzdHJlYW06
Ci1odHRwczovL2dpdGh1Yi5jb20vc2FobGJlcmcvbGlibmZzL2lzc3Vlcy8yNzIKK1Vwc3RyZWFt
OiBodHRwczovL2dpdGh1Yi5jb20vc2FobGJlcmcvbGlibmZzL2lzc3Vlcy8yNzIKIAogU2lnbmVk
LW9mZi1ieTogSsO2cmcgS3JhdXNlIDxqb2VyZy5rcmF1c2VAZW1iZWRkZWQucm9ja3M+CitbRmFi
cmljZTogdXBkYXRlIGZvciA1LjAuMl0KK1NpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUg
PGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgogLS0tCiAgaW5jbHVkZS9uZnNjL2xpYm5mcy5o
IHwgNSAtLS0tLQogIDEgZmlsZSBjaGFuZ2VkLCA1IGRlbGV0aW9ucygtKQpAQCAtMjcsOCArMjgs
OCBAQCBpbmRleCAwOWRjZjFjLi5iNmRiNThjIDEwMDc1NQogICNkZWZpbmUgX0xJQk5GU19IXwog
IAogICNpbmNsdWRlIDxzdGRpbnQuaD4KLS0jaWYgZGVmaW5lZChfX0FORFJPSURfXykgfHwgZGVm
aW5lZChBUk9TKSBcCi0tIHx8ICggZGVmaW5lZChfX0FQUExFX18pICYmIGRlZmluZWQoX19NQUNI
X18pICkKKy0jaWYgZGVmaW5lZChfX0FORFJPSURfXykgfHwgZGVmaW5lZChBUk9TKSB8fCBkZWZp
bmVkKF9fUFBVX18pIFwKKy0gfHwgKCBkZWZpbmVkKF9fQVBQTEVfXykgJiYgZGVmaW5lZChfX01B
Q0hfXykgKSB8fCBkZWZpbmVkKF9fRnJlZUJTRF9fKSB8fCBkZWZpbmVkKF9fT3BlbkJTRF9fKQog
ICNpbmNsdWRlIDxzeXMvdGltZS5oPgogLSNlbHNlCiAtI2luY2x1ZGUgPHRpbWUuaD4KZGlmZiAt
LWdpdCBhL3BhY2thZ2UvbGlibmZzL2xpYm5mcy5oYXNoIGIvcGFja2FnZS9saWJuZnMvbGlibmZz
Lmhhc2gKaW5kZXggZmZiNmM2MjA3My4uYjY3YTVkMmVkYSAxMDA2NDQKLS0tIGEvcGFja2FnZS9s
aWJuZnMvbGlibmZzLmhhc2gKKysrIGIvcGFja2FnZS9saWJuZnMvbGlibmZzLmhhc2gKQEAgLTEs
NSArMSw1IEBACiAjIExvY2FsbHkgY2FsY3VsYXRlZAotc2hhMjU2ICA2ZWU3N2U5ZmUyMjBlMmQz
ZTNiMWY1M2NmZWEwNGZiMzE5ODI4Y2M3ZGJiOTdkZDlkZjA5ZTQ2ZTkwMWQ3OTdkICBsaWJuZnMt
NC4wLjAudGFyLmd6CitzaGEyNTYgIDYzN2U1NjY0M2IxOWRhOWZiYTk4ZjA2ODQ3Nzg4YzRkYWQz
MDhiNzIzMTU2YTY0NzQ4MDQxMDM1ZGNkZjliZDMgIGxpYm5mcy01LjAuMi50YXIuZ3oKIHNoYTI1
NiAgZWRkOTYwYzAxNDJiOGFkYTk4YjQzYjYzOTZiNzhmNGU1NTdiMGJjNzBhYzYwMWE1MWUzOTdh
ZDA0MDcwZTJjNSAgQ09QWUlORwogc2hhMjU2ICBkOTQwNmNlZDk1NDU3OTQxMDMyYWExMWQwNDYy
M2I4YWI3MWYyODI3YTMzOTVlYmVmMTM3YWVjNDc1YmUzNWIxICBMSUNFTkNFLUJTRC50eHQKIHNo
YTI1NiAgZGM2MjY1MjBkY2Q1M2EyMmY3MjdhZjNlZTQyYzc3MGU1NmM5N2E2NGZlM2FkYjA2Mzc5
OWQ4YWIwMzJmZTU1MSAgTElDRU5DRS1MR1BMLTIuMS50eHQKZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
bGlibmZzL2xpYm5mcy5tayBiL3BhY2thZ2UvbGlibmZzL2xpYm5mcy5tawppbmRleCA1Zjk1MGI1
Y2RlLi5iMDEzZGVjZmM3IDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpYm5mcy9saWJuZnMubWsKKysr
IGIvcGFja2FnZS9saWJuZnMvbGlibmZzLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKIAotTElCTkZTX1ZFUlNJT04gPSA0LjAuMAorTElCTkZTX1ZFUlNJT04g
PSA1LjAuMgogTElCTkZTX1NJVEUgPSAkKGNhbGwgZ2l0aHViLHNhaGxiZXJnLGxpYm5mcyxsaWJu
ZnMtJChMSUJORlNfVkVSU0lPTikpCiBMSUJORlNfSU5TVEFMTF9TVEFHSU5HID0gWUVTCiBMSUJO
RlNfQVVUT1JFQ09ORiA9IFlFUwpAQCAtMTYsNCArMTYsMTAgQEAgaWZlcSAoJChCUjJfUEFDS0FH
RV9MSUJUSVJQQykseSkKIExJQk5GU19ERVBFTkRFTkNJRVMgKz0gbGlidGlycGMKIGVuZGlmCiAK
K2lmZXEgKCQoQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUykseSkKK0xJQk5GU19DT05GX09QVFMg
Kz0gLS1lbmFibGUtdGhyZWFkcworZWxzZQorTElCTkZTX0NPTkZfT1BUUyArPSAtLWRpc2FibGUt
dGhyZWFkcworZW5kaWYKKwogJChldmFsICQoYXV0b3Rvb2xzLXBhY2thZ2UpKQotLSAKMi40MC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
