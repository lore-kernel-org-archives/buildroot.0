Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2F5C43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28F7882362;
	Fri, 26 Jun 2026 14:55:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bg1cUOxyFeIs; Fri, 26 Jun 2026 14:55:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49ADE82369
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485739;
	bh=GjAk1+8WGkaWSNY/rVNrbwISSNgSP6+gdZNGXH/91ow=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SNVmsG2bhtUhrXsQ5bpkn9iu7oM3Wq5UI3cSBcmbGPd4XQ0zZG5E84o3Aqvs8PsnU
	 Sj8vhXbEpDXp9hbepc47eoewTsnXjjnSwozhidiuQ4SMpYhsUXbPR/sps9GNNuen8N
	 yIA29vNQNONgxxfoZO/WhcgcqRm0nLc0YoPhIZeL+OZ3j8MdZHCMrJen9YAwSgzpk0
	 f7eeylQ4v0kf9kj0qW8BN9/z3E1RJCjDelq23CF0KGG6F/PvN2Nou0oYXab58vM863
	 18sjtqJNnIsls8d8vxmfKxNgLrmyXQbJhaxVXtExfGflaPLqC4rPlRbMA+5gE+K3j3
	 BWtxd5MwHPJOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49ADE82369;
	Fri, 26 Jun 2026 14:55:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 22CBC231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07F9A4068F
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:55:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sgbJ1JR-XyPH for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:55:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 20B87407B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20B87407B2
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 20B87407B2
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:55:31 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-46066e640easo583730f8f.1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485730; x=1783090530;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XFpBfF5q+fqWNsLYnkSkHYb8krUULvgBBES2h798Nvw=;
 b=F8/v4vN+8hlHC43ZiMWwEuHAOJxf8pgfiOhEOd4YW/KcrLz/jn6M3/krNb5u0KQXNQ
 O76vVBGCwz6iZVXBxc2DlfTwnnf9BxDERJx/JF1t84K5HXBYEUZL1eMJafivGVKHEyhw
 F/C1vnATaNzrOd70TkpYJ8cNCdQ9oma4lzhEqGaSA/lB02OTJjHuMO0O15NP0y6NGQnk
 nu7m8SI5zbx3+fNvRfT+K0RXVbvDP6cPD0eo9Vt7gt0vQ/95soLoEqnKNVyyJEzbVsIi
 dklwpuLv7VPqP1dviEfXI1HTfPRHkdmQl/GDML4rAJr5mBpHXkkoN6NOzktL1DM/lNLo
 kT0Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ99rJEpjfI+NTycNBhtSgAtID8pf2k6NkYabSl96hU5wU8JoK757kkcsVfdT4W8uBDUTI4Ho1dbzUw=@buildroot.org
X-Gm-Message-State: AOJu0YzJzMVlUuC6CGsJ9hsKQW54KU9QaaQ/m3yUJPWMX96ZHu5v0oxg
 Zab4/aQ81f/GDscOR7pB8zRwH7uRe91kIC4lfzdwjZd9E7RJMUMMJ8Gm2kRcEqz+Mf4=
X-Gm-Gg: AfdE7cnfFZdpXuRyayuedcAve0fqaoQNRy5iUlrjtu8lNDbyiNqCiRjtKG4mF4Y2YxI
 clStxmqTQzBsLlmiuD0pAN44koGzprjWM6UJOHPhQaNHxKYXeikowDuQrbhdMZv8xNmg8qak4Zr
 Kxy9uXV26xBxRFygNs1hHoPEqa4RHfliaUxbziaspMMh0Gcg5Ws8ifn4IQIIYV3Y059PTN7kFCs
 vpOo9t9UqUBRCN3lpEl1b+iWqjcJqpNpuZak2T2Y0P2e06iOR4EFHpfV4ZqsntfqtC4RuJCACVO
 BWEozTjUiXynBl0V8RvpQChrrUnSxvdjE9xLA7B5zEdSF4CGdey+0A3FHNtzTMNYhuSsAu8q6Oy
 NunqoCPtawXtqC+d+73Y7MH5fduBLa0dFYg/tcVFA92lzaPgYaCFyymZmjZHAiqhezX56lNipVn
 GMG7SG
X-Received: by 2002:a05:600c:3b24:b0:490:bd66:db49 with SMTP id
 5b1f17b1804b1-49266850100mr106200665e9.12.1782485730015; 
 Fri, 26 Jun 2026 07:55:30 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49268fe949csm98459225e9.5.2026.06.26.07.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:55:29 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:55:29 +0200
Message-ID: <20260626145529.343116-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260620062208.18846-1-bernd@kuhls.net>
References: <20260620062208.18846-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485730; x=1783090530; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XFpBfF5q+fqWNsLYnkSkHYb8krUULvgBBES2h798Nvw=;
 b=cBmRZNlsK122q8kiXM//lLZWNHm4bbUi8gIFjb/fWHvNkPjjQ/MeBXUrsIBlf/yJsU
 tkeiYSj5WpDlsLWa4wI+mLS1MaSLx9dpaKS8jXT3jUTv9Ak4yhrW1OsIosY3A1mv0ysU
 iJqqSUX6Sh4K+pmgasghbJvZlg3U4Xdbyu0ITNiyfYJgVal0+Ucfes3TTtl+/SuGfDYU
 kDgAAhVgIFA7NnB1CcE42e5Lb+RJFrF5xf4V/fsabXvoeZr8wcEF4Rz38FKVbSUeAitX
 PTs1jkhtmaeCesiHeb7FCdAbOImABC2HWeWYNStU9YITyjKb+gWDsdMyRMhze5M6eLyk
 MP4g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cBmRZNls
Subject: Re: [Buildroot] [PATCH 1/1] package/fetchmail: security bump
 version to 6.6.5
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> https://sourceforge.net/p/fetchmail/mailman/message/59347909/
> 
> "## SECURITY BUGFIX
> * POP3 with RPA: fix calculation of buffer sizes to avoid buffer
>   overflow on long service challenges with long user IDs"
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.05.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/36fbe2c58ab4004f93e49a1e6f74fc2f0b77cff3
> 
>  package/fetchmail/fetchmail.hash | 4 ++--
>  package/fetchmail/fetchmail.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
> index 60c950476c..cbf1ef2afb 100644
> --- a/package/fetchmail/fetchmail.hash
> +++ b/package/fetchmail/fetchmail.hash
> @@ -1,4 +1,4 @@
> -# From https://sourceforge.net/p/fetchmail/mailman/message/59332343/
> -sha256  efe01690d22bda359a579c77e2b0072658a092bff490ec0478a212c6b7d0eb70  fetchmail-6.6.4.tar.xz
> +# From https://sourceforge.net/p/fetchmail/mailman/message/59347909/
> +sha256  ab0320fe4df0b5ee8659189e66590d9de96aadbf929fe59f353ae7a317e9ef1e  fetchmail-6.6.5.tar.xz
>  # Locally computed:
>  sha256  48aea24325e55932dbd79b30f558b9c87a416d675fe5f94445e8be5cb6606fde  COPYING
> diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
> index d021c2c7bd..9b3c035844 100644
> --- a/package/fetchmail/fetchmail.mk
> +++ b/package/fetchmail/fetchmail.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  FETCHMAIL_VERSION_MAJOR = 6.6
> -FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).4
> +FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).5
>  FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
>  FETCHMAIL_SITE = https://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
>  FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
