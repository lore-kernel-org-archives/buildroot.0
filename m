Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1B2E7718B
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 14:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7AA8607D9;
	Fri, 27 Dec 2024 14:33:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id APCNvZrQt1Kq; Fri, 27 Dec 2024 14:33:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6B176082B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6B176082B;
	Fri, 27 Dec 2024 14:33:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B7110F1B
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B00224045D
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:33:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q0cvSFF7KozL for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 14:33:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 852B5400AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 852B5400AB
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 852B5400AB
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:33:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 1537A2003F3;
 Fri, 27 Dec 2024 15:33:16 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:56764])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Dec 2024 15:33:15 +0100
MIME-Version: 1.0
Date: Fri, 27 Dec 2024 15:33:15 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241223141146.1708338-1-james.hilliard1@gmail.com>
References: <20241223141146.1708338-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <9b4ea3ca3bc7eac97e997c1d4688ddfe@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735309997;
 bh=yppFjelsTTDTNdlGWlXYSHMhK6v1S+NzkP13WCn2Zho=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qa28NKEpZKQNsl2W2bKjNCW6LlHTtv1cZj41MHgeyO5HiNXnIN5rWzsPXgISg0x07
 8bSB3t5Quvsfp/DuohbnXAjLrA0joQNVqSiaLbF+4+35tGMeAeSeQJ9rFtSheriOsP
 w5jAXl/gHudMyW7WrZ7Dj8CFM5mV25yrj078vN2QbmwRHosyMfNl7CaRNfpfplrOJj
 sX0qropT4kLqaoNP/pMr0UlSozE70OgBNODPeoeZ1Bbuuhu66Djar7uAY7Hvn8jM9e
 xX55G9tuv5TjJWMwM6wV/2/1WKizqoOHPmD9Y/SHJCxbDVIPVKCG1xX+fC08xMvBap
 KLVu4BmgZcyEQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qa28NKEp
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiocoap: bump to version
 0.4.12
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

On 23/12/2024 15:11, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-aiocoap/python-aiocoap.hash | 4 ++--
>  package/python-aiocoap/python-aiocoap.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-aiocoap/python-aiocoap.hash 
> b/package/python-aiocoap/python-aiocoap.hash
> index 33895b2387..30e68a7582 100644
> --- a/package/python-aiocoap/python-aiocoap.hash
> +++ b/package/python-aiocoap/python-aiocoap.hash
> @@ -1,6 +1,6 @@
>  # md5, sha256 from https://pypi.org/pypi/aiocoap/json
> -md5  09a0cce4b192d861d2becf216f0769fc  aiocoap-0.4.11.tar.gz
> -sha256  
> 2603b8ec61caedf008b4a153a94f337262bf89f26d1c030f12c492d085e875f7  
> aiocoap-0.4.11.tar.gz
> +md5  a79e7c7586cbb9056743683eb9bbaef9  aiocoap-0.4.12.tar.gz
> +sha256  
> 808e87068aa57dbf31486cfdfa9098b0a6f5ca444c6b8966f3e50a403628981e  
> aiocoap-0.4.12.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> c59b1339031e4495b336555be42b8b488eacfb037a23fadf2d5e2c8abd0e6366  
> doc/LICENSE.rst
>  sha256  
> 51d56d9e6f9755df590a329e73ca58663605a182a8e80f0166fff65203a1185a  
> LICENSES/BSD-3-Clause.txt
> diff --git a/package/python-aiocoap/python-aiocoap.mk 
> b/package/python-aiocoap/python-aiocoap.mk
> index a69722232c..357ac1da08 100644
> --- a/package/python-aiocoap/python-aiocoap.mk
> +++ b/package/python-aiocoap/python-aiocoap.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_AIOCOAP_VERSION = 0.4.11
> +PYTHON_AIOCOAP_VERSION = 0.4.12
>  PYTHON_AIOCOAP_SOURCE = aiocoap-$(PYTHON_AIOCOAP_VERSION).tar.gz
> -PYTHON_AIOCOAP_SITE = 
> https://files.pythonhosted.org/packages/50/b3/2ea6d3a294ec094da3175aceaa2ad1c2644eab162b48676267e992d4c651
> +PYTHON_AIOCOAP_SITE = 
> https://files.pythonhosted.org/packages/a2/16/a9167225339089b2c295cc37aa5a01f758d164c5cda591cc9d2976719196
>  PYTHON_AIOCOAP_SETUP_TYPE = setuptools
>  PYTHON_AIOCOAP_LICENSE = BSD-3-Clause, MIT
>  PYTHON_AIOCOAP_LICENSE_FILES = doc/LICENSE.rst 
> LICENSES/BSD-3-Clause.txt LICENSES/MIT.txt
> --
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
