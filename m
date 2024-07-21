Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C59C3DA61
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 16:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25E6F605B0;
	Sun, 21 Jul 2024 16:43:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id smc_uMg8fpHD; Sun, 21 Jul 2024 16:43:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 370FC60605
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 370FC60605;
	Sun, 21 Jul 2024 16:43:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 62E891BF321
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F106810DD
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:43:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xx0DfMx4M4ak for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 16:43:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 10914810CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10914810CE
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 10914810CE
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 16:43:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5BBBA20005;
 Sun, 21 Jul 2024 16:43:45 +0000 (UTC)
Date: Sun, 21 Jul 2024 18:43:44 +0200
To: Saeed Kazemi <kazemi.ms@gmail.com>
Message-ID: <20240721184344.6acef593@windsurf>
In-Reply-To: <20240721142747.2395700-1-kazemi.ms@gmail.com>
References: <20240721142747.2395700-1-kazemi.ms@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721580225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gv/+FzDeCeBRDBYdDzfCjw36XvOWaPN/pZ75aov94RU=;
 b=gAyENtTYhYj9Rxpt8p9yY0joSQlN2RQj/K9SwdI8lbkBdrsxs0QrHxFGrxu2LDhuu4VxKU
 2UjQ15TtlayDTnYIkJXUyUmvEnhNdWjx+BeRtIzYAekAuYVNmWgRHL9pd0p1BfQqZkx2/s
 TyAFl8r6gihiU5sT/2msspcDimEMBn1rTHpVSUMCqglapBGyOdhlJ0pXedvgLB4YSv27hM
 fnC8U7oX6nvoE9aAd0oVLEaTF6Dr5CaZUYJU7DPWHUvMKgW/Np6wq+RiEwLPlu/Tr6QULY
 7x52yVKxHIyQV3ldDmOL2tpfGrbPqtXB+IMlaCXZ5gtG/LxpIvDsw5V+abeyGA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gAyENtTY
Subject: Re: [Buildroot] [PATCH 1/1] package/parsec-tool: new package
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

On Sun, 21 Jul 2024 16:27:47 +0200
Saeed Kazemi <kazemi.ms@gmail.com> wrote:

> The Parsec Command Line Interface
> This tool can be used to communicate with the PARSEC service.
> 
> https://github.com/parallaxsecond/parsec-tool.git
> 
> Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
> ---
>  DEVELOPERS                           |  1 +
>  package/Config.in                    |  1 +
>  package/parsec-tool/Config.in        |  9 +++++++++
>  package/parsec-tool/parsec-tool.hash |  3 +++
>  package/parsec-tool/parsec-tool.mk   | 12 ++++++++++++
>  5 files changed, 26 insertions(+)
>  create mode 100644 package/parsec-tool/Config.in
>  create mode 100644 package/parsec-tool/parsec-tool.hash
>  create mode 100644 package/parsec-tool/parsec-tool.mk

Applied to master, thanks.

However, could you describe what this is useful for? I went to the
PARSEC web site, only to find this completely useless description:

  PARSEC is the Platform AbstRaction for SECurity, an open-source
  initiative to provide a common API to hardware security and
  cryptographic services in a platform-agnostic way. This abstraction
  layer keeps workloads decoupled from physical platform details,
  enabling cloud-native delivery flows within the data center and at
  the edge.

Do you have more details on your interest/use-case? This is just out of
curiosity.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
