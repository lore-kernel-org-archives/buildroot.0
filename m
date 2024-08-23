Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFE4C531DC
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 07:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6864581E1A;
	Fri, 23 Aug 2024 07:04:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SlMxlQMnpE7z; Fri, 23 Aug 2024 07:04:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D70D81E1C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D70D81E1C;
	Fri, 23 Aug 2024 07:04:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 776871BF339
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 07:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7152D40141
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 07:04:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pqXnEdws9kPO for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 07:04:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 12ED040128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12ED040128
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 12ED040128
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 07:04:19 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5bed05c0a2fso2138951a12.3
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 00:04:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724396658; x=1725001458;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VObbvtGc3vzG1IkjpFDf+Ky27+WePPlYsuTVsJ0MOtc=;
 b=iYM+pLf9ZDnc3uKHrERXpU9mRf/4AA4Y/kLGWcLnJyVXWJR5T3653w4k8Pxyb3cWwy
 LV/8UEEibB9McXX7ts8ZWOq4yOtPo8e0yzli1bshU7AwOe6sR4rqs6IEHQUHBsb0ZZ1m
 10NFR4486Jcn8+jtEbl6sq8RF+O0itq3fASpWb1kTfcoqMEqv/DJotfLPMK1XTG+3IKJ
 SqUHhKpAaZ5ojQIc7aEFnUrU8v7pYYPsB9JCjUQk1sRQoNolbEFiJoWg0iLk3nFTOUQi
 doBP6bEbHTPAEVY5NOFrmHfmgifKn0k4iIBqVS80Y5Gfj2S2MeUTCHoAQvAtv4OOdqCb
 kwSw==
X-Gm-Message-State: AOJu0YxR1l3vIQTI0iApSj7fMFkYj97hIW7Dkq6foU03nSnqzsx6u15N
 vk6QR6ikMHR0j9G3mD0DL2Z1CAxIhZaUr5TOPOpuWAWKbvBHfmPC6IfnOy739MqVA6oiNiUmrwT
 aofI=
X-Google-Smtp-Source: AGHT+IH03AqodTtHgzeMuy7gadhGzarMNw4WErLsMGsElEiMng6u3fHOrBUyXTaPiEuQKOAIrXBtEQ==
X-Received: by 2002:a05:6402:2105:b0:5b9:462d:c538 with SMTP id
 4fb4d7f45d1cf-5c08915a80cmr853346a12.3.1724396657664; 
 Fri, 23 Aug 2024 00:04:17 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-25-99-149.retail.telecomitalia.it. [79.25.99.149])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c044ddbfc7sm1744456a12.2.2024.08.23.00.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2024 00:04:17 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 09:04:14 +0200
Message-ID: <20240823070414.969141-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1724396658; x=1725001458;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VObbvtGc3vzG1IkjpFDf+Ky27+WePPlYsuTVsJ0MOtc=;
 b=DOn/SeYKJ6bTB0MmQH4HyE0p+Tv2uQ3FTzt/NjlOYNY+sIcLMT8NqROoH/1nFGch9A
 1vKmawvEpIsrnUJCY1AWXXDlK+9iQaWOy10Ez4uOf/prSYtjUhNIlWEk07EXPOMGGiiT
 2iL7sbEg4mqQGBBuvSsB0Ta9kA3x9IxFFZpEA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=DOn/SeYK
Subject: [Buildroot] [PATCH 1/1] package/libcuefile: fix build failure due
 to implicit declaration
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
- http://autobuild.buildroot.org/results/28f1e34166e836bf3b984f228bb09842840de82a

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../0002-libcuefile-fedora-c99.patch          | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/libcuefile/0002-libcuefile-fedora-c99.patch

diff --git a/package/libcuefile/0002-libcuefile-fedora-c99.patch b/package/libcuefile/0002-libcuefile-fedora-c99.patch
new file mode 100644
index 000000000000..fdd2c38d5939
--- /dev/null
+++ b/package/libcuefile/0002-libcuefile-fedora-c99.patch
@@ -0,0 +1,26 @@
+From 7dd8752f5aa2dccbaccb4c28a23f659df3bc0d19 Mon Sep 17 00:00:00 2001
+From: DJ Delorie <dj@redhat.com>
+Date: Thu, 27 Apr 2023 17:24:58 -0400
+Subject: [PATCH] Fix C99 compatibility issue
+
+Related to:
+
+  <https://fedoraproject.org/wiki/Changes/PortingToModernC>
+  <https://fedoraproject.org/wiki/Toolchain/PortingToModernC>
+
+See Also https://bugzilla.redhat.com/show_bug.cgi?id=2190307
+Signed-off-by: DJ Delorie <dj@redhat.com>
+Upstream: https://src.fedoraproject.org/rpms/libcuefile/blob/7dd8752f5aa2dccbaccb4c28a23f659df3bc0d19/f/libcuefile-fedora-c99.patch
+---
+diff -rup a/src/cue_parse.c b/src/cue_parse.c
+--- a/src/cue_parse.c	2011-06-18 07:28:43.000000000 -0400
++++ b/src/cue_parse.c	2023-04-27 16:10:13.314263314 -0400
+@@ -1513,6 +1513,8 @@ void yyerror (char *s)
+ 	fprintf(stderr, "%d: %s\n", cue_lineno, s);
+ }
+ 
++void cue_delete_buffer(void);
++
+ Cd *cue_parse (FILE *fp)
+ {
+ 	cue_yyin = fp;
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
