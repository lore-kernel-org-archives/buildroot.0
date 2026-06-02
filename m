Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBEEC5DF71
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 07:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C04784067A;
	Tue,  2 Jun 2026 07:26:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7vKKSdxMR49U; Tue,  2 Jun 2026 07:26:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F358404F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780385171;
	bh=1cySQo+mDApTeCEtXoqBUffdpv5eAWUkYnVaJsgSboQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZAUJnqm/bl0iLPWYojcp0+RXYCff7yijzcJZbYGlZEkVPvCBtVMPEtUvPK+HxHkP9
	 gASdoVIVFlQ+NijT5UtZKd7C14gdB2k8gStTXzphyACgQZ/peo8izcZpKNBnaPSz0D
	 RSp8/+Kwr0+xK1PPU2YOXrLdBEgYNTevglaeJApqVK1EUwc+8TOSrwfTBz3zzbjrCI
	 QoWTIONLVK5qZLeggNSOjTSjzUTHnlUSnItAMX3k7Y8e1Wnusan2NhjEdaw+lXyxGT
	 YXim7/EptpvNzsVErP4H4lhojjH+dblPWIg8lP739sgiNy8ZKT8oqGM4Ge5KdzBrth
	 +119jjy89SJCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F358404F6;
	Tue,  2 Jun 2026 07:26:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 29B72223
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 07:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F7D240478
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 07:26:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eD_BXAPThfzf for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 07:26:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 35F2140411
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35F2140411
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35F2140411
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 07:26:07 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-45ef4223be7so2171286f8f.2
 for <buildroot@buildroot.org>; Tue, 02 Jun 2026 00:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780385165; x=1780989965;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j0/4ExCWEst17dHkjyOggTDlyve1YlsEY3mB1Sh0lcs=;
 b=T3ouX2lv5mqqQWchc70lNnkbxUCowqgBJQmFLcjsJU/Q4B9Y0QT7aOzse1gthc4c2m
 Ri71RqNrWag+mZ+f/5UnrDaRwsjg2ne/QHPqgZU7J/EtGcLUOMFLN2YTK+AhmKUpLEE0
 05FOJBfRw5SHaSJ7Tvwllg7ij0DBV24elkHHLWv7zNLNTEYwA6QUDgs3WEy9eAUNqr9/
 NMAktLI5cZg2oWgulS+eelOMVSPbZJaStrii/SvVBU4m4vKp5TAOj30wfkrkp6ZiEQcX
 EpnvvvsEMSUrLo1OjsBjSS3mdmQMXrrBxzCxhbOQa+lh80pnfbQOQVL0q3f1fydEHHNC
 IUIw==
X-Gm-Message-State: AOJu0Yy/6LWGX6ksRssiKiQKd4B9BPyhpJGK10ahvLENc88I47TKvmf9
 LUinlfQa48cPHLxX0EwfyIk5zHRpmUelgkQUnbmfsCI4fn5o9zoizHqKBzACtfcuZpstNC9taK3
 B99AC
X-Gm-Gg: Acq92OGTNBxOQXDYBDGW4iFDNWQvP5mvIwKpNbRKZrMG7HwNfoSLyxzQ3pE6wDHlvwV
 gmZtrMIGRqVJjlpNhTXFKPVjmrurDKt/Ij9ZduuIt2epKobNLLfs4hK72Dsg3s8mD/FbCjLix2I
 yvCRG2weKGsgji2zWQnm9naIZvCoBeaBBBokXKM98QL+8Sh5O46dXBX1sCGadXsUmfewxMcFm1l
 rL01HWMzT1zcl5xwo+fdQzIvFGoBWTtJx0/qyx43Rziwduk/1cpopw8Veu0I9ErxF3tcHdGM5e5
 wFhSkbPbazQPoaikZDIYw2FEmt4Sv9vPZ0+c3o8w84j030Bl7VnY8pDfGqWGHZOa6huSzqwprEE
 u06DVzoV9qo+BMqyos+sGqBrxm2NKkAT0fvRUDsz6BF9h2jC2Wb6jA5bzFIWAX25dv10r9qHBCh
 9wHR8pNxK4LmFG/M5yP1PRrYwcIJNz8GJVXSZNCYFydPE5NkGVJ9AHQUA8XwfXCIxJLXhA
X-Received: by 2002:a05:6000:22c7:b0:43d:6244:f8b with SMTP id
 ffacd0b85a97d-45ef6b0f319mr27979499f8f.13.1780385165381; 
 Tue, 02 Jun 2026 00:26:05 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34c50f6sm35314189f8f.16.2026.06.02.00.26.05
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 00:26:05 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue,  2 Jun 2026 09:26:03 +0200
Message-ID: <20260602072604.42796-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780385165; x=1780989965; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=j0/4ExCWEst17dHkjyOggTDlyve1YlsEY3mB1Sh0lcs=;
 b=H8qkD/1ZvvDBAd6jLyh5AA5IpH7bn+SiO0ZYF27rm9bbfHHEQ3a7EazaAdhjx1HEAh
 wW6eODHmCJ/qJ89EPIXG6xPVnoWKlSBF7kwNnM2gXCX8WIqdsZK1Q34FlZMNH8Uz6XCW
 USaUl1eXIdJSFShbyZ1P7UshjBf2zFkP0v+Jel8dlHPO0slaJcubpoOp5h6aIJLqu1Xg
 O4pybM+Tqesblybl7CT27rS5hFS7+jOgJl1Vy2ZWQrjhfHwM7lW1C1SvWYMsvqxvCCAm
 nc1w4kZ+GIVBQ2z0zh33Y7uRe/lXxZJziIvDVnf4YQOwvJ2+iki7+ktnO/ZTs60lRvy/
 A0/w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=H8qkD/1Z
Subject: [Buildroot] [PATCH v2 1/2] package/busybox: re-introduce
 IGNORE_CVES for CVE-2023-42366
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch `0008-awk.c-fix-CVE-2023-42366-bug-15874.patch` was introduced
in [1]. The IGNORE_CVES entry was removed while the patch is still
present in [2].

Re-introduce this IGNORE_CVES entry.

[1] 75c594d446 package/busybox: fix pending CVEs
[2] f88537c46b package/busybox: drop stale IGNORE_CVES entries

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
v1 --> v2: Busybox bump to 1.38 happened since the v1. This series
 adapt to v1.38 and the patches already present upstream.
---
 package/busybox/busybox.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 5b461c3a34..f7b1fec487 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -15,6 +15,10 @@ BUSYBOX_CPE_ID_VENDOR = busybox
 # 0004-nslookup-sanitize-all-printed-strings-with-printable.patch
 BUSYBOX_IGNORE_CVES += CVE-2022-28391
 
+# This is not stale, NVD entry mentions up to version 1.36.1.
+# 0008-awk.c-fix-CVE-2023-42366-bug-15874.patch
+BUSYBOX_IGNORE_CVES += CVE-2023-42366
+
 # 0010-testsuite-tar-tests-fix-test-after-cve-2025-46394.patch
 BUSYBOX_IGNORE_CVES += CVE-2025-46394
 
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
