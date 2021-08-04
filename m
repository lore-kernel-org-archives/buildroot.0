Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F48EC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:18:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC62060F94
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:18:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC62060F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 805FD40350;
	Wed,  4 Aug 2021 21:18:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X5NN_irKx3Cx; Wed,  4 Aug 2021 21:18:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D34C640224;
	Wed,  4 Aug 2021 21:18:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 007A21BF5DB
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E775140147
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:18:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xYu3sc3rZbu3 for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 21:18:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80923400F8
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 21:18:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 693278B7C1; Wed,  4 Aug 2021 21:17:50 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 23:15:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c8bf39be4b89b4cdd3870ceef8b505bae53cb1c5
X-Git-Newrev: 1478126052566c5c5f2e360cb1d7b45c99c41dcb
X-Patchwork-Hint: ignore
Message-Id: <20210804211750.693278B7C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sox: fix static build with
 libsndfile
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=1478126052566c5c5f2e360cb1d7b45c99c41dcb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following static build failure with libsndfile raised since
commit dbc6e9e9f385995eb10bbfb0bb08e7674100ce66:

configure:14720: checking for sf_open_virtual in -lsndfile
configure:14745: /tmp/instance-1/output-1/host/bin/xtensa-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -Os -g0  -static -Wall -Wmissing-prototypes -Wstrict-prototypes  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static -Wl,--as-needed conftest.c -lsndfile    >&5
conftest.c:73:1: warning: function declaration isn't a prototype [-Wstrict-prototypes]
   73 | char sf_open_virtual ();
      | ^~~~
conftest.c:75:1: warning: function declaration isn't a prototype [-Wstrict-prototypes]
   75 | main ()
      | ^~~~
/tmp/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: /tmp/instance-1/output-1/host/xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libsndfile.a(libsndfile_la-flac.o): in function `flac_byterate':
flac.c:(.text+0xfc): undefined reference to `FLAC__StreamDecoderErrorStatusString'

Fixes:
 - http://autobuild.buildroot.org/results/4bc58ed68b29642876bb02710d0cd4f31540de86

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...figure.ac-fix-static-linking-with-sndfile.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/sox/0005-configure.ac-fix-static-linking-with-sndfile.patch b/package/sox/0005-configure.ac-fix-static-linking-with-sndfile.patch
new file mode 100644
index 0000000000..2233459331
--- /dev/null
+++ b/package/sox/0005-configure.ac-fix-static-linking-with-sndfile.patch
@@ -0,0 +1,44 @@
+From 06109c84ab6930265287049c4bf9405e7ebc4986 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 4 Aug 2021 10:27:16 +0200
+Subject: [PATCH] configure.ac: fix static linking with sndfile
+
+Use SOX_FMT_PKG to retrieve sndfile dependencies (e.g. flac, opus or
+vorbis). This will fix the following static build failure:
+
+configure:14720: checking for sf_open_virtual in -lsndfile
+configure:14745: /tmp/instance-1/output-1/host/bin/xtensa-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -Os -g0  -static -Wall -Wmissing-prototypes -Wstrict-prototypes  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static -Wl,--as-needed conftest.c -lsndfile    >&5
+conftest.c:73:1: warning: function declaration isn't a prototype [-Wstrict-prototypes]
+   73 | char sf_open_virtual ();
+      | ^~~~
+conftest.c:75:1: warning: function declaration isn't a prototype [-Wstrict-prototypes]
+   75 | main ()
+      | ^~~~
+/tmp/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: /tmp/instance-1/output-1/host/xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libsndfile.a(libsndfile_la-flac.o): in function `flac_byterate':
+flac.c:(.text+0xfc): undefined reference to `FLAC__StreamDecoderErrorStatusString'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/4bc58ed68b29642876bb02710d0cd4f31540de86
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not sent yet (waiting for feedback on third patch)]
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 8ae3202c..26510769 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -117,7 +117,7 @@ SOX_FMT_REQ([mp3], [MAD LAME TWOLAME])
+ SOX_FMT_PKG([oggvorbis], [ogg vorbis vorbisenc vorbisfile])
+ SOX_FMT_PKG([opus], [opusfile])
+ 
+-SOX_DL_LIB([libsndfile], [sndfile.h], [sndfile], [sf_open_virtual])
++SOX_FMT_PKG([libsndfile], [sndfile])
+ SOX_FMT_REQ([sndfile], [LIBSNDFILE])
+ 
+ SOX_FMT_LIB([wavpack], [wavpack/wavpack.h], [wavpack], [WavpackGetSampleRate])
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
