Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D060AC83038
	for <buildroot@archiver.kernel.org>; Wed,  2 Jul 2025 19:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8222041BE7;
	Wed,  2 Jul 2025 19:09:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pzPfOAFPwT60; Wed,  2 Jul 2025 19:09:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA8AE41B62
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA8AE41B62;
	Wed,  2 Jul 2025 19:09:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E067B196
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 19:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6C6041556
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 19:09:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LfU5lpxBdEDI for <buildroot@buildroot.org>;
 Wed,  2 Jul 2025 19:09:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CB17640406
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB17640406
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB17640406
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 19:09:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 67FC22003BE;
 Wed,  2 Jul 2025 21:08:57 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 02 Jul 2025 21:08:57 +0200
MIME-Version: 1.0
Date: Wed, 02 Jul 2025 21:08:57 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250702063549.2096156-1-peter@korsgaard.com>
References: <20250702063549.2096156-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <8bd613913d8e5e38a4962b18729346a6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751483338;
 bh=3ecmCkggUl7NMs5d5kRHyfeJmaHc+AS5CxPsdcfY+hc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fym3c8aPiHjRq+MyZksEH1/8EzsyvRlrsJagRww0Xpju7i6b5jcpZLU5Pw/3FNr+Y
 pEKt/dg21f0IcHGh6QIlCJZ9kXJf8ADhK0ruV6XE7q0QUXUFk3rx3egBp95FX/Bed1
 z82IjMMBk26X0Nd5/l9pAN52ouy02fnL8Pe5VLPlC6EH/I3I4Tf75KE2Mi+5IKaok9
 lGUqBis3mJ/HWRbomkcSbX777fbhVKV/pr9/LAEAziP79CqQ0qrMmi8zLqbHCkTFCb
 wt6Rysf0VvNW42ohhAhoG44MbF0Io7KsbXPd3eyPX1KalaY1cbU0nf+O/X++E1LRmx
 i33mQT6GuIItQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fym3c8aP
Subject: Re: [Buildroot] [PATCH] package/sudo: security bump to version
 1.9.17p1
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

On 02/07/2025 08:35, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> - CVE-2025-32462: Sudo before 1.9.17p1, when used with a sudoers file 
> that
>   specifies a host that is neither the current host nor ALL, allows 
> listed
>   users to execute commands on unintended machines (since sudo 1.8.8)
> 
>   https://www.sudo.ws/security/advisories/host_any/
> 
> - CVE-2025-32463: Sudo before 1.9.17p1 allows local users to obtain 
> root
>   access because /etc/nsswitch.conf from a user-controlled directory is 
> used
>   with the --chroot option (since sudo 1.9.4)
> 
>   https://www.sudo.ws/security/advisories/chroot_bug/
> 
> Update the LICENSE.md hash for a change in copyright years:
> https://github.com/sudo-project/sudo/commit/30729312c2091f3891daa39b571efa40cb261785
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
