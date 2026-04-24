Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3851FED3F1
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6461084D71;
	Fri, 24 Apr 2026 16:25:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ON97tleIq_x; Fri, 24 Apr 2026 16:25:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F17D784D85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777047952;
	bh=2M2phktsFKCbFS0CItZ8HzVRjEbvXhmX4JlV5MAv4D0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jHcTWYzOW3BXy8wOtBs5NiQnDhPfpMUWykiSgXk1PCZX+OqSkWvnlmCUPjoL12ovS
	 EWEx1P8nOz5LCQcO8P3D6kdTO0RDZor0lrkssPiw8MBYa+1YLMlWEl7BEpariztYIB
	 sEQY9up2G+gBnLEAU5DGNYfuatSdx9I0iFqsxURubMpAU+XzJzLAgte0zRLMeNzHeW
	 Tx1k95JsMBPtkJdAgzqUkC/0dhrHyD6gqwsGzynGDQx1ia3wHMM0e5kK76HF48GBNf
	 ZAfrsYSHWC80BSVQfbEqf64OJLOV+gUYpdGaSomKPfV+JC3+x3mB4yjZsw93Sx8AKP
	 u27DMYWRrqO+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F17D784D85;
	Fri, 24 Apr 2026 16:25:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 06970194
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8946F61C31
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ApmS0XDH9rYm for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3155B61C2E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3155B61C2E
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC05F82AFA; Fri, 24 Apr 2026 16:25:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:20:25 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0a698a3b1ba6f3f2cf3330a0f0f39ad378a35364
X-Git-Newrev: 212700b9d57c6fa6e621cfac52934a6b9331a64b
X-Patchwork-Hint: ignore
Message-Id: <20260424162538.DC05F82AFA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libcap: patch
 CVE-2026-4878
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/212700b9d57c6fa6e621cfac52934a6b9331a64b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes the following vulnerability:

- CVE-2026-4878:
    A flaw was found in libcap. A local unprivileged user can exploit a
    Time-of-check-to-time-of-use (TOCTOU) race condition in the
    `cap_set_file()` function. This allows an attacker with write access
    to a parent directory to redirect file capability updates to an
    attacker-controlled file. By doing so, capabilities can be injected
    into or stripped from unintended executables, leading to privilege
    escalation.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-4878
  - https://security-tracker.debian.org/tracker/CVE-2026-4878
  - https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=286ace1259992bd0c5d9016715833f2e148ac596

(cherry picked from commit 76e4d8e3dfb2e5353f1473f72860e62b61a953d1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...ial-TOCTOU-race-condition-in-cap-set-file.patch | 162 +++++++++++++++++++++
 package/libcap/libcap.mk                           |   3 +
 2 files changed, 165 insertions(+)

diff --git a/package/libcap/0001-Address-a-potential-TOCTOU-race-condition-in-cap-set-file.patch b/package/libcap/0001-Address-a-potential-TOCTOU-race-condition-in-cap-set-file.patch
new file mode 100644
index 0000000000..7646cac531
--- /dev/null
+++ b/package/libcap/0001-Address-a-potential-TOCTOU-race-condition-in-cap-set-file.patch
@@ -0,0 +1,162 @@
+From 286ace1259992bd0c5d9016715833f2e148ac596 Mon Sep 17 00:00:00 2001
+From: "Andrew G. Morgan" <morgan@kernel.org>
+Date: Thu, 12 Mar 2026 07:38:05 -0700
+Subject: Address a potential TOCTOU race condition in cap_set_file().
+
+This issue was researched and reported by Ali Raza (@locus-x64). It
+has been assigned CVE-2026-4878.
+
+The finding is that while cap_set_file() checks if a file is a regular
+file before applying or removing a capability attribute, a small
+window existed after that check when the filepath could be overwritten
+either with new content or a symlink to some other file. To do this
+would imply that the caller of cap_set_file() was directing it to a
+directory over which a local attacker has write access, and performed
+the operation frequently enough that an attacker had a non-negligible
+chance of exploiting the race condition. The code now locks onto the
+intended file, eliminating the race condition.
+
+Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
+CVE: CVE-2026-4878
+Upstream: https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=286ace1259992bd0c5d9016715833f2e148ac596
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ libcap/cap_file.c  | 69 ++++++++++++++++++++++++++++++++++++++++++++++--------
+ progs/quicktest.sh | 14 ++++++++++-
+ 2 files changed, 72 insertions(+), 11 deletions(-)
+
+diff --git a/libcap/cap_file.c b/libcap/cap_file.c
+index 0bc07f7..f02bf9f 100644
+--- a/libcap/cap_file.c
++++ b/libcap/cap_file.c
+@@ -8,8 +8,13 @@
+ #define _DEFAULT_SOURCE
+ #endif
+ 
++#ifndef _GNU_SOURCE
++#define _GNU_SOURCE
++#endif
++
+ #include <sys/types.h>
+ #include <byteswap.h>
++#include <fcntl.h>
+ #include <sys/stat.h>
+ #include <unistd.h>
+ 
+@@ -322,26 +327,70 @@ int cap_set_file(const char *filename, cap_t cap_d)
+     struct vfs_ns_cap_data rawvfscap;
+     int sizeofcaps;
+     struct stat buf;
++    char fdpath[64];
++    int fd, ret;
++
++    _cap_debug("setting filename capabilities");
++    fd = open(filename, O_RDONLY|O_NOFOLLOW);
++    if (fd >= 0) {
++	ret = cap_set_fd(fd, cap_d);
++	close(fd);
++	return ret;
++    }
+ 
+-    if (lstat(filename, &buf) != 0) {
+-	_cap_debug("unable to stat file [%s]", filename);
++    /*
++     * Attempting to set a file capability on a file the process can't
++     * read the content of. This is considered a non-standard use case
++     * and the following (slower) code is complicated because it is
++     * trying to avoid a TOCTOU race condition.
++     */
++
++    fd = open(filename, O_PATH|O_NOFOLLOW);
++    if (fd < 0) {
++	_cap_debug("cannot find file at path [%s]", filename);
++	return -1;
++    }
++    if (fstat(fd, &buf) != 0) {
++	_cap_debug("unable to stat file [%s] descriptor %d",
++		   filename, fd);
++	close(fd);
+ 	return -1;
+     }
+     if (S_ISLNK(buf.st_mode) || !S_ISREG(buf.st_mode)) {
+-	_cap_debug("file [%s] is not a regular file", filename);
++	_cap_debug("file [%s] descriptor %d for non-regular file",
++		   filename, fd);
++	close(fd);
+ 	errno = EINVAL;
+ 	return -1;
+     }
+ 
+-    if (cap_d == NULL) {
+-	_cap_debug("removing filename capabilities");
+-	return removexattr(filename, XATTR_NAME_CAPS);
++    /*
++     * While the fd remains open, this named file is locked to the
++     * origin regular file. The size of the fdpath variable is
++     * sufficient to support a 160+ bit number.
++     */
++    if (snprintf(fdpath, sizeof(fdpath), "/proc/self/fd/%d", fd)
++	>= sizeof(fdpath)) {
++	_cap_debug("file descriptor too large %d", fd);
++	errno = EINVAL;
++	ret = -1;
++
++    } else if (cap_d == NULL) {
++	_cap_debug("dropping file caps on [%s] via [%s]",
++		   filename, fdpath);
++	ret = removexattr(fdpath, XATTR_NAME_CAPS);
++
+     } else if (_fcaps_save(&rawvfscap, cap_d, &sizeofcaps) != 0) {
+-	return -1;
+-    }
++	_cap_debug("problem converting cap_d to vfscap format");
++	ret = -1;
+ 
+-    _cap_debug("setting filename capabilities");
+-    return setxattr(filename, XATTR_NAME_CAPS, &rawvfscap, sizeofcaps, 0);
++    } else {
++	_cap_debug("setting filename capabilities");
++	ret = setxattr(fdpath, XATTR_NAME_CAPS, &rawvfscap,
++		       sizeofcaps, 0);
++    }
++    close(fd);
++    return ret;
+ }
+ 
+ /*
+diff --git a/progs/quicktest.sh b/progs/quicktest.sh
+index e6c48e6..5dc72f9 100755
+--- a/progs/quicktest.sh
++++ b/progs/quicktest.sh
+@@ -148,7 +148,19 @@ pass_capsh --caps="cap_setpcap=p" --inh=cap_chown --current
+ pass_capsh --strict --caps="cap_chown=p" --inh=cap_chown --current
+ 
+ # change the way the capability is obtained (make it inheritable)
++chmod 0000 ./privileged
+ ./setcap cap_setuid,cap_setgid=ei ./privileged
++if [ $? -ne 0 ]; then
++    echo "FAILED to set file capability"
++    exit 1
++fi
++chmod 0755 ./privileged
++ln -s privileged unprivileged
++./setcap -r ./unprivileged
++if [ $? -eq 0 ]; then
++    echo "FAILED by removing a capability from a symlinked file"
++    exit 1
++fi
+ 
+ # Note, the bounding set (edited with --drop) only limits p
+ # capabilities, not i's.
+@@ -246,7 +258,7 @@ EOF
+     pass_capsh --iab='!%cap_chown,^cap_setpcap,cap_setuid'
+     fail_capsh --mode=PURE1E --iab='!%cap_chown,^cap_setuid'
+ fi
+-/bin/rm -f ./privileged
++/bin/rm -f ./privileged ./unprivileged
+ 
+ echo "testing namespaced file caps"
+ 
+-- 
+cgit 1.3-korg
+
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 25b3a46c44..b0ce257a5a 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -11,6 +11,9 @@ LIBCAP_LICENSE = GPL-2.0 or BSD-3-Clause
 LIBCAP_LICENSE_FILES = License
 LIBCAP_CPE_ID_VALID = YES
 
+# 0001-Address-a-potential-TOCTOU-race-condition-in-cap-set-file.patch
+LIBCAP_IGNORE_CVES += CVE-2026-4878
+
 LIBCAP_DEPENDENCIES = host-gperf
 LIBCAP_INSTALL_STAGING = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
