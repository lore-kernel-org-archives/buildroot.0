Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DDAC3DA59
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 21:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0177340285;
	Sat, 20 Jul 2024 21:19:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HU5rn5KDa4dw; Sat, 20 Jul 2024 21:19:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1DD44064B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1DD44064B;
	Sat, 20 Jul 2024 21:19:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 855B11BF2C7
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72E2481D02
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:19:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jeKhskdJhr3j for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 21:19:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5F8F581CBA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F8F581CBA
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F8F581CBA
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 21:19:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B9DD71C0003;
 Sat, 20 Jul 2024 21:19:24 +0000 (UTC)
Date: Sat, 20 Jul 2024 23:19:23 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240720231923.50b82c43@windsurf>
In-Reply-To: <20240719211524.10419-1-fontaine.fabrice@gmail.com>
References: <20240719211524.10419-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721510364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aFqwj2KXNzZ5DG1BrsousJs9tDDL0xcb7HL4hejjerA=;
 b=XpLECYsCy9nd5q8A0OVY2Xjh3gz6nXniuHtVPYd60X3j0n/0Diy/Fd+Slm3aqlaft8/3EG
 gW7VHJAqfPS/dlBZSJbDFo/tOmcynfaZFBOP+/TN24ZKeG+jhsHJ4A1q/4v7A156dKBVrm
 Emty8MePytaeMCX0WBxFxEbGV4Hc6tjUbiWgw4lJwirjNO2X8IX05btLPwLSgfZqniTnQq
 ZwNMDckFolgXdQ55lo3WjT9q5p1+iM6+bbIqHCPdX6H7vFEep1wSVK6lPVeT4g76GxvmB+
 cWfj5wJ3GqyL+YopewUd73o1Xll9ttwm07/KYlhNtygivL6Zx6hnW4th6PL2IA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XpLECYsC
Subject: Re: [Buildroot] [PATCH 1/1] package/libmaxminddb: bump to version
 1.10.0
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

On Fri, 19 Jul 2024 23:15:24 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/maxmind/libmaxminddb/blob/1.10.0/Changes.md
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libmaxminddb/libmaxminddb.hash | 2 +-
>  package/libmaxminddb/libmaxminddb.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
