Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1393BC0218F
	for <buildroot@archiver.kernel.org>; Fri, 31 Jan 2025 13:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C09794143F;
	Fri, 31 Jan 2025 13:22:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IS7cd9yJiTuF; Fri, 31 Jan 2025 13:22:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9458F42532
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9458F42532;
	Fri, 31 Jan 2025 13:22:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id ADD8116E
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 13:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DB7F84039
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 13:22:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ciRPKKvPNm9y for <buildroot@buildroot.org>;
 Fri, 31 Jan 2025 13:22:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BAAB68401B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAAB68401B
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BAAB68401B
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 13:22:18 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-30615661f98so21185961fa.2
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 05:22:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738329736; x=1738934536;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Nxnm7iJHzCvjYZUD0Xg3IABNbQqpmNkyvvQ9eRfxxo=;
 b=wOFp61jdPLNpHs8qAJjnXtGCL9G1zatTo4cRA+a05AFRj1pf8lycBfRoicylLE2ENa
 SyMGSfFzzXuOY9RlJQZQpOwuJAKHv9x1HbDgKgpgfrjqYydv5Sxcl261ieCgyt8OZLDN
 h/yZYA+Iix03VY4uG49xqLZLgpGv9a5fCMsg3eOa9UqNgoRjMSnbSX8fyPVKdGigUUwh
 BYiaIBqV9pe9+a062LyYNt7q5f2b2+DLkqegJY7A4cXbk1tOTLL4jBUVLflkm6QWw3vt
 clMFNdaJ8avnHlERxkUVU3LLd7Oq0caZp5jssVU4tmQHv4Wv2NhPa/Zvb0EBNLcLC5Lt
 bLwA==
X-Gm-Message-State: AOJu0YzENTQn70A8dzBntmR1dZJ8PM/Z8unm/W6s7hRiNhKEaQ/EKssc
 DVNBf8UfSNGwaP08R4M8kDSDLI9c66g4095n561x356CvuWAxUF8b6YsyEVy
X-Gm-Gg: ASbGnctbmHPh+Owvhy1XijKwm2AdgWzdHbV/qQyKRkxZBsp4i5Fz9/QvwdtRuB1Nua7
 W/wOJFkvf2bxtW/R3yefr5qiGhFF7GK+tfn5CJV2+ObsyX6XrH/V5tCpv6DMiZAlaTe14kNggJR
 vu95VzQPexyzq80Mp+UeIeiowvUe7ntLUi9Bicd3CdM/9+faHoznNNmo96zw9AHGark92MV64b5
 nGFbEsDF+8bth+h8J2HfYt8ZWhvYyqqZ4E1ROUjEX5NtZ6cTAcmq/bcWOP98fBS6pnkA32S4/V8
 4/JlED0t5RiSBZ+VE2FDqB0xUYqT9OLA+WbNqQ4=
X-Google-Smtp-Source: AGHT+IFs28thsGsbcnaWl0wgqMhXd/zdgRWmEDGpWTE1rYyG3lTRRfOtW75XWNJ087+k0PDmhThY7Q==
X-Received: by 2002:a2e:bd02:0:b0:307:2b7e:6ba0 with SMTP id
 38308e7fff4ca-307968b8eb2mr38061371fa.6.1738329735581; 
 Fri, 31 Jan 2025 05:22:15 -0800 (PST)
Received: from tollan.lan (b106.broadband9.quicknet.se. [194.132.233.106])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307a33f76e9sm5824021fa.71.2025.01.31.05.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2025 05:22:13 -0800 (PST)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Cc: Vadim Kochan <vadim4j@gmail.com>,
 =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Date: Fri, 31 Jan 2025 14:21:48 +0100
Message-ID: <20250131132148.2607359-1-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738329736; x=1738934536; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1Nxnm7iJHzCvjYZUD0Xg3IABNbQqpmNkyvvQ9eRfxxo=;
 b=Vw3sfvM3VVrWnK4xhPeE8auFRQX4C7iYowSyRGu/3uimPzLwRXQ2GYW3xSVdArb0ZN
 Uh1JpFPbVXo6Pa8lULIF1VYfUj58D4KsvED35XMSA+cQHzn8CBhn+oAzTX1ovl6gbzCk
 7nKLlgQQRYjLKp6n48LHM7wRB7m7QvUPhqKRp1JMBdYizpvm7zN6Up3uRBjKLvC7kmqi
 7cZkrBG4t7zGzWilu3BVmt+/sMlIjZuX43pzzOX8UHbpnQS2gN9ldoz05VSOIwp/eht3
 mDtJDk0HE7L4DIo1oAX6/513vtyg1V+NP5EhsZ3P6GSo4pOWpvN3eaxUfV1CndEU/Agk
 o2qg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Vw3sfvM3
Subject: [Buildroot] [PATCH 1/1] package/frr: Bump version to 9.1.3
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

U2lnbmVkLW9mZi1ieTogTWF0dGlhcyBXYWxzdHLDtm0gPGxhenplckBnbWFpbC5jb20+Ci0tLQog
cGFja2FnZS9mcnIvZnJyLmhhc2ggfCAyICstCiBwYWNrYWdlL2Zyci9mcnIubWsgICB8IDIgKy0K
IDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvZnJyL2Zyci5oYXNoIGIvcGFja2FnZS9mcnIvZnJyLmhhc2gKaW5kZXgg
ZWE4OGZjZWY5Yi4uYWExM2VkNTYyNSAxMDA2NDQKLS0tIGEvcGFja2FnZS9mcnIvZnJyLmhhc2gK
KysrIGIvcGFja2FnZS9mcnIvZnJyLmhhc2gKQEAgLTEsNSArMSw1IEBACiAjIExvY2FsbHkgY2Fs
Y3VsYXRlZAotc2hhMjU2ICBhMjNhYjlhYmE1YzQ1ZDkxOWY5YzZkMTRmZWJmYWQ4YTc5N2I3ZjYz
MjcyYmRlNDAwOWM3MGZmNzdhYWMzYTc3ICBmcnItOS4xLjIudGFyLmd6CitzaGEyNTYgIDUzMjNl
NWVjMjM2MzQ2ODYwMzAxZTU3ZjY4NDU0NDM4NTVlOGYyNTA4ZDdjY2Q4N2VhZDM5NWE5OTkxYzAx
YzIgIGZyci05LjEuMy50YXIuZ3oKIHNoYTI1NiAgN2JmMDUzOTU3ZDZjMzhlMzlhMDZhMTEyYzYw
ZmYzNWIyMjhkM2JkMDNlZGJlOGM5YTAzNTA4YjA1MTEyOGQxNiAgQ09QWUlORwogc2hhMjU2ICBm
OWUwYzIxZmFmNzM4ZGE1ODYyODFjMGJlYWFkM2NkNTYyMDRjMTkwODVhMTBmZTA1ZTRkM2Q3Zjhi
NTg2M2QyICBkb2MvbGljZW5zZXMvQlNELTItQ2xhdXNlCiBzaGEyNTYgIGFjYTI5N2I4ZmQzYTQz
ZTNiYjIwMGYxZTJlMDQzYzBkYjZjODk3MzI1ZjVmZjdmMjNmNzUzMDMwMmE2YmY3MTMgIGRvYy9s
aWNlbnNlcy9CU0QtMy1DbGF1c2UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZnJyL2Zyci5tayBiL3Bh
Y2thZ2UvZnJyL2Zyci5tawppbmRleCA5MjFlZjk5NjY1Li41MzkxYmNiMjY1IDEwMDY0NAotLS0g
YS9wYWNrYWdlL2Zyci9mcnIubWsKKysrIGIvcGFja2FnZS9mcnIvZnJyLm1rCkBAIC00LDcgKzQs
NyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotRlJSX1ZFUlNJT04gPSA5LjEuMgor
RlJSX1ZFUlNJT04gPSA5LjEuMwogRlJSX1NJVEUgPSAkKGNhbGwgZ2l0aHViLEZSUm91dGluZyxm
cnIsZnJyLSQoRlJSX1ZFUlNJT04pKQogRlJSX0xJQ0VOU0UgPSBHUEwtMi4wKwogRlJSX0xJQ0VO
U0VfRklMRVMgPSBcCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
