Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C1ECAC5B8
	for <buildroot@archiver.kernel.org>; Fri, 26 Sep 2025 19:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B362040F85;
	Fri, 26 Sep 2025 19:41:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qVpO36Guyunv; Fri, 26 Sep 2025 19:41:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3B514110B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3B514110B;
	Fri, 26 Sep 2025 19:41:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C189A12D
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 19:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3F8384D6D
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 19:41:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h_kDdye6VGRE for <buildroot@buildroot.org>;
 Fri, 26 Sep 2025 19:41:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C5FB884D4D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5FB884D4D
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C5FB884D4D
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 19:41:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id CCD1F2003CE;
 Fri, 26 Sep 2025 21:41:06 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 26 Sep 2025 21:41:06 +0200
MIME-Version: 1.0
Date: Fri, 26 Sep 2025 21:41:06 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250926174505.184011-1-thomas.perale@mind.be>
References: <20250926174505.184011-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <a110c9cdae0fabcc34aa39e1ee8efef1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758915667;
 bh=TSjfm6vQqPoAEm8xMNAdhK8wuCCC3criVP2n0IIds+I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=I39oxXFpZLFeS3j/Bkx7Q6earfZvYQaQUvkP8MATg9AoLK1EFNQ5DzsiTY42r6/6r
 nvDfj0ZkWw7o+JSSDXAVANvZUApZulOBFiMC7Pl6qJ764NEhpag4+su++4H7G8dg1g
 fStSj+Td2kC8FVx4bo+tNMEnWpFbtIVcS3ppHKvyXBcOtUtd9YqsWAFf3oPsY+82Kk
 nT3duzGaDD4C/Xvg68+Cl/R3zrpsUAcKNZA0wXz7JW/opBNK4qlvVTqaZOx9a373GW
 nH6/T9YMAVyB7p+HnqLK7ifGMufsOm8gTw+VcBi/RFJnGrSVZxflEsVv/QRsCcGy6y
 sqDM4Vo3CQfaQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=I39oxXFp
Subject: Re: [Buildroot] [PATCH] package/libssh: security bump to v0.11.3
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

On 26/09/2025 19:45, Thomas Perale via buildroot wrote:
> For more details on the version bump, see:
>  - 
> https://git.libssh.org/projects/libssh.git/commit/?h=stable-0.11&id=301d0e16dfa8a5cac1cff956b6880ca90eb82864
> 
> Fixes the following vulnerabilities:
> 
> - CVE-2025-8114
> 
>     A flaw was found in libssh, a library that implements the SSH
>     protocol. When calculating the session ID during the key exchange
>     (KEX) process, an allocation failure in cryptographic functions may
>     lead to a NULL pointer dereference. This issue can cause the client
>     or server to crash.
> 
> For more information, see:
>  - https://nvd.nist.gov//vuln/detail/CVE-2025-8114
>  - https://www.libssh.org/security/advisories/CVE-2025-8114.txt
>  - 
> https://git.libssh.org/projects/libssh.git/commit/?h=stable-0.11&id=65f363c9e3a22b90af7f74b5c439a133b1047379
> 
> - CVE-2025-8277
> 
>     A flaw was found in libssh's handling of key exchange (KEX)
>     processes when a client repeatedly sends incorrect KEX guesses. The
>     library fails to free memory during these rekey operations, which
>     can gradually exhaust system memory. This issue can lead to crashes
>     on the client side, particularly when using libgcrypt, which 
> impacts
>     application stability and availability.
> 
> For more infromation, see:
>  - 
> https://git.libssh.org/projects/libssh.git/commit/?h=stable-0.11&id=87db2659ec608a977a63eea529f17b9168388d73
>  - 
> https://git.libssh.org/projects/libssh.git/commit/?h=stable-0.11&id=266174a6d36687b65cf90174f06af90b8b27c65f
>  - 
> https://git.libssh.org/projects/libssh.git/commit/?h=stable-0.11&id=8e4d67aa9eda455bfad9ac610e54b7a548d0aa08
>  - 
> https://git.libssh.org/projects/libssh.git/commit/?h=stable-0.11&id=1c763e29d138db87665e98983f468d2dd0f286c1
> 
> The v0.11.2 already had a fixed for CVE-2025-5318 but the NVD reference
> mentionned wrongly the version 0.11.2.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
