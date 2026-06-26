Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87AF4C43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 20:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 434CF60F63;
	Fri, 26 Jun 2026 20:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dpZiIijLH4yC; Fri, 26 Jun 2026 20:45:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1ED2260F3A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782506726;
	bh=BtYnZEfPGdBqQzzYR01oaw5QDm07PdMpq22iOe267o0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dscJGc6/DSkedO33hERRQNGuI9KGXd8KOA3AnSC31H1kBc5HiVy0eCoWM6D1u6Td5
	 hT293oA4h9H8eR+j4tQ+hfDPe0SfWJI2Gnz8y1aZCHCbp/igcLyR6+OHdDG7WYNr+Y
	 HP04wf7uybNnPMOdHCs2Wlv35nV5tQVvTLFw/QIv62klGbdmU40C1ItSiLBmlQcGjU
	 7XOLVymerOc+1FAve/WBR+G7t1rbjXio5jyKCyqmAzWTYXAsy3++feS5I7li+3zKfz
	 eijAm8mgBc6aJvyChYF9uS68eVTYlA5mwuHUpRWJVhsHh48IFyyMUc3dGz+sdZ92bW
	 5Zuv1RGfUXIxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1ED2260F3A;
	Fri, 26 Jun 2026 20:45:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5653028A
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 20:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47E62400D8
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 20:45:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uoei41agtrLU for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 20:45:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0E60D400B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E60D400B9
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E60D400B9
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 20:45:23 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-4702b8e253cso66486f8f.0
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 13:45:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782506722; x=1783111522;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OxEt96V8HQ75ZOPN+iO6b3qXe/T6xE9722KAShARk5s=;
 b=bhBdILi+1DkqhPNSEnvRDyEuYpG1gj4D6otsV7Hp1nZWnZ2EAEfkpuSqDNb0BAcz2p
 FeCYhzYK+qv5iWtaO4y9FlsDJrCvFLxaUYtS7UmSXUCqTp+6H5LN33aZT5HDykO3hz02
 AKGLv0zjU4Iwhh6sukCxH3rutw7Yq8/KPM1LsXL2Fat2BOxRC32DH/xtzmQMxGek6WLH
 4DLgwtO+HF04NVUcXqxMPoxEh1YFNV4bcpNlW6yLXhUu/QMpVn6SbCgAQu7U4DUMzQL/
 lxX7P/r6QE21ebCooJjP0GlYV7Ezcdb5mTPaWCngY9YGkAlkMjoh666V4d2KLG6bsdrm
 F+GQ==
X-Gm-Message-State: AOJu0YykbzOdfnuIf9CP4nlIraM5fR0nesR/VoQ7h46mqmkPkdZO72uo
 J+EzqfV2W+LWTDUZFyZJ7/slqAkYxgcgSKoXSDkSt8llBzfRgqpcEaUlS4XJK20LxvGsDUzcZXI
 jyWb7
X-Gm-Gg: AfdE7cn6oZWijLZyVJTaQHPuDylF89L39zzMqg45oHE8fEzF/HildHpUztX8+hDJdc1
 kwMmt2w6Z8nHBi+Sr9MX/p8bragOIEFUpuy6yjalrBi/nel0hcJANslTUC7psi5gLrKtcuaLz9m
 CH54Dpg+rYvkfRcYgrv24JEJZyp5cOlY7efV69HLEK/4/unUfyGz0XzXhsJwuz9Nwk+588rgVy1
 y7JeypqvcgqK+Azw0Se1SpS5+7Zr6/363/U8VIIDemt5buovKnRkbSKAK1EEQWP4MIgADn439vF
 2JiSDQAlPBrsqxWB09VVOMt3Xx3eieTT0TiyU0jLjzm+9F+shm1qfhXfLiPvNdkiKjw5SlvtCdr
 rq0/q4LaQgbc0zPluZLKeDFlOajzPZhVEazlZCqc+SAR77RguhW1oB+iuL5NsC3ttNjDBT5D7ut
 TUoB/H
X-Received: by 2002:a05:6000:382:b0:46e:8678:76d0 with SMTP id
 ffacd0b85a97d-46fb8d935e9mr3716798f8f.33.1782506721552; 
 Fri, 26 Jun 2026 13:45:21 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46d86960983sm18910494f8f.4.2026.06.26.13.45.21
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 13:45:21 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 26 Jun 2026 22:45:20 +0200
Message-ID: <20260626204520.328944-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782506722; x=1783111522; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=OxEt96V8HQ75ZOPN+iO6b3qXe/T6xE9722KAShARk5s=;
 b=LbHFEMg99A1U29uJiiauu0eARnmR4lngy8HwAuEXne5gQHcUVRQj3uk2yBFCKtC8om
 XMy0HRe5/jvQdCva35KoeYfanQ0zVT5ZZOevfAFba8Ge3Jehx1KRpP6KHvB9KEUeXU0I
 iHc7VdKvWlYPIZ51DbnZaPS+aY5rFhH3F/8LSBEhOnFOlfAfvZl3BWtXRadlC5+fFfxt
 AtLmKiu97hzo3kDJf+GFHA1UClIjsyfouXYnvoN4hZq2Uki0hcN7DfzsVExy6EW4EL2b
 dglAxCjwvXfYPNCjJ32EDu4J7YrDx3AWbrelZWiGXqKlaTMrU9fgAIczx0KESGuCBUHW
 +MUw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LbHFEMg9
Subject: [Buildroot] [PATCH] package/sudo: backport patch CVE-2026-35535
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

This backport is provided thanks to the Debian community [1].

- CVE-2026-35535:
    In Sudo through 1.9.17p2 before 3e474c2, a failure of a setuid,
    setgid, or setgroups call, during a privilege drop before running the
    mailer, is not a fatal error and can lead to privilege escalation.

For more information, see:
    https://www.cve.org/CVERecord?id=CVE-2026-35535

[1] https://salsa.debian.org/sudo-team/sudo/-/blob/debian/trixie/debian/patches/0006-exec_mailer-Set-group-as-well-as-uid-when-running-th.patch

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...-well-as-uid-when-running-the-mailer.patch | 147 ++++++++++++++++++
 package/sudo/sudo.mk                          |   4 +
 2 files changed, 151 insertions(+)
 create mode 100644 package/sudo/0001-exec-mailer-set-group-as-well-as-uid-when-running-the-mailer.patch

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
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
