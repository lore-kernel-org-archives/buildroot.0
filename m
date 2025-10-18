Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C46CCD193
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 16:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47EF960B5E;
	Sat, 18 Oct 2025 16:13:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6-CmE9sGPk9s; Sat, 18 Oct 2025 16:13:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6861660BD5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6861660BD5;
	Sat, 18 Oct 2025 16:13:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B26111CD
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 16:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9933C40D9C
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 16:13:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Zg8MA15eTtR for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 16:13:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E715D40D52
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E715D40D52
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 16:13:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DFC53874A1; Sat, 18 Oct 2025 16:13:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 18 Oct 2025 18:01:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 106b3d43a44fb126d4bd7ff6828110e85e3eca22
X-Git-Newrev: c8923662cc7e1f0a1d30d0926f979c21d36aa9df
X-Patchwork-Hint: ignore
Message-Id: <20251018161320.DFC53874A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ledmon: add upstream patch to fix
 build w/ gcc-14
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8445841524281237107=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8445841524281237107==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c8923662cc7e1f0a1d30d0926f979c21d36aa9df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an upstream patch to fix a build issue related to uint64_t:

utils.c: In function ‘get_uint64’:
utils.c:118:18: error: passing argument 1 of ‘str_toul’ from incompatible pointer type [-Wincompatible-pointer-types]
  118 |         str_toul(&defval, p, NULL, 16);
      |                  ^~~~~~~
      |                  |
      |                  uint64_t * {aka long long unsigned int *}
In file included from utils.c:48:
utils.h:412:29: note: expected ‘long unsigned int *’ but argument is of type ‘uint64_t *’ {aka ‘long long unsigned int *’}

Fixes:

  https://autobuild.buildroot.org/results/51af1d7bf71061f22d49213951a5f6a9565710c3/

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ledmon/0003-Correct-get_uint64.patch | 43 ++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/ledmon/0003-Correct-get_uint64.patch b/package/ledmon/0003-Correct-get_uint64.patch
new file mode 100644
index 0000000000..2db4c04a6e
--- /dev/null
+++ b/package/ledmon/0003-Correct-get_uint64.patch
@@ -0,0 +1,43 @@
+From ed747ac3540cb38797f56533f9f51f5627e6b994 Mon Sep 17 00:00:00 2001
+From: Tony Asleson <tasleson@redhat.com>
+Date: Wed, 21 Aug 2024 12:27:28 -0500
+Subject: [PATCH] Correct get_uint64
+
+For large integer values, the existing implementation will be
+incorrect.
+
+The current implementation of converting strings to integer values
+uses a signed integer for the intermediate conversion and performs
+a range check. Since any value in an unsigned 64-bit integer is valid,
+the range check seems unnecessary. To mimic the same code path, we would
+need a larger integer type.
+
+Signed-off-by: Tony Asleson <tasleson@redhat.com>
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://github.com/intel/ledmon/commit/ed747ac3540cb38797f56533f9f51f5627e6b994
+---
+ src/lib/utils.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/lib/utils.c b/src/lib/utils.c
+index a7936c69b242..a6ee29ba7f22 100644
+--- a/src/lib/utils.c
++++ b/src/lib/utils.c
+@@ -98,8 +98,12 @@ uint64_t get_uint64(const char *path, uint64_t defval, const char *name)
+ 	if (!p)
+ 		return defval;
+ 
+-	str_toul(&defval, p, NULL, 16);
+-	return defval;
++	errno = 0;
++	uint64_t t = strtoull(p, NULL, 16);
++
++	if (errno)
++		return defval;
++	return t;
+ }
+ 
+ int get_int(const char *path, int defval, const char *name)
+-- 
+2.43.0
+

--===============8445841524281237107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8445841524281237107==--
