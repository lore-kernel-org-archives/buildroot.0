Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D27C982CC
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 10:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED8CD8104B;
	Sun, 20 Sep 2026 10:15:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nGt_4WEqo8M4; Sun, 20 Sep 2026 10:15:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C0E1C80FFA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789899302;
	b=Nz522BTo3vaLRK5yL/8lVxpGXaKqiVFAlxsgEnO8HUTsmwE4VicrB242qEyWZzeWbOuM
	 YxcswFKosL2B4rITsSh35mwYsicSgVvGTAc6gqsoJwu7g6YWNgpxXHBX+UkWLnTzmo72M
	 N/vngOg0z3mTfBBFhKjZCarLLaqYQciPdObiA2XlTeEMDNnzGCgvfIezCasD+Nqevf8Bw
	 kK7pgJQzX3AngPOC8ZVvZZ161v+IR+m2anAQViQ+guRzx9H3KvxCVwMgBFZS110X43QiI
	 HXAdI0Ik8pbFM3/NnUFzez28hy+iTcDqN9o+/2QVspdamzwbA+6VTpIuOfGGypSHQ6A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789899302;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=AJ4eQg7fkjMJGUjU57l+Pb9WLrcVnRlMfNx8GHMY77Y=;
	b=NDkK4DQlfoK1ZrnA4xZqxQdoH91V2hU6+N7aUuMouPP79Uzem0S7YaIIbkS6Q6Nc7kc1
	 FELlWdTemjr/czsXLYHa2g1o+K3Q/wcEVkA7LM1RWlEXhYUgbxQ7UWDCui5JOOhwaqz8q
	 QRfZyWleiSHHcmpTqZyfv7mJSlh/1lKuWm9mZd4DZjh3s1550zGjda1FKpsyIEsjqF4Ey
	 HsWGS7LoEsaw+AcyZOCTm66M6yHfAgY9MiyTXsf70BuoqgbzgVsMhZfwQgTyNSuEF178V
	 hcKtQAzJ7kyDjItNYcdFOcQ0nPbxaf8EHMv4+kb5BASxH6s8z9/YnlW5R73cMu/dhow==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789899302;
	bh=AJ4eQg7fkjMJGUjU57l+Pb9WLrcVnRlMfNx8GHMY77Y=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qKmJ2PctJhIFeZ0l2bE+Aez1X+hteKSvme5oTYQaomvAhZfedeeb0XBM2cVwOSdIQ
	 3tmyswWENpcsk48o9jAEF10ZEJgrFOAFjLSPdQIuRNtJTAozGmpzB3ZnRvYNV/UFRk
	 D7pySqBNm6teqtRp+XuysSb5Rt9m3/2AU1/zai2LHyigo7K9pZLrY8cvPuxUeGpyjs
	 OZdQwJ/oKkZebj7QwdkDtaWsozZ4fKVJPi9ovnZcL2q7lWNgv/itdVA8NRaOvxa2OZ
	 WmWEGSOwDYWZRDvp9I0RKgXdITmxtnKQZWzajD02kQTlP+AqXlPYcIQf6tVfIByoE3
	 IS1jncP9IQTIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0E1C80FFA;
	Sun, 20 Sep 2026 10:15:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B897224
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D44580FFA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:15:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M7vTvlLY-SfQ for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 10:15:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0255180FF4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789899300;
 b=WsJs/W4IPcWraAVIjzbC9uQL5pS0L1aNMAUJJGkmmQWkss0bBflWMCrAU7usYO4FiV5e
 oe3Vkw8W/+loQ+2E/leHhTwgZTtbMtRmwY1g4a98aMe5RoxxuoEBaK1dKbYnryfK3Z44Q
 gvaJX1+Pj+NbZR4xyEQKmxF0DDAQV/gDgK4yDiGBpHee3ofBjbgsaOBYpWl13+H/TVPzT
 hgpkD1HatkddBevv/tD3qI57lRUfMqcxKigZwdhmAvRJBdu7zVNuBApoz5ENWHzcOtFVp
 YfQMKZ1akP4ZHHZJqah8wZHX83pV0ewntPxurboW2N3Xb85+VvVmKU+FcbjzfC+vCHQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789899300;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=tAnC6FPeqXbY648zss4Xzcie6EOzReuxsinm9sxq988=;
 b=NPnmajX5Sxi1tsvjMNANJGMEBLQ2dH6ujeN7Q3VTWNuym1zbXvgmTvs90ak9SDra6LKQ
 odF4pssiRPxs781QyAPgUQMtXiyLnof3754ZT4MWUSbihkYX+kRJlU2d5mrAbuOJ3X+6R
 qhyvGZBrMFyoceHShhykZjTWK2VZPoewzXJyIrpcybEw5Lir2NJfYEzHL6pXuL3Hwxe2D
 zXLiHD6siS6RPza3jp2i2f6VFyjigQ75J/eaTRO4PWf5KXq1kEGSR+YWuR6LgNeDscj2Y
 +WlsKTIlV6sl96af4MB4/A9bhYnbHrBgakP8Wngfye4thBoypKpQT8gB8b7ASd92vsg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=jbiqOaLG; 
 arc=none smtp.remote-ip=212.27.42.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0255180FF4
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:14:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id C432119F59C;
 Sun, 20 Sep 2026 12:14:55 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 20 Sep 2026 12:14:55 +0200
MIME-Version: 1.0
Date: Sun, 20 Sep 2026 12:14:55 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20260919213542.1294729-1-fiona.klute@gmx.de>
References: <20260919213542.1294729-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.19
Message-ID: <3bc51aa48abe901b8059a5dcdaef5d44@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v3 1/3] fs/common.mk: add optional hook to
 build a verity hash tree
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

On 19/09/2026 23:35, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
> 
> Using dm-verity may be useful for any read-only filesystem read from a
> block device, the new hook will build the required hash tree if
> enabled by a per-filesystem config option.
> 
> To use this hook, the filesystem config must define a boolean option
> BR2_TARGET_ROOTFS_<FS>_VERITY, and a string option
> BR2_TARGET_ROOTFS_<FS>_VERITY_EXTRA_ARGS. The latter option allows
> users to override veritysetup defaults, e.g. to set a fixed hash
> algorithm.
> 
> In the filesystem .mk file ROOTFS_<FS>_VERITY_EXTRA_ARGS must be
> defined as the value of BR2_TARGET_ROOTFS_<FS>_VERITY_EXTRA_ARGS
> without surrounding quotes, because utils/check-symbols warns about
> the _EXTRA_ARGS symbol being unused if fs/common.mk uses
> $(qstrip $(BR2_TARGET_ROOTFS_$(2)_VERITY_EXTRA_ARGS)) directly.
> 
> Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
