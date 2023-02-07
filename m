Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7922AC636D3
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 17:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28EF16102C;
	Tue,  7 Feb 2023 17:23:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28EF16102C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uI9u2tCcT1xG; Tue,  7 Feb 2023 17:23:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B7CE61020;
	Tue,  7 Feb 2023 17:23:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B7CE61020
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C8F31BF5F6
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 337C181EA8
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:23:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 337C181EA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fEYu7_iJE_m7 for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 17:23:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46C8181EA1
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 46C8181EA1
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 17:23:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5082013F86F;
 Tue,  7 Feb 2023 18:23:42 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 07 Feb 2023 18:23:42 +0100
Date: Tue, 7 Feb 2023 18:23:42 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230207172342.GN4124@scaer>
References: <20230207163119.292389-1-thomas.petazzoni@bootlin.com>
 <20230207163119.292389-3-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230207163119.292389-3-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675790624;
 bh=meF1ShPcRa4NMQsmBWG1Ks162ccKI3KwXSVSXVLg5SQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sXRZ9vz7PK720nuzaCQzppG/3VgtAXMR3NQh1eBvgZKQvo5ozsrKkC9VoX+fp0K3R
 SshPtCRAk+k+9qoOOBwCuTWqTTGaUB5zOjkNE+4UqCKKfazrDSoz/QngTdJHCQxeYv
 QFEghSmMOZGJpy5iNCq+9SKC5LUn5lPefK+irLeySEDbl/DE0KgUVY1ccg1vpXZACO
 uPf9c3dOMFYdDdbPpnpMqCvTXi/BOwRf+b3O+kpzQLfy7j5LlVMH/iaYeFDV4cbk9s
 jjI8DkA7mijuBBMGVm03utd6YFBa/thzyjWOX1vRQNTVFifg/p7oJLvfOJdrmLdagN
 NYQJHgdFbOAbw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sXRZ9vz7
Subject: Re: [Buildroot] [PATCH 3/3] .gitlab-ci.yml: update Docker image to
 use
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
Cc: Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-02-07 17:31 +0100, Thomas Petazzoni via buildroot spake thusly:
> We have a new Docker image, updated with the new requirements from
> bcd15aa08aab1e8292b93995c44dc765a9801632 ("support/docker: add
> python3-magic"), but also with an updated Debian Bullseye
> installation. Let's use it.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .gitlab-ci.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index cad35c96bc..ed17bb14b9 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -1,7 +1,7 @@
>  # Configuration for Gitlab-CI.
>  # Builds appear on https://gitlab.com/buildroot.org/buildroot/pipelines
>  
> -image: $CI_REGISTRY/buildroot.org/buildroot/base:20220206.1756
> +image: $CI_REGISTRY/buildroot.org/buildroot/base:20230207.1123
>  
>  stages:
>    - generate-gitlab-ci
> -- 
> 2.38.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
