Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099FFFC6179
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 11:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D47774041C;
	Sat,  3 Jan 2026 11:41:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eqbWnEHKfTpr; Sat,  3 Jan 2026 11:41:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14AC6407A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767440486;
	bh=fAM7e927Py6HD6DqMIXiHM1B2kiwMXYEO3LFOHMViQs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Fn4uC428q6ahYT1eJLnfBSPHgdAiBjZBJ25NeLOe7lgIkJpKws2vRpbeTXEwMXUkP
	 H4u+twQIh+h+YKuSuqR9ClcR2a0ziikUdcKRBpd3opRa19MvNXTr4nV+Si4Ga+jWTd
	 ng2jBQ32S+aDTZ0uR5Hm4RzQOOnK1jWEJVyobbuQ8+SXOhoD1hSJXWd+/9JbEXsSCC
	 2S56tID8H+cBhkWVOakEji4Bg1hWSsmNGny/omxiodkLIjSXO9ZlR7CnmdSMh0suI/
	 B3P8wTL/Zrw771c1Eim7t4hSoxvR/qAf03uLtdUWCSKi310PrJedguts6zJ6kgiQa5
	 oVIPnVvinVDWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14AC6407A4;
	Sat,  3 Jan 2026 11:41:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 10A34440
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03682400D6
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:41:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7z6Jzox8LI85 for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 11:41:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4D1D240059
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D1D240059
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D1D240059
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:41:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 30D39780507;
 Sat,  3 Jan 2026 12:41:20 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 03 Jan 2026 12:41:20 +0100
MIME-Version: 1.0
Date: Sat, 03 Jan 2026 12:41:20 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260103010905.725665-1-james.hilliard1@gmail.com>
References: <20260103010905.725665-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <507198cf962d66d9fda6a9e6d222ad59@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767440481;
 bh=CptIgEGoWQkpRl3CagTJ/5gQNK1Wen4larBljXOQBM8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UIswgujAiuIkvTM+UDRTHh5EcgOW8W3leCPK0Xwxta5wS47zol3Fk+dkZvfQQFvHd
 hrvQgWAIhAiQZUI7CH0R+/md3MCHhV3+ez+25Wr2jUyo46GnY6+KPjYw7agjaPTshp
 q5H8GM5B6QnThV1sJWd1JXRalpn88AfGy38fGuA0oYmPPj5eBO2Ovn9chY247avD/c
 0FMwj+gNR288IbTdGban7HwCUx2Z0T+mC5khV+dTLy/dKhzvC/Z2y6JNOIkxmf73Q6
 CCKtV2kegk//wOzhnucgf4lrUYDhtSTnZZpY5u+YLMXL5RHE4uzWMI0Vq3gFMszdWZ
 wZ2mTclAolBZA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UIswgujA
Subject: Re: [Buildroot] [PATCH 1/1] package/python-flask-cors: bump to
 version 6.0.2
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

On 03/01/2026 02:09, James Hilliard wrote:
> Add new python-werkzeug runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
