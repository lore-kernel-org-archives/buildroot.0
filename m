Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13328C3DA5E
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 10:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD21C40551;
	Mon, 15 Jul 2024 10:14:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lwyMn7hnhJvs; Mon, 15 Jul 2024 10:14:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 363B8405B7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 363B8405B7;
	Mon, 15 Jul 2024 10:14:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 267001BF969
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CACF180D45
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hTJirGkvIZOh for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 10:14:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC20080D58
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC20080D58
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 10:14:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C725786C44; Mon, 15 Jul 2024 10:14:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 12:13:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 638babd596141e74572c57f0b7ff65d4665a58de
X-Git-Newrev: ca7cedaa8cab0a0ac0fc48c2f40c4e6a84fb6877
X-Patchwork-Hint: ignore
Message-Id: <20240715101423.C725786C44@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5webengine: use bundled icu
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

commit: https://git.buildroot.net/buildroot/commit/?id=ca7cedaa8cab0a0ac0fc48c2f40c4e6a84fb6877
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the "-webengine-icu" config option qt5webengine uses icu headers
on the build host. Unfortunately, the build fails with:

/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/host-bin/python "../../3rdparty/chromium/build/toolchain/gcc_link_wrapper.py" --output="v8_snapshot/gen-regexp-special-case" -- /usr/bin/g++ -pie -Wl,--fatal-warnings -Wl,--build-id=sha1 -fPIC -Wl,-z,noexecstack -Wl,-z,relro -Wl,-z,now -Wl,-z,defs -Wl,--as-needed -m32 -pie -Wl,--disable-new-dtags -Wl,-O2 -Wl,--gc-sections -L/usr/lib -o "v8_snapshot/gen-regexp-special-case" -Wl,--start-group @"v8_snapshot/gen-regexp-special-case.rsp"  -Wl,--end-group  -ldl -lpthread -lrt -licui18n -licuuc -licudata
/usr/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libicui18n.so when searching for -licui18n
/usr/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libicui18n.a when searching for -licui18n
/usr/bin/ld: cannot find -licui18n
/usr/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libicuuc.so when searching for -licuuc
/usr/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libicuuc.a when searching for -licuuc
/usr/bin/ld: cannot find -licuuc
/usr/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libicudata.so when searching for -licudata
/usr/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libicudata.a when searching for -licudata
/usr/bin/ld: cannot find -licudata
/usr/bin/ld: skipping incompatible /usr/lib/libgcc_s.so.1 when searching for libgcc_s.so.1
collect2: error: ld returned 1 exit status

So use the bundled icu instead, as it needs an icu with a bitness
matching the bitness of the target, and other complexities.

Signed-off-by: Kadir Yilmaz <kadir.c.yilmaz@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5webengine/qt5webengine.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index 836ba62189..56f951fdbe 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -61,7 +61,6 @@ QT5WEBENGINE_DEPENDENCIES += \
 	host-freetype \
 	host-gperf \
 	host-harfbuzz \
-	host-icu \
 	host-ninja \
 	host-nodejs \
 	host-pkgconf \
@@ -87,7 +86,6 @@ QT5WEBENGINE_DEPENDENCIES += \
 QT5WEBENGINE_CONF_OPTS += \
 	-webengine-embedded-build \
 	-webengine-ffmpeg \
-	-webengine-icu \
 	-webengine-opus \
 	-webengine-webchannel \
 	-webengine-webp \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
