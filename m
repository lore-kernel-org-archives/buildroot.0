Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C91D1D492
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 20:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCFE782948;
	Thu,  8 Jan 2026 20:23:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mp6Iz1EAA9jD; Thu,  8 Jan 2026 20:23:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F319828A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767903780;
	bh=3mfKiZu8THwe5Vf+zmswIfgggxzJEl/vIS765C9T/SI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TaIHqcRRrG4gkB60hrZPKxOF1FXTEOxrK9vdNxW4E3JDigZk96nal0BiwNwDTYpQi
	 ISDgGEgUkDyQO4mCJ2oOXSqc287pdjHs9D5E6BWktxLWN+5suP4GGec0quTAeLkKxL
	 2GYge3rsFwafjsiYwRy3SeYqS4UxDYq6F85WhUDl0PvUwZJdYXFcRsUsVjrqFTHZmf
	 DFoF7PD/Q2LdYz8vgKdtrYAuhxxCKyoA8dqYYlplFJwTO8ufIbJ6TtLDpwcQ6DyXym
	 bgnXRxURProNo9ojzwVfaZVAjR7QqeM88DSUaCgRButXdL0XTqepFj20I+GTR5/cO2
	 Mk/nqSFGgbWnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F319828A9;
	Thu,  8 Jan 2026 20:23:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 57398308
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 20:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5548A40ACD
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 20:22:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tm3bukN_RLIH for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 20:22:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A088440ABE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A088440ABE
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A088440ABE
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 20:22:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 0448613F879;
 Thu,  8 Jan 2026 21:22:54 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 08 Jan 2026 21:22:54 +0100
MIME-Version: 1.0
Date: Thu, 08 Jan 2026 21:22:54 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260108194233.3499269-1-bernd@kuhls.net>
References: <20260108194233.3499269-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <acfe328b5757f05d557d78df390cbede@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767903776;
 bh=nIAs7FBBIRuL8V3GwS/R1EIxuRzGJs1gSdVaTaXDCK0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fvDyuR2HT/a84JUh/UEpA6i8M/IGPLo1Hrj46in+FoO+NY4lp7BuZWQH9AFJgkKuL
 lldnlou0o4q199JyhZtxKAjs0FpkRvwk6Q4qSEV8u5o+4EAtzj5DUYaDszim4Ie63G
 ozzm1sU2YO5+ej5TKuk7i62QSzUbe0eLLAZ2JL+XZRpTkuMyAWQCSAc8xq/lR6Y/rv
 XShgeSN/qvSPfc5L58Xh3SfjQhCHo65jnrh5uS00ACRsVzAIFSwitZgqsgnrQNKjBs
 T0dG4Wjv/nYDb3mNfhNwFhVaDRp3xn5fb1etvWMhfb2kjCro0l5/LQPTWK64rIvnuM
 s6NKfuHAzg4ag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fvDyuR2H
Subject: Re: [Buildroot] [PATCH 1/2] {linux, linux-headers}: bump 6.{12,
 18}.x series
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

On 08/01/2026 20:42, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

I applied this patch only on master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
