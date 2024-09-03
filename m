Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77598CD343F
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 21:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 421DE60674;
	Tue,  3 Sep 2024 21:31:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TyrOBWhnjp3O; Tue,  3 Sep 2024 21:31:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BB9560773
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BB9560773;
	Tue,  3 Sep 2024 21:31:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 713D11BF421
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F23B60773
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:31:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JOHb3C9XjvE4 for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 21:31:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 144C160674
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 144C160674
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 144C160674
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 21:31:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2CB7E20005;
 Tue,  3 Sep 2024 21:31:33 +0000 (UTC)
Date: Tue, 3 Sep 2024 23:31:32 +0200
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <20240903233132.51e57497@windsurf>
In-Reply-To: <20240828110215.147869-1-roykollensvendsen@gmail.com>
References: <20240828110215.147869-1-roykollensvendsen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725399093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gtsiWcphPbNquqvxA72+PnlmKiJmdwXt+BAVCNuTNwo=;
 b=UVtJ2pd3rSPAT4nwwT7+qx6Vs8rVrbgehXwHJ91/p8aPMG6iVY6/9Y9Ggznm78yDV7dc6U
 iZqfWoaQaet+4sPftqT8id2sK9R93JFLSokm/6L+P/3lcw6AhK83iOhF2OQlfJnRzdFIuc
 HTpUa1g+RCzRairLWPj5rEg/AwfigyDy5KcX4uTP0wDsytauVOOFP5Fo+V2kx4P0xBqnFx
 DAZy6h/5SwCRqcqXAh/Oq6Ge6Yn6U12qOSrou9EZ8QD2Zh7dRYQIphbXlr3uKU2hdffjuX
 a5Q7MfKU2C2Ugus3IttNFnFQaL1FnuaGzaS0PTXz4rkUkePdCCQGrD3fy7wAQg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UVtJ2pd3
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6/qt6declarative: fix typo
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 28 Aug 2024 13:02:13 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
> ---
>  package/qt6/qt6declarative/qt6declarative.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
