Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3125E8537A
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 18:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43D496114C;
	Fri,  3 Apr 2026 18:06:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TkE25DxyRYAb; Fri,  3 Apr 2026 18:06:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E6CC610E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775239579;
	bh=6Pc7ldK5T03fEw8TNmnYyUhV3AiYN82OJ6kVcuWkGHQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=e5q25sDlGqf6Um1Gr+ktxmkSB2wJjsk6MD+xDgd+sYeeUsYFHwn1tMtmm68rIu4wa
	 HpSMX9CzagEDjrU8iJ0SaIBhgzg81sCIjshaVF8QeCLFpcRRdFc3S11/Ct1c0sphXv
	 yRjRpmfW/8FPEVMUQvw30q54BnIIWDBEz+c0ZdusdwvI2T7JIPRqXV6q7mtVUnqQ19
	 Rj0auqcns4/e/4OmpLYuKrFqGIY1QBMvqxi/hf0bB998U8QZbYb7bLpzkEO+RLF9OU
	 n5Asd9BvT/fBjuP3uptsfqzH45QaG6EJOx9INw0BfuLEJYXGi5LpKp5o4JLe/CNYpd
	 EUgxX9i8qGZzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E6CC610E6;
	Fri,  3 Apr 2026 18:06:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D01581F3
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 18:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5E83411C9
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 18:06:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nE2jnPec0-jJ for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 18:06:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AE17D41083
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE17D41083
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE17D41083
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 18:06:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id AD954B0051E;
 Fri,  3 Apr 2026 20:06:13 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 03 Apr 2026 20:06:13 +0200
MIME-Version: 1.0
Date: Fri, 03 Apr 2026 20:06:13 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260403155425.2878268-1-giulio.benetti@benettiengineering.com>
References: <20260403155425.2878268-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <7a73ac4bac271e098e8ed61881f2f133@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775239574;
 bh=MogpEN38QST8mKkInuJH3LtJIsRRIvDqurkoznc85Z8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HMc89Bo6TvugmqNhxHRuFEiiIZh5ku8TDTlKwuLS7Iv5KgMTYG7I4gK9Hy1ogt4aH
 pSXH51FMLnr/eptRVgBLWubf/IRxbpD2XX/TS/cWeNqNu86T6RyAh2OVn5W+4pQyuK
 Vl5NDksIfn9tqJW6UaquzlnBDDhzx2Ghv9D+5AEtKRz0HVbu3d6nOfmvGK9jDqkr4z
 oikxiBOdcxubDq6yQEf1unJ6J61f4Y+680Ulh5Va8VOnMxf+ixsf4b1REUNvwDB8Gh
 PmP9V6FjtsWCc7y92gexRhWBUarJqYgOx+sKjs6IEO8jfyt9AWg2DAsZruy/jhWf8J
 FcMRIJu31rwbw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HMc89Bo6
Subject: Re: [Buildroot] [PATCH] package/cryptsetup: bump version to 2.8.6
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

On 03/04/2026 17:54, Giulio Benetti wrote:
> For release note, see:
> https://gitlab.com/cryptsetup/cryptsetup/-/blob/v2.8.6/docs/v2.8.6-ReleaseNotes
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
