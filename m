Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 075E4D5E36B
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 18:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAD318410C;
	Sat,  9 Nov 2024 18:48:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UOMkkkM-CNnF; Sat,  9 Nov 2024 18:48:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7362820E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7362820E8;
	Sat,  9 Nov 2024 18:48:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 97A0FD92
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 18:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8295E4013B
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 18:48:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7-kPCMSJYmYk for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 18:48:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2700B40242
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2700B40242
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2700B40242
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 18:48:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id C3A0E19F73B;
 Sat,  9 Nov 2024 19:48:06 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:44918])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 09 Nov 2024 19:48:06 +0100
MIME-Version: 1.0
Date: Sat, 09 Nov 2024 19:48:06 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20241109180822.744358-1-james.hilliard1@gmail.com>
References: <20241109180822.744358-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <0e9461ecfc25d5d7f46188502334acbe@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731178090;
 bh=wOL/EhRv4WwDfPWIe+rRHIjJ/WI95dVgyIgzvxsW3xM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=A8CHs4gvZI8e9i1trnL5FNaSbpd+YkzYf9uHFMv+iXNV0RDMQ/6Q1yLFVBlg9QKGP
 w6TIdRjkc5E0x3HMu4RCIzv/GoMCXTa/hTN9X9txM5ruhdOGY4vSS6auL8t5dkyJI6
 g01lC6JsQyBWcTYQrniRVBYoL9/g3yHfZSyPoaaE+Y1fVVno8lfPb7RdE+RsJP0wks
 xuaPUwX67S0Bo4/lJ6Sb1X4H811X8NAHTEmiFGGzc9g/euZil0XkmcdVeN/TJbLKWj
 Ee/v1LZKuwfNukU00QhJaw460klumlWPN+sNokYmuCAOU7ESsZw0ti/dDBTEJD9MFQ
 dwyxQTC8YTEkg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=A8CHs4gv
Subject: Re: [Buildroot] [PATCH 1/1]
 package/python-magic-wormhole-transit-relay: bump to version 0.4.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 09/11/2024 19:08, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks!

> ---
>  .../python-magic-wormhole-transit-relay.hash                  | 4 ++--
>  .../python-magic-wormhole-transit-relay.mk                    | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git 
> a/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.hash 
> b/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.hash
> index a72907222a..3f038728be 100644
> --- 
> a/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.hash
> +++ 
> b/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from 
> https://pypi.org/pypi/magic-wormhole-transit-relay/json
> -md5  99d1a7d2ff78e7de4a2f91698bc061cd  
> magic-wormhole-transit-relay-0.3.1.tar.gz
> -sha256  
> 2ef2efbe4d34f0e624870f842259fd733ba77152ed310af4349774a62884900e  
> magic-wormhole-transit-relay-0.3.1.tar.gz
> +md5  73be034b4a57e9d190cfb658cbaa5fbf  
> magic-wormhole-transit-relay-0.4.0.tar.gz
> +sha256  
> 912d835da21b11266c77111dc9b5e5800263fc0b98f0a179962267df41819e8c  
> magic-wormhole-transit-relay-0.4.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> d70f6469bb210c2aa4c0dfd74f498ef5f0467a137d8296479088e7243c5884eb  
> LICENSE
> diff --git 
> a/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.mk 
> b/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.mk
> index e557b456ed..03a2d416db 100644
> --- 
> a/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.mk
> +++ 
> b/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_VERSION = 0.3.1
> +PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_VERSION = 0.4.0
>  PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_SOURCE = 
> magic-wormhole-transit-relay-$(PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_VERSION).tar.gz
> -PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_SITE = 
> https://files.pythonhosted.org/packages/be/81/c5c19ea32d1d770f2513503fef4589c6958ae9b44c03ea121e9fbc74c704
> +PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_SITE = 
> https://files.pythonhosted.org/packages/d0/87/cb71073e53ea7e1b6f892c52e4114caea81b887a7d34e665b15dc81d669e
>  PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_SETUP_TYPE = setuptools
>  PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_LICENSE = MIT
>  PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_LICENSE_FILES = LICENSE
> --
> 2.34.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
