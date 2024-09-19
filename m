Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F26CF3942
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 14:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE8764281F;
	Thu, 19 Sep 2024 14:01:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5cXEq1lKZYsj; Thu, 19 Sep 2024 14:01:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AABBB42825
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AABBB42825;
	Thu, 19 Sep 2024 14:01:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E491F1BF97E
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 14:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E04A86123D
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 14:01:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-D0gOukMYsy for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 14:01:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7C2E960D88
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C2E960D88
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C2E960D88
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 14:01:19 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5365aa568ceso1167797e87.0
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 07:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726754477; x=1727359277;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oo5Ef0aBpR/zHKSChssAZ6z4DLyGctMXMBQyvvzxsqU=;
 b=Cv1fwcvc2sVK6KNR+fiHH8fqXW2gnVyh5ch6bGoX9rAJSFKpy9KKOBmSHMuxyE/GoM
 Cs0oAZtZYDjD8golJbuOFWSYCBNkuPSI4lFznW9uWadUJgHjVI1VTfR/LWCZDlhDgrh2
 OPpHeX6FGHo8/kqUJnk+TJVcYe3E8cgxnBYHVzhU04tMjq1LP8zTNVHa2NJRUa5J4uuh
 mfir8uPYVKn9mw7kjG3MuR/IZMKMuJ01gbgnl8aScqbApJE2rn8Wy+qgtCgvcfRs+eZv
 5HKPcrtuetz4H1ZlcjSDHb3PFT09uQztqJo2xIRIB1khUwCE59zTTR8Xcebb8S9DapZx
 tiYw==
X-Gm-Message-State: AOJu0YxzQC9v9OIf+Vle2tc8guS/Iq0xIUdac4P4mY4ZWOJ09RpTBEYE
 /l4SOTjk9HI6+CyvZyNkdAlenqCptvYiPxRCKDD+8UvKMx+d4Mefk+lqCXaGoKTshLsi6qpaHoR
 EBsY1qw==
X-Google-Smtp-Source: AGHT+IGA4MYWHR/DcYZ/O7FMhAIGRg4KFAMxv5Py4YNQVX7sddd+Q7dH0iauXi/7tOGKo1LPdIJQPQ==
X-Received: by 2002:a05:6512:3189:b0:533:4785:82ab with SMTP id
 2adb3069b0e04-5367feb9598mr17244380e87.1.1726754476265; 
 Thu, 19 Sep 2024 07:01:16 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 ([79.20.102.52]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f43c7sm724097266b.62.2024.09.19.07.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2024 07:01:15 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 16:01:13 +0200
Message-ID: <20240919140113.17482-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1726754477; x=1727359277;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oo5Ef0aBpR/zHKSChssAZ6z4DLyGctMXMBQyvvzxsqU=;
 b=SabaSkjuuI+Qzd3dox3C9o4qB15f4R1/qpDBgOmK+vy/jas6zG9eGR+zOsEa4Wn90c
 ku5eDd5vr3KjO6a+LdROZPyX2AwuQOZEbaQ0RS5Lbl+xD7A9Xz6L87Zi5e0tJYyODV8H
 Af6bBI95fqiga/NoAikhDw1mbrVWV1IABqO0E=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=SabaSkju
Subject: [Buildroot] [PATCH 1/1] package/iproute2: fix building error using
 designated initializers
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
Cc: Petr Vorel <petr.vorel@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch fixes the following error:

arpd.c:442:17: error: initialization of 'int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
  442 |                 NULL,   0,

The analysis of socket.h [1] containing the msghdr structure shows that
it has been modified with the addition of padding fields, which cause
the compilation error:

struct msghdr {
	void *msg_name;
	socklen_t msg_namelen;
	struct iovec *msg_iov;
#if __LONG_MAX > 0x7fffffff && __BYTE_ORDER == __BIG_ENDIAN
	int __pad1;
#endif
	int msg_iovlen;
#if __LONG_MAX > 0x7fffffff && __BYTE_ORDER == __LITTLE_ENDIAN
	int __pad1;
#endif
	void *msg_control;
#if __LONG_MAX > 0x7fffffff && __BYTE_ORDER == __BIG_ENDIAN
	int __pad2;
#endif
	socklen_t msg_controllen;
#if __LONG_MAX > 0x7fffffff && __BYTE_ORDER == __LITTLE_ENDIAN
	int __pad2;
#endif
	int msg_flags;
};

The use of designated initializers allows the issue to be fixed.

[1] iproute2/host/mips64-buildroot-linux-musl/sysroot/usr/include/sys/socket.h

Fixes:
- http://autobuild.buildroot.org/results/e4cdfa38ae9578992f1c0ff5c4edae3cc0836e3c

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...ted-initializers-for-msghdr-structur.patch | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 package/iproute2/0003-arpd-use-designated-initializers-for-msghdr-structur.patch

diff --git a/package/iproute2/0003-arpd-use-designated-initializers-for-msghdr-structur.patch b/package/iproute2/0003-arpd-use-designated-initializers-for-msghdr-structur.patch
new file mode 100644
index 000000000000..f8b9f7d08877
--- /dev/null
+++ b/package/iproute2/0003-arpd-use-designated-initializers-for-msghdr-structur.patch
@@ -0,0 +1,70 @@
+From 13cea6bb5e4f08f534fa4b04b5fc4ea0c8a2467b Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Wed, 18 Sep 2024 14:22:34 +0200
+Subject: [PATCH] arpd: use designated initializers for msghdr structure
+
+This patch fixes the following error:
+
+arpd.c:442:17: error: initialization of 'int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
+  442 |                 NULL,   0,
+
+raised by Buildroot autobuilder [1].
+
+In the case in question, the analysis of socket.h [2] containing the
+msghdr structure shows that it has been modified with the addition of
+padding fields, which cause the compilation error. The use of designated
+initializers allows the issue to be fixed.
+
+struct msghdr {
+	void *msg_name;
+	socklen_t msg_namelen;
+	struct iovec *msg_iov;
+#if __LONG_MAX > 0x7fffffff && __BYTE_ORDER == __BIG_ENDIAN
+	int __pad1;
+#endif
+	int msg_iovlen;
+#if __LONG_MAX > 0x7fffffff && __BYTE_ORDER == __LITTLE_ENDIAN
+	int __pad1;
+#endif
+	void *msg_control;
+#if __LONG_MAX > 0x7fffffff && __BYTE_ORDER == __BIG_ENDIAN
+	int __pad2;
+#endif
+	socklen_t msg_controllen;
+#if __LONG_MAX > 0x7fffffff && __BYTE_ORDER == __LITTLE_ENDIAN
+	int __pad2;
+#endif
+	int msg_flags;
+};
+
+[1] http://autobuild.buildroot.org/results/e4cdfa38ae9578992f1c0ff5c4edae3cc0836e3c/
+[2] iproute2/host/mips64-buildroot-linux-musl/sysroot/usr/include/sys/socket.h
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://lore.kernel.org/netdev/20240919132454.7394-1-dario.binacchi@amarulasolutions.com/T/#mac98a56b7ce0235a6e2b97afe8aa8565de4c926d
+---
+ misc/arpd.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/misc/arpd.c b/misc/arpd.c
+index e77ef53928a2..b4935c23eebb 100644
+--- a/misc/arpd.c
++++ b/misc/arpd.c
+@@ -437,10 +437,10 @@ static void get_kern_msg(void)
+ 	struct iovec iov;
+ 	char   buf[8192];
+ 	struct msghdr msg = {
+-		(void *)&nladdr, sizeof(nladdr),
+-		&iov,	1,
+-		NULL,	0,
+-		0
++		.msg_name = &nladdr, .msg_namelen = sizeof(nladdr),
++		.msg_iov = &iov, .msg_iovlen = 1,
++		.msg_control = (void *)NULL, .msg_controllen = 0,
++		.msg_flags = 0
+ 	};
+ 
+ 	iov.iov_base = buf;
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
