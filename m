Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50312CD3439
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1785E4100F;
	Wed,  6 May 2026 22:17:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a1DQOiyeaOLE; Wed,  6 May 2026 22:17:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47A4C40FB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778105873;
	bh=1ZzkiokSazSOfl5gmOFnaSKi9IWSwcSY1LnG58yTdrQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KYVW6bgJtr6NrMevFMD2tMylvDt7cUx2UNYe1CvV2aumHeYaKRpOBcQzvt9I82LDv
	 trmXWcPLKdmnxhrf8tpeI9vN20MK6YKhGMnGzrOuCCFmfV+OwfslySFEWTGipik9Jp
	 GWa/Ie20Y62VFC5d33P4hbGnlqqt5EHfA3d+l6UD2HYK3+qVEe29e5Ow0rA3rG/j+V
	 8CnDkcJro1hUrdMY2O8T6uwHhezw2XW3rhrPIWS8MDYEjx7Am86IpQDl39Epq3KP1D
	 sJOU7pCG03Jv90xy2TN5orKK5ceQVtPc8na7OSWYbWh2dtx9wUdEy0unVyIWLeXYMu
	 9O8mVu4KQvyGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47A4C40FB8;
	Wed,  6 May 2026 22:17:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 03F05317
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDA5640209
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:17:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nGwKrx_mdMDN for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:17:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ECEAE400EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECEAE400EC
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ECEAE400EC
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:17:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 08586B00571;
 Thu,  7 May 2026 00:17:45 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 07 May 2026 00:17:45 +0200
MIME-Version: 1.0
Date: Thu, 07 May 2026 00:17:45 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Daniel Lang <dalang@gmx.at>
In-Reply-To: <20260506164132.1336919-1-bernd@kuhls.net>
References: <20260506164132.1336919-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <7ff2e6119750042ee038fbe7bef0aae7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778105868;
 bh=E2acsTEXqMqyOEX4YBfReNxN2NbczxqJtOZyyERmZa8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=S60IU4RI0VVduznGPLa4OPGxy5/nbyN5hJ0h9XMUXDVwSoEPeQLDub4iONXz3lnJm
 zqHuEK1GnR7x06Qt5AwDCB6vT3bf2z3nK4Tq6vR7qlvpOmXrglhZI+iiRRVd/TXdQ4
 81zT+ml38WuoX4LUPglH3WaabSmlliHH9ipTP2EtZ7UW7lNvQ03OcjX9lJ2xzfg8bM
 6tedWCmZDUGbRWJzN59RpWM4uZWpFlASqzgOtFkmMHExghi+khrEykzZXvx41wXSvF
 gJoSZTbqQLB4WMLX5H5KyM2cyUKJDQz+5siarD9ktSwMp6JVHwUQ1opkPqtAZpkxth
 BBBhmIkoC8ogA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=S60IU4RI
Subject: Re: [Buildroot] [PATCH 1/1] package/llvm-project: bump version to
 22.1.5
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

On 06/05/2026 18:41, Bernd Kuhls wrote:
> https://discourse.llvm.org/t/llvm-22-1-5-released/90734
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
