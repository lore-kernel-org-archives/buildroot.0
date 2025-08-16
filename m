Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FAFCA0EE6
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 20:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC2286154C;
	Sat, 16 Aug 2025 20:50:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J_GlsxZ3QyA7; Sat, 16 Aug 2025 20:50:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 238F361540
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 238F361540;
	Sat, 16 Aug 2025 20:50:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 182D9196
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1F7040EA2
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:50:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ytO5PDvDhvA5 for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 20:50:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 538C040E3D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 538C040E3D
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:50:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 446DE87671; Sat, 16 Aug 2025 20:50:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 16 Aug 2025 22:49:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c0bf3da45b4feb9d849f79743cfc3e11e70290c7
X-Git-Newrev: 2eb72e76663a00f1f61cef513c31508d8d3236c2
X-Patchwork-Hint: ignore
Message-Id: <20250816205053.446DE87671@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/prboom: fix build w/ gcc-15
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
Content-Type: multipart/mixed; boundary="===============5360154266479367198=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5360154266479367198==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2eb72e76663a00f1f61cef513c31508d8d3236c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch force the usage of `-std=gnu18` for GCC15 toolchains to fix
the following issues:

- The boolean issue with C23

```
In file included from ../../src/i_sound.h:38,
                 from i_sound.c:58:
../../src/doomtype.h:48:15: error: cannot use keyword ‘false’ as enumeration constant
   48 | typedef enum {false, true} boolean;
      |               ^~~~~
../../src/doomtype.h:48:15: note: ‘false’ is a keyword with ‘-std=c23’ onwards
```

- The usage of `usleep` & `struct timezone` require usage of GNU
  extensions.

```
i_system.c:58:3: error: implicit declaration of function ‘usleep’; did you mean ‘sleep’? [-Wimplicit-function-declaration]
   58 |   usleep(usecs);
      |   ^~~~~~
      |   sleep
i_system.c: In function ‘I_GetTime_RealTime’:
i_system.c:78:19: error: storage size of ‘tz’ isn’t known
   78 |   struct timezone tz;
      |                   ^~
i_system.c: In function ‘I_GetRandomTimeSeed’:
i_system.c:105:19: error: storage size of ‘tz’ isn’t known
  105 |   struct timezone tz;
      |                   ^~
```

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/prboom/prboom.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/prboom/prboom.mk b/package/prboom/prboom.mk
index fc440e5cf8..ab9ab09913 100644
--- a/package/prboom/prboom.mk
+++ b/package/prboom/prboom.mk
@@ -18,6 +18,10 @@ ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 PRBOOM_CFLAGS += -O0
 endif
 
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_15),y)
+PRBOOM_CFLAGS += -std=gnu18
+endif
+
 PRBOOM_CONF_ENV += CFLAGS="$(PRBOOM_CFLAGS)"
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)

--===============5360154266479367198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5360154266479367198==--
