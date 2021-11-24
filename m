Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1F4C433F5
	for <buildroot@archiver.kernel.org>; Wed, 24 Nov 2021 18:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85D28400E9;
	Wed, 24 Nov 2021 18:06:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id caDrYgy1CY1F; Wed, 24 Nov 2021 18:06:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64353404BB;
	Wed, 24 Nov 2021 18:06:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 035F21BF286
 for <buildroot@lists.busybox.net>; Wed, 24 Nov 2021 18:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4D93402BE
 for <buildroot@lists.busybox.net>; Wed, 24 Nov 2021 18:06:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=broadcom.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E322Vu_PLtNU for <buildroot@lists.busybox.net>;
 Wed, 24 Nov 2021 18:06:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A0C41401F6
 for <buildroot@buildroot.org>; Wed, 24 Nov 2021 18:06:40 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id l190so2862549pge.7
 for <buildroot@buildroot.org>; Wed, 24 Nov 2021 10:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BKsRW8b4bsnj/H2feSFTJk4DtWDrD0QOyybCKyEWH80=;
 b=E0aIrmSQ2XPDpoEwDvc5GMesZ4MHSAroSe0wzuqPm8s1GgzLAil2PBTwDUbbt5VWp3
 HJSC0i9h7Be7BJgbAVMwBvSiX3+KRJkTBuhvvakw9zzSiFUYfRJSC/47o0DeRdabOErW
 e2l+qlatRwlUZNUXlEBBxF2kt+4UjDkCuV4zg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BKsRW8b4bsnj/H2feSFTJk4DtWDrD0QOyybCKyEWH80=;
 b=BbYZBu2ln1xy53psavQw42n+TfiEVQFojW8uZ/WWbHUI66/X98uLEXjGxTvM6q/SQs
 8LEl9r5pVx4z+J1MVP2U4mkaYCDW7yCN7EdBOvbCq7hYTiyHlXzrx0F9s19ocRAiX1iv
 jt008kjPp4t9+L3uSWWD4bXSQUM2x0IuaJ6E7x/MMYCy0UD20FNTRh2OfjRkZu+NsF9c
 yNcZNXSyggiHPDY/MSg7P4C01SsAAXto0h+yu3861NlZfS8f3ucUA21vbVVlPEWIiFKs
 Vqs4OBICRODMUptz+qBlKLv7V1xkxTWl+E9KnZpK1G/OBjktOd5fm62KsMzuiBS/j5ae
 Cpcw==
X-Gm-Message-State: AOAM5316dEkJkYgw7w/sAikOp/gdo9KpQwht98j/R3B6wpMY5L9mIS33
 87c0A5iOGrlf4tCZOmGeQNHpJnE/F0J9KM4O
X-Google-Smtp-Source: ABdhPJxamKAT+79DMhPJOxiQVMRPVAFhT5ssOp7iB7OClntFjiQ6UMIqwnE05UEM5cQh+j1WzzQ19g==
X-Received: by 2002:a63:5009:: with SMTP id e9mr11798844pgb.346.1637777199933; 
 Wed, 24 Nov 2021 10:06:39 -0800 (PST)
Received: from lbrmn-mmayer.ric.broadcom.net ([192.19.228.250])
 by smtp.gmail.com with ESMTPSA id h128sm340967pfg.212.2021.11.24.10.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 10:06:39 -0800 (PST)
Received: by lbrmn-mmayer.ric.broadcom.net (Postfix, from userid 1000)
 id 719532BBB71A; Wed, 24 Nov 2021 10:06:38 -0800 (PST)
To: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Nov 2021 10:05:35 -0800
Message-Id: <20211124180535.574859-1-mmayer@broadcom.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH RESEND] package/mkpasswd: define _DEFAULT_SOURCE
 to suppress compiler warning
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Cc: Markus Mayer <mmayer@broadcom.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We define _DEFAULT_SOURCE in mkpasswd.c to suppress a compiler warning.

In file included from /usr/include/x86_64-linux-gnu/bits/libc-header-start.h:33,
                 from /usr/include/stdio.h:27,
                 from [...]/buildroot/output/arm64/build/host-mkpasswd/mkpasswd.c:24:
/usr/include/features.h:187:3:
  187 | # warning "_BSD_SOURCE and _SVID_SOURCE are deprecated, use _DEFAULT_SOURCE"
      |   ^~~~~~~

As per GLIBC 2.20 release notes[1]:

    The _BSD_SOURCE and _SVID_SOURCE feature test macros are no longer
    supported; they now act the same as _DEFAULT_SOURCE (but generate a
    warning). Except for cases where _BSD_SOURCE enabled BSD interfaces
    that conflicted with POSIX (support for which was removed in 2.19),
    the interfaces those macros enabled remain available when compiling
    with _GNU_SOURCE defined, with _DEFAULT_SOURCE defined, or without
    any feature test macros defined.

[1] https://lwn.net/Articles/611162/

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---

Originally sent about a month ago:
https://lists.buildroot.org/pipermail/buildroot/2021-October/627062.html

Would you mind pulling this in for 2021.11?

Thanks.

 package/mkpasswd/mkpasswd.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/mkpasswd/mkpasswd.c b/package/mkpasswd/mkpasswd.c
index fd16230468a4..ae8594061cf6 100644
--- a/package/mkpasswd/mkpasswd.c
+++ b/package/mkpasswd/mkpasswd.c
@@ -18,6 +18,11 @@
 
 /* for crypt, snprintf and strcasecmp */
 #define _XOPEN_SOURCE
+/*
+ * _BSD_SOURCE is deprecated as of GLIBC 2.20; _DEFAULT_SOURCE should be used
+ * instead. (https://lwn.net/Articles/611162/)
+ */
+#define _DEFAULT_SOURCE
 #define _BSD_SOURCE
 
 /* System library */
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
