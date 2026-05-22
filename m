Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BB0CD5BAC
	for <buildroot@archiver.kernel.org>; Fri, 22 May 2026 20:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40D946F764;
	Fri, 22 May 2026 20:04:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3YNBAKiwRpSS; Fri, 22 May 2026 20:04:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBBBB61C0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779480296;
	bh=fcu8BayfCcalTB39nhke52IMWRZLa17lXlXfloLZMic=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NcPq3krMTZHj8HiZWQKd2aalM561/GnNcoWEP36QAsAT06KV16A6M0URPickl+Jo9
	 pnNhUQSO4xBKmPxT49JtsT4kcnzEX91mIaU52WzGEm8jXNze8p1BDJSm7iwKEZGYC1
	 f9udcj2ImSheNtq+ykjxTZhPE4kFXkjkP1KMCViMWiJbxoxSwwmNtaFubh059Q0t8w
	 VDbhQ5VRe0ClkMkQ2WcAMaXck9U6gFhDla507HPp2E/CJXzkhrDl/CsptSQrBe5xZq
	 0Xqlt6Qf3PiZGjNnMoG5hJyp7TIU7Y0xjj+0dJ/3aLM9UsbxgDYTjyeVBTyeOwMfZg
	 lburRTrB/Po7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBBBB61C0B;
	Fri, 22 May 2026 20:04:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D549265
 for <buildroot@buildroot.org>; Fri, 22 May 2026 20:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62F7340085
 for <buildroot@buildroot.org>; Fri, 22 May 2026 20:04:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TtBenWYWDqFP for <buildroot@buildroot.org>;
 Fri, 22 May 2026 20:04:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B039841EAF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B039841EAF
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B039841EAF
 for <buildroot@buildroot.org>; Fri, 22 May 2026 20:04:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id C85AF19F57E;
 Fri, 22 May 2026 22:04:49 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 22 May 2026 22:04:49 +0200
MIME-Version: 1.0
Date: Fri, 22 May 2026 22:04:49 +0200
To: Andreas Ziegler <br025@umbiko.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260521052333.2780480-1-br025@umbiko.net>
References: <20260521052333.2780480-1-br025@umbiko.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <8751b89cbab51edbf676f5536e7388bf@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1779480290;
 bh=5GwIvH5MsFz/upOpDqAVJAbUBSO3bNwURTzlt3soeSY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=V6Po5V6h+PWR27pkmrdgDA5zW14xloNcv1aoJqReofYgF9/YrnzDEMbWg76UdRG2G
 4LnM4xA7rr+3EYTTrmHjAAIs+BM0JVP4XvA/QqKZjcq4i1gEazpmMBPAC82iCOK503
 TEaGL+2OlQt0bJWzZ/UJCwmso2iwi27TvvVbHbjY7dH1GM9vhU0ZAIeyU4CForGoFN
 Y6pmoPV0lpLMLhxHEIGzuogFO8+pTdDNqWpDYa5agpuZZSuiaQOCDDBT54C3KKXIQ+
 A/33PFh1GHrULyjFggTg5FlvKoww4ZQRPDz6YUJg7PGhCG5TtPtNYyfmHE0O5Dy9GO
 xUIlhV/wlsGrw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=V6Po5V6h
Subject: Re: [Buildroot] [PATCH 1/1] package/mpd: update version to 0.24.12
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

On 21/05/2026 07:23, Andreas Ziegler wrote:
> Bug fix of bug fix. Changes from version 0.24.10 -> 0.24.12:
> 
> * protocol
>   - fix path traversal bug
>   - allow empty URI in "lsinfo", "add" etc. (0.24.11 regression)
> * playlist: do not allow newlines in song URIs
> * input
>   - curl: require version 7.85.0
> * decoder
>   - pcm: fix stack buffer overflow
>   - sidplay: fall back to SIDLiteBuilder if ReSIDfpBuilder is 
> unavailable
> 
> Signed-off-by: Andreas Ziegler <br025@umbiko.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
