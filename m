Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596E4C369CB
	for <buildroot@archiver.kernel.org>; Sat, 26 Apr 2025 21:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BABC4607B0;
	Sat, 26 Apr 2025 21:04:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8aeb2YGR5ghD; Sat, 26 Apr 2025 21:04:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE94560794
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE94560794;
	Sat, 26 Apr 2025 21:04:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E8001C4
 for <buildroot@buildroot.org>; Sat, 26 Apr 2025 21:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6085041711
 for <buildroot@buildroot.org>; Sat, 26 Apr 2025 21:04:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GjuzJWxgaMaf for <buildroot@buildroot.org>;
 Sat, 26 Apr 2025 21:04:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4F9C641707
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F9C641707
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F9C641707
 for <buildroot@buildroot.org>; Sat, 26 Apr 2025 21:04:28 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-391342fc0b5so2656538f8f.3
 for <buildroot@buildroot.org>; Sat, 26 Apr 2025 14:04:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745701466; x=1746306266;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mNnF2ILbkC3kVaEoGC/AuSfu138kfMeN2iev9ZgWnYM=;
 b=g+EGbgwHy1h/thYTHoKGQm8NASWzjrjRN0IceDyZ3rGVnIhMKdj4YrqaroQTdpA3UR
 R1YAvfMqK8uy4CQWpEoIQSFAXFL1zebVZiOYvlKJvcjS/OGc3e3Q4JBAOsalXOi0wC2C
 YhLLzJgcrENJCEB8iMHC9te2YebbVqlp1B517Wi2NKth0gV0Vjs4DMVTs2bQIIaU2DkD
 j0OU4E688b7XfL80wwzN1QBvhW85eO4ZZCkBeBpOapaV8Y7rvQMI4D/Cp0AkdrjUV+M/
 V8MgmAOgAGpvLxWjD2siVzyqkVFL5Ugh7q94sD1QmK1oYAZ7PTGc06zJ21noXy/9Vu4y
 In2w==
X-Gm-Message-State: AOJu0YydJbTvittxPRaCmV0WI32Ni3V/9YUL+0Mb6BgG7qddMLWnWYJ5
 SPoNboahbrg5lzUcD8HsKU4Sl9NHRsbjcjnclP5cSOB3u+KtC6hj6A7Wq9PLeIOkEGdI67Pg24D
 V
X-Gm-Gg: ASbGncvhnQCGzkrmUnlr+h1I3U8jVtJmh97Vw780kJURVgttaDg+cRr4uA5jAn0H39v
 4a3adKHBRdKET709XQN8HyiECrV9NTNGq8AcGIO4+wU8KAfc4L+o+gDkBKWBjkFLM7uvAgg+600
 OT9fo3l1gV7cSYvOVBO21ytOrpx6IS5oGY0GEWZvpoLUFeUV9Ji2cS3oBBusFYidbttZxsFJgEx
 XoO9rI85nkDmGLRRFQEqjCXcXz42a/OOXAythqccGp502uQTRLNsIKnN+v+dacCNnHeIPXRwDl+
 eO5UKmSdPYJHmxRxCZzLU4nvcbddQdaUzs43RmZmlOVQki/kOO5phjKgSluf
X-Google-Smtp-Source: AGHT+IE72aEzI8gDYp2A9uI4nQPzumbxrN63C+lW7A0MOSb9WXtfhOVOgazCpwMsGtWh6/JDPRBRMg==
X-Received: by 2002:a05:6000:250f:b0:39b:fa24:950a with SMTP id
 ffacd0b85a97d-3a07ab8172bmr3090689f8f.36.1745701466452; 
 Sat, 26 Apr 2025 14:04:26 -0700 (PDT)
Received: from debian-hp-1.fritz.box ([213.211.140.212])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073c8c7fesm6610889f8f.6.2025.04.26.14.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Apr 2025 14:04:26 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Sat, 26 Apr 2025 23:04:09 +0200
Message-ID: <20250426210411.1120310-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1745701466; x=1746306266; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mNnF2ILbkC3kVaEoGC/AuSfu138kfMeN2iev9ZgWnYM=;
 b=KHvfpDh+kJEIgl956ajI5jGN/hHITVjjwU4nJQaWwUytMEZEXSxlyzxPsSofkESF/m
 nj9gyiLf9pMWPWqJZfGRWLCX5RAoHKqmd0J2tABaynOMCKXFXiFfcyEcOn7sjvDCfUZ2
 AwrZSWLvuq3tLPHW930WvVEL5qSwHT+4taULI69uWNWrHeQbBDNWASt+VYwyPtIbGOfl
 rEkBehDA18XIfsEiGR72bRCd34GmplQjUKDTg1r3DvwqGrINV57CgQA8fZYDB4ey2b9U
 2Se13U9obmdCTRRPLstlAcvgMWZgDRMqQNfL/y0g0W2IetOwdVt2aHoTVogCNU6m+fwK
 xumw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=KHvfpDh+
Subject: [Buildroot] [PATCH 1/1] support/scripts/cve.py: remove unused
 each_product()
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGxhc3QgdXNhZ2Ugb2YgZWFjaF9wcm9kdWN0KCkgd2FzIHJlbW92ZWQgaW4gY29tbWl0CjUy
YWUwOTIwNDY2OTZmMDk5Mzk3ZDNiMGE4MjA2MjYyZTgyMDNmNDAgKCJzdXBwb3J0L3NjcmlwdHMv
Y3ZlLnB5OiB1c2UKdGhlIEpTT04gZGF0YSBpbiAxLjEgc2NoZW1hIikuCgpTaW5jZSBpdCdzIG5v
dyB1bnVzZWQsIHJlbW92ZSBpdC4KClNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxy
YXBoYWVsLm1lbG90dGVAbWluZC5iZT4KLS0tCiBzdXBwb3J0L3NjcmlwdHMvY3ZlLnB5IHwgNiAt
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3N1cHBv
cnQvc2NyaXB0cy9jdmUucHkgYi9zdXBwb3J0L3NjcmlwdHMvY3ZlLnB5CmluZGV4IDVhZjZlMGM0
M2YuLjE4ZmRhOGUxYTEgMTAwNzU1Ci0tLSBhL3N1cHBvcnQvc2NyaXB0cy9jdmUucHkKKysrIGIv
c3VwcG9ydC9zY3JpcHRzL2N2ZS5weQpAQCAtMTExLDEyICsxMTEsNiBAQCBjbGFzcyBDVkU6CiAg
ICAgICAgICAgICAgICAgICAgIHdpdGggb3Blbihvcy5wYXRoLmpvaW4oZGlycGF0aCwgZmlsZW5h
bWUpLCAicmIiKSBhcyBmOgogICAgICAgICAgICAgICAgICAgICAgICAgeWllbGQgY2xzKGpzb24u
bG9hZChmKSkKIAotICAgIGRlZiBlYWNoX3Byb2R1Y3Qoc2VsZik6Ci0gICAgICAgICIiIkl0ZXJh
dGUgb3ZlciBlYWNoIHByb2R1Y3Qgc2VjdGlvbiBvZiB0aGlzIGN2ZSIiIgotICAgICAgICBmb3Ig
dmVuZG9yIGluIHNlbGYubnZkX2N2ZVsnY3ZlJ11bJ2FmZmVjdHMnXVsndmVuZG9yJ11bJ3ZlbmRv
cl9kYXRhJ106Ci0gICAgICAgICAgICBmb3IgcHJvZHVjdCBpbiB2ZW5kb3JbJ3Byb2R1Y3QnXVsn
cHJvZHVjdF9kYXRhJ106Ci0gICAgICAgICAgICAgICAgeWllbGQgcHJvZHVjdAotCiAgICAgZGVm
IHBhcnNlX25vZGUoc2VsZiwgbm9kZSk6CiAgICAgICAgICIiIgogICAgICAgICBQYXJzZSB0aGUg
bm9kZSBpbnNpZGUgdGhlIGNvbmZpZ3VyYXRpb25zIHNlY3Rpb24gdG8gZXh0cmFjdCB0aGUKLS0g
CjIuNDkuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
