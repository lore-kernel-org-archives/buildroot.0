Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 289D1C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 20:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4C8782BE7;
	Wed, 23 Feb 2022 20:10:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Qr7FJSNHsnI; Wed, 23 Feb 2022 20:10:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D63F82BEB;
	Wed, 23 Feb 2022 20:10:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7578B1BF5AA
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 20:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6407A415EC
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 20:10:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zaNPfOKYtO5r for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 20:10:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC9DE415E6
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 20:10:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 48F9183893; Wed, 23 Feb 2022 20:02:27 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 23 Feb 2022 21:09:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 14b9a100eff6ee58d57b9b7b4c0da9a648a7e1bf
X-Git-Newrev: 1636f604bd61aa9ddd804ce174a51ee41db7e9d6
X-Patchwork-Hint: ignore
Message-Id: <20220223200227.48F9183893@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5webkit: disable sampling
 profiler on musl
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

commit: https://git.buildroot.net/buildroot/commit/?id=1636f604bd61aa9ddd804ce174a51ee41db7e9d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable sampling profiler on musl to avoid the following build falure
raised since bump to version 5.212.0-alpha4 in commit
df0b0fe6919c0d0f3750f439a3cfa765232bd569:

/home/buildroot/autobuild/instance-0/output-1/build/qt5webkit-5.212.0-alpha4/Source/JavaScriptCore/heap/MachineStackMarker.cpp:686:2: error: #error Need a way to get the frame pointer for another thread on this platform
  686 | #error Need a way to get the frame pointer for another thread on this platform
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/87f52db7f8ebefa4c1ae3dd70d4a7a460f9aca35

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qt5/qt5webkit/qt5webkit.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 2e96acc00f..6401c39d3d 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -42,6 +42,10 @@ ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
 QT5WEBKIT_DEPENDENCIES += libexecinfo
 endif
 
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+QT5WEBKIT_CONF_OPTS += -DENABLE_SAMPLING_PROFILER=OFF
+endif
+
 QT5WEBKIT_CONF_OPTS += \
 	-DENABLE_TOOLS=OFF \
 	-DPORT=Qt \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
