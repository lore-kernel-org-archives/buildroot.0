Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC57C3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 21:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79688606A5;
	Fri,  2 Aug 2024 21:35:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iEX4wfsGCcU5; Fri,  2 Aug 2024 21:35:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87E4D606B8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87E4D606B8;
	Fri,  2 Aug 2024 21:35:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E5B3E1BF3FF
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D302D40374
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:35:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qxK0OtBHvtUo for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 21:35:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E54B4400B5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E54B4400B5
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 21:35:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD89C83C1C; Fri,  2 Aug 2024 21:35:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Aug 2024 23:30:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 65f8174648a3df922892cfac1ad15279d1bffde3
X-Git-Newrev: 9696d277565159029e74efb9eae16b4a670bf945
X-Patchwork-Hint: ignore
Message-Id: <20240802213533.CD89C83C1C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gpsd: condition python stuff to
 the proper kconfig option
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

commit: https://git.buildroot.net/buildroot/commit/?id=9696d277565159029e74efb9eae16b4a670bf945
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we have a Kconfig symbol to enable the python support in
gpsd, but the condition at configure time is based on whether the python
package is enabled. So, if a user does not enable python support in
gpsd, they still get it.

Switch to using the proper symbol.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Jan Havran <havran.jan@email.cz>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gpsd/gpsd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 1d4013d122..c57fad83c3 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -178,7 +178,7 @@ ifeq ($(BR2_PACKAGE_GPSD_MAX_DEV),y)
 GPSD_SCONS_OPTS += max_devices=$(BR2_PACKAGE_GPSD_MAX_DEV_VALUE)
 endif
 
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
+ifeq ($(BR2_PACKAGE_GPSD_PYTHON),y)
 GPSD_SCONS_OPTS += \
 	python=yes \
 	python_libdir="/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
