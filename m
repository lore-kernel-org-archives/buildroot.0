Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D91CEE349
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 20:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF3888133E;
	Wed,  9 Oct 2024 20:39:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L2z1lEW8MlaU; Wed,  9 Oct 2024 20:39:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1C468133F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1C468133F;
	Wed,  9 Oct 2024 20:39:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 205AD1BF3E1
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 20:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 517576077F
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 20:39:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U3Xg_pcdrcp4 for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 20:39:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 350DA6075B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 350DA6075B
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 350DA6075B
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 20:39:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A83A1C0005;
 Wed,  9 Oct 2024 20:39:49 +0000 (UTC)
Date: Wed, 9 Oct 2024 22:39:46 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241009223946.33ee5a67@windsurf>
In-Reply-To: <20241004172707.3662311-1-james.hilliard1@gmail.com>
References: <20241004172707.3662311-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728506390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c4viV3sCkG6DKYpfXiVViZ9O1iqU0pmw0LmZvc0Fyzw=;
 b=YqsYNIPa7hu7OPZqARP4OO0nZ0jBSwnqtFoNB2qmkBVnHX2JUW8/0XL2Ctr75inyAz3RJP
 hLwQ4xCBetkJqopAuRrVTDa4504/jzhRlyfXA7vh3psPmM6ProQG5BRm5VqAWCyFNdM4Mb
 vF95J5BFJQxSBniQZo+9YX8ksIdhpSVDSR4zESwdObkTcX5R00bv2czxKGDMxIxHL9cGAZ
 K8FtCl+dHtYxHnFDc9nPBQFUgfx91rk29RBbIeKObGBOXrEBAjE6PebDW4vG1LGa5GS6YP
 TGaP36lI2QuYtyYjs2iPAz7B6hw5/z1/3rc0l1coQIAfKcq+OeGCn2tkXGdgPQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YqsYNIPa
Subject: Re: [Buildroot] [PATCH v2 1/1] package/bluez5_utils: enable
 asha/bass when building audio plugins
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
Cc: Frank TEO <frank128@ymail.com>, Marcin Bis <marcin@bis.org.pl>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  4 Oct 2024 11:27:07 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Symbols from the asha plugin are required when building a2dp
> support as part of the audio plugins, so always enable asha
> when audio plugins are selected.
> 
> Symbols from the bass plugin are required when building bap
> support as part of the audio plugins, so always enable bass
> when audio plugins are selected.
> 
> This issue appeared during an attempt to fix a related issue in
> ce4e5fd129b557ac0411d0a0704be43717310d6d.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/5a3/5a306356f5f190a14a0a2294a4428544b1a018bb
>  - http://autobuild.buildroot.net/results/353/3539c83deaa45a3548bcd488659148c62af3fc73
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> Cc: Frank TEO <frank128@ymail.com>
> ---
> Changes v1 -> v2:
>   - also enable/disable bass plugin
> ---
>  package/bluez5_utils/bluez5_utils.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied to master, thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
