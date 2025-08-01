Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8DBC87FCA
	for <buildroot@archiver.kernel.org>; Fri,  1 Aug 2025 15:07:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD7988421B;
	Fri,  1 Aug 2025 15:07:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lmzQLYAVeKdm; Fri,  1 Aug 2025 15:07:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CDDF842EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CDDF842EF;
	Fri,  1 Aug 2025 15:07:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6499113D
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 15:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 450C284294
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 15:07:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tR6_46mDDjq0 for <buildroot@buildroot.org>;
 Fri,  1 Aug 2025 15:07:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5A8CB8421C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A8CB8421C
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A8CB8421C
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 15:07:38 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3b78127c5d1so1216157f8f.3
 for <buildroot@buildroot.org>; Fri, 01 Aug 2025 08:07:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754060856; x=1754665656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OKnhUfGVepxjcghR95KOAaCrkGZWC/IUrh3ianWzqNs=;
 b=M+8KDUoYmzGe1sr51KXSH1N1dN4K2UE5bOuyvFQSoQ1peHK8OJRVMz6T8BHBrG392K
 7DOhVAgUsUB9+8zksM/t/PNJGE4Is8DurOF7+iwi42i91j9lV3Zu2n/ZBiLUuhN8WdsL
 NS/fjG4hw4suOt22S3fwF/Yk5QCfncMTBksGBtjN2kNTmzH9V1etnDYIca9d21Lg0JPe
 avewNYHY1f043VtQ1IZcVRFiPEAy6wUvO9Dic1qocyuCMEMqX+UbJguBRNRmLztR4e4/
 ozt3OSHCyNv3IBB5ZgB4kcGM+lYEwM2aLgDZyMmgPYuMpn2PR/EiF0dzNXS9mnE6ikp7
 SEPw==
X-Gm-Message-State: AOJu0YwsUweh1wZrtiQe6WFSPFrsUphwlI4sncV2d+I3cSupJ0VycqQr
 ucI+sITbpfeTvaLPSsLMNHgfjzC6w4rjHvl6u9wtYuaMoWlvtGklylq4rO7RbiGInEcQ/ono0Dx
 +o58J
X-Gm-Gg: ASbGncuQRSB2p81nBr+++y1UDcI9At7i6+ZykSTVNKkEKAfdROffTND3kM7xUqZh8gB
 EmARGkqfdcy/YhkZyMY0kU7Iai/bobrF8MY4ytP0ha7SR/PYm9iGcEQ55ffRkI4R4l2KK16QDal
 02D/njPrSPsUJZq5Ct7eqao+EwVqVL6FZzcacPo1p39mQe0eKs/ajHThVR8NF+fPXsrYwXygpxx
 Ql4TMzp0VBQzamFbJIhowT2ie6fEOWv3nHK1a1JnSb0bLA6Hnd+rTMMF2wUA2w74F6RekaRJ3J7
 IVXMBi1oUMwaGR+IEbZOMieFKllagR9GF+GiUhZawcfi/3Mo9L5LOU367Jd8agWZinusXnmuAjY
 ykqIJDkEllMJ0v8Mj1v0dol+qfIKkEfmroSZ5FcIGyVeo5kvVMzkPol3XeuCuFE2U5Znt1XCd1i
 aLa4hULPgc
X-Google-Smtp-Source: AGHT+IHzRfiKgtFPjNGn7uzEzXRHKcymN11YydDH9kZc9otWcrcJVweDNV2H74whadyoeFG02YGWDQ==
X-Received: by 2002:a05:6000:2913:b0:3b8:d7c7:71bb with SMTP id
 ffacd0b85a97d-3b8d9470e0cmr119873f8f.21.1754060856322; 
 Fri, 01 Aug 2025 08:07:36 -0700 (PDT)
Received: from mind2.local.ess-mail.com (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4589ee5790dsm66731015e9.27.2025.08.01.08.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 08:07:36 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri,  1 Aug 2025 15:07:18 +0000
Message-Id: <20250801150722.4003476-6-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250801150722.4003476-1-raphael.melotte@mind.be>
References: <20250801150722.4003476-1-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754060856; x=1754665656; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OKnhUfGVepxjcghR95KOAaCrkGZWC/IUrh3ianWzqNs=;
 b=ic4bbcnCFzk9UQJ4tdwb8LSwvjZEI4S6lthJgU+lSDivLDM++Iz6mXgLrm6hWK/KT1
 pXTg/3adiiViDS1OH2oaQWPyvg2S+SGXVhc9b1/4h+5B4ZtJAUAs+E9JAKYi7rw+ltd4
 ANUgKhofDV+Hnm7NLct6MkJa7aY39juy2jmF3qTB+0hegvosxz3F5ySbhX9irMLTjqe4
 9NSver27pCY23yfhyZoXrSSZQP+R9zf5AMoJ/D6avyNe6hMVnqqPYCYj5O3bXgVaJANe
 Qdb9LEKByC23bR4B/KY+ycJUDPZh1NtK8IKyeO+v0mmSFMwE8M4DndLtyY5I5bU7DacZ
 hUSA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ic4bbcnC
Subject: [Buildroot] [PATCH 5/6] package/swig: bump to version 4.3.1
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UmVsZWFzZSBub3RlczoKaHR0cHM6Ly9zb3VyY2Vmb3JnZS5uZXQvcC9zd2lnL25ld3MvMjAyNS8w
NC9zd2lnLTQzMS1yZWxlYXNlZC8KClNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxy
YXBoYWVsLm1lbG90dGVAbWluZC5iZT4KLS0tCiBwYWNrYWdlL3N3aWcvc3dpZy5oYXNoIHwgMiAr
LQogcGFja2FnZS9zd2lnL3N3aWcubWsgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3dpZy9zd2ln
Lmhhc2ggYi9wYWNrYWdlL3N3aWcvc3dpZy5oYXNoCmluZGV4IDIxNTkwYzQyMmEuLjFhODdlY2Zi
YmIgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uvc3dpZy9zd2lnLmhhc2gKKysrIGIvcGFja2FnZS9zd2ln
L3N3aWcuaGFzaApAQCAtMSw1ICsxLDUgQEAKICMgTG9jYWxseSBjb21wdXRlZDoKLXNoYTI1NiAg
MmFmMDhhY2VkOGZjZDY1Y2RiNWNjNjI0MjY3Njg5MTRiZWRjNzM1YjFjMjUwMzI1MjAzNzE2Zjc4
ZTM5YWM5YiAgc3dpZy00LjEuMS50YXIuZ3oKK3NoYTI1NiAgNDRmYzgyOWY3MGYxZTE3ZDYzNWEy
YjRkNjlhY2FiMzg4OTY2OTllY2MyNGFhMDIzZTUxNmUwZWFiYmVjNjFiOCAgc3dpZy00LjMuMS50
YXIuZ3oKIHNoYTI1NiAgZjUzYWJhZWVkNzc1MDE4ZDUxOWExYjk2MTVmMGNhMTc4OTQ3NzJiZDlj
YTIxYzJhMTU2YmYzNDBhYzQxYzEzZSAgTElDRU5TRQogc2hhMjU2ICA4Y2ViNGI5ZWU1YWRlZGRl
NDdiMzFlOTc1YzFkOTBjNzNhZDI3YjZiMTY1YTFkY2Q4MGM3YzU0NWViNjViOTAzICBMSUNFTlNF
LUdQTAogc2hhMjU2ICA3ZjUwZDk0MjM3M2E4NzEyMTFjNWVmZWUwM2YzZGIyZjllZmQxY2ZmMTAw
MmIwZWY4ZTM3NDhiYWE2MTFhNWMyICBMSUNFTlNFLVVOSVZFUlNJVElFUwpkaWZmIC0tZ2l0IGEv
cGFja2FnZS9zd2lnL3N3aWcubWsgYi9wYWNrYWdlL3N3aWcvc3dpZy5tawppbmRleCBhZDU4NWMz
Zjk3Li5lYzU2OGU0ZTJiIDEwMDY0NAotLS0gYS9wYWNrYWdlL3N3aWcvc3dpZy5taworKysgYi9w
YWNrYWdlL3N3aWcvc3dpZy5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjCiAKLVNXSUdfVkVSU0lPTl9NQUpPUiA9IDQuMQorU1dJR19WRVJTSU9OX01BSk9SID0g
NC4zCiBTV0lHX1ZFUlNJT04gPSAkKFNXSUdfVkVSU0lPTl9NQUpPUikuMQogU1dJR19TSVRFID0g
aHR0cDovL2Rvd25sb2Fkcy5zb3VyY2Vmb3JnZS5uZXQvcHJvamVjdC9zd2lnL3N3aWcvc3dpZy0k
KFNXSUdfVkVSU0lPTikKIEhPU1RfU1dJR19ERVBFTkRFTkNJRVMgPSBob3N0LWJpc29uIGhvc3Qt
cGNyZTIKLS0gCjIuMzQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
