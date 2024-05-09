Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20ADC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 10:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 309EE402B2;
	Thu,  9 May 2024 10:51:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U8s8aE1LfNIr; Thu,  9 May 2024 10:51:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D84004152D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D84004152D;
	Thu,  9 May 2024 10:51:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED9121BF365
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 10:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA8A083CE1
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 10:51:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DmDTfsiUnmX3 for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 10:51:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6B51B83B9B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B51B83B9B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B51B83B9B
 for <buildroot@busybox.net>; Thu,  9 May 2024 10:51:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E71C413F8AE;
 Thu,  9 May 2024 12:51:44 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 09 May 2024 12:51:44 +0200
Date: Thu, 9 May 2024 12:51:44 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <ZjyqwNLypWWS21v5@landeda>
References: <20240506144555.31709-1-ps.report@gmx.net>
 <20240506144555.31709-7-ps.report@gmx.net>
 <20240508214144.GA223271@pevik> <20240508235419.642a8e8d@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240508235419.642a8e8d@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715251909;
 bh=aeC2YrrMyvYfkP2AgBtPKBfrfjwncYJxKGQ2/JBHKYo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tromhRwY7JJsartRBVKURm/uqp4EKID11pvMufbCsB0FCYoV7hkgT8s/l2VwiLOvr
 LjvK6r/UZ8PTflpCyftBvlTs0azhfefYLNHmoChsmIwJZ1DEuQ32+6zYiku0iu81cl
 SDZqhT3ziWTTBbn9Kosft2NkajDaPeph/+Ezm9EJEhVx8n5HARmMcztb80Ope6wU1B
 2Fv5arwTG3af7oPNcZx+KrF2FPdx+5HL1C53Nzwse/3akZwYqo2/V1Oo7iVbVwNLmz
 aUx/ukbERCFeNxQEXFLOU5uVETxtevnXsVRBAlWr6hgWS4oDD6PPgsk5vS3vhGKvY+
 qD1WebxzV70Bw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=tromhRwY
Subject: Re: [Buildroot] [PATCH v1 6/8] support/kconfig: bump to
 linux-v6.9-rc5 version
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
Cc: Petr Vorel <petr.vorel@gmail.com>, buildroot@busybox.net,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, Petr, All,

On 2024-05-08 23:54 +0200, Peter Seiderer via buildroot spake thusly:
> On Wed, 8 May 2024 23:41:44 +0200, Petr Vorel <petr.vorel@gmail.com> wrote:
[--SNIP--]
> > Even with applied patch 7th and 8th (and the others applied previously simple
> > 'make defconfig' fails:
> > 
> > buildroot/output/build/buildroot-config/conf: Kconfig file missing
> > Usage: buildroot/output/build/buildroot-config/conf [options] <kconfig-file>
[--SNIP--]
> Known problem ;-), see cover letter
> > Works for me despite 'make defconfig'...

I think you meant: s/despite/except/

And I think the solution is easy:

    Makefile: always use a base config file for defconfig

    Currently, our bundled kconfig copy does not require that a base
    configuration file, with some non-default set in there, be specified
    for defconfig, and we only pass one if specified by the user.

    Future kconfig versions will require a base config file be always
    specified, so prepare for that: if the user did not specify a base
    config file, use /dev/null, an empty file, to specify there is no
    preset value.

    Reported-by: Petr Vorel <petr.vorel@gmail.com>
    Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

    diff --git a/Makefile b/Makefile
    index d1caec63b5..a46dd79239 100644
    --- a/Makefile
    +++ b/Makefile
    @@ -1015,7 +1015,7 @@ oldconfig syncconfig olddefconfig: $(BUILD_DIR)/buildroot-config/conf outputmake
     	@$(COMMON_CONFIG_ENV) $< --$@ $(CONFIG_CONFIG_IN)

     defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
    -	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(DEFCONFIG),=$(DEFCONFIG)) $(CONFIG_CONFIG_IN)
    +	@$(COMMON_CONFIG_ENV) $< --defconfig=$(or $(DEFCONFIG),/dev/null) $(CONFIG_CONFIG_IN)

     %_defconfig: $(BUILD_DIR)/buildroot-config/conf  outputmakefile
     	@defconfig=$(or \

This also works with thecurrnt kconfig version we bundle, so this can be
a preliminray patch.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
