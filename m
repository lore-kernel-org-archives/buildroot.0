Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82215C433F5
	for <buildroot@archiver.kernel.org>; Mon,  3 Oct 2022 14:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 041A6415D6;
	Mon,  3 Oct 2022 14:45:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 041A6415D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aM6cg9NoIq1I; Mon,  3 Oct 2022 14:45:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B57F415CB;
	Mon,  3 Oct 2022 14:45:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B57F415CB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C15A41BF2BD
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 14:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CACE605A4
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 14:45:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CACE605A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LPXxYqR28ydz for <buildroot@lists.busybox.net>;
 Mon,  3 Oct 2022 14:45:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EFBB60590
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0EFBB60590
 for <buildroot@buildroot.org>; Mon,  3 Oct 2022 14:45:00 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id y100so14387022ede.6
 for <buildroot@buildroot.org>; Mon, 03 Oct 2022 07:45:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=dnQGs3n7NOVZwRsJHSPYefJ/FmYiPlPKXC1qgvayA4I=;
 b=zZEF3mDXaS4CvyXUFsVcyYizjSZ2IQJYDURNoJwYqZsqtFX35aaiWYVRpfRrU4Mf61
 3r3u4x/X3I8V5N8EF7b4fX/eGUmfDIpb6wKrsG7Anrm6JpFPaYxKyYAD0NN/Lu+K6SAI
 GdWrqyI46uAhSjEuzH1Va7ow5WmcB5zXT61rsC96vC940QYBxj1e0uv7JbzIPlqIX9Q6
 5o5vmLtzuWmIvzNk8EqU0tWTfZVHnkKrHmON5PALZi3Jp3mlvv1WuAfYyqe0CLR9RAhu
 3T69IFEUCfG3ufgrXvx8ll94NvrWIO8bHnKhywfgcWLFPAsVcewH/YtriVbmxqdBdFnd
 PL2Q==
X-Gm-Message-State: ACrzQf2LweOvUbeqfhwh5WZEhOfjUycrYiJXOHSvPso4+30GN6r0V8pT
 npsKJhYwEt519vh92bUtoHLg9by5uJ2QDA==
X-Google-Smtp-Source: AMsMyM4Gfno8bN1evMbOEXMq84I7+9OXNhGLUEiiX6POmuzc07TNszxwEnQdQV+qvROXdAYh3cgB3w==
X-Received: by 2002:a05:6402:849:b0:453:10c3:2ee3 with SMTP id
 b9-20020a056402084900b0045310c32ee3mr19025091edz.339.1664808299197; 
 Mon, 03 Oct 2022 07:44:59 -0700 (PDT)
Received: from angeloc.amarulasolutions.com
 (host085115199111.static.fidoka.tech. [85.115.199.111])
 by smtp.gmail.com with ESMTPSA id
 hh14-20020a170906a94e00b0073dc4385d3bsm5589844ejb.105.2022.10.03.07.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 07:44:58 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  3 Oct 2022 16:44:55 +0200
Message-Id: <20221003144455.3173974-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=dnQGs3n7NOVZwRsJHSPYefJ/FmYiPlPKXC1qgvayA4I=;
 b=SuPW4NboFZAX2s5gLy5lNxbJE/P/KlsVRP0f5+X60882PS+iybXwDiAgoJ25VdtW4D
 P/f/btG/e8k3t4xhivBB/+kcaExyUj+7zN9e2lwupMqPYB+uXymEkYtqkpWP7dpg1iYc
 9vH5F2BrP1A/6HVRi5V73Xnsw9CttpVvMP3fU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=SuPW4Nbo
Subject: [Buildroot] [PATCH] package/fail2ban: bump to version 1.0.1
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removing also upstreamed patches.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 ...-vulnerability-unset-escape-variable.patch | 158 ------------------
 ...with-error-in-fail2ban-setup-command.patch |  67 --------
 package/fail2ban/fail2ban.hash                |   2 +-
 package/fail2ban/fail2ban.mk                  |   2 +-
 4 files changed, 2 insertions(+), 227 deletions(-)
 delete mode 100644 package/fail2ban/0001-fixed-possible-RCE-vulnerability-unset-escape-variable.patch
 delete mode 100644 package/fail2ban/0002-fix-gh-3098-build-fails-with-error-in-fail2ban-setup-command.patch

diff --git a/package/fail2ban/0001-fixed-possible-RCE-vulnerability-unset-escape-variable.patch b/package/fail2ban/0001-fixed-possible-RCE-vulnerability-unset-escape-variable.patch
deleted file mode 100644
index 6d44f41d85..0000000000
--- a/package/fail2ban/0001-fixed-possible-RCE-vulnerability-unset-escape-variable.patch
+++ /dev/null
@@ -1,158 +0,0 @@
-From 410a6ce5c80dd981c22752da034f2529b5eee844 Mon Sep 17 00:00:00 2001
-From: sebres <serg.brester@sebres.de>
-Date: Mon, 21 Jun 2021 17:12:53 +0200
-Subject: [PATCH] fixed possible RCE vulnerability, unset escape variable
- (default tilde) stops consider "~" char after new-line as composing escape
- sequence
-
-[Retrieved from:
-https://github.com/fail2ban/fail2ban/commit/410a6ce5c80dd981c22752da034f2529b5eee844]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- config/action.d/complain.conf         | 2 +-
- config/action.d/dshield.conf          | 2 +-
- config/action.d/mail-buffered.conf    | 8 ++++----
- config/action.d/mail-whois-lines.conf | 2 +-
- config/action.d/mail-whois.conf       | 6 +++---
- config/action.d/mail.conf             | 6 +++---
- 6 files changed, 13 insertions(+), 13 deletions(-)
-
-diff --git a/config/action.d/complain.conf b/config/action.d/complain.conf
-index 3a5f882c9f..4d73b05859 100644
---- a/config/action.d/complain.conf
-+++ b/config/action.d/complain.conf
-@@ -102,7 +102,7 @@ logpath = /dev/null
- # Notes.:  Your system mail command. Is passed 2 args: subject and recipient
- # Values:  CMD
- #
--mailcmd = mail -s
-+mailcmd = mail -E 'set escape' -s
- 
- # Option:  mailargs
- # Notes.:  Additional arguments to mail command. e.g. for standard Unix mail:
-diff --git a/config/action.d/dshield.conf b/config/action.d/dshield.conf
-index c128bef348..3d5a7a53a9 100644
---- a/config/action.d/dshield.conf
-+++ b/config/action.d/dshield.conf
-@@ -179,7 +179,7 @@ tcpflags =
- # Notes.:  Your system mail command. Is passed 2 args: subject and recipient
- # Values:  CMD
- #
--mailcmd = mail -s
-+mailcmd = mail -E 'set escape' -s
- 
- # Option:  mailargs
- # Notes.:  Additional arguments to mail command. e.g. for standard Unix mail:
-diff --git a/config/action.d/mail-buffered.conf b/config/action.d/mail-buffered.conf
-index 325f185b2f..79b841049c 100644
---- a/config/action.d/mail-buffered.conf
-+++ b/config/action.d/mail-buffered.conf
-@@ -17,7 +17,7 @@ actionstart = printf %%b "Hi,\n
-               The jail <name> has been started successfully.\n
-               Output will be buffered until <lines> lines are available.\n
-               Regards,\n
--              Fail2Ban"|mail -s "[Fail2Ban] <name>: started on <fq-hostname>" <dest>
-+              Fail2Ban"|mail -E 'set escape' -s "[Fail2Ban] <name>: started on <fq-hostname>" <dest>
- 
- # Option:  actionstop
- # Notes.:  command executed at the stop of jail (or at the end of Fail2Ban)
-@@ -28,13 +28,13 @@ actionstop = if [ -f <tmpfile> ]; then
-                  These hosts have been banned by Fail2Ban.\n
-                  `cat <tmpfile>`
-                  Regards,\n
--                 Fail2Ban"|mail -s "[Fail2Ban] <name>: Summary from <fq-hostname>" <dest>
-+                 Fail2Ban"|mail -E 'set escape' -s "[Fail2Ban] <name>: Summary from <fq-hostname>" <dest>
-                  rm <tmpfile>
-              fi
-              printf %%b "Hi,\n
-              The jail <name> has been stopped.\n
-              Regards,\n
--             Fail2Ban"|mail -s "[Fail2Ban] <name>: stopped on <fq-hostname>" <dest>
-+             Fail2Ban"|mail -E 'set escape' -s "[Fail2Ban] <name>: stopped on <fq-hostname>" <dest>
- 
- # Option:  actioncheck
- # Notes.:  command executed once before each actionban command
-@@ -55,7 +55,7 @@ actionban = printf %%b "`date`: <ip> (<failures> failures)\n" >> <tmpfile>
-                 These hosts have been banned by Fail2Ban.\n
-                 `cat <tmpfile>`
-                 \nRegards,\n
--                Fail2Ban"|mail -s "[Fail2Ban] <name>: Summary" <dest>
-+                Fail2Ban"|mail -E 'set escape' -s "[Fail2Ban] <name>: Summary" <dest>
-                 rm <tmpfile>
-             fi
- 
-diff --git a/config/action.d/mail-whois-lines.conf b/config/action.d/mail-whois-lines.conf
-index 3a3e56b2c7..d2818cb9b9 100644
---- a/config/action.d/mail-whois-lines.conf
-+++ b/config/action.d/mail-whois-lines.conf
-@@ -72,7 +72,7 @@ actionunban =
- # Notes.:  Your system mail command. Is passed 2 args: subject and recipient
- # Values:  CMD
- #
--mailcmd = mail -s
-+mailcmd = mail -E 'set escape' -s
- 
- # Default name of the chain
- #
-diff --git a/config/action.d/mail-whois.conf b/config/action.d/mail-whois.conf
-index 7fea34c40d..ab33b616dc 100644
---- a/config/action.d/mail-whois.conf
-+++ b/config/action.d/mail-whois.conf
-@@ -20,7 +20,7 @@ norestored = 1
- actionstart = printf %%b "Hi,\n
-               The jail <name> has been started successfully.\n
-               Regards,\n
--              Fail2Ban"|mail -s "[Fail2Ban] <name>: started on <fq-hostname>" <dest>
-+              Fail2Ban"|mail -E 'set escape' -s "[Fail2Ban] <name>: started on <fq-hostname>" <dest>
- 
- # Option:  actionstop
- # Notes.:  command executed at the stop of jail (or at the end of Fail2Ban)
-@@ -29,7 +29,7 @@ actionstart = printf %%b "Hi,\n
- actionstop = printf %%b "Hi,\n
-              The jail <name> has been stopped.\n
-              Regards,\n
--             Fail2Ban"|mail -s "[Fail2Ban] <name>: stopped on <fq-hostname>" <dest>
-+             Fail2Ban"|mail -E 'set escape' -s "[Fail2Ban] <name>: stopped on <fq-hostname>" <dest>
- 
- # Option:  actioncheck
- # Notes.:  command executed once before each actionban command
-@@ -49,7 +49,7 @@ actionban = printf %%b "Hi,\n
-             Here is more information about <ip> :\n
-             `%(_whois_command)s`\n
-             Regards,\n
--            Fail2Ban"|mail -s "[Fail2Ban] <name>: banned <ip> from <fq-hostname>" <dest>
-+            Fail2Ban"|mail -E 'set escape' -s "[Fail2Ban] <name>: banned <ip> from <fq-hostname>" <dest>
- 
- # Option:  actionunban
- # Notes.:  command executed when unbanning an IP. Take care that the
-diff --git a/config/action.d/mail.conf b/config/action.d/mail.conf
-index 5d8c0e154c..f4838ddcb6 100644
---- a/config/action.d/mail.conf
-+++ b/config/action.d/mail.conf
-@@ -16,7 +16,7 @@ norestored = 1
- actionstart = printf %%b "Hi,\n
-               The jail <name> has been started successfully.\n
-               Regards,\n
--              Fail2Ban"|mail -s "[Fail2Ban] <name>: started  on <fq-hostname>" <dest>
-+              Fail2Ban"|mail -E 'set escape' -s "[Fail2Ban] <name>: started  on <fq-hostname>" <dest>
- 
- # Option:  actionstop
- # Notes.:  command executed at the stop of jail (or at the end of Fail2Ban)
-@@ -25,7 +25,7 @@ actionstart = printf %%b "Hi,\n
- actionstop = printf %%b "Hi,\n
-              The jail <name> has been stopped.\n
-              Regards,\n
--             Fail2Ban"|mail -s "[Fail2Ban] <name>: stopped on <fq-hostname>" <dest>
-+             Fail2Ban"|mail -E 'set escape' -s "[Fail2Ban] <name>: stopped on <fq-hostname>" <dest>
- 
- # Option:  actioncheck
- # Notes.:  command executed once before each actionban command
-@@ -43,7 +43,7 @@ actionban = printf %%b "Hi,\n
-             The IP <ip> has just been banned by Fail2Ban after
-             <failures> attempts against <name>.\n
-             Regards,\n
--            Fail2Ban"|mail -s "[Fail2Ban] <name>: banned <ip> from <fq-hostname>" <dest>
-+            Fail2Ban"|mail -E 'set escape' -s "[Fail2Ban] <name>: banned <ip> from <fq-hostname>" <dest>
- 
- # Option:  actionunban
- # Notes.:  command executed when unbanning an IP. Take care that the
diff --git a/package/fail2ban/0002-fix-gh-3098-build-fails-with-error-in-fail2ban-setup-command.patch b/package/fail2ban/0002-fix-gh-3098-build-fails-with-error-in-fail2ban-setup-command.patch
deleted file mode 100644
index 8cb097dc38..0000000000
--- a/package/fail2ban/0002-fix-gh-3098-build-fails-with-error-in-fail2ban-setup-command.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 5ac303df8a171f748330d4c645ccbf1c2c7f3497 Mon Sep 17 00:00:00 2001
-From: sebres <info@sebres.de>
-Date: Sun, 19 Sep 2021 18:49:18 +0200
-Subject: [PATCH] fix gh-3098: build fails with error in fail2ban setup
- command: use_2to3 is invalid (setuptools 58+)
-
-[Retrieved from:
-https://github.com/fail2ban/fail2ban/commit/5ac303df8a171f748330d4c645ccbf1c2c7f3497]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- setup.py | 16 +---------------
- 1 file changed, 1 insertion(+), 15 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index f4c2550f6..98413273c 100755
---- a/setup.py
-+++ b/setup.py
-@@ -48,7 +48,7 @@
- from glob import glob
- 
- from fail2ban.setup import updatePyExec
--
-+from fail2ban.version import version
- 
- source_dir = os.path.realpath(os.path.dirname(
- 	# __file__ seems to be overwritten sometimes on some python versions (e.g. bug of 2.6 by running under cProfile, etc.):
-@@ -112,22 +112,12 @@ def update_scripts(self, dry_run=False):
- # Wrapper to specify fail2ban own options:
- class install_command_f2b(install):
- 	user_options = install.user_options + [
--		('disable-2to3', None, 'Specify to deactivate 2to3, e.g. if the install runs from fail2ban test-cases.'),
- 		('without-tests', None, 'without tests files installation'),
- 	]
- 	def initialize_options(self):
--		self.disable_2to3 = None
- 		self.without_tests = not with_tests
- 		install.initialize_options(self)
- 	def finalize_options(self):
--		global _2to3
--		## in the test cases 2to3 should be already done (fail2ban-2to3):
--		if self.disable_2to3:
--			_2to3 = False
--		if _2to3:
--			cmdclass = self.distribution.cmdclass
--			cmdclass['build_py'] = build_py_2to3
--			cmdclass['build_scripts'] = build_scripts_2to3
- 		if self.without_tests:
- 			self.distribution.scripts.remove('bin/fail2ban-testcases')
- 
-@@ -178,7 +168,6 @@ def run(self):
- if setuptools:
- 	setup_extra = {
- 		'test_suite': "fail2ban.tests.utils.gatherTests",
--		'use_2to3': True,
- 	}
- else:
- 	setup_extra = {}
-@@ -202,9 +191,6 @@ def run(self):
- 		('/usr/share/doc/fail2ban', doc_files)
- 	)
- 
--# Get version number, avoiding importing fail2ban.
--# This is due to tests not functioning for python3 as 2to3 takes place later
--exec(open(join("fail2ban", "version.py")).read())
- 
- setup(
- 	name = "fail2ban",
diff --git a/package/fail2ban/fail2ban.hash b/package/fail2ban/fail2ban.hash
index 072f0ef961..4073efe4c7 100644
--- a/package/fail2ban/fail2ban.hash
+++ b/package/fail2ban/fail2ban.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  383108e5f8644cefb288537950923b7520f642e7e114efb843f6e7ea9268b1e0  fail2ban-0.11.2.tar.gz
+sha256  62b54679ebae81ac57f32c5e27aba9f2494ec5bafd45a0fd68e7a27fd448e5ac  fail2ban-1.0.1.tar.gz
 sha256  a75fec0260742fe6275d63ff6a5d97b924b28766558306b3fa4069763096929b  COPYING
diff --git a/package/fail2ban/fail2ban.mk b/package/fail2ban/fail2ban.mk
index 4a08981a97..288266c2c7 100644
--- a/package/fail2ban/fail2ban.mk
+++ b/package/fail2ban/fail2ban.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FAIL2BAN_VERSION = 0.11.2
+FAIL2BAN_VERSION = 1.0.1
 FAIL2BAN_SITE = $(call github,fail2ban,fail2ban,$(FAIL2BAN_VERSION))
 FAIL2BAN_LICENSE = GPL-2.0+
 FAIL2BAN_LICENSE_FILES = COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
