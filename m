Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8F1CA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 19:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6575C60624;
	Tue,  6 Oct 2026 19:18:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zNHRF3WiTw0t; Tue,  6 Oct 2026 19:18:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 77613607F0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791314324;
	b=AzuS6YK7lmp5JmUmZdJ2M/uhA7kos/QmzboqfBhFnOLeXbD6UX/55GHAckkOQ3qspuCZ
	 ncsMwZC3L/x7BoG0FqyRJRzL15e2kQSHFDYFC3KkpsrXE0dn3H576sy3P73SVRNDPLk4T
	 kwW94mUT9T3K6l85tClHn0cQLTRjncoPg/JuibiVR3mU2y8ixptIjiQbHtg36JTlMnEny
	 fReHz2/BMlU1Cgo7QuN+nZ6U+MwL01jbGaESG3mkSuvqiWBuWmd3C3EFmxXcCFrG6jbKc
	 KayQ8b8CdrtfMua3l5jzj+kdRl5yvQl9PSfzjK9qeBI2i2HDlgG07SFjmBAbQn0uTJg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791314324;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Gl5678MccD2gTixYoWNwRdwj/6SrRhLq3VWO5JaueyU=;
	b=aoUSPepMXr9u6hE9fFZa3/wsL04VlP8SBW6puOApYrwpNNMRwl9nRLzA/sKFVWnibU3u
	 HdRbvg6pe4scofktal6ZDBz74X6wsHltwP1gC4VarYJBHJhmcjdKAagVI7Q3qLCH9Xdo4
	 mNT4n5GAE4eEFJnlud0MqHSz2NL4QotC03RaBuazjagocNfnSHXsEa/qJpsEwGKuaOEEe
	 Wrm02Y4ArIetlzTyNMFehHyrYndOrbWnu7hCq09yKuQURM5uYUGz5LyZwTcgXJ6pPKRxA
	 zuC7OrxNi7m7TZTN2ePo1DPFhNl7JZcmBJs7b1W5QqPRAS2xQn1J5tG4S9lDAM9FZew==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791314324;
	bh=Gl5678MccD2gTixYoWNwRdwj/6SrRhLq3VWO5JaueyU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LoxjaS0zzX2sisot0kGnoZa54NUYT3P6jrboBza2O3FcfXDyzsj/txVymrNlB25H7
	 240IyAz/JLaCTqddBQTL8o8zURNYJiEQ/yTZvWwW/dhTJWKV1qxyCzvMrcD8wWIr31
	 gfNikXXP5NI4AvoY1oc1Sv19ux/4bK0eYmLx7/lVLnTkRakEhYZ7ayCnaGmvYAAbp5
	 CISVytOikRKaLIU0BRBO71cC5i2ZW+mWBBTc8OnBgvkHNop/MDsvOAtmznBr8hOwlN
	 zsnOHoMOmqZ7fd0gPzNefSb5OLTjC085167isiIlcO5I0WAXnxqm9PAo1AsFgh6HDi
	 ZPAv0PTK3htuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77613607F0;
	Tue,  6 Oct 2026 19:18:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E42D317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 19:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F410B402DC
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 19:17:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TrdSuRsyEpY9 for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 19:17:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 15BCC402D8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791314252;
 b=s9s/pjmKisbSAlQjBQtHWxE/Tv9iRjKI0rMTL/yPQo4jDtxFKOhraBXHlcIeZQPVcDef
 OzrzqeDR1CSaNKZzMMz4zi7gfjddehIjUq37v94aqXuho2YpaG911gbZhSrnDu+Qhc+T1
 9JH0iiDodzSGhWCKAPDx2JdZ3jh7sIBrHrHooeS9ckXaihigotQqSZI+/cjWI0qFB9Fe1
 nKPsiSt66enKhi/jvC19XwVvF65CbM/w4/5ipdRXLiMctmjfJH5eedEwtqsPX+g+8VYMw
 9/gvibC4YF/+XBdkx9DKWb/yrlSugHA0MKnqtGupFJTuUuZ0Evw9jIvy1C0y+YhNKQA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791314252;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Zm9bdsPq/LAhCLeLS410nxS9RBHeoWpixNq0b5QSMl8=;
 b=IAl9sYMiCYN6RjYek/MPVe+ie/55GP4n+pZ7UIY/QzEHEoZdr22jV+3r7ED4gspJTEwt
 +/dVYtUqgGT2riYMQPE1XlvGTp+dRu2aDj5nvZhapkX3PT+1FLEQoPzTIIFCyjN6HgnRk
 zF38uRuL80kueYktvVyTeWcuUyA8mPx5SOEYnjiIwYyFOWrWJn3KZhW/TYQDO7TpcAyCM
 6Y/dwlLIZTq4itjIlHhNSiMH7stEu9uQMYTpGXfQXYEcQqgc703XKWRHbf7NBI9jdg224
 gMbrIwhk/CzZJqbRBuDgFZ1kGiHykiK8DLyLI+nlPHfEgbGrEJsBasDfFIL4cDQuowA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15BCC402D8
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 19:17:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A7BB38DA20; Tue,  6 Oct 2026 19:16:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Oct 2026 21:07:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c1b063571bcf688cb34ad601cad178d21771db21
X-Git-Newrev: 6262b9c5bdd50dac61aa68dd980c4e585c2ff60a
X-Patchwork-Hint: ignore
Message-Id: <20261006191615.A7BB38DA20@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gzip: add upstream patch to fix
 build for aarch64
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6262b9c5bdd50dac61aa68dd980c4e585c2ff60a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since Buildroot commit [1] (package/gzip: bump version to 1.15),
gzip fails at build time for Aarch64 with the error:

  In file included from gzip.c:61:
  gzip.h:120:21: error: expected ')' before '+' token
    120 | #  define head (prev+WSIZE)  /* hash head (see deflate.c) */
        |                     ^

The issue was introduced by upstream commit [2], included in
gzip 1.15.

This commit fixes the issue by adding the patch
0001-build-avoid-failure-to-build-on-linux-aarch64.patch
from upstream commit [3], not yet included in a
gzip release.

Fixes:
https://autobuild.buildroot.org/results/3795b23407021e9fbaaf44c9319085c30d7511c1/

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/fe21a5fe307239c842f5a095fe4f8e53c5c3e352
[2] https://cgit.git.savannah.gnu.org/cgit/gzip.git/commit/?id=ede0a8888a4d3d0750e1651e01f198e2faab5d59
[3] https://cgit.git.savannah.gnu.org/cgit/gzip.git/commit/?id=b4ed8e73401968bcad749afb0e636dd3ec205ca7

Reported-by: Waldemar Brodkorb <wbx@openadk.org>
Link: https://lore.kernel.org/buildroot/asJEBMQpD2FYJql2@waldemar-brodkorb.de/
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[Julien: add info in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...d-avoid-failure-to-build-on-linux-aarch64.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/gzip/0001-build-avoid-failure-to-build-on-linux-aarch64.patch b/package/gzip/0001-build-avoid-failure-to-build-on-linux-aarch64.patch
new file mode 100644
index 0000000000..53acd7294b
--- /dev/null
+++ b/package/gzip/0001-build-avoid-failure-to-build-on-linux-aarch64.patch
@@ -0,0 +1,43 @@
+From 56b57a937db747c3f94746379c4d95d8a787bde4 Mon Sep 17 00:00:00 2001
+From: Jim Meyering <meyering@meta.com>
+Date: Mon, 21 Sep 2026 01:42:18 -0700
+Subject: [PATCH] build: avoid failure to build on linux aarch64
+
+* gzip.c: Include gzip.h only after all system headers.
+gzip.h's "head" definition affected a subsequent signal.h-
+included system struct member named "head".
+Reported by Adam Sampson in https://bugs.gnu.org/81904
+
+Upstream: https://cgit.git.savannah.gnu.org/cgit/gzip.git/commit/?id=b4ed8e73401968bcad749afb0e636dd3ec205ca7
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ gzip.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/gzip.c b/gzip.c
+index 220f6fc..6c0af7f 100644
+--- a/gzip.c
++++ b/gzip.c
+@@ -58,7 +58,6 @@ static char const license_msg[] =
+ 
+ #include "tailor.h"
+ 
+-#include "gzip.h"
+ #include "lzw.h"
+ #include "revision.h"
+ #include "version.h"
+@@ -99,6 +98,11 @@ static char const license_msg[] =
+ #  include <utimens.h>
+ #endif
+ 
++/* Include this only after all system headers. Otherwise, its definition
++   of "head" conflicts with member names in linux-headers 7.2.6's
++   asm/sigcontext.h pulled in via <signal.h>.  */
++#include "gzip.h"
++
+ #ifndef MAX_PATH_LEN
+ #  define MAX_PATH_LEN   1024 /* max pathname length */
+ #endif
+-- 
+2.55.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
