Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18AEFD0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1034412A1;
	Wed,  7 Jan 2026 18:01:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MgTU9-01Whzs; Wed,  7 Jan 2026 18:01:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB0A94104B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808895;
	bh=8x+oenUQlijiN1D3OvpnKKQblRouWL08MuI90PuNqmA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lDqLqMM5tJWsIXFm8VwLnMz2mogLkUAZzfHboHjaki1o4ODVokWVEOplVCGxfUx6J
	 jmRycq01J6i8YLSYRxqoqrYZF8yZFAVlAm7r5qypInOqmXjWRcxhISHzJ/pCnn0ilK
	 QvYJRbooL+ZmUmuemvT/au7Y6sK75uWMJkv8fOKfhsnHzFZnf2b+4SO6TT6BtGIkR8
	 vjHJKhsQhLxXwKqC0LA+H+nZHynIEzBLv8ALTM8DCAvdoIc/TGoeSge08AkIjKQifC
	 cMmRdpeNcP54uEBrx+n29e0nwYwX15ZZ7QSuM3bnF05X/qEoKS21qR9fWB3NNLkmfB
	 ZVP+v/j33sXmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB0A94104B;
	Wed,  7 Jan 2026 18:01:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11F139ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 444D940A3F
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DFbDkm3fPnCg for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 724AB40A24
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 724AB40A24
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 70F1B87C86; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 18:22:30 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 9a315994a635c1c88a71e83e70a8baaca1ff4325
X-Git-Newrev: 70072dc0e2f2d3b82f54b69cfdfd3dd0236f8540
X-Patchwork-Hint: ignore
Message-Id: <20260107180111.70F1B87C86@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/python-filelock:
 fix CVE-2025-68146
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=70072dc0e2f2d3b82f54b69cfdfd3dd0236f8540
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Fixes the following vulnerability:

- CVE-2025-68146

A Time-of-Check-Time-of-Use (TOCTOU) race condition allows local
attackers to corrupt or truncate arbitrary user files through symlink
attacks.

For more informations, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-68146
  - https://github.com/tox-dev/filelock/commit/18a99880087934252e7c0c994640f66e80e34be9

(cherry picked from commit d9c1379d1f7651951d00ce59b588d74aad049573)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...mlink-vulnerability-in-lock-file-creation.patch | 27 ++++++++++++++++++++++
 package/python-filelock/python-filelock.mk         |  3 +++
 2 files changed, 30 insertions(+)

diff --git a/package/python-filelock/0001-Fix-TOCTOU-symlink-vulnerability-in-lock-file-creation.patch b/package/python-filelock/0001-Fix-TOCTOU-symlink-vulnerability-in-lock-file-creation.patch
new file mode 100644
index 0000000000..a1656e1fa1
--- /dev/null
+++ b/package/python-filelock/0001-Fix-TOCTOU-symlink-vulnerability-in-lock-file-creation.patch
@@ -0,0 +1,27 @@
+From 4724d7f8c3393ec1f048c93933e6e3e6ec321f0e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bern=C3=A1t=20G=C3=A1bor?= <gaborjbernat@gmail.com>
+Date: Mon, 15 Dec 2025 15:52:12 -0800
+Subject: [PATCH] Fix TOCTOU symlink vulnerability in lock file creation (#461)
+
+CVE: CVE-2025-68146
+Upstream: https://github.com/tox-dev/filelock/commit/4724d7f8c3393ec1f048c93933e6e3e6ec321f0e
+[thomas: Dropped the windows part of the patch]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/filelock/_unix.py    |  2 +-
+ src/filelock/_windows.py | 38 ++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 39 insertions(+), 1 deletion(-)
+
+diff --git a/src/filelock/_unix.py b/src/filelock/_unix.py
+index b2fd0f33..25cbeca6 100644
+--- a/src/filelock/_unix.py
++++ b/src/filelock/_unix.py
+@@ -38,7 +38,7 @@ class UnixFileLock(BaseFileLock):
+ 
+         def _acquire(self) -> None:
+             ensure_directory_exists(self.lock_file)
+-            open_flags = os.O_RDWR | os.O_TRUNC
++            open_flags = os.O_RDWR | os.O_TRUNC | os.O_NOFOLLOW
+             if not Path(self.lock_file).exists():
+                 open_flags |= os.O_CREAT
+             fd = os.open(self.lock_file, open_flags, self._context.mode)
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index 44599ee865..48025d8345 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -12,4 +12,7 @@ PYTHON_FILELOCK_LICENSE = Public Domain
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
 PYTHON_FILELOCK_DEPENDENCIES = host-python-hatch-vcs
 
+# 0001-Fix-TOCTOU-symlink-vulnerability-in-lock-file-creation.patch
+PYTHON_FILELOCK_IGNORE_CVES += CVE-2025-68146
+
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
