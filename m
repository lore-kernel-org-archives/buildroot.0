Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC79E9A055
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D5FE83ACD;
	Thu, 19 Feb 2026 17:26:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M_lVJEti5y_X; Thu, 19 Feb 2026 17:26:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AE9F83B59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771521974;
	bh=AR3+RQotD2CQeCJYfgJkuffIPpaJZIZm10uUi+HErqE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lNH0O5GMxmXamB2A29g6O+apgGWh72vZsGD/fL0Ho/eqai5dX4kMxeDgUdskFMxTy
	 IPFncLnPt1yceaKcgaTINTCZqJMp2B8AS/C8UMDMrq3RQLmLb+tyE1AeW/CjC6HQ3S
	 gx5osEkgCCXlBSZQIhKyMhUGho/QejnR48geWk68g972iQWnDF6MlIsXxiH/KFzwYA
	 6R58q6mebOkYhR/ZdJyiz3tU2YNIrUp89SiD79Oy6018Cr21N6GGwVc/tWXsKVO+0C
	 wH3Gu2OLc+tGT5ZiaHDXhia7WuBaoiq1ocb+TIM7svmm+wuuxSWGsHrlhtcjgGH+/9
	 suqGX/HoJuMcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AE9F83B59;
	Thu, 19 Feb 2026 17:26:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BAB9F206
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 445C140CC5
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XtyfXwQp3TQv for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:25:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2761D40CF4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2761D40CF4
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2761D40CF4
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:39 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4806bf39419so16589265e9.1
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 09:25:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771521937; x=1772126737;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FqBem43V1WuxWneNKrb2lZdzJnEl3aK+SrsXD3aCPkY=;
 b=t/8zkLjOO4ObHyZYyOxt3iVtQ/mmkiABTUDcWK8T9oPvYnOHPx9Qyq6ax2KNt9PedB
 dGSMyA4wAWqJpHQWW8LXDoW/Zhkg5anpcdeoyqGlmo4qgqJMatcOE4RPmYrTEfymzY7h
 rLumVZqQQEyCe2amZU4f70ClWXN7OO5nsPpVTOUTf5Ou5k55SguFliGv8V1LxT0nJLSg
 zaLgGofl0ldWr4V3JBzdT2U8NCLB5ijI2c8fmlBoGQitIOXLP/bsopeUini1O8ljDNFI
 qVFfv6mopo2cqxkjfV1UiNntgk0Bv1nBGzye/PODjFHRUPw6d+r5iDLbLydnP2oZp2RN
 jmrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4/7DiSK5jbojVEeZ8pKslCrTP7pMlpH1WZ9eEPH5oqJ4UlmsOUkKgQ3UZKbuXJ5UJDsGY1hQQ+Vk=@buildroot.org
X-Gm-Message-State: AOJu0YzG9TJRcfcZbYD0zwQHTc4nkfhf433jvMvP+7hn15gtHC18KN5/
 iDUqMpmzCcfQUtzXyqSAJZA7LDaOefgeLBPF6oNtCvMt6SVr1GG0L52sn+1TZDO1Iche0DOOebO
 lcYwn
X-Gm-Gg: AZuq6aIC2iAXsvfYXUUpilAaxyx9ZXI2dxMcmp9ohMaprwx6TRR9qFnTInEUBNPiV6Y
 Q39rX8U1iwC5SesCYxGKXylRgUuOj1wxbMTxzSITOypo54cqMxx+WuL7BGPSYev//zephVKZknR
 if+6t1xSKoV9Rp/8BNvXaUNl9vRnV/VEEGDc/OSI2fDP0F4rVlzxu4hNpWGuuqHhtrrLVscx8W9
 e2inJ9viR4dlh708vFS6N5AbEiLelWsBjjQ5ylnjV9jDlf/KA621WftJoxCLw+r7hdDvLQlDYi9
 HSjqBHAHpsFtcbISCd1v76LvXw9pq90jXh1pDLaDjBWJHvk/RbZxUR054qT9kTEFKG1DBC8Scm0
 JhujWbpLkbNSxZpwla1EGE129tSGaRdU1SzSWJSYkJ1AqKjlShdvd1jjgpuQExSMqmlXk2Lyi2r
 7h+tvlBn8JmPHOxk4=
X-Received: by 2002:a05:600c:491c:b0:483:7eeb:4558 with SMTP id
 5b1f17b1804b1-4839fe8e8cdmr26508235e9.2.1771521936960; 
 Thu, 19 Feb 2026 09:25:36 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4839f977f1asm24107435e9.17.2026.02.19.09.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 09:25:36 -0800 (PST)
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 19 Feb 2026 18:25:36 +0100
Message-ID: <20260219172536.340280-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260129161012.1610562-1-raphael.pavlidis@gmail.com>
References: <20260129161012.1610562-1-raphael.pavlidis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771521937; x=1772126737; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FqBem43V1WuxWneNKrb2lZdzJnEl3aK+SrsXD3aCPkY=;
 b=KdY3FgqImNFNA7IBZnfYpw3PwQxPLUATxJ3TlmWXiDxm1NOAPnVPcCdwM5+YkEALYX
 FJV+5GRu7azV8rLmgPbDIOyjXwkRpvT6xYCXE0R79wo8rLz1KQM54cNASrfbJmqn+gUQ
 txZkE4K4ANdWeb7RQ3A80tqt85V517TVPuGWpC1qS5ezDntbfZgE8lx6Fmz3plH0QtpD
 ectm1mZfXjPa4gk2Pfa7lrS34RGs4cjDU1WlLH/w0VG6LKh7WybnzXkGlcTj/FtZ0q8u
 gmXssmE7ubjI0mrXK5AKJJQj4hFBZu2/lrbVjbIDr7B5gEiz9L0NpunXSzatwtKv6awy
 zBdQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KdY3FgqI
Subject: Re: [Buildroot] [PATCH v1 1/3] package/linux-pam: add security
 patch for CVE-2024-10963
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
> See:
> https://github.com/linux-pam/linux-pam/issues/834
> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  ...work-resolving-of-tokens-as-hostname.patch | 222 ++++++++++++++++++
>  package/linux-pam/linux-pam.mk                |   1 +
>  2 files changed, 223 insertions(+)
>  create mode 100644 package/linux-pam/0002-pam_access-rework-resolving-of-tokens-as-hostname.patch
> 
> diff --git a/package/linux-pam/0002-pam_access-rework-resolving-of-tokens-as-hostname.patch b/package/linux-pam/0002-pam_access-rework-resolving-of-tokens-as-hostname.patch
> new file mode 100644
> index 0000000000..d86e77a3e7
> --- /dev/null
> +++ b/package/linux-pam/0002-pam_access-rework-resolving-of-tokens-as-hostname.patch
> @@ -0,0 +1,222 @@
> +From 940747f88c16e029b69a74e80a2e94f65cb3e628 Mon Sep 17 00:00:00 2001
> +From: Thorsten Kukuk <kukuk@suse.com>
> +Date: Thu, 14 Nov 2024 10:27:28 +0100
> +Subject: [PATCH] pam_access: rework resolving of tokens as hostname
> +
> +* modules/pam_access/pam_access.c: separate resolving of IP addresses
> +  from hostnames. Don't resolve TTYs or display variables as hostname
> +  (#834).
> +  Add "nodns" option to disallow resolving of tokens as hostname.
> +* modules/pam_access/pam_access.8.xml: document nodns option
> +* modules/pam_access/access.conf.5.xml: document that hostnames should
> +  be written as FQHN.
> +---
> + modules/pam_access/access.conf.5.xml |  4 ++
> + modules/pam_access/pam_access.8.xml  | 46 ++++++++++++------
> + modules/pam_access/pam_access.c      | 72 +++++++++++++++++++++++++++-
> + 3 files changed, 105 insertions(+), 17 deletions(-)
> +
> +diff --git a/modules/pam_access/access.conf.5.xml b/modules/pam_access/access.conf.5.xml
> +index 0b93db00e..10b8ba925 100644
> +--- a/modules/pam_access/access.conf.5.xml
> ++++ b/modules/pam_access/access.conf.5.xml
> +@@ -233,6 +233,10 @@
> +       An IPv6 link local host address must contain the interface
> +       identifier. IPv6 link local network/netmask is not supported.
> +     </para>
> ++    <para>
> ++      Hostnames should be written as Fully-Qualified Host Name (FQHN) to avoid
> ++      confusion with device names or PAM service names.
> ++    </para>
> +   </refsect1>
> + 
> +   <refsect1 xml:id="access.conf-see_also">
> +diff --git a/modules/pam_access/pam_access.8.xml b/modules/pam_access/pam_access.8.xml
> +index c991d7a09..71a4f7ee9 100644
> +--- a/modules/pam_access/pam_access.8.xml
> ++++ b/modules/pam_access/pam_access.8.xml
> +@@ -22,11 +22,14 @@
> +       <arg choice="opt" rep="norepeat">
> +         debug
> +       </arg>
> ++      <arg choice="opt" rep="norepeat">
> ++        noaudit
> ++      </arg>
> +       <arg choice="opt" rep="norepeat">
> +         nodefgroup
> +       </arg>
> +       <arg choice="opt" rep="norepeat">
> +-        noaudit
> ++        nodns
> +       </arg>
> +       <arg choice="opt" rep="norepeat">
> +         quiet_log
> +@@ -132,6 +135,33 @@
> +         </listitem>
> +       </varlistentry>
> + 
> ++      <varlistentry>
> ++        <term>
> ++          nodefgroup
> ++        </term>
> ++        <listitem>
> ++          <para>
> ++            User tokens which are not enclosed in parentheses will not be
> ++	    matched against the group database. The backwards compatible default is
> ++            to try the group database match even for tokens not enclosed
> ++            in parentheses.
> ++          </para>
> ++        </listitem>
> ++      </varlistentry>
> ++
> ++      <varlistentry>
> ++        <term>
> ++          nodns
> ++        </term>
> ++        <listitem>
> ++          <para>
> ++	    Do not try to resolve tokens as hostnames, only IPv4 and IPv6
> ++	    addresses will be resolved. Which means to allow login from a
> ++	    remote host, the IP addresses need to be specified in <filename>access.conf</filename>.
> ++          </para>
> ++        </listitem>
> ++      </varlistentry>
> ++
> +       <varlistentry>
> +         <term>
> +           quiet_log
> +@@ -185,20 +215,6 @@
> +         </listitem>
> +       </varlistentry>
> + 
> +-      <varlistentry>
> +-        <term>
> +-          nodefgroup
> +-        </term>
> +-        <listitem>
> +-          <para>
> +-            User tokens which are not enclosed in parentheses will not be
> +-	    matched against the group database. The backwards compatible default is
> +-            to try the group database match even for tokens not enclosed
> +-            in parentheses.
> +-          </para>
> +-        </listitem>
> +-      </varlistentry>
> +-
> +     </variablelist>
> +   </refsect1>
> + 
> +diff --git a/modules/pam_access/pam_access.c b/modules/pam_access/pam_access.c
> +index 48e7c7e97..109115e9c 100644
> +--- a/modules/pam_access/pam_access.c
> ++++ b/modules/pam_access/pam_access.c
> +@@ -100,6 +100,7 @@ struct login_info {
> +     int only_new_group_syntax;		/* Only allow group entries of the form "(xyz)" */
> +     int noaudit;			/* Do not audit denials */
> +     int quiet_log;			/* Do not log denials */
> ++    int nodns;                          /* Do not try to resolve tokens as hostnames */
> +     const char *fs;			/* field separator */
> +     const char *sep;			/* list-element separator */
> +     int from_remote_host;               /* If PAM_RHOST was used for from */
> +@@ -154,6 +155,8 @@ parse_args(pam_handle_t *pamh, struct login_info *loginfo,
> + 	    loginfo->noaudit = YES;
> + 	} else if (strcmp (argv[i], "quiet_log") == 0) {
> + 	    loginfo->quiet_log = YES;
> ++	} else if (strcmp (argv[i], "nodns") == 0) {
> ++	    loginfo->nodns = YES;
> + 	} else {
> + 	    pam_syslog(pamh, LOG_ERR, "unrecognized option [%s]", argv[i]);
> + 	}
> +@@ -820,7 +823,7 @@ remote_match (pam_handle_t *pamh, char *tok, struct login_info *item)
> +       if ((str_len = strlen(string)) > tok_len
> + 	  && strcasecmp(tok, string + str_len - tok_len) == 0)
> + 	return YES;
> +-    } else if (tok[tok_len - 1] == '.') {       /* internet network numbers (end with ".") */
> ++    } else if (tok[tok_len - 1] == '.') {       /* internet network numbers/subnet (end with ".") */
> +       struct addrinfo hint;
> + 
> +       memset (&hint, '\0', sizeof (hint));
> +@@ -895,6 +898,39 @@ string_match (pam_handle_t *pamh, const char *tok, const char *string,
> + }
> + 
> + 
> ++static int
> ++is_device (pam_handle_t *pamh, const char *tok)
> ++{
> ++  struct stat st;
> ++  const char *dev = "/dev/";
> ++  char *devname;
> ++
> ++  devname = malloc (strlen(dev) + strlen (tok) + 1);
> ++  if (devname == NULL) {
> ++      pam_syslog(pamh, LOG_ERR, "Cannot allocate memory for device name: %m");
> ++      /*
> ++       * We should return an error and abort, but pam_access has no good
> ++       * error handling.
> ++       */
> ++      return NO;
> ++  }
> ++
> ++  char *cp = stpcpy (devname, dev);
> ++  strcpy (cp, tok);
> ++
> ++  if (lstat(devname, &st) != 0)
> ++    {
> ++      free (devname);
> ++      return NO;
> ++    }
> ++  free (devname);
> ++
> ++  if (S_ISCHR(st.st_mode))
> ++    return YES;
> ++
> ++  return NO;
> ++}
> ++
> + /* network_netmask_match - match a string against one token
> +  * where string is a hostname or ip (v4,v6) address and tok
> +  * represents either a hostname, a single ip (v4,v6) address
> +@@ -956,10 +992,42 @@ network_netmask_match (pam_handle_t *pamh,
> + 	    return NO;
> + 	  }
> +       }
> ++    else if (isipaddr(tok, NULL, NULL) == YES)
> ++      {
> ++	if (getaddrinfo (tok, NULL, NULL, &ai) != 0)
> ++	  {
> ++	    if (item->debug)
> ++	      pam_syslog(pamh, LOG_DEBUG, "cannot resolve IP address \"%s\"", tok);
> ++
> ++	    return NO;
> ++	  }
> ++	netmask_ptr = NULL;
> ++      }
> ++    else if (item->nodns)
> ++      {
> ++	/* Only hostnames are left, which we would need to resolve via DNS */
> ++	return NO;
> ++      }
> +     else
> +       {
> ++	/* Bail out on X11 Display entries and ttys. */
> ++	if (tok[0] == ':')
> ++	  {
> ++	    if (item->debug)
> ++	      pam_syslog (pamh, LOG_DEBUG,
> ++			  "network_netmask_match: tok=%s is X11 display", tok);
> ++	    return NO;
> ++	  }
> ++	if (is_device (pamh, tok))
> ++	  {
> ++	    if (item->debug)
> ++	      pam_syslog (pamh, LOG_DEBUG,
> ++			  "network_netmask_match: tok=%s is a TTY", tok);
> ++	    return NO;
> ++	  }
> ++
> +         /*
> +-	 * It is either an IP address or a hostname.
> ++	 * It is most likely a hostname.
> + 	 * Let getaddrinfo sort everything out
> + 	 */
> + 	if (getaddrinfo (tok, NULL, NULL, &ai) != 0)
> diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
> index 23b09efbae..606bcc6d6b 100644
> --- a/package/linux-pam/linux-pam.mk
> +++ b/package/linux-pam/linux-pam.mk
> @@ -24,6 +24,7 @@ LINUX_PAM_LICENSE_FILES = Copyright
>  LINUX_PAM_LIBS = $(TARGET_NLS_LIBS)
>  LINUX_PAM_MAKE_OPTS += LIBS="$(LINUX_PAM_LIBS)"
>  LINUX_PAM_CPE_ID_VENDOR = linux-pam
> +LINUX_PAM_IGNORE_CVES += CVE-2024-10963
>  
>  ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
>  LINUX_PAM_LIBS += -latomic
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
