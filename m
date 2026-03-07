Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21DF5F55104
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 21:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2DED60F42;
	Sat,  7 Mar 2026 21:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 66IMSAHuE2wc; Sat,  7 Mar 2026 21:45:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DA3960F03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772919900;
	bh=hL2AqUPCeY2Z8ALBbdoDs8xxaLmaACfJWAhd/64Tbls=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TBae6TLnb9VfVH1eoGycfuxaC0VnOBwzIfAG+xvCsLIwx6X7iPw+qU83wp0OB5h4/
	 JM17yZo/CMnlH2PRuCcNx5fmgy1HUXKfD+LlT58eZGGYmn0epDoaU+z7UqeoYTPd0q
	 76NJdNcRdBBQxuXwkmYTspyeqPWiwJlGuV159z6cfYtpANGUqSyiKPbJ3O309egZvn
	 WEP3t/BI5NxqmMU4SKNwB/Fyrwhbiw9FEBpK9y3cMePuOQ+Lx9ZxOHf9k0PgrSwHXW
	 rItl5PwZWJxbPIQRr2N/DC/HSz6wef+8g8XA3+zyeDJhqbxGEUA4DzjVtIHX8jhNJX
	 r87YQyb0nq4Lg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DA3960F03;
	Sat,  7 Mar 2026 21:45:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A2855223
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 21:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8862E83D67
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 21:44:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 67NN6f3YRCpp for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 21:44:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 74C2383CDF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74C2383CDF
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 74C2383CDF
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 21:44:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 9B4C819F574;
 Sat,  7 Mar 2026 22:44:55 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 07 Mar 2026 22:44:55 +0100
MIME-Version: 1.0
Date: Sat, 07 Mar 2026 22:44:55 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260209203147.3837192-1-bernd@kuhls.net>
References: <20260209203147.3837192-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <391154e2e2ccb615e6539e27a67f5d3d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772919896;
 bh=Mt6p1qh30wWORajo4EtuiWXgOrQkt+g+urV9xa5+2JQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EwdRlRv/lLaa1emAuMVj7ou9j4rfYUcO0sWdS52iit1hWTG0kYN35nQsLT3ekB8e8
 3SQOJI4CRjb2kAaHLSSWdyIsF10uMtdrF0hc1pf3KvWb7oin5gOrQmChVgVOXhf4fM
 9i9JtFUOr1BAsSsoYN67V0XhkQ4t2Gj30uQK9quglcVjYi7spEnbolBqi0/we6WvIj
 3NLguwgB0Odw4ZU2jufVlFnfH9MRIrLkJwxb+g1mqbcErrI7YsohlK25GsGP97Dj/K
 z9Qz4gzedgXgrNdAVOlzE1znNwRwu6NtAbywVosObWUk4TLW3lS9RHp6gNsg4LD7tE
 EaWI5P+eSh5xA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EwdRlRv/
Subject: Re: [Buildroot] [PATCH 1/1] package/openvpn: bump version to 2.6.19
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

On 09/02/2026 21:31, Bernd Kuhls wrote:
> https://github.com/OpenVPN/openvpn/releases/tag/v2.6.18
> https://github.com/OpenVPN/openvpn/releases/tag/v2.6.19
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
