Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22822CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5CB060B6B;
	Fri, 16 Oct 2026 13:08:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tLLasowbwDSs; Fri, 16 Oct 2026 13:08:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5CC6460B64
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156133;
	b=dED/M1MDQrGAehGFYQpmpNRv6Xthjm07XrWS6C24KHuT+slWfuzDcWXjXbJCkzp/4l4h
	 fEc3pCnkUIT0gZRxSG0TwBAFoLyq8BeVB7/1es144oJr4oZdIYSwkwV5iTFfu008lxTHd
	 1FhlKq/yiVnWXdOvXe9PVF8SpiWU/LiFQHix1sq5ACggwnwqyU82hCVE7Q/JwgHHQ0wBL
	 E/C3xuKQmTxFzGNicbFbygeMDK3Kjw5XMWH+U2t5dth5JrKMUzyXQmvfWskjjxiUcgpq5
	 oi2KNmaMIPMDLoFHyOXhaueLiAvnN5C85uMpRcIeKrM6NVU/ui+szPuVnsnixu1qEXQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156133;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=OokFdz5itJVbY1jKc2NkOVYaqgg+zzrUrwM4s5e4Z58=;
	b=rOB7DizxlF7dBaikUzigCLuwcKxBNicMO68xmlA/jdy6FajiIutcdwmPx1hy5hQ0PO8a
	 YEf/vdhC7sYLZgSU0dmYTdtd0ZuN9ZBqpQ6TV0eAwOrGJjv/2FICh0p1XPOiPGer9MWFf
	 HGPEflFGOLz4NF3MXQHki+Dm1VKwD7mPloLae28UxwHlaMDAiMdAm7FWCSM6cmjHbsqju
	 1X+L7lA1Bt4EGPEi/AucaKi+s5ZkeLTfmWiPeJrcp9GQ3zCDO/vmbBILf9FDcuncgXILb
	 /AfI0QJUpCMXnTgS0OTgYnYRvG6BSlQtkL9TOXwe643tSEdn6+g4GedwfcaGHOhKVrA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156133;
	bh=OokFdz5itJVbY1jKc2NkOVYaqgg+zzrUrwM4s5e4Z58=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ze7XpP9rfn4dM9JT9IDT96nclk6+zzcwPqXeLBz7C5E8DjF6F2NSoVxaBrr3e34ej
	 uIMvW735P4Z3l7tMciR+VYJkpZzkwg/TJV7rLwQTZ1hsVXDUdOx7UXB3f4kRJHv+is
	 qKsoRdzik3tLuLZKvDh/OYCbj+xd7d18GXyRp3G8+9C9+7wqVZAKN1YsP3mThZitLQ
	 6buuTKnB2pysGS2zzTfLlYSXv5TswTH5HB8lM7ed1OpeoSxfAppJP0K2tvVxiZc4Bx
	 35fQZG2cHrXT6aNfGTiUUMWAHoV65kGc7T1XolEeCthzkwoYqISHIKLfsRbWaNv7+N
	 bcEXq4G08WzQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CC6460B64;
	Fri, 16 Oct 2026 13:08:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 511DE255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 359E7814F2
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6xW29SBHwHnc for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DA39C814A0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156106;
 b=DO1AMdERPBmOMw9klBPSFGp+fPCpzYWqP1d5M5YrS43yper766lh8pk5MVMn0aiR5+ky
 HV2yrSQEMkeTzUFs09bN8Ctvf0hwmVvMaz/N8ylgXvE8CQk3QBhTQFO7a/Vao0e/GF9yH
 kvCXBSvPFT58UWfFkU8DNE4DU8tLJdrHg+ep7IFG0jkTMyayM8hpDgbYx+QxJRiLBrroo
 eBl2idqjSYh3Umwdw5S0bo4UFchwqRIimk5fRyZ1lxDQegRwy9r2vGUlObRGpAHWJu5oR
 AEIQlP1rCopAOK2chu4cgjCWJQie5gGI0j0VvuuUfADlPce/of62kseYPRDKH7Lf1Gg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156106;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=usdlfTicA7HlwSj3EPGM+VB2OG2WQ9Iw5ChQglozGJE=;
 b=XFndNTeayhqO1PJNzVsotKc2TrFK8Jp0/M1q6Nzg9ZeC8TDsYfzH4DkuLDtv7ForvDy2
 h0yVeV2sem1DRl8jdmnGo85E6Jua63tsPv4hJyJ0T/5JfPInSSRC18HN0UzyQrlyZuQKY
 dC8x1cW7H9Ev4QePCaDbd8n69Wk3f9GF+1A3EXDnAtKfCjqhiqvtUmcILdFrUI+CUA3TL
 r6vqkDoDfl82R5f1V5+XCCGKtrFA/oeHtOw/ylhxv6dsWzxSeTn0oV+XedWHZZvarN96U
 xMq4boGKTc35Mh6YWu3LYpDMi+iFuYrUseGTFb6wMxn6VKVYxtmJ0IaMfiwFtFwoB0w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA39C814A0
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CA95F960D5; Fri, 16 Oct 2026 13:07:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d4c72064f96e5a476342d59a3fcd3950c5798741
X-Git-Newrev: 0c731cc26cd5f50d10504fe91c6440960325a686
X-Patchwork-Hint: ignore
Message-Id: <20261016130705.CA95F960D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/gpsd: backport
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1437090783959795487=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1437090783959795487==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0c731cc26cd5f50d10504fe91c6440960325a686
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index 62144f46a7..e0428e2c04 100644
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
 

--===============1437090783959795487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1437090783959795487==--
