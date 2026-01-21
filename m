Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E81CC44506
	for <buildroot@archiver.kernel.org>; Wed, 21 Jan 2026 18:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43E4E85473;
	Wed, 21 Jan 2026 18:17:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tai1i1q4sgky; Wed, 21 Jan 2026 18:17:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5480085466
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769019462;
	bh=xNZohLrkCAX+HkUt8eXh5rt7AVxnBoPD7Q2mSabVK+4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UqqPEBdZM1DtW0Q6wjIwnGhNabwIbUa2ypHrCvnTxcAryaF+TjwXxZiuGX4qIGxnR
	 zpX1YYVOUohJdRyb/YP3M9az3HH082sdtrHhj3ZLD74KgT5ZIljaT4InmBlVWnQ84M
	 gPjAl0EOxJyZeBQxDMuHeyzV4CPwEdV8r5FggTDyT5TD75M5bxGGDkPFYaL/T1UlyN
	 rMciyxJ1iITiOyTuFC9iLFI7J33bnLBFeXIK2U94dhBQrMsXmDTuSIOiq3S3GU3IQp
	 wTWaZWp59D5epew8Kn6D2+wbXc8TNfTtkDOIDLRPHyCCxjgdkVFPP09zFGziypw9CJ
	 adqkwXgT7CPCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5480085466;
	Wed, 21 Jan 2026 18:17:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C48F3158
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 18:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B391D85466
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 18:17:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EOOIneUPoVEz for <buildroot@buildroot.org>;
 Wed, 21 Jan 2026 18:17:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F0E1685462
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0E1685462
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F0E1685462
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 18:17:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 9DAD019F59C;
 Wed, 21 Jan 2026 19:17:36 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 21 Jan 2026 19:17:36 +0100
MIME-Version: 1.0
Date: Wed, 21 Jan 2026 19:17:36 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260121110208.3355429-1-peter@korsgaard.com>
References: <20260121110208.3355429-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <786e256eeb481baaba5772f065b9823a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769019457;
 bh=FY2zzSHAER1vmE/Ldchgwiw8gUCoyXfioNN6OjTh0/g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pBiWEZhVcdmXL8t+lh9Uasl4A21t026acWcGZ3Jom+/pwqEkJnYvszuDcVXjhwSru
 1At689+g6r1/nxp35+nWSyvXcu4fkrquRNXIF03vlEcTaYf14SXV4UXzENhSzCXCUs
 P3vQbP2FRi8UxTslGESgkMHhEYGiunRmw41PSaqwoupJtQ4hQXIOW0EM25U33YUIO5
 mPq0FkVO4QS8Cl69Ki+MonsZ9rBWqx+AaziaN6PmrqRn1Hmuevm0LBHSjE64QIqGF1
 jw1EBHb1BwIGmj59WuDN/7nFA+bVirwsIuxn3t3nxqX4GmL538MVZrEPKhdpZpyvmi
 xcEXdJI4V5PIw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pBiWEZhV
Subject: Re: [Buildroot] [PATCH 1/4] linux: fix 'architectures' typo
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

On 21/01/2026 12:02, Peter Korsgaard wrote:
> Found by codespell.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
