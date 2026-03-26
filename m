Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512D310AB81C
	for <buildroot@archiver.kernel.org>; Thu, 26 Mar 2026 20:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E50D60E97;
	Thu, 26 Mar 2026 20:01:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c3thNe2ks2NF; Thu, 26 Mar 2026 20:01:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D56E960E32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774555316;
	bh=jrURkJtWNTVKrg+33FrMVYK6WiSIXnIeWtRWvuTfyZw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DsyK/c2mJ3ped/olJhoUPMcWt/Sh9/yDnYlQi5Lu/673ERB8SGlvDApIZOLpMIiQT
	 JHAElbKQHzSj2RzVnYvOKoK/lRU7tORIjpqoZLIOubgXjoCtGc8xiFYqIqJg5B0uhH
	 xiUJHLFqh0GRvCASCcjic2q9Qyn2eJaLKfCN4n2dtPuKDNPzjN4+yKMV9gI4z9F400
	 jwzVEZrQReww9kdbhPr41dRcxtBYfEuTCtDa4+fwsLdJoMqO8cELES0PSneGSIDs3k
	 v/OanmMRZ0Z18j4cbP0l6pUiJrSdpO4gOMZORFrzc+WdyIZh3MgO6XBn8w0Vy9eRD2
	 zJGnmnk4neGJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D56E960E32;
	Thu, 26 Mar 2026 20:01:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 015C31D3
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 20:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F29DC60E32
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 20:01:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nLDWOGdauTGq for <buildroot@buildroot.org>;
 Thu, 26 Mar 2026 20:01:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4028660C14
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4028660C14
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4028660C14
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 20:01:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 720AC780333;
 Thu, 26 Mar 2026 21:01:50 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 26 Mar 2026 21:01:50 +0100
MIME-Version: 1.0
Date: Thu, 26 Mar 2026 21:01:50 +0100
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20260325101519.77626-1-thomas.perale@mind.be>
References: <20260325101519.77626-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.14
Message-ID: <0fdd25d6464d7001d15c2204f5a597f0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774555311;
 bh=CjcTiQssSoY3Y/dXActbiOwOVkDhK+calQyD0SzN5qU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CXGD1RofXSB6a7sae7BuFj3mrA6qD1Vf7iEFcRwCKADl+9iLEP4UY5BVC56F1OEH5
 UgZ+sPlkrXeLqXFUZclNn2j5p6mf/21tKHyrYdj3Ao+bij3kul6dntFVqRrNSTUA9r
 eKapzFP83VUcwy3jQRInka0KQt2yzG75KPIaSrhzs3Wnvq8/G9ml0uMrr48zqDOHbg
 K9n1e2ykw6Pw8Ku2jNHL9HYyP92rl5L0z2nYmPRUHxO3MmJSiR9iusFyiC1kkrnpLF
 MQ1qMV5YMJXlJNqm2fXLhl4MCqUibKv8UrWit+v7pauk1lNeB4kbPIDPiS0FK8Y0eL
 BY5lPLrftpfdg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=CXGD1Rof
Subject: Re: [Buildroot] [PATCH 1/4] website/sponsors.html: use flexbox for
 sponsor grid
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

On 25/03/2026 11:15, Thomas Perale via buildroot wrote:
> To avoid having to move all the sponsors through the bootstrap 'row'
> when adding a new "past sponsor" on top of the current stack, this
> commit make the card rely on flexboxes instead of the bootstrap
> internals.
> 
> This make sure that the body of the card always fit the row height and
> the also make sure that the image always fit properly without having to
> touch the inline css.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
