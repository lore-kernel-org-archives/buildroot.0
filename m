Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF25CD128A
	for <buildroot@archiver.kernel.org>; Sun, 31 Mar 2024 20:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C5A3811E8;
	Sun, 31 Mar 2024 20:34:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TpJghp10bIvn; Sun, 31 Mar 2024 20:34:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E213817F2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E213817F2;
	Sun, 31 Mar 2024 20:34:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7866F1BF422
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 20:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65D8840378
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 20:34:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kt3v50cuu_vh for <buildroot@lists.busybox.net>;
 Sun, 31 Mar 2024 20:34:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3672840377
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3672840377
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3672840377
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 20:34:06 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-341b9f6fb2eso2559644f8f.2
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 13:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711917244; x=1712522044;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RYjPCz16wdfzUjrY9+bfuD/Co9GXQGPe9EU4x2MAv1w=;
 b=VUyUSTwSCksky5fkiO6im2koEM05VCiS0MTFbDTaFrUGI0zQ6V7Eo3V8gwm1IdqxKy
 6RYpuf+slc7Thu/5GN1zx3ucIVh9k4yYxNjTTvYwvXRTPsmJ421BhvgWZ5Liea1xP/qN
 P8dGIrB0oC2jeYWhHokbAJEZjlQd8jkmmUt5jLh8OC5WAZZPbPPrLIWYf6RVZm8DRRgL
 IVmSh2DOBBwQCe1rQi7IewsRIN1+xmKHlF0C2GOriNfj91GlrYK9ngoDxkNTr0WbjGrQ
 Q/mDq3AR4Abq9HV3G78jrmUrCRe+BCFo+embKkPziVkAoCR+yVDfUH+Y03vJoN7Egp/F
 7XqQ==
X-Gm-Message-State: AOJu0YwuXpYhpJiMIZhUDYNw40kbQG7t1yvWcQN4UcFSWINqAY1XR8Zp
 Q0HFVW94qT8FHWlQ8hZtzM82nEDMwIXTGpi4jQ/U2WFFE45OBAA4zsqMuPGX
X-Google-Smtp-Source: AGHT+IEYn24DzxYNONhAALN3Hezct0owytGTYnXfWyQHRpfOeuJJCWBJQ6NzapOxnlHa+yN18hSy0w==
X-Received: by 2002:a5d:5f83:0:b0:343:3eb9:b287 with SMTP id
 dr3-20020a5d5f83000000b003433eb9b287mr5976753wrb.36.1711917243984; 
 Sun, 31 Mar 2024 13:34:03 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a05600003ca00b00341c563aacbsm9935078wrg.1.2024.03.31.13.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Mar 2024 13:34:03 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 31 Mar 2024 22:34:03 +0200
Message-ID: <20240331203403.815497-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711917244; x=1712522044; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=RYjPCz16wdfzUjrY9+bfuD/Co9GXQGPe9EU4x2MAv1w=;
 b=MZQHriBVS+Zki2+Y3f8Wnc0zpjP6o23WcLbBtruAQgZEo0+qxTzpQgyWr5Jx0pyReQ
 y2J0602aD/itTpQp95Y6O4tmBj0Yv43pZKDmpw4BdW+I+d/Sj8R6wmr08YfwnVGHGDr0
 bLM/b8ZER2EDgXlTEKMFMOwWFmEmxMwdH6uo5rPvd9JMoOAV8k2WAtXvD+KGFf1n3N5w
 KXJgBL7isRkECFoJVXwrc4ULdF+w59RmEuBpOpjX9BVy9deQ5Y5wgJwHd7HSIMA8v4B5
 AJXYsAGqfYnmbb0uAGbZZfWUpD3w1PIU++sgKh7XUxfV2u6mN6vZ7HabG7LQEtzrKYhz
 hP7g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MZQHriBV
Subject: [Buildroot] [PATCH] utils/check-package: new check for Buildroot's
 defconfig files
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that we do have support for checking hashes for custom versions
(for the few packages for which we do support custom versions, like the
kernel, some bootloaders...), we want to ensure that our defconfig
files, when they enable one or more such custom version, do enable
checking the hashes for those versions, and thus we want to require all
our defconfigs do enable BR2_DOWNLOAD_FORCE_CHECK_HASHES.

Add a check for that condition.

We need to be careful that we only check Buildroot's defconfig, whether
in-tree or in a br2-external, and not kernel or other kconfig-based
defconfig files, like those in board/ sub-directories. So we only match
defconfig files that are in a configs/ directory, whether at the
toplevel (for in-tree defconfigs), or not (for br2-external defconfigs).

Since we only have two defconfigs that check hashes for custom versions,
regnerate .checkpackageignore to ignore all so-far broken defconfigs.

Suggested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>

---
Note: this patch does not contain a regenerated .checkpackageignore, for
ease of review; I can resubmit with it regenerated after reviews, or a
committer may regenerate when applying.
---
 utils/check-package                    |  9 +++++++++
 utils/checkpackagelib/lib_defconfig.py | 20 ++++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 utils/checkpackagelib/lib_defconfig.py

diff --git a/utils/check-package b/utils/check-package
index 373bc63f52..6678f68794 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -10,6 +10,7 @@ import sys
 
 import checkpackagelib.base
 import checkpackagelib.lib_config
+import checkpackagelib.lib_defconfig
 import checkpackagelib.lib_hash
 import checkpackagelib.lib_ignore
 import checkpackagelib.lib_mk
@@ -113,6 +114,7 @@ DO_CHECK_INTREE = re.compile(r"|".join([
     r"arch/",
     r"board/",
     r"boot/",
+    r"configs/",
     r"fs/",
     r"linux/",
     r"package/",
@@ -137,6 +139,11 @@ DO_NOT_CHECK_INTREE = re.compile(r"|".join([
 
 SYSV_INIT_SCRIPT_FILENAME = re.compile(r"/S\d\d[^/]+$")
 
+# For defconfigs: avoid matching kernel, uboot... defconfig files, so
+# limit to defconfig files in a configs/ directory, either in-tree or
+# in a br2-external tree.
+BR_DEFCONFIG_FILENAME = re.compile(r"^(.+/)?configs/[^/]+_defconfig$")
+
 
 def get_lib_from_filename(fname):
     if flags.intree_only:
@@ -152,6 +159,8 @@ def get_lib_from_filename(fname):
         return checkpackagelib.lib_ignore
     if CONFIG_IN_FILENAME.search(fname):
         return checkpackagelib.lib_config
+    if BR_DEFCONFIG_FILENAME.search(fname):
+        return checkpackagelib.lib_defconfig
     if fname.endswith(".hash"):
         return checkpackagelib.lib_hash
     if fname.endswith(".mk"):
diff --git a/utils/checkpackagelib/lib_defconfig.py b/utils/checkpackagelib/lib_defconfig.py
new file mode 100644
index 0000000000..ab0e361b57
--- /dev/null
+++ b/utils/checkpackagelib/lib_defconfig.py
@@ -0,0 +1,20 @@
+# See utils/checkpackagelib/readme.txt before editing this file.
+
+from checkpackagelib.base import _CheckFunction
+
+
+class ForceCheckHash(_CheckFunction):
+    """Checks that a defconfig does force checking all hashes"""
+
+    def before(self):
+        self.forces = False
+
+    def check_line(self, lineno, text):
+        if self.forces:
+            return
+        if text == "BR2_DOWNLOAD_FORCE_CHECK_HASHES=y\n":
+            self.forces = True
+
+    def after(self):
+        if not self.forces:
+            return [f"{self.filename}:0: missing BR2_DOWNLOAD_FORCE_CHECK_HASHES"]
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
