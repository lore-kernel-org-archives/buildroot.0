Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDC1C19F2D
	for <buildroot@archiver.kernel.org>; Sat, 13 Aug 2022 22:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1ACA283E91;
	Sat, 13 Aug 2022 22:26:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1ACA283E91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yGermvJOwB1v; Sat, 13 Aug 2022 22:26:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1AC083E89;
	Sat, 13 Aug 2022 22:26:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1AC083E89
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 619EB1BF5A4
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 22:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48F47415E9
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 22:26:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48F47415E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ER7j9nv7Ex98 for <buildroot@lists.busybox.net>;
 Sat, 13 Aug 2022 22:26:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 449FC415D0
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 22:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 449FC415D0
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 87C79873B0; Sat, 13 Aug 2022 22:11:51 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 00:26:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2ce6aaee9dee1fdc79470a49d1c7a9299484b384
X-Git-Newrev: 7da270fbb5d29643f06162ea75b274b869d46335
X-Patchwork-Hint: ignore
Message-Id: <20220813221151.87C79873B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lshw: fix build with gcc 4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=7da270fbb5d29643f06162ea75b274b869d46335
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc 4.8 raised since commit
72a009fa98a37825624f70dc2a1cf825a5999a0a:

hw.cc: In member function 'long long int hw::value::asInteger() const':
hw.cc:2462:36: error: 'stoll' was not declared in this scope
       return stoll(This->s, NULL, 0);
                                    ^

Fixes:
 - http://autobuild.buildroot.org/results/162e438e3f9aab9310fdbc3cf7529144ce7cb50e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...mpile-error-when-g-version-is-less-than-5.patch | 65 ++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/package/lshw/0001-solve-Compile-error-when-g-version-is-less-than-5.patch b/package/lshw/0001-solve-Compile-error-when-g-version-is-less-than-5.patch
new file mode 100644
index 0000000000..f15c8bc52c
--- /dev/null
+++ b/package/lshw/0001-solve-Compile-error-when-g-version-is-less-than-5.patch
@@ -0,0 +1,65 @@
+From 383c80bf486f806438bb11a9c9a9567407cd47ab Mon Sep 17 00:00:00 2001
+From: "E.V.Acacia" <624758472@qq.com>
+Date: Fri, 3 Sep 2021 14:19:37 +0800
+Subject: [PATCH] solve: Compile error when gcc version is less than 5
+
+[Retrieved from:
+https://github.com/lyonel/lshw/pull/70/commits/383c80bf486f806438bb11a9c9a9567407cd47ab]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/core/cpuinfo.cc | 8 ++++----
+ src/core/hw.cc      | 2 +-
+ src/core/spd.cc     | 4 ++--
+ 3 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/src/core/cpuinfo.cc b/src/core/cpuinfo.cc
+index 9e41a421..ed1c4164 100644
+--- a/src/core/cpuinfo.cc
++++ b/src/core/cpuinfo.cc
+@@ -465,13 +465,13 @@ string value)
+     if (id == "model name")
+       cpu->setProduct(value);
+     if (id == "microcode")
+-      cpu->setConfig(id, stoll(value, NULL, 0));
++      cpu->setConfig(id, strtoll(value.c_str(), NULL, 0));
+     if (id == "cpu family")
+-      cpu->addHint(id, stoll(value, NULL, 0));
++      cpu->addHint(id, strtoll(value.c_str(), NULL, 0));
+     if (id == "model")
+-      cpu->addHint(id, stoll(value, NULL, 0));
++      cpu->addHint(id, strtoll(value.c_str(), NULL, 0));
+     if (id == "stepping")
+-      cpu->addHint(id, stoll(value, NULL, 0));
++      cpu->addHint(id, strtoll(value.c_str(), NULL, 0));
+ 
+     family = cpu->getHint("cpu family");
+     model = cpu->getHint("model");
+diff --git a/src/core/hw.cc b/src/core/hw.cc
+index 1c1dad46..b266a863 100644
+--- a/src/core/hw.cc
++++ b/src/core/hw.cc
+@@ -2459,7 +2459,7 @@ long long value::asInteger() const
+   switch(This->type)
+   {
+     case hw::text:
+-      return stoll(This->s, NULL, 0);
++      return strtoll(This->s.c_str(), NULL, 0);
+     case hw::integer:
+       return This->ll;
+     case hw::boolean:
+diff --git a/src/core/spd.cc b/src/core/spd.cc
+index a304d061..2ad66b82 100644
+--- a/src/core/spd.cc
++++ b/src/core/spd.cc
+@@ -195,9 +195,9 @@ static bool scan_eeproms(hwNode & memory)
+   {
+     if (scan_eeprom(memory, namelist[i]->d_name))
+       current_bank++;
+-    free(namelist[i]);
++    delete(namelist[i]);
+   }
+-  free(namelist);
++  delete(namelist);
+ 
+   return true;
+ }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
