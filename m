Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80325C433FE
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 14:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24B9441755;
	Thu, 10 Mar 2022 14:04:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WTSOw3o2b1G4; Thu, 10 Mar 2022 14:04:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C8034027A;
	Thu, 10 Mar 2022 14:04:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CED091BF386
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 14:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA982812F3
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 14:04:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=metanate.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8fLRERKqkzoD for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 14:04:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E63C5812D0
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 14:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=metanate.com; s=stronger; h=Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Content-Type:Reply-To:Content-ID:Content-Description:
 In-Reply-To:References; bh=H3mNa7b/9JJ/GwGdheD8UxdgkDx3eDi6zb4unElF8cY=; b=tY
 MTPPKvTYidrPl3t/4cQIsyFogZNgedfWULe8eRaNXLdm/jyone0iPeFwIZkCBUftGFe8C1goFHYXc
 cybuWT4Y2TmzfE846y/VNSmXRm2tlHDZhpqbFykQRXJE+tu6CFhQuv7F8k8vasfAm8z5UqTl4H69t
 I/zGqbFJXR5rUl1uJ7G3az7UYy1xLHWtc1Ht2h1aG/ephHXhKcVGUaqSwMlVafEqWvTkw1vHryAUk
 NTZQwmJod4/5BERqHNMzqjOj+bykt/m7X9rRUF7cy21S3ZI9jkB9qC0YVUeFRHhX1x8qi+iefIk2Y
 0EuEVNei5NtinNZF0DUw83qLQB+KZUcA==;
Received: from [81.174.171.191] (helo=donbot.metanate.com)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <john@metanate.com>)
 id 1nSJOW-0005A9-NK; Thu, 10 Mar 2022 14:03:56 +0000
From: John Keeping <john@metanate.com>
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 14:03:50 +0000
Message-Id: <20220310140350.1955655-1-john@metanate.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Authenticated: YES
Subject: [Buildroot] [PATCH] package/openssh: backport upstream fix for
 32-bit
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
Cc: John Keeping <john@metanate.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

sshd is broken on 32-bit systems because ppoll_time64 is used by the
application although it is not allowed by the seccomp filter.

Apply the upstream patch to fix this.

Signed-off-by: John Keeping <john@metanate.com>
---
 ...llow-ppoll_time64-in-seccomp-sandbox.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/openssh/0001-Allow-ppoll_time64-in-seccomp-sandbox.patch

diff --git a/package/openssh/0001-Allow-ppoll_time64-in-seccomp-sandbox.patch b/package/openssh/0001-Allow-ppoll_time64-in-seccomp-sandbox.patch
new file mode 100644
index 0000000000..34b309bd9a
--- /dev/null
+++ b/package/openssh/0001-Allow-ppoll_time64-in-seccomp-sandbox.patch
@@ -0,0 +1,31 @@
+From 284b6e5394652d519e31782e3b3cdfd7b21d1a81 Mon Sep 17 00:00:00 2001
+From: Darren Tucker <dtucker@dtucker.net>
+Date: Sat, 26 Feb 2022 14:06:14 +1100
+Subject: [PATCH] Allow ppoll_time64 in seccomp sandbox.
+
+Should fix sandbox violations on (some? at least i386 and armhf) 32bit
+Linux platforms.  Patch from chutzpahu at gentoo.org and cjwatson at
+debian.org via bz#3396.
+
+Signed-off-by: John Keeping <john@metanate.com>
+---
+ sandbox-seccomp-filter.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/sandbox-seccomp-filter.c b/sandbox-seccomp-filter.c
+index 2e065ba3..4ce80cb2 100644
+--- a/sandbox-seccomp-filter.c
++++ b/sandbox-seccomp-filter.c
+@@ -276,6 +276,9 @@ static const struct sock_filter preauth_insns[] = {
+ #ifdef __NR_ppoll
+ 	SC_ALLOW(__NR_ppoll),
+ #endif
++#ifdef __NR_ppoll_time64
++	SC_ALLOW(__NR_ppoll_time64),
++#endif
+ #ifdef __NR_poll
+ 	SC_ALLOW(__NR_poll),
+ #endif
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
