Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49995CFA474
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 21:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06B7F60837;
	Wed, 23 Oct 2024 21:15:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a1TYGo2q0cwY; Wed, 23 Oct 2024 21:15:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D7D460844
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D7D460844;
	Wed, 23 Oct 2024 21:15:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D0C6972
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6ECB580C1D
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:15:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gIM7wkzuhKit for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 21:15:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 37D3F80C1B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37D3F80C1B
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 37D3F80C1B
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:15:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 144BB20003;
 Wed, 23 Oct 2024 21:15:46 +0000 (UTC)
Date: Wed, 23 Oct 2024 23:15:45 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
Message-ID: <20241023231545.092e14df@windsurf>
In-Reply-To: <20241008202609.3832478-1-dario.binacchi@amarulasolutions.com>
References: <20241008202609.3832478-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729718147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0GqxYIF7ctz/UXriz9UFEkL1mofN7tOyZtmth6PHQUA=;
 b=EoE18vssUzoeE9ZhSTI1/8rEAuQWqPCW9qt2f4oOcXYJiiPV4SMIyoW3WFykGu5N6Pk7ho
 ZkxnDL1PRzGL8L9bI2XSlkokbJQNu1l6f+L/++TDP4q2xFMDPV5YK3m0zy+3JYmapcQr4p
 jzVDNkVcIaAuh7/ZwWBkdwDtzozjgZ7RnLz73qnZtea2T7nisScQcKOcV1pDTQAkxgXoSf
 PES7ml84n66Nexjtqtlw7Yf1Kjt5yKGsRDBl+E/SDqJXPt3Spw+D0Kxcf9TIlUQN6gCjsJ
 b2moLQDPF/fccBn3Q+Fgzvx/mrBNOMJgCjUHxM1gfxN3Nuww3BXGc8d6yQZTAA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EoE18vss
Subject: Re: [Buildroot] [PATCH 1/2] package/acpica: switch to github
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  8 Oct 2024 22:26:08 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> As reported in [1] the traditional acpica.org website releases might get
> delayed due to website publication process, and indeed, on GitHub, the
> latest released version is 20240927, while in [2] the 20240827 version
> appears. Furthermore, in [2], explicit reference is made to the GitHub
> URL for direct access to the public ACPICA git repository.
> 
> [1] https://github.com/acpica/acpica/releases
> [2] https://www.intel.com/content/www/us/en/developer/topic-technology/open/acpica/download.html
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  package/acpica/acpica.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
