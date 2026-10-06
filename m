Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE617CA6001
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA6D4607E5;
	Tue,  6 Oct 2026 16:31:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U1zAqh4nIEGF; Tue,  6 Oct 2026 16:31:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C74D4607E7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304291;
	b=g9B7bIHXc8Armt+O94gKl/EFnWcJ7PRNPHH4vd8rd4XpXxGyEL95Yua+f+WXCTstYwZ2
	 0P7On3yNQ2uAshnDInyqo48ntFytafBhSMdzI88bqMxmI6od+eAb+FZ4Xyu2E+5nJj4ol
	 cWS3gkix8HW+xDvHt3Cg4L5wyJyOx/yC1ihRpZKJZzX/zAY9EQAhqvq2DVSuepfXMJJhY
	 4ctO+XqaCPSuXLx4DHhB7Y3IIslwxbz0CIjNNe9Uf0LHPjPoaP/UzUSdCrwBInDJ/hb5M
	 dEAmsvgazBr4Pvjm9ighSggRIpPOV9M46wKGm9t2WLWE84iJJnAHvnL0n0F7renAHyw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304291;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=FeM1LIQtFjnvZneUxyIDTux9HM1UVakMnhA7CbBLp/U=;
	b=smEfdCtLtHieQiOQwTiGCYwUjSju3vG5eTK10QVDawkPYYWXZxT7855lRKcKwg/nMxs8
	 +TRNlQ59RsuhL60cMCR8aVQxoCyf4y4wTjrha73V5wMQq/kIs87btHyAxOLxqntrXwkni
	 +PC6rm5H87nq4wvYNeDkqkvtvpBbjirssicem5P1U7fdRyI5Tv5kOFSGrfzKp1sMcAk6t
	 BFDFEQiVJiD5uFqUJskCegCrdxNntF0mjHe2qAYVrXL3iAcCNS+3G1U3cKx1QWWoIm0KE
	 qe8XwvVgmKQco8lyi/OFLiHwBhp8TmUcQ0EXGq5D6UBzrd1vwRK+1+QeFq9IoEsALRQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304291;
	bh=FeM1LIQtFjnvZneUxyIDTux9HM1UVakMnhA7CbBLp/U=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RZEH/SRbWAQ79UIrN7I3x6cRZOvmjyM1F2ZeFM5V+i5+EKfyXhRUCfvRimTFmTJ52
	 2pg+MssEsS2Wz1Ej55So4Kwn7cfR+3DhB1PJKbOasK1KUGqw0gzvzO5pHy3wMpi5cq
	 OWY2Jj9krt5rI4+7+aTGxTAIzYct1z4S5wq72Xd36Nww5QAUEeZHcGGZa4lBn9U2kg
	 hKvdQsSaDlsRmbtggDa5ZPJe8Hzr4w3Bk+9lLvAqjZIm+uZrSd9wtpMdvKUtDfmOjz
	 3twJh75/NGMz6G0Fb5Cp2bxuoRYpSG4W+NfQIMHXgRlnUDI+mhRPdKm0X2JoqsgQw1
	 2Xl8nNmTWd7iQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C74D4607E7;
	Tue,  6 Oct 2026 16:31:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AB774317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9196140274
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:29:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lS7HFZ3yiMAB for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:29:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org E77204009F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304149;
 b=QJobDfYiCyNG3AzJt7V0YNWBPUrn2wkaY3fpoWVrI9fyV1T4V2629ePH7abXwCKWKRhB
 p+96/AGXvup/qDVj2ft/WynWV6fxed6voJgd4gv1uteGBMhmXFjR4urRDR6sLHhLZDm/q
 Edoc09/Rn/uDZ5KApW+w6CM8AKRwHypOVSxQSjf1+DMhonimfZkDsd1F/16lxic5pENhi
 qmiMvjoL1BMcxeCGBnuI4rQrui/igbXETmArpHYHKyFY385fRkBH4mnAUIEViMeajaqHR
 iqIdSRIztoqq84fOFy57mMucNmPW2fvf1NGJsAvKDrabin4d/G7VBYz4ijY0ieynO/w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304149;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=396Yd0cDXtHL5UJquEEANIDjZ5YaL973TXF94IgAf08=;
 b=qkyN9SQ+V5Xym5ha+WN5LgST9OYOoz8vAb9RsyYziNFPBrmaxbInO5WISIGQM+Qg1F1g
 Z6HQ2CwUCv4PdpFeMaqz5DFmD+U7JDrtuUlv7f9SE9syGgWsn2S/tn7y+53ZfoxXMDEtO
 ohyFp4uu55Ze/1HeEt+YUgI6WawNw6bWKjS3KWmq6hfhzW2XWRerkU5Lm5DsBitBePu4P
 l3LtUfH9lMVqQb7c8+xTDhYVWnIgL6+ePcscqO8pATUcomjuZFO8Y8CpQLHSNMWFd+6Y0
 GwFcmcVGS8r69w/QyD3hFPGnL+YyzxPT746hCwHgZChKGzIBfJCtWE30PXUyzKwy/ZA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="ElN/7l17"; 
 arc=none smtp.remote-ip=212.27.42.3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E77204009F
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:29:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id C78EB13F88D;
 Tue,  6 Oct 2026 18:29:04 +0200 (CEST)
Received: from 199.151.230.94.awnet.cz ([94.230.151.199:41332])
 via 199.151.230.94.awnet.cz ([94.230.151.199]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 06 Oct 2026 18:29:04 +0200
MIME-Version: 1.0
Date: Tue, 06 Oct 2026 18:29:04 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Fiona Klute <fiona.klute@gmx.de>
In-Reply-To: <20261004201853.915471-3-james.hilliard1@gmail.com>
References: <20261004201853.915471-3-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <3aa4379fadecaaf25e3c1a3ff5bfee51@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/python-platformdirs: bump to
 version 4.12.3
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

On 04/10/2026 22:18, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
