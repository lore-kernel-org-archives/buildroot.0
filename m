Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C77EEE021D
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 05:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FFE340A4B;
	Fri, 15 Sep 2023 05:28:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FFE340A4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZyG4P5t8rLmj; Fri, 15 Sep 2023 05:28:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B64EC40A60;
	Fri, 15 Sep 2023 05:28:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B64EC40A60
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A75901BF5D7
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 05:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C90C83B67
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 05:28:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C90C83B67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g0SPW_ZLoPvJ for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 05:28:48 +0000 (UTC)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 66DE083807
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 05:28:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66DE083807
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2bfc5218dd8so27122831fa.2
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 22:28:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694755726; x=1695360526;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZybjMfI/cSQi88nvRE1paSGa+4XOAEzRCwVBp+FSe7o=;
 b=UUSmexvCo2nG2fQfGN22xjuYQ/I1xmD1GzBtAjStW2GDkFh/ldKB7tQP1embU4NTkz
 B8EyUIP5q2TorI69dSRuR6QXhsGpycQMxlJF+05/rgxjDXKLWkwk2DjuCRpf+XqqZI8Q
 IUwsVKYxCjtdOgKqppUXtbMI7HulbeM37MzBXTXrBdTr0DxVembMvLjmbXub1RMJaFRM
 PTUdnJvX0LM5FCSsBSZk3CNnGOo+tgEO2YVEKLQHsHS3cHK4yeCWSIj2CZSKzAngpVBa
 uuiSW4tcxAUnmwjoPuhApDax/FUPxAK4JUwCLLsNFQtxVMTt8Ol4GI8VDcu1fAeIIBL4
 VSwg==
X-Gm-Message-State: AOJu0YweCNJj1gu4bFaD+WYOGdC3sA6sd9LgAPTHT+LeuGl1gcAw5YsL
 CFp3m73l0Y3GHlPUWzQkLg1sI46SJE8=
X-Google-Smtp-Source: AGHT+IF1U1NOR1bKYOKPQdRVJOg93tGv63Qx1ecATyxyNMcl/v8t2h/fcYzCXYcEQ6Gyhwv0vIeqzQ==
X-Received: by 2002:a2e:9089:0:b0:2bd:2056:ceed with SMTP id
 l9-20020a2e9089000000b002bd2056ceedmr658969ljg.25.1694755725693; 
 Thu, 14 Sep 2023 22:28:45 -0700 (PDT)
Received: from gimli.lan ([2001:9b0:21e:3500::e19])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a2e9a83000000b002bc3fbe9fd5sm567813lji.55.2023.09.14.22.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 22:28:44 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 15 Sep 2023 07:28:40 +0200
Message-Id: <20230915052840.3060566-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694755726; x=1695360526; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZybjMfI/cSQi88nvRE1paSGa+4XOAEzRCwVBp+FSe7o=;
 b=FcsT/EZfM0uR2umwzoGDPndQAUy6Xuh5ixuNqQngC4JZKBhDgptgZTASy94jRfhQP4
 v/lVCJldDeCRekw4LMRHfK5IFIuwlkKxFUs9uf5HYaiU5jZC3QImoHk18Tllge25aS6p
 jaSqZhprIrcQk18mVDzCteDpDbO/m2SY6fHF+a17Z+JYpRQNL3og4g5IJ/TqVxvmLR6r
 u2QNknOIpl/ImzrH6In6R6rEiRfgNOIOXCh1AuJ2u3OEyso22qefFNT8IjXZKLBkqtgu
 1aqWQxuJfQn1R7sHNfGqhEDUCSidg9y1WgRhZ9WJO/j0epEErLzjkFqGr2WvVI75ar/9
 69pQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FcsT/EZf
Subject: [Buildroot] [PATCH 1/1] package/mg: bump to v3.7
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

 - Sync w/ OpenBSD upstream
 - Fix key bindings, Home/End
 - Fix buffer overflow on no match in i-search
 - Fix mark reset
 - Usability:
   - persistent help in status bar
   - F1 toggle quick-help buffer
   - F2 save
   - F3/F4 macro start/end + run, like GNU Emacs

Full ChangeLog https://github.com/troglobit/mg/releases/tag/v3.7

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/mg/mg.hash | 4 ++--
 package/mg/mg.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mg/mg.hash b/package/mg/mg.hash
index e8eedb8921..6a3e3465b8 100644
--- a/package/mg/mg.hash
+++ b/package/mg/mg.hash
@@ -1,4 +1,4 @@
-# From https://github.com/troglobit/mg/releases/tag/v3.6
-sha256  0e30f99b7606ddd92535aec0ba0118557afa4adca0961267314a4bf7791865fb  mg-3.6.tar.gz
+# From https://github.com/troglobit/mg/releases/tag/v3.7
+sha256  05101360d2194392da0950e8b6f18d067d8af0fd2f572461ba4d4e7b4ccbb4c1  mg-3.7.tar.gz
 # Locally computed:
 sha256  7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c  UNLICENSE
diff --git a/package/mg/mg.mk b/package/mg/mg.mk
index 88f8f60257..59f1d1e316 100644
--- a/package/mg/mg.mk
+++ b/package/mg/mg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MG_VERSION = 3.6
+MG_VERSION = 3.7
 MG_SITE = https://github.com/troglobit/mg/releases/download/v$(MG_VERSION)
 MG_LICENSE = Public Domain
 MG_LICENSE_FILES = UNLICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
