Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A28BC433F5
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 22:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAB214016D;
	Tue, 18 Jan 2022 22:27:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8tdwD3744orM; Tue, 18 Jan 2022 22:27:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 153C340179;
	Tue, 18 Jan 2022 22:27:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 41CCF1BF399
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 22:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11432408F0
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 22:27:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jXWYa5PD80bB for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 22:27:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3418F40180
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 22:27:05 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id v123so1231448wme.2
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 14:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zDzKRZOe0zrvQbxF23mZMtILeOyGZKzTfBhrMsNbqXQ=;
 b=nFfIRjuL+34UF1uU2q56m21X+GHiAIsYFHeIa1LurpTO0FYISpas9Q3J015S6ug4fx
 oWsj/cWc8ltENhIEtWzYb+lYMwKbI/aC1HBuUdKqVgUxXvk2jmgJHi5EK+BOSV9IEcpa
 d9yHT7jh7rNbHaj29eWJpBSHYKdBGZt3kV/iI//5q+hBytZyF1KWah9vTIrbRpTMthdE
 mTAEwww2WjCviXI15UEm/e6QkXnGzdzWxiBZMaquD95fIjBvjDnv3h0mHuR+HVQGndUh
 rmrNvCivGCBoobpeQdzzAfTLZAASV2AVqmPIW2Fp5k+MghAjVuPYp71Q9SCXnFREYN9U
 Grsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zDzKRZOe0zrvQbxF23mZMtILeOyGZKzTfBhrMsNbqXQ=;
 b=zKp7MfROFRWOHDmP55y3IQGa6Kx9agHcPOzDu+mkuTLsJQpHBzWHGAKeyAh9QtY8/y
 ipqsluZkKRjetqkT87fEk8Sue+m+BBBNBttxOyd8EjQLnj1r9WGfMJrwLswjFxn8p8JY
 rJtH3GvP0iC56pKwT9vYAnfaV/km5CfnS5BaHvyNfcWiENDKV2K+btaCQYoioQtClYTF
 HODo9NQjI4HOhoNVny8nLpUkNShaOwH1xQB5lmgECIl/tl6PcF1dc1rtteajdRabPyrN
 /NI7w1EhjjXDVhwAStiJaGn9vYROMdGIhVCiLJR3cKmqwKg6gJmDr6xoW7XQGS3zOZr2
 NzdA==
X-Gm-Message-State: AOAM5300eLJpIVkOwvHj8K02fXwQsehDBfnFqxYSory32d2/AZaYLbZj
 cHx23dOGt6d3PNigHb8+UH0ke065MYw=
X-Google-Smtp-Source: ABdhPJxA5dr1cPO94XWSUwD9JElKDTBxtlInjm9o7JNJo0R0nJ/6I9mPF2Eff3FHURsXdljt/nlc2g==
X-Received: by 2002:a7b:c5ce:: with SMTP id n14mr599530wmk.11.1642544823309;
 Tue, 18 Jan 2022 14:27:03 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id r15sm3929205wmq.3.2022.01.18.14.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 14:27:02 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 23:24:24 +0100
Message-Id: <20220118222425.164134-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/gcc: define _REENTRANT for OpenRISC
 when -pthread is passed
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Will Newton <will.newton@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Patch added by commit eee96b0f0ad224b3e09a9b98c26d056e18f17fd5 on gcc
9.3.0 must also be applied on gcc 10 and 11 to avoid the following build
failure on numerous packages (babeltrace2, pcsc-lite, tpm2-pkcs11,
etc.):

configure:13774: checking whether pthreads work with -pthread
configure:13868: /home/giuliobenetti/autobuild/run/instance-0/output-1/host/bin/or1k-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2  -std=gnu99 -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c   >&5
conftest.c:27:26: error: #error "_REENTRANT must be defined"
   27 | #                        error "_REENTRANT must be defined"
      |                          ^~~~~

It should be noted that external bootlins will have to be rebuilt.

Fixes:
 - http://autobuild.buildroot.org/results/cb58d4fbaeb08d188c2f8bf05ef1604789fa8766
 - http://autobuild.buildroot.org/results/7af9d4b68bd46ed260ed66ba2cc3c9c21482e741
 - http://autobuild.buildroot.org/results/6f926bec146752873f8032b593f0de1cb222ea46

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...TRANT-for-OpenRISC-when-pthread-is-p.patch | 31 +++++++++++++++++++
 ...TRANT-for-OpenRISC-when-pthread-is-p.patch | 31 +++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 package/gcc/10.3.0/0005-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch
 create mode 100644 package/gcc/11.2.0/0003-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch

diff --git a/package/gcc/10.3.0/0005-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch b/package/gcc/10.3.0/0005-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch
new file mode 100644
index 0000000000..5ac03d7c0c
--- /dev/null
+++ b/package/gcc/10.3.0/0005-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch
@@ -0,0 +1,31 @@
+From f80e9941739fb3973b61fc6a5abddef5ad2faf73 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Fri, 27 Mar 2020 21:23:53 +0100
+Subject: [PATCH] gcc: define _REENTRANT for OpenRISC when -pthread is passed
+
+The detection of pthread support fails on OpenRISC unless _REENTRANT
+is defined. Added the CPP_SPEC definition to correct this.
+
+Patch sent upstream: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94372
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ gcc/config/or1k/linux.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/gcc/config/or1k/linux.h b/gcc/config/or1k/linux.h
+index cbdc781418f..36303af892c 100644
+--- a/gcc/config/or1k/linux.h
++++ b/gcc/config/or1k/linux.h
+@@ -32,6 +32,8 @@
+ #undef MUSL_DYNAMIC_LINKER
+ #define MUSL_DYNAMIC_LINKER  "/lib/ld-musl-or1k.so.1"
+ 
++#define CPP_SPEC "%{pthread:-D_REENTRANT}"
++
+ #undef LINK_SPEC
+ #define LINK_SPEC "%{h*}			\
+    %{static:-Bstatic}				\
+-- 
+2.31.1
+
diff --git a/package/gcc/11.2.0/0003-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch b/package/gcc/11.2.0/0003-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch
new file mode 100644
index 0000000000..5ac03d7c0c
--- /dev/null
+++ b/package/gcc/11.2.0/0003-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch
@@ -0,0 +1,31 @@
+From f80e9941739fb3973b61fc6a5abddef5ad2faf73 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Fri, 27 Mar 2020 21:23:53 +0100
+Subject: [PATCH] gcc: define _REENTRANT for OpenRISC when -pthread is passed
+
+The detection of pthread support fails on OpenRISC unless _REENTRANT
+is defined. Added the CPP_SPEC definition to correct this.
+
+Patch sent upstream: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94372
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ gcc/config/or1k/linux.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/gcc/config/or1k/linux.h b/gcc/config/or1k/linux.h
+index cbdc781418f..36303af892c 100644
+--- a/gcc/config/or1k/linux.h
++++ b/gcc/config/or1k/linux.h
+@@ -32,6 +32,8 @@
+ #undef MUSL_DYNAMIC_LINKER
+ #define MUSL_DYNAMIC_LINKER  "/lib/ld-musl-or1k.so.1"
+ 
++#define CPP_SPEC "%{pthread:-D_REENTRANT}"
++
+ #undef LINK_SPEC
+ #define LINK_SPEC "%{h*}			\
+    %{static:-Bstatic}				\
+-- 
+2.31.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
