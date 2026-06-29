Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 220B5C43458
	for <buildroot@archiver.kernel.org>; Mon, 29 Jun 2026 21:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D75D860E7E;
	Mon, 29 Jun 2026 21:00:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 54wzu6HzWDzu; Mon, 29 Jun 2026 21:00:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56A3B60614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782766846;
	bh=d84ZVzoObzwyTn53g3DBwHZV0bUQnkhFcavvenyhLLA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oJgCWseRHXTIaHjtjQNWawKvRXpHfZ4U5vxvss5WBMY344ZUraEbHcBPRVy4I0p1D
	 Kg5YRH9obRs/lVq20e1TpNnzUI/fAX2QsoT0UQivE9Aa1rwcf0EgunYhHL/xwswAh7
	 TDF1umFMmxIyQm8OiTcSS9nPqEU0xLb1Gs1cUZgSLfSLlONkV/kSj2H3W3oZNQu8Rb
	 iCzvNUjRRhwlqItgmqRz8PvYwwUTcUR0YR+XW+eSsK/1cNd07Z97JnFOlI99AEAuN3
	 bmsK4SIv6bSb0XPkctqgx8iiypb3EUi034/a27tB+msst40+MJR+8QqV8Mn47B9hab
	 /cb3fy6d7GtDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56A3B60614;
	Mon, 29 Jun 2026 21:00:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E9FCE34C
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 21:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFAB760614
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 21:00:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Yn-kCa70lP0 for <buildroot@buildroot.org>;
 Mon, 29 Jun 2026 21:00:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A8D34605E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8D34605E1
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A8D34605E1
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 21:00:43 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-472a14c9965so1618687f8f.1
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 14:00:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782766841; x=1783371641;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MVEnyjMWAkzlYJT3e0Gbs8BASyH+R5rzHUQEjpJzyMk=;
 b=G1g6LqeUm5FSkDPnerxCA4qMvDAtSlra0T4shzp1q6b16RUCDfQrLaOLiDmrlUcybN
 tskxCJM3rtxxUgDUZXdxeZP2uEIDa8s3xMmZ0xqWVjrTus9MGb7eZB8VHDh1+XiGr+o2
 yj/XQbIAw1o9wWePkTQPFfHszuuZ9Tx6s5g4rmCf52IcSoZFzBRWtINxaZLwMOl9tGeA
 Fntx93xS3hu9OVHtvt8ilpHo1YH2dOyu3wEHqNoJE/mDQJOgBSIWCSVRIR2kUcNei/re
 DKlioVSgm183hv8hy6tkqlEsQLicj2KCVTPFHVG2kSQ20C+KTApDKdwRcDX90P0eWRQO
 lgiw==
X-Gm-Message-State: AOJu0Ywg4Pee6uRA2TWc5jSpQeVFaXkkwRVVVkKGDOfjNUXpNeHpJUUI
 ZVsdL+ng8t65YbVBLyuh/tMNHkmpXAfFrAgAILr4ClugiOYggxpoajIOWgZpCb0IPifk5b9FEBn
 KdolW
X-Gm-Gg: AfdE7cnjhRt7qIETjBM10+1uEua9tcPqg589FGawBUsWAs89MiLJ9sa6+PcvvMUx6/x
 Wt3dwNi4NBB1lKqCEtAmDLSLYNQWI3bIjdpAZugjojELKZwvvH+tlwkZbXCF/zLy7mc93FrO/He
 x7sHReu5tzh5vAZOTYDLg/s9noXVvioqOrd0zc16R5PfBkaquZQdezwIH78BbRiwk8SthRnUQFs
 B3HhLdJhFbIafB2xU3CRGEgQbcvegydxhWchqSILyJ6SJrgCqyRwXcpoXO7TQS+YhWhVPgIglKt
 FEq4w4+SEXiBaj0Rm5KbgxUCwetCQqyobteO/mjmnNNXWkGclieMm9Doa3e7i3xk9q+YraXx292
 w6rFmwwPquVjCzLiHUgjAtrcqXR1nBoNyz90fRKZOCJPLwxW/NJswzpwaOXaw+6695svWyZWsTn
 VrXWJi
X-Received: by 2002:a05:6000:460d:b0:474:8aad:2e0 with SMTP id
 ffacd0b85a97d-475505f2fbamr1002604f8f.9.1782766841318; 
 Mon, 29 Jun 2026 14:00:41 -0700 (PDT)
Received: from arch ([77.109.126.77]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47566c0deacsm1006782f8f.26.2026.06.29.14.00.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 14:00:40 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Mon, 29 Jun 2026 23:00:40 +0200
Message-ID: <20260629210040.624167-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629205930.623351-1-thomas.perale@mind.be>
References: <20260629205930.623351-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782766841; x=1783371641; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MVEnyjMWAkzlYJT3e0Gbs8BASyH+R5rzHUQEjpJzyMk=;
 b=JT+p+AMGmKLQc29ZAe7fXhMBwVdUFFBt/Uv49TY/aD4zGq7nFVToN3M46qciStOlfk
 9pIzbuOAUw3+37hU/MKKm7NksjsgqbeBd2llL6oEDzrmlxGV9sC4Y940hOiBs97mk1tz
 tvksl/diqPDV/pSkEs+f5IdASppJ1HonDBMm7mBNmipZKIXKZUbi1I3B5SeXCg+rD8iw
 7zKAY0YcoN6F7VUoYYr3xSuC77E7yAL4x4xhwA4cd8ZZV4H2F73wzamK9BtAnBriyejq
 ZrxeksLTPoOPu1lSIw0DXCjl+WXkZpweNTYa8BLtU7h+tVQU5MhirziofTmbnENPNo7z
 yaag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JT+p+AMG
Subject: Re: [Buildroot] [PATCH] package/sudo: backport patch CVE-2026-35535
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

This is an error re-send. I superseeded it on patchwork.

In reply of:
> This backport is provided thanks to the Debian community [1].
> 
> - CVE-2026-35535:
>     In Sudo through 1.9.17p2 before 3e474c2, a failure of a setuid,
>     setgid, or setgroups call, during a privilege drop before running the
>     mailer, is not a fatal error and can lead to privilege escalation.
> 
> For more information, see:
>     https://www.cve.org/CVERecord?id=CVE-2026-35535
> 
> [1] https://salsa.debian.org/sudo-team/sudo/-/blob/debian/trixie/debian/patches/0006-exec_mailer-Set-group-as-well-as-uid-when-running-th.patch
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

> ---
>  ...-well-as-uid-when-running-the-mailer.patch | 147 ++++++++++++++++++
>  package/sudo/sudo.mk                          |   4 +
>  2 files changed, 151 insertions(+)
>  create mode 100644 package/sudo/0001-exec-mailer-set-group-as-well-as-uid-when-running-the-mailer.patch
> 
> diff --git a/package/sudo/0001-exec-mailer-set-group-as-well-as-uid-when-running-the-mailer.patch b/package/sudo/0001-exec-mailer-set-group-as-well-as-uid-when-running-the-mailer.patch
> new file mode 100644
> index 0000000000..0bfcdd6f93
> --- /dev/null
> +++ b/package/sudo/0001-exec-mailer-set-group-as-well-as-uid-when-running-the-mailer.patch
> @@ -0,0 +1,147 @@
> +From 3e474c2f201484be83d994ae10a4e20e8c81bb69 Mon Sep 17 00:00:00 2001
> +From: "Todd C. Miller" <Todd.Miller@sudo.ws>
> +Date: Sat, 8 Nov 2025 15:34:02 -0700
> +Subject: [PATCH] exec_mailer: Set group as well as uid when running the mailer
> +
> +Also make a setuid(), setgid() or setgroups() failure fatal.
> +
> +Found by the ZeroPath AI Security Engineer <https://zeropath.com>
> +
> +CVE: CVE-2026-35535
> +Upstream: https://github.com/sudo-project/sudo/commit/3e474c2f201484be83d994ae10a4e20e8c81bb69
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + include/sudo_eventlog.h      |  3 ++-
> + lib/eventlog/eventlog.c      | 21 +++++++++++++++++----
> + lib/eventlog/eventlog_conf.c |  4 +++-
> + plugins/sudoers/logging.c    |  2 +-
> + plugins/sudoers/policy.c     |  2 +-
> + 5 files changed, 24 insertions(+), 8 deletions(-)
> +
> +diff --git a/include/sudo_eventlog.h b/include/sudo_eventlog.h
> +index eb9f4f4..485d259 100644
> +--- a/include/sudo_eventlog.h
> ++++ b/include/sudo_eventlog.h
> +@@ -80,6 +80,7 @@ struct eventlog_config {
> +     int syslog_rejectpri;
> +     int syslog_alertpri;
> +     uid_t mailuid;
> ++    gid_t mailgid;
> +     bool omit_hostname;
> +     const char *logpath;
> +     const char *time_fmt;
> +@@ -151,7 +152,7 @@ void eventlog_set_syslog_rejectpri(int pri);
> + void eventlog_set_syslog_alertpri(int pri);
> + void eventlog_set_syslog_maxlen(size_t len);
> + void eventlog_set_file_maxlen(size_t len);
> +-void eventlog_set_mailuid(uid_t uid);
> ++void eventlog_set_mailuser(uid_t uid, gid_t gid);
> + void eventlog_set_omit_hostname(bool omit_hostname);
> + void eventlog_set_logpath(const char *path);
> + void eventlog_set_time_fmt(const char *fmt);
> +diff --git a/lib/eventlog/eventlog.c b/lib/eventlog/eventlog.c
> +index 5a32824..d56c4e4 100644
> +--- a/lib/eventlog/eventlog.c
> ++++ b/lib/eventlog/eventlog.c
> +@@ -304,15 +304,13 @@ exec_mailer(int pipein)
> + 	syslog(LOG_ERR, _("unable to dup stdin: %m")); // -V618
> + 	sudo_debug_printf(SUDO_DEBUG_ERROR,
> + 	    "unable to dup stdin: %s", strerror(errno));
> +-	sudo_debug_exit(__func__, __FILE__, __LINE__, sudo_debug_subsys);
> +-	_exit(127);
> ++	goto bad;
> +     }
> + 
> +     /* Build up an argv based on the mailer path and flags */
> +     if ((mflags = strdup(evl_conf->mailerflags)) == NULL) {
> + 	syslog(LOG_ERR, _("unable to allocate memory")); // -V618
> +-	sudo_debug_exit(__func__, __FILE__, __LINE__, sudo_debug_subsys);
> +-	_exit(127);
> ++	goto bad;
> +     }
> +     argv[0] = sudo_basename(mpath);
> + 
> +@@ -331,11 +329,23 @@ exec_mailer(int pipein)
> +     if (setuid(ROOT_UID) != 0) {
> + 	sudo_debug_printf(SUDO_DEBUG_ERROR, "unable to change uid to %u",
> + 	    ROOT_UID);
> ++	goto bad;
> ++    }
> ++    if (setgid(evl_conf->mailgid) != 0) {
> ++	sudo_debug_printf(SUDO_DEBUG_ERROR, "unable to change gid to %u",
> ++	    (unsigned int)evl_conf->mailgid);
> ++	goto bad;
> ++    }
> ++    if (setgroups(1, &evl_conf->mailgid) != 0) {
> ++	sudo_debug_printf(SUDO_DEBUG_ERROR, "unable to set groups to %u",
> ++	    (unsigned int)evl_conf->mailgid);
> ++	goto bad;
> +     }
> +     if (evl_conf->mailuid != ROOT_UID) {
> + 	if (setuid(evl_conf->mailuid) != 0) {
> + 	    sudo_debug_printf(SUDO_DEBUG_ERROR, "unable to change uid to %u",
> + 		(unsigned int)evl_conf->mailuid);
> ++	    goto bad;
> + 	}
> +     }
> +     sudo_debug_exit(__func__, __FILE__, __LINE__, sudo_debug_subsys);
> +@@ -347,6 +357,9 @@ exec_mailer(int pipein)
> +     sudo_debug_printf(SUDO_DEBUG_ERROR, "unable to execute %s: %s",
> + 	mpath, strerror(errno));
> +     _exit(127);
> ++bad:
> ++    sudo_debug_exit(__func__, __FILE__, __LINE__, sudo_debug_subsys);
> ++    _exit(127);
> + }
> + 
> + /* Send a message to the mailto user */
> +diff --git a/lib/eventlog/eventlog_conf.c b/lib/eventlog/eventlog_conf.c
> +index 0663a38..ec3b569 100644
> +--- a/lib/eventlog/eventlog_conf.c
> ++++ b/lib/eventlog/eventlog_conf.c
> +@@ -70,6 +70,7 @@ static struct eventlog_config evl_conf = {
> +     MAXSYSLOGLEN,		/* syslog_maxlen */
> +     0,				/* file_maxlen */
> +     ROOT_UID,			/* mailuid */
> ++    ROOT_GID,			/* mailgid */
> +     false,			/* omit_hostname */
> +     _PATH_SUDO_LOGFILE,		/* logpath */
> +     "%h %e %T",			/* time_fmt */
> +@@ -151,9 +152,10 @@ eventlog_set_file_maxlen(size_t len)
> + }
> + 
> + void
> +-eventlog_set_mailuid(uid_t uid)
> ++eventlog_set_mailuser(uid_t uid, gid_t gid)
> + {
> +     evl_conf.mailuid = uid;
> ++    evl_conf.mailgid = gid;
> + }
> + 
> + void
> +diff --git a/plugins/sudoers/logging.c b/plugins/sudoers/logging.c
> +index bd4de92..9535289 100644
> +--- a/plugins/sudoers/logging.c
> ++++ b/plugins/sudoers/logging.c
> +@@ -1157,7 +1157,7 @@ init_eventlog_config(void)
> +     eventlog_set_syslog_alertpri(def_syslog_badpri);
> +     eventlog_set_syslog_maxlen(def_syslog_maxlen);
> +     eventlog_set_file_maxlen(def_loglinelen);
> +-    eventlog_set_mailuid(ROOT_UID);
> ++    eventlog_set_mailuser(ROOT_UID, ROOT_GID);
> +     eventlog_set_omit_hostname(!def_log_host);
> +     eventlog_set_logpath(def_logfile);
> +     eventlog_set_time_fmt(def_log_year ? "%h %e %T %Y" : "%h %e %T");
> +diff --git a/plugins/sudoers/policy.c b/plugins/sudoers/policy.c
> +index f3adfb0..27f6e58 100644
> +--- a/plugins/sudoers/policy.c
> ++++ b/plugins/sudoers/policy.c
> +@@ -639,7 +639,7 @@ sudoers_policy_deserialize_info(struct sudoers_context *ctx, void *v,
> +     }
> + 
> + #ifdef NO_ROOT_MAILER
> +-    eventlog_set_mailuid(ctx->user.uid);
> ++    eventlog_set_mailuser(ctx->user.uid, ctx->user.gid);
> + #endif
> + 
> +     /* Dump settings and user info (XXX - plugin args) */
> diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
> index 8602e62b0b..e28f7815f9 100644
> --- a/package/sudo/sudo.mk
> +++ b/package/sudo/sudo.mk
> @@ -12,6 +12,10 @@ SUDO_LICENSE = ISC, BSD-3-Clause
>  SUDO_LICENSE_FILES = LICENSE.md
>  SUDO_CPE_ID_VERSION = $(SUDO_VERSION_MAJOR)
>  SUDO_CPE_ID_UPDATE = $(SUDO_VERSION_MINOR)
> +
> +# 0001-exec-mailer-set-group-as-well-as-uid-when-running-the-mailer.patch
> +SUDO_IGNORE_CVES += CVE-2026-35535
> +
>  SUDO_SELINUX_MODULES = sudo
>  # This is to avoid sudo's make install from chown()ing files which fails
>  SUDO_INSTALL_TARGET_OPTS = INSTALL_OWNER="" DESTDIR="$(TARGET_DIR)" install
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
