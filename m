Return-Path: <SRS0=trv6=NC=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E787C4338F
	for <buildroot@archiver.kernel.org>; Wed, 11 Aug 2021 11:12:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7967E60F21
	for <buildroot@archiver.kernel.org>; Wed, 11 Aug 2021 11:12:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7967E60F21
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1746F4022F;
	Wed, 11 Aug 2021 11:12:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wttrCUBXEC8x; Wed, 11 Aug 2021 11:12:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3B4A40262;
	Wed, 11 Aug 2021 11:12:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2CFC11BF30A
 for <buildroot@lists.busybox.net>; Wed, 11 Aug 2021 11:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CBEA83089
 for <buildroot@lists.busybox.net>; Wed, 11 Aug 2021 11:12:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aU0uHCWV25A0 for <buildroot@lists.busybox.net>;
 Wed, 11 Aug 2021 11:12:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5941F82EFC
 for <buildroot@buildroot.org>; Wed, 11 Aug 2021 11:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=D/OiRq9ZmJW0RV8MqIjgFMYD3OBy8NSV74INuNz0+i4=; 
 b=TBuMdDTC7kkgaMy8Y5TOuO6MW/raCLwLjt+XbirIFoRHGEnUgW76dala4Hj7stf+zZjSTbNDrQJXi4GTx4s58qwVVcstywfeoU1SW0zD475CJ7Q7FMOMonSN88aOHEtNqelLHtcrbjEl1BWhRcr4FQMCSyw9XFF6qaQDX0V014tt0TmJPJ3iqsUmWuxhIHxw22bNO8kwPTVGRShxjQbY/ON7lc7GKtXKOpzxTNcFe58pbSGI14lqZM7OzEx4/Vj5jd/AFE361QXq4Na7eCLcEZplwWhbie3O1V92+/lvOkRf0TDPMXpF9Ixic0PDalsZhC7kFdLVmnjTrTUizxq9iA==;
Received: from 91-153-34-142.elisa-laajakaista.fi ([91.153.34.142] helo=kodama)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mDm9a-0007YR-GJ; Wed, 11 Aug 2021 13:12:10 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 5eea17be;
 Wed, 11 Aug 2021 11:11:58 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Wed, 11 Aug 2021 14:11:55 +0300
Message-Id: <20210811111158.2577789-1-aperez@igalia.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/3] Update cage and its dependendencies
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi all!

This patch set updates Cage and wlroots to their latest versions. The
compositor itself is unchanged and the release only includes support for
the wlroots 0.14.x--where the "juicy" updates are, and in particular a
new rendering architecture which, in my limited experience works as well
as before on an i.MX8 board I have around, and definitely better on the
Raspberry Pi 3B. I think it is not unreasonable to expect improvements
in other boards as well :-)

Best regards,
-Adrian


Adrian Perez de Castro (3):
  package/wayland-protocols: bump to version 1.21
  package/wlroots: bump to version 0.14.1
  package/cage: bump to version 0.1.4

 package/cage/cage.hash                        |  4 ++--
 package/cage/cage.mk                          |  2 +-
 .../wayland-protocols/wayland-protocols.hash  |  8 ++++----
 .../wayland-protocols/wayland-protocols.mk    |  2 +-
 package/wlroots/Config.in                     |  1 +
 package/wlroots/wlroots.hash                  |  4 ++--
 package/wlroots/wlroots.mk                    | 19 +++----------------
 7 files changed, 14 insertions(+), 26 deletions(-)

-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
