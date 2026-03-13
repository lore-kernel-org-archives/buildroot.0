Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15D4107BCF8
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 07:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5744B60EF9;
	Sat, 14 Mar 2026 07:49:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Igps46gclFg9; Sat, 14 Mar 2026 07:49:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60C9960F17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773474585;
	bh=l8EaKM7eGAPqqGIWg4AZmoBChM2sj8Xsz3xl6SFx/lI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cjPo145B3xzvIOQJXFg16sWj4L0BhvYb9jYL5fV4VgOovdCZFM3ffgRLURRXier17
	 K7WulpGOldVclZb/m8HW/9Iz80eVeBkv4BL4Bi1e2x4g+ASJ1ZwvY7T9XZlj6M7/HD
	 MGHlhwm9XYS/g9u2pFBSwqPncy+vIuwMeHJcBwrsmuTH/78JK6t8llSSQpjGlVKJrZ
	 kR798y7CjMgxhbZ4LtKXS8ySRSKAfx1Yc5cWcLM0FU4Zoly8lH8ZcXL/uuCjImxL1k
	 Hr/pfHWFyPRJEnXt3GnDnBPvMMQxo+QJ1PKb4yq5cOpgLX93Mn0YVId29ds5jKs8Y8
	 3xNK6S12e72Jg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60C9960F17;
	Sat, 14 Mar 2026 07:49:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E5F8201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA41560EF3
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vASsjaLbY014 for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 07:49:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5A2060EF4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5A2060EF4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 24F6786102; Sat, 14 Mar 2026 07:49:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 16:11:29 +0100
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 254712b12a862887a7c6c73540d102fc29943e1b
X-Git-Newrev: a3fa3e9cd79fcf1f4bb1706341d689ba72cbc7af
X-Patchwork-Hint: ignore
Message-Id: <20260314074936.24F6786102@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/faketime: fix
 host build with glibc 2.43
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a3fa3e9cd79fcf1f4bb1706341d689ba72cbc7af
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Fixes:
https://autobuild.buildroot.net/results/911/9112933e2560b155a9c61f321874ec245b62b2a5/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 088c3602fdac3854e9949e51ada99f1443f4f69a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...onst-qualifiers-to-fix-build-with-ISO-C23.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/faketime/0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch b/package/faketime/0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch
new file mode 100644
index 0000000000..ce84d40699
--- /dev/null
+++ b/package/faketime/0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch
@@ -0,0 +1,39 @@
+From dbe865dfdba0145d993d70b7fd4ec88b2f47554b Mon Sep 17 00:00:00 2001
+From: Tomas Korbar <tkorbar@redhat.com>
+Date: Mon, 15 Dec 2025 11:03:21 +0100
+Subject: [PATCH] Add const qualifiers to fix build with ISO C23
+
+Fix https://github.com/wolfcw/libfaketime/issues/524
+
+Upstream: https://github.com/wolfcw/libfaketime/commit/dbe865dfdba0145d993d70b7fd4ec88b2f47554b
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/libfaketime.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/libfaketime.c b/src/libfaketime.c
+index ef1dca9..02839c8 100644
+--- a/src/libfaketime.c
++++ b/src/libfaketime.c
+@@ -2666,7 +2666,7 @@ int timespec_get(struct timespec *ts, int base)
+ static void parse_ft_string(const char *user_faked_time)
+ {
+   struct tm user_faked_time_tm;
+-  char * tmp_time_fmt;
++  const char * tmp_time_fmt;
+   char * nstime_str;
+ 
+   if (!strncmp(user_faked_time, user_faked_time_saved, BUFFERLEN))
+@@ -3338,7 +3338,7 @@ static void prepare_config_contents(char *contents)
+ bool str_array_contains(const char *haystack, const char *needle)
+ {
+   size_t needle_len = strlen(needle);
+-  char *pos = strstr(haystack, needle);
++  const char *pos = strstr(haystack, needle);
+   while (pos) {
+     if (pos == haystack || *(pos - 1) == ',') {
+       char nextc = *(pos + needle_len);
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
