Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5100C54FAA
	for <buildroot@archiver.kernel.org>; Wed, 28 Aug 2024 12:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93A4540B8B;
	Wed, 28 Aug 2024 12:59:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nhold3mNjcX6; Wed, 28 Aug 2024 12:59:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CDD04029B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CDD04029B;
	Wed, 28 Aug 2024 12:59:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EFA431BF215
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 12:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DBF57805A0
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 12:59:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LNfpDlqFmQwi for <buildroot@lists.busybox.net>;
 Wed, 28 Aug 2024 12:59:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BD91680577
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD91680577
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD91680577
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 12:59:42 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id A77D7352142F; Wed, 28 Aug 2024 14:59:40 +0200 (CEST)
Date: Wed, 28 Aug 2024 14:59:40 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zs8fPOrOGtdUOvA9@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724849980; bh=loIG3maihubVLeUhf9+w28tSEWUJDf0NFTUK6oi3PK8=;
 h=Date:From:To:Subject:From;
 b=C3M6sLTSI656okyIIH/fW4+b7TdRshtFLUhab1PCCR52BVRFfBqvHKcp7CZ4YtYzT
 R3kLat+viddYRdd3qs9V6aJGV5JSGjy/pbhDa1tGdq2LPjZNPjp/Ryc60xpJGs3GXC
 WADcSj9IpvO9kTDWhaoBbh2s8lS+8K4C/i8KIUbojn1ostwBsqPdpm5es/Rt5A5Jo5
 Vw7HhEZoFKCFMqbZBhKukZIwrn6BXM65g0Ec6VS92i9hY1DwqSSg6N3bgzd/p5UZ+G
 y3IGBZ/ekuWX5oe6jLG5G6Zqm/ELK62p2jgcfbwXuTZ/XHCxMUS0Seys6WLeWHAC4F
 AM0Zw+iDYePow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=C3M6sLTS
Subject: [Buildroot] [PATCH] package/fbdump: fix gcc 14.x issue
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 package/fbdump/0001-fix-gcc14-compile-issue.patch | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 package/fbdump/0001-fix-gcc14-compile-issue.patch

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
