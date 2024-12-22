Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF92E77188
	for <buildroot@archiver.kernel.org>; Sun, 22 Dec 2024 14:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAC05605CB;
	Sun, 22 Dec 2024 14:10:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MnBXgT6OJxQb; Sun, 22 Dec 2024 14:10:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A44CA60A3F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A44CA60A3F;
	Sun, 22 Dec 2024 14:10:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A12ED3
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AC5B60A3F
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:10:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QsvefNg08jsf for <buildroot@buildroot.org>;
 Sun, 22 Dec 2024 14:10:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 05DA1605CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05DA1605CB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 05DA1605CB
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 14:10:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 425FAB00579;
 Sun, 22 Dec 2024 15:10:31 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:53540])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Dec 2024 15:10:31 +0100
MIME-Version: 1.0
Date: Sun, 22 Dec 2024 15:10:31 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Marcin Niestroj <m.niestroj@grinn-global.com>
In-Reply-To: <20241219014838.260211-1-james.hilliard1@gmail.com>
References: <20241219014838.260211-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <8f13366624576b3062f97466d025dc2a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734876633;
 bh=LmoOhZ1dd19G6xBm6gfYv0AKqUs+4V/JjKSba8dT5cU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OY4iAqEe8XHw4fH1soUnR91xbvScaCTp2PlbSXBnPQHZT6EI+gWfiAgFbhK9TFwYP
 01VF1u6KOZgkb1PV6UUx8hKzJJ0k4UBdzjhazg0WsHZelJi5Y9Ix5RXul1fsS02/e4
 RPPMQEAVM1o+LiNCDw2U3CpHDAOFdmx+1gMpRiPRw7WYcPXYp92efPdU312+GPop7T
 pfuLmY4zOkGyymCZ1WxyWdn8K9Ba8A22jSR8JaC4J94A+6aJ1kxF2Md5we5ri7te/O
 qRUqBLkSStnbuj5AOGvbVYI1fGjU0XKJDv0Nc+2JGcm2RDZxQFCaOkKdThiWeFy3Lp
 Tc+8smeq4nH+Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OY4iAqEe
Subject: Re: [Buildroot] [PATCH 1/1] package/python-dbus-fast: bump to
 version 2.24.4
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

On 19/12/2024 02:48, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-dbus-fast/python-dbus-fast.hash | 4 ++--
>  package/python-dbus-fast/python-dbus-fast.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-dbus-fast/python-dbus-fast.hash 
> b/package/python-dbus-fast/python-dbus-fast.hash
> index 4234fc0501..1a618f6060 100644
> --- a/package/python-dbus-fast/python-dbus-fast.hash
> +++ b/package/python-dbus-fast/python-dbus-fast.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/dbus-fast/json
> -md5  3d7ef3e3ae2691d45dcf3d07511eca4f  dbus_fast-2.24.3.tar.gz
> -sha256  
> 9042a1b565ecac4f8e04df79376de1d1d31e4c82eddb6e71e8b8d82d0c94dd3d  
> dbus_fast-2.24.3.tar.gz
> +md5  fc28b83adf21cb05b3286ff3d69aab76  dbus_fast-2.24.4.tar.gz
> +sha256  
> 58f97e8342d6cd11ebb2c8ac959c5bb342eb83e29180528690b323a5a5def41c  
> dbus_fast-2.24.4.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> c37e9c75110e01d1f0c5360dc7d7776a30ac5f70d2440db214423e4b7a77a6af  
> LICENSE
> diff --git a/package/python-dbus-fast/python-dbus-fast.mk 
> b/package/python-dbus-fast/python-dbus-fast.mk
> index 60d0b7e9af..2a9da7d780 100644
> --- a/package/python-dbus-fast/python-dbus-fast.mk
> +++ b/package/python-dbus-fast/python-dbus-fast.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_DBUS_FAST_VERSION = 2.24.3
> +PYTHON_DBUS_FAST_VERSION = 2.24.4
>  PYTHON_DBUS_FAST_SOURCE = dbus_fast-$(PYTHON_DBUS_FAST_VERSION).tar.gz
> -PYTHON_DBUS_FAST_SITE = 
> https://files.pythonhosted.org/packages/0a/37/a27e7f2dc6a18b5dcee70ffb08013a33770c2154a51fb5e2c04a7f4169fa
> +PYTHON_DBUS_FAST_SITE = 
> https://files.pythonhosted.org/packages/1f/91/b04e2dca706bddcd419352b5f623e8860c04adf2dd6ceef6116df4de4f6a
>  PYTHON_DBUS_FAST_SETUP_TYPE = poetry
>  PYTHON_DBUS_FAST_LICENSE = MIT
>  PYTHON_DBUS_FAST_LICENSE_FILES = LICENSE
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
