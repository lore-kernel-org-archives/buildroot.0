Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 848A6C4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 12:56:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F0E760F94
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 12:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2F0E760F94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE00C838C0;
	Fri, 30 Jul 2021 12:56:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Na8R18XCVnnu; Fri, 30 Jul 2021 12:56:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5A6783981;
	Fri, 30 Jul 2021 12:56:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 94B6E1BF3F9
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 12:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 841F740640
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 12:56:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id itcJg5-flT8w for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 12:56:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4EFD54044F
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 12:56:22 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 l4-20020a05600c1d04b02902506f89ad2dso7696897wms.1
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 05:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CcQhWO1RG0KoE76OAwOMtPSDitA9MZou63fFOqw27wY=;
 b=uoRguNGV/GRje8rQ4GGoKXfzhEPxP75lIRDsgs6bGjnvUzQUTUXj8tFvmkLMbmqeZz
 69VCrzKkWeAQXPQsdy7Q8i1/UedotipEuNZjxVjH7htCqd/H1tPEZiu+hS+Our8n4Ied
 xcjM5IFF4O3dpnK3BW+Dj8m9ArybGr1iPovq52dEC6HM5vWBp4j85bwipaq+fHS9v93E
 1tsHJEjqYZNlWwEj69+7AGdS93BtjsaIO4AchQixARSCoTzLouvi4+9zOTNo5pGfXmcI
 Sfr5UhrfZRVKjmiBjamdaPENhvepyWhET+KBXG0MOq5Uvh+J7Qm/Mm/WNeJPPSTrpsph
 ueEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CcQhWO1RG0KoE76OAwOMtPSDitA9MZou63fFOqw27wY=;
 b=Niy1hINrd8CALqXWcmDJym/sIRkdEPH1P5ldMjIDiPcojI1tEtem5p2szxTvqavUJz
 bV2hQTRHBtxgu1VDdHAdv2Okk6E7GmRynOvV/QLYGCQGzOjKk5zyTms/X2oOkl497Oxu
 rbntNobRM1iIYC0dYb1ZjxoGC39vFsFdpMCG0BKUHUZp8IgoliGHKhDc3LZJUWYd//We
 bGAoTCOgSInGx1WJoAiAk7fdopd1uG8AJvyrIK8KDgos5VR9pwLaBjR0x9R3At7uC03c
 x2Dhkky8hJt8ENfNZj++x/qgToTZE7rTuqZcPX4qYhdL4Vnzux2wAGPX2TL2nZofoKnf
 pNoA==
X-Gm-Message-State: AOAM531/NQvKFBOUD1RWRPqllGO2hqlug/mNcexH52abT56HLBPnoo0N
 KexmtSUYnRa7Q0GPADKoNUgekhpSBP2yEA==
X-Google-Smtp-Source: ABdhPJzrFi45HaQwgJma/LqahFVeFHVUVTgacyxxwAow4D1LFnmYjB9oo31pMxeSw31duXBCndmS2Q==
X-Received: by 2002:a05:600c:4ecc:: with SMTP id
 g12mr2921727wmq.118.1627649780008; 
 Fri, 30 Jul 2021 05:56:20 -0700 (PDT)
Received: from kali.home (pop.92-184-116-192.mobile.abo.orange.fr.
 [92.184.116.192])
 by smtp.gmail.com with ESMTPSA id l15sm1720962wrv.87.2021.07.30.05.56.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 05:56:19 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 30 Jul 2021 14:56:11 +0200
Message-Id: <20210730125611.4052704-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/fail2ban: fix CVE-2021-32749
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

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
---
 ...-vulnerability-unset-escape-variable.patch | 158 ++++++++++++++++++
 package/fail2ban/fail2ban.mk                  |   3 +
 2 files changed, 161 insertions(+)
 create mode 100644 package/fail2ban/0001-fixed-possible-RCE-vulnerability-unset-escape-variable.patch

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
index 6b92a9f642..9202dc1ddd 100644
--- a/package/fail2ban/fail2ban.mk
+++ b/package/fail2ban/fail2ban.mk
@@ -12,6 +12,9 @@ FAIL2BAN_CPE_ID_VENDOR = fail2ban
 FAIL2BAN_SELINUX_MODULES = fail2ban
 FAIL2BAN_SETUP_TYPE = distutils
 
+# 0001-fixed-possible-RCE-vulnerability-unset-escape-variable.patch
+FAIL2BAN_IGNORE_CVES += CVE-2021-32749
+
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 define FAIL2BAN_PYTHON_2TO3
 	$(HOST_DIR)/bin/2to3 --write --nobackups --no-diffs $(@D)/bin/* $(@D)/fail2ban
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
