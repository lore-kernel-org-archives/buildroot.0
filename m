Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961BDC98324
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46FB340BF0;
	Thu, 24 Sep 2026 18:57:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yqgRQaQWlOkk; Thu, 24 Sep 2026 18:57:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2978440B8C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276242;
	b=suimC4uUZnfCu5iPkfGy6AOtjMXygDmXLT5KllL9WxuxvvyXKo9+cohxhgI/Um//6odw
	 wgBdRofsQfLme/9Swy3VCYUT/T/LhHZDsiULHSk/cFqySkTgvPbMWMpZrmmsl7U516q67
	 MXauAsti0Tyq9LE3HV7Xbpg5oIHOVvG1xgPGum2X9O/cqCW9w8oFOMWfZ1s9M/vx0twjG
	 Va3cusTchVee3BmRRl1y7D3ZXsKBTkfsfp5eLP9FTNZ+xs2lpxa0uTIpy7Kx5ZojGfzV9
	 +N7NpLbchKq2ksBGggC6PegxlSPhB5HzpuYJKyjT5cHCydqbg2inAKpwsTqVp2SwGrA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276242;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=K/UrG4CA1QfX9F02begV3CRSrhwmnMcRA6bVyXWwIUA=;
	b=RpYUSY2l+rGYD2tCMDjcZh7H5XDdgoPpRf6sU5W6z0qQrhtaKZvCYyi7Uy7S1eobIgBI
	 T9IU0hQ2dZSaY50BgOGBV9uJbSoWWKPUTsH55BOEKRLWuZjcoRd7gJDc0Ug/YiV0cBxf8
	 gxXMjEpwtwBXODOL3pBly8mLYX/Vi6W4oxxQDPp9bMwlu4IHPel5blHUJEiugyuvyPdP4
	 IZznnEeXvN1h8cl17WPsWfpg9bkHNsptYydhX3tIw4rZUyKWHW6sWepJKdYHrZ/jK5pCw
	 X08zDxe4x5w4hDvlYDiLSOYfj1xuZ0BxBac9SZRAbdcWOI13VBNaWd7vG4CNT9n2V5w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276242;
	bh=K/UrG4CA1QfX9F02begV3CRSrhwmnMcRA6bVyXWwIUA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Yl06vrep3pay4Kq65/2a2r8pzoGjSAl6JH5phoJ/qXDmuyBiGXTfsEja+b4zN08VL
	 5ta4bUTM8hFjmPWPCI39vn2B0vFLxnesELo+IQF6CPHtH0iUjUXZUjIwjw0H4Jp81W
	 ufJRl+1V5h9YSIwAatWma3kfi5hkMKSO4Vlb6O0WGRo+aNvLj6Ji5EErjEUXaXCkkg
	 y0wBEiBWnxFbgOcj3tDf1X0mh7E8aRBHqMGkJ/QdEbmV//J7Mo258s3qIfvGPEcUoL
	 oDWC+K9TJNOHQiVMf/b4rZyD+EcMQd9Yqo8JcuuDd+Gn2EV/DLB4zXQU/gMU2ZaAGb
	 DthZZ8jLIg9Eg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2978440B8C;
	Thu, 24 Sep 2026 18:57:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F744332
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6EA4940AEF
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id joIwWJC5avPK for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1363E40ACB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276203;
 b=OW+YJx0IbGY1y23jF1tV0Z5wDNWn4x1aC5Zx+DApd6SGQcKGjFGIBoC3yVPURmWpsarC
 6lYcAg4O2vBZ2cMZ0KZshQ8K7jt7TfEsY2YtQV0FYb8TQYx2+mpIxZ5UfqdRfGcqf8IrZ
 A8CtHfC+Jf+fwvaNRgAGzBRR0hFQyxgDybcEqU5tGvvK7040M4jcVx8c11jeKZmetNDcr
 aGCvoqSJUgUk5o0wuRrr+rp29s8AdUbuicS8FTJ6SXmjspYkILcQT+vjYR4nnidSrhlUI
 LsFnobDVtIgM8yONQt/lnxhb6sz7Fq3ECcVR4ubIoxQGl5MBHnCxkYmlIeXp/hQ8ACg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276203;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Qf4JkMdXF/OO0ku0CmYYdyhUicM/A7BUkFHKuQ0XZyI=;
 b=jxk6tzLQvOw1xtpe+wI3x+WqHdx0qXlGmDq+qVv46fEFKEpK1lyVC2b60i7gq4sclD+f
 puWV5PRGpIIamp635RhoXxuJfAwqBxL4ujrCz09cpJ/9oba9VrJfjEwnaeCJBxSuaLa9l
 0/Cu9hzo6gJkzChX9Dp/RPQurL/pfswyzVdpBYbz0E5YzqPEgow4bMQ/jrsxAxF5xvw2r
 CHp0aKiI6RrAF6dVfS6l98CXCn0ZK4CUHQknq71m0/x+I9IwVryYLWfRov7oNLxPEk9de
 ergJrpe1taI1iEBcEVsynW7p3Nr30+KBi7dHcnel/0xkUYaQn6R50xu4GsxvSICQD5A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1363E40ACB
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AAD8D98383; Thu, 24 Sep 2026 18:55:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:05:44 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ee3f34791dd08d01cdd7c0be7101a88e8b4d443c
X-Git-Newrev: 8b348cd4a744e1d168a2a627053bf25c380154b6
X-Patchwork-Hint: ignore
Message-Id: <20260924185532.AAD8D98383@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libest: fix build
 with gcc >= 14.x
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3372802813415652581=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3372802813415652581==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8b348cd4a744e1d168a2a627053bf25c380154b6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Renumbered remaining patches.

Fixes:
https://autobuild.buildroot.net/results/149/149aad6f98163faab14232a9d3013c197579cbb4/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2e1e3b5e09dfed6909e9de870ffb277862ca5110)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...-jni-client.c-include-est-est_ossl_util.h.patch | 27 ++++++++++++++++++++++
 ...-remove-duplicate-invocation-of-AM_INIT_.patch} |  0
 ...locl.h-add-missing-extern-on-e_ctx_ssl_e.patch} |  0
 3 files changed, 27 insertions(+)

diff --git a/package/libest/0003-java-jni-client.c-include-est-est_ossl_util.h.patch b/package/libest/0003-java-jni-client.c-include-est-est_ossl_util.h.patch
new file mode 100644
index 0000000000..d027d8012f
--- /dev/null
+++ b/package/libest/0003-java-jni-client.c-include-est-est_ossl_util.h.patch
@@ -0,0 +1,27 @@
+From b49542dea03c4b895a860c393453ab8497dabfce Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Tue, 8 Sep 2026 12:52:02 +0200
+Subject: [PATCH] java/jni/client.c: include est/est_ossl_util.h
+
+Upstream: https://github.com/cisco/libest/pull/132#issuecomment-4749526125
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ java/jni/client.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/java/jni/client.c b/java/jni/client.c
+index c5bc28e..2c4663e 100644
+--- a/java/jni/client.c
++++ b/java/jni/client.c
+@@ -12,6 +12,7 @@
+ #include <stdint.h>
+ #include "jest.h"
+ #include <est/est.h>
++#include "est/est_ossl_util.h"
+ #include <openssl/x509v3.h>
+ #include <openssl/bio.h>
+ #include "safe_mem_lib.h"
+-- 
+2.47.3
+
diff --git a/package/libest/0005-configure.ac-remove-duplicate-invocation-of-AM_INIT_.patch b/package/libest/0004-configure.ac-remove-duplicate-invocation-of-AM_INIT_.patch
similarity index 100%
rename from package/libest/0005-configure.ac-remove-duplicate-invocation-of-AM_INIT_.patch
rename to package/libest/0004-configure.ac-remove-duplicate-invocation-of-AM_INIT_.patch
diff --git a/package/libest/0006-src-est-est_locl.h-add-missing-extern-on-e_ctx_ssl_e.patch b/package/libest/0005-src-est-est_locl.h-add-missing-extern-on-e_ctx_ssl_e.patch
similarity index 100%
rename from package/libest/0006-src-est-est_locl.h-add-missing-extern-on-e_ctx_ssl_e.patch
rename to package/libest/0005-src-est-est_locl.h-add-missing-extern-on-e_ctx_ssl_e.patch

--===============3372802813415652581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3372802813415652581==--
