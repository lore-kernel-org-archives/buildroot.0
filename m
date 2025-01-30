Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F34C0218A
	for <buildroot@archiver.kernel.org>; Thu, 30 Jan 2025 06:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBE50419C5;
	Thu, 30 Jan 2025 06:32:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3xZ1Dcku0WDD; Thu, 30 Jan 2025 06:32:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 699454199E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 699454199E;
	Thu, 30 Jan 2025 06:32:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 03F37128
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 06:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 727946128A
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 06:32:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B1-khwsBEbXa for <buildroot@buildroot.org>;
 Thu, 30 Jan 2025 06:32:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.236;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7A9876128D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A9876128D
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.236])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A9876128D
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 06:32:19 +0000 (UTC)
X-CSE-ConnectionGUID: Gb3KyEKHQ6286yEFdznfig==
X-CSE-MsgGUID: zGLC/ls5QGKleiShGyHE+A==
Received: from unknown (HELO opfedv1rlp0g.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 07:32:17 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0g.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Jan 2025 07:32:16 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Thu, 30 Jan 2025 07:32:15 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Thu, 30 Jan 2025 07:32:14 +0100
X-CSE-ConnectionGUID: FXE6UeteSh+irXMwFcSYIw==
X-CSE-MsgGUID: E/WNRWCqQIyH5dzl5NgU2A==
X-IronPort-AV: E=Sophos;i="6.13,244,1732575600"; d="scan'208";a="245404912"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>
Date: Thu, 30 Jan 2025 07:32:14 +0100
Message-ID: <7468355a4fc6ef9c9a9fa70efa9c4bdac89cfd3c.1738218734.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX408.corporate.adroot.infra.ftgroup
 (10.115.27.17) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1738218740; x=1769754740;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I6uyQcjYLvygxjl4xuAsGNpdpA8svlpJsaZgkihs/2I=;
 b=cwmGzM6Le4yX26fxe56oQiFJ/aql9hDGZ6fj5Lc4RPnOFEnz3abexSdv
 bXA9n/XvIUU8J2oMRr+AViXaVoHzJtpNf7c8+Sl7+pNnlG9C7QThxd/qo
 timyzBqFUF98l3rJiuYfodmp9s6KrpP6wuI9U5AXPyuycw/XUhGlq7UWV
 2OJBGYTDkJlez0daR0flDKhUPdzsTWkgny8xawJW7NtRMBDd3hP9BVO69
 L09Eyxey9lbUzpakPAB6TIXCUQwxruYBq8IgSUbVIEKtxXgk6ZP1neXaA
 eudsss0aEMz0wV/4deQiIJWAT/5P02f2lKM7MD5ReI9d0Xqzgs2PJZDpB
 Q==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=cwmGzM6L
Subject: [Buildroot] [PATCH] package/autoconf: fix parallel builds
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

From: "Yann E. MORIN" <yann.morin@orange.com>

Backport two patches from upstream, to fix highly parallel builds on
very loaded machines.

On the first backported patch, upstream has stripped down the original
commit log, but the nitty-gritty details are available in their mailing
list for those interested [0].

[0] https://lists.gnu.org/archive/html/autoconf-patches/2025-01/msg00017.html

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 ...ix-dependencies-for-generating-the-w.patch | 43 +++++++++++++++++++
 ...x-dependency-issue-for-autoscan.list.patch | 33 ++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 package/autoconf/0002-tests-local.mk-fix-dependencies-for-generating-the-w.patch
 create mode 100644 package/autoconf/0003-Fix-dependency-issue-for-autoscan.list.patch

diff --git a/package/autoconf/0002-tests-local.mk-fix-dependencies-for-generating-the-w.patch b/package/autoconf/0002-tests-local.mk-fix-dependencies-for-generating-the-w.patch
new file mode 100644
index 0000000000..12d57dc65c
--- /dev/null
+++ b/package/autoconf/0002-tests-local.mk-fix-dependencies-for-generating-the-w.patch
@@ -0,0 +1,43 @@
+From a10ce78ead5516ed1348bbcdae58160fff70b898 Mon Sep 17 00:00:00 2001
+Message-Id: <a10ce78ead5516ed1348bbcdae58160fff70b898.1738217500.git.yann.morin@orange.com>
+From: "Yann E. MORIN" <yann.morin@orange.com>
+Date: Wed, 29 Jan 2025 15:29:18 -0700
+Subject: [PATCH] tests/local.mk: fix dependencies for generating the
+ wrapper template
+
+Generating the tests wrapper template currently depends on the
+dependencies needed for the frozen lib/m4sugar/m4sh.m4f. However,
+it also requires that frozen sugar to actually be generated, or the
+build will fail if it is not (or at least if it is in the process of
+being generated).
+
+Change the dependency to actually depend on the generated file, rather
+than on its dependencies.
+
+This kind of failure has been noticed on highly parallel builds on very
+loaded machines.
+
+Copyright-paperwork-exempt: yes
+
+Upstream: https://git.savannah.gnu.org/cgit/autoconf.git/commit/?id=a10ce78ead5516ed1348bbcdae58160fff70b898
+Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
+---
+ tests/local.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/local.mk b/tests/local.mk
+index 5c45d9ee..6a2c06a8 100644
+--- a/tests/local.mk
++++ b/tests/local.mk
+@@ -63,7 +63,7 @@ CLEANFILES += \
+   tests/wrapper.in \
+   $(wrappers)
+ 
+-tests/wrapper.in: $(srcdir)/tests/wrapper.as $(m4sh_m4f_dependencies)
++tests/wrapper.in: $(srcdir)/tests/wrapper.as lib/m4sugar/m4sh.m4f
+ 	$(MY_AUTOM4TE) --language=M4sh $(srcdir)/tests/wrapper.as -o $@
+ 
+ edit_wrapper = sed \
+-- 
+2.34.1
+
diff --git a/package/autoconf/0003-Fix-dependency-issue-for-autoscan.list.patch b/package/autoconf/0003-Fix-dependency-issue-for-autoscan.list.patch
new file mode 100644
index 0000000000..2aa3bc2339
--- /dev/null
+++ b/package/autoconf/0003-Fix-dependency-issue-for-autoscan.list.patch
@@ -0,0 +1,33 @@
+From 220e939e5cdc98452b3e5acb5a412807107c31cc Mon Sep 17 00:00:00 2001
+Message-Id: <220e939e5cdc98452b3e5acb5a412807107c31cc.1738217500.git.yann.morin@orange.com>
+In-Reply-To: <a10ce78ead5516ed1348bbcdae58160fff70b898.1738217500.git.yann.morin@orange.com>
+References: <a10ce78ead5516ed1348bbcdae58160fff70b898.1738217500.git.yann.morin@orange.com>
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Wed, 29 Jan 2025 20:10:09 -0800
+Subject: [PATCH] Fix dependency issue for autoscan.list
+
+* lib/local.mk (lib/autoscan/autoscan.list):
+Depend on lib/autoconf/autoconf.m4f, not merely on its dependencies.
+
+Upstream: https://git.savannah.gnu.org/cgit/autoconf.git/commit/?id=220e939e5cdc98452b3e5acb5a412807107c31cc
+Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
+---
+ lib/local.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/local.mk b/lib/local.mk
+index f44d629a..98a7f36a 100644
+--- a/lib/local.mk
++++ b/lib/local.mk
+@@ -130,7 +130,7 @@ lib/autoscan/autoscan.list: $(srcdir)/lib/autoscan/autoscan.pre
+ 	    -t'AN_OUTPUT:$$1: $$2		$$3' \
+ 	) | LC_ALL=C sort >>$@
+ 
+-lib/autoscan/autoscan.list: $(autoconf_m4f_dependencies) Makefile
++lib/autoscan/autoscan.list: lib/autoconf/autoconf.m4f Makefile
+ 
+ ## ----------------------------------- ##
+ ## Make Autoconf library for M4sugar.  ##
+-- 
+2.34.1
+
-- 
2.34.1

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
