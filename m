Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47F5C4167B
	for <buildroot@archiver.kernel.org>; Sun, 10 Dec 2023 15:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A4F8608A6;
	Sun, 10 Dec 2023 15:25:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A4F8608A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0diZiCYy5LbN; Sun, 10 Dec 2023 15:25:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D72AF60A7F;
	Sun, 10 Dec 2023 15:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D72AF60A7F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 600691BF86B
 for <buildroot@lists.busybox.net>; Sun, 10 Dec 2023 15:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D86580C38
 for <buildroot@lists.busybox.net>; Sun, 10 Dec 2023 15:25:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D86580C38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IsW4Zy7bwsRG for <buildroot@lists.busybox.net>;
 Sun, 10 Dec 2023 15:25:22 +0000 (UTC)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E445780C81
 for <buildroot@busybox.net>; Sun, 10 Dec 2023 15:25:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E445780C81
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50be24167efso4117831e87.3
 for <buildroot@busybox.net>; Sun, 10 Dec 2023 07:25:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702221919; x=1702826719;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S8sjv+a7Pd4hIk2i4M4+BcZg4JsUKFkSUev5WYgMwUg=;
 b=KZ75gnOKJvW0Gd4kwh556+h4t8QfqX1wwA8AER/UIj7nyzlG1YY2k/R29ZE3f8to1D
 1nr/chQiLckC7fw9Z/yHeGnWPq+Dgv1FXXspt+kp6Eu2duQZaBcsnd6PspxDhWKHIrX6
 iI9RsQSaH8Qio8H0b1SrYmzhq27aDymv37u6/pNse57GScJu7vrPh3/euAf2ecUnL9Q7
 HcN8ZrW2tXKsdUtjpybrGS4Ao3qzyGqqQJoi0tbARjj5PDcle60AWggxOnhF1oDXSIOz
 RjngMpMbtkqGxgpx6B+kdhh4vH0f/i/3Raios0YIAU+GbxVq47PF7KFOINeDdH/4i5ZK
 0EpQ==
X-Gm-Message-State: AOJu0YzGbvt4Q0iXL3Z1l8jbkTIE2mZTk84d5EGf74BOEpbW0YLUYgBZ
 wN2iSVAMa+z6FjM+S8ahvF/ZM7Sh5Ss=
X-Google-Smtp-Source: AGHT+IF3061eDL/5sw0eVsQWuzW0Jle5wjPFEif5t/fWBVIfo6KBBEjTLjx9j3V6p0afATFrCI22jQ==
X-Received: by 2002:a19:7616:0:b0:50b:fca3:eaf6 with SMTP id
 c22-20020a197616000000b0050bfca3eaf6mr686001lff.240.1702221919018; 
 Sun, 10 Dec 2023 07:25:19 -0800 (PST)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 m29-20020a50999d000000b0054cc903baadsm2796546edb.30.2023.12.10.07.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Dec 2023 07:25:18 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 10 Dec 2023 16:25:12 +0100
Message-Id: <20231210152513.1642373-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702221919; x=1702826719; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=S8sjv+a7Pd4hIk2i4M4+BcZg4JsUKFkSUev5WYgMwUg=;
 b=R8QoqgzN6vn6jV6ZvdwNxiQHjNyieAnwVFtUbhTU7uh02Po4CEoZtYD7TBZ3PRP15K
 eUOOSQzwjT2yQCOOQPQwWwe7LsDrbIHXr045XJPfwtwut3ojnsqtTG1jrCWa5QOab1kg
 IoMk+SUmRUJVVsDKzYj5kyr1rYuyJDg08k21+fdpAEFHwV2Z1JmrW8j/bwRgMRv5R7Ts
 bsvMNGhLtRwsX4wgFRLwqfenc0PH7+HdxCaUdDIRoWpjIoiCa9si7hOzgm/yO+2c2bnr
 +rRwe9mmWJqWigzaXUDYQmyJWeJ5Y/TVurzky6VYF95s9yGqjKgSf00UgxuhamqwQ2dP
 PN4Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=R8QoqgzN
Subject: [Buildroot] [PATCH 1/2] package/lua-compat53: bump to version 0.12
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

dGhlIHByb2plY3QgaGFzIG1vdmVkIHRvIHRoZSBvcmdhbml6YXRpb24g4oCcTHVuYXIgTW9kdWxl
c+KAnSwKc2VlIGh0dHBzOi8vZ2l0aHViLmNvbS9sdW5hcm1vZHVsZXMvCgpkaWZmIExJQ0VOQ0U6
Ci1Db3B5cmlnaHQgKGMpIDIwMTUgS2VwbGVyIFByb2plY3QuCitDb3B5cmlnaHQgKEMpIDE5OTQt
MjAyMCBMdWEub3JnLCBQVUMtUmlvLgorQ29weXJpZ2h0IChDKSAyMDEzLTIwMjMgVGhlIEx1YS1D
b21wYXQtNS4zIGF1dGhvcnMuCgpTaWduZWQtb2ZmLWJ5OiBGcmFuY29pcyBQZXJyYWQgPGZyYW5j
b2lzLnBlcnJhZEBnYWR6Lm9yZz4KLS0tCiBwYWNrYWdlL2x1YS1jb21wYXQ1My9Db25maWcuaW4g
ICAgICAgICB8IDIgKy0KIHBhY2thZ2UvbHVhLWNvbXBhdDUzL2x1YS1jb21wYXQ1My5oYXNoIHwg
NCArKy0tCiBwYWNrYWdlL2x1YS1jb21wYXQ1My9sdWEtY29tcGF0NTMubWsgICB8IDIgKy0KIDMg
ZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvbHVhLWNvbXBhdDUzL0NvbmZpZy5pbiBiL3BhY2thZ2UvbHVhLWNvbXBhdDUz
L0NvbmZpZy5pbgppbmRleCBkZTQ2OGZjZjY2Li42OTVjMTM5MjgwIDEwMDY0NAotLS0gYS9wYWNr
YWdlL2x1YS1jb21wYXQ1My9Db25maWcuaW4KKysrIGIvcGFja2FnZS9sdWEtY29tcGF0NTMvQ29u
ZmlnLmluCkBAIC01LDQgKzUsNCBAQCBjb25maWcgQlIyX1BBQ0tBR0VfTFVBX0NPTVBBVDUzCiAJ
ICBDb21wYXRpYmlsaXR5IG1vZHVsZSBwcm92aWRpbmcgTHVhLTUuMy1zdHlsZSBBUElzIGZvciBM
dWEgNS4yCiAJICBhbmQgNS4xLgogCi0JICBodHRwczovL2dpdGh1Yi5jb20va2VwbGVycHJvamVj
dC9sdWEtY29tcGF0LTUuMworCSAgaHR0cHM6Ly9naXRodWIuY29tL2x1bmFybW9kdWxlcy9sdWEt
Y29tcGF0LTUuMwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9sdWEtY29tcGF0NTMvbHVhLWNvbXBhdDUz
Lmhhc2ggYi9wYWNrYWdlL2x1YS1jb21wYXQ1My9sdWEtY29tcGF0NTMuaGFzaAppbmRleCBjY2Q5
YTcxMjA1Li4xOTMwMDYzZmRjIDEwMDY0NAotLS0gYS9wYWNrYWdlL2x1YS1jb21wYXQ1My9sdWEt
Y29tcGF0NTMuaGFzaAorKysgYi9wYWNrYWdlL2x1YS1jb21wYXQ1My9sdWEtY29tcGF0NTMuaGFz
aApAQCAtMSwzICsxLDMgQEAKICMgY29tcHV0ZWQgYnkgbHVhcm9ja3MvYnVpbGRyb290Ci1zaGEy
NTYgIGU1MTNlNzViYTBlZjQ5MjNhMWVjMGQ0ZjBiZWI1OTcyYTExY2M5YmQ3YWMxYjA5NTNiNWU0
ZjAzN2IyNTljOTIgIGNvbXBhdDUzLTAuOC0xLnNyYy5yb2NrCi1zaGEyNTYgIDFiMjRmNDc1ODEy
Yzk3OTY4NGZiMzQ2OWY2ZmFjY2JkYzdjMzNjOWQzOTQyMTcyOGFhMGQ3OGRlZGE1YTg5YTUgIGx1
YS1jb21wYXQtNS4zLTAuOC9MSUNFTlNFCitzaGEyNTYgIGJmZjhlNTk3Mzg0Nzc2ZGU3YzEzOWJl
ZTdkNmE2ZjJjMDVjM2ViNzMxNWQwODczMzQ3M2ZhOTg2NzIwY2VjNjAgIGNvbXBhdDUzLTAuMTIt
MS5zcmMucm9jaworc2hhMjU2ICA4NzBjZGZmN2U0ZGI0YzJlODRhMzM1YjJiOWUyNDJiOWY5NjM4
MzA1NTAwMjZlMjA1N2E1ODg1ZTk0NTk4MmU1ICBsdWEtY29tcGF0LTUuMy0wLjEyL0xJQ0VOU0UK
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHVhLWNvbXBhdDUzL2x1YS1jb21wYXQ1My5tayBiL3BhY2th
Z2UvbHVhLWNvbXBhdDUzL2x1YS1jb21wYXQ1My5tawppbmRleCAwZThmMWMzNjAwLi4wY2ZiZTJk
Nzk1IDEwMDY0NAotLS0gYS9wYWNrYWdlL2x1YS1jb21wYXQ1My9sdWEtY29tcGF0NTMubWsKKysr
IGIvcGFja2FnZS9sdWEtY29tcGF0NTMvbHVhLWNvbXBhdDUzLm1rCkBAIC00LDcgKzQsNyBAQAog
IwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotTFVBX0NPTVBBVDUzX1ZFUlNJT05fVVBTVFJF
QU0gPSAwLjgKK0xVQV9DT01QQVQ1M19WRVJTSU9OX1VQU1RSRUFNID0gMC4xMgogTFVBX0NPTVBB
VDUzX1ZFUlNJT04gPSAkKExVQV9DT01QQVQ1M19WRVJTSU9OX1VQU1RSRUFNKS0xCiBMVUFfQ09N
UEFUNTNfTkFNRV9VUFNUUkVBTSA9IGNvbXBhdDUzCiBMVUFfQ09NUEFUNTNfU1VCRElSID0gbHVh
LWNvbXBhdC01LjMtJChMVUFfQ09NUEFUNTNfVkVSU0lPTl9VUFNUUkVBTSkKLS0gCjIuMzkuMgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
