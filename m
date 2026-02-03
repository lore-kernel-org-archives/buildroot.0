Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743E9E8B365
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 21:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40FCF60A4B;
	Tue,  3 Feb 2026 21:27:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WevrwZltRa0z; Tue,  3 Feb 2026 21:27:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 505AC60A42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770154033;
	bh=eyGLUJxJzw8lA65HgcG1VzwE64+xPFLCc/hycinzjyI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PktUz7jxrSMWj5EjObiu8431eSuhQPoOTg1G9s6UUyF6gkTyYV/MhTD0liTrp8vav
	 ++OSP8yZ41XSY64kxnJC+h/RGeUebhoVduxkZZ8ca+PzgtaPJK9U2M7kWeMjCckOCh
	 QSQTKYRr/hfx3opP8weMWwdkYsyLMwR87MJTQX2eNOJxxaT3myhUo+Gyw/ILpcTM6K
	 KpOzM+DpZL6wEO9V92O4nLQtRvIunVsW9UY+ffe5WlEY+TOqHXCOCwRdp5mWiRI/VP
	 D1es9+3yu3EBFTTnsI9M3FmwQTEfdwXmZWx+G1q4/Q6qmL8eyyQbAmeJTEHFlkgps4
	 X3TTyoOz/34Pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 505AC60A42;
	Tue,  3 Feb 2026 21:27:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7837AF5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63D8883E5F
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:27:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A01ChmZMUlSc for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 21:27:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9E92783E5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E92783E5C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9E92783E5C
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:27:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 5BBB65FFBA;
 Tue,  3 Feb 2026 22:27:06 +0100 (CET)
Received: from 77.109.103.251.adsl.dyn.edpnet.net ([77.109.103.251:65185])
 via 77.109.103.251.adsl.dyn.edpnet.net ([77.109.103.251])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 03 Feb 2026 22:27:06 +0100
MIME-Version: 1.0
Date: Tue, 03 Feb 2026 22:27:06 +0100
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org, vjardin@free.fr
In-Reply-To: <20251222215636.975668-4-maxime@leroys.fr>
References: <20251222215636.975668-1-maxime@leroys.fr>
 <20251222215636.975668-4-maxime@leroys.fr>
User-Agent: Webmail Free/1.6.12
Message-ID: <d2470f7ba452b2d266d91f363eaf6ea2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770154028;
 bh=X1HIcRvgTv1qqAy4Rn0WpTahisMqe8JojWRzrGu8XWY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=S7X/j0vCLiP+02fFE3lXaLLQNGDgwShS2AdVQDdBRF2i2NVOqvcdsVMePgA38jB3e
 ow+ef2T33Bm5mABe++KXtPoQx64x38Q1OOxZz0M/sQ6Xw0MrC109zU1uxqZUXPLDEk
 UpfIwltR42mF4q6MEjnYgMS7TcUF0Y4K5DAnGBDs0bRvvq5KJkPa99EJgSa0ZZ4TOm
 vdIgM+T6t41NnnD/8SHSJIG44raIY+P44JhjAwh8f29zxC8SQud4nAA54nI/GZPmwV
 +TWyoHenZlC0q/kSqVKvRAFSer6vwmZ5cjzT3AYisrRXUJer8fC4ko1P5pnh93ubtd
 h+KzL7cnL1bew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=S7X/j0vC
Subject: Re: [Buildroot] [PATCH 3/7] package/dpdk: make apps selectable
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

On 22/12/2025 22:56, Maxime Leroy wrote:
> Add BR2_PACKAGE_DPDK_APPS_LIST to control which DPDK applications are
> built:
>   - empty : use DPDK defaults
>   - none  : disable all apps (-Ddisable_apps='*')
>   - list  : pass to -Denable_apps= (comma-separated)
> 
> Signed-off-by: Maxime Leroy <maxime@leroys.fr>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
