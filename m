Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D68EC432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:08:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD95360FD9
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:08:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD95360FD9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7F90426B0;
	Thu, 26 Aug 2021 22:08:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t6vDSoTs24Xy; Thu, 26 Aug 2021 22:08:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44AF4426D6;
	Thu, 26 Aug 2021 22:08:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2272A1C1135
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BF5C61495
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 80ERkVitw_VT for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A86A6614A6
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 08FDC8DC52; Thu, 26 Aug 2021 22:01:29 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 12 Aug 2021 23:43:14 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5ec34a1a0595dd676e2da3e85bfcb2a921388fec
X-Git-Newrev: ee2267745a3e6f9e100d919496446ae9466dd521
X-Patchwork-Hint: ignore
Message-Id: <20210826220129.08FDC8DC52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/usbguard: needs
 std::future
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee2267745a3e6f9e100d919496446ae9466dd521
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

usbguard needs std::future to avoid the following build failure raised
since the addition of the package in commit
fbff7d7289cc95db991184f890f4ca1fcf8a101e:

In file included from src/Library/IPCClientPrivate.hpp:37:0,
                 from src/Library/IPCClientPrivate.cpp:24:
/home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/arm-none-linux-gnueabi/include/c++/4.8.3/future:122:11: error: declaration of 'class std::promise<std::unique_ptr<google::protobuf::Message> >'
     class promise;
           ^
src/Library/IPCClientPrivate.cpp: In member function 'usbguard::IPC::MessagePointer usbguard::IPCClientPrivate::qbIPCSendRecvMessage(usbguard::IPC::MessageType&)':
src/Library/IPCClientPrivate.cpp:244:26: error: invalid use of incomplete type 'class std::promise<std::unique_ptr<google::protobuf::Message> >'
     auto future = promise.get_future();
                          ^
Fixes:
 - http://autobuild.buildroot.org/results/1c4e0dab5917e5559a97f7cf7a99e30a2b561fc9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/usbguard/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/usbguard/Config.in b/package/usbguard/Config.in
index 41f19dc1a0..ca6d52034b 100644
--- a/package/usbguard/Config.in
+++ b/package/usbguard/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_USBGUARD
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
 	depends on !BR2_STATIC_LIBS # libqb, protobuf
 	depends on !BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
 	select BR2_PACKAGE_PROTOBUF
 	select BR2_PACKAGE_LIBQB
 	select BR2_PACKAGE_LIBSODIUM if !BR2_PACKAGE_LIBGCRYPT && !BR2_PACKAGE_LIBOPENSSL
@@ -23,3 +24,7 @@ comment "usbguard needs a glibc or uClibc toolchain w/ C++, threads, dynamic lib
 		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
 		|| BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+
+comment "usbguard needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
