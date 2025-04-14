Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546BEC369B2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 19:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B3CA402B1;
	Mon, 14 Apr 2025 19:45:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rVl5Uunv23vP; Mon, 14 Apr 2025 19:45:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3440440536
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3440440536;
	Mon, 14 Apr 2025 19:45:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DC195205
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 19:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD995408B0
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 19:45:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id frx-oMNCkR9X for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 19:45:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CDC41404EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDC41404EC
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CDC41404EC
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 19:45:07 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so48733145e9.3
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 12:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744659905; x=1745264705;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mWrdioycxV7mtVJSUHkr55OmhL7QGXSFrZ0TqId/hAQ=;
 b=Lg+clTFG+FpJGMFTPHRO79drSFlFQMbh1WbhCaH0+hlVE7y/HtparhgB/f0k6ZBGFr
 gUq0OPJuN8zKyUdu6sINL/+6w7UTWPLTixxt+sA4DpOASdx3o7AguteqkocD3w6gVp98
 FCbYFeM1BM7J2b35PCbmCRbfNDv9qXgeRFmwGjCLZwc9d0SVAXzNZObgF1QevkGP6liF
 QEb41mdUgqeTgZa4l2ranj7KYwh4ccNMJ3AJm7TaWTZ6AvvRXdSk96kI+8swZZo1pC3Q
 d5Vk/Kg7scmQBynrN7sdPG5jx5O08plAEDchJVBkHjLLm4A+AAi73Lhilv1/mBE1bi3t
 fuyQ==
X-Gm-Message-State: AOJu0YyQj+iHR44aOOFMwtHvCPuhPNzq4KNH4Zc2BTVaNwBDi2KTGqQw
 axNproq149qDN4ZvWclO1NVB3GgI+Y6tgbwnjp1JUc+AMnlQPk7d3dzfRpkCbf0UWabLCK6zpuJ
 CJK8ZYA==
X-Gm-Gg: ASbGncvMbjmRDVMAJh1SchJRwDs8ZSHQQFxOeG3Rvc9xJqSyuoxD3N8mwMtkcDvRlO3
 eM/DygTk65vOcEm4/Ki0k5GCy9BhTz96Vn2SIO7bFsUKcRaEzbF+sN/sQqUcbiycIoijccieeR0
 /3fHBmw+ULMUQsIokmSGq7Gb6+NcoNAghSAnfxD+qCiAoU6/agPOzj30d8pk769CBuf7mDIIpqb
 dl/MN2pay0wUB/aSmTvzOsk/NIshxld0FzngQY0++AtWqLGwSADqJD1MybsMPDhnF4qqQ/mAMV3
 y64WcfBLeY5JTfW37zDpKpfSKDHWOr3RLVb4WsQebVncgiwKGCn723qD953K
X-Google-Smtp-Source: AGHT+IEI5DdytL4Uc+e2pnhS4VafBUZmLc4H2cxRQKEQny+p2H5ftC8OE59hz18XSr1CV2YJ7TW7Pg==
X-Received: by 2002:a05:600c:6a87:b0:43d:98e7:38dc with SMTP id
 5b1f17b1804b1-43f3b055a75mr79181325e9.5.1744659905653; 
 Mon, 14 Apr 2025 12:45:05 -0700 (PDT)
Received: from debian-hp-1.fritz.box ([213.211.140.212])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233c8224sm183515805e9.22.2025.04.14.12.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 12:45:05 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 14 Apr 2025 21:44:59 +0200
Message-ID: <20250414194501.1637487-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1744659905; x=1745264705; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mWrdioycxV7mtVJSUHkr55OmhL7QGXSFrZ0TqId/hAQ=;
 b=ap/8lBqTI1GvczuAMptJIDX+RoQHGYrB/cRRhop12ECZoDlb/0r+fVDWPVlM/8uKvY
 FclnURgVEXCg3ObkgMQDeKrc/ij4ENe3vaaqjjbna8LoSeFApdrcwSifm0eqgAZC6nHy
 Fbzu74dZc0pH2jzwg3bowJuqudOS+3YQ/rqLYdtuJKAK/BU/8ifI5Hn6nTaEyInAZOfU
 Jr/JNqv+0zsR+gNc0VgcgRIZuSuG4eec2lrD2cGxQ/XU+XVRIFOmguAQod1mGiwRzaSq
 o04vHyRoMMqkGeR1IqrtDHnHH1t95Msp36uDHMHSiaWs6uOdo+b7JRMT6aTJomBuTg9h
 i8DQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ap/8lBqT
Subject: [Buildroot] [PATCH 1/1] package/python-botocore: bump to version
 1.37.33
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJl
PgotLS0KIHBhY2thZ2UvcHl0aG9uLWJvdG9jb3JlL3B5dGhvbi1ib3RvY29yZS5oYXNoIHwgNCAr
Ky0tCiBwYWNrYWdlL3B5dGhvbi1ib3RvY29yZS9weXRob24tYm90b2NvcmUubWsgICB8IDQgKyst
LQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9weXRob24tYm90b2NvcmUvcHl0aG9uLWJvdG9jb3JlLmhhc2ggYi9w
YWNrYWdlL3B5dGhvbi1ib3RvY29yZS9weXRob24tYm90b2NvcmUuaGFzaAppbmRleCAxYjY5ZjI1
NGFhLi42ZWQxY2M0MmM0IDEwMDY0NAotLS0gYS9wYWNrYWdlL3B5dGhvbi1ib3RvY29yZS9weXRo
b24tYm90b2NvcmUuaGFzaAorKysgYi9wYWNrYWdlL3B5dGhvbi1ib3RvY29yZS9weXRob24tYm90
b2NvcmUuaGFzaApAQCAtMSw2ICsxLDYgQEAKICMgbWQ1LCBzaGEyNTYgZnJvbSBodHRwczovL3B5
cGkub3JnL3B5cGkvYm90b2NvcmUvanNvbgotbWQ1ICA5ZDEyNjc5ZWM5MGY3ZTcxODUwMDZkZDA1
MzU1OTVhNiAgYm90b2NvcmUtMS4zNi4zLnRhci5negotc2hhMjU2ICA3NzViODM1ZTk3OWRhNWM5
NjU0OGVkMWEwYjc5ODEwMWExNDVhZWMzY2Q0NjU0MWQ2MmUyN2RkYTVhOTRkN2Y4ICBib3RvY29y
ZS0xLjM2LjMudGFyLmd6CittZDUgIDM4MTljODU3NWQ3OTJjNzliYzEyMzIxNzRlMjQ5ZmFlICBi
b3RvY29yZS0xLjM3LjMzLnRhci5negorc2hhMjU2ICAwOWIyMTNiMGQwNTAwMDQwZjg1YzdkYWVl
OTEyZWE3NjdjNzI0ZTQzZWQ2MTkwOWU2MjRjODAzZmY2OTI1MjIyICBib3RvY29yZS0xLjM3LjMz
LnRhci5negogIyBMb2NhbGx5IGNvbXB1dGVkIHNoYTI1NiBjaGVja3N1bXMKIHNoYTI1NiAgMGQ1
NDJlMGM4ODA0ZTM5YWE3ZjM3ZWIwMGRhNWE3NjIxNDlkYzY4MmQ3ODI5NDUxMjg3ZTExYjkzOGU5
NDU5NCAgTElDRU5TRS50eHQKIHNoYTI1NiAgY2ZjNzc0OWI5NmY2M2JkMzFjM2M0MmI1YzQ3MWJm
NzU2ODE0MDUzZTg0N2MxMGYzZWIwMDM0MTdiYzUyM2QzMCAgdGVzdHMvdW5pdC9hdXRoL2F3czRf
dGVzdHN1aXRlL0xJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWJvdG9jb3JlL3B5
dGhvbi1ib3RvY29yZS5tayBiL3BhY2thZ2UvcHl0aG9uLWJvdG9jb3JlL3B5dGhvbi1ib3RvY29y
ZS5tawppbmRleCBlMDAwNzAwYzFlLi5kMjVlMzRlYjY5IDEwMDY0NAotLS0gYS9wYWNrYWdlL3B5
dGhvbi1ib3RvY29yZS9weXRob24tYm90b2NvcmUubWsKKysrIGIvcGFja2FnZS9weXRob24tYm90
b2NvcmUvcHl0aG9uLWJvdG9jb3JlLm1rCkBAIC00LDkgKzQsOSBAQAogIwogIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMKIAotUFlUSE9OX0JPVE9DT1JFX1ZFUlNJT04gPSAxLjM2LjMKK1BZVEhPTl9C
T1RPQ09SRV9WRVJTSU9OID0gMS4zNy4zMwogUFlUSE9OX0JPVE9DT1JFX1NPVVJDRSA9IGJvdG9j
b3JlLSQoUFlUSE9OX0JPVE9DT1JFX1ZFUlNJT04pLnRhci5negotUFlUSE9OX0JPVE9DT1JFX1NJ
VEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvM2EvNjEvNjllYjA2
YTgwM2M4M2UwZGE3MzNiNjBiMmJjNjU4ODBjMThlZjJkZWUxOWVlMTBjZjg3MzI3OTRhM2MxCitQ
WVRIT05fQk9UT0NPUkVfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNr
YWdlcy9mNC8xZC8wYzUzOWFlMjYxZDJmOGZlOGI0N2MzNThiMzY5ZWM1ODY0NWJmMGVhOTZiNzg4
MjUzNjVlNDg2NzViNjcKIFBZVEhPTl9CT1RPQ09SRV9TRVRVUF9UWVBFID0gc2V0dXB0b29scwog
UFlUSE9OX0JPVE9DT1JFX0xJQ0VOU0UgPSBBcGFjaGUtMi4wCiBQWVRIT05fQk9UT0NPUkVfTElD
RU5TRV9GSUxFUyA9IExJQ0VOU0UudHh0IHRlc3RzL3VuaXQvYXV0aC9hd3M0X3Rlc3RzdWl0ZS9M
SUNFTlNFCi0tIAoyLjQ5LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
