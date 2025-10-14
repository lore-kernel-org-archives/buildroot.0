Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40201CCD190
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 21:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF8E0807A3;
	Tue, 14 Oct 2025 21:55:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TN0iwEA5GpGW; Tue, 14 Oct 2025 21:55:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAD4F807A4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAD4F807A4;
	Tue, 14 Oct 2025 21:55:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 544F81479
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 21:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 460BC807A3
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 21:55:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w5HFPpfFNx0u for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 21:55:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4DA6C807A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DA6C807A1
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4DA6C807A1
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 21:55:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 62A02B0053D;
 Tue, 14 Oct 2025 23:54:53 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Oct 2025 23:54:53 +0200
MIME-Version: 1.0
Date: Tue, 14 Oct 2025 23:54:53 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Geoffrey Ragot <geoffreyragot@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>, Olivier Matz
 <olivier.matz@6wind.com>, =?UTF-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?=
 <flavio.tapajos@newtesc.com.br>, Marcin Niestroj
 <m.niestroj@grinn-global.com>, Guillaume William Brs
 <guillaume.bressaix@gmail.com>, Nasser Afshin <afshin.nasser@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Falco Hyfing <hyfinglists@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Mauro Condarelli
 <mc5686@mclink.it>, Michael Trimarchi <michael@amarulasolutions.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Marcus Hoffmann
 <bubu@bubu1.eu>, =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?=
 <raphael.melotte@mind.be>
In-Reply-To: <20251013175513.86276-21-bernd@kuhls.net>
References: <20251013175513.86276-1-bernd@kuhls.net>
 <20251013175513.86276-21-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <1d9bbc9edbf123ff72d043d87f783a1a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760478912;
 bh=HYK5rscxu0F7PDzxYG0AN56+EQBjyw/GznGW6IhNXnA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rmo6k/FYZ8YXA8Mle9Q3pYemcVleFe5PnR1kMJrWJ9KB0EZVRlijlH25P12o/o6ot
 7+zgFpOST9XuQHz9FmwDjydAID2QtM60cj28p6IxLdOO6N7k3fcohm0NOUKdYUsqKZ
 BgFcL1TL+OMAZlwQ/YlsyRhJUTZkjD/vBrP+IUxd9/DqetSOXsXhe02Se4AFvexWIa
 RyUVOTtuOfXdId9GP/2H5TgfFLGmmokIbtisVyqQOFF2HnLOLSCHCYXnAl05UqxHcL
 /Ml/RmaQ4jTcaVGuDPlXO1BF2I8RYSOTgRjhtTgRknyp2qbtOGZTX/7aoWmYbISNoS
 +fvMmnXkqKl7Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rmo6k/FY
Subject: Re: [Buildroot] [PATCH 21/36] package/python-pyudev: bump version
 to 0.24.4
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

Hi Bernd,

Thanks for the patch.

On 13/10/2025 19:54, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/python-pyudev/python-pyudev.hash | 4 ++--
>  package/python-pyudev/python-pyudev.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pyudev/python-pyudev.hash 
> b/package/python-pyudev/python-pyudev.hash
> index e9596b7b43..799499a2ac 100644
> --- a/package/python-pyudev/python-pyudev.hash
> +++ b/package/python-pyudev/python-pyudev.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/pyudev/json
> -md5  07bbe9111308d2509645705b8321c416  pyudev-0.24.3.tar.gz
> -sha256  
> 2e945427a21674893bb97632401db62139d91cea1ee96137cc7b07ad22198fc7  
> pyudev-0.24.3.tar.gz
> +md5  2d2e6f68b60c3bf3ffc2b7c8df8d18ac  pyudev-0.24.4.tar.gz
> +sha256  
> e788bb983700b1a84efc2e88862b0a51af2a995d5b86bc9997546505cf7b36bc  
> pyudev-0.24.4.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  
> COPYING
> diff --git a/package/python-pyudev/python-pyudev.mk 
> b/package/python-pyudev/python-pyudev.mk
> index fa11ce5040..a83fe70a48 100644
> --- a/package/python-pyudev/python-pyudev.mk
> +++ b/package/python-pyudev/python-pyudev.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_PYUDEV_VERSION = 0.24.3
> +PYTHON_PYUDEV_VERSION = 0.24.4

With this new version, the package patch fail to apply.
Running the command "make python-pyudev-patch" fails with error:

     Applying 
0001-Workaround-finding-libudev-on-systems-without-ldconf.patch using 
patch:
     patching file src/pyudev/_ctypeslib/utils.py
     Hunk #1 succeeded at 24 (offset -4 lines).
     Hunk #2 FAILED at 50.
     1 out of 2 hunks FAILED -- saving rejects to file 
src/pyudev/_ctypeslib/utils.py.rej

Could you have a look please?

>  PYTHON_PYUDEV_SOURCE = pyudev-$(PYTHON_PYUDEV_VERSION).tar.gz
> -PYTHON_PYUDEV_SITE = 
> https://files.pythonhosted.org/packages/c4/5c/6cc034da13830e3da123ccf9a30910bc868fa16670362f004e4b788d0df1
> +PYTHON_PYUDEV_SITE = 
> https://files.pythonhosted.org/packages/5e/1d/8bdbf651de1002e8b58fbe817bee22b1e8bfcdd24341d42c3238ce9a75f4
>  PYTHON_PYUDEV_LICENSE = LGPL-2.1+
>  PYTHON_PYUDEV_LICENSE_FILES = COPYING
>  PYTHON_PYUDEV_SETUP_TYPE = setuptools
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
