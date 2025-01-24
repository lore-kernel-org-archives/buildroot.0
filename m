Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8789C0218B
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 09:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61D7461140;
	Fri, 24 Jan 2025 09:26:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xz-xJEZL6pjU; Fri, 24 Jan 2025 09:26:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 305CD612CC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 305CD612CC;
	Fri, 24 Jan 2025 09:26:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EBCF1167
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 09:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0AF0581E5B
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 09:26:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JEIHEkKcBfsW for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 09:26:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=gael.portay+rtone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 021D481E59
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 021D481E59
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 021D481E59
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 09:26:02 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3862a999594so91984f8f.0
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 01:26:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737710760; x=1738315560;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h5WlxAMV4c1sWF0vTR4IBYASDcSRJdDH+JQCRYsNF84=;
 b=IyVvFKQR2iItD2EZFNAk3UzFWBqt2eeK+pIqK94HS39pTGeDAbbZD7T8CPwhtCUe+1
 ZCgLZ1Ighxwe1JX9v56GYok2bJXxrN1r8DxwMUUnBSTk+zN95mL9zMvd3dCErSAa0CoU
 xB0T1FGnP534i96mNKZD8JaUe3pEr8/sw325BqYJXwu8hL+83z4loiY9FXPS874MEsCB
 p2ycVY4nR6h1BW2RZjk5j6ZjysyuRdczFqGxutEFtFg7KtExMoCwNcQcX/yKaaw9rDG0
 VnK6EC4wRi0MnCEMjR3BQ4qkernm7G1o8jyktMqqXnc/kPmoDqUqbhK+ZmWqPuU5WxI1
 Z6gw==
X-Gm-Message-State: AOJu0YzzE8uUQjeAhha9CpJD0xRzY9zhXyzzqvsobR9PIL/eEK2wyhiM
 ycXnP9WAMG+9AIca8RvXkEpUFsnLG7OSGdVrxk54JxVfDVg2/WkNaaPdwqwY
X-Gm-Gg: ASbGncsf43IwGcAQH4Bm90a14U+VAuDElnSYkjKqeUZveHbLWJZiU7AYnWOcqou1EDx
 lOOX1UuCr3wC9RNlgQIdzBgLpSnMnqm4WvGdVV+JdF3WIZ2iwMFx9BTBYo/UHK8RYZo7desRE3x
 zbIL4WVQ1UZcqpkTkkLGmIpkBVPa0ykpfgjTL4FIa6wnsDoX/1Zbk1nMKJiy4CNCMH+EvWv2xbW
 kMceGbGnFhoM2K/M3zUuDGdOgLUGDsx5ss+yYJRbU2ubR1syzeBGbT9OaiWcgxChg3NI1YvB/S0
 ns7InfvOQdTuC9O1qaa5HKjmQQ==
X-Google-Smtp-Source: AGHT+IEcdzOOT+2IYTYfzYI6xRq1OqoxmaWhE0bDLYu66zAsYa7DyHqoqcwgex6WHK5Bi4RfpPIRsQ==
X-Received: by 2002:a05:6000:1863:b0:385:e9ba:ace3 with SMTP id
 ffacd0b85a97d-38bf56557c7mr11474496f8f.1.1737710758893; 
 Fri, 24 Jan 2025 01:25:58 -0800 (PST)
Received: from archlinux.. ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a17650esm2154044f8f.12.2025.01.24.01.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 01:25:58 -0800 (PST)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
Date: Fri, 24 Jan 2025 10:25:53 +0100
Message-ID: <20250124092554.1547973-1-gael.portay+rtone@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737710760; x=1738315560; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=h5WlxAMV4c1sWF0vTR4IBYASDcSRJdDH+JQCRYsNF84=;
 b=cOJilnNQTGo3yVgpIykZ+FAiRIsQDHlJS1OQJIZsAQqie1rRvillkPx43qvM751dWX
 icA46m3AthtiC/8aLQX7Jpj9fO4x2KHNovCZErLdqYGbixSSMDLJHVqb2TXqtG9378Li
 ngTDCxrRCnP27Wr0PJa3sduE+cpHu46nNGFK1SmNnxGbp1lf9O/rLwv7q45+rQkyv8sE
 IKqPOLZ0ob4GsogVrHAPA2kk1DEoR2KP4QfuSUY4HLJwaFVn81C15RcxNUEEkoOoBHPt
 Db0HlJzb/Sa/6pObRbRuziy1yWI1jZNt70SOGiI4rFbTPLjf0FPjscpL9/kckvWUsE+o
 iaLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cOJilnNQ
Subject: [Buildroot] [PATCH 1/2] package/openssh: list sshd-session server
 programs in help
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

VGhlIHNlcnZlciBwcm9ncmFtIHNzaGQtc2Vzc2lvbiB3YXMgYWRkZWQgaW4gY29tbWl0IDExZDJh
ZDMxMDQKKHBhY2thZ2VzL29wZW5zc2g6IGluc3RhbGwgc3NoZC1zZXNzaW9uKS4KClRoaXMgbGlz
dHMgdGhlIHNzaGQtc2Vzc2lvbiBpbiB0aGUgaGVscCBvZiB0aGUgc2VydmVyIHByb2dyYW1zLgoK
U2lnbmVkLW9mZi1ieTogR2HDq2wgUE9SVEFZIDxnYWVsLnBvcnRheStydG9uZUBnbWFpbC5jb20+
Ci0tLQogcGFja2FnZS9vcGVuc3NoL0NvbmZpZy5pbiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvb3BlbnNz
aC9Db25maWcuaW4gYi9wYWNrYWdlL29wZW5zc2gvQ29uZmlnLmluCmluZGV4IDI1ODQzNDQ3YTcu
LjM4YjdmNjhhNWIgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uvb3BlbnNzaC9Db25maWcuaW4KKysrIGIv
cGFja2FnZS9vcGVuc3NoL0NvbmZpZy5pbgpAQCAtMjQsNyArMjQsNyBAQCBjb25maWcgQlIyX1BB
Q0tBR0VfT1BFTlNTSF9TRVJWRVIKIAlkZWZhdWx0IHkKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTElC
WENSWVBUIGlmIEJSMl9UT09MQ0hBSU5fVVNFU19HTElCQwogCWhlbHAKLQkgIFNlcnZlciBwcm9n
cmFtczogc3NoZCwgc2Z0cC1zZXJ2ZXIKKwkgIFNlcnZlciBwcm9ncmFtczogc3NoZCwgc3NoZC1z
ZXNzaW9uLCBzZnRwLXNlcnZlcgogCiBjb25maWcgQlIyX1BBQ0tBR0VfT1BFTlNTSF9LRVlfVVRJ
TFMKIAlib29sICJrZXkgdXRpbGl0aWVzIgotLSAKMi40OC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
