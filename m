Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0041F43680
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 09:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E4BA6081B;
	Fri, 17 Apr 2026 09:06:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zOzuQqYkraYk; Fri, 17 Apr 2026 09:06:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A900607C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776416764;
	bh=ZOqEjvmnGxkTHCE3ej3H0XS78FjVrskIw0O+waIYFH4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=OZsGWEpfxVWRrCLcQ/QdzsoWwMnNJfR//xdvete4c/MN96IHtbZJwv3UYTvi8w81V
	 flqfLEJJR1JnXRZkhNgYYs3jLbHI4L0Qdw6CMBsOrQk5mY4fyrm/doIExbmjhQBBQh
	 YZADY/Yt1k5J8TSHUwVYSqeLDIxQCdLO10OD2y7WWtXNlH0YbB2V6utMfzR9ST+b1Q
	 zo7Gk9TmsmwFn0BjOiRvkYhnXHEfnutOWLdbVFzgGKlxQEG6/nHelqcE4vekZSnJqq
	 HobCR1py+vIfKuzf2vvmxxlRg9viz0HNxYhsRuUAfSxEvwUasUyTeZyHwbhClfIo7C
	 qzbJsTovLDFhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A900607C1;
	Fri, 17 Apr 2026 09:06:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D729259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 09:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39A9C80AC6
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 09:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kZKNvrZg4iKM for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 09:06:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2865D80AF7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2865D80AF7
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2865D80AF7
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 09:05:58 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso3915505e9.1
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 02:05:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776416756; x=1777021556;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a6JvpqSnQKyCTkb75z4fhPcsNMsOJEtlDgQoYFrDldg=;
 b=ED6/a15rL+U9S7RBHg9m1ZitL9x+fwWi5Q2eaOdOb7Yue73b71m1iRFBpwA9M8F10B
 oe3smWHNQQE9FqxrG/3F4N8Zd9bL+UhBsx6sqUXfTO7bCG0duJ+8crzKL98mssqSc0N1
 M87Nu6TimwFvOg3qtCM8e7v2QKPHDfkTn/jB7qZGAO8QDaUeLHzYnPG+7MJmoqqBREq0
 Z+erUxDoCkSzj5YmrMGUgcvgBtgWyO5+ZsQ+KrPfcPNqfe81lGwc75p4+iB4bIS+fupu
 T79YOz3dYPuxX3H1j3mHBBcAFcMYvn9CRP3yN00J7c8Fp/8y/t89IGgDT3F66/MgaZjq
 To0w==
X-Gm-Message-State: AOJu0YxBgpFDAUuyh0z6DuvnlZwybmpeVxAgFNdg8xcW7JXMidflWai/
 5j+tNfsCQrzd49bZstbN/2hrNtnSkl73AeARRoxDESIhbrzdOxWmBQrTCqw0W/kikcUMZq5sM1e
 Qu/Cr
X-Gm-Gg: AeBDieuWYg8f+cstJSVg1ZnjciKdXImAREBqtmc1X9Bi6MWxOCNZybUIW4Cm6jRbAgS
 vVHZ+CtNNbCCjgh4fJhD50PK4bmuIT++TLxcIH74atTFMvIKqA7I5i13JH2TMeU/2STxRdikz0h
 RppUFCvqVjjmW4x5HiUEh0bfYiX1c2h7mGjcQ8fLCgjAX31zEVfAz2Y9PkNOZSJQKq1eoCrSAcw
 phh8hcymFdT39a1pzed+g5NsCc2X7OSLSoMNrosyHlE6Y7iU6DrTxLwXoHc+YprBW3PSQYiEs3/
 Q7tQUrtPcQaSQh08X0Ti93K3jbv6qsVBWnAzUF66qUHTFUg3QwQ1p8rxIQbv/SFzewEWm5tqdPD
 oCr8ZJxt70oC5wV3wR52AbDK/7IbNUR8WKUSz7HqpkjXJ6vcFVgtq6YKFt1rF2TxnI0u1PAXEL9
 9bFbNgHaImp411RFndu1FT2Oux9yc=
X-Received: by 2002:a05:600c:5295:b0:485:364e:9328 with SMTP id
 5b1f17b1804b1-488fb77d12dmr23585865e9.16.1776416756263; 
 Fri, 17 Apr 2026 02:05:56 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc0f82bbsm49446555e9.3.2026.04.17.02.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 02:05:55 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Apr 2026 11:05:55 +0200
Message-ID: <20260417090555.93440-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776416756; x=1777021556; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=a6JvpqSnQKyCTkb75z4fhPcsNMsOJEtlDgQoYFrDldg=;
 b=WrmBR76cALoM2NkR1dcbC1IhynWDfvkJJ2o5q7j+1z06UF/1phz17/pMQxSXh0+YxD
 R1R/bZqP8b0S/SDPqUp70RtxcWXJMJMjqBaOeaqjZ1Bgci7PfpGr3/SGrgXCBpnTUKUq
 XBwlJ7WsKWdYaFk7XmNbdDKqwx40lOqYwr+kgH/cfF9lYLQwVzM4RqYfL/z24r4VD2zL
 aTo4LgmT9dUkKl82vv0/3ODGMhnHmID7GvLm38p0DQbGnGldLQxrt8VXdzTZhVGc4LAF
 qg6h084foNZMKH42TNZGOeU49TILJdkBt2WerutX0AbVklE5J4Ww0wO9i4cFHT9Vmdf0
 NgRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=WrmBR76c
Subject: [Buildroot] [PATCH 2025.02.x] package/libcap: patch CVE-2026-4878
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

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...OCTOU-race-condition-in-cap-set-file.patch | 162 ++++++++++++++++++
 package/libcap/libcap.mk                      |   3 +
 2 files changed, 165 insertions(+)
 create mode 100644 package/libcap/0001-Address-a-potential-TOCTOU-race-condition-in-cap-set-file.patch

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
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
