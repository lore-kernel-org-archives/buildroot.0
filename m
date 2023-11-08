Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3417C4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 16:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7197040042;
	Wed,  8 Nov 2023 16:29:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7197040042
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4lwF_3avuiya; Wed,  8 Nov 2023 16:29:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38B6C400A4;
	Wed,  8 Nov 2023 16:29:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38B6C400A4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B97BC1BF47F
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 16:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9146E81E69
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 16:29:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9146E81E69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1NUSKkYx6Iqc for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 16:29:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5640811F6
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 16:29:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5640811F6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A3CA186CDF; Wed,  8 Nov 2023 16:29:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Nov 2023 17:27:19 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 7742d220c23730bfbe950d34d8ad78ecc9a04702
X-Git-Newrev: 23eed2aac124650bd21f02d7188d03cf04faba10
X-Patchwork-Hint: ignore
Message-Id: <20231108162916.A3CA186CDF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/apache: add
 host-pkgconf dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=23eed2aac124650bd21f02d7188d03cf04faba10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

apache uses pkgconfig to find dependencies such as lua, nhgttp2, openssl
and systemd.
For openssl, pkgconfig is used since version 2.1.1 and
https://github.com/apache/httpd/commit/0d4387dedc4ad83460bf52fc326c475c64133634
resulting in the following build failure since at least bump to version
2.4.54 in commit 78e5a9c40e0754bbe840ef7b8da85efc28eb8b48:

ac_cv_path_PKGCONFIG=/usr/bin/pkg-config
[...]
configure:28669: checking for SSL_CTX_new
configure:28669: /home/buildroot/autobuild/instance-1/output-1/host/bin/armeb-buildroot-linux-uclibcgnueabi-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O3 -g0  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -L/home/buildroot/autobuild/instance-1/output-1/host/armeb-buildroot-linux-uclibcgnueabi/sysroot/usr/bin/../../../../armeb-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -L/usr/lib conftest.c -lssl -lcrypto   -lpthread >&5
armeb-buildroot-linux-uclibcgnueabi-gcc: ERROR: unsafe header/library path used in cross-compilation: '-L/usr/lib'

Fixes:
 - http://autobuild.buildroot.org/results/d85c86ee1070582014c7b29b39f9a9f356988220
 - http://autobuild.buildroot.org/results/55d6bad8572138e200730d3a9f2dd1b9048fd95d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1f6b53b1a4a6bec05839506013ac29d3a237fbeb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apache/apache.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index cac62134ed..3efa6b0ac1 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -17,7 +17,7 @@ APACHE_INSTALL_STAGING = YES
 # We have a patch touching configure.in and Makefile.in,
 # so we need to autoreconf:
 APACHE_AUTORECONF = YES
-APACHE_DEPENDENCIES = apr apr-util pcre2
+APACHE_DEPENDENCIES = host-pkgconf apr apr-util pcre2
 
 APACHE_CONF_ENV= \
 	ap_cv_void_ptr_lt_long=no \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
