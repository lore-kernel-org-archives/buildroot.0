Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F0DCD8C90
	for <buildroot@archiver.kernel.org>; Wed, 10 Jun 2026 17:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CEC640DB0;
	Wed, 10 Jun 2026 17:25:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C50A9GzGcLtm; Wed, 10 Jun 2026 17:24:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA25140D14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781112299;
	bh=9MmpJk6dSHrFygHJ0vLRUsBhGrsQO4xT5L0r+6w/ZWY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GzFAJOZf3i0AIJL2cEjQZCDSiy02Eg92TaJ7ojtO9auc7LcjVWsh+gxr7WfNW5Rx/
	 eFOiTqKheogZZ1KaYQRISfVTCJeUorXgmchD1D2/Ngv+Zpwji1KuI0VQypTRFKh735
	 3qzw+9Vc61pGSJTV8TqPw2YXt0ft0a590Tg/nLZ1pFxKc/beG1Gp1OgrE/C5kqWmyK
	 sxKQV/Zi72p5YITFygbPc5gnvaHwf1jKlGG/x7RvPptSPfasJ3lwHF3vSK1hy3HtoM
	 t14T9hAx9/7jatbrxjftgQrKE8X060TRLKepijGnTJD52oISy+iJMAXNd82SZpbosr
	 YgTHCkV9+5vzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA25140D14;
	Wed, 10 Jun 2026 17:24:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E3D8625E
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 17:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9A8360B10
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 17:24:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bv9UtiK3yNoD for <buildroot@buildroot.org>;
 Wed, 10 Jun 2026 17:24:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1214660AE7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1214660AE7
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1214660AE7
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 17:24:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 3B9F05FFAF;
 Wed, 10 Jun 2026 19:24:53 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 10 Jun 2026 19:24:53 +0200
MIME-Version: 1.0
Date: Wed, 10 Jun 2026 19:24:53 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260610064754.3170578-1-peter@korsgaard.com>
References: <20260610064754.3170578-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.16
Message-ID: <5b6e4dcef5627f9476f1f6f6595228c5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1781112294;
 bh=UL8WEqNrn5Y4uQVqJ865dts31i9W7lqPVKAuNKISYJ8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=f8URHwg+TyvJLWiEsmQkhj6tm6YVUR8zawkYKqqhMMjd7CVkln1C1z4DAt4p/77iZ
 rIUOy9PxUN2YgQkVcsl4Gyw+1X4ebHnXR1TKTKBVv4d2YdkmEFkcxmvvM4SnekDgKs
 zSMAxTqWHneh4Gi2ewS+/yzeR+pV1016R77gLHOOciKVQJ3mY+Tx+UEu6ErwXzAoo0
 Z2wR/Np3xdpjJ7NqNu8FynmMdnbdG+bGHtJTY4ZWVErybienvPW63lzhvd7nxv3PI9
 Th18AWh2cCPRtTZHllo3Lo5Le4sTIqPg11VpdGVtOC7d8Dtf6geDOZi3zrTz1UK1pF
 IxtfMZ+3k/OgA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=f8URHwg+
Subject: Re: [Buildroot] [PATCH] package/libopenssl: security bump to
 version 3.6.3
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

On 10/06/2026 08:47, Peter Korsgaard wrote:
[...]
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
