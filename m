Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E0AC5B549
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37220409DB;
	Sat, 31 May 2025 16:42:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4DInDK8Ic_Rx; Sat, 31 May 2025 16:42:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 668A040891
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 668A040891;
	Sat, 31 May 2025 16:42:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CEA8127
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 229BC832B0
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:42:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R7vRFLEYcnpY for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:42:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 489C283298
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 489C283298
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 489C283298
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:42:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4105C1C0D7C; Sat, 31 May 2025 18:42:50 +0200 (CEST)
Message-ID: <0bdae30c-bca1-43e3-bf49-4581603c2d0c@rnout.be>
Date: Sat, 31 May 2025 18:42:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Cc: Martin Bark <martin@barkynet.com>, linux-amarula@amarulasolutions.com
References: <20250512163253.1521000-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250512163253.1521000-1-dario.binacchi@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748709770; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=dDHedexVDO1rrxM6X0C0o0QmcoU7HuD74MK5NnBNMDY=;
 b=b7y5hSYePOzDS7qHF1KV8EX+3qaiHhr/TBOKna2NfGnqm4NI5+zO6Od+f27ag5hkzF3q9w
 Sx4FSiLgT3DAcTcWKVaIrBgDSho+OIZ2v3X/Wck7FGXZvQQZ2+BE6SQe8fNPjChsToqVSp
 xzzFSiCqSFj/PX8ubPkp10KMOCXC7HUsk0umDw1A4cgdWsqnLxn125LXb+Z52abUGQ30yE
 fKR4ngwMBhd8yROzZuQ5ZPnZ4bUFDf0BoZXkpJ6LaL3Uaqxsu00WA/9GqK5HkeuUcwtxYY
 QmSWQ3f31jIS+T6sBnPlfxpyJ87oEmXMLQ1G6rNRTBi+hnD2CEOSMCOV6PWvWw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=b7y5hSYe
Subject: Re: [Buildroot] [PATCH 1/2] package/connman: bump to version 1.44
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/05/2025 18:32, Dario Binacchi wrote:
> Release notes:
> 
> - ver 1.44:
>    * Fix issue with handling oFono context integration.
>    * Fix issue with handling web context for online detection.
>    * Fix issue with handling flags used when deleting routes.
>    * Fix issue with handling PAC proxy integration.
> 
> - ver 1.43:
>    * Fix issue with device creation when using LTE.
>    * Fix issue with regulatory domain when powering up.
>    * Fix issue with resolving ISO3166 code from timezone data.
>    * Fix issue with handling DNS proxy zero termination of buffers.
>    * Fix issue with handling DHCP packet length in L3 mode.
>    * Fix issue with handling DHCP upper length checks.
>    * Fix issue with handling IPv6 and URL parsing.
>    * Fix issue with handling online check updates.
>    * Fix issue with handling proxy method and WISPr.
>    * Fix issue with handling default gateway setup.
>    * Add support for low-priority default routes.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

  Applied both to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/connman/connman.hash | 2 +-
>   package/connman/connman.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/connman/connman.hash b/package/connman/connman.hash
> index ea87f1ea17da..38af1847aef6 100644
> --- a/package/connman/connman.hash
> +++ b/package/connman/connman.hash
> @@ -1,4 +1,4 @@
>   # From https://www.kernel.org/pub/linux/network/connman/sha256sums.asc
> -sha256  a3e6bae46fc081ef2e9dae3caa4f7649de892c3de622c20283ac0ca81423c2aa  connman-1.42.tar.xz
> +sha256  2be2b00321632b775f9eff713acd04ef21e31fbf388f6ebf45512ff4289574ff  connman-1.44.tar.xz
>   # Locally computed
>   sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
> diff --git a/package/connman/connman.mk b/package/connman/connman.mk
> index 142a6583ad3c..2c5be8252c6e 100644
> --- a/package/connman/connman.mk
> +++ b/package/connman/connman.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -CONNMAN_VERSION = 1.42
> +CONNMAN_VERSION = 1.44
>   CONNMAN_SOURCE = connman-$(CONNMAN_VERSION).tar.xz
>   CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman
>   CONNMAN_DEPENDENCIES = libglib2 dbus

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
