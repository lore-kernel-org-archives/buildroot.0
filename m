Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF02D6B087
	for <buildroot@archiver.kernel.org>; Thu, 29 Jan 2026 16:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30060831C1;
	Thu, 29 Jan 2026 16:10:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PNfWXRLbQBxM; Thu, 29 Jan 2026 16:10:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 226F2832FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769703035;
	bh=mf74pztp+YZ2UjiX4rE7Ef/+8dIylqBojpLssHS53rw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=anBb8K1T0Rjc1CZratN0to0rOQsv8cpok/QiDzj7Ses3XbYMdYc9p9N0qInno6JK0
	 u1to55sgfptuyG7i9Ac7KUJjqubjaEI2WtXqB2Jh1bTg9K9PE/wSrOKR173hXpUUtE
	 uu5RLineXe7S5k0WCc28dPaiTGn9HI4q3pwOmDCsY0DrbysDG+O1se4/EDQ1bbrVXo
	 zmzPV+E4Qs0OiYimzGcyhf4+qqm+doK/nMy4MAHhVhmpE4D3KtHH/ToBXEOgD0cp+9
	 kqF4BcMOHfcJEANtgOoNIDDKHt5WOc5OKNwiZYM9LQxW1Q05yk9PBHEVp1ZOQGZ4ea
	 4wmSx6jwKVAPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 226F2832FF;
	Thu, 29 Jan 2026 16:10:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BD591BD
 for <buildroot@buildroot.org>; Thu, 29 Jan 2026 16:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A6DB83183
 for <buildroot@buildroot.org>; Thu, 29 Jan 2026 16:10:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4WjDhPEWNfDC for <buildroot@buildroot.org>;
 Thu, 29 Jan 2026 16:10:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F34E3830AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F34E3830AB
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F34E3830AB
 for <buildroot@buildroot.org>; Thu, 29 Jan 2026 16:10:31 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-42fb5810d39so843722f8f.2
 for <buildroot@buildroot.org>; Thu, 29 Jan 2026 08:10:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769703030; x=1770307830;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9h/V1znz7Gm7gntnT1oogsfOzgVgk3nf+/6CZLhV/vI=;
 b=NgANW1hi2lG8QK1DFLsYqQN4fYpC6Jlj7hiD9URp7EpwYY08wTzegs7gOQjAieD77T
 S5h6I5mpEQ+wX5eRnuDJyMgF4DfAsiQ4dqotlYGBAHjfbZRbPCb753qmRkkIGrflEFnZ
 TKPTkIjSuwJ0h1IGsD6wafDFs0nzO19c36P+FWBedJekz/S5BHdnoPWmrRgCAXjVdWok
 d4XMD98mw8dxwhQtUUwekik184qN7PdGdzemBWg6/md5/fKOPKI+dxhWVpmeQSFGzAtq
 xpjrPsT4ykPGHPkmYZUk/FOZPwVGh9L/Nxead+9Voqm0sI6o5ow8LACt1DMqKzYPzjGq
 OnKg==
X-Gm-Message-State: AOJu0Yz9CUug3Rgdpqo7DfRoRyb0A0H/kYK5wxGWBLkEl5gDPZwDuPHn
 tyubFU9q2YR+Kqw0BQfrJwtlQbj75468afEbepVTZckqZB0CKIcGg33bIzO1/A==
X-Gm-Gg: AZuq6aLKlB8k6Rl/qY/zccsrOMLbsMhuXiXOFqlVM7OpFknybaunWJEPkjJdN7+co6C
 hfAbiXb8KH94ICCYoxrT/0Sr2M9Mfq5FgbOb828CQ18dff3BAxRSk5zoWcm3vqHx0AMlZMO468a
 L6ZCwzQh0B43UK975fZRZrpB4WdLsUxhEqGeqgmepuztDfYwrkeU/l+pntpfhnnk0pKOxJF+xK0
 yOXq7FDOZrxN2z2ZLyNJny5k+ACcSLAYLVkjYeIzXRxHmFzXPv0Cdihvhb8gcMIzmwB6Ul0M65m
 57fd5suXrEoJAvqQkjLZabOcelyG3+U9sWDnAj8sPMa7h7TqLdYYaVZ+AwAeSYQM9EbxAUU0ClU
 jZ4f/kEaFU2iWdnb89K3BY/rlOpvhpPXtNSbGSoN2xPQjZPbsEMNKoNL84AzvtFYzfuiYlxtSvz
 Ur
X-Received: by 2002:a05:6000:40cd:b0:435:92d3:d9b4 with SMTP id
 ffacd0b85a97d-435f3a76758mr193429f8f.26.1769703029569; 
 Thu, 29 Jan 2026 08:10:29 -0800 (PST)
Received: from LinkMed ([2a02:8070:2483:7e00::b4ea])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e1354d43sm16512581f8f.43.2026.01.29.08.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 08:10:29 -0800 (PST)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Thu, 29 Jan 2026 17:10:03 +0100
Message-ID: <20260129161012.1610562-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769703030; x=1770307830; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9h/V1znz7Gm7gntnT1oogsfOzgVgk3nf+/6CZLhV/vI=;
 b=bp+dFOGmqDNW7aztvMaWdMBiOlyYA88AYorDpYjQnfDrThlvVj4bd05XnkEDwXdVio
 VsC7nhWL4qceVeYakBy6nu9+Ylg/fr2gHQ1iVUtG9VfLQZ80iL2Cm0Yrs/ncMLFZ7fMx
 cnV7yBcjdb8jv9cjtE2CI1XcNHw+AfBe+rOLojHttP9cLcFH0Z1NkoD9tgLXjvJC7Xok
 J160rgaJJkv0Hij/X2yRjTugbjBLOODrN3c8LBJuGsAwYuuosa2CVnTZrXcwImSjGcUY
 OySm7GWGrhhAlfy41zvEVObT66IPS4Gts9oWWW0ydKGy1FmvGO2e8LT6YqSsnaKyFNqd
 2Tqw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bp+dFOGm
Subject: [Buildroot] [PATCH v1 1/3] package/linux-pam: add security patch
 for CVE-2024-10963
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See:
https://github.com/linux-pam/linux-pam/issues/834
Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 ...work-resolving-of-tokens-as-hostname.patch | 222 ++++++++++++++++++
 package/linux-pam/linux-pam.mk                |   1 +
 2 files changed, 223 insertions(+)
 create mode 100644 package/linux-pam/0002-pam_access-rework-resolving-of-tokens-as-hostname.patch

diff --git a/package/linux-pam/0002-pam_access-rework-resolving-of-tokens-as-hostname.patch b/package/linux-pam/0002-pam_access-rework-resolving-of-tokens-as-hostname.patch
new file mode 100644
index 0000000000..d86e77a3e7
--- /dev/null
+++ b/package/linux-pam/0002-pam_access-rework-resolving-of-tokens-as-hostname.patch
@@ -0,0 +1,222 @@
+From 940747f88c16e029b69a74e80a2e94f65cb3e628 Mon Sep 17 00:00:00 2001
+From: Thorsten Kukuk <kukuk@suse.com>
+Date: Thu, 14 Nov 2024 10:27:28 +0100
+Subject: [PATCH] pam_access: rework resolving of tokens as hostname
+
+* modules/pam_access/pam_access.c: separate resolving of IP addresses
+  from hostnames. Don't resolve TTYs or display variables as hostname
+  (#834).
+  Add "nodns" option to disallow resolving of tokens as hostname.
+* modules/pam_access/pam_access.8.xml: document nodns option
+* modules/pam_access/access.conf.5.xml: document that hostnames should
+  be written as FQHN.
+---
+ modules/pam_access/access.conf.5.xml |  4 ++
+ modules/pam_access/pam_access.8.xml  | 46 ++++++++++++------
+ modules/pam_access/pam_access.c      | 72 +++++++++++++++++++++++++++-
+ 3 files changed, 105 insertions(+), 17 deletions(-)
+
+diff --git a/modules/pam_access/access.conf.5.xml b/modules/pam_access/access.conf.5.xml
+index 0b93db00e..10b8ba925 100644
+--- a/modules/pam_access/access.conf.5.xml
++++ b/modules/pam_access/access.conf.5.xml
+@@ -233,6 +233,10 @@
+       An IPv6 link local host address must contain the interface
+       identifier. IPv6 link local network/netmask is not supported.
+     </para>
++    <para>
++      Hostnames should be written as Fully-Qualified Host Name (FQHN) to avoid
++      confusion with device names or PAM service names.
++    </para>
+   </refsect1>
+ 
+   <refsect1 xml:id="access.conf-see_also">
+diff --git a/modules/pam_access/pam_access.8.xml b/modules/pam_access/pam_access.8.xml
+index c991d7a09..71a4f7ee9 100644
+--- a/modules/pam_access/pam_access.8.xml
++++ b/modules/pam_access/pam_access.8.xml
+@@ -22,11 +22,14 @@
+       <arg choice="opt" rep="norepeat">
+         debug
+       </arg>
++      <arg choice="opt" rep="norepeat">
++        noaudit
++      </arg>
+       <arg choice="opt" rep="norepeat">
+         nodefgroup
+       </arg>
+       <arg choice="opt" rep="norepeat">
+-        noaudit
++        nodns
+       </arg>
+       <arg choice="opt" rep="norepeat">
+         quiet_log
+@@ -132,6 +135,33 @@
+         </listitem>
+       </varlistentry>
+ 
++      <varlistentry>
++        <term>
++          nodefgroup
++        </term>
++        <listitem>
++          <para>
++            User tokens which are not enclosed in parentheses will not be
++	    matched against the group database. The backwards compatible default is
++            to try the group database match even for tokens not enclosed
++            in parentheses.
++          </para>
++        </listitem>
++      </varlistentry>
++
++      <varlistentry>
++        <term>
++          nodns
++        </term>
++        <listitem>
++          <para>
++	    Do not try to resolve tokens as hostnames, only IPv4 and IPv6
++	    addresses will be resolved. Which means to allow login from a
++	    remote host, the IP addresses need to be specified in <filename>access.conf</filename>.
++          </para>
++        </listitem>
++      </varlistentry>
++
+       <varlistentry>
+         <term>
+           quiet_log
+@@ -185,20 +215,6 @@
+         </listitem>
+       </varlistentry>
+ 
+-      <varlistentry>
+-        <term>
+-          nodefgroup
+-        </term>
+-        <listitem>
+-          <para>
+-            User tokens which are not enclosed in parentheses will not be
+-	    matched against the group database. The backwards compatible default is
+-            to try the group database match even for tokens not enclosed
+-            in parentheses.
+-          </para>
+-        </listitem>
+-      </varlistentry>
+-
+     </variablelist>
+   </refsect1>
+ 
+diff --git a/modules/pam_access/pam_access.c b/modules/pam_access/pam_access.c
+index 48e7c7e97..109115e9c 100644
+--- a/modules/pam_access/pam_access.c
++++ b/modules/pam_access/pam_access.c
+@@ -100,6 +100,7 @@ struct login_info {
+     int only_new_group_syntax;		/* Only allow group entries of the form "(xyz)" */
+     int noaudit;			/* Do not audit denials */
+     int quiet_log;			/* Do not log denials */
++    int nodns;                          /* Do not try to resolve tokens as hostnames */
+     const char *fs;			/* field separator */
+     const char *sep;			/* list-element separator */
+     int from_remote_host;               /* If PAM_RHOST was used for from */
+@@ -154,6 +155,8 @@ parse_args(pam_handle_t *pamh, struct login_info *loginfo,
+ 	    loginfo->noaudit = YES;
+ 	} else if (strcmp (argv[i], "quiet_log") == 0) {
+ 	    loginfo->quiet_log = YES;
++	} else if (strcmp (argv[i], "nodns") == 0) {
++	    loginfo->nodns = YES;
+ 	} else {
+ 	    pam_syslog(pamh, LOG_ERR, "unrecognized option [%s]", argv[i]);
+ 	}
+@@ -820,7 +823,7 @@ remote_match (pam_handle_t *pamh, char *tok, struct login_info *item)
+       if ((str_len = strlen(string)) > tok_len
+ 	  && strcasecmp(tok, string + str_len - tok_len) == 0)
+ 	return YES;
+-    } else if (tok[tok_len - 1] == '.') {       /* internet network numbers (end with ".") */
++    } else if (tok[tok_len - 1] == '.') {       /* internet network numbers/subnet (end with ".") */
+       struct addrinfo hint;
+ 
+       memset (&hint, '\0', sizeof (hint));
+@@ -895,6 +898,39 @@ string_match (pam_handle_t *pamh, const char *tok, const char *string,
+ }
+ 
+ 
++static int
++is_device (pam_handle_t *pamh, const char *tok)
++{
++  struct stat st;
++  const char *dev = "/dev/";
++  char *devname;
++
++  devname = malloc (strlen(dev) + strlen (tok) + 1);
++  if (devname == NULL) {
++      pam_syslog(pamh, LOG_ERR, "Cannot allocate memory for device name: %m");
++      /*
++       * We should return an error and abort, but pam_access has no good
++       * error handling.
++       */
++      return NO;
++  }
++
++  char *cp = stpcpy (devname, dev);
++  strcpy (cp, tok);
++
++  if (lstat(devname, &st) != 0)
++    {
++      free (devname);
++      return NO;
++    }
++  free (devname);
++
++  if (S_ISCHR(st.st_mode))
++    return YES;
++
++  return NO;
++}
++
+ /* network_netmask_match - match a string against one token
+  * where string is a hostname or ip (v4,v6) address and tok
+  * represents either a hostname, a single ip (v4,v6) address
+@@ -956,10 +992,42 @@ network_netmask_match (pam_handle_t *pamh,
+ 	    return NO;
+ 	  }
+       }
++    else if (isipaddr(tok, NULL, NULL) == YES)
++      {
++	if (getaddrinfo (tok, NULL, NULL, &ai) != 0)
++	  {
++	    if (item->debug)
++	      pam_syslog(pamh, LOG_DEBUG, "cannot resolve IP address \"%s\"", tok);
++
++	    return NO;
++	  }
++	netmask_ptr = NULL;
++      }
++    else if (item->nodns)
++      {
++	/* Only hostnames are left, which we would need to resolve via DNS */
++	return NO;
++      }
+     else
+       {
++	/* Bail out on X11 Display entries and ttys. */
++	if (tok[0] == ':')
++	  {
++	    if (item->debug)
++	      pam_syslog (pamh, LOG_DEBUG,
++			  "network_netmask_match: tok=%s is X11 display", tok);
++	    return NO;
++	  }
++	if (is_device (pamh, tok))
++	  {
++	    if (item->debug)
++	      pam_syslog (pamh, LOG_DEBUG,
++			  "network_netmask_match: tok=%s is a TTY", tok);
++	    return NO;
++	  }
++
+         /*
+-	 * It is either an IP address or a hostname.
++	 * It is most likely a hostname.
+ 	 * Let getaddrinfo sort everything out
+ 	 */
+ 	if (getaddrinfo (tok, NULL, NULL, &ai) != 0)
diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 23b09efbae..606bcc6d6b 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -24,6 +24,7 @@ LINUX_PAM_LICENSE_FILES = Copyright
 LINUX_PAM_LIBS = $(TARGET_NLS_LIBS)
 LINUX_PAM_MAKE_OPTS += LIBS="$(LINUX_PAM_LIBS)"
 LINUX_PAM_CPE_ID_VENDOR = linux-pam
+LINUX_PAM_IGNORE_CVES += CVE-2024-10963
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 LINUX_PAM_LIBS += -latomic
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
