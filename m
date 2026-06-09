Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62A1CD8CA8
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 20:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8557885A05;
	Tue,  9 Jun 2026 20:51:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cHkS5TYqMGDu; Tue,  9 Jun 2026 20:51:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B373585A01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781038304;
	bh=iQtluimLN2pqzjIxE3xBL05STb1fJgL4rOCWnV+yiCU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=efCfmctE6YhUKZoy3V/v0RqmPYToWY5FisqS/450WgPX/42aK3vIbQOHi9kEWY+Wa
	 CI477QSCU5DEzLBW9tQcL/FNkO6jao6dNgo2asFOFMLXOuQLO0GPDotK8n6jCZsJoQ
	 1qdtXz9x6jUygDloiBSEm154u9q9AFb5HpmIgf28pQwXefAFt7vOyagtqk5kaNYYNd
	 qV9y4LUzYSEcb35c48yJLTvEFS+GiKmzUWPWQrttj9kJOYbsLv6WmE7tf43eMYUQ8P
	 2JDT7F8fzvS8Pr6RAyy4odHZX6sV0Hf7GCMJ0CiasKpaGZyd4Xniz3kzvVd7gnR3Pb
	 XFZsmgzpYmSPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B373585A01;
	Tue,  9 Jun 2026 20:51:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DFE08190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 20:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C560585A01
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 20:51:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qw3CPR8vLF3F for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 20:51:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 84A63859FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84A63859FB
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84A63859FB
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 20:51:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id BD48C780375;
 Tue,  9 Jun 2026 22:51:38 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 09 Jun 2026 22:51:38 +0200
MIME-Version: 1.0
Date: Tue, 09 Jun 2026 22:51:38 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260216071638.3456062-1-bernd@kuhls.net>
References: <20260216071638.3456062-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.16
Message-ID: <24863c0c50e75f0ac6c2c48826a1f25d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1781038299;
 bh=gScINfBRjhynNRcD4LmFm1A/i5TA0zQ65PTT57Z5Dn4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=j4UIoIhQ2eghz8UjTyf109Eae/HVHLUFk1zknWR7EI4z7GnGKyn1NHLjaeh+rG8h9
 lfurvNPNwBmlZiMW8zvdEodJdKs4x1NCFDnukLskZ6leh6dug/J6EOHlvJCKXsbcMJ
 BUXCfN63fqyxbzDaLkTNYzxZG+/BrZPBGdNISsTHft+4SuOL2/k9vU9nHTCjIFuTXR
 tuVt351m287sUqzVQXQEM8DSAT3xXG5y9/FlpkZ61FZAUyl7aXI19aMgxUZDvJpHz0
 YhH+tUOcqF9rESnqoZ2AiyD9Fu9VFo+ST48+w3FkGRaHbJf9Njb1N78BYG47mI8x6K
 JTMHE6kFkat8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=j4UIoIhQ
Subject: Re: [Buildroot] [PATCH 1/1] package/libtool: bump version to 2.5.4
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

On 16/02/2026 08:16, Bernd Kuhls wrote:
> Updated license hashes due to address changes.
> 
> Disable help2man to fix build error which would be introduced by this
> bump.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master.

Since libtool can be a tricky package, I was waiting to apply it at
the beginning of a new release cycle, to give the maximum time to
catch any issues.

Thanks!

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
