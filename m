Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9340C44501
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2546810DC;
	Fri, 10 Jul 2026 13:44:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OtMgbIUT9Fs9; Fri, 10 Jul 2026 13:44:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE3B5810BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691093;
	bh=37IJJn4KJ756CTlfUl+ADTKYlnvJgyCzY9SqJv8WS8A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UIJdVx5cv7aewG2IDkQK7ru47GE8lxrAS25DiTIk1SYynypQxvj/ViO6CIkuLLKFk
	 d9pop/3njjUsDkpIJ16/9mf9AtrN8hFrGm5NCoA+iPSN4gWd785yORVpEqch7Klj1z
	 jq58ShA7hI20+K5TFvVldPycACBYpnNIqcxRGx/nmnq9iTW1g47gERxJg4W7zheEyj
	 tMCHj7y7BYBYYlxWQJIXP/pljXHSIWvAlRsRyHnRKLWO8pqoBCx5FaiQp04zlAbpuF
	 RkXDVtSSMgQeDT83T52bSMae4RNYlLsPEWZI7UE88eO1+8tFBIqNieiRyAZl4EcIVB
	 V6q/s31aqHpWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE3B5810BA;
	Fri, 10 Jul 2026 13:44:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DFA77FD1
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC724606A8
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2FPDQGeLua6G for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:44:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E25CA606B4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E25CA606B4
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 175AF88674; Fri, 10 Jul 2026 13:44:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 13:49:09 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: f532ff0fef11f95fd982e84b6647cab6790913b9
X-Git-Newrev: 2a0e73dfcbc95a60f8de16a69427d4d406a7a070
X-Patchwork-Hint: ignore
Message-Id: <20260710134410.175AF88674@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/sudo: backport
 patch CVE-2026-35535
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2a0e73dfcbc95a60f8de16a69427d4d406a7a070
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

This backport is provided thanks to the Debian community [1].

- CVE-2026-35535:
    In Sudo through 1.9.17p2 before 3e474c2, a failure of a setuid,
    setgid, or setgroups call, during a privilege drop before running the
    mailer, is not a fatal error and can lead to privilege escalation.

For more information, see:
    https://www.cve.org/CVERecord?id=CVE-2026-35535

[1] https://salsa.debian.org/sudo-team/sudo/-/blob/debian/trixie/debian/patches/0006-exec_mailer-Set-group-as-well-as-uid-when-running-th.patch

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 54de8d26d0ec1d0b7651a0f9866f6846ebe0f758)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...up-as-well-as-uid-when-running-the-mailer.patch | 147 +++++++++++++++++++++
 package/sudo/sudo.mk                               |   4 +
 2 files changed, 151 insertions(+)

diff --git a/package/sudo/0001-exec-mailer-set-group-as-well-as-uid-when-running-the-mailer.patch b/package/sudo/0001-exec-mailer-set-group-as-well-as-uid-when-running-the-mailer.patch
new file mode 100644
index 0000000000..0bfcdd6f93
--- /dev/null
+++ b/package/sudo/0001-exec-mailer-set-group-as-well-as-uid-when-running-the-mailer.patch
@@ -0,0 +1,147 @@
+From 3e474c2f201484be83d994ae10a4e20e8c81bb69 Mon Sep 17 00:00:00 2001
+From: "Todd C. Miller" <Todd.Miller@sudo.ws>
+Date: Sat, 8 Nov 2025 15:34:02 -0700
+Subject: [PATCH] exec_mailer: Set group as well as uid when running the mailer
+
+Also make a setuid(), setgid() or setgroups() failure fatal.
+
+Found by the ZeroPath AI Security Engineer <https://zeropath.com>
+
+CVE: CVE-2026-35535
+Upstream: https://github.com/sudo-project/sudo/commit/3e474c2f201484be83d994ae10a4e20e8c81bb69
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ include/sudo_eventlog.h      |  3 ++-
+ lib/eventlog/eventlog.c      | 21 +++++++++++++++++----
+ lib/eventlog/eventlog_conf.c |  4 +++-
+ plugins/sudoers/logging.c    |  2 +-
+ plugins/sudoers/policy.c     |  2 +-
+ 5 files changed, 24 insertions(+), 8 deletions(-)
+
+diff --git a/include/sudo_eventlog.h b/include/sudo_eventlog.h
+index eb9f4f4..485d259 100644
+--- a/include/sudo_eventlog.h
++++ b/include/sudo_eventlog.h
+@@ -80,6 +80,7 @@ struct eventlog_config {
+     int syslog_rejectpri;
+     int syslog_alertpri;
+     uid_t mailuid;
++    gid_t mailgid;
+     bool omit_hostname;
+     const char *logpath;
+     const char *time_fmt;
+@@ -151,7 +152,7 @@ void eventlog_set_syslog_rejectpri(int pri);
+ void eventlog_set_syslog_alertpri(int pri);
+ void eventlog_set_syslog_maxlen(size_t len);
+ void eventlog_set_file_maxlen(size_t len);
+-void eventlog_set_mailuid(uid_t uid);
++void eventlog_set_mailuser(uid_t uid, gid_t gid);
+ void eventlog_set_omit_hostname(bool omit_hostname);
+ void eventlog_set_logpath(const char *path);
+ void eventlog_set_time_fmt(const char *fmt);
+diff --git a/lib/eventlog/eventlog.c b/lib/eventlog/eventlog.c
+index 5a32824..d56c4e4 100644
+--- a/lib/eventlog/eventlog.c
++++ b/lib/eventlog/eventlog.c
+@@ -304,15 +304,13 @@ exec_mailer(int pipein)
+ 	syslog(LOG_ERR, _("unable to dup stdin: %m")); // -V618
+ 	sudo_debug_printf(SUDO_DEBUG_ERROR,
+ 	    "unable to dup stdin: %s", strerror(errno));
+-	sudo_debug_exit(__func__, __FILE__, __LINE__, sudo_debug_subsys);
+-	_exit(127);
++	goto bad;
+     }
+ 
+     /* Build up an argv based on the mailer path and flags */
+     if ((mflags = strdup(evl_conf->mailerflags)) == NULL) {
+ 	syslog(LOG_ERR, _("unable to allocate memory")); // -V618
+-	sudo_debug_exit(__func__, __FILE__, __LINE__, sudo_debug_subsys);
+-	_exit(127);
++	goto bad;
+     }
+     argv[0] = sudo_basename(mpath);
+ 
+@@ -331,11 +329,23 @@ exec_mailer(int pipein)
+     if (setuid(ROOT_UID) != 0) {
+ 	sudo_debug_printf(SUDO_DEBUG_ERROR, "unable to change uid to %u",
+ 	    ROOT_UID);
++	goto bad;
++    }
++    if (setgid(evl_conf->mailgid) != 0) {
++	sudo_debug_printf(SUDO_DEBUG_ERROR, "unable to change gid to %u",
++	    (unsigned int)evl_conf->mailgid);
++	goto bad;
++    }
++    if (setgroups(1, &evl_conf->mailgid) != 0) {
++	sudo_debug_printf(SUDO_DEBUG_ERROR, "unable to set groups to %u",
++	    (unsigned int)evl_conf->mailgid);
++	goto bad;
+     }
+     if (evl_conf->mailuid != ROOT_UID) {
+ 	if (setuid(evl_conf->mailuid) != 0) {
+ 	    sudo_debug_printf(SUDO_DEBUG_ERROR, "unable to change uid to %u",
+ 		(unsigned int)evl_conf->mailuid);
++	    goto bad;
+ 	}
+     }
+     sudo_debug_exit(__func__, __FILE__, __LINE__, sudo_debug_subsys);
+@@ -347,6 +357,9 @@ exec_mailer(int pipein)
+     sudo_debug_printf(SUDO_DEBUG_ERROR, "unable to execute %s: %s",
+ 	mpath, strerror(errno));
+     _exit(127);
++bad:
++    sudo_debug_exit(__func__, __FILE__, __LINE__, sudo_debug_subsys);
++    _exit(127);
+ }
+ 
+ /* Send a message to the mailto user */
+diff --git a/lib/eventlog/eventlog_conf.c b/lib/eventlog/eventlog_conf.c
+index 0663a38..ec3b569 100644
+--- a/lib/eventlog/eventlog_conf.c
++++ b/lib/eventlog/eventlog_conf.c
+@@ -70,6 +70,7 @@ static struct eventlog_config evl_conf = {
+     MAXSYSLOGLEN,		/* syslog_maxlen */
+     0,				/* file_maxlen */
+     ROOT_UID,			/* mailuid */
++    ROOT_GID,			/* mailgid */
+     false,			/* omit_hostname */
+     _PATH_SUDO_LOGFILE,		/* logpath */
+     "%h %e %T",			/* time_fmt */
+@@ -151,9 +152,10 @@ eventlog_set_file_maxlen(size_t len)
+ }
+ 
+ void
+-eventlog_set_mailuid(uid_t uid)
++eventlog_set_mailuser(uid_t uid, gid_t gid)
+ {
+     evl_conf.mailuid = uid;
++    evl_conf.mailgid = gid;
+ }
+ 
+ void
+diff --git a/plugins/sudoers/logging.c b/plugins/sudoers/logging.c
+index bd4de92..9535289 100644
+--- a/plugins/sudoers/logging.c
++++ b/plugins/sudoers/logging.c
+@@ -1157,7 +1157,7 @@ init_eventlog_config(void)
+     eventlog_set_syslog_alertpri(def_syslog_badpri);
+     eventlog_set_syslog_maxlen(def_syslog_maxlen);
+     eventlog_set_file_maxlen(def_loglinelen);
+-    eventlog_set_mailuid(ROOT_UID);
++    eventlog_set_mailuser(ROOT_UID, ROOT_GID);
+     eventlog_set_omit_hostname(!def_log_host);
+     eventlog_set_logpath(def_logfile);
+     eventlog_set_time_fmt(def_log_year ? "%h %e %T %Y" : "%h %e %T");
+diff --git a/plugins/sudoers/policy.c b/plugins/sudoers/policy.c
+index f3adfb0..27f6e58 100644
+--- a/plugins/sudoers/policy.c
++++ b/plugins/sudoers/policy.c
+@@ -639,7 +639,7 @@ sudoers_policy_deserialize_info(struct sudoers_context *ctx, void *v,
+     }
+ 
+ #ifdef NO_ROOT_MAILER
+-    eventlog_set_mailuid(ctx->user.uid);
++    eventlog_set_mailuser(ctx->user.uid, ctx->user.gid);
+ #endif
+ 
+     /* Dump settings and user info (XXX - plugin args) */
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 8602e62b0b..e28f7815f9 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -12,6 +12,10 @@ SUDO_LICENSE = ISC, BSD-3-Clause
 SUDO_LICENSE_FILES = LICENSE.md
 SUDO_CPE_ID_VERSION = $(SUDO_VERSION_MAJOR)
 SUDO_CPE_ID_UPDATE = $(SUDO_VERSION_MINOR)
+
+# 0001-exec-mailer-set-group-as-well-as-uid-when-running-the-mailer.patch
+SUDO_IGNORE_CVES += CVE-2026-35535
+
 SUDO_SELINUX_MODULES = sudo
 # This is to avoid sudo's make install from chown()ing files which fails
 SUDO_INSTALL_TARGET_OPTS = INSTALL_OWNER="" DESTDIR="$(TARGET_DIR)" install
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
