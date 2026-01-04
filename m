Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399CBC2A06C
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 10:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C025980CD6;
	Sun,  4 Jan 2026 10:56:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c7fptSD3rufT; Sun,  4 Jan 2026 10:56:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2ADE8082E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767524196;
	bh=okx2FtZDzkSsBADmwwlhH4ZlyiKuVeVbXn2dpoE6H1s=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gd5OY00Bt1yRFFz668EpdQSm+OYMmepCrkI1xqli6I4Pk/CKESN9wuzkWJXNl9IzD
	 pA+QFuLvEoWGplp5IdgXtNbRSGZyhkN0QW+4HlgxV8eN0XcMiwT+WlQHhsi4o8Zt52
	 0/eU2/JJLK/JVnE/QF+KUnFjVPdT0E8H0JIiUbiBSS0MKoFi6WB9yVR+RkD1TnXBqm
	 l7LZzrr/9VEzED+PHhCysJv6gJxpm27o/dP8VAFlq+IUxjAcn9uU5jr5fsEmYvy1kY
	 gSxEcfjg3kF3nwpR1z2KPB/7jyjvZRVdguGp4uvYT4T4qIc1Q3OHF0R1siJa43ksRp
	 LcbKKAMHv89Cw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2ADE8082E;
	Sun,  4 Jan 2026 10:56:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 55DB72DF
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C34A8082E
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:56:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eqvWuubzgk46 for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 10:56:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4D686807F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D686807F0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D686807F0
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:56:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 22DC66012D;
 Sun,  4 Jan 2026 11:56:29 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 04 Jan 2026 11:56:29 +0100
MIME-Version: 1.0
Date: Sun, 04 Jan 2026 11:56:29 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Fiona Klute <fiona.klute@gmx.de>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260103175533.1988160-2-james.hilliard1@gmail.com>
References: <20260103175533.1988160-1-james.hilliard1@gmail.com>
 <20260103175533.1988160-2-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <b3c41b0569fbf6ab18e32200371b2928@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767524192;
 bh=5RWHJ4pknKpT5VjsOrUIpbhmQiBV7VpfM+xmhJxcPFU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=L4Zp3Q03w1we+H9pi+Gqv6Tq6ALe7YvE5+GjmjsT5T+XWG7OmDRHAVom7kwQPmqNJ
 vQ9EqD14MBb3NGlyZJSizXJXWjGk90joXlHAaA8yi8gSEsf39+PORtID21zVrNj+lH
 S33shxDdWzvprKe0YKJh2NLgohaedUFv+zHhufd50lC4g3LItM24VGl30ZIWGaJoEX
 2okF7QOKy05AckanGCtU4DMs9LHqHk6FE1GpQ0BO8CYy2mfDTzT+wPgOSmU8IBVFBs
 IRCqfzUMOwq34/hjFc+sfnFs2kGWgq+wR5Sgq30t1hoVsm8oouVOQb0iKhrnNY4JQZ
 oXI1AwsrNHvVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=L4Zp3Q03
Subject: Re: [Buildroot] [PATCH 2/2] package/python-textual: bump to version
 7.0.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James,

Thanks for the patch.

On 03/01/2026 18:55, James Hilliard wrote:
> Add new python-mdit-py-plugins runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
[...]
> diff --git a/package/python-textual/python-textual.mk 
> b/package/python-textual/python-textual.mk
> index 49cccc299d..77187b3102 100644
> --- a/package/python-textual/python-textual.mk
> +++ b/package/python-textual/python-textual.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_TEXTUAL_VERSION = 5.3.0
> +PYTHON_TEXTUAL_VERSION = 7.0.0

While testing at runtime with the command "python -m textual",
the execution fails with the error:

File "/usr/lib/python3.13/site-packages/textual/__init__.py", line 19, 
in <module>
File "/usr/lib/python3.13/site-packages/textual/_on.py", line 5, in 
<module>
File "/usr/lib/python3.13/site-packages/textual/css/model.py", line 10, 
in <module>
File 
"/usr/lib/python3.13/site-packages/textual/css/_help_renderables.py", 
line 6, in <module>
File "/usr/lib/python3.13/site-packages/rich/console.py", line 5, in 
<module>
ModuleNotFoundError: No module named 'zlib'

There is possibly a missing python zlib dependency somewhere (maybe in 
python-rich?).

Could you have a look, please?

>  PYTHON_TEXTUAL_SOURCE = textual-$(PYTHON_TEXTUAL_VERSION).tar.gz
> -PYTHON_TEXTUAL_SITE = 
> https://files.pythonhosted.org/packages/ba/ce/f0f938d33d9bebbf8629e0020be00c560ddfa90a23ebe727c2e5aa3f30cf
> +PYTHON_TEXTUAL_SITE = 
> https://files.pythonhosted.org/packages/d4/9c/ebc9ca1f95366bef4c0e8360f4a77400d47a79aeecc08747de1990ef8bdc
>  PYTHON_TEXTUAL_SETUP_TYPE = poetry
>  PYTHON_TEXTUAL_LICENSE = MIT
>  PYTHON_TEXTUAL_LICENSE_FILES = LICENSE
> --
> 2.43.0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
