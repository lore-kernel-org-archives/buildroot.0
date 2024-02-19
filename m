Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9DEC48BF8
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 19:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3923540B46;
	Mon, 19 Feb 2024 19:19:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aez1Jwmt4ZXR; Mon, 19 Feb 2024 19:19:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D6B74060C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D6B74060C;
	Mon, 19 Feb 2024 19:19:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A8B8E1BF48D
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 19:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2A60402EA
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 19:19:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id skxnLnyTsYkW for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 19:19:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A8FC8401D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8FC8401D4
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A8FC8401D4
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 19:19:39 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6e0f803d9dfso2255490b3a.0
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 11:19:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708370378; x=1708975178;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P9F7LoouLKTT+t1KMz0jRr7yM28YnEZ0RdhQV0ZG0k4=;
 b=IP4x8RsZoNJqo/CqWripkorjyfQzQeCRbOr2eXf6XVO69Yt2m+6pvoME3IZjW54GBT
 hypiGlhS4qBa97s1fPlktQyrUCuZh9oJ5Y4pJV1eljqt7QY5YgVahO/wlCVI/G+zOLGI
 RGy0VoPIDecEl6L2jlo/A5CEd3DR2OF8NJoZswcj0nKoa07dZfesbnxQxmd96jdmzy78
 PI2UcBpD4V5kO9NDU506H69aSOZwbpwhM/U7nLZFKbg4Wz73LOIvnJcV8sgskPn4+Os6
 0dy8DlHaMY+v4zzEoTG070ZpflcqqPjgn0MmQyttif4rUbNyTQ2gjmacfbLTQ4hzyhl+
 aVRg==
X-Gm-Message-State: AOJu0YxF9Duh80w8ZOYjeHtuSdD3Fg47z4uJ9muo4U/zo5NQIf66+52e
 rHH6VfjQH0YDjI5vPfsVNSRGNxAneC6xiy0LjOJuV4mCo94TrO7Xz2mler+KGSY=
X-Google-Smtp-Source: AGHT+IG+xxFuuKVZl+dBZEuSRRF9rfiHuQdOFZYF7nL0pHqh6tN+lpwiyHhXSHRJft/ERTCrJSmFFw==
X-Received: by 2002:a05:6a20:9c97:b0:19e:bca3:213f with SMTP id
 mj23-20020a056a209c9700b0019ebca3213fmr17778109pzb.52.1708370377682; 
 Mon, 19 Feb 2024 11:19:37 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 w68-20020a626247000000b006e469f3f80asm1708103pfb.63.2024.02.19.11.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 11:19:37 -0800 (PST)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 Feb 2024 11:19:34 -0800
Message-Id: <20240219191934.41982-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ZdJ3QFhBszqQ6cem@landeda>
References: <ZdJ3QFhBszqQ6cem@landeda>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708370378; x=1708975178; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P9F7LoouLKTT+t1KMz0jRr7yM28YnEZ0RdhQV0ZG0k4=;
 b=XvsDE4/+LT10rUYwkDjVVxRDFRIS3HXHf07KgEOjH4iGBJSHfon0htRP4obTvn6f5G
 YTYab2AyorMT8bkBfrvgnc/ocVwmN7RQK5OS+JOl+uPodp2vOD4lScVrEHEJxoGZbO9a
 EEpTSqcYxJ8fWD6RDX88GaraVXzwVxqJfDxgBSSWx/k4VcciR42R72lUXHH+cWWIoumk
 81wrHFyH6uuQQebzom3tigG2FLoUh/mJcN0vdWSXxCQ4I4Xx7pSp2zDUljSsr2ND/upJ
 EkVs5jDt8VHDbUtEK2r4XLWE737WO4YcsYOGU+MIonO61Afho2+mlIwQ7h4vTZ2OSMNJ
 sYHA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XvsDE4/+
Subject: [Buildroot] [PATCH 1/1] package/dos2unix: bump to version 7.5.2
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
Cc: Kadambini Nema <kadambini.nema@gmail.com>, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Update hash of the COPYING.txt (update in year)

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
Changelog: https://waterlan.home.xs4all.nl/dos2unix/ChangeLog.txt

$ ./utils/test-pkg -d br_test -k -c  dos2unix.config -p dos2unix
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: OK
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK
6 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

 package/dos2unix/dos2unix.hash | 6 +++---
 package/dos2unix/dos2unix.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dos2unix/dos2unix.hash b/package/dos2unix/dos2unix.hash
index 032c8ea2d2..d4d682cd0c 100644
--- a/package/dos2unix/dos2unix.hash
+++ b/package/dos2unix/dos2unix.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.5.0.tar.gz.asc
-sha256  7a3b01d01e214d62c2b3e04c3a92e0ddc728a385566e4c0356efa66fd6eb95af  dos2unix-7.5.0.tar.gz
-sha256  6009a35c7aaee9888fd4844972c37b84bce22e7407893727c70f4f3560ae3eac  COPYING.txt
+# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.5.2.tar.gz.asc
+sha256  264742446608442eb48f96c20af6da303cb3a92b364e72cb7e24f88239c4bf3a  dos2unix-7.5.2.tar.gz
+sha256  03b60fa2cf28b2c6dd585a13b32377c1f87b8f016db44ce2ab6bc7eb306220e2  COPYING.txt
diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index 6d1e70cf26..e30fc999d4 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOS2UNIX_VERSION = 7.5.0
+DOS2UNIX_VERSION = 7.5.2
 DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
 DOS2UNIX_LICENSE = BSD-2-Clause
 DOS2UNIX_LICENSE_FILES = COPYING.txt
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
