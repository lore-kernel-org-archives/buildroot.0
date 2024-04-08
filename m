Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1989EC67861
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 21:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCE6040568;
	Mon,  8 Apr 2024 21:16:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 37NG-BTqIg4q; Mon,  8 Apr 2024 21:16:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8AE840C1C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8AE840C1C;
	Mon,  8 Apr 2024 21:16:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E0ABD1BF2A6
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 21:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C91BC4081B
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 21:16:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RGTZoup3n1i0 for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 21:16:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=robimarko@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 68C7A407FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68C7A407FA
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 68C7A407FA
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 21:16:14 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-56e69888a36so1519371a12.3
 for <buildroot@buildroot.org>; Mon, 08 Apr 2024 14:16:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712610972; x=1713215772;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cX1jIBenWtg7cpuNFKd/n6XxWKvLIFBYDKxs+GDLYMg=;
 b=LjWJ/MGu+AaZYesQsI+Sj9XuWEDx/9rMlrAum/4mokp+lso3Q4h0QdU3H2KbCEWVH5
 beIhgNZi0h3c9sMInZ45HPUPDSSPJlqs/mIjnXNWOKSgfboIxRfHzEdMTZGNMX97FEoT
 IOKplJu+zBNinIs8SKYAwndC42lUVukYFyORrqIc2F79yOpOpxHc7xtXv2lWgTZ7ACwa
 7PbtbsyfqsKR4fif/lXdF9UNrZVtRXv5jZgLqg8W3quxUpKWKCQGitw2mCvEWuSZ2urt
 SlEZv4I4QvkQwAeWWi8fXp3y8LbdqpUM0p/kgppkgqIMceXqkrBwjMTqa+Do1La+ScCx
 8q+Q==
X-Gm-Message-State: AOJu0YxhwKcrNVQ+Y/EowvfGg123JlmxZ1+HDBh7dm+zX18be4tueTof
 TeiNxOyfb4gw6G5nixs8oYmE7T6Aoo8IfI1PSqfkD9HC1tmKcBfNa6p4gv/7
X-Google-Smtp-Source: AGHT+IGgzhXvaxBJwxwmh7LYy1LMcd6HSsiYafwTE2J9Ftadozx/VJ4zQ7VaujyUBy4A96EqG/1+VQ==
X-Received: by 2002:a50:cc97:0:b0:56b:ed78:f58 with SMTP id
 q23-20020a50cc97000000b0056bed780f58mr7986503edi.33.1712610971916; 
 Mon, 08 Apr 2024 14:16:11 -0700 (PDT)
Received: from fedora.. (cpe-188-129-45-147.dynamic.amis.hr. [188.129.45.147])
 by smtp.googlemail.com with ESMTPSA id
 y9-20020a056402440900b0056e3707323bsm3779438eda.97.2024.04.08.14.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 14:16:11 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Apr 2024 23:16:09 +0200
Message-ID: <20240408211609.2423619-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712610972; x=1713215772; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cX1jIBenWtg7cpuNFKd/n6XxWKvLIFBYDKxs+GDLYMg=;
 b=j2/7iLAPWC8Nx3Uw14fXntvMkhmRAPnXRbTFwSzx6AZ2rInm4P5/2mAa/nboLb2F0H
 NsrRQUkKtWvXZzR9pSXp2qQWZID4zkYcyLVXz7aHNdOS9T8Cq76O+bL+GypRrWDsUWm6
 bK26/lB1oQorQsyZAyrbDSyPFvTVZ0iioiUziFfDhjSQk79azN7wC18oXdpBmQ0IowOJ
 wCgUDM7YQIMRZ86aHGxsO5nnMO+1XBiRkUNsko7rRQ+pgJgl0NPdSe/tm9kRpcy1Fqi+
 rJXtY4ZAjbaokE1/2RNgGzVxan8zhb1Wc4DhG5RPHI5n/H41L3Vi4SK9KhYBdSOB1rVr
 JYQw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=j2/7iLAP
Subject: [Buildroot] [PATCH v2 1/1] kconfig/lxdialog: fix check() with GCC14
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
Cc: Petr Vorel <petr.vorel@gmail.com>, Robert Marko <robimarko@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

R0NDMTQgbm93IHRyZWF0cyBpbXBsaWNpdCBpbnQgdHlwZXMgYXMgZXJyb3Igc28gd2hlbiBjaGVj
aygpIGZyb20KY2hlY2stbHhkaWFsb2cuc2ggaXMgY2FsbGVkIHRvIGNoZWNrIHdoZXRoZXIgd2Ug
Y2FuIGxpbmsgYWdhaW5zdCBuY3Vyc2VzCml0IHdpbGwgZmFpbCBzaWxlbnRseSBhbmQgdGhlIGhl
bHAgdGV4dCBpbmRpY2F0aW5nIHRvIGluc3RhbGwgbmN1cnNlcyBpcwpwcmludGVkLgoKSG93ZXZl
ciwgdGhpcyBpcyBub3QgZHVlIHRvIG1pc3NpbmcgbmN1cnNlcyBidXQgb25jZSB0aGUgc3RkZXJy
IHJlZGlyZWN0CnRvIC9kZXYvbnVsbCBpcyByZW1vdmVkIHdlIGNhbiBzZWUgdGhlIHJvb3QgY2F1
c2U6CjxzdGRpbj46MjoxOiBlcnJvcjogcmV0dXJuIHR5cGUgZGVmYXVsdHMgdG8g4oCYaW504oCZ
IFstV2ltcGxpY2l0LWludF0KClNvLCBpbiBvcmRlciBmb3IgbWVudWNvbmZpZyB0byB3b3JrIHdp
dGggR0NDMTQgbGV0cyBqdXN0IHNwZWNpZnkgdGhlCnJldHVybiB0eXBlIG9mIG1haW4oKSBhcyBp
bnQuCgpTaWduZWQtb2ZmLWJ5OiBSb2JlcnQgTWFya28gPHJvYmltYXJrb0BnbWFpbC5jb20+ClJl
dmlld2VkLWJ5OiBQZXRyIFZvcmVsIDxwZXRyLnZvcmVsQGdtYWlsLmNvbT4KVGVzdGVkLWJ5OiBQ
ZXRyIFZvcmVsIDxwZXRyLnZvcmVsQGdtYWlsLmNvbT4KLS0tCiBzdXBwb3J0L2tjb25maWcvbHhk
aWFsb2cvY2hlY2stbHhkaWFsb2cuc2ggICAgfCAgMiArLQogLi4uY29uZmlnLWx4ZGlhbG9nLWZp
eC1jaGVjay13aXRoLUdDQzE0LnBhdGNoIHwgNDMgKysrKysrKysrKysrKysrKysrKwogc3VwcG9y
dC9rY29uZmlnL3BhdGNoZXMvc2VyaWVzICAgICAgICAgICAgICAgIHwgIDEgKwogMyBmaWxlcyBj
aGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiBjcmVhdGUgbW9kZSAxMDA2
NDQgc3VwcG9ydC9rY29uZmlnL3BhdGNoZXMvMjIta2NvbmZpZy1seGRpYWxvZy1maXgtY2hlY2st
d2l0aC1HQ0MxNC5wYXRjaAoKZGlmZiAtLWdpdCBhL3N1cHBvcnQva2NvbmZpZy9seGRpYWxvZy9j
aGVjay1seGRpYWxvZy5zaCBiL3N1cHBvcnQva2NvbmZpZy9seGRpYWxvZy9jaGVjay1seGRpYWxv
Zy5zaAppbmRleCAxNmNkOWEzMTg2Li4yN2Q2YzMwYTU3IDEwMDc1NQotLS0gYS9zdXBwb3J0L2tj
b25maWcvbHhkaWFsb2cvY2hlY2stbHhkaWFsb2cuc2gKKysrIGIvc3VwcG9ydC9rY29uZmlnL2x4
ZGlhbG9nL2NoZWNrLWx4ZGlhbG9nLnNoCkBAIC00OCw3ICs0OCw3IEBAIHRyYXAgInJtIC1mICR0
bXAiIDAgMSAyIDMgMTUKIGNoZWNrKCkgewogICAgICAgICAkY2MgLXggYyAtIC1vICR0bXAgMj4v
ZGV2L251bGwgPDwnRU9GJwogI2luY2x1ZGUgQ1VSU0VTX0xPQwotbWFpbigpIHt9CitpbnQgbWFp
bigpIHt9CiBFT0YKIAlpZiBbICQ/ICE9IDAgXTsgdGhlbgogCSAgICBlY2hvICIgKioqIFVuYWJs
ZSB0byBmaW5kIHRoZSBuY3Vyc2VzIGxpYnJhcmllcyBvciB0aGUiICAgICAgIDE+JjIKZGlmZiAt
LWdpdCBhL3N1cHBvcnQva2NvbmZpZy9wYXRjaGVzLzIyLWtjb25maWctbHhkaWFsb2ctZml4LWNo
ZWNrLXdpdGgtR0NDMTQucGF0Y2ggYi9zdXBwb3J0L2tjb25maWcvcGF0Y2hlcy8yMi1rY29uZmln
LWx4ZGlhbG9nLWZpeC1jaGVjay13aXRoLUdDQzE0LnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDAwMDAwMDAwMDAuLjQxMDgxYmI0NWQKLS0tIC9kZXYvbnVsbAorKysgYi9zdXBwb3J0
L2tjb25maWcvcGF0Y2hlcy8yMi1rY29uZmlnLWx4ZGlhbG9nLWZpeC1jaGVjay13aXRoLUdDQzE0
LnBhdGNoCkBAIC0wLDAgKzEsNDMgQEAKK0Zyb20gM2FlOTEzMzdiNTNmYTNjY2YwYmFkN2YxODFm
Y2FmNDgzZmFiMjJlZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IFJvYmVydCBNYXJr
byA8cm9iaW1hcmtvQGdtYWlsLmNvbT4KK0RhdGU6IFdlZCwgMyBBcHIgMjAyNCAxNDoxODowNyAr
MDIwMAorU3ViamVjdDogW1BBVENIXSBrY29uZmlnL2x4ZGlhbG9nOiBmaXggY2hlY2soKSB3aXRo
IEdDQzE0CitNSU1FLVZlcnNpb246IDEuMAorQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFy
c2V0PVVURi04CitDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CisKK0dDQzE0IG5vdyB0
cmVhdHMgaW1wbGljaXQgaW50IHR5cGVzIGFzIGVycm9yIHNvIHdoZW4gY2hlY2soKSBmcm9tCitj
aGVjay1seGRpYWxvZy5zaCBpcyBjYWxsZWQgdG8gY2hlY2sgd2hldGhlciB3ZSBjYW4gbGluayBh
Z2FpbnN0IG5jdXJzZXMKK2l0IHdpbGwgZmFpbCBzaWxlbnRseSBhbmQgdGhlIGhlbHAgdGV4dCBp
bmRpY2F0aW5nIHRvIGluc3RhbGwgbmN1cnNlcyBpcworcHJpbnRlZC4KKworSG93ZXZlciwgdGhp
cyBpcyBub3QgZHVlIHRvIG1pc3NpbmcgbmN1cnNlcyBidXQgb25jZSB0aGUgc3RkZXJyIHJlZGly
ZWN0Cit0byAvZGV2L251bGwgaXMgcmVtb3ZlZCB3ZSBjYW4gc2VlIHRoZSByb290IGNhdXNlOgor
PHN0ZGluPjoyOjE6IGVycm9yOiByZXR1cm4gdHlwZSBkZWZhdWx0cyB0byDigJhpbnTigJkgWy1X
aW1wbGljaXQtaW50XQorCitTbywgaW4gb3JkZXIgZm9yIG1lbnVjb25maWcgdG8gd29yayB3aXRo
IEdDQzE0IGxldHMganVzdCBzcGVjaWZ5IHRoZQorcmV0dXJuIHR5cGUgb2YgbWFpbigpIGFzIGlu
dC4KKworU2lnbmVkLW9mZi1ieTogUm9iZXJ0IE1hcmtvIDxyb2JpbWFya29AZ21haWwuY29tPgor
UmV2aWV3ZWQtYnk6IFBldHIgVm9yZWwgPHBldHIudm9yZWxAZ21haWwuY29tPgorVGVzdGVkLWJ5
OiBQZXRyIFZvcmVsIDxwZXRyLnZvcmVsQGdtYWlsLmNvbT4KKy0tLQorIGtjb25maWcvbHhkaWFs
b2cvY2hlY2stbHhkaWFsb2cuc2ggfCAyICstCisgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCisKK2RpZmYgLS1naXQgYS9rY29uZmlnL2x4ZGlhbG9nL2NoZWNr
LWx4ZGlhbG9nLnNoIGIva2NvbmZpZy9seGRpYWxvZy9jaGVjay1seGRpYWxvZy5zaAoraW5kZXgg
MTZjZDlhMzE4Ni4uMjdkNmMzMGE1NyAxMDA3NTUKKy0tLSBhL2tjb25maWcvbHhkaWFsb2cvY2hl
Y2stbHhkaWFsb2cuc2gKKysrKyBiL2tjb25maWcvbHhkaWFsb2cvY2hlY2stbHhkaWFsb2cuc2gK
K0BAIC00OCw3ICs0OCw3IEBAIHRyYXAgInJtIC1mICR0bXAiIDAgMSAyIDMgMTUKKyBjaGVjaygp
IHsKKyAgICAgICAgICRjYyAteCBjIC0gLW8gJHRtcCAyPi9kZXYvbnVsbCA8PCdFT0YnCisgI2lu
Y2x1ZGUgQ1VSU0VTX0xPQworLW1haW4oKSB7fQorK2ludCBtYWluKCkge30KKyBFT0YKKyAJaWYg
WyAkPyAhPSAwIF07IHRoZW4KKyAJICAgIGVjaG8gIiAqKiogVW5hYmxlIHRvIGZpbmQgdGhlIG5j
dXJzZXMgbGlicmFyaWVzIG9yIHRoZSIgICAgICAgMT4mMgorLS0gCisyLjQ0LjAKKwpkaWZmIC0t
Z2l0IGEvc3VwcG9ydC9rY29uZmlnL3BhdGNoZXMvc2VyaWVzIGIvc3VwcG9ydC9rY29uZmlnL3Bh
dGNoZXMvc2VyaWVzCmluZGV4IGU1YTZmNjlkOGYuLmYxMjBlMzIzYjcgMTAwNjQ0Ci0tLSBhL3N1
cHBvcnQva2NvbmZpZy9wYXRjaGVzL3NlcmllcworKysgYi9zdXBwb3J0L2tjb25maWcvcGF0Y2hl
cy9zZXJpZXMKQEAgLTEwLDMgKzEwLDQgQEAKIDE5LW1lcmdlX2NvbmZpZy5zaC1hZGQtYnIyLWV4
dGVybmFsLXN1cHBvcnQucGF0Y2gKIDIwLW1lcmdlX2NvbmZpZy5zaC1BbGxvdy10by1kZWZpbmUt
Y29uZmlnLXByZWZpeC5wYXRjaAogMjEtQXZvaWQtZmFsc2UtcG9zaXRpdmUtbWF0Y2hlcy1mcm9t
LWNvbW1lbnQtbGluZXMucGF0Y2gKKzIyLWtjb25maWctbHhkaWFsb2ctZml4LWNoZWNrLXdpdGgt
R0NDMTQucGF0Y2gKLS0gCjIuNDQuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
