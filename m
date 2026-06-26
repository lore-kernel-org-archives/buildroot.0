Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BB3CDE013
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 09:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27A1440E12;
	Fri, 26 Jun 2026 09:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id syIjmSXajA5T; Fri, 26 Jun 2026 09:57:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CD5040E4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782467858;
	bh=5sbtCMG7aYv7AacJB2Os/Gp1jhaSwAqoN9QoGGlX650=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=b4ixZVZfJORQA3lgEZUiuElD+em6Hdw8KavjoA2PxU/oSblcQrjOUHuRuGDVqBl1r
	 OYDudEZTZueima2NNhunCzGvUZ2JY4SgUNkGONHXUtNJA8w2seEZAvicA3t/cfdMlU
	 W4T8+0dY6f+xnjQlPFT+YvOl/OtMD7Wg8x3G4NyYYm7ChmxcTm/W7rqX6qSsRziITL
	 x8O3lgRItvyrY6XW9bCgCFxroYw0EaodwTFUAXif6cRV4EE6lTkQjJWlL2GPbfyAew
	 hdEdGdK6x9UfJ51EBPHYh6nRT9F2Q0RwaGb9n6jlaNgbyHMIw2a/RfTZgGB4T/YZVI
	 EhlEQZsIK5+Uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CD5040E4B;
	Fri, 26 Jun 2026 09:57:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 382C63A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 09:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E4F560EB6
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 09:57:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lTTFhHU8mtFv for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 09:57:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0991F60EC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0991F60EC6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0991F60EC6
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 09:57:29 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-49263703c6eso7297245e9.0
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 02:57:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782467848; x=1783072648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pbb2MHMlP1IoI3yuBbBzx6aQnD6tqNcMi46D09rfydw=;
 b=WZZ4GtjRbMd0yhFpJjVyfEU/46Fiar6wu6ZdrMn86d5V+/RGv5gwPwX3c0COxFDsiB
 pwMdS0KgCRje8c5lJQwGpPgOrA3ZY5xL5HIR0RcvajgttKwlazqD1K8/dO56/20igv+f
 8MIdI44kHCwVwG7/uJMaCFRRIeajUwKwH2pGgsX/ZbaPpJvkMnAFL63GsuzSTda/d/6N
 U/Z8JqN1KnplZsvCFXvLmMa4bZKQgCWUV4Kr0Hcy2tQSjf7uBQwAjcn+VFpl1/6oiT3k
 wi2urqsKcWBFw3ZZqRGr9o00rO+RkuZ1kpixuI42NfGU/K7zbhnhqg5M6zrBPpnuDgr5
 LU7w==
X-Gm-Message-State: AOJu0YycMJ3NxWo6jFAwUmudXJO8rOd2Tb5zy60X5rC0LktfUBsj3ie5
 8wloKqMSMC6Jq+iiOwngomBKCC5QuYWAB3VcgGYqnhL7LRss/o+OLAx4p4UsXpT+Dmvun8XEhgg
 VPnJc
X-Gm-Gg: AfdE7clP77hsHW1fwjLF16ZUp7aLhtK71G5rK7kdHAu7w/6va/US5H0Pb4mC/trEE1Y
 XhCSQY0/7qALFtB/E0NV4KsJiI2qi1cEvj2xubGs+70K1/OSLsURvVEpAHGqHEcBH7X/bdYI6DO
 V3kUIKa9jk/KaneGgK0+nFwMjue4pH7CbrXCoiRjxsobmJRedhRc/3QRONOTfbSLi1Q+HP0rUwy
 SIPffZFWcOBMTIBcSfQ0E1BK87O9hwCb6FQbJZp5w9Z5lyAu6RI5bKRhGfh1kpCtrKywIUqgg/K
 I3L2KmsUIkQt8FPwU4G3BhfVmSuOKZ9aXFzz0q1EWLortNAfV0yZBH/zkA8YfD9CEt995IALkk/
 x4OsgyOV4NRfE1fHqP9m/vp1Si8Ej/rBmmxbxtPjpYefptEo6AzK+Uh/NawVYCBlozxGXkh9eKq
 SpbgFmqfDhgl0lo5I=
X-Received: by 2002:a05:600c:c4aa:b0:492:3445:ecf8 with SMTP id
 5b1f17b1804b1-4926685fe2dmr87075385e9.3.1782467847959; 
 Fri, 26 Jun 2026 02:57:27 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492691f60bcsm68222045e9.1.2026.06.26.02.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 02:57:27 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 26 Jun 2026 11:57:22 +0200
Message-ID: <20260626095724.248205-5-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260626095724.248205-1-thomas.perale@mind.be>
References: <20260626095724.248205-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782467848; x=1783072648; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pbb2MHMlP1IoI3yuBbBzx6aQnD6tqNcMi46D09rfydw=;
 b=M8UvNNOM3zYX7uol+ybqWKLYOuV1U1CsvJxV9qZGCcCnDlNN03b/W1/KNqzx4mYxXn
 tHTcd0038YWQ5OI12uie+TC6fYaIs6M4R/e43+oUCdFd7jEV8TfGO+hSfl7yVnAwMCiG
 Ch7duPJL/vaNpD1CGGEuD28uQXOLw/MXClP/oTgX0NIPuh9Vat18cUPvS9QD25NNZagU
 u3sLClwWoZAr1p8UC9ogyGoLUz7etSGKr0JwPYCftb3LRNajZliUIvR5mguqPBj9WZ19
 hk2XMqDEBoPzhc+BpCAZ/6Mgu+XugWO0JtVCazDaPbMDOoaCPFa7Eu2HtLhOzmkMb7rY
 I+Vw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=M8UvNNOM
Subject: [Buildroot] [PATCH 2025.02.x 5/5] package/util-linux: backport
 patch CVE-2026-53614
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- CVE-2026-53614
    The SUID binary /usr/bin/mount from util-linux trusts the
    environment variable LIBMOUNT_FORCE_MOUNT2 via a raw getenv() call
    in libmount/src/hook_mount.c. An unprivileged user can set
    LIBMOUNT_FORCE_MOUNT2=always to force the mount process to use the
    legacy (non-atomic) bind mount path instead of the secure new mount
    API path.

    In the legacy path, a bind mount is performed in two separate
    syscalls: first mount(src, tgt, MS_BIND) which exposes the source
    directory without security flags, then mount(tgt,
    MS_REMOUNT|MS_BIND|MS_NOSUID|MS_NOEXEC|MS_NODEV) which applies the
    flags. Between these two syscalls, a brief window exists where the
    bind-mounted directory is visible without nosuid/noexec protection.
    A concurrent process can execute a SUID binary from the bind target
    during this window.

For more information, see:
 - https://github.com/util-linux/util-linux/security/advisories/GHSA-67r7-8m5w-22wx
 - https://github.com/util-linux/util-linux/commit/cc81bbcec598cb91f0eb8456282f33eed820ed5f

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/util-linux/0013-CVE-2026-53614.patch | 81 ++++++++++++++++++++
 package/util-linux/util-linux.mk             |  3 +
 2 files changed, 84 insertions(+)
 create mode 100644 package/util-linux/0013-CVE-2026-53614.patch

diff --git a/package/util-linux/0013-CVE-2026-53614.patch b/package/util-linux/0013-CVE-2026-53614.patch
new file mode 100644
index 0000000000..2e4315500f
--- /dev/null
+++ b/package/util-linux/0013-CVE-2026-53614.patch
@@ -0,0 +1,81 @@
+From 31e37c1c7dcf25b76ccf41391fe934a75644c661 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Tue, 16 Jun 2026 10:58:32 +0200
+Subject: [PATCH] libmount: fix SUID bypass via LIBMOUNT_FORCE_MOUNT2 and
+ legacy mount path
+
+Use safe_getenv() for LIBMOUNT_FORCE_MOUNT2 to ignore the variable
+in SUID context, consistent with LIBMOUNT_FSTAB and other sensitive
+environment variables.
+
+Additionally, refuse multi-step mount(2) sequences (bind+remount and
+propagation) for restricted (non-root) users in the legacy mount path.
+The two-step approach has a window between syscalls where security
+flags (nosuid, noexec, ...) are not yet applied.  The new mount API
+handles this atomically.
+
+Reported-by: Xinyao Hu <ctf_0x01@foxmail.com>
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit 9cbfb823500f510b34767edabd3ffd5b436987b4)
+
+Upstream: https://github.com/util-linux/util-linux/commit/cc81bbcec598cb91f0eb8456282f33eed820ed5f
+CVE: CVE-2026-53614
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ libmount/src/hook_mount.c        | 3 ++-
+ libmount/src/hook_mount_legacy.c | 8 ++++++++
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/libmount/src/hook_mount.c b/libmount/src/hook_mount.c
+index 374078c97f8..570ee8e01f9 100644
+--- a/libmount/src/hook_mount.c
++++ b/libmount/src/hook_mount.c
+@@ -44,6 +44,7 @@
+  */
+ 
+ #include "mountP.h"
++#include "env.h"
+ #include "fileutils.h"	/* statx() fallback */
+ #include "strutils.h"
+ #include "mount-api-utils.h"
+@@ -658,7 +659,7 @@ static int init_sysapi(struct libmnt_context *cxt,
+ 
+ static int force_classic_mount(struct libmnt_context *cxt)
+ {
+-	const char *env = getenv("LIBMOUNT_FORCE_MOUNT2");
++	const char *env = safe_getenv("LIBMOUNT_FORCE_MOUNT2");
+ 
+ 	if (env) {
+ 		if (strcmp(env, "always") == 0)
+diff --git a/libmount/src/hook_mount_legacy.c b/libmount/src/hook_mount_legacy.c
+index cfdd7af2b2c..942e26e7770 100644
+--- a/libmount/src/hook_mount_legacy.c
++++ b/libmount/src/hook_mount_legacy.c
+@@ -285,6 +285,8 @@ static int hook_prepare(struct libmnt_context *cxt,
+ 
+ 	/* add extra mount(2) calls for each propagation flag  */
+ 	if (flags & MS_PROPAGATION) {
++		if (mnt_context_is_restricted(cxt))
++			goto eperm;
+ 		rc = prepare_propagation(cxt, hs);
+ 		if (rc)
+ 			return rc;
+@@ -294,12 +296,18 @@ static int hook_prepare(struct libmnt_context *cxt,
+ 	if ((flags & MS_BIND)
+ 	    && (flags & MNT_BIND_SETTABLE)
+ 	    && !(flags & MS_REMOUNT)) {
++		if (mnt_context_is_restricted(cxt))
++			goto eperm;
+ 		rc = prepare_bindremount(cxt, hs);
+ 		if (rc)
+ 			return rc;
+ 	}
+ 
+ 	return rc;
++eperm:
++	DBG(HOOK, ul_debugobj(hs,
++		"multi-step mount(2) refused for non-root user"));
++	return -EPERM;
+ }
+ 
+ const struct libmnt_hookset hookset_mount_legacy =
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index b0f7b7e988..cf75171e55 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -50,6 +50,9 @@ UTIL_LINUX_IGNORE_CVES += CVE-2026-53612
 # 0012-CVE-2026-53613-2.patch
 UTIL_LINUX_IGNORE_CVES += CVE-2026-53613
 
+# 0013-CVE-2026-53614.patch
+UTIL_LINUX_IGNORE_CVES += CVE-2026-53614
+
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = \
 	host-pkgconf \
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
