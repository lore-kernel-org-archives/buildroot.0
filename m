Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFF2C982C1
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 08:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0038180EDF;
	Thu, 17 Sep 2026 08:25:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ZR8YQBUys9G; Thu, 17 Sep 2026 08:25:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D6B3480EE0
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789633542;
	b=e33mKdkTwdRQWPr/K+s0B/0fJhurwA4aGpMOCx1VyYlZuaRgQD/XqisIUO7Z44RZQaR/
	 ShHKbHYvBoTM7nRVRwtwsZg+GoFMeZl6AQVSWAlnOKTmp0SeOLGTEmCGnluDOqn7HMAaA
	 kciRrh8OGBfrkjigiR0ee//BbfwkUoiomir11HLAKhg/XzaKWzbFHVVgjdi6TEDA7+ZVF
	 IdNMVuxENtQMTr+T9lCN8MJp6ktOPBtSE+0xgfoa50hdBhLJka1izXrCeITihixEtEL09
	 tX2HoJEi44qOG8/wNddtolmKFwPF59F5/pRmOzIwxQH0AhgTU4veOi0WBo9Lla0Vg/Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789633542;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=rQcXf94JtgM4g48NWIvqYLc3VKCXEPwwhokssgNEADM=;
	b=ZsG8fi0oxEAso8RgTNpVQ4U5DUj8x0OxRpSP/mLF8T3hs36T9puYnvUosGHqovTJdfg6
	 0C6dew58jWw94cDOpbpgU1+p++I7LoieEXCeq0YVdWEoV0lb7CHMkYPs/lPpI4Av/BUkc
	 vbsXe32XdI5O7FPh2VPCztfBJ/04bcZz8/5Nd/jx9i7OKoi+wVck4Yek1VHfWA3WCLj2t
	 0Ft3ZQWFEBD+sR/P0XUlR0BWPZf8aaRtT3vjNDoymDMNZCi0ayKvJrMZClO7BDmbSchJr
	 pAtDZ0jYs/5xhpKlQa9acbdWR/FvoI6uHQ/zYsPUIP5CTzLgV8uGpELnogubRupnCBw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789633541;
	bh=rQcXf94JtgM4g48NWIvqYLc3VKCXEPwwhokssgNEADM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lK62eUf0VJwbbeOfg/rNeMHEKwOAB5VJSnzyq2Y/qBHreTmqzBc921tnYnxFxw+Nn
	 nUAMFzFsYsySJgaoPv9iRYwxIsbmw6exOLEU8Mxygn8mmV+fKnJrAfuv2Oj1gMjf9B
	 GZSlBIFPydM+7/3q94e72l9Fu2y97lUMjVDTg7D4Bf2adRuAGHsnYYVb8PZCeSQfq+
	 Y3M4KJqS2yrUnKGoOrEkztR6rN6UnmE7AdvvdZDi89YkGplortsOFMXNhjT3llA3Sp
	 bzwRSa4Fxz2NYK6JJ9hPNOkWSFw2LTcCtZidhOuuxvfGfKoJ4pqVI4IJaPriY9Nxcb
	 LNDAkbJChCwrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6B3480EE0;
	Thu, 17 Sep 2026 08:25:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D78C813D
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 08:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD42D400F6
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 08:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OW6zNkzYzaIO for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 08:25:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 6014A400F3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789633539;
 b=Fa0Nm7r+1QtlfemSkFFBIIe/X/fLrMMcyOTCIAEvZThl2tqLgnP28e6XT+bOnBiKSWxA
 MNFpfGD8NQcfFjvmiGMjJjaeRjkbr97mWG2TI+Xk9WZi/E5uFUigfqHvDoum+1AKDwXH7
 2G9yE9Ei6uAGNNvcxf5nSohOH8WRAlUo1vsqQtjRfguq/OeDFrxvwmZqUXJxrnon1NRSY
 y6aiix0KpmxhMtfz2zIQlCoYGsMcYb55d5ia4hTDw7zJCiB3pD3aDOWzWrnxpA2HeCu2O
 HqOCwoIVgYGJahlgN81CTrqiZSyRg8VB0qjVmfb32DJDSo5JNnxmkfOnbF3NCu7VUdA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789633539;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=tkTyGZjNCgxfkPZjxFkqTnNHX+ExFdJ83ohzZ0FnxLY=;
 b=QpVMJS6+cLTkRoIrwB8YJQ1dGQKW3t9f4RATMbkAhd7yVxKNoDP/P1MKtA3wiqZX0HMq
 NmluzqrlhtbkEg6QAdeFDudE4j++IqismY2KuLDln+jsfbSs16F8PfbLff5fFHGozZD7G
 NqXqlHM0vDSGiZCJsctb2CGLwbJ5GB6R9qp90HOjMo12cIQ8j1zTP2p6vWYwIUmY74m3/
 FNQ9SNZCC5cl2uG8H2P72xL4kHmJRBSNfPrkOB9VNxwDKkSiw/FIw005C7vqwgr2dwfYP
 XKv3La9db9J9fVndN/hnYg3sUuSiRIMMFC3W1OwTRGkTWhCwMD8UbziMzl2KTV0P2IA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Tjx1aJqE; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6014A400F3
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 08:25:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 7E32B1A0792
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 08:25:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4ACE25FAA3;
 Thu, 17 Sep 2026 08:25:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4A1BF11C7B062; 
 Thu, 17 Sep 2026 10:25:33 +0200 (CEST)
Date: Thu, 17 Sep 2026 10:25:32 +0200
To: Antoine Gennart <antoine.gennart@quimesis.be>
Cc: buildroot@buildroot.org
Message-ID: <aqujyonE74-hwxq8@windsurf>
References: <20260916130840.881186-1-antoine.gennart@quimesis.be>
 <20260916130840.881186-2-antoine.gennart@quimesis.be>
 <aqsIPwc1ZeVxBlb4@windsurf>
 <9f159817-dd6b-4f3c-bf08-8ebc357b9697@quimesis.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9f159817-dd6b-4f3c-bf08-8ebc357b9697@quimesis.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/2] package/nxp-bt-wifi-firmware: add IW610
 USB support
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Sep 17, 2026 at 10:02:12AM +0200, Antoine Gennart wrote:

> I added the Signed-off line correctly and resent the patch. It should be
> correct now.

Thanks!

> I must admit that I'm not sure why those files have been removed. The main
> concern I had was to support the USB host interface that I needed. You are
> right that it would be nice to have an option for people still using the =
old
> NXP firmware.=A0 Do you think adding a "version" parameter to allow to
> overwrite the default version would be the correct approach ?

I would put a free form version parameter, but a choice...endchoice in
Config.in to give the choice between old version and new version.

> I will also check for the reason for which they removed support for those
> devices. If they were never sold, it does not make sense to try to contin=
ue
> support for those.

Indeed! Do you have a relevant contact at NXP to ask this (fairly
specific) question?

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
