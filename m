Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CB3EEB59D
	for <buildroot@archiver.kernel.org>; Thu, 12 Sep 2024 19:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B6A461195;
	Thu, 12 Sep 2024 19:30:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 541k8NDLpigp; Thu, 12 Sep 2024 19:30:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D92161197
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D92161197;
	Thu, 12 Sep 2024 19:30:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AE9DA1BF2F6
 for <buildroot@lists.busybox.net>; Thu, 12 Sep 2024 19:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 973A740118
 for <buildroot@lists.busybox.net>; Thu, 12 Sep 2024 19:30:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ysdvHt_-OG5 for <buildroot@lists.busybox.net>;
 Thu, 12 Sep 2024 19:30:05 +0000 (UTC)
X-Greylist: delayed 366 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 12 Sep 2024 19:30:04 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EEC3240065
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEC3240065
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.130.47;
 helo=dd5108.kasserver.com; envelope-from=dev@andin.de; receiver=<UNKNOWN> 
Received: from dd5108.kasserver.com (dd5108.kasserver.com [85.13.130.47])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EEC3240065
 for <buildroot@buildroot.org>; Thu, 12 Sep 2024 19:30:04 +0000 (UTC)
Received: from [192.168.178.43] (ipb21bd56e.dynamic.kabel-deutschland.de
 [178.27.213.110])
 by dd5108.kasserver.com (Postfix) with ESMTPSA id C4A67524451F;
 Thu, 12 Sep 2024 21:23:54 +0200 (CEST)
Message-ID: <6b23799f-7a89-4665-935f-22176901d87e@andin.de>
Date: Thu, 12 Sep 2024 21:23:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ralf Dragon <hypnotoad@lindra.de>, buildroot@buildroot.org
References: <20240401084841.439073-1-hypnotoad@lindra.de>
 <20240405175454.14431-2-hypnotoad@lindra.de>
Content-Language: en-US, de-DE
From: Andreas Naumann <dev@andin.de>
In-Reply-To: <20240405175454.14431-2-hypnotoad@lindra.de>
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=andin.de; 
 s=kas202409091056; t=1726169035;
 bh=Y/PsRFGZaU7t6HaP22kMVfRZUr6VTG68p04GCe6Qjok=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Mmyg8IoWh/kaezidtWiMUZnyIx9RM3CUXa2R7MbsNhfckkjN8pycfhvqc6YtdbrSN
 /b/wx1i6maF4UwUm7qCFOgljeakN8vk6jSOsrgJfVwrFz0HMIB+mbSZ6kfeXAuTy6i
 1zSyPC+vyyaFL/MuZqiujWsBTSoPtdTKrOGyREDJqUSnicrrkL5+ket4+r0CcPniWY
 yGKLcb9EtwrgA9rwqv2JG/i/IMl/yBBs9mAVKYFCRrr2gHz7KSbbvQxn4xjwF9o9mb
 vxyzARiv3tD8XjCrpXAqJ3UEBmPsJrQ7zX9emV9czIrqi1YFNyc3GFKSS33uVUTwhu
 WOdaFzy50zvZg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=andin.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=andin.de header.i=@andin.de header.a=rsa-sha256
 header.s=kas202409091056 header.b=Mmyg8IoW
Subject: Re: [Buildroot] [PATCH v3 2/2] add missing SIP module for PyQt5
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



Am 05.04.24 um 19:54 schrieb Ralf Dragon:
> This fixes the following runtime error when importing PyQt5 in python:
> 
> from PyQt5.QtCore import *
> ModuleNotFoundError: No module named 'PyQt5.sip'
> 
> The problem was likely triggered by the atomic upgrade from 5.7 to
> 5.15 in b36ce7e. This commit is part of the 2022-2024 LTS.
> 
> Signed-off-by: Ralf Dragon <hypnotoad@lindra.de>

Ran into the same problem, found and applied both patches on 2024.02, 
compiled a qt5 config including pyqt5 for imx8mp and successfully ran it 
on the target.

Tested-by: Andreas Naumann <anaumann@ultratronik.de>


> ---
>   package/python-pyqt5/Config.in | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/python-pyqt5/Config.in b/package/python-pyqt5/Config.in
> index 9fa7676f98..0b37f14317 100644
> --- a/package/python-pyqt5/Config.in
> +++ b/package/python-pyqt5/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_PYTHON_PYQT5
>   	bool "python-pyqt5"
>   	depends on BR2_PACKAGE_QT5
>   	select BR2_PACKAGE_PYTHON_SIP
> +	select BR2_PACKAGE_PYTHON_PYQT5_SIP # runtime
>   	select BR2_PACKAGE_QT5BASE_GUI
>   	help
>   	  Python bindings for Qt 5
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
