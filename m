Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E189ACF9C5B
	for <buildroot@archiver.kernel.org>; Mon, 23 Sep 2024 05:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA74060665;
	Mon, 23 Sep 2024 05:46:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RTvTYKu766Gz; Mon, 23 Sep 2024 05:46:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A17B460670
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A17B460670;
	Mon, 23 Sep 2024 05:46:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1CACF1BF5AD
 for <buildroot@lists.busybox.net>; Mon, 23 Sep 2024 05:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C44A80D77
 for <buildroot@lists.busybox.net>; Mon, 23 Sep 2024 05:46:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tgggz4hPuDux for <buildroot@lists.busybox.net>;
 Mon, 23 Sep 2024 05:46:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DFE9580D6F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFE9580D6F
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DFE9580D6F
 for <buildroot@buildroot.org>; Mon, 23 Sep 2024 05:46:37 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a8d3cde1103so243990166b.2
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 22:46:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727070395; x=1727675195;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uC0NinD4RAR+J93t1HtcJ+2f1Uv5sU6KbDnUAU/qnrE=;
 b=r73W3UxJTEztZp7YppRJqFNgzv3zWuZC1iUu+F+ivvywx8aQ9w5/6hMzjqI12HW2ps
 LXw01SFFlVJ/xpKFLJ45kMpgNfEUbxkgzj8DV5h06KyH4Yz0JUAGIMu/GugfyD3RcmxS
 Uqlm2oHqH79015++PyGaosYosoSHcLuq+XygDU01F5suZCC/QQKXdm/KLyDsX03YpuMZ
 3CleTsugv3LG8XEHIv1znZADsWF3RkEj+rSTFfJh55PGa3AvL86jeqN5Lm7LjLGk0HCZ
 iImodv8KKgTEkSDGu/iihZ8Pf756T1Ml2LoEN+DywDVLQWYhc8r4xfyu4ckbLlYNgAOK
 ztow==
X-Gm-Message-State: AOJu0Yyzvm2RYtHmnxTlHueRKV0IJGgVkV1PppmtFVIuNeoDQCl0MFWm
 D1tt7qfCbd3kqCVxZ1XWI+iVkRpMVy+cdJWiQ1btUU6IP1/6T2yoEi1OFXHNwVmvKWvP0ilBYS5
 xlM4=
X-Google-Smtp-Source: AGHT+IEiVzupRw+IrS7NCk3lA7H1drXqXLlDC2h5U/Qt3Ft44dnAJJd51fpjEk1KWnoTDGjZEXwWSw==
X-Received: by 2002:a17:906:d247:b0:a86:ab84:7fc1 with SMTP id
 a640c23a62f3a-a90d580486cmr1036885466b.50.1727070395521; 
 Sun, 22 Sep 2024 22:46:35 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-20-102-52.retail.telecomitalia.it. [79.20.102.52])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612b39a2sm1157706566b.106.2024.09.22.22.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 22:46:34 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 23 Sep 2024 07:46:25 +0200
Message-ID: <20240923054626.2911036-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1727070395; x=1727675195;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uC0NinD4RAR+J93t1HtcJ+2f1Uv5sU6KbDnUAU/qnrE=;
 b=C85bsC5Fbk1tGoCbfA1zQYVvfDJCiWNLzCOhEpgq5wcV3ITs91r4nPxcH0zjIjAPLj
 2Q4X05DwwEbLAJCUnXpLlJ8g5kGqK0b2I4ySLx+uALDY9v+w1y0dk4ryIuBzmHAUsB+S
 OAR9nvE7+w5txCi3TJNrQXJ7AwVNfw0nI/lVw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=C85bsC5F
Subject: [Buildroot] [PATCH v3 1/2] package/iproute2: fix building error
 using designated initializers
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
No changes since v1

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
