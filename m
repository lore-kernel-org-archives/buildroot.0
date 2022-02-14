Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E7BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 20:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0DE060F2C;
	Mon, 14 Feb 2022 20:15:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YcnPY5dA0M2b; Mon, 14 Feb 2022 20:15:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C104B60F53;
	Mon, 14 Feb 2022 20:15:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 854CC1BF97D
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80A27404D7
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:14:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sNk8IVyfZ49v for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 20:14:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57F2A40239
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 20:14:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3326582AD4; Mon, 14 Feb 2022 20:06:42 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 14 Feb 2022 21:09:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6d5061c711fe0e64c0fef466f1221aa8e6202608
X-Git-Newrev: a715593d944ac4f64e56a6d5778374e7388af23d
X-Patchwork-Hint: ignore
Message-Id: <20220214200642.3326582AD4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/resiprocate: fix build of rend
 with gcc 11
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a715593d944ac4f64e56a6d5778374e7388af23d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure of rend with gcc 11:

/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/riscv32-buildroot-linux-gnu/include/c++/11.2.0/bits/stl_tree.h:770:15: error: static assertion failed: comparison object must be invocable as const
  770 |               is_invocable_v<const _Compare&, const _Key&, const _Key&>,
      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/ad9d89fefe1a667daa123397a072bf130bfa03a7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...x-some-issue-compiling-with-Visual-Studio.patch | 95 ++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/package/resiprocate/0001-Fix-some-issue-compiling-with-Visual-Studio.patch b/package/resiprocate/0001-Fix-some-issue-compiling-with-Visual-Studio.patch
new file mode 100644
index 0000000000..0efe0d9cfb
--- /dev/null
+++ b/package/resiprocate/0001-Fix-some-issue-compiling-with-Visual-Studio.patch
@@ -0,0 +1,95 @@
+From be76b10a50749e2e11dce8dcc38b414a7f9d8747 Mon Sep 17 00:00:00 2001
+From: Ben Walden <bwalden@redboxvoice.com>
+Date: Sat, 22 Aug 2020 23:14:11 +0100
+Subject: [PATCH] Fix some issue compiling with Visual Studio 16.7.0 and tidy
+ up Visual Studio 16 project files
+
+[Retrieved (and updated to keep only RendKa.cxx update) from:
+https://github.com/resiprocate/resiprocate/commit/be76b10a50749e2e11dce8dcc38b414a7f9d8747]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ VisualStudioReadme.htm                        |   65 +
+ contrib/GeoIP/GeoIP_12_0.vcxproj              |  550 -------
+ contrib/GeoIP/GeoIP_16_0.vcxproj              |   93 +-
+ .../db/build_windows/db_static_12_0.vcxproj   | 1260 -----------------
+ .../db/build_windows/db_static_16_0.vcxproj   |  696 +--------
+ contrib/db/dbinc/atomic.h                     |    4 +-
+ contrib/db/mp/mp_fget.c                       |    4 +-
+ contrib/db/mp/mp_mvcc.c                       |    4 +-
+ contrib/db/mp/mp_region.c                     |    4 +-
+ contrib/db/mutex/mut_method.c                 |    2 +-
+ contrib/pcre/pcre_12_0.vcxproj                |  466 ------
+ contrib/pcre/pcre_16_0.vcxproj                |  159 +--
+ contrib/popt/popt_12_0.vcxproj                |  394 ------
+ contrib/popt/popt_16_0.vcxproj                |  120 +-
+ reSIProcate_16_0.sln                          |   58 +-
+ .../queuetostream_12_0.vcxproj                |  582 --------
+ .../queuetostream_16_0.vcxproj                |  207 ++-
+ repro/repro_12_0.vcxproj                      |  825 -----------
+ repro/repro_12_0.vcxproj.filters              |   47 -
+ repro/repro_16_0.vcxproj                      |  159 ++-
+ repro/reprocmd/reprocmd_12_0.vcxproj          |  597 --------
+ repro/reprocmd/reprocmd_16_0.vcxproj          |  139 +-
+ repro/reprolib_12_0.vcxproj                   |  596 --------
+ repro/reprolib_12_0.vcxproj.filters           |  136 --
+ repro/reprolib_16_0.vcxproj                   |  132 +-
+ resip/dum/dum_12_0.vcxproj                    |  615 --------
+ resip/dum/dum_16_0.vcxproj                    |  124 +-
+ resip/dum/test/basicCall_12_0.vcxproj         |  621 --------
+ resip/dum/test/basicCall_16_0.vcxproj         |  145 +-
+ resip/dum/test/basicClient_12_0.vcxproj       |  653 ---------
+ resip/dum/test/basicClient_16_0.vcxproj       |  158 +--
+ resip/dum/test/basicMessage_12_0.vcxproj      |  615 --------
+ resip/dum/test/basicMessage_16_0.vcxproj      |  141 +-
+ resip/dum/test/basicRegister_12_0.vcxproj     |  615 --------
+ resip/dum/test/basicRegister_16_0.vcxproj     |  137 +-
+ resip/rend/RendKa.cxx                         |    2 +-
+ resip/rend/rend_12_0.vcxproj                  |  352 -----
+ resip/rend/rend_16_0.vcxproj                  |   89 +-
+ resip/stack/resiprocate_12_0.vcxproj          |  873 ------------
+ resip/stack/resiprocate_12_0.vcxproj.filters  |  351 -----
+ resip/stack/resiprocate_16_0.vcxproj          |  165 ++-
+ resip/stack/test/test_12_0.vcxproj            |  627 --------
+ resip/stack/test/test_16_0.vcxproj            |  171 ++-
+ rutil/dns/ares/ares_12_0.vcxproj              |  488 -------
+ rutil/dns/ares/ares_12_0.vcxproj.filters      |   34 -
+ rutil/dns/ares/ares_16_0.vcxproj              |  159 +--
+ rutil/rutil_12_0.vcxproj                      |  604 --------
+ rutil/rutil_16_0.vcxproj                      |  153 +-
+ 48 files changed, 1409 insertions(+), 13782 deletions(-)
+ delete mode 100644 contrib/GeoIP/GeoIP_12_0.vcxproj
+ delete mode 100644 contrib/db/build_windows/db_static_12_0.vcxproj
+ delete mode 100644 contrib/pcre/pcre_12_0.vcxproj
+ delete mode 100644 contrib/popt/popt_12_0.vcxproj
+ delete mode 100644 repro/accountingconsumers/queuetostream_12_0.vcxproj
+ delete mode 100644 repro/repro_12_0.vcxproj
+ delete mode 100644 repro/repro_12_0.vcxproj.filters
+ delete mode 100644 repro/reprocmd/reprocmd_12_0.vcxproj
+ delete mode 100644 repro/reprolib_12_0.vcxproj
+ delete mode 100644 repro/reprolib_12_0.vcxproj.filters
+ delete mode 100644 resip/dum/dum_12_0.vcxproj
+ delete mode 100644 resip/dum/test/basicCall_12_0.vcxproj
+ delete mode 100644 resip/dum/test/basicClient_12_0.vcxproj
+ delete mode 100644 resip/dum/test/basicMessage_12_0.vcxproj
+ delete mode 100644 resip/dum/test/basicRegister_12_0.vcxproj
+ delete mode 100644 resip/rend/rend_12_0.vcxproj
+ delete mode 100644 resip/stack/resiprocate_12_0.vcxproj
+ delete mode 100644 resip/stack/resiprocate_12_0.vcxproj.filters
+ delete mode 100644 resip/stack/test/test_12_0.vcxproj
+ delete mode 100644 rutil/dns/ares/ares_12_0.vcxproj
+ delete mode 100644 rutil/dns/ares/ares_12_0.vcxproj.filters
+ delete mode 100644 rutil/rutil_12_0.vcxproj
+
+diff --git a/resip/rend/RendKa.cxx b/resip/rend/RendKa.cxx
+index 8645f17636..8321ada1ee 100644
+--- a/resip/rend/RendKa.cxx
++++ b/resip/rend/RendKa.cxx
+@@ -66,7 +66,7 @@ bool operator<(const RendKaAssoc& a, const RendKaAssoc& b)
+ 
+ struct RendKaConn 
+ {
+-   bool operator() (const RendKaAssocPtr& a, const RendKaAssocPtr& b) 
++   bool operator()(const RendKaAssocPtr& a, const RendKaAssocPtr& b) const
+    {
+       return *a < *b;
+    }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
