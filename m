Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DC3F3D61D
	for <buildroot@archiver.kernel.org>; Sun, 29 Mar 2026 18:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C10EF810AA;
	Sun, 29 Mar 2026 18:02:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gyuc_hB_Ceew; Sun, 29 Mar 2026 18:02:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A61E880FF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774807326;
	bh=3xmb/Auz7y5kcYaI2ospXUHF9GmBrtpdQlxSPX0GW3I=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=G3yynSpxLI1+TGe29+vnCUi+PX70cgTbz2Zxbi2f6pysJtsGWFyiKBDRSSGltuQts
	 9k0ceKE4mF0PkigymsXvozer4anVuMQ+JzqL9gyjJPTzZt7DUvoag4hM26N9SAU5Sb
	 r7YxwlSOtppRD1umknOZFKpYHtMSiS29YNTq5cx625JlgSa4nnTANIXaso3cG4Kv6y
	 VOSD1WQsttxUeL1XV8y93k8OlFGVD2zb2DACFJXqmupkmgnO7Vktk9+R3RU4S17S0+
	 CpU7rv1qllNx4JaiY7wbKkPXq0UiggftPZXcCdQ4tt9dLevOIs7C+p9JsNFYWy9LMa
	 jNsmEtVM21qDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A61E880FF9;
	Sun, 29 Mar 2026 18:02:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6200B2EB
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 18:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5421C80FF9
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 18:02:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TE3nqQG82ZEY for <buildroot@buildroot.org>;
 Sun, 29 Mar 2026 18:02:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A0FF180FC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0FF180FC1
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A0FF180FC1
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 18:02:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 1CB9A5FFC0;
 Sun, 29 Mar 2026 20:01:57 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 29 Mar 2026 20:01:57 +0200
MIME-Version: 1.0
Date: Sun, 29 Mar 2026 20:01:57 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>,
 Hendrik De Vloed <hendrik.devloed@dekimo.com>, Thomas Devoogdt
 <thomas.devoogdt@barco.com>
In-Reply-To: <20251223221424.61578-1-thomas@devoogdt.com>
References: <20251223221424.61578-1-thomas@devoogdt.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <593e7b22d90a610e885761b4db9671a8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774807322;
 bh=rhR/5Woi/Q2LEUD5TJc3BOrijK2IZbZcC44EdCbBfZA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MeMoHWz+e1v899jum5urjM88RwvO7KnmfJ1fBycbzbpQFTDv7mwYBENMt86DlJei2
 oRWAG3Pr342vBm7uGQXoOaGeQc9VoDuQBJPVqHJz1TndigC1F/TKkTZAC7RE3GCcIe
 bOXAwxgH84cumidDfNlkfHUee+RD4PsEv11eJlKO/rCSosOtP+TCeYn6MGmXaXmMI/
 87dsU1OEFnUnqOOZF5qFnuy3QqWIvp+7KOnbvxA4+p4gfQJGZlk/S+isZ2PJ5QHlL6
 q//b46gS/QsDD8v9AuU1x4ta0L3vYToGmudyW5VSMyeMJ148VRcv/+zgHmWmAX2rIE
 2h09bh6mgpqSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MeMoHWz+
Subject: Re: [Buildroot] [PATCH] package/sbctl: new package
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

On 23/12/2025 23:14, Thomas Devoogdt wrote:
> From: Hendrik De Vloed <hendrik.devloed@dekimo.com>
> 
> sbctl intends to be a user-friendly secure boot key manager
> capable of setting up secure boot, offer key management
> capabilities, and keep track of files that needs to be
> signed in the boot chain.
> 
> Signed-off-by: Hendrik De Vloed <hendrik.devloed@dekimo.com>
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
