Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EBEEF4EC6
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 08:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAA7180FAE;
	Mon,  6 Apr 2026 08:36:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oEUP4SfyY4uP; Mon,  6 Apr 2026 08:36:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F40680FA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775464600;
	bh=MQIm09vL61STCHTqczMSzdfZYnUWrzYZ5jDH3X3K5DQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=o++OzL2PVABRLDI61vLdSRPROoaPqqoMlDTIz/PjPSbQTunZw0xWNEp/x+APPp3Rl
	 UpjUqNrbAmcsLvxvZdRm4i+PuZ6dCbUuI2G19KO0M3j1jEbTYKv2Utp4TId6p55KGG
	 p2JxqU9k1UBBnfUd52pkvZpyVQWbXw0H0+k/KEARiFgEXTEtOxEUVpTZ863J2e3CpJ
	 WhK0wm7ERL3Xg93FKd2mQq8YdN+JfAxQO/q3blyJWcP2kzVs0hK/6jqWt+MtF+yU3Y
	 tLNVgjrx251kOyfYY2+WgDI7LRzOmz44mQP5dH6Y+MrD3EgE03Y3cOCuCRr35rdzoQ
	 jtBfAY+t9MecQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F40680FA6;
	Mon,  6 Apr 2026 08:36:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15054219
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 08:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF1C24094A
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 08:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v55atx26vBgq for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 08:36:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2FC8D4093C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FC8D4093C
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2FC8D4093C
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 08:36:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id E42A1780383;
 Mon,  6 Apr 2026 10:36:33 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 06 Apr 2026 10:36:33 +0200
MIME-Version: 1.0
Date: Mon, 06 Apr 2026 10:36:33 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, David GOUARIN <dgouarin@gmail.com>
In-Reply-To: <20260405073025.13295-1-bernd@kuhls.net>
References: <20260405073025.13295-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <cf5802eac5c36df75106468899c1b86b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775464596;
 bh=WWYAcxiI8gXuAFY6yr8Gt9w4T4FjV25KVMDtGeA3UgM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IAyxVJKGCso2XIMOgpHXvhbPAcO7GoyWiIIDnP4G6cXYBSrWnUIDiOMWecSoXZHF5
 Uud6Hrcb1LFYVcOag5RTOGZKNQPz+TMnfRKbdFeoT4Me0oCP1DZRB8+70Yl6ctX4qQ
 xqkluwxYZfomWOzzcoP22HpdByC1McUVx/d2MRWfjL2fcx+6fehIOfmMZ4BMu2kTMx
 7pmc1W3VLEwhfIe7gDDe6HlQEo4ajIPQ85+70xPI5GG6YC1zdT6ZioR+ZLtNv8DTVP
 81v94C+bbE7LBJLaONEHghpRoXcBFL9/3wdOoTY5WRVHQYbhKcKA7qyjoBrJDOPnHH
 X52oHcBv2AqCw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=IAyxVJKG
Subject: Re: [Buildroot] [PATCH 1/1] package/freeradius-server: remove
 redundant pcre dependency
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

On 05/04/2026 09:30, Bernd Kuhls wrote:
> Buildroot commit 736c4c1655d93652a9a7e79235bbe726b3d46176 added the
> package with two identical code blocks dealing with the dependency to
> pcre:
> 
> https://gitlab.com/buildroot.org/buildroot/-/blob/master/package/freeradius-server/freeradius-server.mk#L161
> https://gitlab.com/buildroot.org/buildroot/-/blob/master/package/freeradius-server/freeradius-server.mk#L218
> 
> Remove one of these code blocks.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
