Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDFFEA8536
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 17:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5499E83CA5;
	Sun,  8 Mar 2026 17:09:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hla7W5Tg4RnV; Sun,  8 Mar 2026 17:09:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 936B283C9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772989751;
	bh=om6xbiFIG0zbzh/Jz76hmcISQCPk1iXXrXyIiH6bj+Q=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TvCd1CVPe7Mv8Lk9kQbfjlcN50ii7ZIsnWTZYfQYAAR3XjPPoKzBPoyo+pFCtdJ0E
	 fDvKf2wMWUP9MZ3rGEq33RTWcHnQT/MYC5JFdKWT/f/ErSt/xXv+eSIwF/0dXKMjsh
	 b9/mU19rQLSbWpbKWHpbGZ4oGc1G9gkhnr5WGMKAgl8BFLXV2arnQ4csDypus/WQJT
	 Y+SpAZewD+6r2oE3KIov/U1Cv/39gpk3PzwnUJvQ9kc8QUZ7ZgyH2zV5AFCGjuaZhu
	 NjpvR1OE7OsR6fDDtr3Wb9lZq7wbKgKtI7uivT2WVRrXCYDhMPy06ZDqrXeXRAdI+p
	 HE1j2Ur1ZLpZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 936B283C9B;
	Sun,  8 Mar 2026 17:09:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BD581223
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 17:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2E074004D
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 17:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dzO3arDXcnr2 for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 17:09:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E39A64002A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E39A64002A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E39A64002A
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 17:09:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 28922B0055E;
 Sun,  8 Mar 2026 18:09:06 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 08 Mar 2026 18:09:06 +0100
MIME-Version: 1.0
Date: Sun, 08 Mar 2026 18:09:06 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260308155931.2579104-1-bernd@kuhls.net>
References: <20260308155931.2579104-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <2aa0ae9c84abeb011ba51cc430b32d92@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772989747;
 bh=kWWdXjowe21l1J3/KpMWxwAldLrvUZVp/aopL1kDLZg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=e8+pZWnP++k3FaTYVE/TBZEreS4DpXJeKNhh4LfwjTS3Iru1NCducEpdOc/dWK7bE
 G5AfOrMrg9UTqehYDFOufCneJ6Egt8whrRYJByfyE5As1ZamW2CWeLWoDtl/2suhU8
 iD7TWdbS6qHqgFwTESk304EXrJSpiZeoS0F2xBeFImiylkPn823uMWcgWUAvu7qv0E
 Q+IqhgysgIaSBD7s+sRS2rU8JnQoH1qyyx4AHLOQtiP8WeLqjjptf95v+UP+N6dKwM
 oPT7kzbPQqABj+fAj2tHrsZj3xHUjvGC1NxzO5HDY2XDbh3mOkPXsPZRot1HLlwg/i
 raQe5M090xOiA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=e8+pZWnP
Subject: Re: [Buildroot] [PATCH 1/1] package/ethtool: bump version to 6.19
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

On 08/03/2026 16:59, Bernd Kuhls wrote:
> https://git.kernel.org/pub/scm/network/ethtool/ethtool.git/tree/NEWS?h=v6.19
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
