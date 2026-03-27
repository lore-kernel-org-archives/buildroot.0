Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEFC10F2865
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 20:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13C63822E3;
	Fri, 27 Mar 2026 20:26:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n36m3fsoPB0U; Fri, 27 Mar 2026 20:26:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9155081EC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774643179;
	bh=Rw+ZvW1xVOnSUb+U5TkkNe7SGD9jyDDChbQYPDW39kI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lTNGIhVgvAx4w+Amaje6k51T7LeZyFOhsazSJlhaB6G06WAgRnTVLj6vZ4oBXO/VK
	 kp425msWdEYEDoyqNclqmvrviPZMAenDNT36q2P3NQcCSs1wBWaZpsfIJgvEDdUxlA
	 NOhw+Mziutg205w4Wo51BiXDa1o/wnJm1Er/R3qp6AMpPoaknbg2E3VQpQnJ2ItjB2
	 C+T/odtk2FpV/bJS2hlwM9TG2PVi1MTpz48wKBPuMrq4tQgcITqx4pY8LqwCC7b3Zh
	 V5rfpJ0axgxdJlahg+ERinHx5Jksuqh/L+OSwZ74I3MXguaLIidH2YhiUG1TnQF84R
	 tQ2CmcSaxg51A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9155081EC6;
	Fri, 27 Mar 2026 20:26:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C6D91D3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 20:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12B9681EC6
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 20:26:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AoxD140H_udu for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 20:26:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3B13281E5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B13281E5C
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B13281E5C
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 20:26:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 7E20078035E;
 Fri, 27 Mar 2026 21:26:13 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Mar 2026 21:26:13 +0100
MIME-Version: 1.0
Date: Fri, 27 Mar 2026 21:26:13 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260326211501.3598657-1-bernd@kuhls.net>
References: <20260326211501.3598657-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <ca02f58132d7599e2ac24d8d2647ebd6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774643174;
 bh=t3q3ApD4U0MngDp2BK5w715zsX40cq99b17zSiroAiw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Z27XMPaJvHocagrJZsnbypwiXg4S/VeUOEFG2gAUn/EHP9c1yjSU60Q25sVGVJvNs
 S7P+L8EuChC/NCyilqCX+hEC7+GyJDRVMvTzPk44OiTy0NRVGOLnKkiLWGsK03p2T6
 Sw42xZ6NeMOSr7Pg/M9f2lB9s3zU3Yoo/9GrSdELfWn1OPCDk2cm2KIgRLaciYKwcL
 sHlVbvg53o0A/3/r2Ac48qzyfb8SRR3Ic0PcHlFe8wUBdVjHo2N1eHVqks9cfpCc5s
 3DPQDJU/fcfR39CFxORGIYsjFuuVUWhHNLiviAbvQHcJJKZrC+vBaabC8tLWGMSsIM
 /65lJ/xJOmnuQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Z27XMPaJ
Subject: Re: [Buildroot] [PATCH 1/1] package/ccache: bump version to 4.13.2
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

On 26/03/2026 22:15, Bernd Kuhls wrote:
> https://ccache.dev/releasenotes.html#_ccache_4_13_2
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
