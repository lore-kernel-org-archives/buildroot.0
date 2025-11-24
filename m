Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB56BCFD355
	for <buildroot@archiver.kernel.org>; Mon, 24 Nov 2025 21:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9372883D19;
	Mon, 24 Nov 2025 21:27:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gyHeUwHhwuqg; Mon, 24 Nov 2025 21:27:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C724C83D23
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C724C83D23;
	Mon, 24 Nov 2025 21:27:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id ABEFC359
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 21:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D8B183D19
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 21:27:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4DrqXT-6H6Rp for <buildroot@buildroot.org>;
 Mon, 24 Nov 2025 21:27:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B932083D17
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B932083D17
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B932083D17
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 21:27:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9A261B979AE6; Mon, 24 Nov 2025 22:27:44 +0100 (CET)
Message-ID: <b9467c02-3958-4e21-9a67-a7a8238f91e1@rnout.be>
Date: Mon, 24 Nov 2025 22:27:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ozan Durgut <ozandurgut.2001@hotmail.com>, buildroot@buildroot.org
References: <DU2PPFBA6D4FC4D36A3F79A66448EBD2A21FDD2A@DU2PPFBA6D4FC4D.EURP189.PROD.OUTLOOK.COM>
Content-Language: en-GB, fr-BE
In-Reply-To: <DU2PPFBA6D4FC4D36A3F79A66448EBD2A21FDD2A@DU2PPFBA6D4FC4D.EURP189.PROD.OUTLOOK.COM>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764019665; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=gZjSsDxVp7T2SSGa8FiwXP+wvujM9LE/5JmYOCn0VdE=;
 b=H3Jffj3DY6BkLrhjwVhZo6YZlDirZK1ttjEyfGc8+k5Hdjl+DxMqTxPQXqxfISksvuGdkJ
 Gfz7pNA86zv5thlz7oZVGvq6m1cIl27Wt26oIGqMO4zHkTyJenhZ14EtXYr0z/G+jY4i/J
 HOmz1+Nte/qbl5G5JLnTcT7WFCe7CoqwaE254cA5dBjdefrhPv8/6xdqCuwgt0TeDM6d2n
 aOXL2uZf/ISvqdQ81ZjxXNcRTsMs3KN5k8FBivbrwWcLYA6AG+vMQ+snJhBbsXpBAV5zRX
 IuiDhtl9BQgE93fzhDU97u4kCBbehm3fPcNn27ChhhThWQBcRS0p3N60Y0S4EA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=H3Jffj3D
Subject: Re: [Buildroot] Lack of conditional support for U-Boot Kconfig
 changes in Buildroot
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



On 22/11/2025 14:09, Ozan Durgut wrote:
> Dear Buildroot developers,
> 
> I am reaching out regarding an issue we faced after upgrading to U-Boot v2025.10.
> 
> A recent upstream change in U-Boot (commit fb5235239aad) renamed two Kconfig 
> symbols related to default environment files:
> - CONFIG_USE_DEFAULT_ENV_FILE - CONFIG_ENV_USE_DEFAULT_ENV_TEXT_FILE
> - CONFIG_DEFAULT_ENV_FILE - CONFIG_ENV_DEFAULT_ENV_TEXT_FILE
> 
> The older symbols were removed without backward compatibility, which makes it 
> difficult to maintain a single Buildroot configuration that supports both pre- 
> and post-v2025.10 U-Boot versions.
> 
> Currently, Buildroot does not offer a way to conditionally set configuration 
> options based on the version. This limitation leads to a rigid setup, where 
> supporting multiple U-Boot versions in a single Buildroot tree becomes 
> unmanageable.
> 
> Would there be interest in extending Buildroot to handle such version-based 
> conditionals, or is there an existing pattern the community recommends for this 
> kind of case?

  AFAIK there is no check anywhere that all the options that you specify in the 
defconfig still appear in the final .config. So you can actually use this:

CONFIG_USE_DEFAULT_ENV_FILE=y
CONFIG_ENV_USE_DEFAULT_ENV_TEXT_FILE=y
CONFIG_DEFAULT_ENV_FILE="foo"
CONFIG_ENV_DEFAULT_ENV_TEXT_FILE="foo"


  Of course, that means that you can't simply update the defconfig by running 
`make uboot-update-defconfig`, but that would have been impossible anyway if you 
want to support multiple U-Boot versions with a single defconfig file.


  However, I would simply advise against using a single defconfig file for 
multiple U-Boot versions. The Kconfig expressiveness is not sufficient to really 
support this. It works in the most simple cases (where the defconfig in the two 
versions is anyway identical), but as soon as the newer U-Boot version 
introduces a new option (that you want to use), or changes a default, they are 
no longer identical. In that case, any advantage you have from using the same 
defconfig file is offset by the problems you introduce with it.


  Regards,
  Arnout


> 
> Looking forward to your input.
> 
> Best regards,
> Ozan Durgut
> Analog Devices
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
