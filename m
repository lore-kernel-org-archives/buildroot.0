Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607F3FED3EA
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3221684E36;
	Fri, 24 Apr 2026 16:26:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mvufEIdVbydN; Fri, 24 Apr 2026 16:26:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A170984D8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048005;
	bh=RBBpBWtdR9/LYzPwOqEbYFngKwEppQqb2nLRTRIZ54w=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Z7JT8lFbWaO5BW37dmyNHTJLWAXrD7E0khpJK4cZv2fFTXaF9xns0TbM2a3ISzm/u
	 QYuZFRAHHZuq52vO6OuX/J19e/RWYFSyTM3P7gD1eH1Ylydzv/HhkEwQfLVEHdvfdm
	 BYNA2ghq6bSYaJVnIKTB8VvPo/Bwk1yopWasiP8K/m7jYAiw7QcegrNrGJqcTWET1x
	 db892V6nlI/n2GCKRwV3F2+tbDPOkRxw/BAJOItO6Zjz4udZ3DJMpTMwZ7ttyrnArm
	 89/lQwHQ1X6dq8SduHCQ+JSc4pqO9u0IR1W60V3x39vOBC5Bf4CAGAO1hEVRtgnH7a
	 ymHZiVc4XjQmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A170984D8B;
	Fri, 24 Apr 2026 16:26:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E1F0206
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 702EB4295F
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:26:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ceh-Nuq47PBE for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:26:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 159684295E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 159684295E
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 159684295E
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:26:40 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-48909558b3aso75593805e9.0
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 09:26:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777047999; x=1777652799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=efpwnQbiE2vF5a5Db/n14LhYI+4IwYkfwyrnkQk4uMg=;
 b=qtkUd6MI9HE0x640N9TuVs8FaiSnF4ejEoA3tqPUMrst5Lj3cpsov7RhqCKZf8Za7U
 7pIrwwNCZgyra4i64q3eOn4eh2SqJ5kbITrQYdP2A1dQBxQTsDOXy17RQ0SMMuqSjG01
 YGvXR6ip03sHZirLw5kOjdf/wQcOXH+M1E8LI3LSGjS0ervO7CSD4GYXO3FvkfqBIhtW
 umC/AjICeLPe6KnWxDOSOSpZUHzmJzvsD2wxwiqk5KinbrKtB2NhSICiXNWQ5AWmhV6s
 t8oWKk4rKkU+foAMd+2tnZOS9262uqmF2rvIuRshhRqth7aNhBF0DyRr/JwAMZdxXRVP
 h1kw==
X-Gm-Message-State: AOJu0YzU4/Pl1pObbEzzkxlHfVTCkiN2RpZg3QHQkIPGVn7vu4o7Jk+H
 WXkOCQxTOLpzyXSjz5+ESVexFeDpmtLZs/bd8FIbCZl6skDuoEVQtWKWGDhfleGrz60=
X-Gm-Gg: AeBDievzTnb7vBsSaootDr3DS7wlpHe6CrY7wRsg/d9SOd/nZnYHn4HZgSBr1/b6up5
 DY/UPrqwYoM19JP0USfN8QyiwwxB9CaV7zd6nAps08S/MRw99B8KsDDftkIa/9zdJxJYS5OJGYM
 AKprbl/LzI6dmHkBuiuwLjAu9dA9A0y7bDLYjGHm7Gz36h5+qF5cmSQQjpEghG3PLSwQ9sbpEj6
 phLVl+vp2NiUFEI2+UO9RsoYDSNk9wPpQ4IMs+nVA8ypnYsEvC40gkk3AG0WnlKvmSRGQXMimt/
 dHIRsrwNOH+k74Uy9IzsXWcLJwKKynH7btQKb7me5uI8sYvY1XK1aTD+EM672Xj0llbAnpU50kg
 aURNEgnvlOkDxrSDM3wp57i7bLKn8xGtEcdWYG8Azvtanv9T3DEXZJHUN/ARknwrvBtpDsFGuJ3
 8oyTavpmGUCzociyKrZwxWQLIDqQ==
X-Received: by 2002:a05:600d:8408:b0:488:be58:bb5b with SMTP id
 5b1f17b1804b1-488fb773f0cmr351234075e9.24.1777047998736; 
 Fri, 24 Apr 2026 09:26:38 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e3a79esm64042375f8f.17.2026.04.24.09.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 09:26:38 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:26:37 +0200
Message-ID: <20260424162637.160916-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260417090555.93440-1-thomas.perale@mind.be>
References: <20260417090555.93440-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777047999; x=1777652799; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=efpwnQbiE2vF5a5Db/n14LhYI+4IwYkfwyrnkQk4uMg=;
 b=dLQq4ZhhoVgourQn0MdMDZh3dp2u83QIyss61KEJC2cqdeOMMMj6Jx/6Pp9iN5U5pA
 X9GZoMMC6UcJEP6VMyoe/glsdP/AVcjDooC317dynRbu4UFz9L1G3IUDqpZN7EXeoDdL
 exu1S+XbvgHrU0otqe/+5bDIpeZF8I5BLy4Ucq9IZq7jQH+WcoPOElmVXPaTjkToxDtU
 413JeL+GXLsCTzswLR0YkeC1pE90gVkMMfh7uE5FUH39LJ8AnJACMp0/epei4MjJ4tW8
 sKu5X8K2IYu1vCQlrAUqpOPTt6ucCpqjr2LfsbMWpKk/j3eyBhK40TiDToCXFQXWwHFe
 SxTw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dLQq4Zhh
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/libcap: patch
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Fixes the following vulnerability:
> 
> - CVE-2026-4878:
>     A flaw was found in libcap. A local unprivileged user can exploit a
>     Time-of-check-to-time-of-use (TOCTOU) race condition in the
>     `cap_set_file()` function. This allows an attacker with write access
>     to a parent directory to redirect file capability updates to an
>     attacker-controlled file. By doing so, capabilities can be injected
>     into or stripped from unintended executables, leading to privilege
>     escalation.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2026-4878
>   - https://security-tracker.debian.org/tracker/CVE-2026-4878
>   - https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=286ace1259992bd0c5d9016715833f2e148ac596
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  ...OCTOU-race-condition-in-cap-set-file.patch | 162 ++++++++++++++++++
>  package/libcap/libcap.mk                      |   3 +
>  2 files changed, 165 insertions(+)
>  create mode 100644 package/libcap/0001-Address-a-potential-TOCTOU-race-condition-in-cap-set-file.patch
> 
> diff --git a/package/libcap/0001-Address-a-potential-TOCTOU-race-condition-in-cap-set-file.patch b/package/libcap/0001-Address-a-potential-TOCTOU-race-condition-in-cap-set-file.patch
> new file mode 100644
> index 0000000000..7646cac531
> --- /dev/null
> +++ b/package/libcap/0001-Address-a-potential-TOCTOU-race-condition-in-cap-set-file.patch
> @@ -0,0 +1,162 @@
> +From 286ace1259992bd0c5d9016715833f2e148ac596 Mon Sep 17 00:00:00 2001
> +From: "Andrew G. Morgan" <morgan@kernel.org>
> +Date: Thu, 12 Mar 2026 07:38:05 -0700
> +Subject: Address a potential TOCTOU race condition in cap_set_file().
> +
> +This issue was researched and reported by Ali Raza (@locus-x64). It
> +has been assigned CVE-2026-4878.
> +
> +The finding is that while cap_set_file() checks if a file is a regular
> +file before applying or removing a capability attribute, a small
> +window existed after that check when the filepath could be overwritten
> +either with new content or a symlink to some other file. To do this
> +would imply that the caller of cap_set_file() was directing it to a
> +directory over which a local attacker has write access, and performed
> +the operation frequently enough that an attacker had a non-negligible
> +chance of exploiting the race condition. The code now locks onto the
> +intended file, eliminating the race condition.
> +
> +Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
> +CVE: CVE-2026-4878
> +Upstream: https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=286ace1259992bd0c5d9016715833f2e148ac596
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + libcap/cap_file.c  | 69 ++++++++++++++++++++++++++++++++++++++++++++++--------
> + progs/quicktest.sh | 14 ++++++++++-
> + 2 files changed, 72 insertions(+), 11 deletions(-)
> +
> +diff --git a/libcap/cap_file.c b/libcap/cap_file.c
> +index 0bc07f7..f02bf9f 100644
> +--- a/libcap/cap_file.c
> ++++ b/libcap/cap_file.c
> +@@ -8,8 +8,13 @@
> + #define _DEFAULT_SOURCE
> + #endif
> + 
> ++#ifndef _GNU_SOURCE
> ++#define _GNU_SOURCE
> ++#endif
> ++
> + #include <sys/types.h>
> + #include <byteswap.h>
> ++#include <fcntl.h>
> + #include <sys/stat.h>
> + #include <unistd.h>
> + 
> +@@ -322,26 +327,70 @@ int cap_set_file(const char *filename, cap_t cap_d)
> +     struct vfs_ns_cap_data rawvfscap;
> +     int sizeofcaps;
> +     struct stat buf;
> ++    char fdpath[64];
> ++    int fd, ret;
> ++
> ++    _cap_debug("setting filename capabilities");
> ++    fd = open(filename, O_RDONLY|O_NOFOLLOW);
> ++    if (fd >= 0) {
> ++	ret = cap_set_fd(fd, cap_d);
> ++	close(fd);
> ++	return ret;
> ++    }
> + 
> +-    if (lstat(filename, &buf) != 0) {
> +-	_cap_debug("unable to stat file [%s]", filename);
> ++    /*
> ++     * Attempting to set a file capability on a file the process can't
> ++     * read the content of. This is considered a non-standard use case
> ++     * and the following (slower) code is complicated because it is
> ++     * trying to avoid a TOCTOU race condition.
> ++     */
> ++
> ++    fd = open(filename, O_PATH|O_NOFOLLOW);
> ++    if (fd < 0) {
> ++	_cap_debug("cannot find file at path [%s]", filename);
> ++	return -1;
> ++    }
> ++    if (fstat(fd, &buf) != 0) {
> ++	_cap_debug("unable to stat file [%s] descriptor %d",
> ++		   filename, fd);
> ++	close(fd);
> + 	return -1;
> +     }
> +     if (S_ISLNK(buf.st_mode) || !S_ISREG(buf.st_mode)) {
> +-	_cap_debug("file [%s] is not a regular file", filename);
> ++	_cap_debug("file [%s] descriptor %d for non-regular file",
> ++		   filename, fd);
> ++	close(fd);
> + 	errno = EINVAL;
> + 	return -1;
> +     }
> + 
> +-    if (cap_d == NULL) {
> +-	_cap_debug("removing filename capabilities");
> +-	return removexattr(filename, XATTR_NAME_CAPS);
> ++    /*
> ++     * While the fd remains open, this named file is locked to the
> ++     * origin regular file. The size of the fdpath variable is
> ++     * sufficient to support a 160+ bit number.
> ++     */
> ++    if (snprintf(fdpath, sizeof(fdpath), "/proc/self/fd/%d", fd)
> ++	>= sizeof(fdpath)) {
> ++	_cap_debug("file descriptor too large %d", fd);
> ++	errno = EINVAL;
> ++	ret = -1;
> ++
> ++    } else if (cap_d == NULL) {
> ++	_cap_debug("dropping file caps on [%s] via [%s]",
> ++		   filename, fdpath);
> ++	ret = removexattr(fdpath, XATTR_NAME_CAPS);
> ++
> +     } else if (_fcaps_save(&rawvfscap, cap_d, &sizeofcaps) != 0) {
> +-	return -1;
> +-    }
> ++	_cap_debug("problem converting cap_d to vfscap format");
> ++	ret = -1;
> + 
> +-    _cap_debug("setting filename capabilities");
> +-    return setxattr(filename, XATTR_NAME_CAPS, &rawvfscap, sizeofcaps, 0);
> ++    } else {
> ++	_cap_debug("setting filename capabilities");
> ++	ret = setxattr(fdpath, XATTR_NAME_CAPS, &rawvfscap,
> ++		       sizeofcaps, 0);
> ++    }
> ++    close(fd);
> ++    return ret;
> + }
> + 
> + /*
> +diff --git a/progs/quicktest.sh b/progs/quicktest.sh
> +index e6c48e6..5dc72f9 100755
> +--- a/progs/quicktest.sh
> ++++ b/progs/quicktest.sh
> +@@ -148,7 +148,19 @@ pass_capsh --caps="cap_setpcap=p" --inh=cap_chown --current
> + pass_capsh --strict --caps="cap_chown=p" --inh=cap_chown --current
> + 
> + # change the way the capability is obtained (make it inheritable)
> ++chmod 0000 ./privileged
> + ./setcap cap_setuid,cap_setgid=ei ./privileged
> ++if [ $? -ne 0 ]; then
> ++    echo "FAILED to set file capability"
> ++    exit 1
> ++fi
> ++chmod 0755 ./privileged
> ++ln -s privileged unprivileged
> ++./setcap -r ./unprivileged
> ++if [ $? -eq 0 ]; then
> ++    echo "FAILED by removing a capability from a symlinked file"
> ++    exit 1
> ++fi
> + 
> + # Note, the bounding set (edited with --drop) only limits p
> + # capabilities, not i's.
> +@@ -246,7 +258,7 @@ EOF
> +     pass_capsh --iab='!%cap_chown,^cap_setpcap,cap_setuid'
> +     fail_capsh --mode=PURE1E --iab='!%cap_chown,^cap_setuid'
> + fi
> +-/bin/rm -f ./privileged
> ++/bin/rm -f ./privileged ./unprivileged
> + 
> + echo "testing namespaced file caps"
> + 
> +-- 
> +cgit 1.3-korg
> +
> diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
> index 25b3a46c44..b0ce257a5a 100644
> --- a/package/libcap/libcap.mk
> +++ b/package/libcap/libcap.mk
> @@ -11,6 +11,9 @@ LIBCAP_LICENSE = GPL-2.0 or BSD-3-Clause
>  LIBCAP_LICENSE_FILES = License
>  LIBCAP_CPE_ID_VALID = YES
>  
> +# 0001-Address-a-potential-TOCTOU-race-condition-in-cap-set-file.patch
> +LIBCAP_IGNORE_CVES += CVE-2026-4878
> +
>  LIBCAP_DEPENDENCIES = host-gperf
>  LIBCAP_INSTALL_STAGING = YES
>  
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
