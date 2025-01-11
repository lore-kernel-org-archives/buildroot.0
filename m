Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1428BE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 17:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB07240F48;
	Sat, 11 Jan 2025 17:56:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hQYw92WsR9KI; Sat, 11 Jan 2025 17:56:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C31B3410C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C31B3410C3;
	Sat, 11 Jan 2025 17:56:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8117B940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6269A83AF1
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:56:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vgnxFwrOn_jv for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 17:56:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 866D583A74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 866D583A74
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 866D583A74
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:56:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id C233819F5C3;
 Sat, 11 Jan 2025 18:56:25 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:44356])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 18:56:25 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 18:56:25 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Nasser Afshin <afshin.nasser@gmail.com>
In-Reply-To: <20250111153153.2845643-1-james.hilliard1@gmail.com>
References: <20250111153153.2845643-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <4f9db94ecd10038090e2ed447ff33fa6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736618188;
 bh=LBIIamXI0qvs2zIvJAbX/to2kD6M+Jn0Hs29D/I+U5w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YVYMz0yne+nH1bzTw7AbFzT+L+DZNO6slPUrNF43LfypdL7+dJ4ghnPeKcuEpD84K
 eKr+VP63etzY5yvk+rQE5ckLfbebTeF/dxzdyJz6eDCaJjJD5oQua55tj+ib0+Dk8X
 FTBFzes5Qkx5ZgEe9Wq9CCP78LYxmqxjSEhaM9zedZtmvsQFArjTvEAgldYjAOK/sk
 6CAWiugaxPBsPc/SxpWCte8HxWGFb4E89RRcWu8eNh2WprObAAnPZZqESY575QdxtO
 q6MYg45bCXaPPx4JAM3EKCvRY6sI74ShsgpGiqY0saBIFxhyfvf4RG3I3sPqU5fUX2
 8k0g9JEzDYtHg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=YVYMz0yn
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pycrate: bump to version
 0.7.8
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 11/01/2025 16:31, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
