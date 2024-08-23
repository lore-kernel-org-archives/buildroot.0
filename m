Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C8AC52D7C
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 09:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04A2440724;
	Fri, 23 Aug 2024 09:09:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2hiGeuhWwWem; Fri, 23 Aug 2024 09:09:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8BD240BA3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8BD240BA3;
	Fri, 23 Aug 2024 09:09:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BF1991BF34F
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 09:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACB3E60E51
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 09:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FUFJ8AbiYl5e for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 09:09:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f33; helo=mail-qv1-xf33.google.com;
 envelope-from=joey.t.reinhart@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BBCD560DF9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBCD560DF9
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BBCD560DF9
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 09:09:51 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id
 6a1803df08f44-6bf775d1bdfso8144776d6.1
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 02:09:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724404190; x=1725008990;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4FSN822ube10EJwnQ5qizbDi7WaUiY+rpsL5AZMeDFA=;
 b=q4bRkoUO704SYKhtLmX52iF1Z7XsElslx0lGTa2lxc1PN15+Ao6y8YpobHMCtCQHaF
 hhObSgUM4z0TFoc+fCDAYd/mxg+fqltMuxW+Zwjc7bsVLWdnZrEv0Y7uRq9RDWbBC7st
 IIV189Txhxqwb9GwSUH0NkAQo/yJz2+DGqpETt98s1NkyGGElKEX3umXfTgCUWg+aHRR
 C9sFxILsAbrc39hnXjNTbe23H5FD/lgvc+CvD+B3aA+DRWQltr4BFEithaZ2xNHHC4ls
 mpUbKUUa+8V7sGCzwiymxEtp1Ec7fTNiAcSv8rzidZvHUbyrlu9JYYD/AJTPacl9DxLJ
 WPEw==
X-Gm-Message-State: AOJu0YysNuBqynBQhTvec4KiYsP5IZAL8fU8w0fai7PjlgCxRAosLr/8
 LGPZ2bw8m9eU2MR5L/U4sz2sn8r8sVnu14ZHqtYWlqbQyRgjdmBF4mIeYQ==
X-Google-Smtp-Source: AGHT+IHAP73mNaHjyyf6RQxiP8qaz8jK8paeD5olw9lDQTcwwolP2Y94w1qZIN4VNiP7+FNE5IggIQ==
X-Received: by 2002:a05:6214:310b:b0:6bb:b23f:8d06 with SMTP id
 6a1803df08f44-6c16deb47efmr17134056d6.46.1724404190157; 
 Fri, 23 Aug 2024 02:09:50 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:9190:3900::3b0])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c162d631dbsm16364576d6.63.2024.08.23.02.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2024 02:09:49 -0700 (PDT)
From: Un1q32 <joey.t.reinhart@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 05:09:39 -0400
Message-ID: <20240823090939.79455-1-joey.t.reinhart@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724404190; x=1725008990; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4FSN822ube10EJwnQ5qizbDi7WaUiY+rpsL5AZMeDFA=;
 b=WqXeY5AnQ/FV0hQXUebY0MMD9Ugz6esreLWVo3dZWrzBT7/uLxvvMCAttL3+XUXHfX
 Wi/G5QNsdFfQ+nXUmJwPQRHby5alDd2xatg6WF/r/N5ywDl54ghxVO0FUJrSn2TuDlVw
 JSKjHGkTNi6bg4nsymJpHX8VCO3Y0UYMWj+OsfkoH6+iK7AC1jM0WGCSvHpyVnNit8hu
 VjmhCrWXiYh7J2RPq8no0pdNGp9PEdf03X+CGolOudPCJt+vv2a8+d6jdKya9iRpyJ0e
 GsEr7GWsi1dTjmAoyyy+bfxtNLHMGjwX3fCKr+cm/GVZ6xzhp0WLdxlAMHjeMCIv1vGw
 Cm1w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WqXeY5An
Subject: [Buildroot] [PATCH 1/1] package/busybox: patch to fix tc build on
 6.8+ kernels
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
Cc: Un1q32 <joey.t.reinhart@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Un1q32 <joey.t.reinhart@gmail.com>
---
 .../0010-tc-build-fails-on-kernel-6.8.patch   | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 package/busybox/0010-tc-build-fails-on-kernel-6.8.patch

diff --git a/package/busybox/0010-tc-build-fails-on-kernel-6.8.patch b/package/busybox/0010-tc-build-fails-on-kernel-6.8.patch
new file mode 100644
index 0000000000..95f2585c21
--- /dev/null
+++ b/package/busybox/0010-tc-build-fails-on-kernel-6.8.patch
@@ -0,0 +1,55 @@
+http://lists.busybox.net/pipermail/busybox/2024-March/090678.html
+https://bugs.gentoo.org/926872
+
+Linux v6.8-rc1 removed the definitions related to CBQ making tc fail to
+build. Add some #ifdefs to handle this missing support.
+
+Signed-off-by: Un1q32 <joey.t.reinhart@gmail.com>
+
+--- a/networking/tc.c
++++ b/networking/tc.c
+@@ -231,6 +231,13 @@
+ 	return 0;
+ }
+ #endif
++
++#ifndef TCA_CBQ_MAX
++/*
++ * Linux v6.8-rc1~131^2~60^2^2 removed the uapi definitions for CBQ.
++ * See <A HREF="https://git.kernel.org/linus/33241dca48626">https://git.kernel.org/linus/33241dca48626</A>
++ */
++#else
+ static int cbq_print_opt(struct rtattr *opt)
+ {
+ 	struct rtattr *tb[TCA_CBQ_MAX+1];
+@@ -322,6 +329,7 @@
+  done:
+ 	return 0;
+ }
++#endif
+ 
+ static FAST_FUNC int print_qdisc(
+ 		const struct sockaddr_nl *who UNUSED_PARAM,
+@@ -372,8 +380,10 @@
+ 		int qqq = index_in_strings(_q_, name);
+ 		if (qqq == 0) { /* pfifo_fast aka prio */
+ 			prio_print_opt(tb[TCA_OPTIONS]);
++#ifdef TCA_CBQ_MAX
+ 		} else if (qqq == 1) { /* class based queuing */
+ 			cbq_print_opt(tb[TCA_OPTIONS]);
++#endif
+ 		} else {
+ 			/* don't know how to print options for this qdisc */
+ 			printf("(options for %s)", name);
+@@ -442,9 +452,11 @@
+ 		int qqq = index_in_strings(_q_, name);
+ 		if (qqq == 0) { /* pfifo_fast aka prio */
+ 			/* nothing. */ /*prio_print_opt(tb[TCA_OPTIONS]);*/
++#ifdef TCA_CBQ_MAX
+ 		} else if (qqq == 1) { /* class based queuing */
+ 			/* cbq_print_copt() is identical to cbq_print_opt(). */
+ 			cbq_print_opt(tb[TCA_OPTIONS]);
++#endif
+ 		} else {
+ 			/* don't know how to print options for this class */
+ 			printf("(options for %s)", name);
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
