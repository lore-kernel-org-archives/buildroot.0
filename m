Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A181DCA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 06:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E3B66066F;
	Sat, 10 Oct 2026 06:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nhb-9sO6JE_l; Sat, 10 Oct 2026 06:54:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CA1F360662
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791615250;
	b=Vmuvz09XIqqI7NSu79//8sz+98TSFL84Ab/2LNsQEV/+6T8wnabdQeWxIpwVhInjt23A
	 kGG41/2eHBvRa8eoVvhDU2GVj0YpR6w6x3DSL6SX/kxnhehsdgloGypYu1vbBoZSMcQa9
	 MppcEinuoYwnkKrP8SReHVDLOuCcKcLoq54iEdH3RfZc+BE721q3XbYuI2Vsg73rbcjz0
	 y1SFlnlkXCr7z/jfmzNA8qHhjnu1BLsfJL9VjGDgU6KtJToxPTuU83wb6IiZKrlvxEujX
	 YwoPfGgDFcwJ0LfDazWytc8G6bs43G7mpcKhha71+oLyvCaotjpljtt66AY91fY+u8A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791615250;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=5vz32a7bD/2pivRyJCnFUqMJ5xGiFxQ3W/ErB5hucCw=;
	b=PSPl+BFX/3/ZEQK5VfFw4FgNYUQcqJyEKjDQJYoPyu3zOwHewJLvIma3ShJK2m0wY1JZ
	 1oG1AvWZzEfIn/G+N+5YjsEm+4RgW6glrRSuw9SbZnNgt3MbDtpQYzBy/pBUXOhQKl0qj
	 2iC7q4i/kjdWXHCG17dIKUfqSOgalt2UjgSHtTDqmAyVxVoQgQqUO+UUJHvB+PawJfTeS
	 aYrBihG1JMqE+DFvrP7t3WdDZ+sVwUCmI0ZGqCArkO1duxV2g8ZKonZNpnRH/fu5X8aRl
	 X6HPHlc+2EzGwrhHDi7mk5KXu3EzvfZ8BDxdIQVBqCwX83NkPRCpQlUQKEzkz0dF01g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791615250;
	bh=5vz32a7bD/2pivRyJCnFUqMJ5xGiFxQ3W/ErB5hucCw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fnnetwhP0W3W+0FMFNQdpEedXfljkJyDTd2sld+x6xG+0Spbd5bNc8pbeCMbX+xnf
	 /7ziCli6BWqvOJV+PffKNsljKXBbLGTOdfcRRVm2Y/Ep3Xo3taKWKl0TEV1HNjNDkO
	 J8KQOrubulHm+nNJ+EJAua/jNGkb9C1t0Af/aA22N5AKyVIygVQwSj69RPNMxhsqIp
	 gxUIo3dvDNZYW8cODT4OQoGTQ6JurUBHbwYPysFkwjk0S0dZpWye0bg5duf8yfX8b3
	 wCEobI8bIBVtX0RV8ESp6m9b6ZtZPW6H+pvC6nWZpO+kGm5go5uFFGll9NMg700ejl
	 PAG6Lrz3i5jAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA1F360662;
	Sat, 10 Oct 2026 06:54:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C885B75
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 06:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C45E94093F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 06:54:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uivWapAhQO7t for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 06:54:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3D7BF40942
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791615248;
 b=pcCiAionV+DXk1x6b/b7JZhxQx0zksCoeAGzQq3NuZrZe0nWIXMK+B0TMhIJ2NC4jrQ2
 95nclXk52fjv8EvMiO7/I4BS3UjWsAr2an85KgKzA4epG2GkgI/m0NvwSxgss/fFYZCJI
 QQAH1dTGPBG+3+mO/Zyw4KylrVH0pPyVe3FF+wnefjCo16mj5pLKWMoQWIdKgc6ZyWpYF
 DVn3ieQVpTpL9+yMJiaqkDUiPCNFPBZS8hUMxuSZOvfnk+daw4TBrRCQu6gISlL8nI+gH
 3zL8OD8zg8EpSZkCX98QT/smxgvt5XxJTMlsLjc7Tu7O0RdYSKk89/6eddOKMM78rfA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791615248;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=ps1o8C1ZrLHrP1aKRk7xyj9Pn5eff6Eo5whCj0osZNU=;
 b=s5RKseTl1UXcWMJ20e2v4m3k8L+3ZIBpc3GoCxqb1sUWNIxFiYk37fji/AP9uT7d52mi
 IoQtvxpwiEoOX8LP0WJ2ZuPECc7lYgo3fQe5SdyWiWjwsBBeU/bBD3WCsmmFu3+O5wcBn
 vliKzzYxyba2wNwtV2iLpuxzb8/v8yxPuYWNg8gokxok73HvaP79okNrdbQqXP53wL+UQ
 CS3JrIlEYKdb5/eo6YRX7MQLCnJTR9UySEAEyDxAP8eWnhZR70KXTcPc5vXylvMHbbMoV
 6jPqcN9y3KFbQzfFbcl9rzvD0dv/Ge2bUsuZXd9glGDKC/tDjRnonRRMUgRE/42dJXA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=qwNnpHEa; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D7BF40942
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 06:54:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C7AFF1A1140;
 Sat, 10 Oct 2026 06:54:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9337B6075C;
 Sat, 10 Oct 2026 06:54:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9234311D7020F; 
 Sat, 10 Oct 2026 08:54:03 +0200 (CEST)
Date: Sat, 10 Oct 2026 08:54:02 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Karoly Kasza <kaszak@gmail.com>
Message-ID: <asnhBtwDypwMZEA-@windsurf>
References: <20261006162106.3439373-1-bernd@kuhls.net>
 <20261006162106.3439373-23-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006162106.3439373-23-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v8 22/84] package/openvmtools: bump version
 to 13.1.0
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

On Tue, Oct 06, 2026 at 06:20:03PM +0200, Bernd Kuhls wrote:
> Rebased patch set in two steps:
> 1.: downloaded patch set from home-assistant
>     https://github.com/home-assistant/buildroot/tree/2025.02.x-haos/package/openvmtools
>     which is based on 13.0.0
> 2.: rebased again on 13.1.0 (no changes needed)
> 
> Added patches 0011 to fix build errors with glibc 2.43.
> Renumbered patches.
> 
> Added tarball hash provided by upstream.
> 
> Removed CVE entries in openvmtools.mk due to patches 0013 and 0014
> being added to upstream release.
> 
> Ported various configure options from home-assistant commit
> https://github.com/home-assistant/buildroot/commit/3206b3fa58a636c7a98ff7a65f76fcf23a4302ee
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: Karoly Kasza <kaszak@gmail.com>

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
