Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB91EC79F99
	for <buildroot@archiver.kernel.org>; Tue,  8 Sep 2026 16:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7109D80A4C;
	Tue,  8 Sep 2026 16:06:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mv5a6zdsG79g; Tue,  8 Sep 2026 16:06:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 306BE80C3F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788883562;
	b=S5ULZFDY5CpPijflXyJJr13rN2tzmFHI2q1dfLBEN6EkqfU82mclABGxvdLIXDVXRL3v
	 sqKbgD9eqGejvcbvDMjNEvwVN6iGIcFy7fCxD29zl0NIzXfX3U0mL5tzAnCWvYcgTny46
	 rK9gYcBEAS/GpQC6eID1AQ5P5U4TAc60jvUlj/B8FXG9I2x/4KoXAD0v+KpFms1P8awQD
	 tY5QT9JJqUPZA8qXsxedBZcaOgOjdoJ6Ht4H8Amc9aCS4AQsAnXcObf5EqXDbs/8HlTqM
	 XXw/2pQx0iLrlLjb3S4o+1mGusZzjabR14QtoXi13uoiNJrIzPA64UHAd+vPdFTXpnw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788883562;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Message-ID:References:
	 MIME-Version:Content-Disposition:In-Reply-To:X-Operating-System:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=U+HunzLTvqNN81uxMT6l1A0T4iH2jzKELXPvPTzY6ME=;
	b=R0AuBFFr0klKY4MEKzb4tV2WkxZnk3uRmvrL6+VxbflNj+NM9puLcbU7jcTBLvRkkEBf
	 9+6DVyx8MdZdUyrEOvOfKxJgiV266TUu6Uo3zko9+WOJ/CBgjdOI7URwXqJDpSz1v2ZEP
	 j/zMOsdo/x5LV75h9JxRbfC0AQ1Jl+dxPEV6pkuCXEOD7RMyGmCZOLNfbbM1GGlf8biEt
	 /aHQ7BvwoVBNI8hFu+wBp1lQo93SqIOVseoUsI+88zIEQHnaeGH9DYmTgz6Jfo+VxGvJl
	 zvtP0798R6bAuJZTdKBzDjFDNXUl5vOOFu4GXM7JpJfWR2VOAQODpROCB4Ch3exGoSg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788883562;
	bh=U+HunzLTvqNN81uxMT6l1A0T4iH2jzKELXPvPTzY6ME=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pkinIAADiuz6Gk5E2X54gJPaY6gp2A1WB0UyqD7mjPREp78+Jp14nEXGlxigxL442
	 +m2Lf2FPPGnXUHTV8rklomOjY/k7JRLXs+qdA0J8KXqx5c/gMu+bsejuhB+BLRMB0b
	 T49IQplbBX5tUf5OpavxHkf4IdgDW7R9UnxFowvsJAer+WOdH5NPJVPnzBJ7lSFPv3
	 PGNbZMIYV8KsJBIGJ0euVLxap9EDEcCSH3VcQj7GWPvbmgROIVHOcKSS57DJpNCZk9
	 SWIxCO3Q1unhIT2c3wpl6fJAshjvoPcgc8h0TRCA265jB+Nr908NeUmaNu218FlaXy
	 LP+IM1iihbgdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 306BE80C3F;
	Tue,  8 Sep 2026 16:06:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 942FCAEB
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 16:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 920306072D
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 16:06:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l-o_eXNy9TJ6 for <buildroot@buildroot.org>;
 Tue,  8 Sep 2026 16:06:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B00226072B
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788883560;
 b=VbK+/CbcVK9Y4cgeu66NnumSnvLAWEs+RpFAAOISXYhh80rvfG0KbWFwNQeiGN9hppip
 WOECypw9/XqQ2znlP7JY2SxkcGS+WMXrqNEnLlJ3wSuBXgXoQxpp24dVkO9W280/oy2SK
 aW/H5cfHAUm31mVpRQzQ11Ppq1YM9ZAGJDO2wl5dP5MwimO7DAAq1mMQK0SSEGVs6zS0c
 hp7zsoVhGFhUAtYs7KQTRQryqWZ1zRzM8sXCo3+SBX+1ZqWkaUpAoZWCkZ3I4Ynbcua9T
 TGT9LswCzAsAP45KSAJFQu1+KNOOcYEf8vktX4FcK9ENZvf6ENeNb3aliyj22EHfIZw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788883560;
 h=Received-SPF:DKIM-Signature:Received:Date:From:To:Cc:Subject:
 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
 In-Reply-To:X-Operating-System;
 bh=qR8X1WGAGXI6fgKgYgbBZmmxChHN2mAlAl2AyTzxmQI=;
 b=r3AeLQ5YncGSjDTt+nH3sNLYNHSx2D+3tUOtxN+J/ct2Gtv30AH0zVetbye14eFcRgZI
 J0SI9FzIP14fOhcrT0SyyTz3aPzYcHxpqov6oagpQkigk1BBwR9XOXdx0bFWpA1/bO2mh
 qJPRH7TW62JyRXOARjlnMsy5C8xHgKOvlmgduvIYw3iNR+voPxY3T5SFVoNLm6qvAotlU
 f3nrMEcRiUdGFmnpQvgd+K1wsAYDKF0H/qoZUAJrrLjCK8yYCYpWpKCrR9GlmC9VUAbxy
 mr7yfNzFf1R63Dz3/vVEfodJL4U1lSxlVMhhNNZY3pnqPpYr0FjHQbukgngRjtkJXjg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=none header.from=openadk.org; 
 arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B00226072B
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 16:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1788883556; bh=jJ6hdu7nnPd7tYDhdjNZFwH9867k3g+rA95j9wiGpi8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hodaCIShWZsdg7st1Tjv+2RQeDY1gp6NWZroHO6XbZwHp3movELwYq/zC74YtJq2C
 raGvGC9i/TxYEf6RApksRon6tfjxcCi9ePKyKEBeQux8GRN+ZGByjILqaEwjkfOLLM
 zpOke5dF3QgS2T8hWrY05pRPMsltA23GnUH57gW+R4pwiYm2XmI8px0i4sUMD1xXCN
 FHCywn5zXVtvMI5x+xoNGVRX21kvGLHwwnx5HybwTH7CItsC65tgukkWHSxNOYNXYL
 uOQyRlj8sB+HuJ5B+BFMU1zgDZ0lMts4dmAnwLpXq+Dd9hxuamy7z5emlktqV0nz8I
 BmtUNA8EwIKbA==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 5CDBF31E0BD4; Tue, 08 Sep 2026 18:05:56 +0200 (CEST)
Date: Tue, 8 Sep 2026 18:05:55 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <aqAyY__D1LhpPHDs@waldemar-brodkorb.de>
References: <Zq9j8m3YPt0Xh0gY@waldemar-brodkorb.de>
 <20240804231254.6301c5df@windsurf>
 <ZrB+QUlNw6G1wbV4@waldemar-brodkorb.de>
 <20240805093106.20d6716d@windsurf> <ap55DC-QtbUm7vcr@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ap55DC-QtbUm7vcr@windsurf>
X-Operating-System: Linux 6.12.96+deb13-amd64 x86_64
Subject: Re: [Buildroot] [PATCH] package/nginx: fix sparc compile
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,
Thomas Petazzoni wrote,

> Hello Waldemar,
> 
> Do you have any updates on the feedback below?

Not really I have forgotten about it.
How should we proceed? Any patch suggestion from you?

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
