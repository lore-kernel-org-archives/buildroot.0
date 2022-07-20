Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E532DC433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 11:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 511324058E;
	Wed, 20 Jul 2022 11:44:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 511324058E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z_CPFlodxCZn; Wed, 20 Jul 2022 11:44:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76F4140C0F;
	Wed, 20 Jul 2022 11:43:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76F4140C0F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 01CF51BF2F0
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 11:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDF49419B4
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 11:43:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDF49419B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h8KVJtfnuZEU for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 11:43:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BEEE418A3
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 11:43:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BEEE418A3
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5ADA783F5F; Wed, 20 Jul 2022 11:30:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Jul 2022 13:43:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5bdf0799df45b52123faade4a4847859e7591eb6
X-Git-Newrev: 06a1a05b55aa64720d4ede9b07c385cc8f06625d
X-Patchwork-Hint: ignore
Message-Id: <20220720113026.5ADA783F5F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvpx: vp8 encoder needs c++
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

commit: https://git.buildroot.net/buildroot/commit/?id=06a1a05b55aa64720d4ede9b07c385cc8f06625d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Encoding rate control interface for v8 is implemented in c++:
https://github.com/webmproject/libvpx/commit/65a1751e5b98bf7f1d21bcbfdef352af34fb205d
and was added to libvpx in v1.12.0 which was added to buildroot with
https://git.busybox.net/buildroot/commit/?id=e4ff284ba88ea0cb41c190165cb42a174c5faa23

Disable vp8 encoding when toolchain lacks c++.

Fixes:
http://autobuild.buildroot.net/results/a3524b954e53002973b423ce23b4c43ff5281ab5/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libvpx/libvpx.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libvpx/libvpx.mk b/package/libvpx/libvpx.mk
index 1845f2bc5e..c8a22b9ab2 100644
--- a/package/libvpx/libvpx.mk
+++ b/package/libvpx/libvpx.mk
@@ -21,11 +21,11 @@ LIBVPX_CONF_OPTS = \
 	--disable-docs \
 	--disable-unit-tests
 
-# vp9/ratectrl_rtc.cc
+# vp8/ratectrl_rtc.cc vp9/ratectrl_rtc.cc
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
-LIBVPX_CONF_OPTS += --enable-vp9-encoder
+LIBVPX_CONF_OPTS += --enable-vp8-encoder --enable-vp9-encoder
 else
-LIBVPX_CONF_OPTS += --disable-vp9-encoder
+LIBVPX_CONF_OPTS += --disable-vp8-encoder --disable-vp9-encoder
 endif
 
 # This is not a true autotools package.  It is based on the ffmpeg build system
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
