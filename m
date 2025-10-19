Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCEECCD184
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 10:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63AC882284;
	Sun, 19 Oct 2025 10:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rm88HfF092Hk; Sun, 19 Oct 2025 10:24:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEA87821BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEA87821BB;
	Sun, 19 Oct 2025 10:24:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D68D51CD
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 10:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C871B6110D
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 10:24:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rWlq88zRt3zU for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 10:24:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 66CDC61108
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66CDC61108
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 66CDC61108
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 10:24:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 2CEAE780331;
 Sun, 19 Oct 2025 12:24:37 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Oct 2025 12:24:37 +0200
MIME-Version: 1.0
Date: Sun, 19 Oct 2025 12:24:37 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251012213032.3512805-1-bernd@kuhls.net>
References: <20251012213032.3512805-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <ba5b5e2c09c275cb77d4b03120cf7cc4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760869478;
 bh=adea30J0tkvErA5vkVb+AxjsQelSF/me8hcQ6yAMmgc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Os+WNOkldkryNvn6dRqOnTo03nmp1UKkx3Fmpayl5vAG2fu6PY/49YFopMWxXfp3f
 zOnt0iNmuWWbWgAsDT0Tmghi5t2GeYmdiIU2VeUf7TCs71Ki6d4aftCbKuUL5Z7O7a
 YZH/4MPHQF7TeL0hdFxjedfXvFIBsri3QYhRzNQ78eDjh9e/lxCnuCheJhFTWae8vl
 ZpeMqVhbPv6GWYiGlnvoCWMIvDEEyVrlnyePkRgtY4xQg36LG/rEB5Qq0l2dQb1byk
 JW4P+Bem83sbjvCeJKLICc8j/dXyTWf/nsQOmV65+35SfBD0xefE24FVZAn6yuGX7m
 YxsvsEmevNtZg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Os+WNOkl
Subject: Re: [Buildroot] [PATCH 1/1] package/spirv-{headers,
 tools}: bump to version 1.4.328.1
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

On 12/10/2025 23:30, Bernd Kuhls wrote:
> Updated spirv-headers license hash due to upstream commit:
> https://github.com/KhronosGroup/SPIRV-Headers/commit/e87f5a873192cdfddc94aea0a4dbd63059b0773c
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
