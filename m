Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA778C55822
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 16:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 331B880C75;
	Tue,  4 Aug 2026 16:50:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e-JDA-rvlNUB; Tue,  4 Aug 2026 16:50:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5706D80B63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785862213;
	bh=gUplBPQibOgnKqnPAre3tsq7vFVquD2y56q+F9RvXrk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eSnUFXrJbKdWyF2xzynSK6f3Trh5Gn2h7FbkMNQlauDqdY6bOJjZ0Im7R3/IAjK4Y
	 1NifLLH/0ljHJqUJZWdVy2qxEGPo4xIiBGB6wxDILECsN3nTFktC/Zs9A3sDBd2zVS
	 DgdNqGxvySohQwENAYTUZcG5deZrR/L9kJMDj5hQ1y9pwwIF9Ujn84y0RGxAN6kbco
	 53y9ONjcYesbJuXcodWt9OO+WAOo+CTHLRadKh4ZHe0caQGgiHHyQlCXV7MOJLhS+w
	 6Oo1iqBEaq3utRRc+gHd25OGh7Mo8t2kGsxBRGlEBq0jiy5h4pf3iLY2J1FaMyic5C
	 FOy/QqvEi7I/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5706D80B63;
	Tue,  4 Aug 2026 16:50:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E3DD350
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 16:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54C23405B6
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 16:50:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qNNS_K8GSFWl for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 16:50:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4944440594
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4944440594
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4944440594
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 16:50:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id E28C578051E;
 Tue,  4 Aug 2026 18:50:05 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 04 Aug 2026 18:50:05 +0200
MIME-Version: 1.0
Date: Tue, 04 Aug 2026 18:50:05 +0200
To: Alsey Coleman Miller <alseycmiller@gmail.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20260804103854.429758-2-alseycmiller@gmail.com>
References: <20260804103854.429758-1-alseycmiller@gmail.com>
 <20260804103854.429758-2-alseycmiller@gmail.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <ba95158a77fe1fec33bd960d86151643@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785862209;
 bh=c2yDSfP7Acw3xLeaFJDNa6vZq+v+pLRjXjXSTplGH8M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nV6NE1E+wX+NG4pd8F2GuxRhxOw3FECPY4nQXow3UAgCYJhu4CkMUIiyfYxXdubgv
 OadqhcBkejqhtkPKY5cx0Ex1Mg5Iz1575C5vKlu/kIv8/Md6oRdM52lbz3+VefoMUM
 E3C2JZXlxLnT6CdhU90EJAe2Z8+A79ueo0vbw22vpECDbOAFPbMOTSFA4Lc1nr0K7U
 G9o2Sy+6j/4XBOQSw15bLPxNSwbqvoicY+nGoxBu65S5iiKg6/NnlOmF9pfpnWfKc7
 ce0ohp9bRTwF0e0k3nIsr6zCv+cOJciD2OyBSM0wIQkuDL42uFaMUVGDUka1XUaHqI
 2OaZMh2C9Eanw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=nV6NE1E+
Subject: Re: [Buildroot] [PATCH 1/2] package/liblc3: new package
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

On 04/08/2026 12:38, Alsey Coleman Miller wrote:
> liblc3 is the Google implementation of LC3, the mandatory codec of the
> Bluetooth LE Audio profiles. The PipeWire bluez5 plugin can use it to
> encode and decode LE Audio streams.
> 
> https://github.com/google/liblc3
> 
> Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
