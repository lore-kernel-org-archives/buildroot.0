Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8407EE57CF
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 19:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8962740B57;
	Wed, 11 Sep 2024 19:09:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CoGjCWKaY5K6; Wed, 11 Sep 2024 19:09:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29E6C4187E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29E6C4187E;
	Wed, 11 Sep 2024 19:09:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 504371BF369
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 19:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EAC04187E
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 19:09:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pvqcLN6dPXFh for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 19:09:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A101B40B57
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A101B40B57
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A101B40B57
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 19:09:03 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-374bd059b12so145183f8f.1
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 12:09:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726081741; x=1726686541;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=njHplZQZrU/A0UQxXrHXU4l7Z8QhicinAvP3vWw12O8=;
 b=Rzb5S0W8NgYojsN6OB7f34psddUmvMDoAGa0pUWlTQD3OI5fbWhq9FlQk+WMV2v0u+
 EjYpRXGxXSlXmMRhFSNF6kTDOs92dMDKvk7cxWUTUsrgyGsMzXSR4OkgxMB/mMm2/+Q5
 0QutngWiWIbgyvTvWo5Cnb5/A+8edmOhgA36bB58z+4ANaTf1h5uysTxK1Xhv+Qj+pT3
 hkr1WK3Lc9kiyelbtKkqQe4czaeFwDvBYHpb5zfS/cGPfWXzmxAcVYhKD/qPkn+PzQmj
 UQOJNkleY6lRxeWou/wqEWlwxsB3/wYvZ8iyxvVn5umwkTKhpaakO60krpbrep68nWt4
 oGVg==
X-Gm-Message-State: AOJu0Yz1y2Bk6LB7XD/TIjXqiF5KTQedqB35MoviZZqUv105sbRKSiqs
 KSWufefMRB+MPCzINz501zzZDtGFEwnr1NueEkLHo5eUi2ujboFOaaXoUA==
X-Google-Smtp-Source: AGHT+IF8UDk1hPgRsUosOIVgInL/UCe/87SFFEKZLtLxRvkEJxp9a47n3h58/iKSIWCApjAxTAHpXg==
X-Received: by 2002:a5d:498e:0:b0:374:b5fc:68df with SMTP id
 ffacd0b85a97d-378c2cd3a87mr146570f8f.4.1726081741152; 
 Wed, 11 Sep 2024 12:09:01 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37895649b88sm12326818f8f.6.2024.09.11.12.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 12:09:00 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 11 Sep 2024 21:09:00 +0200
Message-ID: <20240911190900.982461-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726081741; x=1726686541; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=njHplZQZrU/A0UQxXrHXU4l7Z8QhicinAvP3vWw12O8=;
 b=hqbkZ7NxOO9RweR8yObmXppKeOG9Mli5ho6JXLjRY84FdUqaI+XiKjfYPj2xkofxDu
 VcFvxW/5Rl+yf5deKLfKzxM3NVFJu1Vi+GnrWBy357Qj6e/CVLUP6kvWMiW80HBu+yjL
 9/uEGDmkeiHcS/jSuT/VX4zlrdkNWomW+OdxlG7AgwkPuTdVDqg4PuVMtpXeNPjlaVD2
 i6vkaymVu9U4DM2T34IASyPD07lrbYZQekYMHBYsQe3U88E5XystfQ36s/XEzT/yzZT8
 GHlkwBt6u1Imbnd0B8spa4A9rH0mwHByycDzqyE5bx7X7HaVAvsLubvpCFDOCtSnze8n
 HN7g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hqbkZ7Nx
Subject: [Buildroot] [PATCH] support/scripts: fix RPATH fixups
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q29tbWl0IGE4N2FiY2Y2ZGE2NSAoTWFrZWZpbGU6IHJ1biBQUEQgYW5kIFJQQVRIIGZpeHVwIGlu
IGhvc3QtZmlhbGl6ZSkKKHNpYykgbW92ZWQgdGhlIGZpeHVwcyBwZXZpb3VzbHkgZG9uZSBpbiBw
cmVwYXJlLXNkaywgdG8gaG9zdC1maW5hbGl6ZS4KClRoaXMgZXhwb3NlZCBhIGJ1ZyBpbiBmaXgt
cnBhdGgsIHdoZW4gUlBBVEggY29udGFpbnMgbXVsdGlwbGUgZW50cmllcywKbGlrZTogIC9QUEQv
aG9zdC1mb28vaG9zdC9saWI6L1BQRC9ob3N0LWZvby9ob3N0L2xpYi9mb28KCkluIHRoYXQgc2l0
dWF0aW9uLCB3ZSB3YW50IHRvIGdldCByaWQgb2YgL1BQRC9ob3N0LWZvbyBhbmQgcmVwbGFjZSBp
dAp3aXRoIHRoZSBmaW5hbGUgSE9TVF9ESVIsIHNvIHdlIG1hbmdsZSB0aGUgUlBBVEggd2l0aCBh
IHNlZCBleHByZXNzaW9uLgoKSG93ZXZlciwgdGhhdCBzZWQgZXhwcmVzc2lvbiBvbmx5IGV2ZXIg
cmVwbGFjZXMgdGhlIGZpcnN0IG1hdGNoLCBhcyBpdAppcyBtaXNzaW5nIHRoZSAnZycgb3B0aW9u
LiBUaHVzLCB0aGUgc2Vjb25kIChhbmQgZm9sbG93aW5nKSBwYXJ0cyBvZgpSUEFUSCBhcmUgc3Rp
bGwgcmVmZXJyaW5nIHRvIHRoZSBQUEQsIGFuZCB0aHVzIHBhdGNoZWxmIGRvZXMgbm90IGZpbmQg
aXQKcmVsYXRpdmUgdG8gdGhlIGZpbmFsIEhPU1RfRElSLCBhbWQgcm9wcyBpdC4gVGhpcyBldmVu
dHVhbGx5IGxlYWQgdG8gYQpmaW5hbCBSUEFUSCBzZXQgYXMgJE9SSUdJTi8uLi9saWIgaW5zdGVh
ZCBvZiB0aGUgZXhwZWN0ZWQKJE9SSUdJTi8uLi9saWI6JE9SSUdJTi8uLi9saWIvZm9vCgpUaGlz
IGlzIHRoZSBjYXNlIGZvciBob3N0LXN5c3RlbWQsIHdoaWNoIGluc3RhbGxzIHNvbWUgb2YgaXRz
IGxpYnJhcmllcwppbiAkUFJFRklYL2xpYi9zeXN0ZW1kLyBhbmQgYWRkcyBhbiBSUEFUSCBzZXQg
YXBwcm9wcmlhdGVseSB0bwovUFBEL2hvc3Qtc3lzdGVtZC9ob3N0L2xpYjovUFBEL2hvc3Qtc3lz
dGVtZC9ob3N0L2xpYi9zeXN0ZW1kIGFuZCB0aGF0CmdldHMgaW5jb3JyZWN0bHkgbWFuZ2xlZC4K
CkZpeGVzOiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9pc3N1
ZXMvMzkKCkFsc28gZml4IGEgdHlwbyBpbiB0aGUgY29tbWVudCBqdXN0IGFib3ZlLgoKUmVwb3J0
ZWQtYnk6IEpvc8OpIEx1aXMgU2FsdmFkb3IgUnVmbyBAamxzYWx2YWRvcgpTaWduZWQtb2ZmLWJ5
OiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4KLS0tCiBzdXBwb3J0L3Nj
cmlwdHMvZml4LXJwYXRoIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3N1cHBvcnQvc2NyaXB0cy9maXgtcnBhdGgg
Yi9zdXBwb3J0L3NjcmlwdHMvZml4LXJwYXRoCmluZGV4IDFlNTg2NDZjZWEuLmQzNDIxNTA0YTUg
MTAwNzU1Ci0tLSBhL3N1cHBvcnQvc2NyaXB0cy9maXgtcnBhdGgKKysrIGIvc3VwcG9ydC9zY3Jp
cHRzL2ZpeC1ycGF0aApAQCAtODQsOSArODQsOSBAQCBwYXRjaF9maWxlKCkgewogICAgICMgd29y
ayB3aXRoIHRoZSAtLW1ha2UtcnBhdGgtcmVsYXRpdmUgJHtyb290ZGlyfSBpbnZvY2F0aW9uIGFz
CiAgICAgIyB0aGUgcGVyLXBhY2thZ2UgaG9zdCBkaXJlY3RvcnkgaXMgbm90IHdpdGhpbiAke3Jv
b3RkaXJ9LiBTbywKICAgICAjIHdlIHJld3JpdGUgYWxsIFJQQVRIcyBwb2ludGluZyB0byBwZXIt
cGFja2FnZSBkaXJlY3RvcmllcyBzbwotICAgICMgdGhhdCB0aGV5IHBvaW50IHRvIHRoZSBnbG9i
YWwgaG9zdCBkaXJlY3RyeS4KKyAgICAjIHRoYXQgdGhleSBwb2ludCB0byB0aGUgZ2xvYmFsIGhv
c3QgZGlyZWN0b3J5LgogICAgICMgc2hlbGxjaGVjayBkaXNhYmxlPVNDMjAwMSAjICR7dmFyLy9z
ZWFyY2gvcmVwbGFjZX0gaGFyZCB3aGVuIHNlYXJjaCBvciByZXBsYWNlIGhhdmUgLyBpbiB0aGVt
Ci0gICAgY2hhbmdlZF9ycGF0aD0iJChlY2hvICIke3JwYXRofSIgfCBzZWQgInNAJHtQRVJfUEFD
S0FHRV9ESVJ9L1teL11cKy9ob3N0QCR7SE9TVF9ESVJ9QCIpIgorICAgIGNoYW5nZWRfcnBhdGg9
IiQoZWNobyAiJHtycGF0aH0iIHwgc2VkICJzQCR7UEVSX1BBQ0tBR0VfRElSfS9bXi9dXCsvaG9z
dEAke0hPU1RfRElSfUBnIikiCiAgICAgaWYgdGVzdCAiJHtycGF0aH0iICE9ICIke2NoYW5nZWRf
cnBhdGh9IiA7IHRoZW4KICAgICAgICAgIiR7UEFUQ0hFTEZ9IiAtLXNldC1ycGF0aCAiJHtjaGFu
Z2VkX3JwYXRofSIgIiR7ZmlsZX0iCiAgICAgZmkKLS0gCjIuNDYuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
