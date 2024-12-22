Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1053EE77188
	for <buildroot@archiver.kernel.org>; Sun, 22 Dec 2024 14:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD9F4605CB;
	Sun, 22 Dec 2024 14:10:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yMmZNjrST6lL; Sun, 22 Dec 2024 14:10:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9CE360A53
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9CE360A53;
	Sun, 22 Dec 2024 14:10:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 67BC45E
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 486E560A53
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:10:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y9PGpLT3eUXv for <buildroot@buildroot.org>;
 Sun, 22 Dec 2024 14:10:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 42C9360A3F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42C9360A3F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 42C9360A3F
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:10:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 2F0BCB00563;
 Sun, 22 Dec 2024 15:10:00 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:43048])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Dec 2024 15:10:00 +0100
MIME-Version: 1.0
Date: Sun, 22 Dec 2024 15:10:00 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241219012533.242119-1-james.hilliard1@gmail.com>
References: <20241219012533.242119-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <01fee84bf74a6ca151eba6b19305e9d4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734876601;
 bh=IqZiHB+V1aRAIFCOrtPH3rxUr8rH2lFlXPsGEVElN1k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EKBZtXxP1d5dn3VeHeLn3H+G6hYrp+c3ykIcTc5HaRzlIDadnVTUXbbenuUrHW1zU
 sAK2D9mNRBWDop9oKEU8sZmZ/A+5/aIVqfLfJPpJe3GhXo4bbiRTEKAjm+v7xYJMYH
 X3KqKspZuHzNmlNluRUq9juhfRBNRHSxKcTFDHTcG71SW85rzrndSYoMdkko7dgmcB
 pxMbRpL221SHrVaIWkzREGKnAxpTR0urkrBmdtmCwVNGWSWo7SMnCpg/UA25sfnDG5
 XwBy4SRUdJpkWV42jB6TWmLio648clvJPNRBGv3bzBIphqZe7BsCRtg51msdwruQxi
 G93rca7/N7sfA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EKBZtXxP
Subject: Re: [Buildroot] [PATCH 1/1] package/python-asyncssh: bump to
 version 2.19.0
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

On 19/12/2024 02:25, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-asyncssh/python-asyncssh.hash | 4 ++--
>  package/python-asyncssh/python-asyncssh.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-asyncssh/python-asyncssh.hash 
> b/package/python-asyncssh/python-asyncssh.hash
> index d3c2f642bd..dbc5232d15 100644
> --- a/package/python-asyncssh/python-asyncssh.hash
> +++ b/package/python-asyncssh/python-asyncssh.hash
> @@ -1,6 +1,6 @@
>  # md5, sha256 from https://pypi.org/pypi/asyncssh/json
> -md5  9c61e713b1630f62aa1a690744573e1b  asyncssh-2.18.0.tar.gz
> -sha256  
> 1a322161c01f60b9719dc8f39f80db71e61f3f5e04abbc3420ce503126d87123  
> asyncssh-2.18.0.tar.gz
> +md5  3da75998b89240d5473a92419d3d187e  asyncssh-2.19.0.tar.gz
> +sha256  
> 723dead4d068b558708dc66a4ca7e7a93a813aa9416036eccb9af4c03ae2cf30  
> asyncssh-2.19.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> 0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  
> LICENSE
>  sha256  
> 68c286b0cf4507bec8922103efe861adb0bd3218003b1ec1b25e2e64bdd76bd3  
> COPYRIGHT
> diff --git a/package/python-asyncssh/python-asyncssh.mk 
> b/package/python-asyncssh/python-asyncssh.mk
> index 60a559f0b9..f053453a7b 100644
> --- a/package/python-asyncssh/python-asyncssh.mk
> +++ b/package/python-asyncssh/python-asyncssh.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_ASYNCSSH_VERSION = 2.18.0
> +PYTHON_ASYNCSSH_VERSION = 2.19.0
>  PYTHON_ASYNCSSH_SOURCE = asyncssh-$(PYTHON_ASYNCSSH_VERSION).tar.gz
> -PYTHON_ASYNCSSH_SITE = 
> https://files.pythonhosted.org/packages/25/69/8ea398f5aa6ae8fa7d007feb262d83aa9304e4a6a1accf7a104b37fef97e
> +PYTHON_ASYNCSSH_SITE = 
> https://files.pythonhosted.org/packages/75/85/c723aa7dd69570a31b6638c1405e659712f18f569f280da2da27989445d3
>  PYTHON_ASYNCSSH_SETUP_TYPE = setuptools
>  PYTHON_ASYNCSSH_LICENSE = EPL-2.0 or GPL-2.0+
>  PYTHON_ASYNCSSH_LICENSE_FILES = LICENSE COPYRIGHT
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
