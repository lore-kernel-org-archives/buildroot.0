Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648B9C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 20:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B56B81142;
	Fri, 10 Jul 2026 20:02:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RByWt253BWCJ; Fri, 10 Jul 2026 20:02:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39C5581127
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783713738;
	bh=PEOGGl2p7NI4qVvtyA0+/1FXbzSWXXc3c6kX5niC97E=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=r05wIgum/5FtUIJtN8KmQa982iQV5Vrwdp6XBr2ZqOh1x93YBA2AUYqJidP7SX5+N
	 cNr2SlJqTvAeql43wGM66dNdy6bpx4QYji1Hkef1mSnCiV5whJby8RgEw3ybvpCnFU
	 bcHOEpmqwhcNzaWUu1viBALUDglN6+68SELUHd1+EoHjbd1oX1lA7mL7ZrLrxmS4dc
	 WpTJ7LFiulBz6KggGd1YjLC0mw+ZhN1M313TzKHdjMAA0PYlThl1JM+E1XDNGpb/5J
	 SGNKOoW0xrpNt4FiWojxcyKxJOU3By3kAnyIzIZgbAfUdjC95R4TgR+FYyHEMiMFB+
	 qN6y9mZyLadSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39C5581127;
	Fri, 10 Jul 2026 20:02:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 83BF2372
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 20:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8112040A2F
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 20:02:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HbllwXz3mvx1 for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 20:02:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8F20540A09
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F20540A09
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F20540A09
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 20:02:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 69B0619F59C;
 Fri, 10 Jul 2026 22:02:10 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 10 Jul 2026 22:02:10 +0200
MIME-Version: 1.0
Date: Fri, 10 Jul 2026 22:02:10 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Murat Demirten <mdemirten@yh.com.tr>
In-Reply-To: <20260705181834.3258669-1-bernd@kuhls.net>
References: <20260705181834.3258669-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <44d1743a2650314f8268caf5d7e22821@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783713732;
 bh=xWGaq/k/cw0W9HyYw92nyQbIIeZ9z+95r8pAu5xrWb4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZtK7yKITW93g4AmI+7MZkSbUy4qe9ZH/Pl7IS3E6EDPZhVZPKk0SHeST2ycA9Fzl4
 wqE3iIXZFdR2sV7Tma8dtCj+IOyTUBOJwaUf8PgSS714XXeZFwkwQlGGV41b5559kq
 EGDx6ZkKDJFHVQJPBX+iH5yKUNNNSolljt2mzcaVXIPZxoHYv3vgoZ14N0uvGB4Smy
 JyCcZN9j4WhN+591CkX7b7eFGrZMhi5vcvofnCvwquRXskLfgwSpCvzAYkPzxQdQPT
 v16tBdWX+UU/WhkcnjKbfo2xJPDykgU0jZJYp03Mj9qkUQGH0cxbxcTU9nBDnn6nd8
 99hyGrfB8E84A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZtK7yKIT
Subject: Re: [Buildroot] [PATCH 1/1] package/jpeg-turbo: bump version to
 3.2.0
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

On 05/07/2026 20:18, Bernd Kuhls wrote:
> https://github.com/libjpeg-turbo/libjpeg-turbo/blob/3.2.0/ChangeLog.md
> 
> Updated license hash due to upstream commits:
> https://github.com/libjpeg-turbo/libjpeg-turbo/commit/54bd58cc306301892f1cdc2a00da64576ad1e232
> https://github.com/libjpeg-turbo/libjpeg-turbo/commit/42b75222d502faff3316ea82083b873add354f06
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
