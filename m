Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 376C2C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AD9A40D27;
	Fri, 10 Jul 2026 13:52:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jtH4eC3I7Kv2; Fri, 10 Jul 2026 13:52:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CBA540CE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691524;
	bh=3xAGvSX+g4hfsJxJlFdCKeX+VSkGnRJkubLSEa4BVuw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Y7N1mnzTAh1+bWZlb7K/1/4df6cU6QMbUmVTfMCJFsqsXRK4F32HXeDqB8RtKN4jv
	 Rit8YZ5V7JdO8fIBaHAfMj/824UOuf9YDq33U/sLyYThg/lOWGNwbrLs90jCkmk1Sh
	 BLEi1dqGPn9ZNLZBmGEhZPM3nCxF4OGEQDZyUzlHBcbKq76wi1lYCJQB/8WzaE3IJK
	 inxO9+I84FR3F7H5XSDvSfp0IoXpUCl4Qwm0cyVpohnNGJ4Z8mk5jXijzUDFpUGMo+
	 8cDANWttiCqb/AYt6aiW/pDaJ35LDhTYT2lJEIP4WWokMRHDsBwArAVIAFQTHHLGZB
	 8rP3z4wK3NO4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CBA540CE1;
	Fri, 10 Jul 2026 13:52:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CDA60A3C
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC4A581151
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WwsQfpU7N0jl for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:52:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 59D5481172
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59D5481172
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59D5481172
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:01 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-493b77b150aso8179035e9.2
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 06:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783691519; x=1784296319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=YPJMReYiBprKvrzHpbdJnBaXjE0yG6B4Uf7dcGztLos=;
 b=JZipMwpHMnO5x+boWXMfkVpYaCri5atKqZf+/YqfznqOeLE8+VDKOPcT1JCq+hBU6f
 XOb+YmaHYcpkt9Y5AEsMP6kcJM0ITVBRgpe2l0Ys3kWvhfCYpthB6xIH6rjRdq8g/K0T
 HV2evTxey0feEqc4G+O74HvMX3u/uaaR5CQjUyJQ2onlui6l9QYdlqQdm98q2CV5TEK9
 rN/KTDta823EvIibh1J5swceGDdIgVL2+n5PGyqPQ2Y2HBULu8k+PAil2BGtzIgrfNZz
 qpOOXT8uEOKM/OgFSpMm4MB3kj5Uysv+mVQALc7dEH7a1Zy7cefFvg05RtjkG1aU4l2R
 fZSg==
X-Gm-Message-State: AOJu0YxjbFKYcYuO82of5GDktb83tbHlMqeqC8sM9ZR1z2S+BVCkyA1n
 JKuzrIckZSc/UKzfAgmk0Fd4W6gwFGX7ao47imaOqGL1O+JzZ3j7DYE9WmKyuykZqc9WjISESKp
 IiW4/
X-Gm-Gg: AfdE7cmejqcFCMgakxVvsbaOejq6ox9Z3+ZTUheH9HNxboAdoP8nR317HTaPgk4njo3
 2H9z059uz7I1ElgCpu4MOiGDuzzkQPKpcmJodk98voKBW/xcMsXKp7tH+c7rTPSd9fLotOgRh3Y
 U233MVTKIHMcFGs/SXo/psjdEmZZyq4D6Jq3ebQIOhIFsvyxeOTV8Wzy4gReg7VbW8jJ1Zn+qmE
 ChFeROrklXE/AlC+I27x0qOLw4cwVmn+ZgAWJ3+fxLRpgGLEfHjsxNYa4TQHbV6XDXi4J1JhQfR
 BkxW89mLZeYV9ThQopAQeILLHninM8T6Qs8eQ/a/jJZeojGNb9S25bP/tLhdojELY15lRL1mdh/
 nb6OLe09GxjcewXHm6rCjvGp1bm9p3bpIBrCak73mbkEDxbPgXx52rPd/23ZHcJ1yhJxrku3CS4
 2P2KNlhw==
X-Received: by 2002:a05:600c:628e:b0:493:a5f9:d345 with SMTP id
 5b1f17b1804b1-493e68c6944mr114862715e9.26.1783691519132; 
 Fri, 10 Jul 2026 06:51:59 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6ccdbbsm145814655e9.3.2026.07.10.06.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 06:51:58 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 15:51:58 +0200
Message-ID: <20260710135158.759938-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260629205930.623351-1-thomas.perale@mind.be>
References: <20260629205930.623351-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783691519; x=1784296319; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YPJMReYiBprKvrzHpbdJnBaXjE0yG6B4Uf7dcGztLos=;
 b=HycWnPJPOZwrb0JIM0dogf90YKY62ZmzLyc0y4Q1sbcyqOqKLymzbCVrgu0OvoNJqh
 o6wYF2u7Y0HgfThmPN/Z618LrOMURuqA8sRRA9CuoyiHebGqm0TB+98fFTm04XzC099c
 eRvppl1AXiIjHVnrFKO5ZA8APh1FJnpSqHdc9W2gl2JltEIwXwGHg34IRMVv8NvU2oyt
 lgtup6wlg3BH0QlQW5kIRgRlCR2O/o9ZuxK8/vqvznFJeP92lwCOwrwxE1Z1NmYShhSE
 XaJCNilE7Nj18AmBj3pOIsPiBKz+JzcfT1MTzUJuFBaYemeUmSiWDq3HiAnmAKePgiOz
 YKqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HycWnPJP
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

Applied to 2026.05.x & 2025.02.x. Thanks

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
