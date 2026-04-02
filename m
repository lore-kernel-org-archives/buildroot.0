Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908D7D6AB0A
	for <buildroot@archiver.kernel.org>; Thu,  2 Apr 2026 20:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E948410F7;
	Thu,  2 Apr 2026 20:33:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zjQuziRXIFKU; Thu,  2 Apr 2026 20:33:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 910274111F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775162017;
	bh=ZfiIR3HDGZ85UeuyPHx9Tq1p49z8Hvy2Qd9lzuOOIuE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gHmmtcVqalCtS5aLlkTw7HlHQf6LxajbSur63IDkP94l9yyG6i6rQGByDquVxf3Cp
	 HWbdI22j2bR0kQb682I2VRjkFBEtXhmU7rrPzC/nMA/xRYMkMhQ1AB9Jr6K7/uD1eh
	 0moEvwaNiWfefGIKK7rD3/BjRrH6h3dThhfAg2HQXnjqiRST2ARYc8faHnEdUVu3nd
	 JQ5Ul2SuIAZPhBwJs+cQsOLlbuvR4wtEvZWs7TppMZEjsQvlnTbp6VGR1uYFJYByZA
	 l9DqChzIRXoqHAhegPc5+TQevjQFELnQr5u2VQZ0dacELpAOCKxnSUhoBT2OxtLhXF
	 oG1A72Tbxgmsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 910274111F;
	Thu,  2 Apr 2026 20:33:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9271E2CC
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 20:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78D42819F3
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 20:33:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qZFDe_X7-08j for <buildroot@buildroot.org>;
 Thu,  2 Apr 2026 20:33:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9E37F81815
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E37F81815
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9E37F81815
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 20:33:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id BBE1013F879;
 Thu,  2 Apr 2026 22:33:31 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 02 Apr 2026 22:33:31 +0200
MIME-Version: 1.0
Date: Thu, 02 Apr 2026 22:33:31 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260402165550.1470995-1-giulio.benetti@benettiengineering.com>
References: <20260402165550.1470995-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <af4a49c1b11d4f7322fc88f46fe547c2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775162012;
 bh=1vfyodup8B1N8R+OlEOLssFUWHqEUL6paQlsGEr2Hzc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eNA5xvY0zEpUs2DbUxJrsz7idxO8hynWylLKcQPbwLX+qh2bTKHIrgHH4eDmcUVCY
 utSyc7lFd2Qy5rXiqHBEaNTP7YM3avxshb/2nYz0jykjWq6Ec5AOfJT0idCFVz6oL4
 uuyY1IfHGc22ZT9mD4xHv2oF9drQciN0yckzrt2AYb6OfFKiyM3FoA8/ddH9qOqFyV
 GMSVQ/jIz4IbUuNuvVSwECs06jiR70Otq21wXkKKwKTbF5IFRV7t9291K2/92c8ltK
 O8hhFMiDQxUQLgeBHUhV/VHfZ8gEsICRRH2cBSJccdPow9/tUM3F78zz3mfg1JqlNZ
 LWh/A9Bu+Bvmw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eNA5xvY0
Subject: Re: [Buildroot] [PATCH] package/cryptsetup: bump version to 2.8.5
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

On 02/04/2026 18:55, Giulio Benetti wrote:
> For release note, see:
> https://gitlab.com/cryptsetup/cryptsetup/-/blob/v2.8.5/docs/v2.8.5-ReleaseNotes
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
