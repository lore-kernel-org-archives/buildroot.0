Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C28D43341
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A3D8410DB;
	Thu, 11 Dec 2025 19:29:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qLtusG0PCMfZ; Thu, 11 Dec 2025 19:29:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4684D410EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481397;
	bh=tW9njAM7xgEGfpT0L/58dF19dKkZ9GnWlxgp5kKbSHA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QSmYeCYZNov1xhEnUrkHFizKhivxChnNGunkp87KgDaLksPz+it4AqrowKdaIXAPq
	 noj3brEFduboCHeEutme0S/9Q3neVaZWbToj7itua4ChocWGQGHWSid2VEBkue6i0/
	 +0NXtZWRSh9IsB09KIGw+RviHwE0L7ZareKgjP/AQrFDDygScHnM7FFGuUDJmDw9ab
	 RtvtYwV+u+3KNofGzvEToBxGSMlMEfOihe8jEJ3Lrt3G1ZIIs0ifTsd9OK+QKiKpIr
	 eStl9DU3XsQ/ESNWMVHPfkZr4EWInIyhWyktc2TivgUmTRbIOXkxQwiowVRAOBJXQh
	 ije3V6yn8r4VA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4684D410EA;
	Thu, 11 Dec 2025 19:29:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 09188E7
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFC1D80E44
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zjcwU-SmbZe4 for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E94AC80D2A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E94AC80D2A
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DAA4386BE5; Thu, 11 Dec 2025 19:29:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 10:56:08 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 105d8f9f2e91f3e49e7d0d0cbe6936ba2aedecc3
X-Git-Newrev: c6cec9f84a5c552d092004131047a26f6e281f0e
X-Patchwork-Hint: ignore
Message-Id: <20251211192953.DAA4386BE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/woff2: fix build
 with newer gcc
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c6cec9f84a5c552d092004131047a26f6e281f0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Fixes a build error not yet seen by the autobuilders due to other
packages failing before. Seen with defconfig:
https://autobuild.buildroot.net/results/ebf/ebf9a81f7e225ecdab20bbad8ad8daa136fddb46/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 32490ae99f9cfd2ded0b150071b28908419c7244)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...ff2-output.h-add-missing-stdint.h-include.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/woff2/0002-include-woff2-output.h-add-missing-stdint.h-include.patch b/package/woff2/0002-include-woff2-output.h-add-missing-stdint.h-include.patch
new file mode 100644
index 0000000000..a79b414a4c
--- /dev/null
+++ b/package/woff2/0002-include-woff2-output.h-add-missing-stdint.h-include.patch
@@ -0,0 +1,41 @@
+From 08ece7871775c0d7bf4fdff64b961cdc256adf6c Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyich@gmail.com>
+Date: Fri, 2 Aug 2024 22:12:03 +0100
+Subject: [PATCH] include/woff2/output.h: add missing <stdint.h> include
+
+Without the change `woff2` build fails on upcoming `gcc-15` as:
+
+    In file included from src/woff2_out.cc:9:
+    include/woff2/output.h:73:25: error: expected ')' before '*' token
+       73 |   WOFF2MemoryOut(uint8_t* buf, size_t buf_size);
+          |                 ~       ^
+          |                         )
+    include/woff2/output.h:79:3: error: 'uint8_t' does not name a type
+       79 |   uint8_t* buf_;
+          |   ^~~~~~~
+    include/woff2/output.h:16:1: note: 'uint8_t' is defined in header '<cstdint>';
+      this is probably fixable by adding '#include <cstdint>'
+       15 | #include <string>
+      +++ |+#include <cstdint>
+       16 |
+
+Upstream: https://github.com/google/woff2/pull/176
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ include/woff2/output.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/include/woff2/output.h b/include/woff2/output.h
+index dc78ccf..b12d538 100644
+--- a/include/woff2/output.h
++++ b/include/woff2/output.h
+@@ -9,6 +9,8 @@
+ #ifndef WOFF2_WOFF2_OUT_H_
+ #define WOFF2_WOFF2_OUT_H_
+ 
++#include <stdint.h>
++
+ #include <algorithm>
+ #include <cstring>
+ #include <memory>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
