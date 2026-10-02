Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6179CCA5FDD
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 12:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C0276071D;
	Fri,  2 Oct 2026 12:53:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w3kFaak5SN6Q; Fri,  2 Oct 2026 12:53:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3091960643
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790945596;
	b=THq9Qry5pTpL5vrhjAtiXKDdbbCkfOp+MXi6+s5vVYw2tUhx7ZAYv4UJWPeT8iPWA9XE
	 1ARl0fXQUrvGsGkapcHEXbeWX0cL05Xwa5Nf3T2jZgOupXr9Lvp4JwcW94kc+mIb/nfqg
	 Kpwu6uLY/NYt3apbrnenHU4LqpXo4AjT6UE05fVJPoyGco2gCEl9opENCjIp3l5CcKRfW
	 i+5jP8sSOSOMQ4H4cgbdSXDdWvyCD9bqrw6ouDRahYUQPazJMhug3ZukHtKU79/mItKp+
	 G+qYm/RV/YOHeNRfxcgfvOyklBHA55Q9FriM8taSVScGEIUUetwYwq69RomMS3tibCQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790945596;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:Date:From:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=SS1K3X6QY6JSMUyybkx0q7YRY21WIy36cltw2CCesic=;
	b=Mi0qTH7cshx8zJyGQhZZcdNxyIal0ZwHYVdTjMvHqbyyd6jT2zoKKnf4n7+rAig5HDf/
	 7Q7wXkPoPgl1a9cFDmEVqcqPutm11z8dDY3v3kOiSqM2kzckEzNSiRJTsoRcrNdkqnfFF
	 xZrk5jWhg+Avd2jEYiRKeiZa74skiVwbl3O9F+ysAEAHV4hGPXwHDv0rl4UWX38Q5lkb8
	 ULUQ3icag6cB0sXWuZOOslICSlHC6FGOO7qHtqApaTokUxQF+eWGu57I7ksa5m50wwZnu
	 RWUPZaaMhigSqyEdoV5SZRaCVx7u2AbnkYTTHV0WZmKd2Bot1BJytDJJ3TFYOqf7DDQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790945596;
	bh=SS1K3X6QY6JSMUyybkx0q7YRY21WIy36cltw2CCesic=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L2JIajJLuD/KGAOsBpTEY307ap1uR8eFKflUtes8FDnYkxHExM35rJsCLtbpkUfig
	 N8P01Ycen0KsH7gzYTkx2kv8rb9bfYmslHzNjZsWmJBlNLKns6JMVdSHrVwGP3gypc
	 uSOE4FpZ7zV1oGI1eXbSLERHY7AWu8HChONs2fEIVbNsFxOyIzSpj47S3N0vKv2FdM
	 DbJzX63FU+hzSL9/g8tBPqgDmp55QKMGAgj9cD9zPpT4rWgY+FDPt3ACtdRX2n953u
	 +El8srq0dPqZKlorN8/bTzn8a7w1cXHfeGV5vlyMY/ESUt9191CZgCdWfn/M3yYru+
	 6OQ6hATOTmYpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3091960643;
	Fri,  2 Oct 2026 12:53:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C95DC4C2
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 12:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB28A40B53
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 12:53:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8tbPOWPT15Vw for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 12:53:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9F06C40B49
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790945593;
 b=tEjq8L4R5kpsHIbIKq0/HdIimJHB5gKqLwebg/kZPIZBvmYfErhVnB8v9An/v3VKTzio
 AWljNLy1w9Wxlu5j4rDUrqSGQB98/rlYZbZ/oGtOQqRUdPg6+tVso0FlP6PH0g8xxgL2y
 l1yVrxWXuxidngwyfW3sC7L3ad7/XX0r2/QXeHoobWTWi0s6g0LD/x7vzjPGGN9r0caiF
 T/AAOfSOefcPbB5oGESyjvkpZm8W12eamGyXpyQO9mXoqizYC/6tk9+SRml6n1AGOupa2
 /6389vDUzufhI+KohvwI8+sFDYgGwknOg7JMrpBbOEAciobzBdeyyJ3x5BvlzS/hq5w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790945593;
 h=Received-SPF:Received:DKIM-Signature:Date:From:To:Cc:Subject:
 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
 In-Reply-To;
 bh=t7LpsGLOwyiI2J7f+4HHAQUDfzjAbRKc5t/d7sKO96Y=;
 b=NuOlqmDDsF8vE58ZXPK/c2uAj/AYbuewJBzSMzn2+1snsrBD4+5PAUwF3x0sjn2JOgW/
 9la92yqmUD12MbeLZaa2zzPyb6SWgP3/w2c2dI+aplAcP1ovxbXPbsbGFxJSO/aNcpjG5
 ww/lvDWU5G5uanxRIRCzVTOg3pxCMNVcT1Ofumb9+Bxg81ru1diWoEGOEKextLi+NG7EA
 iXue/KM1tO2nEoleT36kbwTIhUiiGhOnQKSZdVglKmgHKEIzMTzNUAKeXb6PjrMF1xeis
 dXGwMMtkFSjDDDlY70IezdoiBi48TopROvCIyOacFFZDz0YfQA8c1FBcixjw0PPQ2rw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=ideasonboard.com; 
 dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=E2nI1y2r; 
 arc=none smtp.remote-ip=213.167.242.64
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.167.242.64;
 helo=perceval.ideasonboard.com;
 envelope-from=laurent.pinchart@ideasonboard.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=ideasonboard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=E2nI1y2r
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F06C40B49
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 12:53:13 +0000 (UTC)
Received: from killaraus.ideasonboard.com
 (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0884D177;
 Fri,  2 Oct 2026 14:51:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1790945477;
 bh=xbNUFhKt5LQPQV7ccaCu9i4iZ4xxFAlLNwHBQM2C7V4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E2nI1y2r3ofVmoz02jntVEI/fvzkGTHW+ElEyFbCPTBvSfxVKbrZrYNboUqhte8B+
 qDRoxeKwDIngi+oaJSD+1XX55eN2zi0D6m2ss0mjoHm03or48lMuWh7rqaMyW6xIsi
 wGGghJ7L5cnL+CUCXXnR7gWOlBgQ4m7xwdpZjRsU=
Date: Fri, 2 Oct 2026 15:53:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: buildroot@buildroot.org, tomi.valkeinen@ideasonboard.com
Message-ID: <20261002125309.GB91932@killaraus.ideasonboard.com>
References: <20261002102335.12501-1-paul.elder@ideasonboard.com>
 <20261002102335.12501-3-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261002102335.12501-3-paul.elder@ideasonboard.com>
Subject: Re: [Buildroot] [PATCH 2/2] package/kmsxx: Add option for pykms
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Paul,

Thank you for the patch.

On Fri, Oct 02, 2026 at 07:23:33PM +0900, Paul Elder wrote:
> Add option to kmsxx to enable building pykms. While at it, add kmsprint
> and kmstest to the extra utils that are built as they are useful for
> testing and development.

Those are two unrelated changes, I would have split them in two patches.
I don't know if buildroot has strict requirements in that area.

> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> ---
>  package/kmsxx/Config.in |  7 +++++++
>  package/kmsxx/kmsxx.mk  | 10 ++++++++--
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kmsxx/Config.in b/package/kmsxx/Config.in
> index fa327ba18de1..dbf2c4ec2a42 100644
> --- a/package/kmsxx/Config.in
> +++ b/package/kmsxx/Config.in
> @@ -16,6 +16,13 @@ config BR2_PACKAGE_KMSXX
>  
>  if BR2_PACKAGE_KMSXX
>  
> +config BR2_PACKAGE_KMSXX_PYKMS
> +	bool "Enable Python bindings"
> +	depends on BR2_PACKAGE_PYTHON3
> +	depends on BR2_PACKAGE_PYTHON_PYBIND
> +	help
> +	  This option enables the pykms python bindings.
> +
>  config BR2_PACKAGE_KMSXX_INSTALL_TESTS
>  	bool "Install test programs"
>  	help
> diff --git a/package/kmsxx/kmsxx.mk b/package/kmsxx/kmsxx.mk
> index 5aeb48910c7e..f52a1047011a 100644
> --- a/package/kmsxx/kmsxx.mk
> +++ b/package/kmsxx/kmsxx.mk
> @@ -12,17 +12,23 @@ KMSXX_INSTALL_STAGING = YES
>  KMSXX_DEPENDENCIES = fmt libdrm host-pkgconf
>  KMSXX_CONF_OPTS = \
>  	-Dkmscube=false \
> -	-Dpykms=disabled \
>  	-Domap=disabled
>  
>  ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
>  KMSXX_CXXFLAGS += $(TARGET_CXXFLAGS) -O0
>  endif
>  
> +ifeq ($(BR2_PACKAGE_KMSXX_PYKMS),y)
> +KMSXX_CONF_OPTS += -Dpykms=enabled
> +KMSXX_DEPENDENCIES += python3 python-pybind
> +else
> +KMSXX_CONF_OPTS += -Dpykms=disabled
> +endif
> +
>  ifeq ($(BR2_PACKAGE_KMSXX_INSTALL_TESTS),y)
>  KMSXX_CONF_OPTS += -Dutils=true
>  # extra handling for some utils not installed by default
> -KMSXX_EXTRA_UTILS = kmsview kmscapture
> +KMSXX_EXTRA_UTILS = kmsview kmscapture kmsprint kmstest
>  ifeq ($(BR2_PACKAGE_LIBEVDEV),y)
>  KMSXX_DEPENDENCIES += libevdev
>  KMSXX_EXTRA_UTILS += kmstouch

-- 
Regards,

Laurent Pinchart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
