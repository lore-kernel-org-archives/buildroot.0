Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C644D3E787
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 11:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4F1D60D7D;
	Sun, 14 Dec 2025 11:25:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BEPd0r5DpAPx; Sun, 14 Dec 2025 11:25:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E19D360D66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765711531;
	bh=VaVhKqrNyjQTA2wmS6PLmvx6vU7A1QqvVtm34XuNUjI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kjstwGeTTRCwPLSmhz33jIYvHBgsiF5CRC2kTlg3420S2SbDUAVnYraYOdplAnDCs
	 9nyzuZFUpQb1vZEBKBeNa7nGK/pR9izNRj9LKVkoh/GzNCrAnKLgHvKib1r39wWSzQ
	 wYdV2vW9XvScEuMrF8hZnTtL3f9JqnBYdJyn882GRAA/oI5KVm5QCsMx0dchzeEsXP
	 ww63CJHn6qymYBKIMOWr4j6RuVmgwPaetnXmh3oJZwLhYm2UbK8TDzDx+YX/4krg92
	 08zcfUIzbQ6pX0+bTFS/5OaAv6KN6mia5zIimyAtLxBoDXJ+chtbPVE9lG6nuKWhuD
	 N5LO32qKmJA1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E19D360D66;
	Sun, 14 Dec 2025 11:25:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FA482C1
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 11:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76A6A812B5
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 11:25:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KbeYRclOTokL for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 11:25:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A27B7812B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A27B7812B1
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A27B7812B1
 for <buildroot@busybox.net>; Sun, 14 Dec 2025 11:25:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 8B02A13F8AE;
 Sun, 14 Dec 2025 12:25:25 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 14 Dec 2025 12:25:25 +0100
MIME-Version: 1.0
Date: Sun, 14 Dec 2025 12:25:25 +0100
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20251214084709.312790-1-francois.perrad@gadz.org>
References: <20251214084709.312790-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.11
Message-ID: <148e43bc281aaf7b763e91e7554eb9f6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765711526;
 bh=lXird6+tn0fyoc6rzUpc32NXcqrjMujeF1Erqm8hGeM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rkCytWeXH5tgjuyLajyClUQUAPk3tyDw85Rk2+mkAPa19FTVAlFXk0jrGNglpGm3s
 pS4QZBSqwWbdNrL7hzQFRvcV8D2IHyR94MdYRNUlDBYKcpGjTkFcSQMj/imkuh1Q+N
 otPQiHgqySSQAbZNj5X03zvPkq5WdxJhv07K8yu7iojr6vSfQHUkO4ig8+TY2EVMsC
 sdQIUKj8lIcglaqTXDvDTS1sJ/h8/4U1D/CI3hlf8SsIuWWo5NhVcNP/yh0O9yJE7W
 mrx/f7NqXFdsTwhuy5EnrjZfeQwFo5Bc03cTUSZ/cWDPJqoYHrrtGNFa0gLHCDOQS6
 OyxPjbb23JeEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rkCytWeX
Subject: Re: [Buildroot] [PATCH] package/perl: security bump to version
 5.40.3
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

On 14/12/2025 09:47, Francois Perrad via buildroot wrote:
> fix CVE-2025-40909: Perl threads have a working directory race 
> condition where file operations may target unintended paths
> 
> see https://perldoc.perl.org/5.43.2/perl5403delta
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master.

Thanks for sending this intermediate security bump, so it can be
backported to LTS branches. Now we can bump to 5.42.0, if you want to.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
