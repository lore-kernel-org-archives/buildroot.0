Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1063EC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 15:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA32F83B25;
	Thu,  9 May 2024 15:37:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m-MTotDvEWBW; Thu,  9 May 2024 15:37:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C79D483BB4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C79D483BB4;
	Thu,  9 May 2024 15:37:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 51FA71BF39C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EE214054B
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:37:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uv82IGqJIWOV for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 15:37:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A2F540190
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A2F540190
 for <buildroot@buildroot.org>; Thu,  9 May 2024 15:37:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7227B86C09; Thu,  9 May 2024 15:37:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 17:37:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c1b04a325447a3eca456856cadbff8f9d90ec362
X-Git-Newrev: 5f2c9f882d6ac693e758b30dcb489b1d05ad2644
X-Patchwork-Hint: ignore
Message-Id: <20240509153746.7227B86C09@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/elfutils: fix host build failure
 due to missing demangle support
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

commit: https://git.buildroot.net/buildroot/commit/?id=5f2c9f882d6ac693e758b30dcb489b1d05ad2644
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building on hosts with libstdc++ without demangle support this error
shows up:
checking for __cxa_demangle in -lstdc++... no
configure: error: __cxa_demangle not found in libstdc++, use --disable-demangler to disable demangler support.
make[1]: *** [package/pkg-generic.mk:273: /home/giuliobenetti/br_reproduce/c2524c7580d97f7387ec22da62be71d77f2ed8ec/output/build/host-elfutils-0.189/.stamp_configured] Error 1
make: *** [Makefile:23: _all] Error 2

So let's disable demangler for host by default.

Fixes: still not showed by autobuilders. Reproduced on Ubuntu 22.04 with
Ubuntu APT g++ 11.4.0

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/elfutils/elfutils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 87b51aa5b5..4d8cc43342 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -27,6 +27,7 @@ HOST_ELFUTILS_CONF_OPTS = \
 	--with-bzlib \
 	--with-lzma \
 	--without-zstd \
+	--disable-demangler \
 	--disable-progs
 
 ELFUTILS_LDFLAGS = $(TARGET_LDFLAGS) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
