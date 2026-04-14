Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7425FF9D0CE
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 13:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BEC442A18;
	Tue, 14 Apr 2026 13:11:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E5kJAZ1Ii-rN; Tue, 14 Apr 2026 13:11:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BE7F42A1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776172275;
	bh=OVEid9F45CbQExO3pvWgBLuHcugERxv0LhDiGKOUkfU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RQ0i5mc+J1wZ0xKfyTjfZv8eKD4gD+cqmRWfiYZ2nHqjLCYLpfIkTLNH+w/SF5sur
	 zV3K00vK3wcDVjzRHBGrtP0FjhyzlnOnHfKW5Al20QW6NuVqz0odKa3Wub8lQvUrIK
	 /wiFQQr3EeHtXET7iJ1F8C2cm1uNt0EFGhXeUDpYUYFlopwMieHtiVYuD9YiGvH3f3
	 bPXT2Ce8AwgUMXf7tsSOTSorUXc3FZNVNYsJW8m1R4pPAe0ydkWtjsGr2CxMWa1fpD
	 t4PIxA6CO5LQRczaLuwq/QphK4VK7Uiz1/L8mRxrCXdSNf9X9iW8pbMqE0qwk4Zu44
	 01mq6FBf3gqkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BE7F42A1A;
	Tue, 14 Apr 2026 13:11:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DA8A237
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 13:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B38C42A18
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 13:11:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9IYEn54-o3Cn for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 13:11:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=51.210.94.139;
 helo=smtpout2.mo533.mail-out.ovh.net; envelope-from=mooz@blockos.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 86B6241072
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86B6241072
Received: from smtpout2.mo533.mail-out.ovh.net
 (smtpout2.mo533.mail-out.ovh.net [51.210.94.139])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 86B6241072
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 13:11:10 +0000 (UTC)
Received: from director1.derp.mail-out.ovh.net
 (director1.derp.mail-out.ovh.net [51.68.80.175])
 by mo533.mail-out.ovh.net (Postfix) with ESMTPS id 4fw4Jy4N7Xz64bs;
 Tue, 14 Apr 2026 13:05:54 +0000 (UTC)
Received: from director1.derp.mail-out.ovh.net
 (director1.derp.mail-out.ovh.net. [127.0.0.1])
 by director1.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
 for <thomas.petazzoni@bootlin.com>; Tue, 14 Apr 2026 13:05:54 +0000 (UTC)
Received: from mta10.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.110.96.93])
 by director1.derp.mail-out.ovh.net (Postfix) with ESMTPS id
 4fw4Jy26wfz5vgj; Tue, 14 Apr 2026 13:05:54 +0000 (UTC)
Received: from mailstore13.priv.ovhmail-u1.ea.mail.ovh.net (unknown
 [10.1.8.13])
 by mta10.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTP id 8DECD7815D2; 
 Tue, 14 Apr 2026 13:05:53 +0000 (UTC)
Date: Tue, 14 Apr 2026 13:05:53 +0000 (UTC)
From: Vincent Cruz <mooz@blockos.org>
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot <buildroot@buildroot.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <1628957097.30634098.1776171953434.JavaMail.zimbra@blockos.org>
In-Reply-To: <ad439G29nhY3vWGf@L13942.iliad.fr>
References: <20260414095841.445592-1-mooz@blockos.org>
 <ad439G29nhY3vWGf@L13942.iliad.fr>
MIME-Version: 1.0
X-Originating-IP: [213.36.7.12]
X-Authenticated-User: mooz@blockos.org
Thread-Topic: package/python-ncclient: new package
Thread-Index: J7BUgbLYmV6hPzOcAF45SulyBEcSeA==
x-ovh-tracer-id: 4301500595798264706
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFECCxhbDCF2lDuijY3YMju0dmoFFPyluuE/2Z1qHB5c8WwXVK9mGa8kTfMXpeQUrEYGzSxx4wYx4xI68/Y3joCCzTVsf0EINdEzBVppTCrMfsg7SPQWpV4qKd6EAw+j8CuvdSTOVpjgkffatvdK+FF9bd8QpM0FSDosr3creA7zIuvFx3GRbe044QFMfEf44VMpGfhVSNVKsUUNc+pN1WDGmilATdfx05HwHVR68ZyTysVx7FZ91mT9JhePzyt3G4CqbxvHPJCa6EgY6r4Hd/wlXOBpETsSVuaIC477MvNq3TJ2SA0bnReS/WsP8sxtW2B9hNEJmDhH8FDEcU4yrV1dDhSQ8vEzsLo6h+r7PKqlBOS0cgFud2h6MWdpX/LKuPNnwjzYZLJSB14NoLYRgImP/CooySjhEak0IhYN2tC+mT+zK/52YUa7XfYt8RI6dZLj6ZJ1XSowght+fXCvAksI1Y26GTlP29yHCpbTBuC3SGH/mzEPS4u0tRXky3f5DYss+cZHehlaed0Ft22rN0h3V4rlo6/s8EiCjl9G7/aDdicD8V8HFDiGkI/U/MYOXi8/w18t6iHF2rFsD83CYGyIPLIhPT8u1ZjasYq0F+NWz3+S5uJ7yB5nmnMC061jkYydHThgP1SPDa+QJ2vdTISuyNZeBeJS1olXcVJLkPgzQ
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=blockos.org
Subject: Re: [Buildroot] [PATCH v2] package/python-ncclient: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Vincent,

> 
> Can you share the buildroot build ci with those running properly ?
> 

Sure. Here they are:
- package build:
  https://gitlab.com/v_cz/buildroot/-/pipelines/2451547769
- runtime test:
  https://gitlab.com/v_cz/buildroot/-/pipelines/2451972712

Regards,
Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
