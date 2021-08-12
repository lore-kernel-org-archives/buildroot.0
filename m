Return-Path: <SRS0=gEIP=ND=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88BA2C4320A
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 21:47:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3285260EE2
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 21:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3285260EE2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB5FA6140A;
	Thu, 12 Aug 2021 21:47:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zIXjFZXXjrA4; Thu, 12 Aug 2021 21:47:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5D7061411;
	Thu, 12 Aug 2021 21:47:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 44DCC1BF354
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 21:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4270D61405
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 21:47:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GK7_vxDaG5xy for <buildroot@lists.busybox.net>;
 Thu, 12 Aug 2021 21:47:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA3646140C
 for <buildroot@buildroot.org>; Thu, 12 Aug 2021 21:47:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 7DD1C20002;
 Thu, 12 Aug 2021 21:47:34 +0000 (UTC)
Date: Thu, 12 Aug 2021 23:47:33 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210812234733.664eaef7@windsurf>
In-Reply-To: <20210810082744.2967433-1-fontaine.fabrice@gmail.com>
References: <20210810082744.2967433-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/usbguard: needs std::future
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
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Tue, 10 Aug 2021 10:27:44 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> usbguard needs std::future to avoid the following build failure raised
> since the addition of the package in commit
> fbff7d7289cc95db991184f890f4ca1fcf8a101e:
> 
> In file included from src/Library/IPCClientPrivate.hpp:37:0,
>                  from src/Library/IPCClientPrivate.cpp:24:
> /home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/arm-none-linux-gnueabi/include/c++/4.8.3/future:122:11: error: declaration of 'class std::promise<std::unique_ptr<google::protobuf::Message> >'
>      class promise;
>            ^
> src/Library/IPCClientPrivate.cpp: In member function 'usbguard::IPC::MessagePointer usbguard::IPCClientPrivate::qbIPCSendRecvMessage(usbguard::IPC::MessageType&)':
> src/Library/IPCClientPrivate.cpp:244:26: error: invalid use of incomplete type 'class std::promise<std::unique_ptr<google::protobuf::Message> >'
>      auto future = promise.get_future();
>                           ^
> Fixes:
>  - http://autobuild.buildroot.org/results/1c4e0dab5917e5559a97f7cf7a99e30a2b561fc9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/usbguard/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
