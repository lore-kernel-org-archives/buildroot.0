Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EC2CC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 21:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 294156088F;
	Tue, 13 Oct 2026 21:31:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hzORltnrT-kP; Tue, 13 Oct 2026 21:31:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C59D7608B5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791927101;
	b=B0c95lqPjIs9arf9GPpi8FfTP3qV8ix5TG/Re918Lg5Oe7RBa5FuhYRjFKxdxm2+TrdD
	 wNXpXDhsmNxgmMhZCukmtQ+bqbXl6T+o1ii8Q/lyH+U45PEXWh/FR/w7U0BpJdnPeENQH
	 W8j85JTQLgl1cv8pjUU5kCrpEgWEeWAXxg7/hhvnFb0LUezBAEmGkHhOwM86zCwhUEGZv
	 15meHvcpgnhmr9xX0+y06DlyqEVE7CGPlivK5IKAk4EftCvtUu9bzyeGa+//PdIo5ti28
	 v95kmjfQiymaRKXDXTz5bO0rO+Lu3me/KjIzOz4Ls/vFizWWJeeOHSt2Vk/XYXda4RA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791927101;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=UXM6HzlUmdWFlabjkIJQw27T+T+3Xe/JM3Vn7YOZbpQ=;
	b=BmjaqMmFFjVsaeQ6tOu46NnD0NP3W7eCUaRaBVL6gH/eeFKlRoH0YQAYsYDXHkBV8kWn
	 7bOsgmpM9a6IJWmO7mEToYRbuXmZqgjrg8weYkLKBp6RcONB0ZpnB24/VVZBxJJgjmpVO
	 iJfVKDSSe7PBpx29DV/Mg18/VgnsVZJkTGvh1vVUsYH11LKl87igMEB8yApAdhuijaGpo
	 tOqSeZXb6O312q0kaGAuCMdNhWKm1mOdZ6eEfV/QOn3nmIWT+z+qrSJerO7vx1Kmy8bZz
	 7Ii59hjaCTTIDYvplGsN2SP48qFqK6IfHFM4YUZb8J2HwDeiNG/AdNaYEQsnugyuIyg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791927101;
	bh=UXM6HzlUmdWFlabjkIJQw27T+T+3Xe/JM3Vn7YOZbpQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OlLUIQG5zHtDtZEcbr+L8ABnwCtctvZoR+bt2qdKD3sR6gid36Oes1bA0pZNn1vbk
	 77mkbymX/s68u1yqgCfW3VwMtyGHP1tKs2v3LkTGtMd0iH3BxZaTqXJucrTIpJIUoS
	 9oSx0HSzYhsKifsnq1T7Q32J0qzsGUbfAa9zOt9lN/2W9DXJeNTlAHaAMubWZoBrtZ
	 P2yYZ7NnviR0nh/4XMpCxnponz6SWLlHhBs/4CK84ObmOz7WLMXJ0oOathm0rn49gd
	 PwIBGDUwkvV80FKN3NnylDvHhGQl1Ijoj5/8yFRv9KE3OLxUbY6vLu8CVgkUJQ8VND
	 sGTjv/QoqMBAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C59D7608B5;
	Tue, 13 Oct 2026 21:31:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C1C6B788
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3B2B807F2
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:31:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pWTOGAncZxLn for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 21:31:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CFDA080689
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791927094;
 b=MpHFbz7a/1gUSYX3TrWI+loo9AWypMMYsqkmJ8q49k4GzuKT0QVAL/7UkWPuGYZKApQT
 HCmMQzu1FbVn4vrkHvJpBpWQMnu1PBJg3ywqVbjs8leLnqr4mcEORUXvQ4vRqNaMPEAcT
 4MDQFjipzLE6IdQaWKC63QB0HnKjCY4RU1pZwlnxElKthmCoNzFMcyqWMir6Sjdp+gTft
 iqhgjXTDphtzDDd+FW0fYYZD3jz92ZbtTyMJu2WzyiuLjM0jxn9RvzJztWkn3Z6sx3acb
 wT/PUWlIsf9QFS8cTYeMhU16IDkHbR0W8PoMyBxbD9h6YebLZZKvbMgMxvsk++UpjdA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791927094;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=C7Lc78lzmYNbWDt+rAj3h5soDv9cPXaJv2XerbUeunA=;
 b=gyFRa+95jqCNIrVhsBHtFhRX5zjukFZCyyCpsCq+bPRBdLxFuN9Wjey3kXydSpWvz3bo
 Ivgk+uJr4zBcOiho7ugS6MthMjxk24ffznsvsuAM2Tf7Nb3UJaDvGP0stmo/pr4Mq1edD
 COctEXYQzUE4DYgIHVO+PwAZt44QlxwS7qn2/WFDiHyMoyEYF4u9LLATfS8RpPo1y0jUX
 ULtPzC5281DDl8isF3GILCoZZ4SKCmVcE19XjpQuirgDmV+rhn7ppE8lle3JzHPCst2Ml
 /l9Ha/w8UY0ezV9tCkagOAYHnyO4bFNE6zBPOFVxqCfmbSMsufG09csRIckFQO5OXyA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFDA080689
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:31:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 014C795B9A; Tue, 13 Oct 2026 21:30:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 23:28:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 42a336e15f1e65ee988c9036b8844bbd73ea4a49
X-Git-Newrev: 728fcc8abb5e4226cf3b4c9c349c12154c27306b
X-Patchwork-Hint: ignore
Message-Id: <20261013213015.014C795B9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-rtslib-fb: bump to version
 2.2.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/728fcc8abb5e4226cf3b4c9c349c12154c27306b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Switch to hatchling with hatch-vcs and use the PyPI source distribution,
which includes the version metadata needed by hatch-vcs.

Restore the compatibility symlink omitted from the PyPI archive so the
wheel continues to provide the rtslib_fb module.

Replace the six runtime dependency with pyudev and propagate its
libudev requirement to targetcli-fb.

Update the license hash for the removal of a trailing blank line:
https://github.com/open-iscsi/rtslib-fb/commit/c44657500a66a5f95b3a43d1c5b8dd114674c5c6

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-rtslib-fb/Config.in             |  6 +++++-
 package/python-rtslib-fb/python-rtslib-fb.hash |  8 +++++---
 package/python-rtslib-fb/python-rtslib-fb.mk   | 16 +++++++++++-----
 package/targetcli-fb/Config.in                 |  4 ++++
 4 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/package/python-rtslib-fb/Config.in b/package/python-rtslib-fb/Config.in
index f4083340e6..ef7bb170ed 100644
--- a/package/python-rtslib-fb/Config.in
+++ b/package/python-rtslib-fb/Config.in
@@ -1,9 +1,13 @@
 config BR2_PACKAGE_PYTHON_RTSLIB_FB
 	bool "python-rtslib-fb"
-	select BR2_PACKAGE_PYTHON_SIX
+	depends on BR2_PACKAGE_HAS_LIBUDEV # python-pyudev
+	select BR2_PACKAGE_PYTHON_PYUDEV # runtime
 	help
 	  rtslib-fb is an object-based Python library for configuring
 	  the LIO generic SCSI target, present in 3.x Linux kernel
 	  versions.
 
 	  https://github.com/open-iscsi/rtslib-fb
+
+comment "python-rtslib-fb needs libudev"
+	depends on !BR2_PACKAGE_HAS_LIBUDEV
diff --git a/package/python-rtslib-fb/python-rtslib-fb.hash b/package/python-rtslib-fb/python-rtslib-fb.hash
index 39c390edb2..1cfbb3fc36 100644
--- a/package/python-rtslib-fb/python-rtslib-fb.hash
+++ b/package/python-rtslib-fb/python-rtslib-fb.hash
@@ -1,3 +1,5 @@
-# locally computed
-sha256  ac15c113d09209c7b0d14d94a12ed88205a7c2feadd1096f573049fd737f7e74  python-rtslib-fb-2.1.76.tar.gz
-sha256  5df2a0d87d6c562f0ea11c688ac52532aa28d744cabc7994ff0537f64b3b3320  COPYING
+# md5, sha256 from https://pypi.org/pypi/rtslib-fb/json
+md5  1ff112fb9df8ededcf5655f6e1174652  rtslib_fb-2.2.4.tar.gz
+sha256  0084daa651a72b1cacd0eaaf162725df69b991f501cffe87e0f67e99224a7267  rtslib_fb-2.2.4.tar.gz
+# Locally computed sha256 checksums
+sha256  09e8a9bcec8067104652c168685ab0931e7868f9c8284b66f5ae6edae5f1130b  COPYING
diff --git a/package/python-rtslib-fb/python-rtslib-fb.mk b/package/python-rtslib-fb/python-rtslib-fb.mk
index 6396d26a3f..707c091cef 100644
--- a/package/python-rtslib-fb/python-rtslib-fb.mk
+++ b/package/python-rtslib-fb/python-rtslib-fb.mk
@@ -6,12 +6,18 @@
 
 # When upgrading the version, be sure to also upgrade
 # python-configshell-fb and targetcli-fb at the same time.
-PYTHON_RTSLIB_FB_VERSION = 2.1.76
-# Do not switch site to PyPI: it does not contain the latest version.
-PYTHON_RTSLIB_FB_SITE = $(call github,open-iscsi,rtslib-fb,v$(PYTHON_RTSLIB_FB_VERSION))
+PYTHON_RTSLIB_FB_VERSION = 2.2.4
+PYTHON_RTSLIB_FB_SOURCE = rtslib_fb-$(PYTHON_RTSLIB_FB_VERSION).tar.gz
+PYTHON_RTSLIB_FB_SITE = https://files.pythonhosted.org/packages/79/32/030eaf69d4f19cac2345a6fab1f18118355f7c9c83d6d84f758b00bbd3d9
 PYTHON_RTSLIB_FB_LICENSE = Apache-2.0
 PYTHON_RTSLIB_FB_LICENSE_FILES = COPYING
-PYTHON_RTSLIB_FB_SETUP_TYPE = setuptools
-PYTHON_RTSLIB_FB_DEPENDENCIES = python-six
+PYTHON_RTSLIB_FB_SETUP_TYPE = hatch
+PYTHON_RTSLIB_FB_DEPENDENCIES = host-python-hatch-vcs
+
+# The PyPI archive omits the compatibility symlink included in Git.
+define PYTHON_RTSLIB_FB_RESTORE_COMPAT_SYMLINK
+	ln -s rtslib $(@D)/rtslib_fb
+endef
+PYTHON_RTSLIB_FB_POST_EXTRACT_HOOKS += PYTHON_RTSLIB_FB_RESTORE_COMPAT_SYMLINK
 
 $(eval $(python-package))
diff --git a/package/targetcli-fb/Config.in b/package/targetcli-fb/Config.in
index eb7528fbea..4455a6ce31 100644
--- a/package/targetcli-fb/Config.in
+++ b/package/targetcli-fb/Config.in
@@ -14,6 +14,7 @@ config BR2_PACKAGE_TARGETCLI_FB
 	depends on BR2_HOST_GCC_AT_LEAST_8 # python-gobject -> gobject-introspection
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # python-gobject -> gobject-introspection
 	depends on BR2_TOOLCHAIN_USES_GLIBC # python-gobject -> gobject-introspection
+	depends on BR2_PACKAGE_HAS_LIBUDEV # python-rtslib-fb -> python-pyudev
 	select BR2_PACKAGE_PYTHON_CONFIGSHELL_FB
 	select BR2_PACKAGE_PYTHON_RTSLIB_FB
 	select BR2_PACKAGE_PYTHON_SIX
@@ -24,3 +25,6 @@ config BR2_PACKAGE_TARGETCLI_FB
 	  versions.
 
 	  https://github.com/open-iscsi/targetcli-fb
+
+comment "targetcli-fb needs libudev"
+	depends on !BR2_PACKAGE_HAS_LIBUDEV
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
