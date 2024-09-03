Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946F5CD3440
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 21:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64ED4605FF;
	Tue,  3 Sep 2024 21:34:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QhZxLGosq9gP; Tue,  3 Sep 2024 21:34:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EDB860663
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EDB860663;
	Tue,  3 Sep 2024 21:34:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B8541BF421
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 090A040182
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:34:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pPFlX6xB9e-8 for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 21:34:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE59B4010C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE59B4010C
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 21:34:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5FC286D4E; Tue,  3 Sep 2024 21:34:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 23:32:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ac51d214659139ad8260b21b1e94cb631994fc62
X-Git-Newrev: a784191d3fd77a7af444495c065d55f1c5889943
X-Patchwork-Hint: ignore
Message-Id: <20240903213423.E5FC286D4E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fbdump: fix gcc 14.x issue
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

commit: https://git.buildroot.net/buildroot/commit/?id=a784191d3fd77a7af444495c065d55f1c5889943
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following error is seen with gcc 14.x:
/home/autobuild/autobuild/instance-0/output-1/host/bin/armeb-buildroot-linux-uclibcgnueabi-gcc -DHAVE_CONFIG_H -I. -I. -I..   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -O2 -fomit-frame-pointer -s -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -c `test -f 'main.c' || echo './'`main.c
main.c: In function 'main':
main.c:82:49: error: passing argument 4 of 'Options_parse' from incompatible pointer type [-Wincompatible-pointer-types]
   82 |   if( Options_parse( opt_template, &opts, argc, argv ) != 0 )
      |                                                 ^~~~
      |                                                 |
      |                                                 char **
In file included from main.c:17:
options.h:32:83: note: expected 'const char **' but argument is of type 'char **'
   32 | int Options_parse( const OptionTemplate *tmplt, void *opts, int argc, const char *argv[] );
      |                                                                       ~~~~~~~~~~~~^~~~~~
make[3]: *** [Makefile:240: main.o] Error 1
make[3]: Leaving directory '/home/autobuild/autobuild/instance-0/output-1/build/fbdump-0.4.2/src'
make[2]: *** [Makefile:201: all-recursive] Error 1
make[2]: Leaving directory '/home/autobuild/autobuild/instance-0/output-1/build/fbdump-0.4.2'
make[1]: *** [Makefile:156: all] Error 2
make[1]: Leaving directory '/home/autobuild/autobuild/instance-0/output-1/build/fbdump-0.4.2'

Fixes:

  http://autobuild.buildroot.net/results/3a0/3a0abff75023e257f3d6048688485a380b72fbb3

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fbdump/0001-fix-gcc14-compile-issue.patch | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/fbdump/0001-fix-gcc14-compile-issue.patch b/package/fbdump/0001-fix-gcc14-compile-issue.patch
new file mode 100644
index 0000000000..a554b4faf6
--- /dev/null
+++ b/package/fbdump/0001-fix-gcc14-compile-issue.patch
@@ -0,0 +1,15 @@
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: N/A no SCM, not active anymore
+
+diff -Nur fbdump-0.4.2.orig/src/main.c fbdump-0.4.2/src/main.c
+--- fbdump-0.4.2.orig/src/main.c	2007-03-03 04:14:37.000000000 +0100
++++ fbdump-0.4.2/src/main.c	2024-08-16 09:25:42.828125778 +0200
+@@ -58,7 +58,7 @@
+ }
+ 
+ 
+-int main( int argc, char *argv[] )
++int main( int argc, const char *argv[] )
+ {
+   Options  opts = {
+     .fbdev = DEFAULT_DEVICE,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
