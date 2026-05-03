Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38DECD3424
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 21:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5DBF612A5;
	Sun,  3 May 2026 21:30:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AT5mIaSTBDsg; Sun,  3 May 2026 21:30:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80C966128F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777843826;
	bh=dRHf52N1VEKcWiHUhYpWdeYz1vhRHXWFSOpRFmynvdw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IZcL98qWDE9xR6sIG5fNEGg3uahHJY+p40rRgFlNJUayDr3hmVYCd1pIM5+USyLV1
	 6oa8i+xl/UoEiIZeT0J0ThjnV/pBuO+V7qeiSjbR+sCHcT1snNljtwRqytn490ynoj
	 9SfzpH/73VTRxIp0sWm4bUUXKFxigmv8gy9HsBJgN5GiqT14J70IVYR2ojMz+YiE7D
	 mbmaleqixgSUTndleGxl4W6bnU+CI54BE5ct/WoWqRoWKnBEoNiXrPUof5AxNhUWZr
	 QWMdobcpYlhzp1Yaz9vRCRWfPsZaJ3dlKOH9fkpzp1NwjrLa6/JhFsFZaGszJzO4u0
	 eKhyieSSFPspw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80C966128F;
	Sun,  3 May 2026 21:30:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BE75F190
 for <buildroot@buildroot.org>; Sun,  3 May 2026 21:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B064F407E7
 for <buildroot@buildroot.org>; Sun,  3 May 2026 21:30:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mOBYBPCe9dyo for <buildroot@buildroot.org>;
 Sun,  3 May 2026 21:30:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 083C1400E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 083C1400E4
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 083C1400E4
 for <buildroot@buildroot.org>; Sun,  3 May 2026 21:30:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 444F5780375;
 Sun,  3 May 2026 23:30:20 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 03 May 2026 23:30:20 +0200
MIME-Version: 1.0
Date: Sun, 03 May 2026 23:30:20 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260430145921.225530-1-peter@korsgaard.com>
References: <20260430145921.225530-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <15f38e3c3012ee07ff1b5b5f8cd5f513@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777843821;
 bh=LpJwU0SHCiuCoNKHLN/WEmGyahxnFKhMW3dccFxCu/I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=L3TrHqVaJq619OJBGFa+JzWGANICwGRE19F4KGDYHqsAvX3l0HzAXbkCq1j+tdf6L
 3HACLd1tjIv59Gyts7r51ZhHxwvxZgH1hulrnkr84kRXeT/zxMojLJ4ucD695A2aRi
 r9T7rfB31Np5J3tpCuctQrvreZZXVZVR4/hJb9G8m8apUFxfoLmQoXw2HgmmCF0mst
 FTscKiXbF9s5D+S0KJy1mabMnM83E4SGSt8DnnWCrlOe3SjIgpkPajOYCguQOOXdOx
 XJ2yD/O52eJOBA+9JAXaOhyy8rfTiFHt8aEjTuqI+Mcey7q0KUMdwDbFg9OWLanjjC
 8UcJka8DNVzdQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=L3TrHqVa
Subject: Re: [Buildroot] [PATCH] package/ugetty: make install step more
 robust
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

On 30/04/2026 16:59, Peter Korsgaard wrote:
> Use install -D so it also works if $(TARGET_DIR)/sbin does not exist 
> yet.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
