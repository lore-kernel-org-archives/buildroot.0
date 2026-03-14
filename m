Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA6510854B2
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 23:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11A0682404;
	Sat, 14 Mar 2026 23:21:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QVfE0aEr8b53; Sat, 14 Mar 2026 23:21:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10A3E823E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773530477;
	bh=4j/D8XQ/f1xMiG92TfXlH1zK5if68PgiPPWdyODxXhc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aVfKzlA54941vAY3Htcp83pnAs9ivzbu/F9bNJMFUtZ7gjchJUShgvPW58yZQmgFc
	 aT3kz0RgwEv6EIR7qVgfkuLrrIAV6zb7qhRmcwKOv0WyHcS2s1uZ/m2yzBshxTYzsy
	 ZYinB4gCYfaJ08zIzrklgA4nST0vCmmg+nTCEy4piLo/UZ9JKopD5A98jJSWMefdcG
	 jWpuclm5t/kwzUFWEUUuKA9VSLqBHZuJICQ2u36AnaBOTfAlalTB3d9u9KsWzcMocy
	 knkOMDmzxROYPJN4tpZTj+7wLBwE7UD+0jdYYlnR81RrU/0fn4ZJx3wyHoZyl/yj3B
	 2QAgZ+E5SNuNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10A3E823E0;
	Sat, 14 Mar 2026 23:21:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EE098118
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 23:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9CB240544
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 23:21:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zZtZ_UGY6Ddb for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 23:21:14 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=stephan@asklandd.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F01B4401BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F01B4401BC
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F01B4401BC
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 23:21:13 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b94358796a1so478688366b.2
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 16:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773530472; x=1774135272;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rQVLY31BLuXPbSl3LombX+SiAgEdnCHX4t0zyZsDBWk=;
 b=j1VYsYcS7oGn+2gI1X90GmQJUPIDgUTtLZmE0VowZGJjzRkKpEnItHq0vX1V99HiaQ
 PmKW2WTaEt0BWx/duIrus5gLtk25vthez5aV0C5Col5Eqfa1cRBCzC+E1K3AiLOELskI
 02PIBEO7ftbvVTpq03RjNC2rbOScTZHKxiHBc2gbGv6GMxvs3LYp83HGfVtBTzD3d8Lf
 4b2sK5sYbldC/fU5yhVXI+uDI7ZGduU7qTgbpvbZPiVANsir8dmO7pnDoAPLbuD7nAS8
 yE41vA41S6V8pbskhUbHvRfK7bWYYc28PfSLr9WLnbqY0BCZuWKXn/nONC5PWBJdHTQp
 df9Q==
X-Gm-Message-State: AOJu0YyC8E0h/IcfhaNDZn7jxE4TiVMd/C8vL3hXgXa/ru8ydzJrODHF
 IysXx23O+VN/S5xdtNF0sQIqiAAVnH0RvxrBUgrCZlhJ+7K6TFlpBxqWcmnZhckXv8CMXzQPIJZ
 Y/TiI
X-Gm-Gg: ATEYQzxI7UJvIzgtQfEzWwg5MuTjxFQGMJIh1IGKIiYFONHO/g7T2Ae04GP7eSv2M9o
 Kd1SyUNNsZNmnRMe8eXJq4wyzpm/T7mHiYCxDccW4MbkhmJOM2jEA6a3fVjRLZSsw1n01OGEWFY
 orbZzdqVwJlgNgQ+az6YP+MPHCEz+woOWui1AtlPgF/MOhtZFg6VwqDGb9Y7IpOJPVutUxml2In
 0z9Opexm3Nib65MPWLjRU0Dgg/kmMEw/2w1fsRH+ld8kcfUAzUbSirW+2obnD9xB5W8ZWbGyJ9W
 n6kgij86O+uFntPgzTKsKwBw4anmxtDRPsYVd60x5eg9n/7yWL+oq7VVpppbu8HomJxzcfM01Rr
 YGxhPpKywS0GuPS1Op48SKQZJPFJsTnWxN+vF55/kpFdxGL4S+aC8YuF4FMRcUoU4DiHirawBiW
 mxC4TFwhnaJAMa46YPHsufsu8r+Layo3f7Cn16zzamak/QaGLuv7OqZ6ZK4N0=
X-Received: by 2002:a17:907:72c3:b0:b97:9569:5161 with SMTP id
 a640c23a62f3a-b9795695a75mr169694466b.40.1773530471793; 
 Sat, 14 Mar 2026 16:21:11 -0700 (PDT)
Received: from flashback (85.184.166.47.static.dhcp.aura-net.dk.
 [85.184.166.47]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b978b8625d3sm204479766b.52.2026.03.14.16.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Mar 2026 16:21:11 -0700 (PDT)
From: stephan@asklandd.dk
To: buildroot@buildroot.org
Cc: Stephan Henningsen <stephan@asklandd.dk>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 15 Mar 2026 00:21:05 +0100
Message-ID: <20260314232106.2944800-1-stephan@asklandd.dk>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=asklandd-dk.20230601.gappssmtp.com; s=20230601; t=1773530472; x=1774135272;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rQVLY31BLuXPbSl3LombX+SiAgEdnCHX4t0zyZsDBWk=;
 b=BIyxe0HSSQ15u8kwKMpcwLP4Aytqoxp+Z1fC3zVy9ioost/wrOKG8/pdfxPP68WfbU
 7An4h0UpeLf7Bkw00PEXxSAw4drD2LyHyU2tTdebsRqNwOZF+MYq8t57yDRVdGUm/BK3
 Oi6g5dBTePZnCl28HCMUEy6to6GBmZF7bO61PFcwa92H+ELK74w5j6/H0wVR+NWfmWAD
 EdgrQgwQY9tlBwJw1S7NnmKNtSLrn94kuex9qWHHm8qDD+zCSsDD0im/eBPA82ZaFF3X
 fvuNo2uqGlWbz2d7sAuqAolwNwHBBKg2ZHObgnzD52fR7KQwjALxnWqiWowM/K+YshcM
 eCaQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=asklandd.dk
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=asklandd-dk.20230601.gappssmtp.com
 header.i=@asklandd-dk.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=BIyxe0HS
Subject: [Buildroot] [PATCH 2/2] package/util-linux: fix mount helper lookup
 path
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Stephan Henningsen <stephan@asklandd.dk>

When using /bin/mount to mount filesystems that are not supported
directly by the kernel, it delegates the mount operatin to helper
programs, e.g. mount.fuse.sshfs.  Normally /bin/mount searches
these directories in order for a helper: /sbin, /sbin/fs.d, /sbin/fs.

In reality, Buildroot installs e.g. mount.fuse.sshfs into /usr/sbin,
and as a result /bin/mount fails to mount sshfs entries defined in
/etc/fstab.

The patch changes the default search path at configuration.

Signed-off-by: Stephan Henningsen <stephan@asklandd.dk>
---
 package/util-linux/util-linux.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index f43a1a128b..a2a11c35d3 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -51,7 +51,8 @@ UTIL_LINUX_CONF_OPTS += \
 	--disable-makeinstall-chown \
 	--disable-poman \
 	--disable-rpath \
-	--disable-year2038
+	--disable-year2038 \
+	--enable-fs-paths-default=/sbin:/usr/sbin
 
 UTIL_LINUX_LINK_LIBS = $(TARGET_NLS_LIBS)
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
