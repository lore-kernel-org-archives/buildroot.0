Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C96FC30658
	for <buildroot@archiver.kernel.org>; Fri,  5 Jul 2024 06:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5019D80BD6;
	Fri,  5 Jul 2024 06:09:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q51Np6swX7Hd; Fri,  5 Jul 2024 06:09:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 463A280CAD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 463A280CAD;
	Fri,  5 Jul 2024 06:09:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E60931BF215
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 06:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2131406F3
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 06:09:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ir7H4jppwb8K for <buildroot@lists.busybox.net>;
 Fri,  5 Jul 2024 06:09:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 24051406EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24051406EC
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 24051406EC
 for <buildroot@buildroot.org>; Fri,  5 Jul 2024 06:09:27 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2ee77db6f97so17530821fa.2
 for <buildroot@buildroot.org>; Thu, 04 Jul 2024 23:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720159765; x=1720764565;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9ToCL6NzR0aZa6eWkhSkanZq0H5/6mvlgxIhxa2ZcFg=;
 b=fL2RLNwzoQVZSw3IQ8BW5IIYAA0Pjt0MjywqhXvsV9p5Spoa966YTxb2R2Oj1uL81h
 0vGB1Tn11NQYQR0BzczF/xtVBFUqAwn85r/X7WdGnfn591i23kInGlzS5pL8nug++4mn
 txqzS5pMZb5KkOjZzZLY8OIEcVhmqJU46EYd0u41aK90Qvsd+yvJqy0Nk1JJdPhcmK5P
 S4LuqV1TpwHcI8lyWU66cyVi7xcrHySG8NbhVH68CUkcJngPq+D8PXl/cuxDecXotriX
 WMnZqZUmHyOtk29xlSlI18nHASew+QN0OEEhYIPJmpiW/PxCrlxVM3VkYTniUnO+Lj5N
 o2wQ==
X-Gm-Message-State: AOJu0YzjORiEhqErjA/xsow8RxlMGznoMJqkIiv9jV2J3xDnQRYMGC7d
 fCT3SD9rkAISacOE68b0ZjiOAIeVRYvh38TFdxpSZcUrpREnfP+lACbGuhG4
X-Google-Smtp-Source: AGHT+IEDXi03lXsh4GNKTifXNw2ROmp+rr6+enFjxHXepeJXo3iTBS75swWwb7h5KxbptiNSmBwrrA==
X-Received: by 2002:a2e:a605:0:b0:2ee:7d6d:2ce3 with SMTP id
 38308e7fff4ca-2ee8ed904a4mr25483331fa.13.1720159764748; 
 Thu, 04 Jul 2024 23:09:24 -0700 (PDT)
Received: from gimli.lan ([2001:9b0:214:3500::e19])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee789563c4sm10114351fa.81.2024.07.04.23.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 23:09:24 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  5 Jul 2024 08:09:05 +0200
Message-Id: <20240705060905.3670541-2-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240705060905.3670541-1-troglobit@gmail.com>
References: <20240705060905.3670541-1-troglobit@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720159765; x=1720764565; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9ToCL6NzR0aZa6eWkhSkanZq0H5/6mvlgxIhxa2ZcFg=;
 b=XLfBV0BEoXzpixWJfJYU96MCtBP59TueOMkOAW6H+hncZEFekVdLA9LsGNTRXHmH8d
 fOpUQPuP96bADHlvEjiaeLmH7UE7L0hioj1nFtoGKS7uMIDmSJpPb04p8DhLQdC4fve0
 wYCC/pBHXolpW5MNntiV4Ta4yXal9wl/4TIzGvp/VqeKshDAnXFp1Ac20xj3fvgZzZ3l
 rIFOHdeWEcdbgrFI+7ycfUwAo8Kvo6/VkaEp6uAHWuGShCiLAZ2YEhDLSp6HaBE8P/A1
 lNMcMeFl0m23GHK/gD6Roq68jMwiYkBCuQ47p+MUiYyUpIjYGFaGZNMKec8UdGtMl31w
 cawQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XLfBV0BE
Subject: [Buildroot] [PATCH 1/1] package/openssh: disable
 async-signal-unsafe code in sshsigdie()
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Import Debian patch[1] for CVE-2024-6387[2].  This disables the unsafe
syslog code path triggered by SIGALARM.

[1] https://salsa.debian.org/ssh-team/openssh/-/blob/master/debian/patches/sshsigdie-async-signal-unsafe.patch
[2] https://marc.info/?l=oss-security&m=171982335024767

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 .../0001-sshsigdie-async-signal-unsafe.patch  | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/openssh/0001-sshsigdie-async-signal-unsafe.patch

diff --git a/package/openssh/0001-sshsigdie-async-signal-unsafe.patch b/package/openssh/0001-sshsigdie-async-signal-unsafe.patch
new file mode 100644
index 0000000000..2d27ecb9bc
--- /dev/null
+++ b/package/openssh/0001-sshsigdie-async-signal-unsafe.patch
@@ -0,0 +1,41 @@
+From 7f4a743171f9e6b283207d448de6562219774fbf Mon Sep 17 00:00:00 2001
+From: Salvatore Bonaccorso <carnil@debian.org>
+Date: Tue, 25 Jun 2024 12:24:29 +0100
+Subject: Disable async-signal-unsafe code from the sshsigdie() function
+
+Address signal handler race condition: if a client does not authenticate
+within LoginGraceTime seconds (120 by default, 600 in old OpenSSH
+versions), then sshd's SIGALRM handler is called asynchronously, but
+this signal handler calls various functions that are not
+async-signal-safe (for example, syslog()).
+
+This is a regression from CVE-2006-5051 ("Signal handler race condition
+in OpenSSH before 4.4 allows remote attackers to cause a denial of
+service (crash), and possibly execute arbitrary code")
+
+Signed-off-by: Salvatore Bonaccorso <carnil@debian.org>
+
+Patch-Name: sshsigdie-async-signal-unsafe.patch
+---
+ log.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/log.c b/log.c
+index 6a8b1fc4a..57256660f 100644
+--- a/log.c
++++ b/log.c
+@@ -452,12 +452,14 @@ void
+ sshsigdie(const char *file, const char *func, int line, int showfunc,
+     LogLevel level, const char *suffix, const char *fmt, ...)
+ {
++#if 0
+ 	va_list args;
+ 
+ 	va_start(args, fmt);
+ 	sshlogv(file, func, line, showfunc, SYSLOG_LEVEL_FATAL,
+ 	    suffix, fmt, args);
+ 	va_end(args);
++#endif
+ 	_exit(1);
+ }
+ 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
