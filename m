Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A26E7718B
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 14:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13CC780BD1;
	Fri, 27 Dec 2024 14:39:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4QM4s15zejOg; Fri, 27 Dec 2024 14:39:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C7A380BF6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C7A380BF6;
	Fri, 27 Dec 2024 14:39:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 323D8F1B
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20509402BE
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:39:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g6cQofab6RRS for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 14:39:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E8C4A402B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8C4A402B5
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E8C4A402B5
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:39:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 341692003C3;
 Fri, 27 Dec 2024 15:39:47 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:42118])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Dec 2024 15:39:47 +0100
MIME-Version: 1.0
Date: Fri, 27 Dec 2024 15:39:47 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241223160955.1856359-1-james.hilliard1@gmail.com>
References: <20241223160955.1856359-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <e779b9c3ff277e0548d34d3cccda42d8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735310388;
 bh=s+IKAp/UBlQD/qAq911PAd+xIUe5cDyz02xUh2n3kAI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mcPRJH/vcKA7R8GiFC1lTJy0qEEja4HMCH7BCVq0SzIFIPRrCRLkcZfjgTn8KH/dx
 1L3aJIpC2eUkKA2WcMVlLn5+Nkp4+1INpwtlx1LCSDDeI3c6HoU6Zi3gKuxlBvU+WP
 VMHl5ES8vOPqDcodp9uBOvV7ykzUuczAfNfJlBmi7TK2AAvkalCc61cWcmF5PZd7D4
 DDjKnCq5nDpElJLso0heTK07uShdXpGRVzTnDNsxS1UZO/8um7W34R7asBbqKw3i1M
 3x5zKW835YrcC3sa7Ui9Hu91WmqE8KY1oLoLwZslkIpqe2EoiLpaO9BOM2s1q6ZKi6
 gFqTNrE/jp4gg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mcPRJH/v
Subject: Re: [Buildroot] [PATCH 1/1] package/python-channels-redis: bump to
 version 4.2.1
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

On 23/12/2024 17:09, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-channels-redis/python-channels-redis.hash | 4 ++--
>  package/python-channels-redis/python-channels-redis.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-channels-redis/python-channels-redis.hash 
> b/package/python-channels-redis/python-channels-redis.hash
> index 6b62d0d6a2..3fc82ebb5c 100644
> --- a/package/python-channels-redis/python-channels-redis.hash
> +++ b/package/python-channels-redis/python-channels-redis.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/channels-redis/json
> -md5  e43a397dd3049f382a9c8b91d0f62c79  channels_redis-4.2.0.tar.gz
> -sha256  
> 01c26c4d5d3a203f104bba9e5585c0305a70df390d21792386586068162027fd  
> channels_redis-4.2.0.tar.gz
> +md5  a6d2eafea6e44440bb30f0a62de5d089  channels_redis-4.2.1.tar.gz
> +sha256  
> 8375e81493e684792efe6e6eca60ef3d7782ef76c6664057d2e5c31e80d636dd  
> channels_redis-4.2.1.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  
> LICENSE
> diff --git a/package/python-channels-redis/python-channels-redis.mk 
> b/package/python-channels-redis/python-channels-redis.mk
> index 7ca065ce0e..f91e96c849 100644
> --- a/package/python-channels-redis/python-channels-redis.mk
> +++ b/package/python-channels-redis/python-channels-redis.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_CHANNELS_REDIS_VERSION = 4.2.0
> +PYTHON_CHANNELS_REDIS_VERSION = 4.2.1
>  PYTHON_CHANNELS_REDIS_SOURCE = 
> channels_redis-$(PYTHON_CHANNELS_REDIS_VERSION).tar.gz
> -PYTHON_CHANNELS_REDIS_SITE = 
> https://files.pythonhosted.org/packages/fd/c8/d8e4d369a4cbce5dc86e84a559993001d471327f1ef57c13ffc82bdc9efa
> +PYTHON_CHANNELS_REDIS_SITE = 
> https://files.pythonhosted.org/packages/c7/6d/c379c9feea4522cbdb4eba9b3d23a6270ba8cbd94e847b21834d898109d6
>  PYTHON_CHANNELS_REDIS_SETUP_TYPE = setuptools
>  PYTHON_CHANNELS_REDIS_LICENSE = BSD-3-Clause
>  PYTHON_CHANNELS_REDIS_LICENSE_FILES = LICENSE
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
