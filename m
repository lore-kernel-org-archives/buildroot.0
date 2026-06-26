Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69654CDE008
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 09:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B3DD40DBE;
	Fri, 26 Jun 2026 09:57:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wIlfIAthDZ0K; Fri, 26 Jun 2026 09:57:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31CF740DC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782467853;
	bh=OzyM+EkuS6rAXBcF/GX4s9Zg6MB6Atg9livTnJS9D2g=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SI88WDgoi4Bl04oChU/P7wYHiLLosLQe8R2DkO6eJdXDmvl1hpH4a5T4j59dH/1uj
	 BIs48faKssBPEcJZ8F+m+DnVKUhvf5pkotCVGQCjoEJWGu8nis57RLoKTJ1o5+oJfW
	 ojH/ZKBAwn7gZ8dEKOwJ/5GQdBtEoPlcdG4OueDbaj4kSBG46tQfMO+efRKquzInv4
	 HTe4snpEwIfxD9Hf6yqnmN7FTiK6kNGyK4yUVBegzw9AGQyEdkYzLY14VGHxq2SrnZ
	 8BhayzS+oBt94A/ul+pasoiH4p13KINGm0kDjiLDvbmkuCeESe98/68QHP4G4vztIx
	 mqvkOhMZs4hhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31CF740DC9;
	Fri, 26 Jun 2026 09:57:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 346C514A2
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 09:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19C4381E4A
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 09:57:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dSO2fkPiNtuk for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 09:57:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1A49281EA4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A49281EA4
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A49281EA4
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 09:57:28 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-490cf3000f0so8035055e9.1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 02:57:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782467847; x=1783072647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SQpqagCZMpVGLqBEv3RKtqLRf1jqc0eo71Nhku2FNek=;
 b=XRMnjiBCBUmeGihjCAO+o8NArHNdBBdoAGOquutXfcFWEDAMEqn68pcE1P3XhUV9tD
 YcvEBNCkswAJo1XAnN0iuQSth3soYQxygGieTgNp63bS7r39EsyAvjTfH+/PPhaVo9PB
 ZphyrpTz4xjE9J1RCh0sszSyzgkc4K0zG2TNHe4hwPVfPDsd82pv1NOuz7AYnFSfOVU7
 3REEz7lXMMS5OeP5dTci7Z8XhXTubx7f1fnBGeylbD2sJUhbrjsEyKeGCTz6xXaSoOui
 PkL/q7efKu4z4V2IEQdWj9yr3yT0N3Sn3Kya6CU0xv4e+JSAiYTp2LyNZ9Vdq2jIOaGw
 DccQ==
X-Gm-Message-State: AOJu0YyMRlXGf+PZaId9FOD9jcSKx83VTrI4zf1oZBzsO6eXXi6zEnzy
 +qGg7EwfoKoVZ2aRdm27sLtWzcG1+fncSNr/bw4jpMzEckWGrVp6g+z9bvXF51AT81zRJV7gTid
 Oe/J7
X-Gm-Gg: AfdE7cmvNqjuJsVY3Hnr1IQPk9m+sXlZ0lA58DyHDvnEOkhixD/Coj6YJifwgmZz1TT
 ViF7sGE6rwKj2r7TsUV1aCsrIdEUBrMtfMX2EFaoN2g7Q2F5ArEh8J+5LPeajbxP/j2/gMZ8Oim
 X3QizAwMGHvV1CQeHjFmaEzZju4TLfAIYV/ezbCAXU7rd+jdZJlRO87FZITqCWFuRYYSD+rjUjc
 RBh6cvE1Mk2QcLxLCRJNCDdZ1BOOUyS//qrkVh5rGJBxkf8QvaHd37poUqs9QRIvfleaMgveZNV
 rkNBuQKhAUOURGsEkxjyf/wtVdscceKQlnaxB/HIgxqF7a4qZnZrvdLmWKdyv6rDunPbczWzVI7
 xHt4sOOxl9cgctWf+Ma1LoiM2jZsQAadDHkAbKuZ2tL74sim8BXQH3raN9uAevp4ykx4PdCropz
 zL6HXG
X-Received: by 2002:a05:600c:6085:b0:490:44eb:c1dd with SMTP id
 5b1f17b1804b1-4926689f39cmr93831225e9.29.1782467846931; 
 Fri, 26 Jun 2026 02:57:26 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492691f60bcsm68222045e9.1.2026.06.26.02.57.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 02:57:26 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 26 Jun 2026 11:57:20 +0200
Message-ID: <20260626095724.248205-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260626095724.248205-1-thomas.perale@mind.be>
References: <20260626095724.248205-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782467847; x=1783072647; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SQpqagCZMpVGLqBEv3RKtqLRf1jqc0eo71Nhku2FNek=;
 b=WkyX91ytg3QxHjOosQ/q/bTPmWmqHlsPnCqk4fkfLlLlcvsHNe4NZ1lWu3JsQQM/Tr
 z1c5g+vl0fPmVYYCTfYuGPkv0Y+CKCJdV7kpB++uOAdiG2sekRvAwh1nk2VeD1wnkPl6
 d/jnLHc/N0Lub+YRSgwp9/m3cBTmHxIEwjqrupYy5hjdINPn65yvGi517ZwdWCTQTkQv
 UD9ILpoghyP5gmonHiXIi9YBsqeYbBJUIy3swhoUTuTNSbNc0TnJK2GvlOn9ypfSDBda
 Cmg657xmWknYO9aTgH2CCbwYL5tOdZ9hyrRkgGgeWGslJVV4iavybjAuEZpZM9nJPt0O
 kpiw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WkyX91yt
Subject: [Buildroot] [PATCH 2025.02.x 3/5] package/util-linux: backport
 patch CVE-2026-53612
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

- CVE-2026-53612
    A TOCTOU (Time-of-Check-Time-of-Use) vulnerability exists in the
    SUID binary /usr/bin/mount from util-linux. The hook_owner.c
    post-mount hook performs path-based chmod() and lchown() operations
    on the mount target after mount() has completed, without verifying
    that the target path still resolves to the same filesystem object.
    An unprivileged local user can exploit this race window using
    renameat2(RENAME_EXCHANGE) to redirect the chmod()/lchown() to an
    arbitrary path, achieving arbitrary permission/ownership
    modification on any file or directory.

For more information, see:
 - https://github.com/util-linux/util-linux/security/advisories/GHSA-g8wm-75wr-g2vh
 - https://github.com/util-linux/util-linux/commit/d0c5adaeb3a3d823aba1377794de8f009b8152cc

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/util-linux/0010-CVE-2026-53612.patch | 89 ++++++++++++++++++++
 package/util-linux/util-linux.mk             |  3 +
 2 files changed, 92 insertions(+)
 create mode 100644 package/util-linux/0010-CVE-2026-53612.patch

diff --git a/package/util-linux/0010-CVE-2026-53612.patch b/package/util-linux/0010-CVE-2026-53612.patch
new file mode 100644
index 0000000000..b160f1946a
--- /dev/null
+++ b/package/util-linux/0010-CVE-2026-53612.patch
@@ -0,0 +1,89 @@
+From d0c5adaeb3a3d823aba1377794de8f009b8152cc Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Tue, 16 Jun 2026 11:15:19 +0200
+Subject: [PATCH] libmount: use fd-based fchownat/chmod in hook_owner
+
+Replace path-based lchown()/chmod() with fd-based operations in the
+X-mount.{owner,group,mode} post-mount hook.
+
+For restricted users the fd_target is pinned in prepare_target() and
+re-opened after mount in hook_attach_target() to point to the mounted
+filesystem root.  For root a local O_PATH fd is opened.  Ownership is
+changed via fchownat(fd, "", ..., AT_EMPTY_PATH), mode via
+/proc/self/fd/N.
+
+This prevents TOCTOU attacks where an ancestor directory is swapped
+between mount and the chmod/chown operations.
+
+Reported-by: Xinyao Hu <ctf_0x01@foxmail.com>
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit 24da33905c7115c4cbccd0afb2a469804e96467a)
+
+Upstream: https://github.com/util-linux/util-linux/commit/d0c5adaeb3a3d823aba1377794de8f009b8152cc
+CVE: CVE-2026-53612
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ libmount/src/hook_owner.c | 32 ++++++++++++++++++++++++--------
+ 1 file changed, 24 insertions(+), 8 deletions(-)
+
+diff --git a/libmount/src/hook_owner.c b/libmount/src/hook_owner.c
+index 11b238c8917..99f0e705d73 100644
+--- a/libmount/src/hook_owner.c
++++ b/libmount/src/hook_owner.c
+@@ -17,6 +17,7 @@
+ #include <sched.h>
+ 
+ #include "mountP.h"
++#include "pathnames.h"
+ #include "fileutils.h"
+ 
+ struct hook_data {
+@@ -48,7 +49,7 @@ static int hook_post(
+ {
+ 	struct hook_data *hd = (struct hook_data *) data;
+ 	const char *target;
+-	int rc = 0;
++	int rc = 0, fd;
+ 
+ 	assert(cxt);
+ 
+@@ -59,18 +60,33 @@ static int hook_post(
+ 	if (!target)
+ 		return 0;
+ 
++	/* fd_target is pinned in restricted mode (see prepare_target()),
++	 * for root open it here to keep chmod/chown fd-based too */
++	if (mnt_context_target_fd_required(cxt))
++		fd = mnt_context_get_target_fd(cxt);
++	else
++		fd = open(target, O_PATH | O_CLOEXEC);
++
++	if (fd < 0)
++		return -MNT_ERR_CHMOD;
++
+ 	if (hd->owner != (uid_t) -1 || hd->group != (uid_t) -1) {
+-		DBG(CXT, ul_debugobj(cxt, " lchown(%s, %u, %u)", target, hd->owner, hd->group));
+-		if (lchown(target, hd->owner, hd->group) == -1)
+-			return -MNT_ERR_CHOWN;
++		DBG(CXT, ul_debugobj(cxt, " fchownat(%s, %u, %u)", target, hd->owner, hd->group));
++		if (fchownat(fd, "", hd->owner, hd->group, AT_EMPTY_PATH) == -1)
++			rc = -MNT_ERR_CHOWN;
+ 	}
+ 
+-	if (hd->mode != (mode_t) -1) {
+-		DBG(CXT, ul_debugobj(cxt, " chmod(%s, %04o)", target, hd->mode));
+-		if (chmod(target, hd->mode) == -1)
+-			return -MNT_ERR_CHMOD;
++	if (!rc && hd->mode != (mode_t) -1) {
++		char buf[sizeof(_PATH_PROC_FDDIR) + 1 + sizeof(stringify_value(INT_MAX))];
++
++		snprintf(buf, sizeof(buf), _PATH_PROC_FDDIR "/%d", fd);
++		DBG(CXT, ul_debugobj(cxt, " chmod(%s, %04o)", buf, hd->mode));
++		if (chmod(buf, hd->mode) == -1)
++			rc = -MNT_ERR_CHMOD;
+ 	}
+ 
++	if (!mnt_context_target_fd_required(cxt))
++		close(fd);
+ 	return rc;
+ }
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 22c314ce82..3f929a89a7 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -43,6 +43,9 @@ UTIL_LINUX_IGNORE_CVES += CVE-2026-27456
 # 0009-CVE-2025-14104-2.patch
 UTIL_LINUX_IGNORE_CVES += CVE-2025-14104
 
+# 0010-CVE-2026-53612.patch
+UTIL_LINUX_IGNORE_CVES += CVE-2026-53612
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
