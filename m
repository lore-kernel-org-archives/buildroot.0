Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F8BC4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 21:07:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20A6A60243
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 21:07:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 20A6A60243
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6B7B83B47;
	Fri,  6 Aug 2021 21:07:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nFn-tBnCLBmZ; Fri,  6 Aug 2021 21:07:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2EB183B79;
	Fri,  6 Aug 2021 21:07:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1710C1BF3AF
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 21:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BBCB40544
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 21:03:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BtIlBMdZG19y for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 21:03:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9080C40551
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 21:03:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DE0CC88212; Fri,  6 Aug 2021 21:02:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Aug 2021 22:41:33 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 9c286c9a8fe62af7efb3474604e5ace70b7622ac
X-Git-Newrev: d5959eb8e5148c0645cbb74e330578f22961270c
X-Patchwork-Hint: ignore
Message-Id: <20210806210256.DE0CC88212@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/fail2ban: fix
 CVE-2021-32749
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=d5959eb8e5148c0645cbb74e330578f22961270c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

fail2ban is a daemon to ban hosts that cause multiple authentication
errors. In versions 0.9.7 and prior, 0.10.0 through 0.10.6, and 0.11.0
through 0.11.2, there is a vulnerability that leads to possible remote
code execution in the mailing action mail-whois. Command `mail` from
mailutils package used in mail actions like `mail-whois` can execute
command if unescaped sequences (`\n~`) are available in "foreign" input
(for instance in whois output). To exploit the vulnerability, an
attacker would need to insert malicious characters into the response
sent by the whois server, either via a MITM attack or by taking over a
whois server. The issue is patched in versions 0.10.7 and 0.11.3. As a
workaround, one may avoid the usage of action `mail-whois` or patch the
vulnerability manually.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6a7decee50fb402a28aa2e95e63a74cbcf3d6b26)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...e-RCE-vulnerability-unset-escape-variable.patch | 158 +++++++++++++++++++++
 package/fail2ban/fail2ban.mk                       |   3 +
 2 files changed, 161 insertions(+)

diff --git a/package/fail2ban/0001-fixed-possible-RCE-vulnerability-unset-escape-variable.patch b/package/fail2ban/0001-fixed-possible-RCE-vulnerability-unset-escape-variable.patch
new file mode 100644
index 0000000000..6d44f41d85
--- /dev/null
+++ b/package/fail2ban/0001-fixed-possible-RCE-vulnerability-unset-escape-variable.patch
@@ -0,0 +1,158 @@
+From 410a6ce5c80dd981c22752da034f2529b5eee844 Mon Sep 17 00:00:00 2001
+From: sebres <serg.brester@sebres.de>
+Date: Mon, 21 Jun 2021 17:12:53 +0200
+Subject: [PATCH] fixed possible RCE vulnerability, unset escape variable
+ (default tilde) stops consider "~" char after new-line as composing escape
+ sequence
+
+[Retrieved from:
+https://github.com/fail2ban/fail2ban/commit/410a6ce5c80dd981c22752da034f2529b5eee844]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ config/action.d/complain.conf         | 2 +-
+ config/action.d/dshield.conf          | 2 +-
+ config/action.d/mail-buffered.conf    | 8 ++++----
+ config/action.d/mail-whois-lines.conf | 2 +-
+ config/action.d/mail-whois.conf       | 6 +++---
+ config/action.d/mail.conf             | 6 +++---
+ 6 files changed, 13 insertions(+), 13 deletions(-)
+
+diff --git a/config/action.d/complain.conf b/config/action.d/complain.conf
+index 3a5f882c9f..4d73b05859 100644
+--- a/config/action.d/complain.conf
++++ b/config/action.d/complain.conf
+@@ -102,7 +102,7 @@ logpath = /dev/null
+ # Notes.:  Your system mail command. Is passed 2 args: subject and recipient
+ # Values:  CMD
+ #
+-mailcmd = mail -s
++mailcmd = mail -E 'set escape' -s
+ 
+ # Option:  mailargs
+ # Notes.:  Additional arguments to mail command. e.g. for standard Unix mail:
+diff --git a/config/action.d/dshield.conf b/config/action.d/dshield.conf
+index c128bef348..3d5a7a53a9 100644
+--- a/config/action.d/dshield.conf
++++ b/config/action.d/dshield.conf
+@@ -179,7 +179,7 @@ tcpflags =
+ # Notes.:  Your system mail command. Is passed 2 args: subject and recipient
+ # Values:  CMD
+ #
+-mailcmd = mail -s
++mailcmd = mail -E 'set escape' -s
+ 
+ # Option:  mailargs
+ # Notes.:  Additional arguments to mail command. e.g. for standard Unix mail:
+diff --git a/config/action.d/mail-buffered.conf b/config/action.d/mail-buffered.conf
+index 325f185b2f..79b841049c 100644
+--- a/config/action.d/mail-buffered.conf
++++ b/config/action.d/mail-buffered.conf
+@@ -17,7 +17,7 @@ actionstart = printf %%b "Hi,\n
+               The jail <name> has been started successfully.\n
+               Output will be buffered until <lines> lines are available.\n
+               Regards,\n
+-              Fail2Ban"|mail -s "[Fail2Ban] <name>: started on <fq-hostname>" <dest>
++              Fail2Ban"|mail -E 'set escape' -s "[Fail2Ban] <name>: started on <fq-hostname>" <dest>
+ 
+ # Option:  actionstop
+ # Notes.:  command executed at the stop of jail (or at the end of Fail2Ban)
+@@ -28,13 +28,13 @@ actionstop = if [ -f <tmpfile> ]; then
+                  These hosts have been banned by Fail2Ban.\n
+                  `cat <tmpfile>`
+                  Regards,\n
+-                 Fail2Ban"|mail -s "[Fail2Ban] <name>: Summary from <fq-hostname>" <dest>
++                 Fail2Ban"|mail -E 'set escape' -s "[Fail2Ban] <name>: Summary from <fq-hostname>" <dest>
+                  rm <tmpfile>
+              fi
+              printf %%b "Hi,\n
+              The jail <name> has been stopped.\n
+              Regards,\n
+-             Fail2Ban"|mail -s "[Fail2Ban] <name>: stopped on <fq-hostname>" <dest>
++             Fail2Ban"|mail -E 'set escape' -s "[Fail2Ban] <name>: stopped on <fq-hostname>" <dest>
+ 
+ # Option:  actioncheck
+ # Notes.:  command executed once before each actionban command
+@@ -55,7 +55,7 @@ actionban = printf %%b "`date`: <ip> (<failures> failures)\n" >> <tmpfile>
+                 These hosts have been banned by Fail2Ban.\n
+                 `cat <tmpfile>`
+                 \nRegards,\n
+-                Fail2Ban"|mail -s "[Fail2Ban] <name>: Summary" <dest>
++                Fail2Ban"|mail -E 'set escape' -s "[Fail2Ban] <name>: Summary" <dest>
+                 rm <tmpfile>
+             fi
+ 
+diff --git a/config/action.d/mail-whois-lines.conf b/config/action.d/mail-whois-lines.conf
+index 3a3e56b2c7..d2818cb9b9 100644
+--- a/config/action.d/mail-whois-lines.conf
++++ b/config/action.d/mail-whois-lines.conf
+@@ -72,7 +72,7 @@ actionunban =
+ # Notes.:  Your system mail command. Is passed 2 args: subject and recipient
+ # Values:  CMD
+ #
+-mailcmd = mail -s
++mailcmd = mail -E 'set escape' -s
+ 
+ # Default name of the chain
+ #
+diff --git a/config/action.d/mail-whois.conf b/config/action.d/mail-whois.conf
+index 7fea34c40d..ab33b616dc 100644
+--- a/config/action.d/mail-whois.conf
++++ b/config/action.d/mail-whois.conf
+@@ -20,7 +20,7 @@ norestored = 1
+ actionstart = printf %%b "Hi,\n
+               The jail <name> has been started successfully.\n
+               Regards,\n
+-              Fail2Ban"|mail -s "[Fail2Ban] <name>: started on <fq-hostname>" <dest>
++              Fail2Ban"|mail -E 'set escape' -s "[Fail2Ban] <name>: started on <fq-hostname>" <dest>
+ 
+ # Option:  actionstop
+ # Notes.:  command executed at the stop of jail (or at the end of Fail2Ban)
+@@ -29,7 +29,7 @@ actionstart = printf %%b "Hi,\n
+ actionstop = printf %%b "Hi,\n
+              The jail <name> has been stopped.\n
+              Regards,\n
+-             Fail2Ban"|mail -s "[Fail2Ban] <name>: stopped on <fq-hostname>" <dest>
++             Fail2Ban"|mail -E 'set escape' -s "[Fail2Ban] <name>: stopped on <fq-hostname>" <dest>
+ 
+ # Option:  actioncheck
+ # Notes.:  command executed once before each actionban command
+@@ -49,7 +49,7 @@ actionban = printf %%b "Hi,\n
+             Here is more information about <ip> :\n
+             `%(_whois_command)s`\n
+             Regards,\n
+-            Fail2Ban"|mail -s "[Fail2Ban] <name>: banned <ip> from <fq-hostname>" <dest>
++            Fail2Ban"|mail -E 'set escape' -s "[Fail2Ban] <name>: banned <ip> from <fq-hostname>" <dest>
+ 
+ # Option:  actionunban
+ # Notes.:  command executed when unbanning an IP. Take care that the
+diff --git a/config/action.d/mail.conf b/config/action.d/mail.conf
+index 5d8c0e154c..f4838ddcb6 100644
+--- a/config/action.d/mail.conf
++++ b/config/action.d/mail.conf
+@@ -16,7 +16,7 @@ norestored = 1
+ actionstart = printf %%b "Hi,\n
+               The jail <name> has been started successfully.\n
+               Regards,\n
+-              Fail2Ban"|mail -s "[Fail2Ban] <name>: started  on <fq-hostname>" <dest>
++              Fail2Ban"|mail -E 'set escape' -s "[Fail2Ban] <name>: started  on <fq-hostname>" <dest>
+ 
+ # Option:  actionstop
+ # Notes.:  command executed at the stop of jail (or at the end of Fail2Ban)
+@@ -25,7 +25,7 @@ actionstart = printf %%b "Hi,\n
+ actionstop = printf %%b "Hi,\n
+              The jail <name> has been stopped.\n
+              Regards,\n
+-             Fail2Ban"|mail -s "[Fail2Ban] <name>: stopped on <fq-hostname>" <dest>
++             Fail2Ban"|mail -E 'set escape' -s "[Fail2Ban] <name>: stopped on <fq-hostname>" <dest>
+ 
+ # Option:  actioncheck
+ # Notes.:  command executed once before each actionban command
+@@ -43,7 +43,7 @@ actionban = printf %%b "Hi,\n
+             The IP <ip> has just been banned by Fail2Ban after
+             <failures> attempts against <name>.\n
+             Regards,\n
+-            Fail2Ban"|mail -s "[Fail2Ban] <name>: banned <ip> from <fq-hostname>" <dest>
++            Fail2Ban"|mail -E 'set escape' -s "[Fail2Ban] <name>: banned <ip> from <fq-hostname>" <dest>
+ 
+ # Option:  actionunban
+ # Notes.:  command executed when unbanning an IP. Take care that the
diff --git a/package/fail2ban/fail2ban.mk b/package/fail2ban/fail2ban.mk
index 0e465e9c0b..a856d220e4 100644
--- a/package/fail2ban/fail2ban.mk
+++ b/package/fail2ban/fail2ban.mk
@@ -11,6 +11,9 @@ FAIL2BAN_LICENSE_FILES = COPYING
 FAIL2BAN_CPE_ID_VENDOR = fail2ban
 FAIL2BAN_SETUP_TYPE = distutils
 
+# 0001-fixed-possible-RCE-vulnerability-unset-escape-variable.patch
+FAIL2BAN_IGNORE_CVES += CVE-2021-32749
+
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 define FAIL2BAN_PYTHON_2TO3
 	$(HOST_DIR)/bin/2to3 --write --nobackups --no-diffs $(@D)/bin/* $(@D)/fail2ban
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
