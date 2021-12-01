Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34786C433F5
	for <buildroot@archiver.kernel.org>; Wed,  1 Dec 2021 07:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83F52400A4;
	Wed,  1 Dec 2021 07:00:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rDYB1oWQUSPk; Wed,  1 Dec 2021 07:00:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7DF8F400C6;
	Wed,  1 Dec 2021 07:00:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B6CF31BF23C
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 06:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A641B606A2
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 06:59:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aOzK3WUxppBR for <buildroot@lists.busybox.net>;
 Wed,  1 Dec 2021 06:59:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A53F460619
 for <buildroot@buildroot.org>; Wed,  1 Dec 2021 06:59:57 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id s13so49932633wrb.3
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 22:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xwLW+kObQsG9f/UdbnPAfYvKJEnDJvn8FMrtwt1Ik60=;
 b=LWqekB//r9GQosH9CvVOhky6uHxJMTMgPA5qQrJWEsurKMbXS9DvzfmlLHnOj6bbs1
 XoYhh62yrKeH9i0De7XWgmw/gw+8LAu/QWCSm5pPTt2JQgZ1gRvJKZ2NKleDSPSyDGrj
 m2rCWRbx1vy8kMkQFN3/3caeS/wMu19SaQkEHuVl0IdGLBTT9HwCZJFy/Tz5IWZJNk4L
 iA6rvBZQNFhEia/+FChwFg8nCoalF7CLpkkHiVxsgK/vxW3YPjS6ofy9tMBWy9pkckhA
 Ey2jrvdAkvVTrOIul6mqkPrSFUmtbZOhT5a2LpKdkHcl8DcZkJm3T8NbXaY3ccwpEtEJ
 yo/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xwLW+kObQsG9f/UdbnPAfYvKJEnDJvn8FMrtwt1Ik60=;
 b=ykbckxncWdMP+xUy8kU0/tU1IdhqK2bOYEgBZts7RVa46PS1tW6AhWcWpZKTJrG5vT
 7eZWY4FxHjhDeBZWDuOW7QWzMwZRtLWpp59YNKGrY3oEw0fEcG4Owc7tNMzuOAqvRYPw
 J49kciuyjEFB8fhrcAw4/COlDiH6uSLQAyYcPafvkDewAg6NXpsWbFKFIB05dx5wyrnk
 97CSDvoO40/z+mfzPsT+kVoS0XIMMkMA3a8dt4tptlw4gno7Kwrp9CvSMni6pgpMXtbX
 b83y7DT/aFgYYrDWltifMw42xyL7OpDEFH08h+HkuxSn7o23UufbfXJoR/9wKtal7Hze
 dLYg==
X-Gm-Message-State: AOAM532dWlUrEKJd9TquDS1a7cFwxOlhqzzdqBSFuvAkT4n28N9lIvvM
 1d8V8gn4EQ3UVoZEd/YJhGodfOLUk60XBA==
X-Google-Smtp-Source: ABdhPJyauzGAMvbG5dhGsL7aX9CO1HI6A1EJVebK5lIpZpQUfhS0GcrZzKXMWUvf99wI5RFKQgQnLA==
X-Received: by 2002:adf:db04:: with SMTP id s4mr4404740wri.467.1638341995365; 
 Tue, 30 Nov 2021 22:59:55 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id u23sm62143wmc.7.2021.11.30.22.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 22:59:54 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  1 Dec 2021 08:00:04 +0100
Message-Id: <20211201070004.563142-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 1/1] package/diffutils: fix build with uclibc < 1.0.35
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with uclibc < 1.0.35 raised since bump
to version 3.8 in commit 1f89c80417ad03127650b22c41ec4e30d42c549f:

In file included from ./sys/random.h:40,
                 from getrandom.c:22:
/home/giuliobenetti/autobuild/run/instance-0/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:27:35: error: unknown type name 'size_t'
   27 | extern int getrandom(void *__buf, size_t count, unsigned int flags)
      |                                   ^~~~~~
/home/giuliobenetti/autobuild/run/instance-0/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:8:1: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
    7 | #include <features.h>
  +++ |+#include <stddef.h>
    8 |

Fixes:
 - http://autobuild.buildroot.org/results/adecc3e5def140348dfff30961fe6514c9a8e7b5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Use upstream patch

 ..._random-port-better-to-uClibc-1-0-35.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/diffutils/0003-sys_random-port-better-to-uClibc-1-0-35.patch

diff --git a/package/diffutils/0003-sys_random-port-better-to-uClibc-1-0-35.patch b/package/diffutils/0003-sys_random-port-better-to-uClibc-1-0-35.patch
new file mode 100644
index 0000000000..f9dd12f8e6
--- /dev/null
+++ b/package/diffutils/0003-sys_random-port-better-to-uClibc-1-0-35.patch
@@ -0,0 +1,39 @@
+From 135414a7f543e4d40ad0a7cbd51885e159a6e0f4 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Tue, 30 Nov 2021 17:50:01 -0800
+Subject: sys_random: port better to uClibc < 1.0.35
+
+Problem reported by Fabrice Fontaine in:
+https://lists.gnu.org/r/bug-gnulib/2021-11/msg00043.html
+* lib/sys_random.in.h [HAVE_SYS_RANDOM_H && !__GLIBC__ && __UCLIBC__]:
+Include <stddef.h>, in case this file is included before
+__UCLIBC__ is defined.
+
+[Retrieved (and backported to remove ChangeLog update) from:
+https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=135414a7f543e4d40ad0a7cbd51885e159a6e0f4]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ ChangeLog           | 9 +++++++++
+ lib/sys_random.in.h | 6 ++++--
+ 2 files changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/lib/sys_random.in.h b/lib/sys_random.in.h
+index 1abd6c544..8b4b934a1 100644
+--- a/lib/sys_random.in.h
++++ b/lib/sys_random.in.h
+@@ -23,8 +23,10 @@
+ 
+ #if @HAVE_SYS_RANDOM_H@
+ 
+-/* On uClibc, <sys/random.h> assumes prior inclusion of <stddef.h>.  */
+-# if defined __UCLIBC__
++/* On uClibc < 1.0.35, <sys/random.h> assumes prior inclusion of <stddef.h>.
++   Do not use __UCLIBC__ here, as it might not be defined yet.
++   But avoid namespace pollution on glibc systems.  */
++# ifndef __GLIBC__
+ #  include <stddef.h>
+ # endif
+ /* On Mac OS X 10.5, <sys/random.h> assumes prior inclusion of <sys/types.h>.
+-- 
+cgit v1.2.1
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
