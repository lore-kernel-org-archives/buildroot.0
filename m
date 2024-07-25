Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC196C3DA49
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 13:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A17E60AB3;
	Thu, 25 Jul 2024 13:59:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tznGZnGXlBWS; Thu, 25 Jul 2024 13:59:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9856760A96
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9856760A96;
	Thu, 25 Jul 2024 13:59:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8B17C1BF20D
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 13:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72E5040985
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 13:59:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M0ciyvyR0r-N for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 13:59:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 07D0B40981
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07D0B40981
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07D0B40981
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 13:59:04 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-426717a2d12so5771655e9.0
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 06:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721915942; x=1722520742;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aRz2fDKMe7pwUCOBw+3RtZE1PWO3MkVM8Tsbgykw4Cw=;
 b=IBsybap8GFcJ0R7RMHFsWHbqs0g6jACDLSBRseSWyy30NbIn8+IoSol/VbmDTSjtnm
 uTRePcO5Jh+TYHi++LO9o83IoH4mWMJYJpBovvBvCREUwVNcht+t5i6uznfq+o+2nNH/
 dVBggj6RfMtFTiUmeSD060x686FUPNIK2+HB3qpe6LJeeoR3dROD5umT1FkhBt2M9Og9
 nY5v94OFgHBWrNWSRYLaH3AOmGd8NCKfNj3IiWREsMhMrvvvwIKo71z1PegBwu8hbQaT
 weN6hXBg+vmlVPjjgRly8C7rnFvx9oRbd3YwHAM6jv5ZsjxMoVb7GBAjdcUNeskJhLFf
 ZMQA==
X-Gm-Message-State: AOJu0YwsAjjK+W6Riye+RdMr9FX2oL6SiInt8ZYWlrrE0V0d9K49oG0V
 df10mK9d7VxQTyaAjucBO18HG2yL1lFlkM3viXIhc/gT0athiRYZxLPzig==
X-Google-Smtp-Source: AGHT+IF3fzr17NWLZ8g741nXABdu+PE6ViRwM/PA1uuudT8pgl9ElUpKWflMkuwq+CFypaXa/f3dzg==
X-Received: by 2002:a05:600c:35ca:b0:426:63bc:f031 with SMTP id
 5b1f17b1804b1-42803adbfcdmr18326355e9.1.1721915942076; 
 Thu, 25 Jul 2024 06:59:02 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4280573edbfsm38482425e9.15.2024.07.25.06.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 06:59:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 25 Jul 2024 15:58:59 +0200
Message-ID: <20240725135859.522321-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721915942; x=1722520742; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aRz2fDKMe7pwUCOBw+3RtZE1PWO3MkVM8Tsbgykw4Cw=;
 b=G+k0rtWh7TMyDW7Ox7E1tyS7I7Xfkwe7JG4r2/ltABoZR+Ft+VPVaRsVuhHNitKSXL
 0AsyuR6fepgLF+DQaFyNF9ZKGJMyX6eYUK3hLu1F6v1FwkrBrvCPZ9qF94/ahlBTGNxJ
 wJ2BYLV+ESaadtx6Sf/aCbPiu+Reg+ofFi+w7qh69PRMrx6co+d9+mLC5m0WMJ4n8R/0
 kAOC+GZxeAFFcc/YmBQbl9GapseLd0WDuhcXtnxmpQbDKivq5hUIMkkYrNB8kNiJ+Z41
 iJHXfEZycW937ySboIo59AtcRGH0q0EF4/+7MZI4qfp40hm/kd9I8DJVO3+nIX+h4GCd
 4nwA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=G+k0rtWh
Subject: [Buildroot] [PATCH 1/1] package/libdex: fix musl build with liburing
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add -D_GNU_SOURCE to CFLAGS as liburing.h doesn't define it anymore
since bump of liburing to version 2.6 in commit
da45ae33040a55d9eaa6a05c75c5e7f24fe73cf4 and
https://github.com/axboe/liburing/commit/c427ed678f39fd144d784f2e970bd8c52f425e14
resulting in the following musl build failure since the addition of
libdex in commit 70319b47f646f74f407ed3355baf5b581a10518a:

In file included from ../src/dex-uring-aio-backend.c:29:
/home/autobuild/autobuild/instance-7/output-1/host/mips-buildroot-linux-musl/sysroot/usr/include/liburing.h:224:39: error: unknown type name 'cpu_set_t'
  224 |                                 const cpu_set_t *mask);
      |                                       ^~~~~~~~~
/home/autobuild/autobuild/instance-7/output-1/host/mips-buildroot-linux-musl/sysroot/usr/include/liburing.h:1212:48: error: unknown type name 'loff_t'; did you mean 'off_t'?
 1212 |                                        int fd, loff_t len)
      |                                                ^~~~~~
      |                                                off_t

Fixes: 70319b47f646f74f407ed3355baf5b581a10518a
 - http://autobuild.buildroot.org/results/276646bf224d5927cf0311cf978571a7f8774116

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libdex/libdex.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libdex/libdex.mk b/package/libdex/libdex.mk
index 360b389255..9aec1b6dae 100644
--- a/package/libdex/libdex.mk
+++ b/package/libdex/libdex.mk
@@ -30,6 +30,7 @@ endif
 ifeq ($(BR2_PACKAGE_LIBURING),y)
 LIBDEX_CONF_OPTS += -Dliburing=enabled
 LIBDEX_DEPENDENCIES += liburing
+LIBDEX_CFLAGS += $(TARGET_CFLAGS) -D_GNU_SOURCE
 else
 LIBDEX_CONF_OPTS += -Dliburing=disabled
 endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
