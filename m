Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C822C4332F
	for <buildroot@archiver.kernel.org>; Tue, 20 Dec 2022 07:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C36D60AB5;
	Tue, 20 Dec 2022 07:45:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C36D60AB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MdTs9dZfGR1t; Tue, 20 Dec 2022 07:45:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 506BC60A6A;
	Tue, 20 Dec 2022 07:45:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 506BC60A6A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CBE1F1BF300
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 07:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A709E60A6A
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 07:44:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A709E60A6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hBvfWlrpRVSu for <buildroot@lists.busybox.net>;
 Tue, 20 Dec 2022 07:44:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 311F1607F4
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 311F1607F4
 for <buildroot@buildroot.org>; Tue, 20 Dec 2022 07:44:57 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B51EB240008;
 Tue, 20 Dec 2022 07:44:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p7XIz-008d85-LM; Tue, 20 Dec 2022 08:44:53 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20221208202338.4085-1-fontaine.fabrice@gmail.com>
Date: Tue, 20 Dec 2022 08:44:53 +0100
In-Reply-To: <20221208202338.4085-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 8 Dec 2022 21:23:38 +0100")
Message-ID: <87zgbifrii.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libftdi1: fix static build with
 libusb and -latomic
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
Cc: Daniel Sangue <daniel.sangue@sangue.ch>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Use pkg-config to retrieve libusb dependencies such as -latomic and
 > avoid the following static build failure raised since bump of libusb to
 > version 1.0.25 in commit aad609936fc83acfe1eac6ffc86d29ac35dcf54e:

 > /nvmedata/autobuild/instance-29/output-1/per-package/libftdi1/host/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
 > /nvmedata/autobuild/instance-29/output-1/per-package/libftdi1/host/sparc-buildroot-linux-uclibc/sysroot/lib/libusb-1.0.a(core.o):
 > in function `libusb_unref_device':
 > /nvmedata/autobuild/instance-29/output-1/build/libusb-1.0.25/libusb/core.c:1186: undefined reference to `__atomic_fetch_add_4'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/1ca7cd85ae60ad4797a6d8a83b2fb51d7eab96d9

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
