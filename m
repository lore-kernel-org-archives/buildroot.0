Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A21CD98CF
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 16:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 218B54199A;
	Fri, 12 Jun 2026 16:33:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YfQuBzhONuXR; Fri, 12 Jun 2026 16:33:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 165AE4062B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781282009;
	bh=DdBwylyMFyJXmyRlBohDDJDALqjmf+WMUu7nLVtXqVA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=g8jbUNklbGWM3Nr8nguDBvs561NdtpVyzZBetu6VRQ8OdgUtl/kVE2NfDi/noRiBA
	 UQe5OF9KqWDPz3cqwPWeAWDb/wpsxrWsaJeQ4ej1uW/ywlyCWtsstKngcJlsLTpC86
	 1q7FGVY+ctH+JLhREAjEGf0BMmg3K0DY9bp+o6+Tcj/E1vD+LQMuTRImuGDiVnumXX
	 N1TKLe4mAs44Dj++xS4DWvu3mOmdojzAUChh4P5+oXtz0j9i4cAztjNWqH2L8A0tQX
	 qv0Ni3/errNvm8PiPaQcFJM2tXacB4uu3fZ6iN6MzC5GRXV7AiH1/H0AXGTO2/sCYi
	 wNej9YZBTWxQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 165AE4062B;
	Fri, 12 Jun 2026 16:33:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CE7912F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 125604062B
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:33:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9yTwCUHWqD8u for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 16:33:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C3BD94061F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3BD94061F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C3BD94061F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:33:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 8E89D6012F;
 Fri, 12 Jun 2026 18:33:23 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 12 Jun 2026 18:33:23 +0200
MIME-Version: 1.0
Date: Fri, 12 Jun 2026 18:33:23 +0200
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org
In-Reply-To: <20260608075419.281597-2-buildroot@heine.tech>
References: <20260608075419.281597-2-buildroot@heine.tech>
User-Agent: Webmail Free/1.6.16
Message-ID: <0e09ef507ef424a82d51cbf22b8b4aee@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1781282004;
 bh=Bj9WTwJPCm/4+K5YF8whv776z1vh4s62PGbrmTHuZzQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YLx/rYDU8Fh0E8GObOP3iasem7stokUzRKW6yOhZFRxqnngo5l9H2hGKkhaFftU2X
 2FrUWbdTynxl9t4o5qjSLwi6LhXhkN8Eh7jAyxJ4Yyab1e+95KmnWf40/DHCBHltva
 zq5TiUd96usLm2HaqNmSVwKsVNMJNIwy2/S5WwVQhp+kRLsfu/5lJp8rNXYPo+uHG5
 8xcDufS4thLTbgPYWG67T+acuUnB9ZxWIT7OOdeAvlE7+cNQHUO8z6/1L6YDgALQhl
 SaokdfqopN2jBNdzGO7zpUxylBHwg50o2ZCxXUiPZDNaoJpi162z5ElVnRIRNX88kv
 8VBfBYhPZvJrA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=YLx/rYDU
Subject: Re: [Buildroot] [PATCH] package/catch2: bump to version 3.15.0
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

On 08/06/2026 09:54, Michael Nosthoff via buildroot wrote:
> changelog:
> https://github.com/catchorg/Catch2/releases/tag/v3.15.0
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
