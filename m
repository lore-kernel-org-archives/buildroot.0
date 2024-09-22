Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD86CF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B3BA813B8;
	Sun, 22 Sep 2024 10:27:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YLhSEcTnUD2k; Sun, 22 Sep 2024 10:27:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F7E981393
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F7E981393;
	Sun, 22 Sep 2024 10:27:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C21351BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD6884024D
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:27:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bBB7RYZehM7F for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:27:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 420F14023E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 420F14023E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 420F14023E
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:27:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D712F5FFB7;
 Sun, 22 Sep 2024 12:27:41 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 22 Sep 2024 12:27:41 +0200
Date: Sun, 22 Sep 2024 12:27:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <Zu_xHUo7ucmhK5I2@landeda>
References: <20240922083027.1005650-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240922083027.1005650-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1727000865;
 bh=1+w6R+F+3Twcg9jpGGOqjd6f35G+Nkie0WDzjKYGVZE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JmDTI+V3CNK8EXXOJIqLiZyr0q9e98IZ91Mo2ETdWSdq40mDuGE1sygAgMR31WG0Z
 Pgi3kw2feQPh+xFs/HyfsxLD3eGqijZdXL4tmK8tkiJIp5wJRdeTjHEhG1eE9K7ckv
 GO3tYFwhkh0QtTyqIzQSiPBLhBHVru2CPCjaXGV9M1W4UmVlZwsYXy40ZOOz08bwvF
 eYsH8W0kt+ay5bcHPFi16avRvr9SjUlsBwXKalwLBdjYZhrkClut8m8/6pRt/U9PuC
 TcJCSX4tzVZN8yMy/F9ZGj5tvYrIe0zHLBEMJVMUkGFQtoG+f2WZ3c5m9llmoU6oZW
 bVHIQI75COfJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JmDTI+V3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-configobj: bump to
 version 5.0.9
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2024-09-22 02:30 -0600, James Hilliard spake thusly:
> Drop no longer required python-six runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/python-configobj/python-configobj.hash b/package/python-configobj/python-configobj.hash
> index 682dc987f1..b173f0cdd7 100644
> --- a/package/python-configobj/python-configobj.hash
> +++ b/package/python-configobj/python-configobj.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/configobj/json
> -md5  8dda7b31bb3aea87ecfe3b7a87812b17  configobj-5.0.8.tar.gz
> -sha256  6f704434a07dc4f4dc7c9a745172c1cad449feb548febd9f7fe362629c627a97  configobj-5.0.8.tar.gz
> +md5  496b60edcd943a900ddc0cb04132e81c  configobj-5.0.9.tar.gz
> +sha256  03c881bbf23aa07bccf1b837005975993c4ab4427ba57f959afdd9d1a2386848  configobj-5.0.9.tar.gz
>  # Locally computed sha256 checksums
> -sha256  0d95e648469a711f5ec1e59e6d4492150ec65d968c1ea6c6d96154a92879997a  LICENSE
> +sha256  fd227649f1956788444397bf0899e977140a5bc662d86826657bc2aad833fe2a  LICENSE

And so, what changed in the liense file?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
