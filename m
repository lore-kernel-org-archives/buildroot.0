Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D0BC4345F
	for <buildroot@archiver.kernel.org>; Fri, 19 Apr 2024 21:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B234241ACC;
	Fri, 19 Apr 2024 21:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j5qdvRBWe3SC; Fri, 19 Apr 2024 21:27:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DFE541ACE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DFE541ACE;
	Fri, 19 Apr 2024 21:27:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 755DD1BF977
 for <buildroot@lists.busybox.net>; Fri, 19 Apr 2024 21:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F74F8228F
 for <buildroot@lists.busybox.net>; Fri, 19 Apr 2024 21:27:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7zEm-aoQImGL for <buildroot@lists.busybox.net>;
 Fri, 19 Apr 2024 21:27:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2288D8220B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2288D8220B
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2288D8220B
 for <buildroot@buildroot.org>; Fri, 19 Apr 2024 21:27:53 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-346359c8785so1998519f8f.0
 for <buildroot@buildroot.org>; Fri, 19 Apr 2024 14:27:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713562071; x=1714166871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aELWl515npyjWEWt6U6j7bdKXD9uouxrLtny6bf6QaM=;
 b=kwPGAQ/lWOIcH1y3xO/nc/x6+KZ0mkNFZeALIfWTYlr/3En3ke0DlbE/DfjBHi4o5M
 674PEmagQwlrsW8rZU8apsw2ExIYP9shVtM8fJ219aV0F0M3yKvpxRC/7gFmJYnVIvFn
 /+sll/eLiFrKxOVpH/bGv7pht8/dx0ppdGjnP9G2sQYr1dV4n+GPirmVrYbrXCvfjx0p
 r864jn1EIHZckNeYA5rfHBiGiATCrjFevGEZ+TNmLIqYxAXEyEO/RLX0GfQH6HPnP4Ix
 dQwXGRMu9lVEXyAtebwVsiNjpIylO7wpZfMFi5IY8rjf6kHFVw0Ck3CbCP6bUE+Z7I6l
 nimQ==
X-Gm-Message-State: AOJu0YxRJ9spgHtMx0ukiyvh8AqInrmq5L5dr7g2joBuPlHxev1/nwuK
 FybgBmgY1QlCw/RLrmofy93KH0+MVDboe6BKAHFEViQuxZWzCJ8Gk7JRKA==
X-Google-Smtp-Source: AGHT+IE9P0bbGbat4aoKysg9BW2GaOwPKgFDzJteLDcnshIU0+oFcK8HsHpDrif6YBoSw5bothZQWQ==
X-Received: by 2002:a5d:4e0a:0:b0:346:4d41:8d24 with SMTP id
 p10-20020a5d4e0a000000b003464d418d24mr2057679wrt.0.1713562070949; 
 Fri, 19 Apr 2024 14:27:50 -0700 (PDT)
Received: from localhost.localdomain ([212.22.152.70])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a170906500800b00a4e24d259edsm2596766ejj.167.2024.04.19.14.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 14:27:49 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 19 Apr 2024 23:27:44 +0200
Message-Id: <20240419212745.512436-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240419212745.512436-1-angelo.compagnucci@gmail.com>
References: <20240419212745.512436-1-angelo.compagnucci@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713562071; x=1714166871; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aELWl515npyjWEWt6U6j7bdKXD9uouxrLtny6bf6QaM=;
 b=GFb3u48lyFZkSDMPuhNAuUPpb2trKIMpFMBzh1/aYvxdgPZe9XEPWnA1S8xzl/yvwa
 W1mWVZt9paM2uWcj/ltNBbIGWfRjLDWjvtjMJ7tHOLHxCCWnKjyCscH4jb9Z8ubS6ymP
 QAH+4ZEOR48WP+vleZQFz8dqzoyhAbo6rw4cCuYUH813cTXlhpqKvWCzxqMAhtPsbw8m
 SQmZ/wxoHHDmJRhLkcGOoIOl7p5m5955QKkACE0QUojIzlg72kCaA84WuicYqi3ZF2mU
 HDvY+JSMIrGZLPpS9erqRw1Tjwi+dfAchANYb20a/+2OtcG5iBfDF3O63ki1iH9GtSnR
 t/Sg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GFb3u48l
Subject: [Buildroot] [PATCH 1/2] package/fail2ban: fix data_files
 installation path
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogQW5nZWxvIENvbXBhZ251Y2NpIDxhbmdlbG9AYW1hcnVsYXNvbHV0aW9ucy5jb20+CgpX
aGVuIHBhY2thZ2luZyBkYXRhX2ZpbGVzIGluIGEgd2hlZWwsIHRob3NlIGZpbGVzIHNoYWxsIGhh
dmUgdGhlIGRlc3RpbmF0aW9uCnBhdGggZXhwcmVzc2VkIGFzIHJlbGF0aXZlIHRvIHRoZSB3aGVl
bCBpbnN0YWxsYXRpb24uClRoZSByZWFzb24gZm9yIHRoYXQgaXMgdGhlIHdoZWVsIGluc3RhbGxh
dGlvbiBzaGFsbCBiZSBjb250YWluZWQgaW5zaWRlIGEKc3BlY2lmaWMgZm9sZGVyIGFuZC9vciBp
biBzaXRlLXBhY2thZ2VzLgpXaGVuIGJ1aWxkaW5nIHRoZSB3aGVlbCBmaWxlIGJ5IHRoZSBiZGlz
dF93aGVlbCBjb21tYW5kLCBweXRob24gd2lsbCBwYWNrYWdlCmZpbGVzIHdpdGggYWJzb2x1dGUg
cGF0cyBhcyBweXRob24gZmlsZXMgZW5kaW5nIHVwIGluc3RhbGxpbmcgdGhlbSBpbgpzaXRlLXBh
Y2thZ2VzLgoKRml4ZXM6Cmh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzM2
YWM1Mjc4ZDE5MTk1YTIxYzNkMDJkMDg3OTY1ZTA4ZjQ5MjI4ZWYKClNpZ25lZC1vZmYtYnk6IEFu
Z2VsbyBDb21wYWdudWNjaSA8YW5nZWxvLmNvbXBhZ251Y2NpQGdtYWlsLmNvbT4KLS0tCiAuLi4w
MDEtc2V0dXAucHktZml4LWRhdGEtcmVsYXRpdmUtcGF0aHMucGF0Y2ggfCA3MyArKysrKysrKysr
KysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNzMgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IHBhY2thZ2UvZmFpbDJiYW4vMDAwMS1zZXR1cC5weS1maXgtZGF0YS1yZWxhdGl2ZS1w
YXRocy5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZmFpbDJiYW4vMDAwMS1zZXR1cC5weS1m
aXgtZGF0YS1yZWxhdGl2ZS1wYXRocy5wYXRjaCBiL3BhY2thZ2UvZmFpbDJiYW4vMDAwMS1zZXR1
cC5weS1maXgtZGF0YS1yZWxhdGl2ZS1wYXRocy5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCAwMDAwMDAwMDAwLi5lMWI1YmM0OTBiCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9m
YWlsMmJhbi8wMDAxLXNldHVwLnB5LWZpeC1kYXRhLXJlbGF0aXZlLXBhdGhzLnBhdGNoCkBAIC0w
LDAgKzEsNzMgQEAKK0Zyb20gN2I3ZmEzYzAyZDQ1NzVjMDkzNjIzMzZiYzMxMDgzNWMzNzg1OWYx
YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IEFuZ2VsbyBDb21wYWdudWNjaSA8YW5n
ZWxvLmNvbXBhZ251Y2NpQGdtYWlsLmNvbT4KK0RhdGU6IEZyaSwgMTkgQXByIDIwMjQgMjI6NDc6
MjAgKzAyMDAKK1N1YmplY3Q6IFtQQVRDSF0gc2V0dXAucHk6IGZpeCBkYXRhIHJlbGF0aXZlIHBh
dGhzCitNSU1FLVZlcnNpb246IDEuMAorQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0
PVVURi04CitDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CisKK0FzIHBlciBkaXN0dXRp
bHMgZG9jdW1lbnRhdGlvbjoKKworVGhlIGRpcmVjdG9yeSBzaG91bGQgYmUgYSByZWxhdGl2ZSBw
YXRoLiBJdCBpcyBpbnRlcnByZXRlZCByZWxhdGl2ZSB0byB0aGUKK2luc3RhbGxhdGlvbiBwcmVm
aXggKFB5dGhvbuKAmXMgc3lzLnByZWZpeCBmb3Igc3lzdGVtIGluc3RhbGxhdGlvbnM7CitzaXRl
LlVTRVJfQkFTRSBmb3IgdXNlciBpbnN0YWxsYXRpb25zKS4gRGlzdHV0aWxzIGFsbG93cyBkaXJl
Y3RvcnkgdG8gYmUgYW4KK2Fic29sdXRlIGluc3RhbGxhdGlvbiBwYXRoLCBidXQgdGhpcyBpcyBk
aXNjb3VyYWdlZCBzaW5jZSBpdCBpcyBpbmNvbXBhdGlibGUKK3dpdGggdGhlIHdoZWVsIHBhY2th
Z2luZyBmb3JtYXQgWzFdLgorCitXaGVuIHBhY2thZ2luZyB0byBhIGJkaXN0X3doZWVsIGluZGVl
ZCwgdGhlIGZpbGVzIGluIHRoZSAiZGF0YV9maWxlcyIgZGljdGlvbmFyeQorYXJlIG5vdCBwaWNr
ZWQgYXQgYWxsIGFzIGRhdGEgZmlsZXMgaWYgdGhleSBoYXZlIGFuIGFic29sdXRlIHBhdGgsCiti
dXQgdGhleSBhcmUgaW5zdGVhZCBhZGRlZCB0byB0aGUgd2hlZWwgYXMgcHl0aG9uIGZpbGVzLgor
VGhpcyBoYXMgdGhlIGVmZmVjdCBvZiBpbnN0YWxsaW5nIHRoZW0gYXMgcGFydCBvZiBweXRob24g
ZmlsZXMgaW4gdGhlCitzaXRlLXBhY2thZ2VzIGZvbGRlciB3aGVuIHRoZSB3aGVlbCBpcyBpbnN0
YWxsZWQuCisKK1RoaXMgcGF0Y2ggY2Fubm90IGJlIHNlbnQgdXBzdHJlYW0gYmVjYXVzZSBpdCBi
cmVha3MgdGhlIGxlZ2FjeSB3YXkgb2YKK2luc3RhbGxpbmcgdGhlIHBhY2thZ2Ugd2l0aCAqcHl0
aG9uIHNldHVwLnB5IGluc3RhbGwqIGFuZCBpdCBpcyBuZWVkZWQgb25seSB0bworY29tcGx5IHdp
dGggdGhlIHBlcDUxNyBidWlsZHJvb3QgY29tcGF0aWJpbGl0eSBsYXllci4KKworWzFdIGh0dHBz
Oi8vZG9jcy5weXRob24ub3JnLzMuMTAvZGlzdHV0aWxzL3NldHVwc2NyaXB0Lmh0bWwjaW5zdGFs
bGluZy1hZGRpdGlvbmFsLWZpbGVzCitTaWduZWQtb2ZmLWJ5OiBBbmdlbG8gQ29tcGFnbnVjY2kg
PGFuZ2Vsby5jb21wYWdudWNjaUBnbWFpbC5jb20+CistLS0KKyBzZXR1cC5weSB8IDE0ICsrKysr
KystLS0tLS0tCisgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMo
LSkKKworZGlmZiAtLWdpdCBhL3NldHVwLnB5IGIvc2V0dXAucHkKK2luZGV4IDkxZjcxY2YyLi45
OWJhMmUzMiAxMDA3NTUKKy0tLSBhL3NldHVwLnB5CisrKysgYi9zZXR1cC5weQorQEAgLTIzOCwy
NiArMjM4LDI2IEBAIHNldHVwKAorIAkJCQlmb3IgZiBpbiB3WzJdXQorIAl9IGlmIHdpdGhfdGVz
dHMgZWxzZSB7fSwKKyAJZGF0YV9maWxlcyA9IFsKKy0JCSgnL2V0Yy9mYWlsMmJhbicsCisrCQko
J2V0Yy9mYWlsMmJhbicsCisgCQkJZ2xvYigiY29uZmlnLyouY29uZiIpCisgCQkpLAorLQkJKCcv
ZXRjL2ZhaWwyYmFuL2ZpbHRlci5kJywKKysJCSgnZXRjL2ZhaWwyYmFuL2ZpbHRlci5kJywKKyAJ
CQlnbG9iKCJjb25maWcvZmlsdGVyLmQvKi5jb25mIikKKyAJCSksCistCQkoJy9ldGMvZmFpbDJi
YW4vZmlsdGVyLmQvaWdub3JlY29tbWFuZHMnLAorKwkJKCdldGMvZmFpbDJiYW4vZmlsdGVyLmQv
aWdub3JlY29tbWFuZHMnLAorIAkJCVtwIGZvciBwIGluIGdsb2IoImNvbmZpZy9maWx0ZXIuZC9p
Z25vcmVjb21tYW5kcy8qIikgaWYgaXNmaWxlKHApXQorIAkJKSwKKy0JCSgnL2V0Yy9mYWlsMmJh
bi9hY3Rpb24uZCcsCisrCQkoJ2V0Yy9mYWlsMmJhbi9hY3Rpb24uZCcsCisgCQkJZ2xvYigiY29u
ZmlnL2FjdGlvbi5kLyouY29uZiIpICsKKyAJCQlnbG9iKCJjb25maWcvYWN0aW9uLmQvKi5weSIp
CisgCQkpLAorLQkJKCcvZXRjL2ZhaWwyYmFuL2ZhaWwyYmFuLmQnLAorKwkJKCdldGMvZmFpbDJi
YW4vZmFpbDJiYW4uZCcsCisgCQkJJycKKyAJCSksCistCQkoJy9ldGMvZmFpbDJiYW4vamFpbC5k
JywKKysJCSgnZXRjL2ZhaWwyYmFuL2phaWwuZCcsCisgCQkJJycKKyAJCSksCistCQkoJy92YXIv
bGliL2ZhaWwyYmFuJywKKysJCSgndmFyL2xpYi9mYWlsMmJhbicsCisgCQkJJycKKyAJCSksCisg
CV0gKyBkYXRhX2ZpbGVzX2V4dHJhLAorLS0gCisyLjM0LjEKKwotLSAKMi4zNC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
