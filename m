Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13EB0C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 22:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5A0684DAD;
	Sun, 11 Feb 2024 22:27:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FZqHLRxf4yDb; Sun, 11 Feb 2024 22:27:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6C8884F74
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6C8884F74;
	Sun, 11 Feb 2024 22:27:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C2951BF44A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 22:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86FB384F74
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 22:27:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XZbZqDp_u_uY for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 22:27:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 116D584DAD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 116D584DAD
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 116D584DAD
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 22:27:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68B3B40003;
 Sun, 11 Feb 2024 22:27:34 +0000 (UTC)
Date: Sun, 11 Feb 2024 23:27:33 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240211232733.77d59395@windsurf>
In-Reply-To: <20231107174651.5995-1-fontaine.fabrice@gmail.com>
References: <20231107174651.5995-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707690454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rNlCUebNxVCqeQve9FftYfA6Aod1ykfUxRDsyqLHL60=;
 b=GWhm+ReHWyIKiqNu8v3JcyBjtjKEU9KzhFpTTBWCg5wUcC61GZYKs2BahW2M2S4HYmUXC4
 15H+lxEX3U3PvylgedWMG5/UlaWu8bSrndbqaR9GFA+f26LhsKJ0YDwAI22CxHeJOTLqI3
 N/aBTv6aADyGyknDPfe3SAcNy8oIE5dRkheXnLkqCrxQca0sKnP2R92wy3YD6j4B2yA0Sg
 POyxAQ3u40YANsGk7gZubs9t+qhvL3W8LaI1+JtZhwZM8ulgcFAhs/YKv72njtw5q3CX+W
 BzOk1qIrvqFRcGfahgLG7eyLgQtOkc+hHwZ0i9O4Q8WVVDtsPKsCi9Z5Sssvdg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GWhm+ReH
Subject: Re: [Buildroot] [PATCH 1/1] package/util-linux: fix build with -O0
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

On Tue,  7 Nov 2023 18:46:51 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with -O0 raised since bump to version
> 2.39 in commit ad276d94a392fb13244e042851a44269e6254d61 and
> https://github.com/util-linux/util-linux/commit/2fa4168c8bc9d5438bc1dfadda293c7c21b6fa59:
> 
> libuuid/src/gen_uuid.c: In function 'uuid_generate_time_generic':
> libuuid/src/gen_uuid.c:536:33: error: initializer element is not constant
>   THREAD_LOCAL int  cache_size = cs_min;
>                                  ^~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/7c9b8508345ffaba167c08521fb865d76555be1d
>  - http://autobuild.buildroot.org/results/2f80a5cdb523cc3c8c0f3693607a1be036b2ae98
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...rc-gen_uuid.c-fix-cs_min-declaration.patch | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 package/util-linux/0001-libuuid-src-gen_uuid.c-fix-cs_min-declaration.patch

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
