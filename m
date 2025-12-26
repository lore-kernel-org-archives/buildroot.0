Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB35E8FDB5
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 20:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 782D1407C3;
	Fri, 26 Dec 2025 20:48:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E1fpVTyendta; Fri, 26 Dec 2025 20:48:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA84840785
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766782125;
	bh=yNUNDFvorJIqrwgkZeLXZn4HSWqhXueUgRycxJTm2mE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OxMSCUVf3yfJuVlP3D0xN/Kr3N2S8yjJ+JZF8/hsYISzLL8/5ff2cXb7QCFPsjEeo
	 l+TzEEqpYwZgsdvpTo2SdNVXEgOC4F35XYAzt5fXNkN8WplU2tcnzN3tMnNnnqcpYz
	 tQO0mZpSf1EmrcgbqR0rbfcjw6xXshjAIrgZ+Hjgfc208LX0TfjsY37FZAOX2fFG+S
	 puZRAYW+ccDkpyT9SmTNzU8Lgf5ttReUskQLCwDEFDB2nIt5KjlhB1dCSqVw+cSwy2
	 lHvS0IOf+JVcOwXMjOo3hKqmV0/WIlWfNn7FL6kss8xHzRoAFKrB4IZT65uKtbw69+
	 XCis3IjLorFLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA84840785;
	Fri, 26 Dec 2025 20:48:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id ECA96EC
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2F0540785
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:48:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FIfWOWE7ooef for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 20:48:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E7AA14076F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7AA14076F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E7AA14076F
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:48:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 04F5B5FFAA;
 Fri, 26 Dec 2025 21:48:39 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 26 Dec 2025 21:48:39 +0100
MIME-Version: 1.0
Date: Fri, 26 Dec 2025 21:48:39 +0100
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20251222125423.85289-1-buildroot@bubu1.eu>
References: <20251222125423.85289-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.12
Message-ID: <1d31d66a8c7011f56e05f01069db3e9d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766782122;
 bh=htm64qohUEMtE1FJtpnUUgVXOJRHc8lpww/yWB4My7U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MVQ9QuWa/CuEgcn2AIBlxHwTyY36y21Bc1xYZtbBxFEM4DMl4dX9qurQZ32Me4smU
 lA/2sFJj+l09gb9Ahz+oZeiPRXVq12ZNJuQD/fzhZBnRfIjJ1hHBhVCAKO/Nn4mQGZ
 FNiCjRFZM9IKhGjkmTNYwOIhJmtjx9yG1A8HstOSaaZR/8rSup2jH1iagu+wniqWCP
 wU2DgdlfYutWm1PE2vsO6owcwAzQtW+t9d3JooTSMDv5Yl/mLZxG6Tx7eHiW8ytDGV
 YI5bJd7t9AE5d58tUZJ3HcqdOwjxnmt75QOPbO45ckrQVMZfph9PAyFprATXNAhVBQ
 5RpcNDtVQXEjA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=MVQ9QuWa
Subject: Re: [Buildroot] [PATCH] package/python-sqlparse: bump to 0.5.5
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

On 22/12/2025 13:54, Marcus Hoffmann via buildroot wrote:
> Changes:
> https://sqlparse.readthedocs.io/en/latest/changes.html#release-0-5-5-dec-19-2025
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
