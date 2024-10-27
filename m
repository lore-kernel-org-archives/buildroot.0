Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3790D1358A
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 22:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 292ED40530;
	Sun, 27 Oct 2024 22:26:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2MBPjJdjzBtf; Sun, 27 Oct 2024 22:26:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9090340507
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9090340507;
	Sun, 27 Oct 2024 22:26:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9899B971
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 22:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78DA5404F7
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 22:26:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rVL1Ooa6Ahjk for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 22:26:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DC46C40507
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC46C40507
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC46C40507
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 22:26:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02c6.dip0.t-ipconnect.de [91.58.2.198])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 48D2EA4C0C91;
 Sun, 27 Oct 2024 23:26:00 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48954)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t5Bhv-000000008VZ-2GOl;
 Sun, 27 Oct 2024 22:26:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 27 Oct 2024 23:25:59 +0100
Message-Id: <20241027222559.1295078-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1730067960;
 bh=ufU6FwwEtwsJWpzWU6aEkdDU4pUSXc1d3WMkck+s4ZA=;
 h=From:To:Cc:Subject:Date:From;
 b=S9VhDz1AUNF/sGeGxvjEgTB5W1CUwTShRUs1SGqZXCS7C+Wk0CQm2VIR6/26N4Ytm
 Nhy2dFYm/GurEu0CarJ+u7SXRA+JpuRhDC2JUwqFyXWWHbFJRQAsRCvwYbAvqSNOCA
 PPBpN336rgvw9D48o58X+n182a1ww2qqUpqD+HzWeijj7D0oG9MJxYbLqHl0IDJONv
 0oxnuEYfX/9k/QkVZ+Jf6add8279mTMvGHZa7XH04jG2DAgkngmAtkYXqfi376DdVo
 jv2WsiFsb6GpmwyqIAEJ06Qln0xr2q7yz3inuFmkNbM/3I3vQAJkkq7ZsuSsnYakh1
 atWExb5jROtFg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=S9VhDz1A
Subject: [Buildroot] [PATCH 1/1] package/meson: bump version to 1.6.0
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

Updated patch 0001 due to upstream PR
https://github.com/mesonbuild/meson/pull/13368

Release notes:
https://mesonbuild.com/Release-notes-for-1-4-0.html
https://mesonbuild.com/Release-notes-for-1-5-0.html
https://mesonbuild.com/Release-notes-for-1-6-0.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Let's break some builds ;)

 ...atic-libs-when-default-library-static.patch | 18 ++++++++++++++----
 package/meson/meson.hash                       |  4 ++--
 package/meson/meson.mk                         |  2 +-
 3 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch b/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch
index 9cedcd0942..55f7512e2e 100644
--- a/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch
+++ b/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch
@@ -24,6 +24,8 @@ http://autobuild.buildroot.net/results/c17/c17bbb12d9deadd64a441b36e324cfbbe8aba
 Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 [Updated for 0.57.1 - get_builtin_option() vs. get_option(OptionKey())]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+[Bernd: rebased for 1.6.0]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  mesonbuild/compilers/mixins/clike.py | 3 +++
  1 file changed, 3 insertions(+)
@@ -32,10 +34,18 @@ diff --git a/mesonbuild/compilers/mixins/clike.py b/mesonbuild/compilers/mixins/
 index 09ad837b1..b7f6b9f22 100644
 --- a/mesonbuild/compilers/mixins/clike.py
 +++ b/mesonbuild/compilers/mixins/clike.py
-@@ -978,6 +978,9 @@ class CLikeCompiler(Compiler):
-         elif env.machines[self.for_machine].is_cygwin():
-             shlibext = ['dll', 'dll.a']
-             prefixes = ['cyg'] + prefixes
+@@ -27,6 +27,7 @@
+ from ... import mlog
+ from ...linkers.linkers import GnuLikeDynamicLinkerMixin, SolarisDynamicLinker, CompCertDynamicLinker
+ from ...mesonlib import LibType
++from ...options import OptionKey
+ from .. import compilers
+ from ..compilers import CompileCheckMode
+ from .visualstudio import VisualStudioLikeCompiler
+@@ -1038,6 +1038,9 @@ class CLikeCompiler(Compiler):
+             # TI C6000 compiler can use both extensions for static or dynamic libs.
+             stlibext = ['a', 'lib']
+             shlibext = ['dll', 'so']
 +        elif env.coredata.get_option(OptionKey('default_library')) == 'static':
 +            # Linux/BSDs
 +            shlibext = ['a']
diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 150fd6d1bb..e02d878d79 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/1.3.1/meson-1.3.1.tar.gz.asc
-sha256  6020568bdede1643d4fb41e28215be38eff5d52da28ac7d125457c59e0032ad7  meson-1.3.1.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/1.6.0/meson-1.6.0.tar.gz.asc
+sha256  999b65f21c03541cf11365489c1fad22e2418bb0c3d50ca61139f2eec09d5496  meson-1.6.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 467569d28b..f36091e584 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 1.3.1
+MESON_VERSION = 1.6.0
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
