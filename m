Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D51CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BB8F611FC;
	Fri, 16 Oct 2026 13:12:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o296Eq79iIL4; Fri, 16 Oct 2026 13:12:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 86CB6611EA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156332;
	b=hFAAhGSJsQsbrTvrM3MMrdlOkNud+tU8fs2A7MqArwBVO1Mcn5QIw26owERw9nMVbkqP
	 HJN5AMkrHNJaTG3S2VuxW9QjDEhXS/UFXsamZt5M56qNW0xbKfVRLF9STLH3g4tZRBxgJ
	 5Mri5+P8iuqdpEDLltaNz68YeKpL0UxQIJLiIPbs0d/ymt67b7vl07Ft/BXV5zybt6lAq
	 rNTmKf3R+h8l4QtfTJsePjHRt0sJBECu1iI5GNKC5Gr3kkg/l05xIzTpPy6lACf7Edi7x
	 vUmrtxKuyCcyFVN9XrFYfciqPjHWNaAoYoIQaEXtq75yaKFX4RaI5S7lrfbhwBm/R0Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156332;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=Cd8opoYlgDj0c+FJsAgXfPxx3tWN1X3rdxcvxwjdLys=;
	b=qxdi8SJ8N3ic6Qupy/o7fBr22lDgDxE6/NcjfZfnTlK8/RJTZCrq7OmYGEE173C5gyEN
	 Hem4LwANJTkMbvjf3r902I0huQ/7YB8zE3di0h8ghEGCpOkGWtW+8N4NakpajEZDnM3s+
	 cLtCfSF0e44lo8keUGlI49YShnGEVyyRE0UMP558z89GEbhGahb2ZE1g/ub/SZL5KiOzS
	 UaVq8uJtRXI25A4kWq7ZBj8Je7wSAHnjY7mHAgBP42CeFf0nMwAciV4SY6eWypw+O17lu
	 5YKR/K/zv5woJ2JlC1mBhl6Yu6Ueg9225TS67hldnsqVVNGq/QM5qgiWtTMRVKRCcHw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156332;
	bh=Cd8opoYlgDj0c+FJsAgXfPxx3tWN1X3rdxcvxwjdLys=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Km/VYOv6l7ormrVYrBAPedOUItoH4sOAIIkmdHpPsmE9iD8mmMXwXGHqIJQDsysrq
	 MTOhg3Nr5VXCdcA1hWL9v/PfiV84Bv8BcnHpWc/aq2hFzf0j/olK0OsxjruAYLbML4
	 P6a4WSTrGkbkMBrNcFXuSkeraCMvYzCLr7VjIgkrveZ5oa6x9b1tPDElFFiwdD0Svp
	 3eBdnlDwswGwWo66pp/DM1vufWrjJbIza0V2nik3Ci57fEMLMRPyehZdMp0TN4fa8o
	 rWz6vgA85ACaS8f6CDoyHQO2hgBD+Ea6uAGJcCGdiq0fDl93tf8it+ET5Dh986u5KL
	 hx/QmRZo4uVqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86CB6611EA;
	Fri, 16 Oct 2026 13:12:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E52BF105
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFEB360F7A
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EFvlC1kJJ_Jp for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F2BC960EF9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156191;
 b=egNjvi1hLDHxu3lauj3c7h81q0XENZrl8+YVjW88BTciZqtCze5dyzh6qZ5oPdeqa58m
 uTYJJibAPh3bT86V89+05b9v+B+VxXWDUmdW4bCrHL0suwRAM6Uq4v7AihfeHxc5bIPg4
 OMFp3/Xt0in++SwWVIUabKwA8+f75VrfRz2egpYuhyP0mE57GlP3zhkUe4OrA/CuIpH8J
 dG83BDcBiBCDjyuUJnZE10fo8T+oxV6FvTEx9RwIFhTwG9dk2m65xhwUDedtl6/abJe++
 tFbW5CGcztNWuI11j7+mQNkuY6CwdA/JLg/Ikzj6Io7SfzaJfc4+sbFHfmyEOeus1LA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156191;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ncK57cLB7vWbedzvy3vsvr0xkS1ttmH1EEJkUf4unzU=;
 b=gg9Yr6k6luhSfRvaxO+5HvbsEI5zvl0QqtBrcJiyv8vdBAr2ut9hX78jf8oqJyvdNCV7
 v1yCnTxN1le/cOqA2zfSqKbW4J+4BCdxI+7aPHEYSWqClGzcgD2b+ZRbAtOG3QvD8qvNs
 2qQeU4n8SZqc8DUGujpgaf4ALab9++2Dpomtf/gPuGuAR9HllD6+82giq+0ZAFuMlSNkM
 x6wwWRnJJlNAPS0iVzq0e05tqYbjXPDjVcv2whyF0QJNw13wC+BM5gzdFL2EwemWCj362
 bsA84pi0GI/stmggHoljvPloaQ4JA/1o/+KegoOb6wP5ka+6AwDEQxg3Q1dJs8EYVTQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2BC960EF9
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E3803960D7; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 13:20:44 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: e1f54e6c7325ce2a665d6b3bd943813e0c2e2304
X-Git-Newrev: 23a89f02459f60432a2cb2af6704da62066ad940
X-Patchwork-Hint: ignore
Message-Id: <20261016130829.E3803960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/gpsd: backport
 security fixes for CVE-2026-58459
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9205297884830014097=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9205297884830014097==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/23a89f02459f60432a2cb2af6704da62066ad940
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8cfad4f0f4b9fcb616b99b0fc6ae01e460d909d5)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...psprof.py.in-Quote-double-quotes-in-title.patch | 50 ++++++++++++++++++
 ...s-gpsprof.py.in-Quote-back-ticks-in-title.patch | 48 +++++++++++++++++
 ...s-gpsprof.py.in-Quote-back-ticks-in-title.patch | 60 ++++++++++++++++++++++
 package/gpsd/gpsd.mk                               |  6 +++
 4 files changed, 164 insertions(+)

diff --git a/package/gpsd/0001-clients-gpsprof.py.in-Quote-double-quotes-in-title.patch b/package/gpsd/0001-clients-gpsprof.py.in-Quote-double-quotes-in-title.patch
new file mode 100644
index 0000000000..8be7040fa5
--- /dev/null
+++ b/package/gpsd/0001-clients-gpsprof.py.in-Quote-double-quotes-in-title.patch
@@ -0,0 +1,50 @@
+From 5581ba196d826a984fbfaf792b7d58535f9911ce Mon Sep 17 00:00:00 2001
+Message-ID: <5581ba196d826a984fbfaf792b7d58535f9911ce.1791178679.git.yann.morin@orange.com>
+From: "Gary E. Miller" <gem@rellim.com>
+Date: Wed, 1 Jul 2026 17:55:57 -0700
+Subject: [PATCH] clients/gpsprof.py.in: Quote double quotes in title.
+
+Someone could use the double quote to break out of the
+string and add gnuplot commnds.
+
+For issue 404.
+Reported by: CuB3y0nd, and Wade Sparks <wsparks@vulncheck.com>
+Upstream: https://gitlab.com/gpsd/gpsd/-/commit/5581ba196d826a984fbfaf792b7d58535f9911ce
+CVE: CVE-2026-58459
+Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
+
+---
+ clients/gpsprof.py.in | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/clients/gpsprof.py.in b/clients/gpsprof.py.in
+index 5c18f50ff..261e72665 100644
+--- a/clients/gpsprof.py.in
++++ b/clients/gpsprof.py.in
+@@ -198,6 +198,10 @@ class plotter(object):
+         if 'subtype' in self.device:
+             desc += "\\n%s" % self.device['subtype']
+ 
++        # escape ", and \n, for gnuplot, to not break strings
++        desc = desc.replace('"', '\\042')
++        desc = desc.replace('\n', '')
++
+         return desc
+ 
+     def collect(self, verb, log_fp=None):
+@@ -1262,10 +1266,10 @@ if __name__ == '__main__':
+         # Ship the plot to standard output
+         if not options.title:
+             options.title = plot.whatami()
+-            # escape " for gnuplot
+-            options.title = options.title.replace('"', '\\"')
+         if options.subtitle:
+             options.title += '\\n' + options.subtitle
++        # escape " for gnuplot, to not break strings
++        options.title = options.title.replace('"', '\\042')
+         term_opts = ""
+         truecolor_terms = ['png', 'sixelgd', 'wxt']
+         if options.terminal in truecolor_terms:
+-- 
+2.43.0
+
diff --git a/package/gpsd/0002-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch b/package/gpsd/0002-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch
new file mode 100644
index 0000000000..53e1cac1cc
--- /dev/null
+++ b/package/gpsd/0002-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch
@@ -0,0 +1,48 @@
+From 1a6bb7bcbdf58aa940132e630870af061dc88537 Mon Sep 17 00:00:00 2001
+Message-ID: <1a6bb7bcbdf58aa940132e630870af061dc88537.1791178680.git.yann.morin@orange.com>
+From: "Gary E. Miller" <gem@rellim.com>
+Date: Tue, 7 Jul 2026 13:41:54 -0700
+Subject: [PATCH] clients/gpsprof.py.in: Quote back ticks in title.
+
+Someone could use the back tick to break out of the string and add
+gnuplot commnds.
+
+For issue 404.
+Reported by: CuB3y0nd, and Wade Sparks <wsparks@vulncheck.com>
+Upstream: https://gitlab.com/gpsd/gpsd/-/commit/1a6bb7bcbdf58aa940132e630870af061dc88537
+CVE: CVE-2026-58459
+Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
+
+---
+ clients/gpsprof.py.in | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/clients/gpsprof.py.in b/clients/gpsprof.py.in
+index 261e72665..202214769 100644
+--- a/clients/gpsprof.py.in
++++ b/clients/gpsprof.py.in
+@@ -198,8 +198,9 @@ class plotter(object):
+         if 'subtype' in self.device:
+             desc += "\\n%s" % self.device['subtype']
+ 
+-        # escape ", and \n, for gnuplot, to not break strings
++        # escape ", `, and \n, for gnuplot, to not break strings
+         desc = desc.replace('"', '\\042')
++        desc = desc.replace('`', '\\140')
+         desc = desc.replace('\n', '')
+ 
+         return desc
+@@ -1268,8 +1269,9 @@ if __name__ == '__main__':
+             options.title = plot.whatami()
+         if options.subtitle:
+             options.title += '\\n' + options.subtitle
+-        # escape " for gnuplot, to not break strings
++        # escape ",  and`, for gnuplot, to not break strings
+         options.title = options.title.replace('"', '\\042')
++        options.title = options.title.replace('"', '\\140')
+         term_opts = ""
+         truecolor_terms = ['png', 'sixelgd', 'wxt']
+         if options.terminal in truecolor_terms:
+-- 
+2.43.0
+
diff --git a/package/gpsd/0003-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch b/package/gpsd/0003-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch
new file mode 100644
index 0000000000..f2e875bb02
--- /dev/null
+++ b/package/gpsd/0003-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch
@@ -0,0 +1,60 @@
+From 4c06658e988f4ced1a7a574ce082a22ef625df56 Mon Sep 17 00:00:00 2001
+Message-ID: <4c06658e988f4ced1a7a574ce082a22ef625df56.1791178681.git.yann.morin@orange.com>
+From: "Gary E. Miller" <gem@rellim.com>
+Date: Tue, 7 Jul 2026 14:23:56 -0700
+Subject: [PATCH] clients/gpsprof.py.in: Quote back ticks in title.
+
+Second try.  Also quote "terminal".
+
+Someone could use the back tick to break out of the string and add
+gnuplot commnds.
+
+For issue 404.
+Reported by: CuB3y0nd, and Wade Sparks <wsparks@vulncheck.com>
+Upstream: https://gitlab.com/gpsd/gpsd/-/commit/4c06658e988f4ced1a7a574ce082a22ef625df56
+CVE: CVE-2026-58459
+Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
+
+---
+ clients/gpsprof.py.in | 14 ++++++++++----
+ 1 file changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/clients/gpsprof.py.in b/clients/gpsprof.py.in
+index 202214769..e91367ee3 100644
+--- a/clients/gpsprof.py.in
++++ b/clients/gpsprof.py.in
+@@ -200,7 +200,7 @@ class plotter(object):
+ 
+         # escape ", `, and \n, for gnuplot, to not break strings
+         desc = desc.replace('"', '\\042')
+-        desc = desc.replace('`', '\\140')
++        desc = desc.replace("\x60", '\\140')
+         desc = desc.replace('\n', '')
+ 
+         return desc
+@@ -1271,13 +1271,19 @@ if __name__ == '__main__':
+             options.title += '\\n' + options.subtitle
+         # escape ",  and`, for gnuplot, to not break strings
+         options.title = options.title.replace('"', '\\042')
+-        options.title = options.title.replace('"', '\\140')
++        options.title = options.title.replace("\x60", '\\140')
+         term_opts = ""
+         truecolor_terms = ['png', 'sixelgd', 'wxt']
+         if options.terminal in truecolor_terms:
+             term_opts = 'truecolor'
+-        sys.stdout.write("set terminal %s size 800,950 %s\n"
+-                         "set termoption enhanced\n"
++
++        # escape ", `, and \n, for gnuplot, to not break strings
++        options.terminal = options.terminal.replace('"', '\\042')
++        options.terminal = options.terminal.replace("\x60", '\\140')
++        options.terminal = options.terminal.replace('\n', '')
++
++        sys.stdout.write('set terminal "%s" size 800,950 %s\n'
++                         'set termoption enhanced\n'
+                          % (options.terminal, term_opts))
+         # double quotes on title so \n is parsed by gnuplot
+         sys.stdout.write('set title noenhanced "%s\\n\\n"\n' % options.title)
+-- 
+2.43.0
+
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 7fd8cec8ab..b23bc4c065 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -9,6 +9,12 @@ GPSD_SITE = http://download-mirror.savannah.gnu.org/releases/gpsd
 GPSD_LICENSE = BSD-2-Clause
 GPSD_LICENSE_FILES = COPYING
 GPSD_CPE_ID_VALID = YES
+
+# 0001-clients-gpsprof.py.in-Quote-double-quotes-in-title.patch
+# 0002-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch
+# 0003-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch
+GPSD_IGNORE_CVES = CVE-2026-58459
+
 GPSD_SELINUX_MODULES = gpsd
 GPSD_INSTALL_STAGING = YES
 

--===============9205297884830014097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9205297884830014097==--
