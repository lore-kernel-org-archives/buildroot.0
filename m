Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFCDEC4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 10:35:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 583C16101C
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 10:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 583C16101C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AA9C40234;
	Sun,  8 Aug 2021 10:35:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xtnEszpxlUy4; Sun,  8 Aug 2021 10:35:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 420BC40235;
	Sun,  8 Aug 2021 10:35:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C9C571BF38E
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 10:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C60F882CF1
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 10:35:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bRlrxFhkfcoU for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 10:35:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A08CB82C3C
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 10:35:19 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 m28-20020a05600c3b1cb02902b5a8c22575so9119171wms.0
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 03:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=08t7v/J1YBqnwgOAxsDzPjYWebvR0b7kDwgpCUWfSpU=;
 b=sIelgdCc1L1d1HkIuHgw51FmbHwj6CsUow0u+EPbatEJhF3UPGS0eCwrKW7KNdD0rf
 G4CNLAcgqedCoaNPNjmSO8JxLMr9qp/eDCIm1Tm7Badwg4khZS09vugxTAstJ9OszqeU
 2mbelkgRugLXRQDDA4+lcSOCxHE/BVBdORvPAVP9AG3m9CubM7SGjks9fIHl88SLd6ea
 7rgHojf4MIeERpqG/FwjaYVk/fe2u/tQG6ji9zSL0dGoSbsTPXGiy8JZkYd3PPhFNLey
 JRQZ8bkgzrlX9SHG8k7ny1gICOJ7TUO/qVtQ+oOhwAq4161f8S09CqqfKHfLYFdFPkfE
 n2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=08t7v/J1YBqnwgOAxsDzPjYWebvR0b7kDwgpCUWfSpU=;
 b=GqkZIAUcrv4h5lmDa+z5SapO2JPjxoh7wmzV98SqWxT5sjQcj27ruglXJ0Q1PXVbxo
 sox2K6OadNEKSxNI1JBTYleUY7oIUpWdp2GumPb3JsUZE2KbxzdISYrtYgc4HEM0pEMs
 YT14z+IuO3TmATOzlwpdD7k3TdWiSoI8zGhqdMtqlGwtnCI5F5eefLiFsSNJYzw8JWJE
 mXoOFhVfbVOAhr+jc3Z+IN+lSQChjletQexO/PBLusK1KmXk02A5pAqoJGwcoX5Fpon+
 FuBoayu4Cu3Hi0fZMkuBwuZfr0VlYEC6AochhgiugLhTmaDe9nrZXavnWr+K/esTMjh1
 LS9A==
X-Gm-Message-State: AOAM531YEG/G53DlRJ6eHFsfVO3QTZXjTF9qNCMXiewYhvyAxA9KtLFO
 QrUU3lp3UdHYSqmfU1+3c08qkz0QVki/qg==
X-Google-Smtp-Source: ABdhPJzpQmz9yELb17bNOzNYgEVbgkSKKlUDTLRHT/f2LrBQLWYsBQN1CKcq+aWmIfQsZvuAYYvpUg==
X-Received: by 2002:a7b:c744:: with SMTP id w4mr17288603wmk.100.1628418917436; 
 Sun, 08 Aug 2021 03:35:17 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id g198sm21903164wme.0.2021.08.08.03.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 03:35:17 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Aug 2021 12:35:06 +0200
Message-Id: <20210808103506.3651341-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/iputils: disable tests
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Disable tests to avoid the following build failure raised since bump to
version 20210722 in commit b984cba490248e6636b53b4b26b959cda5ed6f6c:

../output-1/build/iputils-20210722/ping/meson.build:38:0: ERROR: Program or command 'ip' not found or not executable

Fixes:
 - http://autobuild.buildroot.org/results/af79d5a8a84f439f4d1d720fad2f3e197923cd4a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-meson-Make-tests-optional.patch      | 218 ++++++++++++++++++
 package/iputils/iputils.mk                    |   3 +-
 2 files changed, 220 insertions(+), 1 deletion(-)
 create mode 100644 package/iputils/0001-meson-Make-tests-optional.patch

diff --git a/package/iputils/0001-meson-Make-tests-optional.patch b/package/iputils/0001-meson-Make-tests-optional.patch
new file mode 100644
index 0000000000..e9ed1d77e8
--- /dev/null
+++ b/package/iputils/0001-meson-Make-tests-optional.patch
@@ -0,0 +1,218 @@
+From 3163c49f9f4ad473a00d8a345ee334a028376011 Mon Sep 17 00:00:00 2001
+From: Heiko Becker <heirecka@exherbo.org>
+Date: Fri, 23 Jul 2021 16:32:46 +0200
+Subject: [PATCH] meson: Make tests optional
+
+Now can be disabled with -DSKIP_TESTS=true.
+
+It allows to avoid meson error during build when ip isn't installed.
+
+Closes: #359
+
+Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
+Signed-off-by: Heiko Becker <heirecka@exherbo.org>
+[ pvorel: Rename variable TEST => SKIP_TESTS, default false, adjust
+the description ]
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+
+[Retrieved from:
+https://github.com/iputils/iputils/commit/3163c49f9f4ad473a00d8a345ee334a028376011]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ meson_options.txt     |  3 ++
+ ping/meson.build      | 84 ++-----------------------------------------
+ ping/test/meson.build | 81 +++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 86 insertions(+), 82 deletions(-)
+ create mode 100644 ping/test/meson.build
+
+diff --git a/meson_options.txt b/meson_options.txt
+index ac5f5d98..517667f4 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -72,3 +72,6 @@ option('INSTALL_SYSTEMD_UNITS', type: 'boolean', value: false,
+ 
+ option('USE_GETTEXT', type: 'boolean', value: true,
+ 	description: 'Enable I18N')
++
++option('SKIP_TESTS', type: 'boolean', value: false,
++	description: 'Skip tests during build')
+diff --git a/ping/meson.build b/ping/meson.build
+index 1e678ec8..83ea353c 100644
+--- a/ping/meson.build
++++ b/ping/meson.build
+@@ -27,86 +27,6 @@ if (setcap_ping)
+ 	)
+ endif
+ 
+-##### TESTS #####
+-
+-# TODO: ::1 generates DEPRECATION: ":" is not allowed in test name "ping -c1 ::1", it has been replaced with "_"
+-
+-# GitHub CI does not have working IPv6
+-# https://github.com/actions/virtual-environments/issues/668
+-ipv6_dst = []
+-ipv6_switch = []
+-r = run_command('ip', '-6', 'a')
+-if r.stdout().strip().contains('::1')
+-  message('IPv6 enabled')
+-  ipv6_dst = [ '::1' ]
+-  ipv6_switch = [ '-6' ]
+-else
+-  message('WARNING: IPv6 disabled')
++if not get_option('SKIP_TESTS')
++	subdir('test')
+ endif
+-
+-run_as_root = false
+-r = run_command('id', '-u')
+-if r.stdout().strip().to_int() == 0
+-  message('running as root')
+-  run_as_root = true
+-else
+-  message('running as normal user')
+-endif
+-
+-foreach dst : [ 'localhost', '127.0.0.1' ] + ipv6_dst
+-  foreach switch : [ '', '-4' ] + ipv6_switch
+-	args = [ '-c1', dst ]
+-	should_fail = false
+-
+-	if switch != ''
+-	  args = [switch] + args
+-	  if (switch == '-4' and dst == '::1') or (switch == '-6' and dst == '127.0.0.1')
+-		 should_fail = true
+-	  endif
+-	endif
+-
+-	name = 'ping ' + ' '.join(args)
+-	test(name, ping, args : args, should_fail : should_fail)
+-  endforeach
+-endforeach
+-
+-ping_tests_opt = [
+-  [ '-c1' ],
+-  [ '-c5', '-i0.1' ],
+-  [ '-c1', '-I', 'lo' ],
+-  [ '-c1', '-w1' ],
+-  [ '-c1', '-W1' ],
+-  [ '-c1', '-W1.1' ],
+-]
+-foreach dst : [ '127.0.0.1' ] + ipv6_dst
+-  foreach args : ping_tests_opt
+-	args += [ dst ]
+-	name = 'ping ' + ' '.join(args)
+-	test(name, ping, args : args)
+-  endforeach
+-endforeach
+-
+-ping_tests_opt_fail = [
+-  [ '-c1.1' ],
+-  [ '-I', 'nonexisting' ],
+-  [ '-w0.1' ],
+-  [ '-w0,1' ],
+-]
+-foreach dst : [ '127.0.0.1' ] + ipv6_dst
+-  foreach args : ping_tests_opt_fail
+-	args += [ dst ]
+-	name = 'ping ' + ' '.join(args)
+-	test(name, ping, args : args, should_fail : true)
+-  endforeach
+-endforeach
+-
+-ping_tests_user_fail = [
+-  [ '-c1', '-i0.001' ], # -c1 required to quit ping when running as root
+-]
+-foreach dst : [ '127.0.0.1' ] + ipv6_dst
+-  foreach args : ping_tests_user_fail
+-	args += [ dst ]
+-	name = 'ping ' + ' '.join(args)
+-	test(name, ping, args : args, should_fail : not run_as_root)
+-  endforeach
+-endforeach
+diff --git a/ping/test/meson.build b/ping/test/meson.build
+new file mode 100644
+index 00000000..43aed758
+--- /dev/null
++++ b/ping/test/meson.build
+@@ -0,0 +1,81 @@
++# TODO: ::1 generates DEPRECATION: ":" is not allowed in test name "ping -c1 ::1", it has been replaced with "_"
++
++# GitHub CI does not have working IPv6
++# https://github.com/actions/virtual-environments/issues/668
++ipv6_dst = []
++ipv6_switch = []
++r = run_command('ip', '-6', 'a')
++if r.stdout().strip().contains('::1')
++  message('IPv6 enabled')
++  ipv6_dst = [ '::1' ]
++  ipv6_switch = [ '-6' ]
++else
++  message('WARNING: IPv6 disabled')
++endif
++
++run_as_root = false
++r = run_command('id', '-u')
++if r.stdout().strip().to_int() == 0
++  message('running as root')
++  run_as_root = true
++else
++  message('running as normal user')
++endif
++
++foreach dst : [ 'localhost', '127.0.0.1' ] + ipv6_dst
++  foreach switch : [ '', '-4' ] + ipv6_switch
++	args = [ '-c1', dst ]
++	should_fail = false
++
++	if switch != ''
++	  args = [switch] + args
++	  if (switch == '-4' and dst == '::1') or (switch == '-6' and dst == '127.0.0.1')
++		 should_fail = true
++	  endif
++	endif
++
++	name = 'ping ' + ' '.join(args)
++	test(name, ping, args : args, should_fail : should_fail)
++  endforeach
++endforeach
++
++ping_tests_opt = [
++  [ '-c1' ],
++  [ '-c5', '-i0.1' ],
++  [ '-c1', '-I', 'lo' ],
++  [ '-c1', '-w1' ],
++  [ '-c1', '-W1' ],
++  [ '-c1', '-W1.1' ],
++]
++foreach dst : [ '127.0.0.1' ] + ipv6_dst
++  foreach args : ping_tests_opt
++	args += [ dst ]
++	name = 'ping ' + ' '.join(args)
++	test(name, ping, args : args)
++  endforeach
++endforeach
++
++ping_tests_opt_fail = [
++  [ '-c1.1' ],
++  [ '-I', 'nonexisting' ],
++  [ '-w0.1' ],
++  [ '-w0,1' ],
++]
++foreach dst : [ '127.0.0.1' ] + ipv6_dst
++  foreach args : ping_tests_opt_fail
++	args += [ dst ]
++	name = 'ping ' + ' '.join(args)
++	test(name, ping, args : args, should_fail : true)
++  endforeach
++endforeach
++
++ping_tests_user_fail = [
++  [ '-c1', '-i0.001' ], # -c1 required to quit ping when running as root
++]
++foreach dst : [ '127.0.0.1' ] + ipv6_dst
++  foreach args : ping_tests_user_fail
++	args += [ dst ]
++	name = 'ping ' + ' '.join(args)
++	test(name, ping, args : args, should_fail : not run_as_root)
++  endforeach
++endforeach
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index af93909edf..6e182e6a70 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -26,7 +26,8 @@ IPUTILS_CONF_OPTS += \
 	-DBUILD_RDISC_SERVER=$(if $(BR2_PACKAGE_IPUTILS_RDISC_SERVER),true,false) \
 	-DBUILD_TRACEPATH=$(if $(BR2_PACKAGE_IPUTILS_TRACEPATH),true,false) \
 	-DBUILD_TRACEROUTE6=$(if $(BR2_PACKAGE_IPUTILS_TRACEROUTE6),true,false) \
-	-DBUILD_NINFOD=$(if $(BR2_PACKAGE_IPUTILS_NINFOD),true,false)
+	-DBUILD_NINFOD=$(if $(BR2_PACKAGE_IPUTILS_NINFOD),true,false) \
+	-DSKIP_TESTS=true
 
 # Selectively select the appropriate SELinux refpolicy modules
 IPUTILS_SELINUX_MODULES = \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
