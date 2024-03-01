Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79760C5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 08:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1991041AE9;
	Fri,  1 Mar 2024 08:14:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yCmVDMdqEoQ3; Fri,  1 Mar 2024 08:14:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31F8A41BB0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31F8A41BB0;
	Fri,  1 Mar 2024 08:14:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D6B021BF377
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 08:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF22D60762
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 08:14:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3_-T_oCIK0uR for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 08:14:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 30C546072A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30C546072A
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 30C546072A
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 08:14:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E28520009;
 Fri,  1 Mar 2024 08:14:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rfy2S-006byz-0s;
 Fri, 01 Mar 2024 09:14:40 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240225152313.1422787-1-fontaine.fabrice@gmail.com>
Date: Fri, 01 Mar 2024 09:14:40 +0100
In-Reply-To: <20240225152313.1422787-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 25 Feb 2024 16:23:13 +0100")
Message-ID: <8734tacqrz.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] utils/genrandconfig: fix
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Commit b7232c51dd402afb361d7c310855e0bf5666958d added default setting
 > for bare-metal toolchain arch but unfortunately it used configlines.add
 > instead of configlines.append resulting in the following build failure:

 > /bin/sh: line 8:
 > /home/autobuild/autobuild/instance-1/output-1/per-package/host-gcc-bare-metal/host/bin/-ar:
 > No such file or directory

 > While at it, also append /n for consistency

 > Fixes: b7232c51dd402afb361d7c310855e0bf5666958d
 >  - http://autobuild.buildroot.org/results/95ac565653ddb5c14ec71470c32a34ad10b048cb

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
