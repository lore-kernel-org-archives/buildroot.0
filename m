Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F715D5B154
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 20:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1CFF6081D;
	Mon, 28 Oct 2024 20:52:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 82C3yyLiNg9S; Mon, 28 Oct 2024 20:52:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 269566077B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 269566077B;
	Mon, 28 Oct 2024 20:52:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F170112A
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FCD860736
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:52:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QPJXP2nUKKjh for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 20:52:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 810566081A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 810566081A
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 810566081A
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:52:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 90D581C0004;
 Mon, 28 Oct 2024 20:52:50 +0000 (UTC)
Date: Mon, 28 Oct 2024 21:52:49 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Carlo Caione <carlo.caione@gmail.com>
Message-ID: <20241028215249.7ae28006@windsurf>
In-Reply-To: <20241028203442.750154-1-ju.o@free.fr>
References: <20241028203442.750154-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730148770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tg/8A/bVBLuV0Dka0VDHpSHLuZ+XlZQPibAQec+cXm8=;
 b=myWd48ny+lOvKqzOXlSVc+wNsgWD4DgN4mCiLUCg6c3GkipIfPG3RT8zHT4IFoaeUD1OJo
 RGN0jqSEmqoLKULPc8QLMtcxihIQ1gKfRmNej3L+GyXcIzPTqINeTUaulEXWVDX9tYp9Gg
 sUjebD99eBAt7wKd07F16hJ+fHCAStL24Q2RRm+qDcRnQA+9BIsEHukhblZIVreV9LyHlo
 zRYepr5bYmE+8Qogb4K9j/iUBqonhRQwRPU1JrzB4NIHjy6DkPBe+yEb9woFCsHUJRHw2R
 Zsns3+MBCCOMioy5D9fY9HwNL2WuNEFp2R66hwExEbDL4773E2zFoTSXyrhO8Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=myWd48ny
Subject: Re: [Buildroot] [PATCH v2 1/1] package/jailhouse: fix build when
 python helper scripts are enabled
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

On Mon, 28 Oct 2024 21:34:42 +0100
Julien Olivain <ju.o@free.fr> wrote:

> When compiling jailhouse with BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS=y,
> build is failing with error:
> 
>     Traceback (most recent call last):
>       File "/buildroot/output/build/jailhouse-e57d1eff6d55aeed5f977fe4e2acfb6ccbdd7560/setup.py", line 18, in <module>
>         setup(name="pyjailhouse", version=version,
>       File "/buildroot/output/host/lib/python3.12/site-packages/setuptools/__init__.py", line 108, in setup
>         return distutils.core.setup(**attrs)
>                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>       ...
>       File "/buildroot/output/host/lib/python3.12/sysconfig.py", line 549, in _init_posix
>         _temp = __import__(name, globals(), locals(), ['build_time_vars'], 0)
>                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>     ValueError: Empty module name
> 
> This is due to a missing dependency on the target python3 package.
> 
> Jailhouse Python scripts are using setuptools with host-python3 which
> reads its sysconfig data from the target-python3. See:
> https://gitlab.com/buildroot.org/buildroot/-/blob/2024.08.1/package/pkg-python.mk?ref_type=tags#L33
> 
> If the target python3 is not installed, this get expanded as an empty
> string, leading to this "ValueError: Empty module name" error.
> 
> Pure Python packages which are using the python-package infrastructure
> usually get this dependency automatically from:
> https://gitlab.com/buildroot.org/buildroot/-/blob/2024.08.1/package/pkg-python.mk?ref_type=tags#L295
> 
> Here, the jailhouse package rather uses the generic-package
> infrastructure, then installs the Python scripts (if enabled) with
> dedicated macros. This is why the target python3 is needed.
> 
> This commit fixes the issue by adding this missing dependency.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Changes v1 -> v2:
> From Thomas comment:
> - Explain in more details why the target python3 dependency is needed.
> ---
>  package/jailhouse/jailhouse.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

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
