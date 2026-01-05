Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A28C79F8C
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 13:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7D30406AD;
	Mon,  5 Jan 2026 13:42:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B9q8n889fg9F; Mon,  5 Jan 2026 13:42:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1D3340676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767620538;
	bh=G+fng1iMUI8u2v8hXdlp3kfW7qrrZ3yLgBD6OcMlcQQ=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=NL/M2FQo0tfovoeTm595ANRB1EhgDNjJMa8s/KKDU3lWBgRPH/x3x0aOu1N++7Cn1
	 lUX34j1SpzLNcvoC3lVToFXcZ/KnMsPyAaGyNuB1dXMEEdlRmqcDUu6FNBpZiqKt6J
	 7mwKOZQrwSo5GaR3EwCDWoYyP7ZltNEXFktEY7kKkSO5rgDDjhQL81DyF020EOKlld
	 vhyxMNx2mvFAH/TzmTUqRnWmZhM6+vrLzUXfhwKzVfVPWyldbRFPJIA6N91Vrke51K
	 i0sZkGhX9O3uafnHUrsKuY5II3t2kZcoQXSRlHh7GheKL8dCHZJXnQAXacv4WgeW+f
	 1oi5952dZvGRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1D3340676;
	Mon,  5 Jan 2026 13:42:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 73E312DF
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 13:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64E60607E6
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 13:42:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dWfatAIzamvU for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 13:42:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7E38160760
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E38160760
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E38160760
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 13:42:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id F0201C1E483;
 Mon,  5 Jan 2026 13:41:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EADB060726;
 Mon,  5 Jan 2026 13:42:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BB09F103C850D; Mon,  5 Jan 2026 14:42:07 +0100 (CET)
Date: Mon, 5 Jan 2026 14:42:06 +0100
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20260105144206.6305e4e4@windsurf>
In-Reply-To: <20260105132326.4867-1-heiko.thiery@gmail.com>
References: <20260105132326.4867-1-heiko.thiery@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767620531; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=IF5KfFW1YJXEE0f38oeqdUL0GgsuVuvdtLIFHpOIzZY=;
 b=t1TlG2RFAbKmiiOujWed3sZYXIKQK7GqP/C/k112uZxXJLIgHaXlBGNWvucKgSw4wXghwa
 c+iMtXyPKktADEl8e2nMWT6D/lCbLksFhlUFA/8xkrfpqnxyFVgk6T4it56AudTIzFoQSw
 AkOcxVbozZDs1Hdik8DHd0ztrGOCn+g+8wrtWkwDo90vq817/CEHeF2gE1V015Y+/9DiYE
 D8A5L/ACTiUq9tm4H0KHVCCiq8tgjZrWNV4G7qXTpgG5on8LQlSKbwBJrKq+MAEYOdoYFa
 8DrZpPasJo2qkS36h2TN3LyWS9+ktiR221XnDZB2AUtVy+cc/gM8xMz+e2I9jQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=t1TlG2RF
Subject: Re: [Buildroot] [PATCH v2] package/uboot-tools: use U-Boot host
 tool printinitialenv to extract environment
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
Cc: Matt Weber <matthew.weber@rockwellcollins.com>,
 Michael Walle <michael@walle.cc>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Heiko,

On Mon,  5 Jan 2026 14:23:27 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> +	if [ -x $(UBOOT_SRCDIR)/tools/printinitialenv ]; then \
> +		$(UBOOT_SRCDIR)/tools/printinitialenv > $(UBOOT_TOOLS_GENERATE_ENV_FILE); \
> +	else \
> +		CROSS_COMPILE="$(TARGET_CROSS)" $(UBOOT_SRCDIR)/scripts/get_default_envs.sh $(UBOOT_SRCDIR); \

Aren't you now missing the > $(UBOOT_TOOLS_GENERATE_ENV_FILE)
redirection in this "else" clause ?

I'm not sure why we're using $(UBOOT_SRCDIR) in all of this instead of
$(@D), but that's a comment unrelated to your change.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
