Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29BDCD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 13:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B2BF60E6B;
	Sat, 30 May 2026 13:35:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iMjtZKx7ka3u; Sat, 30 May 2026 13:35:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1C7360A83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780148134;
	bh=jxE3dhdr3wnGAMDInmLTdronxdqY8ks7X7pkrRW1ibo=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c7gaD1z5WHT0Kyxw3tIfSQZYJ1d2bKvVdXiqJ0EAUyWwSjyxLZUDlxQBGt4SeWo2K
	 XSfXDXwBQ78J5MtzLcALCF+dFYpVx9FTcJoQz4XhKtLd02DZdB3GP6RnHDLcmj92LS
	 wnYiKxPg2sdtuU3jGsQ3qLjGPfhBySYL0OXM4F3dGrBCHJdLVkx4bDMeO4v/fTBQEJ
	 Qq3indMHHd+YXcd02MrKNfi23GFijMWoBM2UdN/hRA+Hij0ET+5zWZe9EnTwKmp9pO
	 8omS3WfRWi2nfxkpte1AWpRwtIiHGg60O4StDgOTYFPeKYztbcrGAK7NlwOreMWFFs
	 1H/KAh0KcGb1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1C7360A83;
	Sat, 30 May 2026 13:35:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 438B9D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40A68852D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:35:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ogri9w4YRR_2 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 13:35:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2DA5F852CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DA5F852CE
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2DA5F852CE
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:35:30 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2015317688; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 30 May 2026 13:35:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wTJqX-00000005Fvn-378c;
 Sat, 30 May 2026 15:35:25 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260530104151.610288-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sat, 30 May 2026 12:41:51 +0200")
References: <20260530104151.610288-1-bernd@kuhls.net>
Date: Sat, 30 May 2026 15:35:25 +0200
Message-ID: <87o6hx58bm.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=uE2R8ohJTwuAC/Iy32clf1Yf80WGlt5nhfE6kNmvw2u9UpUZgDcAed426/VfMH/NWr90V+glo6gBRd9qwEBYyy2n0GyNpCj3uv0odLphNV4648YbhlMnczSGQ+lTJglJo7e1kwB5EbeuCn/qrtw+FeHWlesvL6YkTHx78VK2RcjJl2mo7QxVQUfUssR1WwXsKF/plaEpsV1KnWmhVaFQzmUhhDpjofDcM+ficywwHWm/tlX3eTovjxzcechI6HQu3bYmzwTT7CbyUy1DTr7y2aXKconwvxKOfQEc56DhJVyvWryJAYd/cpN09gRhcTDi9PcwZU++VMtcgEsNEIDlwg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=S7agOLtBoRK4ME3H1GdAw8NY97LHyWcxVM7+RSmSfNk=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=uE2R8ohJ
Subject: Re: [Buildroot] [PATCH 1/1] package/{lib,
 kodi-pvr-}hdhomerun: remove packages
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > As proposed by Peter:
 > https://lists.buildroot.org/pipermail/buildroot/2026-May/803331.html

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > Gitlab pipeline passed:
 > https://gitlab.com/bkuhls/buildroot/-/pipelines/2563648765

OK, lets do that. Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
