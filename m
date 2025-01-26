Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBCBC0218D
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 21:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D441F80AEF;
	Sun, 26 Jan 2025 21:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8e4g0ct7yGxw; Sun, 26 Jan 2025 21:52:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4E4380B81
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4E4380B81;
	Sun, 26 Jan 2025 21:52:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E88394A
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 21:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B37B402A4
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 21:52:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rACAniKEbXz2 for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 21:52:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 38A7E40194
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38A7E40194
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 38A7E40194
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 21:52:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c8f0.dip0.t-ipconnect.de [79.214.200.240])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6B9E1A4C473C;
 Sun, 26 Jan 2025 22:52:20 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36834)
 by fli4l.lan.fli4l with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
 (Exim 4.98) (envelope-from <bernd@kuhls.net>)
 id 1tcAYF-000000001B3-2wzZ; Sun, 26 Jan 2025 21:52:19 +0000
Message-ID: <048fbeab-8e9c-474f-a8a8-8921c09b26f0@kuhls.net>
Date: Sun, 26 Jan 2025 22:52:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vincent Fazio <vfazio@xes-inc.com>, buildroot@buildroot.org,
 Fiona Klute <fiona.klute@gmx.de>
References: <20241211191630.1414970-1-bernd@kuhls.net>
 <20241211191630.1414970-2-bernd@kuhls.net> <20241229221255.2138fc09@windsurf>
 <e327553b-93a3-44cc-9b70-48bab7497067@gmx.de>
 <PH1P110MB1603B3EEB73618CFAF45272D9F1FA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <25105903-5086-463e-847b-d4a392f0cbd0@gmx.de>
 <PH1P110MB1603F80585C666F0A6C9336A9F1FA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Content-Language: de-DE
From: Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <PH1P110MB1603F80585C666F0A6C9336A9F1FA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1737928340;
 bh=/+PalvOIdHojinwoS+8oxpvPcFBUSi36ltTJfiT5n9c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gyVGE7kvqj+7yqM2GqecK/oT11MvqWOx/74ZiNFoWHcXWM7AC/FFGjFYS9Kfm98TN
 2nLXHxUqTu+pjJW0cVQLLt3y2X6zkhHpojThdIUJ3lNJOE/CFEO8apOYAS+O5DKfc0
 dw9Lze9VvVRKtUuobMP64Ll8G+JVbfDN5SAKbnn0x7+3FAz0R5GqoosLEu+DRCaST7
 yu7vAJ6oK88iwurj8dNEizm+Eo73lkkJRe66lC7k5NqGsSfYdcp8d7hSVubxlGJl6N
 +2CO6moYwtr2RS/Ztkd77C7AUV5wSoLcXc5mTAryTrAZmZ+BNMHM1Qw5fkXwFjJTMV
 rq0Bvpx83Au+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=gyVGE7kv
Subject: Re: [Buildroot] [External] - Re: [PATCH v2 2/2]
 package/python-emailproxy: new package
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Vincent,

Am 13.01.25 um 20:38 schrieb Vincent Fazio:
>>>> Am 29.12.24 um 22:12 schrieb Thomas Petazzoni via buildroot:
>>>>> I am still not happy with host-python-cryptography host-
>>>>> python-pyasyncore being dependencies, while they definitely 
>>>>> shouldn't be needed. I know James asked you to use --skip-
>>>>> dependency-check, and it apparently wasn't working with:
> 
> If we wanted to rely on setuptools' dependency resolution, we need
> to remove the `--no-isolation` flag in the build, otherwise it
> assumes the dependencies are available within host-python (which is
> why the host packages are necessary). I tested dropping `-n` from
> the build command and it worked OK. I'm guessing we do this so that
> BR is an island and self-contained.

thanks for the hint. Yes, removing "-n" from PKG_PYTHON_PEP517_BUILD_CMD 
fixes the build of python-emailproxy but breaks dozens of other python 
packages. Adding "-n" to _BUILD_OPTS of these packages fixes them but it 
will require lots of patches.

> If we wanted to avoid the host dependencies, we could just patch the
> pyproject to hardcode the version and not rely on setuptools'
> dynamic attribute resolution, though it might be best to do this on
> the latest tag and not 2024.9.12?
Did not test it yet but would such a patch be accepted by buildroot 
without sending it upstream?

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
