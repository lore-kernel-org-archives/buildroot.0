Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC13EA71AA
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 21:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF2B460AD1;
	Sun, 19 Apr 2026 21:08:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kKizC02y-Opg; Sun, 19 Apr 2026 21:08:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21ECA60FF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776632913;
	bh=aF03+oYPTkw1c0Zr2sA8dPAaru75LDN1exdi/EZ8iLk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mNSDvsWBNa+UdvvqQBwxoeV8WB11ywpLHWbgGreT7Fenxju3W4rGu5m0Tisl+TASO
	 NzIfc8nUedvdzgKge23YE9XJ/eRERe234rSmG9WcPfU49AYBNJz/SVvk2/A6ytjtLH
	 DF372DNr49OQWxL//GZRNShW7/+dIu1t5/Hkvzr5KlqA+VRCGx0y2T0B6OUUd1q9vs
	 fiQYmcGnV5ECu20Ji3l3Ki7CvB3TQ5vABFDMjN/jwaUIAmmW7CGcIZtSEJRd0fdjI3
	 eOQicNCr2ZgZ6W9Oef7lZQ3V6Z2TO5OkaM/mQDkmBZZQGfAKEylVsj3LwTomFpN5c7
	 UywFqYd1MhYWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21ECA60FF2;
	Sun, 19 Apr 2026 21:08:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E1A562B8
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 21:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6075817B1
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 21:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VQ4tdAo2N9xq for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 21:08:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D342D817AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D342D817AB
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D342D817AB
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 21:08:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id E892D60128;
 Sun, 19 Apr 2026 23:08:26 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Apr 2026 23:08:26 +0200
MIME-Version: 1.0
Date: Sun, 19 Apr 2026 23:08:26 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260417075936.3539214-1-bernd@kuhls.net>
References: <20260417075936.3539214-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <162d446beba5f059ac02816d6c37622b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776632909;
 bh=gqt0OLTpiHuHDpTjg9+sGIQiaVt1zXZW2hskYlgSAaM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lqF4XVK97kT/aTxnbsZUAKF0uT4wGiCY5rxYjTR7lxQgg5eNkLjWrTQoMqATJx5Ig
 u3vXJL2WtDkQRj96X9DqyUQFpXB4YN/6o4O7mxIMkbd2IyOkV/vduMD+Wv5vWfpcJH
 aW/DQcaUOLyO06JCWkLQDlYcF6ZW2ckUvRSXJxaDqdWr8Si0sJJnqMTCyS2E8V/1Oi
 ET8XfRgVm723/iB6REufoTxOKkNqS9dl0Xj6MpudsScm123XxIrVtsv+i5htkSg9LU
 6fSwzKgStbZdKfwtu9s/1S6fY37zkS8WabHH4hOlIDapH1PepX/pzoC/UTQe6Msb1B
 g2WROeTc/m/BQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lqF4XVK9
Subject: Re: [Buildroot] [PATCH v2 1/1] package/libcap-ng: bump version to
 0.9.3
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

Thanks for the v2.

On 17/04/2026 09:59, Bernd Kuhls wrote:
> https://github.com/stevegrubb/libcap-ng/blob/v0.9.3/ChangeLog
> 
> The source tarball is not distributed on the project site anymore so we
> switch to the github helper and need to enable autoreconf.
> 
> Added _POST_EXTRACT_HOOKS and dependency to host-pkgconf to fix
> autoreconf errors.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> v2: fixed autoreconf (Julien)
> 
>  package/libcap-ng/libcap-ng.hash |  2 +-
>  package/libcap-ng/libcap-ng.mk   | 16 ++++++++++++++--
>  2 files changed, 15 insertions(+), 3 deletions(-)
> 
[...]
> diff --git a/package/libcap-ng/libcap-ng.mk 
> b/package/libcap-ng/libcap-ng.mk
> index e544e27696..31e0ff8d64 100644
> --- a/package/libcap-ng/libcap-ng.mk
> +++ b/package/libcap-ng/libcap-ng.mk
> @@ -4,13 +4,25 @@
>  #
>  
> ################################################################################
> 
> -LIBCAP_NG_VERSION = 0.8.5
> -LIBCAP_NG_SITE = https://people.redhat.com/sgrubb/libcap-ng
> +LIBCAP_NG_VERSION = 0.9.3

I still have one build failure with test-pkg:
https://gitlab.com/jolivain/buildroot/-/jobs/13989916951

It seems this new version needs a toolchain with sync4.

Could you have a look, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
