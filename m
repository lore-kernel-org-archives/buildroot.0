Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65F8C4321E
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 13:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41FAF81AEF;
	Sun, 27 Nov 2022 13:08:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41FAF81AEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GGROHdeo6w0m; Sun, 27 Nov 2022 13:08:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A15181AAB;
	Sun, 27 Nov 2022 13:08:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A15181AAB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 161FF1BF42C
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E43C94099F
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E43C94099F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aZmOkID16_Wh for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 13:08:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFA134098A
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CFA134098A
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 13:08:01 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id q83so9007810oib.10
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 05:08:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xif48wvjxmSFCzPkEj+GZMOC7ubIcSZuLpdw5rzTfGA=;
 b=t6me8EKjqxoe+kIlcZV3sowUzqzChCCt77umzTdUUwjF2lEDe1j7xNpG3rFuqfC4jr
 nFBImsVU0B5rrUK9a+IL8N1DOp2UF3/9r8DOrzPBuoEhv3M+GIKEnAzZ1dAXlpwx/nEa
 xqHtFmghVENw5gV7bcw74WMqPLeSlZj2ZXROv9CcXhbeDbs+PiBdl6R7EAW1k1rNg0Vm
 5kNUbSUkiFOD84X9V7Nk4cfJi4zDwZHvkhVbInJTYNHU4xIkpBMs6VbwNMNJgHCzyyX3
 n0bMwHMuYzMAcM0VfesPtHWL9ST4w6FuLcHIdYZDE8IyIGU/cu2Q+1LnJyCd6xFxR+A5
 LNJg==
X-Gm-Message-State: ANoB5pn6e48UcIfwoQBrVbI11kOth18hnoCEZpssgU+HRbjyRNvh7Bmf
 2kOMUPf7lF9NsCuzBg2Ajg2meq8leCg=
X-Google-Smtp-Source: AA0mqf6wY6+0ob15J3U2bfqQyb63NMClcN+svmFpeXWf/Cw4EPW4ZwVOHyKxp4goDGy5nkW4AioatA==
X-Received: by 2002:aca:d10:0:b0:359:ad61:e574 with SMTP id
 16-20020aca0d10000000b00359ad61e574mr12574623oin.221.1669554480934; 
 Sun, 27 Nov 2022 05:08:00 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:9b54:d73e:4d8c:458c])
 by smtp.gmail.com with ESMTPSA id
 i25-20020a9d6519000000b0066a9ba5094fsm3655102otl.1.2022.11.27.05.07.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Nov 2022 05:07:59 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 10:07:16 -0300
Message-Id: <20221127130739.1862398-3-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
References: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xif48wvjxmSFCzPkEj+GZMOC7ubIcSZuLpdw5rzTfGA=;
 b=TvamxyC+3AFCna+neHgU4qODqU1k4TqDN+m8m+QcF3zQc40q1hP/Xh07VBq+okgiq8
 quuuu1XUjZzRawKa23LubdBz5F0aTIaRZbRq/He2gO7eyuq/ln+LyDaNsu5UBDeB2yBT
 yZZuw/8BKOwR2I+UJ6Mb4HZmd/oK3aZTxTYmb9yq+PcnqkdOngituddc7dS1eQ91KEFH
 f7UVHglzxbFvcROGgNZeRTdg/2PTJwyniblB4A/1SfWYUnouX+YB65VcsPC5WJ3FcmfM
 G72Dv9YgEPCtxcbv5vyqOvpaaa2HJM6SrBQtcj5yZDIeGRsvAVISm1NsdQt/DxDOyTh6
 p4pw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TvamxyC+
Subject: [Buildroot] [next 02/25] package,
 legacy: fix typo for "daemon" on help text
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

deamon -> daemon

At same time, in Config.in.legacy fix other typos in the same help text:
spae -> space
monolitic -> monolithic

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 Config.in.legacy           | 4 ++--
 package/ngircd/Config.in   | 2 +-
 package/rp-pppoe/Config.in | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 284e7bf887..4eff5b55d6 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -4324,8 +4324,8 @@ config BR2_PACKAGE_OPENPOWERLINK_LIBPCAP
 	select BR2_PACKAGE_OPENPOWERLINK_STACK_USERSPACE_DAEMON_LIB
 	help
 	  The user space support has been split in two part:
-	  - a monolitic user space library
-	  - a user spae deamon driver
+	  - a monolithic user space library
+	  - a user space daemon driver
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "using the linux headers version for the kernel has been removed"
diff --git a/package/ngircd/Config.in b/package/ngircd/Config.in
index 9b3d430922..1e93a5702c 100644
--- a/package/ngircd/Config.in
+++ b/package/ngircd/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_NGIRCD
 	bool "ngircd"
 	depends on BR2_USE_MMU # fork()
 	help
-	  Next Generation IRC server deamon.
+	  Next Generation IRC server daemon.
 
 	  http://ngircd.barton.de
diff --git a/package/rp-pppoe/Config.in b/package/rp-pppoe/Config.in
index 2ac81cbb2d..6ff005a1e1 100644
--- a/package/rp-pppoe/Config.in
+++ b/package/rp-pppoe/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_RP_PPPOE
 	select BR2_PACKAGE_PPPD
 	help
 	  An implementation of the Point-to-point protocol over
-	  Ethernet.  Has userspace client and server deamons. You
+	  Ethernet.  Has userspace client and server daemons. You
 	  likely only need this package if you are implementing the
 	  pppoe server that will service other pppoe client
 	  devices. Otherwise the normal client functionality already
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
