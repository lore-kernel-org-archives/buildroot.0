Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2FFE9A053
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3CA161096;
	Thu, 19 Feb 2026 17:24:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ICQuiYCGNQIV; Thu, 19 Feb 2026 17:24:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE54C6109E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771521876;
	bh=j2mRZozSFVMF8oZMa1HcMLFLbCJQQb/fpdjQOlyB07M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rrXonzC+wjEJxxZsTJTEpSGIdThVP4ESsPlDNjLNG0lx2huigIXXNmWy6UOHstUis
	 qEjRSW7v8IFzJw7+q++DgVQL/45Q3cjU4U7EO7pampXs9ilUoBfuQntWjyTRV+afSP
	 JpVh8CvZr4JduXQQIrZOKtfChEZ4w0/a6zeqkkulRqo5hahfMLWd1ZgD8Z6D3Kl2AU
	 xP0DcPE8q6HrG8Nkrqix+IDEisq7D1+0HvoT8wZAAm7I/0IvB9n4uWnbMFaJXkWfrI
	 Fk0mupYc6/iruareStmClXnmhl5pSOiDsR4mGYt47oI2X1sCHWPBDjyhHzBmwnT8H5
	 ppgaTgO/iBbCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE54C6109E;
	Thu, 19 Feb 2026 17:24:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 13F2C206
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED61A40CF7
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lcrlPFepdhh4 for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:24:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07CC340CF4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07CC340CF4
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0514F86FA5; Thu, 19 Feb 2026 17:24:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Feb 2026 19:24:38 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: b7aa218d7692947283bcf8c644b264b474486ce3
X-Git-Newrev: e853c54a9bc1127d83ecc430469dd96388ee43b0
X-Patchwork-Hint: ignore
Message-Id: <20260219172414.0514F86FA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/linux-pam: add
 security patch for CVE-2024-10963
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e853c54a9bc1127d83ecc430469dd96388ee43b0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

This commit backports an upstream patch fixing CVE-2024-10963. See:
https://github.com/linux-pam/linux-pam/issues/834
https://github.com/linux-pam/linux-pam/pull/854

Fixes:

- CVE-2024-10963:

Pam: improper hostname interpretation in pam_access leads to access
control bypass

A flaw was found in pam_access, where certain rules in its
configuration file are mistakenly treated as hostnames. This
vulnerability allows attackers to trick the system by pretending
to be a trusted hostname, gaining unauthorized access. This issue
poses a risk for systems that rely on this feature to control who
can access certain services or terminals.

https://www.cve.org/CVERecord?id=CVE-2024-10963

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
[Julien:
 - fix check-package errors
 - add info in commit log
 - rebase patch on v1.6.1 to avoid patch offsets
 - add "CVE:" tag in patch
 - add comment with patch name near _IGNORE_CVES in .mk
]
Signed-off-by: Julien Olivain <ju.o@free.fr>

(cherry picked from commit b95ffe208b087699d923f048ae8e29bffb587b1f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...ss-rework-resolving-of-tokens-as-hostname.patch | 229 +++++++++++++++++++++
 package/linux-pam/linux-pam.mk                     |   3 +
 2 files changed, 232 insertions(+)

diff --git a/package/linux-pam/0002-pam_access-rework-resolving-of-tokens-as-hostname.patch b/package/linux-pam/0002-pam_access-rework-resolving-of-tokens-as-hostname.patch
new file mode 100644
index 0000000000..367cdf6202
--- /dev/null
+++ b/package/linux-pam/0002-pam_access-rework-resolving-of-tokens-as-hostname.patch
@@ -0,0 +1,229 @@
+From d82b7ef5fc8afd7841735a4d0fcef6237193e183 Mon Sep 17 00:00:00 2001
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
+
+CVE: CVE-2024-10963
+Upstream: https://github.com/linux-pam/linux-pam/commit/940747f88c16e029b69a74e80a2e94f65cb3e628
+Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
+---
+ modules/pam_access/access.conf.5.xml |  4 ++
+ modules/pam_access/pam_access.8.xml  | 46 ++++++++++++------
+ modules/pam_access/pam_access.c      | 72 +++++++++++++++++++++++++++-
+ 3 files changed, 105 insertions(+), 17 deletions(-)
+
+diff --git a/modules/pam_access/access.conf.5.xml b/modules/pam_access/access.conf.5.xml
+index 2dc5d477..b2997e10 100644
+--- a/modules/pam_access/access.conf.5.xml
++++ b/modules/pam_access/access.conf.5.xml
+@@ -232,6 +232,10 @@
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
+index c991d7a0..71a4f7ee 100644
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
+index 2ab1ca94..fdb5dd86 100644
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
+@@ -741,7 +744,7 @@ remote_match (pam_handle_t *pamh, char *tok, struct login_info *item)
+       if ((str_len = strlen(string)) > tok_len
+ 	  && strcasecmp(tok, string + str_len - tok_len) == 0)
+ 	return YES;
+-    } else if (tok[tok_len - 1] == '.') {       /* internet network numbers (end with ".") */
++    } else if (tok[tok_len - 1] == '.') {       /* internet network numbers/subnet (end with ".") */
+       struct addrinfo hint;
+ 
+       memset (&hint, '\0', sizeof (hint));
+@@ -816,6 +819,39 @@ string_match (pam_handle_t *pamh, const char *tok, const char *string,
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
+@@ -877,10 +913,42 @@ network_netmask_match (pam_handle_t *pamh,
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
+-- 
+2.53.0
+
diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 23b09efbae..f4e488428d 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -25,6 +25,9 @@ LINUX_PAM_LIBS = $(TARGET_NLS_LIBS)
 LINUX_PAM_MAKE_OPTS += LIBS="$(LINUX_PAM_LIBS)"
 LINUX_PAM_CPE_ID_VENDOR = linux-pam
 
+# 0002-pam_access-rework-resolving-of-tokens-as-hostname.patch
+LINUX_PAM_IGNORE_CVES += CVE-2024-10963
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 LINUX_PAM_LIBS += -latomic
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
