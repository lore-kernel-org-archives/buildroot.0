Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26CCBC4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:13:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBF4A60E96
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CBF4A60E96
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82A0C402CA;
	Sun,  8 Aug 2021 19:13:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5M4_FhtfInK9; Sun,  8 Aug 2021 19:13:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB4CF4025B;
	Sun,  8 Aug 2021 19:13:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 95A8A1BF97E
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81564606D0
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:13:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LzkI9lKxmVdp for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 19:13:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 63477606AF
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 19:13:02 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id z4so18442288wrv.11
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 12:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UpcVS4DLSBEyHqYUtUsPsEqaXySJMtuuMFnFkMop9VQ=;
 b=if2Bpuu71F4YRASqMJiqTxfwIuRlC6o2S6VUQVz/+MKw80fnaclBCzu+4JDWBdaSdm
 +G3jd+7n4bGfBAoNZjFJfxWYboPxHP7QJ35+RRrfEf9bRMZa2wungysBa2e8yWHZN4OE
 0Dz2tb10BzrxcrKkemakUpHUK1M2r8n1qT/64frOjbeSbRuhUX5CSJFkCOnLI0aKNLs5
 Sh8hbIbaFDNYS8uWKPsY/XOnggOzDHbxw0mxxoIQqquohgeyoCEbJUr81AuHeXfvgsTC
 KlS+Oyr33T5WrR5W6sb6hO64xoGl0kIRYu6JvUNQnYdb+62szMzXeH8b6xi4rqV7eCg/
 mVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UpcVS4DLSBEyHqYUtUsPsEqaXySJMtuuMFnFkMop9VQ=;
 b=EdgPJbkI9UN5CzqNbOAgcfh5CNdoj9N64m27yNH38BkgEuH8+DnlSddp4GgRsKx4yT
 lHp98aeqRfZaxZTUsnbo7kyf3oxBA9mGldkDZ0gcAlBpODaQW7mmRz6VpHZzjvXeJNy9
 r/QR3q/yacjdjBfXui+p/dRQ6HIHelaxrTPQxAs9HRGGV2THknvRjoWPncsRMwPsVQje
 9ve5mpoKg7MZRGaWV0lvJCeCa4i1tfMdt/A6YsqRBt2/tedzJJemF/Qw4hGuyipRoaxf
 THTpzfEu8bM7Ct1vOmYOMMBDHHJHyVj4s6FxAdzO/MlRI6g2GnfajZ/Jfg3N4lFwBMQW
 vEGw==
X-Gm-Message-State: AOAM531m4RhAAVfvSaBmkrdDTMPijaL2TCPcL1Chc9WV0/+Ja14Bp3jy
 xcfvDINLxZ+WuYxFCBqfo3gsqrvVFsqHvA==
X-Google-Smtp-Source: ABdhPJzi2BMqp3F5q1klUm1IjluVaes8vvWvcf7hnM72+qf/WxVg7j0F1EZVDVooZHO0umxsVXj6uQ==
X-Received: by 2002:a5d:6186:: with SMTP id j6mr21744682wru.115.1628449980387; 
 Sun, 08 Aug 2021 12:13:00 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id e3sm17330306wrv.65.2021.08.08.12.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 12:13:00 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Aug 2021 21:12:48 +0200
Message-Id: <20210808191248.3837136-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/poke: fix build with uclibc-ng <
 1.0.35
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the folllowing build failure with uclibc-ng which is raised since
activation of uclibc-ng in commit
a4dc754178b7c24ed129e7e6f8effd555249c941:

In file included from ./sys/random.h:40,
                 from getrandom.c:22:
/tmp/instance-0/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:27:35: error: unknown type name 'size_t'
   27 | extern int getrandom(void *__buf, size_t count, unsigned int flags)
      |                                   ^~~~~~
/tmp/instance-0/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:8:1: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
    7 | #include <features.h>
  +++ |+#include <stddef.h>
    8 |

Fixes:
 - http://autobuild.buildroot.org/results/30105094e39374ec6d4e47e2fb5e99696f7f7981

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...andom.c-fix-build-with-uclibc-1.0.35.patch | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 package/poke/0004-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch

diff --git a/package/poke/0004-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch b/package/poke/0004-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
new file mode 100644
index 0000000000..757dc3f760
--- /dev/null
+++ b/package/poke/0004-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
@@ -0,0 +1,72 @@
+From a0594387565e1e6b4a8a8ba04ad13b135cc1f0b5 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 1 Apr 2021 07:49:46 +0200
+Subject: [PATCH] lib/getrandom.c: fix build with uclibc < 1.0.35
+
+Fix the following build failure with uclibc < 1.0.35 which is raised
+since the addition of getrandom module in
+https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=682cc4e678aceff32dea2a84b6e5147bdf5a20a7:
+
+In file included from ./sys/random.h:40,
+                 from getrandom.c:22:
+/tmp/instance-0/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:27:35: error: unknown type name 'size_t'
+   27 | extern int getrandom(void *__buf, size_t count, unsigned int flags)
+      |                                   ^~~~~~
+/tmp/instance-0/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:8:1: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
+    7 | #include <features.h>
+  +++ |+#include <stddef.h>
+    8 | 
+
+This patch is not upstreamable as it is only a workaround for
+uclibc < 1.0.35, upstream uclibc has been patched with
+https://github.com/wbx-github/uclibc-ng/commit/00972c02c2b6e0a95d5def4a71bdfb188e091782
+
+Fixes:
+ - http://autobuild.buildroot.org/results/30105094e39374ec6d4e47e2fb5e99696f7f7981
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ jitter/gnulib-local/getrandom.c | 1 +
+ gl/getrandom.c                  | 1 +
+ gl-libpoke/getrandom.c          | 1 +
+ 3 files changed, 3 insertions(+)
+
+diff --git a/jitter/gnulib-local/getrandom.c b/jitter/gnulib-local/getrandom.c
+index 41212fb32..0ad3f9648 100644
+--- a/jitter/gnulib-local/getrandom.c
++++ b/jitter/gnulib-local/getrandom.c
+@@ -19,6 +19,7 @@
+ 
+ #include <config.h>
+ 
++#include <stddef.h>
+ #include <sys/random.h>
+ 
+ #include <errno.h>
+diff --git a/gl/getrandom.c b/gl/getrandom.c
+index 41212fb32..0ad3f9648 100644
+--- a/gl/getrandom.c
++++ b/gl/getrandom.c
+@@ -19,6 +19,7 @@
+ 
+ #include <config.h>
+ 
++#include <stddef.h>
+ #include <sys/random.h>
+ 
+ #include <errno.h>
+diff --git a/gl-libpoke/getrandom.c b/gl-libpoke/getrandom.c
+index 41212fb32..0ad3f9648 100644
+--- a/gl-libpoke/getrandom.c
++++ b/gl-libpoke/getrandom.c
+@@ -19,6 +19,7 @@
+ 
+ #include <config.h>
+ 
++#include <stddef.h>
+ #include <sys/random.h>
+ 
+ #include <errno.h>
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
