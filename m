Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3944FC369D3
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 20:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9A5181316;
	Mon, 21 Apr 2025 20:28:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pDRIIKkZnX1w; Mon, 21 Apr 2025 20:28:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E74F280C4A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E74F280C4A;
	Mon, 21 Apr 2025 20:28:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 592C71BC
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 20:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FCD940A5B
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 20:28:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id huvsTn6g4iJY for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 20:28:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BCE1740B87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCE1740B87
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BCE1740B87
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 20:28:17 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3995ff6b066so2289547f8f.3
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 13:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745267296; x=1745872096;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K5WtVLKfXA3o7QiKdtdkmlym/o7zTjA8SpxhHKY6SJc=;
 b=MItl+utRHkI3W+MhGcsbmZlGNNso8d6XytILELaGUBXxg402kBPTU36bQQJ8eRcWRn
 vLf297LEzaELCCn6Vjfm9FBXUOyBRL3wvf6K7ftZCSk7ClwXwrPCoZ9NGph8zYuI014C
 0EyxvzhtPQansYeBrMhILG3S+BipSVPkTcjvE/jzHEFEKzUeJBqktK990HyMDiX0Y68v
 w09p3V5X/cAsnud8tRSCSVZVRQUmB8bZFJIdL6cmEJzJXp4xUYo4saQIDsv0w3KI2422
 LhOa3AbI9UsMmqp0dzSNc9VUHCYrJn85HymKfztfY7t0EoctLBjopmfi8WmXJoXGlqGy
 VQgQ==
X-Gm-Message-State: AOJu0YwdGW7umXitRsgLOl+mpuEdVpcRTLCRktBnE1Rwu6nsypA/A9dH
 z+/JfhonpB3KPNBS8UjQfSVJNj3FvjDA7wO86uhFs0zPl2rlQMAffTAMUA==
X-Gm-Gg: ASbGncsgi9bRQTLTUYm6CWDw8l7oY3qiiY9c3tz45lj64cF3aC7zUHAt0QBCoTWQ584
 XSL4fAqfU1CynDByd40/cZqxDKcdMmecXZqISnT0vlMbmp6/UV7Co0kcajeviUgXajFuAdTXlD1
 Ibc7TVYQXaLBUQiKiDB/mugCPH+ViBSnewLug3cQ/4FhSiHYnKWd+daH7Xwd7ROqb9IL6woiNl1
 IWGGaGXeojcLCGzxy3+eFgfSUjE1A4rWL259udcJbCrEgplHzD1tNWSKNnnYFabseHwcC7HJeVA
 YVsjiuDTOkdJKdphOEzEbFtu/MbymvMrZ7woAXaOpUm5jZ1vxZSfHNFoBr/txTM3efc=
X-Google-Smtp-Source: AGHT+IG9/+PfZl8m+0w+3yqDDcqVybEBC6nq+pLw3CKvjBssiUNw3sDh6w6at4X4ZCyzEA4qajFMBg==
X-Received: by 2002:a5d:5f92:0:b0:39c:2688:6edd with SMTP id
 ffacd0b85a97d-39efba526dcmr9700365f8f.15.1745267295543; 
 Mon, 21 Apr 2025 13:28:15 -0700 (PDT)
Received: from localhost.localdomain (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5acc93sm148912705e9.10.2025.04.21.13.28.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 13:28:14 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 21 Apr 2025 22:27:14 +0200
Message-ID: <20250421202719.896659-2-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250421202719.896659-1-petr.vorel@gmail.com>
References: <20250421202719.896659-1-petr.vorel@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745267296; x=1745872096; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K5WtVLKfXA3o7QiKdtdkmlym/o7zTjA8SpxhHKY6SJc=;
 b=AK3IUdNWAKENOIHX5CD5yPxtFY7KWB4XuDcSTmNbWXHaRmp4+CvT/JgcUh+4vr5v1h
 UT2171QXsYz6zWeeplTyUPwAtWMu9p6gwowWCje0FG5VfQivSzaJZ7bUuTx8GaxTeqYx
 q4xUhsV6SVCxusTQIIdmy4NA4MHpK+Ra5kslkRNnbsYochN8pFfpepPK1A4hYnO20vQ0
 zQ3L045y7JT46ahlCampLVQJQJRjrZ6fC7O+MaggMO09xTuHYiGEZS6YPyWOuTFjhkNX
 5+juybW316ncsUKsB5T0oq1kkqvgheB6o7m3Q5Cko+ADGKHsW05bBY22+9r+DFD5GpzJ
 4Y+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AK3IUdNW
Subject: [Buildroot] [PATCH 2/2] package/iproute2: backport NULL dereference
 fix
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
Cc: Petr Vorel <petr.vorel@gmail.com>, Akhilesh Nema <nemaakhilesh@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyB3aWxsIGJlIHBhcnQgb2YgNi4xNS4wIHJlbGVhc2UuCgpTaWduZWQtb2ZmLWJ5OiBQZXRy
IFZvcmVsIDxwZXRyLnZvcmVsQGdtYWlsLmNvbT4KLS0tCkhpIGFsbCwKCk5vdCBzdXJlIGFib3V0
IHRoaXMsIGJ1dCBJTUhPIHdvcnRoIHRvIGJhY2twb3J0LgpUaGVyZWZvcmUgc2VwYXJhdGVkIGlu
dG8gaXQncyBvd24gY29tbWl0LCBmZWVsIGZyZWUgdG8gc3F1YXNoIGludG8Kc2luZ2xlIGNvbW1p
dC4KCkJ1aWxkIHRlc3RlZDoKCiAgICAgICAgICAgICAgICAgICAgYm9vdGxpbi1hcm12NS11Y2xp
YmMgWzEvNl06IE9LCiAgICAgICAgICAgICAgICAgICAgIGJvb3RsaW4tYXJtdjctZ2xpYmMgWzIv
Nl06IE9LCiAgICAgICAgICAgICAgICAgICBib290bGluLWFybXY3bS11Y2xpYmMgWzMvNl06IFNL
SVBQRUQKICAgICAgICAgICAgICAgICAgICAgYm9vdGxpbi14ODYtNjQtbXVzbCBbNC82XTogT0sK
ICAgICAgICAgICAgICAgICAgICAgIGJyLWFybS1mdWxsLXN0YXRpYyBbNS82XTogT0sKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBhcm0tYWFyY2g2NCBbNi82XTogT0sKCktpbmQgcmVnYXJk
cywKUGV0cgoKCiAuLi5lcmVmZXJlbmNlLXdoZW4tbm8tZW50cmllcy1zcGVjaWZpZWQucGF0Y2gg
fCAzNiArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygr
KQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvaXByb3V0ZTIvMDAwMS1uc3RhdC1OVUxMLURl
cmVmZXJlbmNlLXdoZW4tbm8tZW50cmllcy1zcGVjaWZpZWQucGF0Y2gKCmRpZmYgLS1naXQgYS9w
YWNrYWdlL2lwcm91dGUyLzAwMDEtbnN0YXQtTlVMTC1EZXJlZmVyZW5jZS13aGVuLW5vLWVudHJp
ZXMtc3BlY2lmaWVkLnBhdGNoIGIvcGFja2FnZS9pcHJvdXRlMi8wMDAxLW5zdGF0LU5VTEwtRGVy
ZWZlcmVuY2Utd2hlbi1uby1lbnRyaWVzLXNwZWNpZmllZC5wYXRjaApuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAwLi44YTc3ZmM0MWYzCi0tLSAvZGV2L251bGwKKysrIGIvcGFj
a2FnZS9pcHJvdXRlMi8wMDAxLW5zdGF0LU5VTEwtRGVyZWZlcmVuY2Utd2hlbi1uby1lbnRyaWVz
LXNwZWNpZmllZC5wYXRjaApAQCAtMCwwICsxLDM2IEBACitGcm9tIDg2NmUxZDEwN2I3ZGU2OGNh
MWZjZDFkNGQ1ZmZlY2Y5ZDk2YmZmMzAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBa
aUFvIExpIDwyMzExMDI0MDA4NEBtLmZ1ZGFuLmVkdS5jbj4KK0RhdGU6IFdlZCwgOSBBcHIgMjAy
NSAyMzowMzozMCArMDgwMAorU3ViamVjdDogW1BBVENIXSBuc3RhdDogTlVMTCBEZXJlZmVyZW5j
ZSB3aGVuIG5vIGVudHJpZXMgc3BlY2lmaWVkCisKK1RoZSBOVUxMIFBvaW50ZXIgRGVyZWZlcmVu
Y2UgdnVsbmVyYWJpbGl0eSBoYXBwZW5zIGluIGxvYWRfdWdseV90YWJsZSgpLCBtaXNjL25zdGF0
LmMsIGluIHRoZSBsYXRlc3QgdmVyc2lvbiBvZiBpcHJvdXRlMi4KK1RoZSB2dWxuZXJhYmlsaXR5
IGNhbiBiZSB0cmlnZ2VyZWQgYnk6CisxLiBkYiBpcyBzZXQgdG8gTlVMTCBhdCBzdHJ1Y3QgbnN0
YXRfZW50ICpkYiA9IE5VTEw7CisyLiBuIGlzIHNldCB0byBOVUxMIGF0IG4gPSBkYjsKKzMuIE5V
TEwgZGVyZWZlcmVuY2Ugb2YgdmFyaWFibGUgbiBoYXBwZW5zIGF0IHNzY2FuZihwKzEsICIlbGx1
IiwgJm4tPnZhbCkgIT0gMQorCitTaWduZWQtb2ZmLWJ5OiBaaUFvIExpIDwyMzExMDI0MDA4NEBt
LmZ1ZGFuLmVkdS5jbj4KK1NpZ25lZC1vZmYtYnk6IFN0ZXBoZW4gSGVtbWluZ2VyIDxzdGVwaGVu
QG5ldHdvcmtwbHVtYmVyLm9yZz4KK1sgdXBzdHJlYW0gc3RhdHVzOiA4NjZlMWQxMCAoIm5zdGF0
OiBOVUxMIERlcmVmZXJlbmNlIHdoZW4gbm8gZW50cmllcyBzcGVjaWZpZWQiKSBdCistLS0KKyBt
aXNjL25zdGF0LmMgfCA0ICsrKysKKyAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCisK
K2RpZmYgLS1naXQgYS9taXNjL25zdGF0LmMgYi9taXNjL25zdGF0LmMKK2luZGV4IGZjZTNlOWMx
Li5iMmUxOWJkZSAxMDA2NDQKKy0tLSBhL21pc2MvbnN0YXQuYworKysrIGIvbWlzYy9uc3RhdC5j
CitAQCAtMjE4LDYgKzIxOCwxMCBAQCBzdGF0aWMgdm9pZCBsb2FkX3VnbHlfdGFibGUoRklMRSAq
ZnApCisgCQkJcCA9IG5leHQ7CisgCQl9CisgCQluID0gZGI7CisrCQlpZiAobiA9PSBOVUxMKSB7
CisrCQkJZnByaW50ZihzdGRlcnIsICJFcnJvcjogSW52YWxpZCBpbnB1dCDigJMgbGluZSBoYXMg
JzonIGJ1dCBubyBlbnRyaWVzLiBBZGQgdmFsdWVzIGFmdGVyICc6Jy5cbiIpOworKwkJCWV4aXQo
LTIpOworKwkJfQorIAkJbnJlYWQgPSBnZXRsaW5lKCZidWYsICZidWZsZW4sIGZwKTsKKyAJCWlm
IChucmVhZCA9PSAtMSkgeworIAkJCWZwcmludGYoc3RkZXJyLCAiJXM6JWQ6IGVycm9yIHBhcnNp
bmcgaGlzdG9yeSBmaWxlXG4iLAorLS0gCisyLjQ5LjAKKwotLSAKMi40OS4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
