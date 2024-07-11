Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B85C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 08:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EDB741714;
	Thu, 11 Jul 2024 08:17:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lFhjloN9vZys; Thu, 11 Jul 2024 08:17:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56F3F41715
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56F3F41715;
	Thu, 11 Jul 2024 08:17:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D4511BF5A4
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 08:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09BD240184
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 08:17:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Go99cq_XuMf4 for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 08:17:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 37E14400F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37E14400F6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 37E14400F6
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 08:17:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD37A2000A;
 Thu, 11 Jul 2024 08:17:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sRozY-0097cs-29;
 Thu, 11 Jul 2024 10:17:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
References: <20240706110642.939667-1-ju.o@free.fr>
Date: Thu, 11 Jul 2024 10:17:28 +0200
In-Reply-To: <20240706110642.939667-1-ju.o@free.fr> (Julien Olivain's message
 of "Sat, 6 Jul 2024 13:06:42 +0200")
Message-ID: <87ttgwibqf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] configs/visionfive2: fix build by
 adding kernel header version
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
Cc: Francois Dugast <francois.dugast.foss@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > commit d9e6d2d081 "configs/visionfive2: update kernel to upstream
 > 6.8.2" removed the config directive:

 >     BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y

 > but forgot to add:

 >     BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_8=y

 > It was most likely generated with a "make savedefconfig", while Linux
 > kernel v6.8 was the default at that time. After commit aa70c331a2
 > "linux: bump latest version to 6.9", the defconfig failed to build
 > with error:

 >     Incorrect selection of kernel headers: expected 6.9.x, got 6.8.x

 > This commit fixes the defconfig by adding back the kernel custom header
 > version.

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/7271150175

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed to 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
