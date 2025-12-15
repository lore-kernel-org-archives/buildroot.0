Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467AAD5B86D
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 21:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5214460F1E;
	Mon, 15 Dec 2025 21:44:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jyEjPO6FDusQ; Mon, 15 Dec 2025 21:44:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEE4060EF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765835070;
	bh=La5D8BqOnXRB+lFC8ycuPkoH3XPw55sBN976raDmS0Q=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rJnt7ecv59wZslhA6pUuw1bZAadWTrVGxRqLnx07nLUrns2k6rVciKs8jssor8BoF
	 oAN02JMZkcDJFsp05L3CZwN8Y0cL7wmsod3M861rp9woM0kFEjthTwxN1EcaIy9YD3
	 Llybbs9cgLw2MesV3T1sn3c8ZiPacCxjwAaVVGx3nF7O/4GBMs3Nbynk1c6hqrgYzH
	 sUittCr+HhZ4usSgfDphP0nRb5hAfofCP57+ulHMYeO5uhK/kS4NQPgo6vb02Zg+kV
	 f3rY7owF7iIBBpDulY4YbfJwl4r/fqmtKJe0Ecx2SIiYKGpdFWsuOjnE6EVjD9yVhv
	 1GMxLt2PgqicQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEE4060EF8;
	Mon, 15 Dec 2025 21:44:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FE02117
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65E528086A
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:44:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pYUxP_D-wwnq for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 21:44:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0C98D8084D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C98D8084D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C98D8084D
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:44:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 430DD13F86A;
 Mon, 15 Dec 2025 22:44:24 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 15 Dec 2025 22:44:24 +0100
MIME-Version: 1.0
Date: Mon, 15 Dec 2025 22:44:24 +0100
To: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20251215120941.3466860-1-pkerbrat@free.fr>
References: <20251215120941.3466860-1-pkerbrat@free.fr>
User-Agent: Webmail Free/1.6.12
Message-ID: <a13e3e1bac77765c0428e0eb779b9c4f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765835065;
 bh=oC0uplnfseuvftqijZkJ09aVJtx2Yilo4whbczJfXTQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=m93F5MAgMSr8LSuSx6qfmZ7KXN/er7Z0RzZj/PMHMXgB8ICHqvliR7KpwskD2+kGK
 aRqZaMTgsqmzLGsNrjbSshOIYLHzngb13wssTRCF60j3A4zTgm/SiWWKZe5TaLiiQ5
 lipXA6rM+4YHjBZ9hkEIpbdvdHg/f6d2BnBHqOrrszmYkzXGvqYfUD27lyKIqdQBWn
 QcRJ+AXe8AtoZAIdOp5a/EDWZ1hH05fup676BZrAW6507tJ+HCUCegYv9cr2k3mSpk
 GzcMPK5DDSQLnqGD8Xht2bt2gfDYYDNcvAbRV1tGKN4b3Dn4nw70gGQclKOkJzOI/y
 3lgphlnAnYBqg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=m93F5MAg
Subject: Re: [Buildroot] [PATCH 1/1] package/dos2unix: bump package to
 version 7.5.3
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

On 15/12/2025 13:09, Pierre-Yves Kerbrat via buildroot wrote:
> COPYING.txt hash updated caused by this commit (updated year)
> https://sourceforge.net/p/dos2unix/dos2unix/ci/8379cf345bde0267398f0753173f926dbebf1636/tree/dos2unix/COPYING.txt
> 
> Changelog:
> https://waterlan.home.xs4all.nl/dos2unix/ChangeLog.txt
> 
> Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
