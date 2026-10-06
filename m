Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC5DCA5FF0
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 08:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDB6C6074D;
	Tue,  6 Oct 2026 08:26:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h8LEqmUefMDh; Tue,  6 Oct 2026 08:25:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A5698606DC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791275159;
	b=E9c61OyBIjn6K0/qNH9qMw8iFCRDYXd0hbpgc43l99dZY6xiPb4fDuU2EjtY1KfxBE1f
	 CEng1sxUFzfiJCIMZylkzKiqsOjvej4OoG82hgZehNHwo1XDf/WQN3bVIOifIIRA3O2k/
	 sP4mCXnAxUJD4lLTGFH6twWJl7miec5OQi8t2FTKy3x8AIgOGaMxoKdnrMTFyMZNyKtxS
	 4hsYrAutx+UJmEvcgy9nTYXZ89/h6dti9BAQhLhQsGLlay+kWVKr9EPse+GatwShJDMW2
	 wWa9dSPS+1NbSAYNmWlKK/PTBtIFBJVSNDXBC5zFLlnCKY32ApxDvU7u47VWD9AbifQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791275159;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=EcwBqr08MzU+5MznImmndQo6mMIYe6cDqzbi5z603eE=;
	b=YKoZyTJ5Na7r4j5cJR9rsizY1pC3DRx51tCZ8LGEH6KQcHJ69PuJvuNFuNGdUMCXPIfU
	 vC0Q6bqDlHPZDG0hzNrAlY1+vYPhDfajqUw3N3LTBWRtZTQ1h9NnGxlk5Ei3p43rxaYoA
	 33FOdlSqQf2C87g7olVrM/cVvdlAkrdcrt/uPgYxB9EfNF5ll/eGzqyr25FNPAUd6z4QS
	 xi62ey+TPmh4unwpkSf/VBpvEHJq3c4rzBR/zbyJI3CJx8fIcmfB5w/cOEVG3z8sPy/Xx
	 +i2/wuOKnDgCuWGlwsgLv9fTQttckHhx3FgBaxkTo1Nan7EuXUa36qEMhRMDDajfrVw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791275159;
	bh=EcwBqr08MzU+5MznImmndQo6mMIYe6cDqzbi5z603eE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=T0Jb2dWu749daTSGK5N1qxZj1fdT42qg7moJy9Rczi/xmgDHlkYLCVghPZ5HIM4gU
	 naKnNIzWAsceiaBGdsdTPx5Wyzx0VyFbNY4tBRT1r8zKVe5vHWmdvFtoHK0Vt6dxPy
	 9GOWViVKAGc2xPK+o67Hkg6WIGHaMTXsL8u/udgGPmrs81X6FjrmTNoy4Y81jhirGR
	 eAXLi2I7UCUtUOrisAKVm/+KUnSkJTG+qVuAmaUx7QRKTxMOZGn0AA/rNT+nUNLISm
	 bMhwoqvTt0cZ4nAywjGk1g5fsFd8BmetcolLKBFA5ejX0ysSOByGspYJfBfD7dBs54
	 TmP4xP1JDzHIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5698606DC;
	Tue,  6 Oct 2026 08:25:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DD462338
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 08:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C326B60608
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 08:00:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y3WZPNTeIuqD for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 08:00:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D8F1E605D8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791273655;
 b=B03F5UNlADr+WryQ7XNJ2IkbPZiqZ6tW0bDzt3IpSsZ6kkS383+or4NUfAIZMxAr8zxA
 MwOj7fOpLUZiVT3drRIwVekJ7rhOwNiGqKdRDEhbrJaimORRxlOMMZbKmELS2Eb6Qd12E
 /nVsuRioVB92JVRS1ekByIMCZOXLZpAZZRbXGRvn0bdcUAqRQ/92MHqQBu7l1465imgJN
 M+HLoOYb4qfAEtIgab20JmXh7Pgys8fMiDu0JVDt5Ji0Oq8/6p35Fmftusv91nSEMSvpx
 3EPjD6VIef4MWLC8X826NVF5Q1vbPHWEJnR/KqKdPN53n9jY1K5nYzIJ+5vJX0nQvrA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791273655;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=KD4jVxHnJFhPnEtFNMXdE+kRizyEeehemIOIjAb5x+4=;
 b=A1WC09m3WCN3TPSI/Bo+g3Yxpd9S5y1drFEUn5kfyqGxwAvZESaSPiJPWvrnyDHupeeU
 otqth3fRiMSm/dq648pc1DR3Q3Ks0iHTVNIiDH1+UqD5Tq5d1iEE3wLrQq9YBsqS4XtYE
 aEci3sPqqqD+Pv+TS5Opqz6ZgoQ0zb/WNkwCu4QbiI1J5uT3cTv2Q92Kkq5ol8Gzj8FQ7
 aP6C4RjLxspwSe3k97F6Jo+As0MiLvTD8vVp1SGQh6Uaan4b5wKtwMTyt+e4VyHJUvxX6
 IiL7m3+6CQnQD69G/XN8RgqMbTJGptHW3B+An4qnbFEFwh8DUeH+Sp95zzQmw3hZUgQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8F1E605D8
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 08:00:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B6B4E8D706; Tue,  6 Oct 2026 07:59:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Oct 2026 09:57:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 96bac75585733129044f7d9153d205f5eef93a3c
X-Git-Newrev: 8cfad4f0f4b9fcb616b99b0fc6ae01e460d909d5
X-Patchwork-Hint: ignore
Message-Id: <20261006075939.B6B4E8D706@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gpsd: backport security fixes for
 CVE-2026-58459
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8cfad4f0f4b9fcb616b99b0fc6ae01e460d909d5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
