Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E004FC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 08:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B89FB813AD;
	Tue, 16 Jul 2024 08:58:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8m44ps_w86wY; Tue, 16 Jul 2024 08:58:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96333813AE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96333813AE;
	Tue, 16 Jul 2024 08:57:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 06A401BF3D6
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 08:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7ACD40184
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 08:57:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tJI3OcT9_I94 for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 08:57:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7CC9C40106
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CC9C40106
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7CC9C40106
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 08:57:54 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a77d85f7fa3so829526666b.0
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 01:57:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721120272; x=1721725072;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yV2jl0rLZ1hCnesDKm2u4P9WwZRY8L8lweTqE32Q7Zk=;
 b=qGtbhljJhXsAYcc0DZYOtuDDeLp6I8OAYtVo1MDe1kS2eFo/BKCQ9asv+qnD8q8r3y
 5G3KTIMo6IhCtAe3y5roHH6uYGWNMJAebW5slksRPnNYTlTpGVE1AHcRr9Pyc3OpTSNT
 y7addqfNQwvkHUzxbn0AZnKQHXy1r+upL2LK6gd5UvwD0/T1h/YXvnxZncd4qrwEIDyV
 A1r9/iqXdy+4e027Rx/8oqeNccXuKb5f8uQfiUN/DZouZKKZfL9oI5jIfjPyDXixSclL
 cvMyNIy+0w/Qvm8DuDCuJNyS39GxzlpVmC+GBFJ8/PwrNbrhjXlMtabWVTE7KdWb4sS5
 fXNw==
X-Gm-Message-State: AOJu0YwlUCMGZPOgxlJTRA28FypNO5bL6eY/D9c+vS7oypZfr9gZbQgY
 FcqRhMdR2sVgr/fBr0gCnWLNgEdt93a3MCtEUtunK0d34cKdPwy+qXhMKspc
X-Google-Smtp-Source: AGHT+IGDhXU1/MB6sSEnt7tqvcpL4A92ks7Bf1YutO4brb98cRtUtt0tq7LPpFtBQk7LTE/yFax87g==
X-Received: by 2002:a17:906:344f:b0:a6f:e7a0:91cf with SMTP id
 a640c23a62f3a-a79edcf4561mr109399766b.24.1721120271820; 
 Tue, 16 Jul 2024 01:57:51 -0700 (PDT)
Received: from gimli.addiva.ad (h-79-136-22-50.NA.cust.bahnhof.se.
 [79.136.22.50]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc7ff8c9sm282951266b.162.2024.07.16.01.57.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 01:57:51 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 16 Jul 2024 10:57:46 +0200
Message-Id: <20240716085747.490549-2-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240716085747.490549-1-troglobit@gmail.com>
References: <20240716085747.490549-1-troglobit@gmail.com>
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721120272; x=1721725072; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=yV2jl0rLZ1hCnesDKm2u4P9WwZRY8L8lweTqE32Q7Zk=;
 b=bN5vm/ZVqi2Whjffg0oTGB2RQyvldcFhPtdil3TJM8T0kwRQ0K48I3GlFPlAUngYxB
 aN+h83CYl/lESULn/kgaOvMcXm5EWojp8zZBUemLmza/mboAhL8XQRrDx85DY9U0A1pK
 ptuo5+EgUD6TjvcVNOsz9Ssu58UTluo4hLA2cg1NPDUewS1MnrZ8LnxplXtBRxns6gxY
 EgAS24LdhY7QVzmWdLoNZDgfUAwgLT9Lj0FhZZ4bvAiZbzZpoP/ERfo2x3TpRQe5JsEA
 rWi2Sh9XqOc0aGnwWMmRmaCYpHE7aNeyFsImj3+KKVjfxgUSiqlq7bLNL6swiYiA84Ng
 9cew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bN5vm/ZV
Subject: [Buildroot] [PATCH 1/2] package/sysklogd: bump to v2.6.0
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

 - New command line flag -l to control klogctl(2) on/off and allow raw
   kernel logs to console, use with 'quiet' kernel cmdline option
 - Add reload command for systemd service
 - Add *.conf support for rotate_size and rotate_count
 - Add *.conf support for listen addr:port
 - Fix blocking delay for unresolvable DNS names when logging to remote
 - Fix failure to bind to not-yet-set IP address by retrying every 5 sec

Full ChangeLog at https://github.com/troglobit/sysklogd/releases/tag/v2.6.0

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/sysklogd/sysklogd.hash | 2 +-
 package/sysklogd/sysklogd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
index 7e00990174..361d68a157 100644
--- a/package/sysklogd/sysklogd.hash
+++ b/package/sysklogd/sysklogd.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256  9da4444285772ce2bfc9c687be8f978b7a9fe7d3937347cd4938eda0c4545e05  sysklogd-2.5.2.tar.gz
+sha256  c5ae067b479b54ef90fa9352c277d44ff7b4314023fc6ee0a37e81b99a78a917  sysklogd-2.6.0.tar.gz
 
 # Locally calculated
 sha256  7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477  LICENSE
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 083f505a2b..7abb830119 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSKLOGD_VERSION = 2.5.2
+SYSKLOGD_VERSION = 2.6.0
 SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKLOGD_VERSION)
 SYSKLOGD_LICENSE = BSD-3-Clause
 SYSKLOGD_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
