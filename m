Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB2ACA5FC1
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 12:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56788413F9;
	Sat,  3 Oct 2026 12:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QFMKMGiew3dD; Sat,  3 Oct 2026 12:54:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 80165413E9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791032046;
	b=rC4BRyPn4XpBKLJf2sQ+LhOhhar6VuNKbXutXkXdlr5C5YN30N9JgS04Dqf/FXUhm0JB
	 vBj44UBWqqCIWQvRo5z9QxV63Ubl46eduNhqy9lfw7296/mYI/RxfZzjxrv2iCNvLh3AZ
	 NrwL2d6czdw7nkAIEqaEBnn3e6xDqqbSXWy1l11X8vVZGnO7HC3MEtksmVh+k8rfXxZOZ
	 KQ41DyYpdh21kiYNDLmITzAZKJtp5sIipGwy2om6353/VbvgRHC39Hpts3eA9Str1GUoi
	 Zd2DnT+TG+Xe4Z0Z5Q2vJYlK2CbdB3X/JiQ90PAbciUchJvNLF3ae7a1teYDZ0RfCPg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791032046;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=J4vut4dizYQzcy6kBNxUr4+1mdMm9HiOpR2Ao6T4Z9A=;
	b=iPfgrHLREOv5SZ+lLbd/j7gruUdxYD7MA9e8xOEBSBuA4s8F/bV38XAA00jFsAsolkzF
	 KP9+OnJNMPWYSGdUMMJTcOozedj596QnQqIpT9Dxv/WM3PA03T/oHR1R7kTVvRCq9GOg3
	 QFUq5iU3M3r+wrg4HVtP9p/K+Ig6SlkupRG4IhiveC8D6b6rVwsg4XGvWzWCCXnjZYEUW
	 niIzGIZKWV6u0RHpEIJ3aYOYc7SjkDOS05e5XtsvFGStWDpDsQN2klAvNYb1Baf41Y0SK
	 lBHTTfsZcfee8Q7m5g0cDYU2JmYEfzdaatmPkmhzhngLB3X/pq8LYwpMwFrOKaW5fSg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791032046;
	bh=J4vut4dizYQzcy6kBNxUr4+1mdMm9HiOpR2Ao6T4Z9A=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sWD8KYymKCcsQtlAWKKutahyTkJt0GKQTZ3Nni+X28sAmdvyJ7LvWcHwkdpYeQIuO
	 nDW5u3YlsqwkIDG2CZrhD1FEANiOYHiHoSSstHgaC/5+XIr+xrKaqSwQlsfkTj9KtT
	 cswg5cUMkkCURTXfjZg+JXuRHTSNAchOJ2cgrx0e0YBZaKPNFR8h2dCon3FFdI0GoH
	 vKESDQE8QwdgvHjtFsKnTrZmY4Oy5WW4C8vMWB9X6Xn4B5+MLiZsBwMqXWcvB8uCtv
	 9RUiw29H2bOaAWlOj0vofRXYvhpxOeQRQfaLl01cvIIgcT+GTzG9+EGgHvR0J+PAj1
	 X0TtaQduLBskg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80165413E9;
	Sat,  3 Oct 2026 12:54:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 434A81A6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29BAC413EA
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:54:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wVDGTy3S3FtQ for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 12:54:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 54D22413E9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791032044;
 b=oGTgEW9/XT55ZxpQFhsm6XTvD6A1hiqU/lUk0gQpjXILkrm6ROxt1iZpVuIzr2okb8KO
 Dmooj3BBMspZBXiNpj0Xtk39O43i9/WaFie9RlAimga27fp5fpniNBp8KqOxEw4WBaZGW
 nwXvKbRFr3GyngN7yd0tKkJ7phlCAuqLSklTn0LS1ROyXstfF0ZEb0LYjr2WFyivtAnSi
 OBvKXxB/qwVUSEQHf4j/iYFSuHHSPyJX2FFahE9N/Fym4RFGzKTYUAQf3B7UClVZrAtUi
 +gxa8QTF4BY6p0BLbola+ce994TP9YpRF0D045eKepJXeTGpbWNrNkox23Xgm58Id3A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791032044;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=d8QUcNAgjgWCh75qnYqPRlLjArvg6Cyj+hws6STa7OY=;
 b=cg2pEIfKtXqX5Jnv8BVsj1rwFuqUUXdHKJNuguxo45NKAHr6zuvtegGoA7LvJyWvJtCV
 gGySJuVO29sZ/yNcOO9ymqMRDdH6peawLgkRpCtcH2b8eXfHI9c7R3TCB0ZjY+ajXo5b2
 bwJSx6dMXH6L07lxywGC+piKicD15FnJQfV4Fgr/R1PI08g4UwTteWxUjRSQRxXBLVHQD
 DYTZuNVSpTDIfIaEym+gprokeJQR5Q+FPayDDFQxF4GmPbs1gCXNlkM9Qk8dDIz9vitig
 3v4nANiRdayePA1W8/flQSbCfBeqxm140ej8jmeHux6Hrv/MaABVh6Zo3wdDqJEfANA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=rxdyIVsP; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54D22413E9
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:54:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 212394E41129;
 Sat,  3 Oct 2026 12:54:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EA992604FF;
 Sat,  3 Oct 2026 12:54:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 17E3410328366; 
 Sat,  3 Oct 2026 14:54:00 +0200 (CEST)
Date: Sat, 3 Oct 2026 14:54:00 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
Message-ID: <asD640vnb8COV19v@windsurf>
References: <20261003084453.545653-29-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084453.545653-29-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-tpm2-pytss: bump to
 version 3.0.0
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

On Sat, Oct 03, 2026 at 02:44:14AM -0600, James Hilliard wrote:
> Add the host-python-setuptools-scm build dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks!

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
