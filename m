Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E036C433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 10:23:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B093F60F92
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 10:23:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B093F60F92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62835403F9;
	Mon,  6 Sep 2021 10:23:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yoBdxs4JqcHc; Mon,  6 Sep 2021 10:23:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2969403F2;
	Mon,  6 Sep 2021 10:23:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 381D81BF308
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 10:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26E6B607B3
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 10:23:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=walle.cc
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eJT5xaJZIoO2 for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 10:23:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92FC460757
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 10:23:04 +0000 (UTC)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 6C74222173;
 Mon,  6 Sep 2021 12:23:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1630923782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7xDrMkRMIg/3haTf4APNgJ4CxdnmertcRRLKac+tkbk=;
 b=dpGjoCZ4VuweXxsvojBYOvKo2BA80QCe+a8aYRRsLc35CmU3dSrkZLcvGZULzSK9F5L0jq
 jYVtG6JvOcRiK+jzIRey0LfqRDptxsuMh6X+/m5rZPrdWsC/3Ym8YJS8zuR3LFPNvsEfs1
 fAAf2VHImhrhE9cYj8kal0cIjHSK1jg=
MIME-Version: 1.0
Date: Mon, 06 Sep 2021 12:23:01 +0200
From: Michael Walle <michael@walle.cc>
To: Heiko Thiery <heiko.thiery@gmail.com>
In-Reply-To: <20210906094214.6142-3-heiko.thiery@gmail.com>
References: <20210906094214.6142-1-heiko.thiery@gmail.com>
 <20210906094214.6142-3-heiko.thiery@gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <5a4dbac30a8e7546394c6f6969c602d3@walle.cc>
X-Sender: michael@walle.cc
Subject: Re: [Buildroot] [PATCH 2/3] boot/uboot: copy ATF bl31 binary to
 uboot package dir
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Stephane Viau <stephane.viau@oss.nxp.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Fabio Estevam <festevam@gmail.com>, Xavier Roumegue <xroumegue@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Am 2021-09-06 11:42, schrieb Heiko Thiery:
> If the U-Boot image is to be built with binman and the ATF binary is

btw TF-A is the new name for ATF ;)

-michael
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
