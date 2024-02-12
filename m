Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FBEC4829A
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 00:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8948D40B02;
	Mon, 12 Feb 2024 00:10:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FWsGIIy966GH; Mon, 12 Feb 2024 00:10:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E66D4064A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E66D4064A;
	Mon, 12 Feb 2024 00:10:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 074FC1BF47D
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 00:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E557060ED9
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 00:10:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OF0Du7N8hbDJ for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 00:10:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B6A7760ED5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6A7760ED5
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6A7760ED5
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 00:10:11 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id B328C2C83901;
 Mon, 12 Feb 2024 01:10:08 +0100 (CET)
Message-ID: <46469c10-9987-41fe-997e-e05e0f814319@bubu1.eu>
Date: Mon, 12 Feb 2024 01:10:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20231126180840.2081945-1-james.hilliard1@gmail.com>
 <20231126180840.2081945-3-james.hilliard1@gmail.com>
In-Reply-To: <20231126180840.2081945-3-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707696609; bh=40vkiNgca5uBm8FPmDKZTHKPHIFH87Pl1CSljORaAKs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=GmJDWfnAIDZsMhEz++AuvHbbNNQN9plosjFLJFB28JJIyljDxPCC01RstNzLdlT++
 CA0jkttOotzCh3ajMO5r8LesLzO1bPsnQ3evNBjn+WIfRXZTIY5iwblwKfFVhWKWl9
 v48w0+yDDC4Ptzpr7VIrdftiQaUapxgY6+xIcxyu6il2zqrXZEuf2NNOWmr/a33Os/
 7LIBKt5YArTfKl9ad/UheIAkEbK65VGAJ6hFcn/WgQFESDUL9xW8jyPlVvZ4aUAW0o
 2fVcfXzOL8OlMildbJb3wQSXd+jrNVAse5WC+HenUvx5rhy12P0aNHRULrjaigCfqW
 QYPxOU3Bql2bg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=GmJDWfnA
Subject: Re: [Buildroot] [PATCH v6 3/5] package/python-msgpack: add host
 cython dependency
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Gustavo Heinz <gustavo@gsthnz.com>, Asaf Kahlon <asafka7@gmail.com>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James,

I hopefully found an acceptable solution to the cython problem.

On 26.11.23 19:08, James Hilliard wrote:
> We need host-python-cython for python-msgpack to build correctly.
> This is a hard error when using a pep517 frontend.

I did some more tests and actually this error comes just from Cython now 
being mentioned in the pyproject.toml build-system requires section.[1]

In practice it is no more or less required than when using the old 
setup.py method. If the cython generated files are already there (they 
are usually present in the sdist, and indeed they are for msgpack here), 
then cython will never be invoked.

So something simple like running

   sed -i -e '/Cython~=3.0.0/d' $(@D)/pyproject.toml

inside some pre-build hook (or a patch to similar effect) works around 
this problem.

I think, given the whole mess that the different cython version 
dependencies are currently causing, relying on the upstream generated 
files (as we have done before) sounds like the best option. (similarly 
for uvloop, which behaves just the same regarding the cython dependency).


[1] https://github.com/msgpack/msgpack-python/blob/main/pyproject.toml#L5

> 
> Fixes:
> * Getting build dependencies for wheel...
> running egg_info
> writing msgpack.egg-info/PKG-INFO
> writing dependency_links to msgpack.egg-info/dependency_links.txt
> writing top-level names to msgpack.egg-info/top_level.txt
> reading manifest file 'msgpack.egg-info/SOURCES.txt'
> reading manifest template 'MANIFEST.in'
> warning: no files found matching '*.c' under directory 'msgpack'
> adding license file 'COPYING'
> writing manifest file 'msgpack.egg-info/SOURCES.txt'
> 
> ERROR Missing dependencies:
> 	Cython~=0.29.30
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/python-msgpack/python-msgpack.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/python-msgpack/python-msgpack.mk b/package/python-msgpack/python-msgpack.mk
> index 061ff5a761..c915b23bf4 100644
> --- a/package/python-msgpack/python-msgpack.mk
> +++ b/package/python-msgpack/python-msgpack.mk
> @@ -10,5 +10,6 @@ PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/c2/d5/5662032db157
>   PYTHON_MSGPACK_LICENSE = Apache-2.0
>   PYTHON_MSGPACK_LICENSE_FILES = COPYING
>   PYTHON_MSGPACK_SETUP_TYPE = setuptools
> +PYTHON_MSGPACK_DEPENDENCIES = host-python-cython
>   
>   $(eval $(python-package))

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
