Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B34F8D779
	for <buildroot@archiver.kernel.org>; Thu, 16 Apr 2026 20:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDE4840A5B;
	Thu, 16 Apr 2026 20:32:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ahkMjSeXAlOn; Thu, 16 Apr 2026 20:32:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB76940A5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776371534;
	bh=K9cX2gbs6jV4M0cfTph6VJ7dzB8hoH4uB77YcBagXCI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=tCIEnv5xu6xaQ6iy9JmMW38UbMC60uZGUMK8EDBcRiZcC58CEXYGzYw4jvhdCo5hw
	 gbNiKRvVIUvMs8VnpY8NZrOhNLmi1f6KNar+mvp6edGK6WyXI6ThnWF6KW8G/QpIcM
	 bP+Lfi4ZnAdm0+GJYZS1PY4jl1lnfLuJB2KRvzqbtq2lqbDkPeEE9AhuSIwqIHRAJN
	 YDXxj/+uUI8sxpgRejmuQO+NSlCX5f+IVnHXmmbhsQmxeEZuWOR8NpOMEofs22Zwd9
	 4E+aCbCkjX0sFZlyLi8LgHoQwfTlA6RCafdIWaCJeT7NjzFqO8ZnkUIh58e3uu9jWh
	 Sq8nB3pqVVF6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB76940A5C;
	Thu, 16 Apr 2026 20:32:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 232F5EE
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 20:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 091D940A5C
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 20:32:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SVfpgs8DnU3Q for <buildroot@buildroot.org>;
 Thu, 16 Apr 2026 20:32:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8A2A240A5B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A2A240A5B
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8A2A240A5B
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 20:32:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 58C5019F5A7;
 Thu, 16 Apr 2026 22:32:07 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 16 Apr 2026 22:32:07 +0200
MIME-Version: 1.0
Date: Thu, 16 Apr 2026 22:32:07 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260416073503.3605369-1-bernd@kuhls.net>
References: <20260416073503.3605369-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <a8ddca68d2303f24a3879b5af10b777a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776371529;
 bh=H5nH9aw/XahMstf6KEbbwj88gwrxSoKuC8Ph6NtkrlU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dJKIPJGEUOvv0e68O3ZWyDde2JIjzW6Dfs4gkRQt/o6dJis87qSiyFSv3dWfKdTNg
 AWlhboh1sI3auYF73uh3PaYQUQ7AjhBxy+iROn/KxS4gMGHkbpUaIJF09O4q1sghL9
 UkWc6HuyUNvwN0Xj3rPeHePXWnI2h2Rf71hJu5dFFuopWAIzGyTpQFbz3HbwrKoI/p
 alHcu6Lk7JY6ZfZ+fpyKuJQag72BwuVUCA38wbwwaoU4dNpvRCeOjg9cOc0Fu0ahTA
 agakItidiwkIzAVdTQvESyAxbCFM6526QkcBA+C1oFUdCfQG1DjDgJloBhekV16FIb
 Ml4LQ5uka0ckQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dJKIPJGE
Subject: Re: [Buildroot] [PATCH 1/1] package/libcap-ng: bump version to 0.9.3
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

On 16/04/2026 09:35, Bernd Kuhls wrote:
> https://github.com/stevegrubb/libcap-ng/blob/v0.9.3/ChangeLog
> 
> The source tarball is not distributed on the project site anymore so we
> switch to the github helper and need to enable autoreconf.
> 
> Added _POST_EXTRACT_HOOKS to fix autoreconf error.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libcap-ng/libcap-ng.hash |  2 +-
>  package/libcap-ng/libcap-ng.mk   | 11 +++++++++--
>  2 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libcap-ng/libcap-ng.hash 
> b/package/libcap-ng/libcap-ng.hash
> index 022dd1f895..d79ef54d07 100644
> --- a/package/libcap-ng/libcap-ng.hash
> +++ b/package/libcap-ng/libcap-ng.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated
> -sha256  
> 3ba5294d1cbdfa98afaacfbc00b6af9ed2b83e8a21817185dfd844cc8c7ac6ff  
> libcap-ng-0.8.5.tar.gz
> +sha256  
> fe11ebbb55904763b3532f19069f13ec319042634620180a03bd4653d301563e  
> libcap-ng-0.9.3.tar.gz
>  sha256  
> 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  
> COPYING
>  sha256  
> f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa  
> COPYING.LIB
> diff --git a/package/libcap-ng/libcap-ng.mk 
> b/package/libcap-ng/libcap-ng.mk
> index e544e27696..6bb6b80fc5 100644
> --- a/package/libcap-ng/libcap-ng.mk
> +++ b/package/libcap-ng/libcap-ng.mk
> @@ -4,12 +4,19 @@
>  #
>  
> ################################################################################
> 
> -LIBCAP_NG_VERSION = 0.8.5
> -LIBCAP_NG_SITE = https://people.redhat.com/sgrubb/libcap-ng
> +LIBCAP_NG_VERSION = 0.9.3

This new version fail to build (at configure time). See:
https://gitlab.com/jolivain/buildroot/-/pipelines/2458854963

Could you have a look please?

> +LIBCAP_NG_SITE = $(call 
> github,stevegrubb,libcap-ng,v$(LIBCAP_NG_VERSION))
>  LIBCAP_NG_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
>  LIBCAP_NG_LICENSE_FILES = COPYING COPYING.LIB
>  LIBCAP_NG_CPE_ID_VALID = YES
>  LIBCAP_NG_INSTALL_STAGING = YES
> +# github tarball does not include configure
> +LIBCAP_NG_AUTORECONF = YES
> +
> +define LIBCAP_NG_CREATE_MISSING_FILES
> +	touch $(@D)/NEWS
> +endef
> +LIBCAP_NG_POST_EXTRACT_HOOKS += LIBCAP_NG_CREATE_MISSING_FILES
> 
>  LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
>  LIBCAP_NG_CONF_OPTS = --without-python3
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
