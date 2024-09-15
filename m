Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C9EC35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 13:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C897880B37;
	Sun, 15 Sep 2024 13:01:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6bjxifNI7oKu; Sun, 15 Sep 2024 13:01:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E10F480B3B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E10F480B3B;
	Sun, 15 Sep 2024 13:01:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A8B8A1BF841
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 13:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97D63607FF
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 13:00:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1VWw_-stxHyx for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 13:00:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 83BE660675
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83BE660675
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83BE660675
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 13:00:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9C15D20002;
 Sun, 15 Sep 2024 13:00:45 +0000 (UTC)
Date: Sun, 15 Sep 2024 15:00:44 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240915150044.3dc94155@windsurf>
In-Reply-To: <ZtAs6xuq4/MXBfre@waldemar-brodkorb.de>
References: <ZtAs6xuq4/MXBfre@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726405246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q/yA7NWbV6ACVJLAuCQjMxHuehq2uyYodMd6c3+0dnk=;
 b=EeQyJSyTcWRkJMlzqx6FjVV0Gd0IwLCJVs2OrblxBXyLE7PVy1/lXRCqCubT0CpPC2Ax4T
 eT1imgVHLS+ZetFpeNREV0KH3gtdemnfptx5sCFdbudHFYd1Hznvg0qqBCZWJgy5Ekjwbk
 MADyry1uuEofKnGpQlrVRfoC8au2KHa5XUc4Mi4dYyBduosbtus3NbNhaoTFwRXhjdQIg+
 fTs0G0EeqtRQccChnPo3OgIRVxAYLuhLxLnqCQmCGj8RtBeAC4WS22Z2aUyUif5sUEGtbw
 QiF7IKDM6fninAKvv20CxAZCdk4kx2VeR13EBlV01Uyqzr9EyD+vzb+sC69omw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EeQyJSyT
Subject: Re: [Buildroot] [PATCH] package/lighttpd: fix sparc/sparc64
 compilation
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 29 Aug 2024 10:10:19 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> From Upstream git, two patches to fix sparc/sparc64 specific
> compile issues.
> 
> Fixes:
> 
>  http://autobuild.buildroot.org/results/c35/c35f9b78b8f114bb795ed162585d707331954b4b
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...ial-value-for-Linux-POLLRDHUP-on-SPA.patch | 34 ++++++++
>  ...ue-for-Linux-POLLRDHUP-on-SPARC-fixe.patch | 85 +++++++++++++++++++
>  2 files changed, 119 insertions(+)
>  create mode 100644 package/lighttpd/0002-Revert-core-special-value-for-Linux-POLLRDHUP-on-SPA.patch
>  create mode 100644 package/lighttpd/0003-core-special-value-for-Linux-POLLRDHUP-on-SPARC-fixe.patch

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
