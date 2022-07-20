Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E11C43334
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 16:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4B2E60F21;
	Wed, 20 Jul 2022 16:39:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4B2E60F21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jRufPRCY__CF; Wed, 20 Jul 2022 16:39:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E238760B43;
	Wed, 20 Jul 2022 16:39:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E238760B43
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6805B1BF352
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 16:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40F8A41A14
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 16:39:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40F8A41A14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KlbCVquiufF5 for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 16:39:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55DC3418C4
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 16:39:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55DC3418C4
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E9C9284001; Wed, 20 Jul 2022 16:26:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Jul 2022 18:39:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c70601762104d6d2beba51bc5804fcd204bd6bd3
X-Git-Newrev: 3d4a5a77e54dba425824a6434a05b3a3b8e88c05
X-Patchwork-Hint: ignore
Message-Id: <20220720162602.E9C9284001@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zeromq: force detection of more
 features
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

commit: https://git.buildroot.net/buildroot/commit/?id=3d4a5a77e54dba425824a6434a05b3a3b8e88c05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ZeroMQ added SO_PRIORITY in version 4.3.4, SO_BINDTODEVICE in 4.2.3, and
O_CLOEXEC since before 2.1.11. Checks for these feature are incompatible
with cross compilation. Linux supports SO_PRIORITY, and SO_BINDTODEVICE
since before 2.6. O_CLOEXEC is supported since 2.6.23. Keep them always
enabled.

Cc: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zeromq/zeromq.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index 182699403c..219827b42b 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -18,7 +18,10 @@ ZEROMQ_CPE_ID_PRODUCT = libzmq
 # SOCK_CLOEXEC, since linux v2.6.27.
 # Note: the flag TCP_KEEPALIVE is NOT available so we do not include it.
 ZEROMQ_CONF_ENV = libzmq_cv_sock_cloexec=yes \
+	libzmq_cv_o_cloexec=yes \
 	libzmq_cv_so_keepalive=yes \
+	libzmq_cv_so_priority=yes \
+	libzmq_cv_so_bindtodevice=yes \
 	libzmq_cv_tcp_keepcnt=yes \
 	libzmq_cv_tcp_keepidle=yes \
 	libzmq_cv_tcp_keepintvl=yes
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
