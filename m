Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E19C9D6CFA5
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 20:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86AE440A1B;
	Thu, 22 Jan 2026 20:32:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IvHKiR5KQIFl; Thu, 22 Jan 2026 20:32:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CC8540A18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769113937;
	bh=qmldZt6FF8zdhvFyFp/JivPwbejCwG2lu0kV2/vwp9M=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZmeHKhTe8Xd8DC9tgVf2U3Emerd2uvmew2ory4klr7Ajlz3NBXnoaJWcopDxctCi+
	 4VfA6yPLyf28lAksDPKEYBieP5EMFz5uXM/6MrjiMyrNpRI/CDAw+5XTOrJJkbnk8x
	 zHAgIwyT4mQucM6IGB2VCjaSC5vqTtJZKqB/aIdCbvNdqPfcZU+wi1E8M0dCFH5k03
	 fTEjI5X6NoivsCkujiCehH1pvlgMV36hT/d7L9XEQ7UzJRtNewlp5QRs+PoATN+zfz
	 q1WJaYpAetMjaJ85CXk2xUTf0b84qX1wOtk/0LIh45/fZzmM+gWfj9tre3opPRA57u
	 pIapWhMITvolQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CC8540A18;
	Thu, 22 Jan 2026 20:32:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8044D158
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 20:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A32D826E5
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 20:32:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MM6Ax3P5NSTG for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 20:32:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7FEAE826DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FEAE826DE
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7FEAE826DE
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 20:32:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id C50DB78035E;
 Thu, 22 Jan 2026 21:32:11 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 22 Jan 2026 21:32:11 +0100
MIME-Version: 1.0
Date: Thu, 22 Jan 2026 21:32:11 +0100
To: Norbert Lange <nolange79@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260121084049.3613479-1-nolange79@gmail.com>
References: <20260121084049.3613479-1-nolange79@gmail.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <660e39fb4e232378f36e861bcc89815d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769113932;
 bh=b7itLNtvhWbKJAdD+0zdRrv4nQ8eWveGcSmR3kCNMGg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cMowisKKnV0skfpdug//XDuu9dFeEXfsjJxmKFBvtc929qqbb8vwCNBRzcZAV3q3H
 lEtHHoyFKVL9DBXyppGmVrfy5dhPaPY+EhuhIz5J9PoBxfSxUDzK8vQwnjxnB4h2jA
 blL6weHf7epiFEzYshX5X6HEMbsIeHrmQVeP4ULXiHOYiRnb3g52JFvLKFuwUXvajm
 oVCKQOHr7jZgTyFC/rq2MepD5FXFpNpKBTQOUwNfSSfVt0agxWuEv+hq0JOSAErywC
 4uKB+X2WLhhretNxPclZbvW/SGb5tESrHfZII3x8dzg85Prn4xbVfGDEmaCDHt7ouA
 HoUACSDz2+AAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cMowisKK
Subject: Re: [Buildroot] [PATCH 1/1] package/dbus-broker: bump version to 37
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

On 21/01/2026 09:40, Norbert Lange wrote:
> https://github.com/bus1/dbus-broker/releases/tag/v37
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
