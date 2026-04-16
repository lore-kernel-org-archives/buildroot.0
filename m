Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FB8F8D774
	for <buildroot@archiver.kernel.org>; Thu, 16 Apr 2026 19:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7517340ABB;
	Thu, 16 Apr 2026 19:34:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sriB00AflL4A; Thu, 16 Apr 2026 19:34:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C29840AB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776368050;
	bh=Hb76q8w8YB5wY/31pOx5GVjT7+1rQyrrm3JnjsJF5Sc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nfW8O7YtRk2AtYKdBX/cWxd5FgplUMgP/YkAUc832txPL3hcNUXJGjgH3cOPSWyG4
	 JUbZ3/esZFF3d1nqvg3PydhJHHzEJHzZ7W9+Bf1a7PgliNSN+3fqvjSAF88tHNMXFS
	 wXppTx88AedsKW2ZNvna06p4mWgcan79BUN5gav3EhVi9bOMDw5XoSb6oLBIM89xuh
	 7vJY/dfHKa2JgCr5L459QZ4f1K3CPc5MsJticBNY14qzatJkWYjb1IDfE/DnSLPff/
	 izFWnnITDckqgghCZ1NWL9ZEGzv8M/4CYTuvhPBa+kx+qdO2Ww9klAoGqohNQsujRW
	 SuOWLqG3DWsMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C29840AB1;
	Thu, 16 Apr 2026 19:34:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 427C7259
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 19:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2801B80FF4
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 19:34:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hdK6iWh13H55 for <buildroot@buildroot.org>;
 Thu, 16 Apr 2026 19:34:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 20AE180FF3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20AE180FF3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 20AE180FF3
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 19:34:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id CF97313F89A;
 Thu, 16 Apr 2026 21:34:03 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 16 Apr 2026 21:34:03 +0200
MIME-Version: 1.0
Date: Thu, 16 Apr 2026 21:34:03 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>
In-Reply-To: <20260416073657.3605628-1-bernd@kuhls.net>
References: <20260416073657.3605628-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <9254d97d1fb01a3e21d2a0f5e009d290@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776368046;
 bh=YTY0tSVuPAnyZvPEuylD6uREdShJkwCdMxWjXbQcPQM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=i0xnB53gOSal/CERPlogAyqqb9jO8mfO8dgT9Ao01JhC004U1kZ/z9PaYSfeOQLGT
 PKSbw2+frU5zTEkP9jj7NFUX6jNM277LZ728yM1YZu0Y9hfbfpIp5vQzK/wOok2yju
 A5/HVxKMaoe5KxLZcw4fmQhRWgir2P5NidYnR9PJB16QziLCM/nqFoXZjx4Rirny0C
 8k9H3dXKOGAt+kny7SgclFbjGpSSDqbLLyNxe1d+3fsUZcvCrjz1tTb48s9PauyIcR
 vCsuIa44ex41H3subi+7I20FtlfnDRhEzylj4Oyv/JVh60KRK0M8aKJWCbSebct6A2
 BZEtaWgccaipw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=i0xnB53g
Subject: Re: [Buildroot] [PATCH 1/1] package/libarchive: security bump
 version to 3.8.7
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

On 16/04/2026 09:36, Bernd Kuhls wrote:
> https://github.com/libarchive/libarchive/releases/tag/v3.8.7
> "Libarchive 3.8.7 is a security and bugfix release."
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
