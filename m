Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 940EECD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 661224227F;
	Fri, 29 May 2026 08:29:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PyXdRDY7VUTy; Fri, 29 May 2026 08:29:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A83A142279
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043372;
	bh=y9OJt2usHI5O4/lG4j4ffGqMLLFPaLHdOzTAKloqaac=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=g2afXCPLV+ksWF7Bk3UeVQTzeM2SvTPQ6STHPIck8SEMns6uuVzH/CInfnPDo/Zbg
	 1SdEMMsHJbMOnhxaKLG3kVcNtUYzDz8ArCuXM9FP+K2zS0a139s6W+cbwXLwJcOuaE
	 nIO9penrq+oAe279xTv8+a1YnYi5vWGh3o1ry3HrU0rYxUMMGRl7oEYPri+YpsCFQV
	 Rxgy9WlfrwIEohAuSepnVuC7yWK5OfYvKyGTekMKqZSm294ouUqH/GN+OYDrYM6ih5
	 pzG7j6m7lM4nLJkMUSx+RSRxLGY558sKqhXtRu5h0aj8irStwfZjRTPUQA0fPMh9Vu
	 FFtX4daHYJJrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A83A142279;
	Fri, 29 May 2026 08:29:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DE1F28E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AA724070D
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8nsqGYA-Dhmh for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:29:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 79CE8406F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79CE8406F3
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 79CE8406F3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:24 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-45eec22fab7so769190f8f.3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043362; x=1780648162;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=txbqGmTQ5fagvNROAjzigqsMz7XseRUMoXUXiw4M/Kw=;
 b=iGb6KCOMbntk6wtAmQI9yoMAIX0QboGW5rlYyC8/PSHcMYrPNs1rt0dbOTU13/zcVu
 jHsxFb2fdBKlOhghrwhp/95Iollbdo1xj+H+Frekknjl/L7CbOcPRmmGbt+pEuWb6Sgf
 LVi1tiJjKAmLngyWivccf5nwwOm+vqcYd6hLlRdRJ7CODOUAzkQpNLx5nO7yd/n2TgqQ
 DIHDbH4lfYr8oPhatv5zS5nMfdmKTSi9VbMEztB4899osaR2vhcNBZGSYAGdHw4hKV/H
 jCIoyLW5HnD6XKuumFOo3RxqZzwyrRyCN6yYecb5bEj61AXe8Mh9vYE1yhvbC1Lupf8K
 aX2Q==
X-Gm-Message-State: AOJu0YzbXw/M4Ho1hvv9XncrV43pGksi6eeNETaaHDPZJpEfNlw6mBYl
 0oY53F8UwjBVFtBiT2w5mHSo+toolcag15kJOPj05j7gp2zfzRoqF2fPxNpBl22i1fc=
X-Gm-Gg: Acq92OHeF1ecs9W3j4YNTYP7mBbkio/t0uYCYoVBysc2Wnw6Xc+OSLtdxD7zIYPtRKq
 jxFQOXYeU9Lx69FLP+xJ3gF2Rht8zojpiGnnEBRoiQM9VgcA0iXQ2qeBrrQ8yngiMFMvZdMloKa
 MSJgcm9pYa3c7ja9wvfJqo1PGksirwprVZ+42aBJhHacGwuKYPw+1XhPxMflHaQsrCE+V1Z0JLy
 lR1L/4u0jHL/wNNXmelagQKpwmfH67pL6h+I3mnUFZL8+LQZsDYc+N8p7Ti2Wy/JfR5qYtrIK65
 m1kVoQBW8yClpkhpNIEs9kWtu5UBtKCrq1LvsA7BkO/d2LtvwPokLSqbdkFmmEB/fi7wpz+n+zA
 3qWi+PcNRtk1sEfYMjmPMoDSE3q7Lax/R1HKqNjCMLwpzgLfpAPqe96sHdnCfV+jwShIGI62Eyr
 DGYjvR7Hxi5N+X7kZ+eiiqn3c5VID3wdnn6McnvIyLRX6AdzhKjG3HLUheZ5jcw5XztQNI
X-Received: by 2002:a05:6000:21c6:b0:45e:7418:a3f2 with SMTP id
 ffacd0b85a97d-45ef14481a4mr2087831f8f.26.1780043361671; 
 Fri, 29 May 2026 01:29:21 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34c3081sm2044621f8f.15.2026.05.29.01.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:29:21 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:29:20 +0200
Message-ID: <20260529082920.57460-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513082124.157977-1-thomas.perale@mind.be>
References: <20260513082124.157977-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043362; x=1780648162; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=txbqGmTQ5fagvNROAjzigqsMz7XseRUMoXUXiw4M/Kw=;
 b=AUEIVSAojPLx66bfYovS5yTXtrxaB0m3UbZISAfCmDPij/JBtxZ3TcFYP4V43L9zh8
 vT5Rad1zd8RGWQRiAV5gkkfTw0CDszxBEuhH+jiHXQch9m8Y+fgZBi0Rbu7bxsW3vJcP
 6kCxj/yTJhhMLHft3HragN/EqPEU3/EswLCW56E4vAPK50no7PdPgEaf4/W0uB3TuwfF
 c3t5BeuFfLN4DUG4oDxlzEpOVwcCKjeCNV2SigWk3LrODd6deVPzYCldbFGhFCNfwjsH
 NFgnjsX1UHgdPxDKEVBp6c/O9yWDgcUCGCPS2TNxnSqzqkhK7IYCEEoDvDfGRzdz5Q7c
 pmbQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=AUEIVSAo
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/linux-pam: patch
 CVE-2025-6020
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
> - CVE-2025-6020:
>     A flaw was found in linux-pam. The module pam_namespace may use access
>     user-controlled paths without proper protection, allowing local users
>     to elevate their privileges to root via multiple symlink attacks and
>     race conditions.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2025-6020
> 
> This fix was backported based on the work of the OpenEmbedded
> community. See the link to the original patches in the patch header.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  .../linux-pam/0003-inline-pam-asprintf.patch  |  103 ++
>  .../linux-pam/0004-pam-namespace-rebase.patch |  564 ++++++++
>  package/linux-pam/0005-cve-2025-6020-01.patch | 1131 +++++++++++++++++
>  package/linux-pam/0006-cve-2025-6020-02.patch |   37 +
>  package/linux-pam/0007-cve-2025-6020-03.patch |  189 +++
>  package/linux-pam/linux-pam.mk                |    5 +
>  6 files changed, 2029 insertions(+)
>  create mode 100644 package/linux-pam/0003-inline-pam-asprintf.patch
>  create mode 100644 package/linux-pam/0004-pam-namespace-rebase.patch
>  create mode 100644 package/linux-pam/0005-cve-2025-6020-01.patch
>  create mode 100644 package/linux-pam/0006-cve-2025-6020-02.patch
>  create mode 100644 package/linux-pam/0007-cve-2025-6020-03.patch
> 
> diff --git a/package/linux-pam/0003-inline-pam-asprintf.patch b/package/linux-pam/0003-inline-pam-asprintf.patch
> new file mode 100644
> index 0000000000..8751f12b73
> --- /dev/null
> +++ b/package/linux-pam/0003-inline-pam-asprintf.patch
> @@ -0,0 +1,103 @@
> +From 10b80543807e3fc5af5f8bcfd8bb6e219bb3cecc Mon Sep 17 00:00:00 2001
> +From: "Dmitry V. Levin" <ldv@strace.io>
> +Date: Tue, 18 Feb 2025 08:00:00 +0000
> +Subject: [PATCH] pam_inline: introduce pam_asprintf(), pam_snprintf(), and
> + pam_sprintf()
> +
> +pam_asprintf() is essentially asprintf() with the following semantic
> +difference: it returns the string itself instead of its length.
> +
> +pam_snprintf() is essentially snprintf() with the following semantic
> +difference: it returns -1 in case of truncation.
> +
> +pam_sprintf() is essentially snprintf() but with a check that the buffer
> +is an array, and with an automatically calculated buffer size.
> +
> +Use of these helpers would make error checking simpler.
> +
> +(cherry picked from commit 10b80543807e3fc5af5f8bcfd8bb6e219bb3cecc)
> +Signed-off-by: Dmitry V. Levin <ldv@strace.io>
> +Upstream: https://github.com/linux-pam/linux-pam/commit/10b80543807e3fc5af5f8bcfd8bb6e219bb3cecc
> +
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +Upstream: https://github.com/openembedded/openembedded-core/blob/scarthgap/meta/recipes-extended/pam/libpam/0001-pam-inline-pam-asprintf.patch
> +[thomas: backport from OpenEmbedded patch to 1.6.1]
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + libpam/include/pam_cc_compat.h |  6 ++++++
> + libpam/include/pam_inline.h    | 36 ++++++++++++++++++++++++++++++++++
> + 2 files changed, 42 insertions(+)
> + 
> +diff --git a/libpam/include/pam_cc_compat.h b/libpam/include/pam_cc_compat.h
> +index 0a6e32d..af05428 100644
> +--- a/libpam/include/pam_cc_compat.h
> ++++ b/libpam/include/pam_cc_compat.h
> +@@ -21,6 +21,12 @@
> + # define PAM_ATTRIBUTE_ALIGNED(arg)	/* empty */
> + #endif
> + 
> ++#if PAM_GNUC_PREREQ(3, 0)
> ++# define PAM_ATTRIBUTE_MALLOC		__attribute__((__malloc__))
> ++#else
> ++# define PAM_ATTRIBUTE_MALLOC		/* empty */
> ++#endif
> ++
> + #if PAM_GNUC_PREREQ(4, 6)
> + # define DIAG_PUSH_IGNORE_CAST_QUAL					\
> + 	_Pragma("GCC diagnostic push");					\
> +diff --git a/libpam/include/pam_inline.h b/libpam/include/pam_inline.h
> +index 7721c0b..ec0497c 100644
> +--- a/libpam/include/pam_inline.h
> ++++ b/libpam/include/pam_inline.h
> +@@ -9,6 +9,8 @@
> + #define PAM_INLINE_H
> + 
> + #include "pam_cc_compat.h"
> ++#include <stdarg.h>
> ++#include <stdio.h>
> + #include <stdlib.h>
> + #include <string.h>
> + #include <unistd.h>
> +@@ -126,6 +128,40 @@ pam_drop_response(struct pam_response *reply, int replies)
> + }
> + 
> + 
> ++static inline char * PAM_FORMAT((printf, 1, 2)) PAM_NONNULL((1)) PAM_ATTRIBUTE_MALLOC
> ++pam_asprintf(const char *fmt, ...)
> ++{
> ++	int rc;
> ++	char *res;
> ++	va_list ap;
> ++
> ++	va_start(ap, fmt);
> ++	rc = vasprintf(&res, fmt, ap);
> ++	va_end(ap);
> ++
> ++	return rc < 0 ? NULL : res;
> ++}
> ++
> ++static inline int PAM_FORMAT((printf, 3, 4)) PAM_NONNULL((3))
> ++pam_snprintf(char *str, size_t size, const char *fmt, ...)
> ++{
> ++	int rc;
> ++	va_list ap;
> ++
> ++	va_start(ap, fmt);
> ++	rc = vsnprintf(str, size, fmt, ap);
> ++	va_end(ap);
> ++
> ++	if (rc < 0 || (unsigned int) rc >= size)
> ++		return -1;
> ++	return rc;
> ++}
> ++
> ++#define pam_sprintf(str_, fmt_, ...)						\
> ++	pam_snprintf((str_), sizeof(str_) + PAM_MUST_BE_ARRAY(str_), (fmt_),	\
> ++		     ##__VA_ARGS__)
> ++
> ++
> + static inline int
> + pam_read_passwords(int fd, int npass, char **passwords)
> + {
> +-- 
> +2.49.0
> diff --git a/package/linux-pam/0004-pam-namespace-rebase.patch b/package/linux-pam/0004-pam-namespace-rebase.patch
> new file mode 100644
> index 0000000000..7291fa5abf
> --- /dev/null
> +++ b/package/linux-pam/0004-pam-namespace-rebase.patch
> @@ -0,0 +1,564 @@
> +From df1dab1a1a7900650ad4be157fea1a002048cc49 Mon Sep 17 00:00:00 2001
> +From: Olivier Bal-Petre <olivier.bal-petre@ssi.gouv.fr>
> +Date: Tue, 4 Mar 2025 14:37:02 +0100
> +Subject: [PATCH] pam-namespace-rebase
> +
> +Refresh the pam-namespace.
> +
> +Upstream: https://github.com/linux-pam/linux-pam/commit/a8b4dce7b53d73de372e150028c970ee0a2a2e97
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +Upstream: https://github.com/openembedded/openembedded-core/blob/scarthgap/meta/recipes-extended/pam/libpam/0002-pam-namespace-rebase.patch
> +[thomas: backport from OpenEmbedded patch to 1.6.1]
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + modules/pam_namespace/pam_namespace.c | 444 +++++++++++++-------------
> + modules/pam_namespace/pam_namespace.h |   7 +-
> + 2 files changed, 224 insertions(+), 227 deletions(-)
> + 
> +diff --git a/modules/pam_namespace/pam_namespace.c b/modules/pam_namespace/pam_namespace.c
> +index b026861..166bfce 100644
> +--- a/modules/pam_namespace/pam_namespace.c
> ++++ b/modules/pam_namespace/pam_namespace.c
> +@@ -63,6 +63,147 @@ static void close_fds_pre_exec(struct instance_data *idata)
> + 	}
> + }
> + 
> ++static void
> ++strip_trailing_slashes(char *str)
> ++{
> ++	char *p = str + strlen(str);
> ++
> ++	while (--p > str && *p == '/')
> ++		*p = '\0';
> ++}
> ++
> ++static int protect_mount(int dfd, const char *path, struct instance_data *idata)
> ++{
> ++	struct protect_dir_s *dir = idata->protect_dirs;
> ++	char tmpbuf[64];
> ++
> ++	while (dir != NULL) {
> ++		if (strcmp(path, dir->dir) == 0) {
> ++			return 0;
> ++		}
> ++		dir = dir->next;
> ++	}
> ++
> ++	if (pam_sprintf(tmpbuf, "/proc/self/fd/%d", dfd) < 0)
> ++		return -1;
> ++
> ++	dir = calloc(1, sizeof(*dir));
> ++
> ++	if (dir == NULL) {
> ++		return -1;
> ++	}
> ++
> ++	dir->dir = strdup(path);
> ++
> ++	if (dir->dir == NULL) {
> ++		free(dir);
> ++		return -1;
> ++	}
> ++
> ++	if (idata->flags & PAMNS_DEBUG) {
> ++		pam_syslog(idata->pamh, LOG_INFO,
> ++			"Protect mount of %s over itself", path);
> ++	}
> ++
> ++	if (mount(tmpbuf, tmpbuf, NULL, MS_BIND, NULL) != 0) {
> ++		int save_errno = errno;
> ++		pam_syslog(idata->pamh, LOG_ERR,
> ++			"Protect mount of %s failed: %m", tmpbuf);
> ++		free(dir->dir);
> ++		free(dir);
> ++		errno = save_errno;
> ++		return -1;
> ++	}
> ++
> ++	dir->next = idata->protect_dirs;
> ++	idata->protect_dirs = dir;
> ++
> ++	return 0;
> ++}
> ++
> ++static int protect_dir(const char *path, mode_t mode, int do_mkdir,
> ++	struct instance_data *idata)
> ++{
> ++	char *p = strdup(path);
> ++	char *d;
> ++	char *dir = p;
> ++	int dfd = AT_FDCWD;
> ++	int dfd_next;
> ++	int save_errno;
> ++	int flags = O_RDONLY | O_DIRECTORY;
> ++	int rv = -1;
> ++	struct stat st;
> ++
> ++	if (p == NULL) {
> ++		return -1;
> ++	}
> ++
> ++	if (*dir == '/') {
> ++		dfd = open("/", flags);
> ++		if (dfd == -1) {
> ++			goto error;
> ++		}
> ++		dir++;	/* assume / is safe */
> ++	}
> ++
> ++	while ((d=strchr(dir, '/')) != NULL) {
> ++		*d = '\0';
> ++		dfd_next = openat(dfd, dir, flags);
> ++		if (dfd_next == -1) {
> ++			goto error;
> ++		}
> ++
> ++		if (dfd != AT_FDCWD)
> ++			close(dfd);
> ++		dfd = dfd_next;
> ++
> ++		if (fstat(dfd, &st) != 0) {
> ++			goto error;
> ++		}
> ++
> ++		if (flags & O_NOFOLLOW) {
> ++			/* we are inside user-owned dir - protect */
> ++			if (protect_mount(dfd, p, idata) == -1)
> ++				goto error;
> ++		} else if (st.st_uid != 0 || st.st_gid != 0 ||
> ++			(st.st_mode & S_IWOTH)) {
> ++			/* do not follow symlinks on subdirectories */
> ++			flags |= O_NOFOLLOW;
> ++		}
> ++
> ++		*d = '/';
> ++		dir = d + 1;
> ++	}
> ++
> ++	rv = openat(dfd, dir, flags);
> ++
> ++	if (rv == -1) {
> ++		if (!do_mkdir || mkdirat(dfd, dir, mode) != 0) {
> ++			goto error;
> ++		}
> ++		rv = openat(dfd, dir, flags);
> ++	}
> ++
> ++	if (flags & O_NOFOLLOW) {
> ++		/* we are inside user-owned dir - protect */
> ++		if (protect_mount(rv, p, idata) == -1) {
> ++			save_errno = errno;
> ++			close(rv);
> ++			rv = -1;
> ++			errno = save_errno;
> ++		}
> ++	}
> ++
> ++error:
> ++	save_errno = errno;
> ++	free(p);
> ++	if (dfd != AT_FDCWD && dfd >= 0)
> ++		close(dfd);
> ++	errno = save_errno;
> ++
> ++	return rv;
> ++}
> ++
> + /* Evaluating a list of files which have to be parsed in the right order:
> +  *
> +  * - If etc/security/namespace.d/@filename@.conf exists, then
> +@@ -137,6 +278,7 @@ static char **read_namespace_dir(struct instance_data *idata)
> + 	return file_list;
> + }
> + 
> ++
> + /*
> +  * Adds an entry for a polyinstantiated directory to the linked list of
> +  * polyinstantiated directories. It is called from process_line() while
> +@@ -319,8 +461,7 @@ static int parse_iscript_params(char *params, struct polydir_s *poly)
> + 
> +     if (*params != '\0') {
> + 	if (*params != '/') { /* path is relative to NAMESPACE_D_DIR */
> +-		if (asprintf(&poly->init_script, "%s%s", NAMESPACE_D_DIR, params) == -1)
> +-			return -1;
> ++		poly->init_script = pam_asprintf("%s%s", NAMESPACE_D_DIR, params);
> + 	} else {
> + 		poly->init_script = strdup(params);
> + 	}
> +@@ -482,6 +623,7 @@ static int process_line(char *line, const char *home, const char *rhome,
> + 			struct instance_data *idata)
> + {
> +     char *dir = NULL, *instance_prefix = NULL, *rdir = NULL;
> ++    const char *config_dir, *config_instance_prefix;
> +     char *method, *uids;
> +     char *tptr;
> +     struct polydir_s *poly;
> +@@ -490,7 +632,6 @@ static int process_line(char *line, const char *home, const char *rhome,
> +     static const char *const var_names[] = {"HOME", "USER", NULL};
> +     const char *var_values[] = {home, idata->user};
> +     const char *rvar_values[] = {rhome, idata->ruser};
> +-    size_t len;
> + 
> +     /*
> +      * skip the leading white space
> +@@ -531,22 +672,19 @@ static int process_line(char *line, const char *home, const char *rhome,
> +         goto erralloc;
> +     }
> + 
> +-    dir = config_options[0];
> +-    if (dir == NULL) {
> ++    config_dir = config_options[0];
> ++    if (config_dir == NULL) {
> +         pam_syslog(idata->pamh, LOG_NOTICE, "Invalid line missing polydir");
> +         goto skipping;
> +     }
> +-    instance_prefix = config_options[1];
> +-    if (instance_prefix == NULL) {
> ++    config_instance_prefix = config_options[1];
> ++    if (config_instance_prefix == NULL) {
> +         pam_syslog(idata->pamh, LOG_NOTICE, "Invalid line missing instance_prefix");
> +-        dir = NULL;
> +         goto skipping;
> +     }
> +     method = config_options[2];
> +     if (method == NULL) {
> +         pam_syslog(idata->pamh, LOG_NOTICE, "Invalid line missing method");
> +-        instance_prefix = NULL;
> +-        dir = NULL;
> +         goto skipping;
> +     }
> + 
> +@@ -561,19 +699,16 @@ static int process_line(char *line, const char *home, const char *rhome,
> +     /*
> +      * Expand $HOME and $USER in poly dir and instance dir prefix
> +      */
> +-    if ((rdir=expand_variables(dir, var_names, rvar_values)) == NULL) {
> +-	    instance_prefix = NULL;
> +-	    dir = NULL;
> ++    if ((rdir = expand_variables(config_dir, var_names, rvar_values)) == NULL) {
> + 	    goto erralloc;
> +     }
> + 
> +-    if ((dir=expand_variables(dir, var_names, var_values)) == NULL) {
> +-	    instance_prefix = NULL;
> ++    if ((dir = expand_variables(config_dir, var_names, var_values)) == NULL) {
> + 	    goto erralloc;
> +     }
> + 
> +-    if ((instance_prefix=expand_variables(instance_prefix, var_names, var_values))
> +-	    == NULL) {
> ++    if ((instance_prefix = expand_variables(config_instance_prefix,
> ++					    var_names, var_values)) == NULL) {
> + 	    goto erralloc;
> +     }
> + 
> +@@ -583,15 +718,8 @@ static int process_line(char *line, const char *home, const char *rhome,
> + 	    pam_syslog(idata->pamh, LOG_DEBUG, "Expanded instance prefix: '%s'", instance_prefix);
> +     }
> + 
> +-    len = strlen(dir);
> +-    if (len > 0 && dir[len-1] == '/') {
> +-	    dir[len-1] = '\0';
> +-    }
> +-
> +-    len = strlen(rdir);
> +-    if (len > 0 && rdir[len-1] == '/') {
> +-	    rdir[len-1] = '\0';
> +-    }
> ++    strip_trailing_slashes(dir);
> ++    strip_trailing_slashes(rdir);
> + 
> +     if (dir[0] == '\0' || rdir[0] == '\0') {
> + 	    pam_syslog(idata->pamh, LOG_NOTICE, "Invalid polydir");
> +@@ -1003,6 +1131,7 @@ static int form_context(const struct polydir_s *polyptr,
> + 		return rc;
> + 	}
> + 	/* Should never get here */
> ++	freecon(scon);
> + 	return PAM_SUCCESS;
> + }
> + #endif
> +@@ -1064,10 +1193,8 @@ static int poly_name(const struct polydir_s *polyptr, char **i_name,
> + 
> +     switch (pm) {
> +         case USER:
> +-	    if (asprintf(i_name, "%s", idata->user) < 0) {
> +-		*i_name = NULL;
> ++	    if ((*i_name = strdup(idata->user)) == NULL)
> + 		goto fail;
> +-	    }
> + 	    break;
> + 
> + #ifdef WITH_SELINUX
> +@@ -1077,17 +1204,12 @@ static int poly_name(const struct polydir_s *polyptr, char **i_name,
> + 		pam_syslog(idata->pamh, LOG_ERR, "Error translating directory context");
> + 		goto fail;
> + 	    }
> +-	    if (polyptr->flags & POLYDIR_SHARED) {
> +-		if (asprintf(i_name, "%s", rawcon) < 0) {
> +-			*i_name = NULL;
> +-			goto fail;
> +-		}
> +-	    } else {
> +-		if (asprintf(i_name, "%s_%s", rawcon, idata->user) < 0) {
> +-			*i_name = NULL;
> +-			goto fail;
> +-		}
> +-	    }
> ++	    if (polyptr->flags & POLYDIR_SHARED)
> ++		*i_name = strdup(rawcon);
> ++	    else
> ++		*i_name = pam_asprintf("%s_%s", rawcon, idata->user);
> ++	    if (*i_name == NULL)
> ++		goto fail;
> + 	    break;
> + 
> + #endif /* WITH_SELINUX */
> +@@ -1117,11 +1239,12 @@ static int poly_name(const struct polydir_s *polyptr, char **i_name,
> + 	    *i_name = hash;
> + 	    hash = NULL;
> +         } else {
> +-	    char *newname;
> +-	    if (asprintf(&newname, "%.*s_%s", NAMESPACE_MAX_DIR_LEN-1-(int)strlen(hash),
> +-		*i_name, hash) < 0) {
> ++	    char *newname =
> ++		pam_asprintf("%.*s_%s",
> ++			     NAMESPACE_MAX_DIR_LEN - 1 - (int)strlen(hash),
> ++			     *i_name, hash);
> ++	    if (newname == NULL)
> + 		goto fail;
> +-	    }
> + 	    free(*i_name);
> + 	    *i_name = newname;
> +         }
> +@@ -1146,137 +1269,6 @@ fail:
> +     return rc;
> + }
> + 
> +-static int protect_mount(int dfd, const char *path, struct instance_data *idata)
> +-{
> +-	struct protect_dir_s *dir = idata->protect_dirs;
> +-	char tmpbuf[64];
> +-
> +-	while (dir != NULL) {
> +-		if (strcmp(path, dir->dir) == 0) {
> +-			return 0;
> +-		}
> +-		dir = dir->next;
> +-	}
> +-
> +-	dir = calloc(1, sizeof(*dir));
> +-
> +-	if (dir == NULL) {
> +-		return -1;
> +-	}
> +-
> +-	dir->dir = strdup(path);
> +-
> +-	if (dir->dir == NULL) {
> +-		free(dir);
> +-		return -1;
> +-	}
> +-
> +-	snprintf(tmpbuf, sizeof(tmpbuf), "/proc/self/fd/%d", dfd);
> +-
> +-	if (idata->flags & PAMNS_DEBUG) {
> +-		pam_syslog(idata->pamh, LOG_INFO,
> +-			"Protect mount of %s over itself", path);
> +-	}
> +-
> +-	if (mount(tmpbuf, tmpbuf, NULL, MS_BIND, NULL) != 0) {
> +-		int save_errno = errno;
> +-		pam_syslog(idata->pamh, LOG_ERR,
> +-			"Protect mount of %s failed: %m", tmpbuf);
> +-		free(dir->dir);
> +-		free(dir);
> +-		errno = save_errno;
> +-		return -1;
> +-	}
> +-
> +-	dir->next = idata->protect_dirs;
> +-	idata->protect_dirs = dir;
> +-
> +-	return 0;
> +-}
> +-
> +-static int protect_dir(const char *path, mode_t mode, int do_mkdir,
> +-	struct instance_data *idata)
> +-{
> +-	char *p = strdup(path);
> +-	char *d;
> +-	char *dir = p;
> +-	int dfd = AT_FDCWD;
> +-	int dfd_next;
> +-	int save_errno;
> +-	int flags = O_RDONLY | O_DIRECTORY;
> +-	int rv = -1;
> +-	struct stat st;
> +-
> +-	if (p == NULL) {
> +-		goto error;
> +-	}
> +-
> +-	if (*dir == '/') {
> +-		dfd = open("/", flags);
> +-		if (dfd == -1) {
> +-			goto error;
> +-		}
> +-		dir++;	/* assume / is safe */
> +-	}
> +-
> +-	while ((d=strchr(dir, '/')) != NULL) {
> +-		*d = '\0';
> +-		dfd_next = openat(dfd, dir, flags);
> +-		if (dfd_next == -1) {
> +-			goto error;
> +-		}
> +-
> +-		if (dfd != AT_FDCWD)
> +-			close(dfd);
> +-		dfd = dfd_next;
> +-
> +-		if (fstat(dfd, &st) != 0) {
> +-			goto error;
> +-		}
> +-
> +-		if (flags & O_NOFOLLOW) {
> +-			/* we are inside user-owned dir - protect */
> +-			if (protect_mount(dfd, p, idata) == -1)
> +-				goto error;
> +-		} else if (st.st_uid != 0 || st.st_gid != 0 ||
> +-			(st.st_mode & S_IWOTH)) {
> +-			/* do not follow symlinks on subdirectories */
> +-			flags |= O_NOFOLLOW;
> +-		}
> +-
> +-		*d = '/';
> +-		dir = d + 1;
> +-	}
> +-
> +-	rv = openat(dfd, dir, flags);
> +-
> +-	if (rv == -1) {
> +-		if (!do_mkdir || mkdirat(dfd, dir, mode) != 0) {
> +-			goto error;
> +-		}
> +-		rv = openat(dfd, dir, flags);
> +-	}
> +-
> +-	if (flags & O_NOFOLLOW) {
> +-		/* we are inside user-owned dir - protect */
> +-		if (protect_mount(rv, p, idata) == -1) {
> +-			save_errno = errno;
> +-			close(rv);
> +-			rv = -1;
> +-			errno = save_errno;
> +-		}
> +-	}
> +-
> +-error:
> +-	save_errno = errno;
> +-	free(p);
> +-	if (dfd != AT_FDCWD && dfd >= 0)
> +-		close(dfd);
> +-	errno = save_errno;
> +-
> +-	return rv;
> +-}
> +-
> + static int check_inst_parent(char *ipath, struct instance_data *idata)
> + {
> + 	struct stat instpbuf;
> +@@ -1380,8 +1372,8 @@ static int inst_init(const struct polydir_s *polyptr, const char *ipath,
> + 
> + 				close_fds_pre_exec(idata);
> + 
> +-				if (execle(init_script, init_script,
> +-					polyptr->dir, ipath, newdir?"1":"0", idata->user, NULL, envp) < 0)
> ++				execle(init_script, init_script,
> ++					polyptr->dir, ipath, newdir?"1":"0", idata->user, NULL, envp);
> + 					_exit(1);
> + 			} else if (pid > 0) {
> + 				while (((rc = waitpid(pid, &status, 0)) == (pid_t)-1) &&
> +@@ -1432,7 +1424,9 @@ static int create_polydir(struct polydir_s *polyptr,
> + 
> + #ifdef WITH_SELINUX
> +     if (idata->flags & PAMNS_SELINUX_ENABLED) {
> +-	getfscreatecon_raw(&oldcon_raw);
> ++	if (getfscreatecon_raw(&oldcon_raw) != 0)
> ++	    pam_syslog(idata->pamh, LOG_NOTICE,
> ++	               "Error retrieving fs create context: %m");
> + 
> + 	label_handle = selabel_open(SELABEL_CTX_FILE, NULL, 0);
> + 	if (!label_handle) {
> +@@ -1461,6 +1455,9 @@ static int create_polydir(struct polydir_s *polyptr,
> +     if (rc == -1) {
> +             pam_syslog(idata->pamh, LOG_ERR,
> +                        "Error creating directory %s: %m", dir);
> ++#ifdef WITH_SELINUX
> ++            freecon(oldcon_raw);
> ++#endif
> +             return PAM_SESSION_ERR;
> +     }
> + 
> +@@ -1648,16 +1645,14 @@ static int ns_setup(struct polydir_s *polyptr,
> + 
> +     retval = protect_dir(polyptr->dir, 0, 0, idata);
> + 
> +-    if (retval < 0 && errno != ENOENT) {
> +-	pam_syslog(idata->pamh, LOG_ERR, "Polydir %s access error: %m",
> +-		polyptr->dir);
> +-	return PAM_SESSION_ERR;
> +-    }
> +-
> +     if (retval < 0) {
> +-	if ((polyptr->flags & POLYDIR_CREATE) &&
> +-		create_polydir(polyptr, idata) != PAM_SUCCESS)
> +-		return PAM_SESSION_ERR;
> ++        if (errno != ENOENT || !(polyptr->flags & POLYDIR_CREATE)) {
> ++            pam_syslog(idata->pamh, LOG_ERR, "Polydir %s access error: %m",
> ++                    polyptr->dir);
> ++            return PAM_SESSION_ERR;
> ++        }
> ++        if (create_polydir(polyptr, idata) != PAM_SUCCESS)
> ++            return PAM_SESSION_ERR;
> +     } else {
> + 	close(retval);
> +     }
> +@@ -1706,7 +1701,7 @@ static int ns_setup(struct polydir_s *polyptr,
> + #endif
> +     }
> + 
> +-    if (asprintf(&inst_dir, "%s%s", polyptr->instance_prefix, instname) < 0)
> ++    if ((inst_dir = pam_asprintf("%s%s", polyptr->instance_prefix, instname)) == NULL)
> + 	goto error_out;
> + 
> +     if (idata->flags & PAMNS_DEBUG)
> +diff --git a/modules/pam_namespace/pam_namespace.h b/modules/pam_namespace/pam_namespace.h
> +index a991b4c..180e042 100644
> +--- a/modules/pam_namespace/pam_namespace.h
> ++++ b/modules/pam_namespace/pam_namespace.h
> +@@ -44,21 +44,17 @@
> + #include <stdlib.h>
> + #include <errno.h>
> + #include <syslog.h>
> +-#include <dlfcn.h>
> +-#include <stdarg.h>
> + #include <pwd.h>
> + #include <grp.h>
> + #include <limits.h>
> + #include <sys/types.h>
> + #include <sys/stat.h>
> +-#include <sys/resource.h>
> + #include <sys/mount.h>
> + #include <sys/wait.h>
> + #include <libgen.h>
> + #include <fcntl.h>
> + #include <sched.h>
> + #include <glob.h>
> +-#include <locale.h>
> + #include "security/pam_modules.h"
> + #include "security/pam_modutil.h"
> + #include "security/pam_ext.h"
> +-- 
> +2.49.0
> diff --git a/package/linux-pam/0005-cve-2025-6020-01.patch b/package/linux-pam/0005-cve-2025-6020-01.patch
> new file mode 100644
> index 0000000000..6015d43faa
> --- /dev/null
> +++ b/package/linux-pam/0005-cve-2025-6020-01.patch
> @@ -0,0 +1,1131 @@
> +From 475bd60c552b98c7eddb3270b0b4196847c0072e Mon Sep 17 00:00:00 2001
> +From: Olivier Bal-Petre <olivier.bal-petre@ssi.gouv.fr>
> +Date: Tue, 4 Mar 2025 14:37:02 +0100
> +Subject: [PATCH] pam_namespace: fix potential privilege escalation
> +
> +Existing protection provided by protect_dir() and protect_mount() were
> +bind mounting on themselves all directories part of the to-be-secured
> +paths. However, this works *only* against attacks executed by processes
> +in the same mount namespace as the one the mountpoint was created in.
> +Therefore, a user with an out-of-mount-namespace access, or multiple
> +users colluding, could exploit multiple race conditions, and, for
> +instance, elevate their privileges to root.
> +
> +This commit keeps the existing protection as a defense in depth
> +measure, and to keep the existing behavior of the module. However,
> +it converts all the needed function calls to operate on file
> +descriptors instead of absolute paths to protect against race
> +conditions globally.
> +
> +Signed-off-by: Olivier Bal-Petre <olivier.bal-petre@ssi.gouv.fr>
> +Signed-off-by: Dmitry V. Levin <ldv@strace.io>
> +Upstream: https://github.com/linux-pam/linux-pam/commit/475bd60c552b98c7eddb3270b0b4196847c0072e
> +
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +Upstream: https://github.com/openembedded/openembedded-core/blob/scarthgap/meta/recipes-extended/pam/libpam/CVE-2025-6020-01.patch
> +CVE: CVE-2025-6020
> +[thomas: backport from OpenEmbedded patch to 1.6.1]
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + modules/pam_namespace/pam_namespace.c | 637 ++++++++++++++++++--------
> + modules/pam_namespace/pam_namespace.h |  10 +
> + 2 files changed, 457 insertions(+), 190 deletions(-)
> + 
> +diff --git a/modules/pam_namespace/pam_namespace.c b/modules/pam_namespace/pam_namespace.c
> +index 166bfce..9d993d4 100644
> +--- a/modules/pam_namespace/pam_namespace.c
> ++++ b/modules/pam_namespace/pam_namespace.c
> +@@ -41,6 +41,8 @@
> + #include "pam_namespace.h"
> + #include "argv_parse.h"
> + 
> ++#define MAGIC_LNK_FD_SIZE 64
> ++
> + /* --- evaluating all files in VENDORDIR/security/namespace.d and /etc/security/namespace.d --- */
> + static const char *base_name(const char *path)
> + {
> +@@ -75,7 +77,7 @@ strip_trailing_slashes(char *str)
> + static int protect_mount(int dfd, const char *path, struct instance_data *idata)
> + {
> + 	struct protect_dir_s *dir = idata->protect_dirs;
> +-	char tmpbuf[64];
> ++	char tmpbuf[MAGIC_LNK_FD_SIZE];
> + 
> + 	while (dir != NULL) {
> + 		if (strcmp(path, dir->dir) == 0) {
> +@@ -121,56 +123,107 @@ static int protect_mount(int dfd, const char *path, struct instance_data *idata)
> + 	return 0;
> + }
> + 
> +-static int protect_dir(const char *path, mode_t mode, int do_mkdir,
> ++/*
> ++ * Returns a fd to the given absolute path, acquired securely. This means:
> ++ * - iterating on each segment of the path,
> ++ * - not following user symlinks,
> ++ * - using race-free operations.
> ++ *
> ++ * Takes a bit mask to specify the operation mode:
> ++ * - SECURE_OPENDIR_PROTECT: call protect_mount() on each unsafe segment of path
> ++ * - SECURE_OPENDIR_MKDIR: create last segment of path if does not exist
> ++ * - SECURE_OPENDIR_FULL_FD: open the directory with O_RDONLY instead of O_PATH,
> ++ *     allowing more operations to be done with the returned fd
> ++ *
> ++ * Be aware that using SECURE_OPENDIR_PROTECT:
> ++ * - will modify some external state (global structure...) and should not be
> ++ *   called in cleanup code paths. See wrapper secure_opendir_stateless()
> ++ * - need a non-NULL idata to call protect_mount()
> ++ */
> ++static int secure_opendir(const char *path, int opm, mode_t mode,
> + 	struct instance_data *idata)
> + {
> +-	char *p = strdup(path);
> ++	char *p;
> + 	char *d;
> +-	char *dir = p;
> +-	int dfd = AT_FDCWD;
> ++	char *dir;
> ++	int dfd = -1;
> + 	int dfd_next;
> + 	int save_errno;
> +-	int flags = O_RDONLY | O_DIRECTORY;
> ++	int flags = O_DIRECTORY | O_CLOEXEC;
> + 	int rv = -1;
> + 	struct stat st;
> + 
> +-	if (p == NULL) {
> ++	if (opm & SECURE_OPENDIR_FULL_FD)
> ++		flags |= O_RDONLY;
> ++	else
> ++		flags |= O_PATH;
> ++
> ++	/* Check for args consistency */
> ++	if ((opm & SECURE_OPENDIR_PROTECT) && idata == NULL)
> + 		return -1;
> +-	}
> + 
> +-	if (*dir == '/') {
> +-		dfd = open("/", flags);
> +-		if (dfd == -1) {
> +-			goto error;
> +-		}
> +-		dir++;	/* assume / is safe */
> ++	/* Accept only absolute paths */
> ++	if (*path != '/')
> ++		return -1;
> ++
> ++	dir = p = strdup(path);
> ++	if (p == NULL)
> ++		return -1;
> ++
> ++	/* Assume '/' is safe */
> ++	dfd = open("/", flags);
> ++	if (dfd == -1)
> ++		goto error;
> ++
> ++	/* Needed to not loop too far and call openat() on NULL */
> ++	strip_trailing_slashes(p);
> ++
> ++	dir++;
> ++
> ++	/* In case path is '/' */
> ++	if (*dir == '\0') {
> ++		free(p);
> ++		return dfd;
> + 	}
> + 
> + 	while ((d=strchr(dir, '/')) != NULL) {
> + 		*d = '\0';
> ++
> + 		dfd_next = openat(dfd, dir, flags);
> +-		if (dfd_next == -1) {
> ++		if (dfd_next == -1)
> + 			goto error;
> +-		}
> +-
> +-		if (dfd != AT_FDCWD)
> +-			close(dfd);
> +-		dfd = dfd_next;
> + 
> +-		if (fstat(dfd, &st) != 0) {
> ++		if (fstat(dfd_next, &st) != 0) {
> ++			close(dfd_next);
> + 			goto error;
> + 		}
> + 
> +-		if (flags & O_NOFOLLOW) {
> ++		if ((flags & O_NOFOLLOW) && (opm & SECURE_OPENDIR_PROTECT)) {
> + 			/* we are inside user-owned dir - protect */
> +-			if (protect_mount(dfd, p, idata) == -1)
> ++			if (protect_mount(dfd_next, p, idata) == -1) {
> ++				close(dfd_next);
> ++				goto error;
> ++			}
> ++			/*
> ++			 * Reopen the directory to obtain a new descriptor
> ++			 * after protect_mount(), this is necessary in cases
> ++			 * when another directory is going to be mounted over
> ++			 * the given path.
> ++			 */
> ++			close(dfd_next);
> ++			dfd_next = openat(dfd, dir, flags);
> ++			if (dfd_next == -1)
> + 				goto error;
> +-		} else if (st.st_uid != 0 || st.st_gid != 0 ||
> +-			(st.st_mode & S_IWOTH)) {
> ++		} else if (st.st_uid != 0
> ++		           || (st.st_gid != 0 && (st.st_mode & S_IWGRP))
> ++		           || (st.st_mode & S_IWOTH)) {
> + 			/* do not follow symlinks on subdirectories */
> + 			flags |= O_NOFOLLOW;
> + 		}
> + 
> ++		close(dfd);
> ++		dfd = dfd_next;
> ++
> + 		*d = '/';
> + 		dir = d + 1;
> + 	}
> +@@ -178,13 +231,14 @@ static int protect_dir(const char *path, mode_t mode, int do_mkdir,
> + 	rv = openat(dfd, dir, flags);
> + 
> + 	if (rv == -1) {
> +-		if (!do_mkdir || mkdirat(dfd, dir, mode) != 0) {
> ++		if ((opm & SECURE_OPENDIR_MKDIR) && mkdirat(dfd, dir, mode) == 0)
> ++			rv = openat(dfd, dir, flags);
> ++
> ++		if (rv == -1)
> + 			goto error;
> +-		}
> +-		rv = openat(dfd, dir, flags);
> + 	}
> + 
> +-	if (flags & O_NOFOLLOW) {
> ++	if ((flags & O_NOFOLLOW) && (opm & SECURE_OPENDIR_PROTECT)) {
> + 		/* we are inside user-owned dir - protect */
> + 		if (protect_mount(rv, p, idata) == -1) {
> + 			save_errno = errno;
> +@@ -192,18 +246,95 @@ static int protect_dir(const char *path, mode_t mode, int do_mkdir,
> + 			rv = -1;
> + 			errno = save_errno;
> + 		}
> ++		/*
> ++		 * Reopen the directory to obtain a new descriptor after
> ++		 * protect_mount(), this is necessary in cases when another
> ++		 * directory is going to be mounted over the given path.
> ++		 */
> ++		close(rv);
> ++		rv = openat(dfd, dir, flags);
> + 	}
> + 
> + error:
> + 	save_errno = errno;
> + 	free(p);
> +-	if (dfd != AT_FDCWD && dfd >= 0)
> ++	if (dfd >= 0)
> + 		close(dfd);
> + 	errno = save_errno;
> + 
> + 	return rv;
> + }
> + 
> ++/*
> ++ * Returns a fd to the given path, acquired securely.
> ++ * It can be called in all situations, including in cleanup code paths, as
> ++ * it does not modify external state (no access to global structures...).
> ++ */
> ++static int secure_opendir_stateless(const char *path)
> ++{
> ++	return secure_opendir(path, 0, 0, NULL);
> ++}
> ++
> ++/*
> ++ * Umount securely the given path, even if the directories along
> ++ * the path are under user control. It should protect against
> ++ * symlinks attacks and race conditions.
> ++ */
> ++static int secure_umount(const char *path)
> ++{
> ++	int save_errno;
> ++	int rv = -1;
> ++	int dfd = -1;
> ++	char s_path[MAGIC_LNK_FD_SIZE];
> ++
> ++	dfd = secure_opendir_stateless(path);
> ++	if (dfd == -1)
> ++		return rv;
> ++
> ++	if (pam_sprintf(s_path, "/proc/self/fd/%d", dfd) < 0)
> ++		goto error;
> ++
> ++	/*
> ++	* We still have a fd open to path itself,
> ++	* so we need to do a lazy umount.
> ++	*/
> ++	rv = umount2(s_path, MNT_DETACH);
> ++
> ++error:
> ++	save_errno = errno;
> ++	close(dfd);
> ++	errno = save_errno;
> ++	return rv;
> ++}
> ++
> ++/*
> ++ * Rmdir the given path securely, protecting against symlinks attacks
> ++ * and race conditions.
> ++ * This function is currently called only in cleanup code paths where
> ++ * any errors returned are not handled, so do not handle them either.
> ++ * Basically, try to rmdir the path on a best-effort basis.
> ++ */
> ++static void secure_try_rmdir(const char *path)
> ++{
> ++	int dfd;
> ++	char *buf;
> ++	char *parent;
> ++
> ++	buf = strdup(path);
> ++	if (buf == NULL)
> ++		return;
> ++
> ++	parent = dirname(buf);
> ++
> ++	dfd = secure_opendir_stateless(parent);
> ++	if (dfd >= 0) {
> ++		unlinkat(dfd, base_name(path), AT_REMOVEDIR);
> ++		close(dfd);
> ++	}
> ++
> ++	free(buf);
> ++}
> ++
> + /* Evaluating a list of files which have to be parsed in the right order:
> +  *
> +  * - If etc/security/namespace.d/@filename@.conf exists, then
> +@@ -330,7 +461,7 @@ static void unprotect_dirs(struct protect_dir_s *dir)
> + 	struct protect_dir_s *next;
> + 
> + 	while (dir != NULL) {
> +-		umount(dir->dir);
> ++		secure_umount(dir->dir);
> + 		free(dir->dir);
> + 		next = dir->next;
> + 		free(dir);
> +@@ -734,14 +865,9 @@ static int process_line(char *line, const char *home, const char *rhome,
> + 	    goto skipping;
> +     }
> + 
> +-#define COPY_STR(dst, src, apd)                                \
> +-	(snprintf((dst), sizeof(dst), "%s%s", (src), (apd)) != \
> +-		  (ssize_t) (strlen(src) + strlen(apd)))
> +-
> +-    if (COPY_STR(poly->dir, dir, "")
> +-	|| COPY_STR(poly->rdir, rdir, "")
> +-	|| COPY_STR(poly->instance_prefix, instance_prefix,
> +-		    poly->method == TMPDIR ? "XXXXXX" : "")) {
> ++    if (pam_sprintf(poly->dir, "%s", dir) < 0
> ++	|| pam_sprintf(poly->rdir, "%s", rdir) < 0
> ++	|| pam_sprintf(poly->instance_prefix, "%s", instance_prefix) < 0) {
> + 	pam_syslog(idata->pamh, LOG_NOTICE, "Pathnames too long");
> + 	goto skipping;
> +     }
> +@@ -1024,6 +1150,23 @@ static char *md5hash(const char *instname, struct instance_data *idata)
> + }
> + 
> + #ifdef WITH_SELINUX
> ++static char *secure_getfilecon(pam_handle_t *pamh, const char *dir)
> ++{
> ++	char *ctx = NULL;
> ++	int dfd = secure_opendir(dir, SECURE_OPENDIR_FULL_FD, 0, NULL);
> ++	if (dfd < 0) {
> ++		pam_syslog(pamh, LOG_ERR, "Error getting fd to %s: %m", dir);
> ++		return NULL;
> ++	}
> ++	if (fgetfilecon(dfd, &ctx) < 0)
> ++		ctx = NULL;
> ++	if (ctx == NULL)
> ++		pam_syslog(pamh, LOG_ERR,
> ++			   "Error getting poly dir context for %s: %m", dir);
> ++	close(dfd);
> ++	return ctx;
> ++}
> ++
> + static int form_context(const struct polydir_s *polyptr,
> + 		char **i_context, char **origcon,
> + 		struct instance_data *idata)
> +@@ -1035,12 +1178,9 @@ static int form_context(const struct polydir_s *polyptr,
> + 	/*
> + 	 * Get the security context of the directory to polyinstantiate.
> + 	 */
> +-	rc = getfilecon(polyptr->dir, origcon);
> +-	if (rc < 0 || *origcon == NULL) {
> +-		pam_syslog(idata->pamh, LOG_ERR,
> +-				"Error getting poly dir context, %m");
> ++	*origcon = secure_getfilecon(idata->pamh, polyptr->dir);
> ++	if (*origcon == NULL)
> + 		return PAM_SESSION_ERR;
> +-	}
> + 
> + 	if (polyptr->method == USER) return PAM_SUCCESS;
> + 
> +@@ -1137,29 +1277,52 @@ static int form_context(const struct polydir_s *polyptr,
> + #endif
> + 
> + /*
> +- * poly_name returns the name of the polyinstantiated instance directory
> ++ * From the instance differentiation string, set in the polyptr structure:
> ++ * - the absolute path to the instance dir,
> ++ * - the absolute path to the previous dir (parent),
> ++ * - the instance name (may be different than the instance differentiation string)
> ++ */
> ++static int set_polydir_paths(struct polydir_s *polyptr, const char *inst_differentiation)
> ++{
> ++	char *tmp;
> ++
> ++	if (pam_sprintf(polyptr->instance_absolute, "%s%s",
> ++	                polyptr->instance_prefix, inst_differentiation) < 0)
> ++		return -1;
> ++
> ++	polyptr->instname = strrchr(polyptr->instance_absolute, '/') + 1;
> ++
> ++	if (pam_sprintf(polyptr->instance_parent, "%s", polyptr->instance_absolute) < 0)
> ++		return -1;
> ++
> ++	tmp = strrchr(polyptr->instance_parent, '/') + 1;
> ++	*tmp = '\0';
> ++
> ++	return 0;
> ++}
> ++
> ++/*
> ++ * Set the name of the polyinstantiated instance directory
> +  * based on the method used for polyinstantiation (user, context or level)
> +  * In addition, the function also returns the security contexts of the
> +  * original directory to polyinstantiate and the polyinstantiated instance
> +  * directory.
> +  */
> + #ifdef WITH_SELINUX
> +-static int poly_name(const struct polydir_s *polyptr, char **i_name,
> +-	char **i_context, char **origcon,
> +-        struct instance_data *idata)
> ++static int poly_name(struct polydir_s *polyptr, char **i_context,
> ++        char **origcon, struct instance_data *idata)
> + #else
> +-static int poly_name(const struct polydir_s *polyptr, char **i_name,
> +-	struct instance_data *idata)
> ++static int poly_name(struct polydir_s *polyptr, struct instance_data *idata)
> + #endif
> + {
> +     int rc;
> ++    char *inst_differentiation = NULL;
> +     char *hash = NULL;
> +     enum polymethod pm;
> + #ifdef WITH_SELINUX
> +     char *rawcon = NULL;
> + #endif
> + 
> +-    *i_name = NULL;
> + #ifdef WITH_SELINUX
> +     *i_context = NULL;
> +     *origcon = NULL;
> +@@ -1193,7 +1356,7 @@ static int poly_name(const struct polydir_s *polyptr, char **i_name,
> + 
> +     switch (pm) {
> +         case USER:
> +-	    if ((*i_name = strdup(idata->user)) == NULL)
> ++	    if ((inst_differentiation = strdup(idata->user)) == NULL)
> + 		goto fail;
> + 	    break;
> + 
> +@@ -1205,20 +1368,24 @@ static int poly_name(const struct polydir_s *polyptr, char **i_name,
> + 		goto fail;
> + 	    }
> + 	    if (polyptr->flags & POLYDIR_SHARED)
> +-		*i_name = strdup(rawcon);
> ++		inst_differentiation = strdup(rawcon);
> + 	    else
> +-		*i_name = pam_asprintf("%s_%s", rawcon, idata->user);
> +-	    if (*i_name == NULL)
> ++		inst_differentiation = pam_asprintf("%s_%s", rawcon, idata->user);
> ++	    if (inst_differentiation == NULL)
> + 		goto fail;
> + 	    break;
> + 
> + #endif /* WITH_SELINUX */
> + 
> + 	case TMPDIR:
> ++	    if ((inst_differentiation = strdup("XXXXXX")) == NULL)
> ++		goto fail;
> ++	    goto success;
> ++
> + 	case TMPFS:
> +-	    if ((*i_name=strdup("")) == NULL)
> ++	    if ((inst_differentiation=strdup("")) == NULL)
> + 		goto fail;
> +-	    return PAM_SUCCESS;
> ++	    goto success;
> + 
> + 	default:
> + 	    if (idata->flags & PAMNS_DEBUG)
> +@@ -1227,32 +1394,37 @@ static int poly_name(const struct polydir_s *polyptr, char **i_name,
> +     }
> + 
> +     if (idata->flags & PAMNS_DEBUG)
> +-        pam_syslog(idata->pamh, LOG_DEBUG, "poly_name %s", *i_name);
> ++        pam_syslog(idata->pamh, LOG_DEBUG, "poly_name %s", inst_differentiation);
> + 
> +-    if ((idata->flags & PAMNS_GEN_HASH) || strlen(*i_name) > NAMESPACE_MAX_DIR_LEN) {
> +-        hash = md5hash(*i_name, idata);
> ++    if ((idata->flags & PAMNS_GEN_HASH) || strlen(inst_differentiation) > NAMESPACE_MAX_DIR_LEN) {
> ++        hash = md5hash(inst_differentiation, idata);
> +         if (hash == NULL) {
> + 	    goto fail;
> +         }
> +         if (idata->flags & PAMNS_GEN_HASH) {
> +-	    free(*i_name);
> +-	    *i_name = hash;
> ++	    free(inst_differentiation);
> ++	    inst_differentiation = hash;
> + 	    hash = NULL;
> +         } else {
> + 	    char *newname =
> + 		pam_asprintf("%.*s_%s",
> + 			     NAMESPACE_MAX_DIR_LEN - 1 - (int)strlen(hash),
> +-			     *i_name, hash);
> ++			     inst_differentiation, hash);
> + 	    if (newname == NULL)
> + 		goto fail;
> +-	    free(*i_name);
> +-	    *i_name = newname;
> ++	    free(inst_differentiation);
> ++	    inst_differentiation = newname;
> +         }
> +     }
> +-    rc = PAM_SUCCESS;
> + 
> ++success:
> ++    if (set_polydir_paths(polyptr, inst_differentiation) == -1)
> ++        goto fail;
> ++
> ++    rc = PAM_SUCCESS;
> + fail:
> +     free(hash);
> ++    free(inst_differentiation);
> + #ifdef WITH_SELINUX
> +     freecon(rawcon);
> + #endif
> +@@ -1263,55 +1435,35 @@ fail:
> + 	freecon(*origcon);
> + 	*origcon = NULL;
> + #endif
> +-	free(*i_name);
> +-	*i_name = NULL;
> +     }
> +     return rc;
> + }
> + 
> +-static int check_inst_parent(char *ipath, struct instance_data *idata)
> ++static int check_inst_parent(int dfd, struct instance_data *idata)
> + {
> + 	struct stat instpbuf;
> +-	char *inst_parent, *trailing_slash;
> +-	int dfd;
> ++
> + 	/*
> +-	 * stat the instance parent path to make sure it exists
> +-	 * and is a directory. Check that its mode is 000 (unless the
> +-	 * admin explicitly instructs to ignore the instance parent
> +-	 * mode by the "ignore_instance_parent_mode" argument).
> ++	 * Stat the instance parent directory to make sure it's writable by
> ++	 * root only (unless the admin explicitly instructs to ignore the
> ++	 * instance parent mode by the "ignore_instance_parent_mode" argument).
> + 	 */
> +-	inst_parent = strdup(ipath);
> +-	if (!inst_parent) {
> +-		pam_syslog(idata->pamh, LOG_CRIT, "Error allocating pathname string");
> +-		return PAM_SESSION_ERR;
> +-	}
> + 
> +-	trailing_slash = strrchr(inst_parent, '/');
> +-	if (trailing_slash)
> +-		*trailing_slash = '\0';
> +-
> +-	dfd = protect_dir(inst_parent, 0, 1, idata);
> ++	if (idata->flags & PAMNS_IGN_INST_PARENT_MODE)
> ++		return PAM_SUCCESS;
> + 
> +-	if (dfd == -1 || fstat(dfd, &instpbuf) < 0) {
> ++	if (fstat(dfd, &instpbuf) < 0) {
> + 		pam_syslog(idata->pamh, LOG_ERR,
> +-			"Error creating or accessing instance parent %s, %m", inst_parent);
> +-		if (dfd != -1)
> +-			close(dfd);
> +-		free(inst_parent);
> ++			"Error accessing instance parent, %m");
> + 		return PAM_SESSION_ERR;
> + 	}
> + 
> +-	if ((idata->flags & PAMNS_IGN_INST_PARENT_MODE) == 0) {
> +-		if ((instpbuf.st_mode & (S_IRWXU|S_IRWXG|S_IRWXO)) || instpbuf.st_uid != 0) {
> +-			pam_syslog(idata->pamh, LOG_ERR, "Mode of inst parent %s not 000 or owner not root",
> +-					inst_parent);
> +-			close(dfd);
> +-			free(inst_parent);
> +-			return PAM_SESSION_ERR;
> +-		}
> ++	if ((instpbuf.st_mode & (S_IRWXU|S_IRWXG|S_IRWXO)) || instpbuf.st_uid != 0) {
> ++		pam_syslog(idata->pamh, LOG_ERR,
> ++			"Mode of inst parent not 000 or owner not root");
> ++		return PAM_SESSION_ERR;
> + 	}
> +-	close(dfd);
> +-	free(inst_parent);
> ++
> + 	return PAM_SUCCESS;
> + }
> + 
> +@@ -1451,14 +1603,16 @@ static int create_polydir(struct polydir_s *polyptr,
> +     }
> + #endif
> + 
> +-    rc = protect_dir(dir, mode, 1, idata);
> ++    rc = secure_opendir(dir,
> ++            SECURE_OPENDIR_PROTECT | SECURE_OPENDIR_MKDIR | SECURE_OPENDIR_FULL_FD,
> ++            mode, idata);
> +     if (rc == -1) {
> +             pam_syslog(idata->pamh, LOG_ERR,
> +                        "Error creating directory %s: %m", dir);
> + #ifdef WITH_SELINUX
> +             freecon(oldcon_raw);
> + #endif
> +-            return PAM_SESSION_ERR;
> ++            return -1;
> +     }
> + 
> + #ifdef WITH_SELINUX
> +@@ -1479,9 +1633,9 @@ static int create_polydir(struct polydir_s *polyptr,
> + 		pam_syslog(idata->pamh, LOG_ERR,
> + 			   "Error changing mode of directory %s: %m", dir);
> +                 close(rc);
> +-                umount(dir); /* undo the eventual protection bind mount */
> +-		rmdir(dir);
> +-		return PAM_SESSION_ERR;
> ++		secure_umount(dir); /* undo the eventual protection bind mount */
> ++		secure_try_rmdir(dir);
> ++		return -1;
> + 	}
> +     }
> + 
> +@@ -1499,41 +1653,37 @@ static int create_polydir(struct polydir_s *polyptr,
> +         pam_syslog(idata->pamh, LOG_ERR,
> +                    "Unable to change owner on directory %s: %m", dir);
> +         close(rc);
> +-        umount(dir); /* undo the eventual protection bind mount */
> +-	rmdir(dir);
> +-	return PAM_SESSION_ERR;
> ++	secure_umount(dir); /* undo the eventual protection bind mount */
> ++	secure_try_rmdir(dir);
> ++	return -1;
> +     }
> + 
> +-    close(rc);
> +-
> +     if (idata->flags & PAMNS_DEBUG)
> + 	pam_syslog(idata->pamh, LOG_DEBUG,
> + 	           "Polydir owner %u group %u", uid, gid);
> + 
> +-    return PAM_SUCCESS;
> ++    return rc;
> + }
> + 
> + /*
> +- * Create polyinstantiated instance directory (ipath).
> ++ * Create polyinstantiated instance directory.
> ++ * To protect against races, changes are done on a fd to the parent of the
> ++ * instance directory (dfd_iparent) and a relative path (polyptr->instname).
> ++ * The absolute path (polyptr->instance_absolute) is only updated when creating
> ++ * a tmpdir and used for logging purposes.
> +  */
> + #ifdef WITH_SELINUX
> +-static int create_instance(struct polydir_s *polyptr, char *ipath, struct stat *statbuf,
> +-        const char *icontext, const char *ocontext,
> +-	struct instance_data *idata)
> ++static int create_instance(struct polydir_s *polyptr, int dfd_iparent,
> ++        struct stat *statbuf, const char *icontext, const char *ocontext,
> ++        struct instance_data *idata)
> + #else
> +-static int create_instance(struct polydir_s *polyptr, char *ipath, struct stat *statbuf,
> +-	struct instance_data *idata)
> ++static int create_instance(struct polydir_s *polyptr, int dfd_iparent,
> ++        struct stat *statbuf, struct instance_data *idata)
> + #endif
> + {
> +     struct stat newstatbuf;
> +     int fd;
> + 
> +-    /*
> +-     * Check to make sure instance parent is valid.
> +-     */
> +-    if (check_inst_parent(ipath, idata))
> +-	return PAM_SESSION_ERR;
> +-
> +     /*
> +      * Create instance directory and set its security context to the context
> +      * returned by the security policy. Set its mode and ownership
> +@@ -1542,29 +1692,39 @@ static int create_instance(struct polydir_s *polyptr, char *ipath, struct stat *
> +      */
> + 
> +     if (polyptr->method == TMPDIR) {
> +-	if (mkdtemp(polyptr->instance_prefix) == NULL) {
> +-            pam_syslog(idata->pamh, LOG_ERR, "Error creating temporary instance %s, %m",
> +-			polyptr->instance_prefix);
> +-	    polyptr->method = NONE; /* do not clean up! */
> +-	    return PAM_SESSION_ERR;
> +-	}
> +-	/* copy the actual directory name to ipath */
> +-	strcpy(ipath, polyptr->instance_prefix);
> +-    } else if (mkdir(ipath, S_IRUSR) < 0) {
> ++        char s_path[PATH_MAX];
> ++        /*
> ++         * Create the template for mkdtemp() as a magic link based on
> ++         * our existing fd to avoid symlink attacks and races.
> ++         */
> ++        if (pam_sprintf(s_path, "/proc/self/fd/%d/%s", dfd_iparent, polyptr->instname) < 0
> ++            || mkdtemp(s_path) == NULL) {
> ++            pam_syslog(idata->pamh, LOG_ERR,
> ++                       "Error creating temporary instance dir %s, %m",
> ++                       polyptr->instance_absolute);
> ++            polyptr->method = NONE; /* do not clean up! */
> ++            return PAM_SESSION_ERR;
> ++        }
> ++
> ++        /* Copy the actual directory name to polyptr->instname */
> ++        strcpy(polyptr->instname, base_name(s_path));
> ++    } else if (mkdirat(dfd_iparent, polyptr->instname, S_IRUSR) < 0) {
> +         if (errno == EEXIST)
> +             return PAM_IGNORE;
> +         else {
> +             pam_syslog(idata->pamh, LOG_ERR, "Error creating %s, %m",
> +-			ipath);
> ++                       polyptr->instance_absolute);
> +             return PAM_SESSION_ERR;
> +         }
> +     }
> + 
> +-    /* Open a descriptor to it to prevent races */
> +-    fd = open(ipath, O_DIRECTORY | O_RDONLY);
> ++    /* Open a descriptor to prevent races, based on our existing fd. */
> ++    fd = openat(dfd_iparent, polyptr->instname,
> ++            O_RDONLY | O_DIRECTORY | O_NOFOLLOW | O_CLOEXEC);
> +     if (fd < 0) {
> +-	pam_syslog(idata->pamh, LOG_ERR, "Error opening %s, %m", ipath);
> +-	rmdir(ipath);
> ++	pam_syslog(idata->pamh, LOG_ERR, "Error opening %s, %m",
> ++                polyptr->instance_absolute);
> ++	unlinkat(dfd_iparent, polyptr->instname, AT_REMOVEDIR);
> + 	return PAM_SESSION_ERR;
> +     }
> + #ifdef WITH_SELINUX
> +@@ -1574,17 +1734,19 @@ static int create_instance(struct polydir_s *polyptr, char *ipath, struct stat *
> +         if (icontext) {
> +             if (fsetfilecon(fd, icontext) < 0) {
> +                 pam_syslog(idata->pamh, LOG_ERR,
> +-			"Error setting context of %s to %s", ipath, icontext);
> ++			"Error setting context of %s to %s",
> ++                        polyptr->instance_absolute, icontext);
> +                 close(fd);
> +-		rmdir(ipath);
> ++                unlinkat(dfd_iparent, polyptr->instname, AT_REMOVEDIR);
> +                 return PAM_SESSION_ERR;
> +             }
> +         } else {
> +             if (fsetfilecon(fd, ocontext) < 0) {
> +                 pam_syslog(idata->pamh, LOG_ERR,
> +-			"Error setting context of %s to %s", ipath, ocontext);
> ++			"Error setting context of %s to %s",
> ++                        polyptr->instance_absolute, ocontext);
> + 		close(fd);
> +-		rmdir(ipath);
> ++                unlinkat(dfd_iparent, polyptr->instname, AT_REMOVEDIR);
> +                 return PAM_SESSION_ERR;
> +             }
> +         }
> +@@ -1592,9 +1754,9 @@ static int create_instance(struct polydir_s *polyptr, char *ipath, struct stat *
> + #endif
> +     if (fstat(fd, &newstatbuf) < 0) {
> +         pam_syslog(idata->pamh, LOG_ERR, "Error stating %s, %m",
> +-		ipath);
> ++		polyptr->instance_absolute);
> + 	close(fd);
> +-	rmdir(ipath);
> ++        unlinkat(dfd_iparent, polyptr->instname, AT_REMOVEDIR);
> +         return PAM_SESSION_ERR;
> +     }
> +     if (newstatbuf.st_uid != statbuf->st_uid ||
> +@@ -1602,17 +1764,17 @@ static int create_instance(struct polydir_s *polyptr, char *ipath, struct stat *
> +         if (fchown(fd, statbuf->st_uid, statbuf->st_gid) < 0) {
> +             pam_syslog(idata->pamh, LOG_ERR,
> + 			"Error changing owner for %s, %m",
> +-			ipath);
> ++			polyptr->instance_absolute);
> + 	    close(fd);
> +-	    rmdir(ipath);
> ++            unlinkat(dfd_iparent, polyptr->instname, AT_REMOVEDIR);
> +             return PAM_SESSION_ERR;
> +         }
> +     }
> +     if (fchmod(fd, statbuf->st_mode & 07777) < 0) {
> +         pam_syslog(idata->pamh, LOG_ERR, "Error changing mode for %s, %m",
> +-			ipath);
> ++			polyptr->instance_absolute);
> + 	close(fd);
> +-	rmdir(ipath);
> ++        unlinkat(dfd_iparent, polyptr->instname, AT_REMOVEDIR);
> +         return PAM_SESSION_ERR;
> +     }
> +     close(fd);
> +@@ -1631,9 +1793,12 @@ static int ns_setup(struct polydir_s *polyptr,
> + 	struct instance_data *idata)
> + {
> +     int retval;
> ++    int dfd_iparent = -1;
> ++    int dfd_ipath = -1;
> ++    int dfd_pptrdir = -1;
> +     int newdir = 1;
> +-    char *inst_dir = NULL;
> +-    char *instname = NULL;
> ++    char s_ipath[MAGIC_LNK_FD_SIZE];
> ++    char s_pptrdir[MAGIC_LNK_FD_SIZE];
> +     struct stat statbuf;
> + #ifdef WITH_SELINUX
> +     char *instcontext = NULL, *origcontext = NULL;
> +@@ -1643,37 +1808,48 @@ static int ns_setup(struct polydir_s *polyptr,
> +         pam_syslog(idata->pamh, LOG_DEBUG,
> +                "Set namespace for directory %s", polyptr->dir);
> + 
> +-    retval = protect_dir(polyptr->dir, 0, 0, idata);
> ++    dfd_pptrdir = secure_opendir(polyptr->dir, SECURE_OPENDIR_PROTECT, 0, idata);
> + 
> +-    if (retval < 0) {
> ++    if (dfd_pptrdir < 0) {
> +         if (errno != ENOENT || !(polyptr->flags & POLYDIR_CREATE)) {
> +             pam_syslog(idata->pamh, LOG_ERR, "Polydir %s access error: %m",
> +                     polyptr->dir);
> +             return PAM_SESSION_ERR;
> +         }
> +-        if (create_polydir(polyptr, idata) != PAM_SUCCESS)
> ++        dfd_pptrdir = create_polydir(polyptr, idata);
> ++        if (dfd_pptrdir < 0)
> +             return PAM_SESSION_ERR;
> +-    } else {
> +-	close(retval);
> +     }
> + 
> +     if (polyptr->method == TMPFS) {
> +-	if (mount("tmpfs", polyptr->dir, "tmpfs", polyptr->mount_flags, polyptr->mount_opts) < 0) {
> +-	    pam_syslog(idata->pamh, LOG_ERR, "Error mounting tmpfs on %s, %m",
> +-		polyptr->dir);
> +-            return PAM_SESSION_ERR;
> +-	}
> ++        /*
> ++         * There is no function mount() that operate on a fd, so instead, we
> ++         * get the magic link corresponding to the fd and give it to mount().
> ++         * This protects against potential races exploitable by an unpriv user.
> ++         */
> ++        if (pam_sprintf(s_pptrdir, "/proc/self/fd/%d", dfd_pptrdir) < 0) {
> ++            pam_syslog(idata->pamh, LOG_ERR, "Error pam_sprintf s_pptrdir");
> ++            goto error_out;
> ++        }
> + 
> +-	if (polyptr->flags & POLYDIR_NOINIT)
> +-	    return PAM_SUCCESS;
> ++        if (mount("tmpfs", s_pptrdir, "tmpfs", polyptr->mount_flags, polyptr->mount_opts) < 0) {
> ++            pam_syslog(idata->pamh, LOG_ERR, "Error mounting tmpfs on %s, %m",
> ++                       polyptr->dir);
> ++            goto error_out;
> ++        }
> ++
> ++        if (polyptr->flags & POLYDIR_NOINIT) {
> ++            retval = PAM_SUCCESS;
> ++            goto cleanup;
> ++        }
> + 
> +-	return inst_init(polyptr, "tmpfs", idata, 1);
> ++        retval = inst_init(polyptr, "tmpfs", idata, 1);
> ++        goto cleanup;
> +     }
> + 
> +-    if (stat(polyptr->dir, &statbuf) < 0) {
> +-	pam_syslog(idata->pamh, LOG_ERR, "Error stating %s: %m",
> +-		polyptr->dir);
> +-        return PAM_SESSION_ERR;
> ++    if (fstat(dfd_pptrdir, &statbuf) < 0) {
> ++        pam_syslog(idata->pamh, LOG_ERR, "Error stating %s: %m", polyptr->dir);
> ++        goto error_out;
> +     }
> + 
> +     /*
> +@@ -1682,15 +1858,16 @@ static int ns_setup(struct polydir_s *polyptr,
> +      * security policy.
> +      */
> + #ifdef WITH_SELINUX
> +-    retval = poly_name(polyptr, &instname, &instcontext,
> +-			&origcontext, idata);
> ++    retval = poly_name(polyptr, &instcontext, &origcontext, idata);
> + #else
> +-    retval = poly_name(polyptr, &instname, idata);
> ++    retval = poly_name(polyptr, idata);
> + #endif
> + 
> +     if (retval != PAM_SUCCESS) {
> +-	if (retval != PAM_IGNORE)
> ++	if (retval != PAM_IGNORE) {
> + 		pam_syslog(idata->pamh, LOG_ERR, "Error getting instance name");
> ++                goto error_out;
> ++        }
> +         goto cleanup;
> +     } else {
> + #ifdef WITH_SELINUX
> +@@ -1701,22 +1878,33 @@ static int ns_setup(struct polydir_s *polyptr,
> + #endif
> +     }
> + 
> +-    if ((inst_dir = pam_asprintf("%s%s", polyptr->instance_prefix, instname)) == NULL)
> +-	goto error_out;
> +-
> +-    if (idata->flags & PAMNS_DEBUG)
> +-        pam_syslog(idata->pamh, LOG_DEBUG, "instance_dir %s",
> +-		inst_dir);
> ++    /*
> ++     * Gets a fd in a secure manner (we may be operating on a path under
> ++     * user control), and check it's compliant.
> ++     * Then, we should *always* operate on *this* fd and a relative path
> ++     * to be protected against race conditions.
> ++     */
> ++    dfd_iparent = secure_opendir(polyptr->instance_parent,
> ++            SECURE_OPENDIR_PROTECT | SECURE_OPENDIR_MKDIR, 0, idata);
> ++    if (dfd_iparent == -1) {
> ++	pam_syslog(idata->pamh, LOG_ERR,
> ++                "polyptr->instance_parent %s access error",
> ++                polyptr->instance_parent);
> ++        goto error_out;
> ++    }
> ++    if (check_inst_parent(dfd_iparent, idata)) {
> ++        goto error_out;
> ++    }
> + 
> +     /*
> +      * Create instance directory with appropriate security
> +      * contexts, owner, group and mode bits.
> +      */
> + #ifdef WITH_SELINUX
> +-    retval = create_instance(polyptr, inst_dir, &statbuf, instcontext,
> +-			 origcontext, idata);
> ++    retval = create_instance(polyptr, dfd_iparent, &statbuf, instcontext,
> ++                             origcontext, idata);
> + #else
> +-    retval = create_instance(polyptr, inst_dir, &statbuf, idata);
> ++    retval = create_instance(polyptr, dfd_iparent, &statbuf, idata);
> + #endif
> + 
> +     if (retval == PAM_IGNORE) {
> +@@ -1728,19 +1916,48 @@ static int ns_setup(struct polydir_s *polyptr,
> +         goto error_out;
> +     }
> + 
> ++    /*
> ++     * Instead of getting a new secure fd, we reuse the fd opened on directory
> ++     * polyptr->instance_parent to ensure we are working on the same dir as
> ++     * previously, and thus ensure that previous checks (e.g. check_inst_parent())
> ++     * are still relevant.
> ++     */
> ++    dfd_ipath = openat(dfd_iparent, polyptr->instname,
> ++            O_PATH | O_DIRECTORY | O_NOFOLLOW | O_CLOEXEC);
> ++    if (dfd_ipath == -1) {
> ++        pam_syslog(idata->pamh, LOG_ERR, "Error openat on %s, %m",
> ++                polyptr->instname);
> ++        goto error_out;
> ++    }
> ++
> ++    if (pam_sprintf(s_ipath, "/proc/self/fd/%d", dfd_ipath) < 0) {
> ++        pam_syslog(idata->pamh, LOG_ERR, "Error pam_sprintf s_ipath");
> ++        goto error_out;
> ++    }
> ++
> ++    if (pam_sprintf(s_pptrdir, "/proc/self/fd/%d", dfd_pptrdir) < 0) {
> ++        pam_syslog(idata->pamh, LOG_ERR, "Error pam_sprintf s_pptrdir");
> ++        goto error_out;
> ++    }
> ++
> +     /*
> +      * Bind mount instance directory on top of the polyinstantiated
> +      * directory to provide an instance of polyinstantiated directory
> +      * based on polyinstantiated method.
> ++     *
> ++     * Operates on magic links created from two fd obtained securely
> ++     * to protect against race conditions and symlink attacks. Indeed,
> ++     * the source and destination can be in a user controled path.
> +      */
> +-    if (mount(inst_dir, polyptr->dir, NULL, MS_BIND, NULL) < 0) {
> +-        pam_syslog(idata->pamh, LOG_ERR, "Error mounting %s on %s, %m",
> +-                   inst_dir, polyptr->dir);
> ++    if(mount(s_ipath, s_pptrdir, NULL, MS_BIND, NULL) < 0) {
> ++        pam_syslog(idata->pamh, LOG_ERR,
> ++                "Error mounting %s on %s (%s on %s), %m",
> ++                   s_ipath, s_pptrdir, polyptr->instance_absolute, polyptr->dir);
> +         goto error_out;
> +     }
> + 
> +     if (!(polyptr->flags & POLYDIR_NOINIT))
> +-	retval = inst_init(polyptr, inst_dir, idata, newdir);
> ++	retval = inst_init(polyptr, polyptr->instance_absolute, idata, newdir);
> + 
> +     goto cleanup;
> + 
> +@@ -1752,8 +1969,12 @@ error_out:
> +     retval = PAM_SESSION_ERR;
> + 
> + cleanup:
> +-    free(inst_dir);
> +-    free(instname);
> ++    if (dfd_iparent != -1)
> ++        close(dfd_iparent);
> ++    if (dfd_ipath != -1)
> ++        close(dfd_ipath);
> ++    if (dfd_pptrdir != -1)
> ++        close(dfd_pptrdir);
> + #ifdef WITH_SELINUX
> +     freecon(instcontext);
> +     freecon(origcontext);
> +@@ -1792,6 +2013,7 @@ static int cleanup_tmpdirs(struct instance_data *idata)
> + {
> +     struct polydir_s *pptr;
> +     pid_t rc, pid;
> ++    int dfd = -1;
> +     struct sigaction newsa, oldsa;
> +     int status;
> + 
> +@@ -1803,7 +2025,17 @@ static int cleanup_tmpdirs(struct instance_data *idata)
> +     }
> + 
> +     for (pptr = idata->polydirs_ptr; pptr; pptr = pptr->next) {
> +-	if (pptr->method == TMPDIR && access(pptr->instance_prefix, F_OK) == 0) {
> ++	if (pptr->method == TMPDIR) {
> ++
> ++            dfd = secure_opendir_stateless(pptr->instance_parent);
> ++            if (dfd == -1)
> ++                continue;
> ++
> ++            if (faccessat(dfd, pptr->instname, F_OK, AT_SYMLINK_NOFOLLOW) != 0) {
> ++                close(dfd);
> ++                continue;
> ++            }
> ++
> + 	    pid = fork();
> + 	    if (pid == 0) {
> + 		static char *envp[] = { NULL };
> +@@ -1813,10 +2045,21 @@ static int cleanup_tmpdirs(struct instance_data *idata)
> + 			_exit(1);
> + 		}
> + #endif
> ++                if (fchdir(dfd) == -1) {
> ++                    pam_syslog(idata->pamh, LOG_ERR, "Failed fchdir to %s: %m",
> ++                            pptr->instance_absolute);
> ++                    _exit(1);
> ++                }
> ++
> + 		close_fds_pre_exec(idata);
> +-		if (execle("/bin/rm", "/bin/rm", "-rf", pptr->instance_prefix, NULL, envp) < 0)
> ++
> ++		if (execle("/bin/rm", "/bin/rm", "-rf", pptr->instname, NULL, envp) < 0)
> + 			_exit(1);
> + 	    } else if (pid > 0) {
> ++
> ++                if (dfd != -1)
> ++                    close(dfd);
> ++
> + 		while (((rc = waitpid(pid, &status, 0)) == (pid_t)-1) &&
> + 		    (errno == EINTR));
> + 		if (rc == (pid_t)-1) {
> +@@ -1829,6 +2072,10 @@ static int cleanup_tmpdirs(struct instance_data *idata)
> + 			"Error removing %s", pptr->instance_prefix);
> + 		}
> + 	    } else if (pid < 0) {
> ++
> ++                if (dfd != -1)
> ++                    close(dfd);
> ++
> + 		pam_syslog(idata->pamh, LOG_ERR,
> + 			"Cannot fork to cleanup temporary directory, %m");
> + 		rc = PAM_SESSION_ERR;
> +@@ -1852,6 +2099,7 @@ out:
> + static int setup_namespace(struct instance_data *idata, enum unmnt_op unmnt)
> + {
> +     int retval = 0, need_poly = 0, changing_dir = 0;
> ++    int dfd = -1;
> +     char *cptr, *fptr, poly_parent[PATH_MAX];
> +     struct polydir_s *pptr;
> + 
> +@@ -1967,13 +2215,21 @@ static int setup_namespace(struct instance_data *idata, enum unmnt_op unmnt)
> + 			strcpy(poly_parent, "/");
> + 		    else if (cptr)
> + 			*cptr = '\0';
> +-                    if (chdir(poly_parent) < 0) {
> ++
> ++                    dfd = secure_opendir_stateless(poly_parent);
> ++                    if (dfd == -1) {
> ++                        pam_syslog(idata->pamh, LOG_ERR,
> ++                            "Failed opening %s to fchdir: %m", poly_parent);
> ++                    }
> ++                    else if (fchdir(dfd) == -1) {
> +                         pam_syslog(idata->pamh, LOG_ERR,
> +-				"Can't chdir to %s, %m", poly_parent);
> ++                            "Failed fchdir to %s: %m", poly_parent);
> +                     }
> ++                    if (dfd != -1)
> ++                        close(dfd);
> +                 }
> + 
> +-                if (umount(pptr->rdir) < 0) {
> ++            if (secure_umount(pptr->rdir) < 0) {
> + 		    int saved_errno = errno;
> + 		    pam_syslog(idata->pamh, LOG_ERR, "Unmount of %s failed, %m",
> + 			pptr->rdir);
> +@@ -2043,7 +2299,7 @@ static int orig_namespace(struct instance_data *idata)
> + 			"Unmounting instance dir for user %d & dir %s",
> +                        idata->uid, pptr->dir);
> + 
> +-            if (umount(pptr->dir) < 0) {
> ++            if (secure_umount(pptr->dir) < 0) {
> +                 pam_syslog(idata->pamh, LOG_ERR, "Unmount of %s failed, %m",
> +                        pptr->dir);
> +                 return PAM_SESSION_ERR;
> +diff --git a/modules/pam_namespace/pam_namespace.h b/modules/pam_namespace/pam_namespace.h
> +index 180e042..721d39a 100644
> +--- a/modules/pam_namespace/pam_namespace.h
> ++++ b/modules/pam_namespace/pam_namespace.h
> +@@ -122,6 +122,13 @@
> + #define NAMESPACE_POLYDIR_DATA "pam_namespace:polydir_data"
> + #define NAMESPACE_PROTECT_DATA "pam_namespace:protect_data"
> + 
> ++/*
> ++ * Operation mode for function secure_opendir()
> ++ */
> ++#define SECURE_OPENDIR_PROTECT     0x00000001
> ++#define SECURE_OPENDIR_MKDIR       0x00000002
> ++#define SECURE_OPENDIR_FULL_FD     0x00000004
> ++
> + /*
> +  * Polyinstantiation method options, based on user, security context
> +  * or both
> +@@ -159,6 +166,9 @@ struct polydir_s {
> +     char dir[PATH_MAX];    	       	/* directory to polyinstantiate */
> +     char rdir[PATH_MAX];    	       	/* directory to unmount (based on RUSER) */
> +     char instance_prefix[PATH_MAX];	/* prefix for instance dir path name */
> ++    char instance_absolute[PATH_MAX];	/* absolute path to the instance dir (instance_parent + instname) */
> ++    char instance_parent[PATH_MAX];	/* parent dir of the instance dir */
> ++    char *instname;			/* last segment of the path to the instance dir */
> +     enum polymethod method;		/* method used to polyinstantiate */
> +     unsigned int num_uids;		/* number of override uids */
> +     uid_t *uid;				/* list of override uids */
> +-- 
> +2.49.0
> diff --git a/package/linux-pam/0006-cve-2025-6020-02.patch b/package/linux-pam/0006-cve-2025-6020-02.patch
> new file mode 100644
> index 0000000000..f4d0921aa4
> --- /dev/null
> +++ b/package/linux-pam/0006-cve-2025-6020-02.patch
> @@ -0,0 +1,37 @@
> +From 976c20079358d133514568fc7fd95c02df8b5773 Mon Sep 17 00:00:00 2001
> +From: "Dmitry V. Levin" <ldv@strace.io>
> +Date: Tue, 27 May 2025 08:00:00 +0000
> +Subject: [PATCH] pam_namespace: secure_opendir: do not look at the group
> + ownership
> +
> +When the directory is not group-writable, the group ownership does
> +not matter, and when it is group-writable, there should not be any
> +exceptions for the root group as there is no guarantee that the root
> +group does not include non-root users.
> +
> +Upstream: https://github.com/linux-pam/linux-pam/commit/976c20079358d133514568fc7fd95c02df8b5773
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +Upstream: https://github.com/openembedded/openembedded-core/blob/scarthgap/meta/recipes-extended/pam/libpam/CVE-2025-6020-02.patch
> +CVE: CVE-2025-6020
> +[thomas: backport from OpenEmbedded patch to 1.6.1]
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + modules/pam_namespace/pam_namespace.c | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> + 
> +diff --git a/modules/pam_namespace/pam_namespace.c b/modules/pam_namespace/pam_namespace.c
> +index 4c8153b..791dd07 100644
> +--- a/modules/pam_namespace/pam_namespace.c
> ++++ b/modules/pam_namespace/pam_namespace.c
> +@@ -215,8 +215,7 @@ static int secure_opendir(const char *path, int opm, mode_t mode,
> + 			if (dfd_next == -1)
> + 				goto error;
> + 		} else if (st.st_uid != 0
> +-		           || (st.st_gid != 0 && (st.st_mode & S_IWGRP))
> +-		           || (st.st_mode & S_IWOTH)) {
> ++		           || (st.st_mode & (S_IWGRP|S_IWOTH))) {
> + 			/* do not follow symlinks on subdirectories */
> + 			flags |= O_NOFOLLOW;
> + 		}
> +-- 
> +2.49.0
> diff --git a/package/linux-pam/0007-cve-2025-6020-03.patch b/package/linux-pam/0007-cve-2025-6020-03.patch
> new file mode 100644
> index 0000000000..6b10ac6ac4
> --- /dev/null
> +++ b/package/linux-pam/0007-cve-2025-6020-03.patch
> @@ -0,0 +1,189 @@
> +From 592d84e1265d04c3104acee815a503856db503a1 Mon Sep 17 00:00:00 2001
> +From: Olivier Bal-Petre <olivier.bal-petre@ssi.gouv.fr>
> +Date: Tue, 4 Mar 2025 14:37:02 +0100
> +Subject: [PATCH] pam_namespace: add flags to indicate path safety
> +
> +Add two flags in the script to indicate if the paths to the polydir
> +and the instance directories are safe (root owned and writable by
> +root only).
> +
> +Signed-off-by: Olivier Bal-Petre <olivier.bal-petre@ssi.gouv.fr>
> +Signed-off-by: Dmitry V. Levin <ldv@strace.io>
> +Upstream: https://github.com/linux-pam/linux-pam/commit/592d84e1265d04c3104acee815a503856db503a1
> +
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +Upstream: https://github.com/openembedded/openembedded-core/blob/scarthgap/meta/recipes-extended/pam/libpam/CVE-2025-6020-03.patch
> +CVE: CVE-2025-6020
> +[thomas: backport from OpenEmbedded patch to 1.6.1]
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + modules/pam_namespace/namespace.init  | 56 ++++++++++++-------
> + modules/pam_namespace/pam_namespace.c | 79 ++++++++++++++++++++++++++-
> + 2 files changed, 115 insertions(+), 20 deletions(-)
> + 
> +diff --git a/modules/pam_namespace/namespace.init b/modules/pam_namespace/namespace.init
> +index d9053a1..8782178 100755
> +--- a/modules/pam_namespace/namespace.init
> ++++ b/modules/pam_namespace/namespace.init
> +@@ -1,25 +1,43 @@
> + #!/bin/sh
> +-# It receives polydir path as $1, the instance path as $2,
> +-# a flag whether the instance dir was newly created (0 - no, 1 - yes) in $3,
> +-# and user name in $4.
> ++# It receives as arguments:
> ++# - $1 polydir path (see WARNING below)
> ++# - $2 instance path (see WARNING below)
> ++# - $3 flag whether the instance dir was newly created (0 - no, 1 - yes)
> ++# - $4 user name
> ++# - $5 flag whether the polydir path ($1) is safe (0 - unsafe, 1 -safe)
> ++# - $6 flag whether the instance path ($2) is safe (0 - unsafe, 1 - safe)
> ++#
> ++# WARNING: This script is invoked with full root privileges. Accessing
> ++# the polydir ($1) and the instance ($2) directories in this context may be
> ++# extremely dangerous as those can be under user control. The flags $5 and $6
> ++# are provided to let you know if all the segments part of the path (except the
> ++# last one) are owned by root and are writable by root only. If the path does
> ++# not meet these criteria, you expose yourself to possible symlink attacks when
> ++# accessing these path.
> ++# However, even if the path components are safe, the content of the
> ++# directories may still be owned/writable by a user, so care must be taken!
> + #
> + # The following section will copy the contents of /etc/skel if this is a
> + # newly created home directory.
> +-if [ "$3" = 1 ]; then
> +-        # This line will fix the labeling on all newly created directories
> +-        [ -x /sbin/restorecon ] && /sbin/restorecon "$1"
> +-        user="$4"
> +-        passwd=$(getent passwd "$user")
> +-        homedir=$(echo "$passwd" | cut -f6 -d":")
> +-        if [ "$1" = "$homedir" ]; then
> +-                gid=$(echo "$passwd" | cut -f4 -d":")
> +-                cp -rT /etc/skel "$homedir"
> +-                chown -R "$user":"$gid" "$homedir"
> +-                mask=$(sed -E -n 's/^UMASK[[:space:]]+([^#[:space:]]+).*/\1/p' /etc/login.defs)
> +-                mode=$(printf "%o" $((0777 & ~mask)))
> +-                chmod ${mode:-700} "$homedir"
> +-                [ -x /sbin/restorecon ] && /sbin/restorecon -R "$homedir"
> +-        fi
> +-fi
> + 
> ++# Executes only if the polydir path is safe
> ++if [ "$5" = 1 ]; then
> ++
> ++    if [ "$3" = 1 ]; then
> ++            # This line will fix the labeling on all newly created directories
> ++            [ -x /sbin/restorecon ] && /sbin/restorecon "$1"
> ++            user="$4"
> ++            passwd=$(getent passwd "$user")
> ++            homedir=$(echo "$passwd" | cut -f6 -d":")
> ++            if [ "$1" = "$homedir" ]; then
> ++                    gid=$(echo "$passwd" | cut -f4 -d":")
> ++                    cp -rT /etc/skel "$homedir"
> ++                    chown -R "$user":"$gid" "$homedir"
> ++                    mask=$(sed -E -n 's/^UMASK[[:space:]]+([^#[:space:]]+).*/\1/p' /etc/login.defs)
> ++                    mode=$(printf "%o" $((0777 & ~mask)))
> ++                    chmod ${mode:-700} "$homedir"
> ++                    [ -x /sbin/restorecon ] && /sbin/restorecon -R "$homedir"
> ++            fi
> ++    fi
> ++fi
> + exit 0
> +diff --git a/modules/pam_namespace/pam_namespace.c b/modules/pam_namespace/pam_namespace.c
> +index 9d993d4..4c8153b 100644
> +--- a/modules/pam_namespace/pam_namespace.c
> ++++ b/modules/pam_namespace/pam_namespace.c
> +@@ -1466,6 +1466,79 @@ static int check_inst_parent(int dfd, struct instance_data *idata)
> + 	return PAM_SUCCESS;
> + }
> + 
> ++/*
> ++ * Check for a given absolute path that all segments except the last one are:
> ++ * 1. a directory owned by root and not writable by group or others
> ++ * 2. a symlink owned by root and referencing a directory respecting 1.
> ++ * Returns 0 if safe, -1 is unsafe.
> ++ * If the path is not accessible (does not exist, hidden under a mount...),
> ++ * returns -1 (unsafe).
> ++ */
> ++static int check_safe_path(const char *path, struct instance_data *idata)
> ++{
> ++    char *p = strdup(path);
> ++    char *d;
> ++    char *dir = p;
> ++    struct stat st;
> ++
> ++    if (p == NULL)
> ++        return -1;
> ++
> ++    /* Check path is absolute */
> ++    if (p[0] != '/')
> ++        goto error;
> ++
> ++    strip_trailing_slashes(p);
> ++
> ++    /* Last segment of the path may be owned by the user */
> ++    if ((d = strrchr(dir, '/')) != NULL)
> ++        *d = '\0';
> ++
> ++    while ((d=strrchr(dir, '/')) != NULL) {
> ++
> ++        /* Do not follow symlinks */
> ++        if (lstat(dir, &st) != 0)
> ++            goto error;
> ++
> ++        if (S_ISLNK(st.st_mode)) {
> ++            if (st.st_uid != 0) {
> ++                if (idata->flags & PAMNS_DEBUG)
> ++                    pam_syslog(idata->pamh, LOG_DEBUG,
> ++                            "Path deemed unsafe: Symlink %s should be owned by root", dir);
> ++                goto error;
> ++            }
> ++
> ++            /* Follow symlinks */
> ++            if (stat(dir, &st) != 0)
> ++                goto error;
> ++        }
> ++
> ++        if (!S_ISDIR(st.st_mode)) {
> ++                if (idata->flags & PAMNS_DEBUG)
> ++                    pam_syslog(idata->pamh, LOG_DEBUG,
> ++                        "Path deemed unsafe: %s is expected to be a directory", dir);
> ++            goto error;
> ++        }
> ++
> ++        if (st.st_uid != 0 ||
> ++            ((st.st_mode & (S_IWGRP|S_IWOTH)) && !(st.st_mode & S_ISVTX))) {
> ++                if (idata->flags & PAMNS_DEBUG)
> ++                    pam_syslog(idata->pamh, LOG_DEBUG,
> ++                        "Path deemed unsafe: %s should be owned by root, and not be writable by group or others", dir);
> ++            goto error;
> ++        }
> ++
> ++        *d = '\0';
> ++    }
> ++
> ++    free(p);
> ++    return 0;
> ++
> ++error:
> ++    free(p);
> ++    return -1;
> ++}
> ++
> + /*
> + * Check to see if there is a namespace initialization script in
> + * the /etc/security directory. If such a script exists
> +@@ -1524,7 +1597,11 @@ static int inst_init(const struct polydir_s *polyptr, const char *ipath,
> + 				close_fds_pre_exec(idata);
> + 
> + 				execle(init_script, init_script,
> +-					polyptr->dir, ipath, newdir?"1":"0", idata->user, NULL, envp);
> ++					polyptr->dir, ipath,
> ++					newdir ? "1":"0", idata->user,
> ++					(check_safe_path(polyptr->dir, idata) == -1) ? "0":"1",
> ++					(check_safe_path(ipath, idata) == -1) ? "0":"1",
> ++					NULL, envp);
> + 					_exit(1);
> + 			} else if (pid > 0) {
> + 				while (((rc = waitpid(pid, &status, 0)) == (pid_t)-1) &&
> +-- 
> +2.49.0
> diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
> index f4e488428d..35ca567c40 100644
> --- a/package/linux-pam/linux-pam.mk
> +++ b/package/linux-pam/linux-pam.mk
> @@ -28,6 +28,11 @@ LINUX_PAM_CPE_ID_VENDOR = linux-pam
>  # 0002-pam_access-rework-resolving-of-tokens-as-hostname.patch
>  LINUX_PAM_IGNORE_CVES += CVE-2024-10963
>  
> +# 0003-inline-pam-asprintf.patch 0004-pam-namespace-rebase.patch
> +# 0005-cve-2025-6020-01.patch 0006-cve-2025-6020-02.patch
> +# 0007-cve-2025-6020-03.patch
> +LINUX_PAM_IGNORE_CVES += CVE-2025-6020
> +
>  ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
>  LINUX_PAM_LIBS += -latomic
>  endif
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
