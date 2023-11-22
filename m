Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D3BC61D97
	for <buildroot@archiver.kernel.org>; Wed, 22 Nov 2023 01:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F258408D5;
	Wed, 22 Nov 2023 01:41:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F258408D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AQz_F6C8XKGB; Wed, 22 Nov 2023 01:41:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4462F40425;
	Wed, 22 Nov 2023 01:41:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4462F40425
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 706351BF3B0
 for <buildroot@lists.busybox.net>; Wed, 22 Nov 2023 01:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4966C40425
 for <buildroot@lists.busybox.net>; Wed, 22 Nov 2023 01:41:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4966C40425
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ylnd3VmlLmO5 for <buildroot@lists.busybox.net>;
 Wed, 22 Nov 2023 01:41:24 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 622314035E
 for <buildroot@buildroot.org>; Wed, 22 Nov 2023 01:41:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 622314035E
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4083f613275so30445235e9.2
 for <buildroot@buildroot.org>; Tue, 21 Nov 2023 17:41:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700617282; x=1701222082;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mjr3I/te/rp2O6K3BvV9Qa2aJDXLhhnKNJ7CMPl+pHU=;
 b=LhDw/6qTZ+0YhjMZpMqgB7ouOASeVL4UdlvnX6fwAUlqFZLSBFZ4WJrk3SzXQcpyGv
 KtZCEEccF3/fQicqvKJJMAXYlYqb4CRI3wrMjtaUTVw34Rlg/llJuw0OBr8AIn13/vr9
 F86nTY3rpBu5Jq7gSHR1GZqMvyJtVJjOuiph7y7dSaNXOfCvM7s55IdWkBxUvvvVyIoZ
 iqHYFZ/GDVF6BO1+yOR1aaRUwoPDuSeeV7kS73uxL7MvRz14HRNZsjbBNkoZ/w2DuSAe
 10/+CGB6nNnzDjCphRW6sw5GXN4PGeD4mVxq0C4D1hZEZSjlwc1du+J4fgRfUj7rTEGM
 0fzA==
X-Gm-Message-State: AOJu0YxoreeTCk+lfgZvKt7V8Y1EcKPTFHxDoO/nzuE6TgxwkJZnkGg/
 pnL1gRWoT7y4LBESI24UEdY2qIVOo7JHgtNYiH4=
X-Google-Smtp-Source: AGHT+IEgo0RLNkg+wPw8szDpIXY8oYDvGHu/FmFFDWBYJZUQAdx47UGNxJqClF1DwIMNiN3KeBQkUw==
X-Received: by 2002:a05:600c:19c6:b0:402:ea96:c09a with SMTP id
 u6-20020a05600c19c600b00402ea96c09amr357443wmq.16.1700617282100; 
 Tue, 21 Nov 2023 17:41:22 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a05600c4f9300b0040a43d458c9sm440753wmq.25.2023.11.21.17.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 17:41:21 -0800 (PST)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Wed, 22 Nov 2023 02:41:08 +0100
Message-ID: <20231122014108.2430309-2-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231122014108.2430309-1-gael.portay@rtone.fr>
References: <20231122014108.2430309-1-gael.portay@rtone.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtone.fr; s=google; t=1700617282; x=1701222082; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mjr3I/te/rp2O6K3BvV9Qa2aJDXLhhnKNJ7CMPl+pHU=;
 b=UvNj3SKPRc2yckQWA+oG/sAWp3CDg+QIahj+NHCxBM+p4MWVhoK5HgmtTCVbruv+QS
 o+yys8FyQ68+ttgkukRY4PdsZufYUqW+OsiNOV+GhjLC3O6ykTmsoulinMlzAMLpy0jI
 z9Kx0NKX3DZhEcI+fuMEV/6/Wlkgbx5bYJLyY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=rtone.fr header.i=@rtone.fr
 header.a=rsa-sha256 header.s=google header.b=UvNj3SKP
Subject: [Buildroot] [PATCH 2/2] Revert "Fix rasberry Pi 64bit firmware
 overlay inclusion"
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
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyByZXZlcnRzIGNvbW1pdCA1MWQ2ZDZjNTgwNDMyNDM1ZjJiMmY5NWVkMzVlMjJhNWVjYmU5
ZGNiLgoKVGhhdCBjaGFuZ2UgaXMgbm8gbW9yZSByZWxldmFudCBzaW5jZSB0aGUgZ2VuaW1hZ2Uu
Y2ZnIGZpbGVzIGFyZQpnZW5lcmF0ZWQgYnkgdGhlIGNvbW1pdCBlMzdlZTVhY2RjIChib2FyZC9y
YXNwYmVycnlwaS9wb3N0LWltYWdlLnNoOgpnZW5lcmF0ZSBnZW5pbWFnZSBjb25maWcgZnJvbSB0
ZW1wbGF0ZSBpZiBub3QgcHJlc2VudCksIGFuZCBzaW5jZSB0aGUKdmFyaWFudC1zcGVjaWZpYyBm
aWxlcyB3ZXJlIGRyb3BwZWQgb2ZmIGJ5IHRoZSBjb21taXQgZmM1Y2RlZWQ3MgooYm9hcmQvcmFz
cGJlcnJ5cGk6IGRyb3AgdmFyaWFudC1zcGVjaWZpYyBnZW5pbWFnZSBmaWxlcykuCgpUaGlzIHJl
bW92ZXMgdGhlIHZlcnkgbGFzdCBhbGl2ZSBwaWVjZSBvZiBjaGFuZ2Ugb2YgdGhlIGNvbW1pdAo1
MWQ2ZDZjNTgwIChGaXggcmFzYmVycnkgUGkgNjRiaXQgZmlybXdhcmUgb3ZlcmxheSBpbmNsdXNp
b24pOyB0aGUKY29tbWl0IGlzIGZ1bGx5IHJldmVydGVkIG5vdy4KClNpZ25lZC1vZmYtYnk6IEdh
w6tsIFBPUlRBWSA8Z2FlbC5wb3J0YXlAcnRvbmUuZnI+Ci0tLQpNYWludGFpbmVycywKClVubGVz
cyBJIGFtIG1pc3Rha2VuLCB0aGlzIGNvdWxkIGdvbmUsIHJpZ2h0PwoKUmVnYXJkcywKR2HDq2wK
IHBhY2thZ2UvcnBpLWZpcm13YXJlL3JwaS1maXJtd2FyZS5tayB8IDYgLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3JwaS1maXJtd2Fy
ZS9ycGktZmlybXdhcmUubWsgYi9wYWNrYWdlL3JwaS1maXJtd2FyZS9ycGktZmlybXdhcmUubWsK
aW5kZXggNTNkNmQ4Y2EwNi4uYjUxNTc2OGJlMyAxMDA2NDQKLS0tIGEvcGFja2FnZS9ycGktZmly
bXdhcmUvcnBpLWZpcm13YXJlLm1rCisrKyBiL3BhY2thZ2UvcnBpLWZpcm13YXJlL3JwaS1maXJt
d2FyZS5tawpAQCAtNTksMTIgKzU5LDYgQEAgZGVmaW5lIFJQSV9GSVJNV0FSRV9JTlNUQUxMX0RU
Ql9PVkVSTEFZUwogCSQoSU5TVEFMTCkgLUQgLW0gMDY0NCAkKEBEKS9ib290L292ZXJsYXlzL292
ZXJsYXlfbWFwLmR0YiAkKEJJTkFSSUVTX0RJUikvcnBpLWZpcm13YXJlL292ZXJsYXlzLwogCXRv
dWNoICQoQklOQVJJRVNfRElSKS9ycGktZmlybXdhcmUvb3ZlcmxheXMvUkVBRE1FCiBlbmRlZgot
ZWxzZQotIyBTdGlsbCBjcmVhdGUgdGhlIGRpcmVjdG9yeSwgc28gYSBnZW5pbWFnZS5jZmcgY2Fu
IGluY2x1ZGUgaXQgaW5kZXBlbmRlbnRseSBvZgotIyB3aGV0aGVyIF9JTlNUQUxMX0RUQl9PVkVS
TEFZUyBpcyBzZWxlY3RlZCBvciBub3QuCi1kZWZpbmUgUlBJX0ZJUk1XQVJFX0lOU1RBTExfRFRC
X09WRVJMQVlTCi0JJChJTlNUQUxMKSAtZCAkKEJJTkFSSUVTX0RJUikvcnBpLWZpcm13YXJlL292
ZXJsYXlzCi1lbmRlZgogZW5kaWYKIAogIyBJbnN0YWxsIHByZWJ1aWx0IGxpYnJhcmllcyBpZiBS
UElfVVNFUkxBTkQgbm90IGVuYWJsZWQKLS0gCjIuNDIuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
