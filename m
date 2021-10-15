Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8839FC433EF
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 19:40:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 009BD61151
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 19:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 009BD61151
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A17254025C;
	Fri, 15 Oct 2021 19:40:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cvLaB9lhj6t6; Fri, 15 Oct 2021 19:40:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6D4940158;
	Fri, 15 Oct 2021 19:40:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4BA661BF41F
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 19:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4665E40158
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 19:40:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bCqmIVEj0sUv for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 19:40:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3D972400DE
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 19:40:31 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id r18so28255188wrg.6
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 12:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j0M95v/WQT2kTAW9frY/PYc0SVe0DTpRZEv9XSNNFcQ=;
 b=A4qS0uGQM8e5a390FzYHk8j6RT77UPsIW6ellO7jyvg3DeKrfRhYw44NPYMPSWt0tC
 b1raQ+z0A7KQYJ4RlqGn5190172xaYUeK5/bpBydqXezgDH104gkH3lkZkJH5NXwFdwk
 EACiiOu4bql3fjU9GGnp/R7tczaSCa5qn5JjKIHmWv1sx7TrpIkgC0g2TNZr1cdng+2i
 AAjhKpXFRsfXrnQ4rZYkQnlZ1wWCfjNoek9RKLkRcnRakUOQUGJ9HjJAFNsk6uXh2jIX
 g6IcVwiL93OMtWyd1aB79SbsW4cMDKZWbb0h5p09nj2uJEahkBNaCe0AakP85wEgLudR
 KBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j0M95v/WQT2kTAW9frY/PYc0SVe0DTpRZEv9XSNNFcQ=;
 b=c07D7G14W1svGtPFoEU+Wnn5zGfDHEjBODKCLXI9UtthXuTdH6zERHMZp9apNu5VYV
 xndddGAGr+X0V2Y4u6ry4u49OWSTOEEj6TRYotviDlWhdTrWtptXjhfhTlWnH7lph93E
 YHVu3kRcjQWYfW6NQkDCIBnPiorI+81n6oWg6VUvo7ZAn3VC+6LQ0jefahJqAWlU8S8f
 JfDSY85qiHw6x7J/P7uqGO46cFItFhBbIW+0rygWQShqeJqer2KtNR/n/SUmy5dzC8iy
 jQJZVDpfSzMqTLfg6gYdXCzd3y04FIUsZJf1zIHiRQFIdvEePuYzEIaMuDpOTKE1nKL8
 AxUQ==
X-Gm-Message-State: AOAM530HGql4TL3tpnhTG5P+nSNETav2zJyIBJ2UTPNqQ4+tal2teQAj
 jaoCV0F06tcXnXQ/nqDzAbpC/4SkbmQ=
X-Google-Smtp-Source: ABdhPJx0xhTxt0bdvrlSyKI6DL5nQyTOufygKjNvkYAsk7ZAXNVyKMfk235x+FEt7Y6HYfPYosp9Tg==
X-Received: by 2002:a5d:598a:: with SMTP id n10mr16721506wri.81.1634326829085; 
 Fri, 15 Oct 2021 12:40:29 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id x21sm11223829wmc.14.2021.10.15.12.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 12:40:28 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 15 Oct 2021 21:38:58 +0200
Message-Id: <20211015193901.1543587-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/4] package/python-ujson: fix or1k build
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the follownig build failure on or1k since bump to version 4.1.0 in
commit a47f332a20bf3f79ef4903c8ddd2b7917217e354 and
https://github.com/ultrajson/ultrajson/commit/eb7d894f225bb89d269188ba6ec559b914a71b8a:

In file included from ./deps/double-conversion/double-conversion/bignum-dtoa.h:31,
                 from ./deps/double-conversion/double-conversion/bignum-dtoa.cc:30:
./deps/double-conversion/double-conversion/utils.h:92:2: error: #error Target architecture was not detected as supported by Double-Conversion.
   92 | #error Target architecture was not detected as supported by Double-Conversion.
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/a82f794f130b0c8d5d626c507bae2e22d15f801b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...for-aarch64_be-or1k-and-microblazebe.patch | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/python-ujson/0001-Add-support-for-aarch64_be-or1k-and-microblazebe.patch

diff --git a/package/python-ujson/0001-Add-support-for-aarch64_be-or1k-and-microblazebe.patch b/package/python-ujson/0001-Add-support-for-aarch64_be-or1k-and-microblazebe.patch
new file mode 100644
index 0000000000..b43eb54dcd
--- /dev/null
+++ b/package/python-ujson/0001-Add-support-for-aarch64_be-or1k-and-microblazebe.patch
@@ -0,0 +1,30 @@
+From 768a445f0c28311bf88685bf0bb990505c12fd4c Mon Sep 17 00:00:00 2001
+From: Florian Loitsch <florian@loitsch.com>
+Date: Sat, 8 Sep 2018 18:18:15 +0200
+Subject: [PATCH] Add support for aarch64_be, or1k and microblazebe.
+
+Fixes #73.
+
+[Retrieved from:
+https://github.com/google/double-conversion/commit/768a445f0c28311bf88685bf0bb990505c12fd4c]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ double-conversion/utils.h | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/deps/double-conversion/ouble-conversion/utils.h b/deps/double-conversion/double-conversion/utils.h
+index 98a2a11..492bc97 100644
+--- a/deps/double-conversion/double-conversion/utils.h
++++ b/deps/double-conversion/double-conversion/utils.h
+@@ -76,8 +76,9 @@ inline void abort_noreturn() { abort(); }
+     defined(__sparc__) || defined(__sparc) || defined(__s390__) || \
+     defined(__SH4__) || defined(__alpha__) || \
+     defined(_MIPS_ARCH_MIPS32R2) || \
+-    defined(__AARCH64EL__) || defined(__aarch64__) || \
+-    defined(__riscv)
++    defined(__AARCH64EL__) || defined(__aarch64__) || defined(__AARCH64EB__) || \
++    defined(__riscv) || \
++    defined(__or1k__)
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
+ #elif defined(__mc68000__) || \
+     defined(__pnacl__) || defined(__native_client__)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
