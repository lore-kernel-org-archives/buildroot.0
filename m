Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5434CC6B08
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 11:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B05E40450;
	Tue, 13 Oct 2026 11:58:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1PMLXBovz04k; Tue, 13 Oct 2026 11:58:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9A22E40311
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791892716;
	b=AcjdfnzVo4L4+iMQJG80MzOC8l9J81jv+q1EtVRGdHpKkvoBOcpKVBXwe0KQKOt4WlK8
	 JY49HsMdCNQlh862hX21wuVBMH9YpZtmH3G+aSE8NyMYE4Qjr+QhKdHZQoVGcZnguPOoj
	 YxRXE1oN8AYTWwib/ey5WkR/iUgpocGHS3SIU1JSAM0BVIT7Kr29nd4yqmujn9AIlNnYT
	 ca+p29ODkvmjbvpFYjYyEXGDPC2JDUq6uomAi23G0+wPAXKrG1lyZuW3fLpYpUY+HFoyV
	 uzIWhfOXHx26SWvhEpq5/nTtZeawfWLzv4ciSWzkJENGIDX0SX9c4keUZOV1P+IPzgQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791892716;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=+I/2DB6/O6qVfiDsY1sb50rqGT/ORE0egh+nh5HxkQ8=;
	b=mxkk2m6ZT6z8O23JEMxI6BBo1PwvvrJSHUAGoJ8/UGOLeAxfhsXKLky3SbCrNy+P6uvv
	 MXX5zwY5apq7TcywPfIVQmmjJKNw1xTT4vftm5neBowDRZ7147rct+3B9SYb+6X2TQSj7
	 zxlPO31Jf9ydkw8qPR+lJ05UJhJigwMG7TrpycII13Akx2vt4AlMvDkIeWLlEgab8Hvwv
	 RTVZZ5hjku3zr81v0/Big3kSvsxxLB8JHeIEXTX5A0H+0xTo9yl0c0DWHoWjERuHdVDh5
	 G69l3563RTV1mf3+Y7oJtoui91aBTA5A4nDahwXDcdJweR7YjID6DlO6Pzij+w+SK9Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791892716;
	bh=+I/2DB6/O6qVfiDsY1sb50rqGT/ORE0egh+nh5HxkQ8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rDKL1Vw/tYP8LCNV3IbDmovBAks+pbI5eFaQ8T1HD212d979c4UqbmQ+0sHNKncZi
	 EQWRbBhr3b2ZGOzZ5lIuMd92PVctSIRPt/Qpbe1JRKaIx1Lkq+EMHDDKZ6/XG2k3tw
	 tuilqxmG+/gKaL71vMN+enBmk+q19vESgp0urpiHkF2Uhsy0FjuKGfOJN0CtKhDpDZ
	 CCssAl4uCc2nBdIeXptYzkpnCABIVEun6ye9SuJFSDFs7ytCq+05iXT7B6XpSKHAes
	 NAf2SpDPkrHCL6e1/2W0tQotvWHLF8LYHYaMaP8X79wcY9vSO4gZOqKphjy97fiaps
	 RngbWeAzLbHQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A22E40311;
	Tue, 13 Oct 2026 11:58:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 40CB8A58
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22607807D8
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:58:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q1ne_tA7waHT for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 11:58:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9B4CA8071F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791892713;
 b=GB7tKx/QE2kBdhEVMZ4poW3cRVOWcd7NE2mHp4/umN16lY5ZEsbRQ4JXQU2xf+ngHOM9
 GafqPyWURbXwL5izX96mxCV/jm+ilf8809OMLI7V6ZU9c9t/awiljpGO0DS1DHZZJXcXp
 Cegf79qsU9mkMhwpOufZIfcBtcZl3+DSrnf9aOocFYthJuDStjbjXG3LSYe+CraxJvyEM
 StBqy7tNGmdyzHMq0NDxwLd7OnMg2ud6zv2xxtGEYYW9gfz88Tsf6h4rJBmfNRzZs6Qrc
 PrNXUDZOAnc0iPitgeBisP8CoEeZA9LjGGZF112drzSmqCqC8Bpzh/qUDyzpi3g+HPw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791892713;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=sPI3vh0itZoO9nk82yExtZ93bdeWIhfe2GK6azXiJMo=;
 b=m0dOwFImx1OhYGfdAmOcMAJtSklFW9g43DSI+vHAFjDdrL/9R3HbDj5LOELJxujDKI3c
 7cAfhK/wsGgWIzsqMOtV05l1UZdH8rWcDQkp4Eyn/m2iEdi1v2oHsDHDTeuQagVptMBVw
 3f45QUFrnLDnvMUC/zdoLRtUi5M8JhyRbXJQFuVlM3svMbI0+yWuaMtpl8kRvmnGWBVs4
 kUH+V7H9g+3sNesNc63GJhBahAHJlyeOq7iepNGMQUcuO+YWHf9giRzYUWaD51MsTDqwb
 sxLDeapspoDbp+VxrSopVdETZthWp7fMBqcYeescOhLCuBfsSuiJ6J+Fd2iyowkegrQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=oZKgd06A; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B4CA8071F
 for <buildroot@busybox.net>; Tue, 13 Oct 2026 11:58:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 20CF64E41207;
 Tue, 13 Oct 2026 11:58:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E735060362;
 Tue, 13 Oct 2026 11:58:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D36DF11D700AE; 
 Tue, 13 Oct 2026 13:58:24 +0200 (CEST)
Date: Tue, 13 Oct 2026 13:58:24 +0200
To: Francois Perrad <francois.perrad.86@gmail.com>
Cc: buildroot@busybox.net
Message-ID: <as4c1B9iZCTthiAU@windsurf>
References: <20261013094252.96761-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261013094252.96761-1-francois.perrad.86@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 01/14] package/perl-clone: bump to version
 0.51
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Oct 13, 2026 at 11:42:39AM +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>

Series applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
