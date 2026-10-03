Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAFFCA5FC1
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 12:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22E4D81330;
	Sat,  3 Oct 2026 12:36:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bht6YPec--SI; Sat,  3 Oct 2026 12:36:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4A1348124F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791031010;
	b=cPV4NQAguxJ6Mf1F4D3wSYvfUFVo2vn9dlOZ7TiJ0X5yILxFtUxSx6/AgmP8q++T1cNU
	 UnaanLb4JD7oSO8Rbf1WYsntAYAx0o/q0pbnTc2ynKB4fFQeP3c5kK6v5uz9M2ABPARYG
	 igHwzP1/hfz2IJ4JVhXM4GClMLVd1K7IVV1zi7H4S2jCGPS3386v459GvwgwfakfgC/6T
	 q53xc3Py7pGo6l+3rXt1d3a6c1UTwfUEa6IEBklpzVjElh6ofchXnGG2cFVVO1jogfmsp
	 L94jGE87JfvD3wJcImfSIccp2f/14w9/pG8vDeI/UkfpVU7GpfVzu4Qcs4Y+U/C97RQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791031010;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=n+IUVwW3bOrpyVFhULEKWSiWZrOwS7X+4eW98K2F9Yw=;
	b=nX1oab4UxYi7e1/E4/n4extaXoei+PjRBzgJ7/i0OOgcA1cU4Ck2l63S3cRatiXBTX1A
	 dgFJ6pjonbiBTCA25KHTcwlBOhvct6eTH2SZa2VScnyDN6fHTYEShxvZnQD+ndDJs2O2n
	 NOQODq9qMwr1XbFe3NQ2HIX38N6uSSQNsVIDIIBolPzohiE4QTTJHEbaXdrM1yLH45lrZ
	 1po8bC3jZsKUK3HH+claYBLMSQZrs4cWB0b3gkCmi/ye5tO4baPzVhldHHG5nlsTQtNGF
	 P/iu3XNqBtlC/OCjbUFHbe+s92aneQfgsuB94BWLWCYQDe6IJ4JYFdrk1FpeEj9cJkQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791031010;
	bh=n+IUVwW3bOrpyVFhULEKWSiWZrOwS7X+4eW98K2F9Yw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UZs3pcpFw8LJEgBCcQ2W925Qr2yMdntJJNdb1lbWlSmRO4GVC9Fch8NjESE8VChiI
	 RrulD7xkK/3s1ORGvearqjtUwzWic5fhnQdeuYDyztW5KmkhV+sNuwDqumGsDxYVMP
	 HWox08Nv6I3tLAWQdFuwhTyXcBSJ9aEL9FjjFxbpi1MIo2u/1xJL/siyniqeZ4G3D4
	 ullX2C74XaP/p/UrZAJTPfEv342azZOpWixEnsAS7NWc4sTSp5XzbVHRDqssr4425M
	 HovWAJFa7NDRKhlPeHcnR5H1fWdYnKF6VybStiAVXxFQ8ysv5SZ6DCHquW3HiKOmGC
	 KQLbwouRH31xw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A1348124F;
	Sat,  3 Oct 2026 12:36:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 65AA932F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C08440064
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:36:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DO7a77HxC5tj for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 12:36:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 11EF840063
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791031008;
 b=ZcLmCmBYWopFF1cavOfeta05lChVG7lpB12IEHB0dO09Ke7UVJBLoIP2TYDZYtyzpJfR
 CqV8cyv/FrgwRNlKBZNm/ZsqGQqQhBQD9uWQNumUqQgeFinNKo57sk6On5oRCHtKl9io4
 GucGdi+ah9D24gW5m2zWxxpf9xzIAPt2Rs1tcTzwCodbEQruWpIVF1vg18043L0C6DL1F
 fIhypCAsbyeteEgKj7stAz93c8O35DFL6Xsf+qCRKH46dFI8LYZREMx2mgCSbMXIq3GZp
 foMpY9yzxa4CvOGG7ZYlfuWNyO4muHgXE741bQmD0xMDvfEwyfcD5v/TNBLX7KsRN9g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791031008;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=YYYhLk2eEUPsjdeuOX1YzKhtIb/sGaKIDC3FV8ukl2I=;
 b=dLc9f7VaxXXzJgwKjQRQY9cJrsvzn4nTMCZ8rq19CDF8NbHfKuvYcgC352u0/KQE+Ka5
 3zMq/oGObNnzD+S75FcqMuzfGef7ihWa9hsYdvb3D6E1OpB1Y8yyYnwEy2m9/fIBqPo6B
 HvoV18A2EK7JuxSMRBf++RsetOIm1U2jiHwvsbLzU17DZzjXr5npw5M1hPwd4sFpweNYE
 WL2NBptnIPPBgKdfCRzj5ePQKYaPC2b+n37Ur8pvr0faLGz8befzXKbT65IjG/8HsUiqZ
 DBuvrnvnEM1BBOvS1Xgknffjo8y5AeeY8s5aStucxJ+mm5U9sLS9HAQsCOKFQGc0pmg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=jCJgcymK; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 11EF840063
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:36:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 488471A10FC
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:36:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1CC16604FF;
 Sat,  3 Oct 2026 12:36:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4CE4610328318; 
 Sat,  3 Oct 2026 14:36:44 +0200 (CEST)
Date: Sat, 3 Oct 2026 14:36:43 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>
Message-ID: <asD22OlKEuDeMl4z@windsurf>
References: <20261003084453.545653-17-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084453.545653-17-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1]
 package/python-magic-wormhole-mailbox-server: bump to version 0.8.0
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

On Sat, Oct 03, 2026 at 02:44:02AM -0600, James Hilliard wrote:
> Add the python-setuptools runtime dependency.
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
