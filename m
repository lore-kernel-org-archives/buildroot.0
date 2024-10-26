Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2260D10BFE
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 14:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3DCF402D5;
	Sat, 26 Oct 2024 14:31:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KPd3gpjS_Hlc; Sat, 26 Oct 2024 14:31:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89AEC40363
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89AEC40363;
	Sat, 26 Oct 2024 14:31:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 053FA5C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAAB840363
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:31:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vin8Strc8MGt for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 14:31:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C49F5402D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C49F5402D5
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C49F5402D5
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:31:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 83C47FF803;
 Sat, 26 Oct 2024 14:31:09 +0000 (UTC)
Date: Sat, 26 Oct 2024 16:31:08 +0200
To: "HE,HAORUI" <hehaorui1999@gmail.com>
Cc: buildroot@buildroot.org, Tudor Holton <buildroot@tudorholton.com>
Message-ID: <20241026163108.2bf4a628@windsurf>
In-Reply-To: <20240920083037.958289-1-hehaorui1999@gmail.com>
References: <20240920083037.958289-1-hehaorui1999@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729953070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jJwMbtQ3Oe+lLbTxMHf6kDvHBtHsCZuB27REqB+7/bU=;
 b=JnccuWLuRsrdNcr3fezOvxuCUMDEGdfge5pVjdrbP4U1lpoROnVsHX71RxURJUEipKQNr7
 DVCtmD3Zd9+QkX1tpdgCWgZIpwXSBV6Wd0yhXOsOyv42nlUWLGAmzhioSMOGcu1D/KH96A
 phg2IDtBsxLx/Ym6N7fB7YjkTA+zImVAkgB44PoEPFH1CWj3MTDO/vuBY1ygmUKzk9CyIe
 FGYR2ngj5GaGL1gUrYSqsHVPrO81MZv6OY8y07XEidUMwHEJD+ayidHXRtTvKheRj80ixM
 bPvu0+FxsvXvB8cl7i/faCz59cOz12er3e7oR5r0nlRzzh5Dgi8zV77aeCgNVg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JnccuWLu
Subject: Re: [Buildroot] [PATCH] package/openjdk: fix typo in help text of
 openjdk zero
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

On Fri, 20 Sep 2024 16:30:37 +0800
"HE,HAORUI" <hehaorui1999@gmail.com> wrote:

> Signed-off-by: HE,HAORUI <hehaorui1999@gmail.com>
> ---
>  package/openjdk/Config.in | 2 +-
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
