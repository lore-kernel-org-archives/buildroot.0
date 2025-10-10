Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF24CCA476
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 11:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A25E0833CA;
	Fri, 10 Oct 2025 11:42:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lntH7HIPUQmp; Fri, 10 Oct 2025 11:42:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C080F837C9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C080F837C9;
	Fri, 10 Oct 2025 11:42:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C4F5119
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 11:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 130D8837C9
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 11:42:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CrDMkJmdJ1DK for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 11:42:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BD42883B8A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD42883B8A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD42883B8A
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 11:42:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id BB7C72003DA;
 Fri, 10 Oct 2025 13:42:44 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 10 Oct 2025 13:42:44 +0200
MIME-Version: 1.0
Date: Fri, 10 Oct 2025 13:42:44 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251007210514.3784984-1-bernd@kuhls.net>
References: <20251007210514.3784984-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <1ea3cab2084913f6a95d9192e16f48f9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760096565;
 bh=0zW9y190OOHpX9TgnBA0I77LLaimlH9VPanVUyHYq34=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gIO6b5wnAGAmUcHitfuybVQWW5H+MZrP1bu5F65c/uW7WzIPbEirfxRtGO40VoQ42
 32wAIuO+IV9X0RAKD2Jry0cOTx+B5oZ7prEHP10Zyw0pGZoZvy3tlf1LumRxUjtoXV
 N5c1kiDYqYAOmy4qAM8Q2jgtZQiifagZiQ4y9XQsOWUEPAdCoEyj8wIz4YvR5a3GrZ
 hoAQ3PdJ7ciKR511tPuCBxohAvogEePhCPyU7fl5sUhxN5kZr/PD9Gem/wsG/61B3g
 8xxdbRfj5/XcPK20DGGimOOqfR7aNHyIKAugsrGmPEok40yQnCCHPMQVwZdMGthl6t
 QurnLf+VqRXSw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gIO6b5wn
Subject: Re: [Buildroot] [PATCH 1/1] package/libcurl: fix configure options
 for GnuTLS
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

On 07/10/2025 23:05, Bernd Kuhls wrote:
> Buildroot commit fb5fb06ee5a886df5036c5c5e6c4536f2bc8e1c1 bumped 
> libcurl
> to 8.16.0 which includes commit
> https://github.com/curl/curl/commit/2f6524ce3c3a8231c62d1e0c8af509fe5b0228a0
> to limit the use of the configure option --with-ca-fallback to OpenSSL
> causing build errors with GnuTLS:
> 
> configure: error: --with-ca-fallback only works with OpenSSL
> 
> Fixes: 
> https://autobuild.buildroot.net/results/64f/64fad87dddecda1e8ff6b0a9abc0b827b5136e4f/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
