Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C603F428F5
	for <buildroot@archiver.kernel.org>; Wed, 15 Apr 2026 20:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDC7C400B2;
	Wed, 15 Apr 2026 20:44:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Yj5HHXS0oCU; Wed, 15 Apr 2026 20:44:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D37F640066
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776285869;
	bh=ZxtoDCqEKLdnqILCOy/OuOgIP/DCkIju7NksWSXwGIQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SIESiMjW8KJiNQuE2ZsatJkH0ZllbA9tqRD4vPrHHTrG+kArSXjhYRFQSqXwEVUFJ
	 WMIzqGiA9wWN/U+dfMQ0YKq4m8I6oK8ZhFzbvJGGp9RkLiUZVxSj0Kn+MEdpWpexgn
	 w4FJDg91V1Q23xXKEK3meZreJp7X71r2bk0CmrjPgzLVqcTN8SzaVKn0DJVnxXwvE0
	 CCvWlhk0uHvloMTD+KH7lR+tTZFRno2C+/xf+vO2fBXw/uzYRarMMwtOxKVuDHUxao
	 UoWiOAlT+V7CkydoVLU0QShacB1rnJ19IHvnY44M4IPjaEWbTQaTDR47lC/7KiHKhK
	 0zsmGRTISyTSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D37F640066;
	Wed, 15 Apr 2026 20:44:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 564A5283
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 20:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4852F40066
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 20:44:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vaB6MjoDlgqP for <buildroot@buildroot.org>;
 Wed, 15 Apr 2026 20:44:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2D14740060
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D14740060
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D14740060
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 20:44:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 8C4992003C8;
 Wed, 15 Apr 2026 22:44:23 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 15 Apr 2026 22:44:23 +0200
MIME-Version: 1.0
Date: Wed, 15 Apr 2026 22:44:23 +0200
To: Alexander Shirokov <shirokovalexs@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260415152504.484373-1-shirokovalexs@gmail.com>
References: <20260415152504.484373-1-shirokovalexs@gmail.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <380cdda06c2d8cf29655f55b75823e76@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776285864;
 bh=NKjQm4HuRsVCy6oMLKTyNAOaH4psfb5nC0FvAUbsN5U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KymmyoaF6eH6oeFPK9/rRqYBrPw855/liaLDxYLp6Y4+C1gYU3y4OXIz4FdiSwSXa
 LAOkV24K+iSixgvekxdaZu0KIZcPVbs+ccFknJhG0ffVLO2XXd3tl9YrYFbheif/I6
 RzgvpLxdQq7d3eMZAoqlJ7bl1lOM4JeEM7Exhvomt2RuudgBH4ehO0sM5tsNpPocWP
 n588Qq9QXOxFGPAdbCFuxpWOse0S4oTzZV3wBNUyUf209DaN8xqFszGpzcawH3qL29
 HrTRDOibRXvB7LfwQrNi24xK1k8qEHdLhyaT0Y+BAZRJ8U7GNX2LB7g1prpD7wfEwF
 PZ+A0q7ZJhDPg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=KymmyoaF
Subject: Re: [Buildroot] [PATCH 1/1] package/kibi: bump to version 0.3.3
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

On 15/04/2026 17:24, Alexander Shirokov wrote:
> Changelog: https://github.com/ilai-deutel/kibi/blob/v0.3.3/CHANGELOG.md
> 
> Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
