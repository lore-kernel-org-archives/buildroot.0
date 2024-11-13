Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D71CD41C17
	for <buildroot@archiver.kernel.org>; Wed, 13 Nov 2024 08:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C751160586;
	Wed, 13 Nov 2024 08:33:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kb81QvEvGZaI; Wed, 13 Nov 2024 08:33:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9FA36082B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9FA36082B;
	Wed, 13 Nov 2024 08:33:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DA2A6C
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 08:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E6DB81340
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 08:33:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6hL2p3X6UtuO for <buildroot@buildroot.org>;
 Wed, 13 Nov 2024 08:33:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0DF5E8133F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DF5E8133F
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0DF5E8133F
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 08:33:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B7497FF804;
 Wed, 13 Nov 2024 08:33:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tB8oE-00EcnR-0J;
 Wed, 13 Nov 2024 09:33:06 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org,  Carlo Caione <carlo.caione@gmail.com>
References: <20241028203442.750154-1-ju.o@free.fr>
Date: Wed, 13 Nov 2024 09:33:06 +0100
In-Reply-To: <20241028203442.750154-1-ju.o@free.fr> (Julien Olivain's message
 of "Mon, 28 Oct 2024 21:34:42 +0100")
Message-ID: <87jzd75y9p.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > When compiling jailhouse with BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS=y,
 > build is failing with error:

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

 > This is due to a missing dependency on the target python3 package.

 > Jailhouse Python scripts are using setuptools with host-python3 which
 > reads its sysconfig data from the target-python3. See:
 > https://gitlab.com/buildroot.org/buildroot/-/blob/2024.08.1/package/pkg-python.mk?ref_type=tags#L33

 > If the target python3 is not installed, this get expanded as an empty
 > string, leading to this "ValueError: Empty module name" error.

 > Pure Python packages which are using the python-package infrastructure
 > usually get this dependency automatically from:
 > https://gitlab.com/buildroot.org/buildroot/-/blob/2024.08.1/package/pkg-python.mk?ref_type=tags#L295

 > Here, the jailhouse package rather uses the generic-package
 > infrastructure, then installs the Python scripts (if enabled) with
 > dedicated macros. This is why the target python3 is needed.

 > This commit fixes the issue by adding this missing dependency.

 > Signed-off-by: Julien Olivain <ju.o@free.fr>
 > ---
 > Changes v1 -> v2:
 > From Thomas comment:
 > - Explain in more details why the target python3 dependency is needed.

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
