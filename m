Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E70D4C433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 10:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CE7440004;
	Sat, 15 Jan 2022 10:18:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BZCOPB5A8lyH; Sat, 15 Jan 2022 10:18:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76D8740569;
	Sat, 15 Jan 2022 10:18:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 340EB1BF95D
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 10:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3080E4054A
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 10:18:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uHFuqEPNvDsM for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 10:18:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 24C464050F
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 10:18:16 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 f141-20020a1c1f93000000b003497aec3f86so10368449wmf.3
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 02:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V2J9+sw0UOzS/rWr+y4lhboPZpaTt/pRLwZWUNK2334=;
 b=jSSJNmWIPCdqRJdUk8g7xLWpjTsjR4U4XKKfeAOpsdXFANSTZPnmgPc4vyc6i4mGfJ
 05R1lmPn2Y+V/fQHQgKKPxqRGndhchQIu3T/MCiuotItaXEfCiLWHCi8SnWk6O0njEQi
 VIzruEGXmOT2g7V7+1twX5UJcI0y82Q+xfbtm2+Ww50hPlPPJjObZ+fwJMC+HL3k7oIh
 INlRGIvXlCRlplJLW0gnyI6KlD+kZYMD0imTUJpasWyDj+8eNfCeNh4Zunxc9hWKcArq
 lgCzSc5X4W6Fb/81v4KfA1I/NqdyokXHvmpNfCaLfP8UcaUSwms8c+qkK8SRGmvpaBG4
 hBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V2J9+sw0UOzS/rWr+y4lhboPZpaTt/pRLwZWUNK2334=;
 b=szrdjTWKNsB1bVIWrPQpL3mPy39vAWj15hJMCKlUvfnRXqU7OeZlZXH/WHfH5+Pybb
 FcbrlMfXHbTgQWXw57Dls0QVWYADuNrM3VSr93B7R0WwI/kCN+0aC3VumVYkPBrBfjvS
 86bO7qiEEryGJhEn1ulZymvPy6SWVp3qMOR9sDJp04UScRHP25BEazi85UjDQT16b8AM
 4e5KKp/fJ+ifaeKIznAq1CA50geUGV6zOMPlu0OIMnjTlGZ3R2QE6ooIXhLO/oUFt3Fn
 xoYDrkUScYAWHhX8pqweNJfeS+bsa0kvFjXkJCsKe2ArvngYyP1GXLrIi7BGuO6pYJdI
 9ecA==
X-Gm-Message-State: AOAM533a40DNtP0Z3oHeS0AAaApgZ10oK2we/LCR9M94kykFY5Kr3EkW
 KG6g8LapSeFCR6vGi6NhC2uuQbn9ch8=
X-Google-Smtp-Source: ABdhPJwkvhaU2UekjScTjfzjJSFK+EevnRd14QWvJrbxndT7rH6QU9azeP504GIaSUsYHqYI3sjXjA==
X-Received: by 2002:a05:6000:1569:: with SMTP id
 9mr1003887wrz.500.1642241894310; 
 Sat, 15 Jan 2022 02:18:14 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id a24sm7770914wrc.114.2022.01.15.02.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 02:18:14 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 11:15:35 +0100
Message-Id: <20220115101535.1699671-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220115101535.1699671-1-fontaine.fabrice@gmail.com>
References: <20220115101535.1699671-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/ghostscript: fix CVE-2021-45949
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ghostscript GhostPDL 9.50 through 9.54.0 has a heap-based buffer
overflow in sampled_data_finish (called from sampled_data_continue and
interp).

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-management-in-sampled_data_continue.patch | 68 +++++++++++++++++++
 package/ghostscript/ghostscript.mk            |  3 +
 2 files changed, 71 insertions(+)
 create mode 100644 package/ghostscript/0004-Bug-703902-Fix-op-stack-management-in-sampled_data_continue.patch

diff --git a/package/ghostscript/0004-Bug-703902-Fix-op-stack-management-in-sampled_data_continue.patch b/package/ghostscript/0004-Bug-703902-Fix-op-stack-management-in-sampled_data_continue.patch
new file mode 100644
index 0000000000..72e07df0ac
--- /dev/null
+++ b/package/ghostscript/0004-Bug-703902-Fix-op-stack-management-in-sampled_data_continue.patch
@@ -0,0 +1,68 @@
+From 2a3129365d3bc0d4a41f107ef175920d1505d1f7 Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Tue, 1 Jun 2021 19:57:16 +0100
+Subject: [PATCH] Bug 703902: Fix op stack management in
+ sampled_data_continue()
+
+Replace pop() (which does no checking, and doesn't handle stack extension
+blocks) with ref_stack_pop() which does do all that.
+
+We still use pop() in one case (it's faster), but we have to later use
+ref_stack_pop() before calling sampled_data_sample() which also accesses the
+op stack.
+
+Fixes:
+https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=34675
+
+[Retrieved from:
+https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=2a3129365d3bc0d4a41f107ef175920d1505d1f7]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ psi/zfsample.c | 16 ++++++++++------
+ 1 file changed, 10 insertions(+), 6 deletions(-)
+
+diff --git a/psi/zfsample.c b/psi/zfsample.c
+index 0e8e4bc8d..00cd0cfdd 100644
+--- a/psi/zfsample.c
++++ b/psi/zfsample.c
+@@ -533,15 +533,19 @@ sampled_data_continue(i_ctx_t *i_ctx_p)
+         for (j = 0; j < bps; j++)
+             data_ptr[bps * i + j] = (byte)(cv >> ((bps - 1 - j) * 8));	/* MSB first */
+     }
+-    pop(num_out);		    /* Move op to base of result values */
+ 
+-    /* Check if we are done collecting data. */
++    pop(num_out); /* Move op to base of result values */
+ 
++    /* From here on, we have to use ref_stack_pop() rather than pop()
++       so that it handles stack extension blocks properly, before calling
++       sampled_data_sample() which also uses the op stack.
++     */
++    /* Check if we are done collecting data. */
+     if (increment_cube_indexes(params, penum->indexes)) {
+         if (stack_depth_adjust == 0)
+-            pop(O_STACK_PAD);	    /* Remove spare stack space */
++            ref_stack_pop(&o_stack, O_STACK_PAD);	    /* Remove spare stack space */
+         else
+-            pop(stack_depth_adjust - num_out);
++            ref_stack_pop(&o_stack, stack_depth_adjust - num_out);
+         /* Execute the closing procedure, if given */
+         code = 0;
+         if (esp_finish_proc != 0)
+@@ -554,11 +558,11 @@ sampled_data_continue(i_ctx_t *i_ctx_p)
+             if ((O_STACK_PAD - stack_depth_adjust) < 0) {
+                 stack_depth_adjust = -(O_STACK_PAD - stack_depth_adjust);
+                 check_op(stack_depth_adjust);
+-                pop(stack_depth_adjust);
++                ref_stack_pop(&o_stack, stack_depth_adjust);
+             }
+             else {
+                 check_ostack(O_STACK_PAD - stack_depth_adjust);
+-                push(O_STACK_PAD - stack_depth_adjust);
++                ref_stack_push(&o_stack, O_STACK_PAD - stack_depth_adjust);
+                 for (i=0;i<O_STACK_PAD - stack_depth_adjust;i++)
+                     make_null(op - i);
+             }
+-- 
+2.25.1
+
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index 91871728ba..9e13f29fe9 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -27,6 +27,9 @@ GHOSTSCRIPT_IGNORE_CVES += CVE-2021-3781
 # 0003-oss-fuzz-30715-Check-stack-limits-after-function-evaluation.patch
 GHOSTSCRIPT_IGNORE_CVES += CVE-2021-45944
 
+# 0004-Bug-703902-Fix-op-stack-management-in-sampled_data_continue.patch
+GHOSTSCRIPT_IGNORE_CVES += CVE-2021-45949
+
 # Ghostscript includes (old) copies of several libraries, delete them.
 # Inspired by linuxfromscratch:
 # http://www.linuxfromscratch.org/blfs/view/svn/pst/gs.html
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
