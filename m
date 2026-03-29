Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3149BF3D619
	for <buildroot@archiver.kernel.org>; Sun, 29 Mar 2026 17:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D919440B4D;
	Sun, 29 Mar 2026 17:58:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uZCpnbnnP6Z5; Sun, 29 Mar 2026 17:58:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D0CF40A45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774807138;
	bh=FdUBxXwU9QzAt2XG9clK9kuSQDS6hv39ixf3tm1pYFI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Z0MzDI+a9jj2EKLFGqgmi4H+EHdf3tE1hftnV8znwaR/xsvZhXZ3arnFN5thvkR/v
	 hbzuAS3EtMc/bynmS6ZnBdBR4rq5nnnPR6YKJwGAdV4+bMi+Q/2xx+QNQjXL1wNnP4
	 lNRNBBLUAcem49uo5M1eAKl10PO20BCKVcsb8rFlIQE56gVEHxXC5esZZ2JGk053XK
	 IZHevaT0YrfDvE5HiEopMw9fxIeBgks1TklpZIzevOm1CJPNU9ECDRgPw+2x5xLC7N
	 /XZL7eyzgIEQgnPzSBrXZEwedweJGIZu4weo9JF5C97ozRAlcaMEW7atWF7UZ2da0Y
	 cKWOtB1v2WtDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D0CF40A45;
	Sun, 29 Mar 2026 17:58:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A2F1210F
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 17:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 876086084D
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 17:58:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qMd0mminRVh1 for <buildroot@buildroot.org>;
 Sun, 29 Mar 2026 17:58:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5AE45607C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AE45607C0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5AE45607C0
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 17:58:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id DD02F2003DA;
 Sun, 29 Mar 2026 19:58:50 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 29 Mar 2026 19:58:50 +0200
MIME-Version: 1.0
Date: Sun, 29 Mar 2026 19:58:50 +0200
To: Franciszek Stachura <fbstachura@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260205184800.3308827-2-fbstachura@gmail.com>
References: <20260205184800.3308827-2-fbstachura@gmail.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <ef06afd34a1d4343ae342091563033a0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774807132;
 bh=m5AEOicn3/QRMWb7lY9TOUzZDyGaMtDw1pCSsW9nH5c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NC48sBTBzBCnpIPobKitFXXDqkEkGyEJ/yLfkhLUWryh1gVrBp3G9m6Ch+dFbJxnA
 UcB3a9n9mLLOrGjUo04UqVn/NtyltZqQFMPK9vb7igLbbDEdEFsSoNikUHMplSuk0f
 5tjwaoEdIY4tLFnB3vI/7u40jJAwlmr964mXRBycO4ifNs608GLL45LHSkBwgXczL2
 dSO8rR31D1DZ+zrc58U9VrP7kS0BQLjIRtEOkk87ves3CtWb7uVVaDFKzFfUl/Nfy3
 AoJXrdibADXoIP/GwqhVdhFtwx7MPZvAaE9K3PohOOSQmzjMv0wiZO/tkDA7j1/hU8
 a2WNstOL1724Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NC48sBTB
Subject: Re: [Buildroot] [PATCH] support/testing: add memcached test
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

On 05/02/2026 19:48, Franciszek Stachura wrote:
> Add a basic runtime test for memcached. The test starts memcached and
> checks if it responds to a basic set/get request.
> 
> Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
