Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E81AC07208
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 19:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F04EA4032C;
	Fri,  3 Nov 2023 19:54:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F04EA4032C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KZPCMj6MIrxX; Fri,  3 Nov 2023 19:54:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E583F403E9;
	Fri,  3 Nov 2023 19:54:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E583F403E9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B2E4B1BF357
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 19:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99737822BC
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 19:54:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99737822BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iTqOVSoTv3Zo for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 19:54:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6B65822BA
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 19:54:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6B65822BA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5730865DE; Fri,  3 Nov 2023 19:54:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Nov 2023 20:52:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce0d4efa7660ba7155de27c8928b7711d3600890
X-Git-Newrev: 1f6b53b1a4a6bec05839506013ac29d3a237fbeb
X-Patchwork-Hint: ignore
Message-Id: <20231103195400.B5730865DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apache: add host-pkgconf dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1f6b53b1a4a6bec05839506013ac29d3a237fbeb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
