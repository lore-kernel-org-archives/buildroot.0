Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFEDCA0FF0
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 20:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02B5F41249;
	Fri, 29 Aug 2025 20:47:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F_iGcfGa8Xcu; Fri, 29 Aug 2025 20:47:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3845C40123
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3845C40123;
	Fri, 29 Aug 2025 20:47:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B58FFA
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 20:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4897740123
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 20:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LPcWgPyWxes5 for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 20:47:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BBCCC4007F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBCCC4007F
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BBCCC4007F
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 20:47:43 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id DA0DD35207B0; Fri, 29 Aug 2025 22:47:39 +0200 (CEST)
Date: Fri, 29 Aug 2025 22:47:39 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <aLIR6yJyANhTHgfj@waldemar-brodkorb.de>
References: <20250829170522.2436314-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250829170522.2436314-1-thomas.petazzoni@bootlin.com>
X-Operating-System: Linux 6.1.0-38-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1756500460; bh=R+XlHU856bu4vXqn8uVxsOx0dwja2LOak7dR3X8ht5Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dFock0fTVipHto4oBwvCGN125roDcrR2itgAY3gN7yhjcPWl/H+7PLJJOjcuwNKtu
 GU70lVyS927ly2XyBVs4zrapnAtwFOmYgSPuA047ThTfa5stA88Ee3pOAl3W2DssFr
 AJePBEz6lGYbb2D7OpBIdbkI8NonTcPaUzAavGzHXOCKR6Vc/7UtaDG1s+DQFxk9yX
 8xBXqGyHugdWRMaofhYoZq8l/uoYY/Pr/LpbTamsaf9pOW8WOVF3XS3WLjjtP6lOq1
 F5rd+ZeNL1NJSLA5/6k/DC5uhF5MK4jSvcFevGbK/gRGONRQeCY578UMttRVXYHED2
 go7Oy9c5tBrjg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=dFock0fT
Subject: Re: [Buildroot] [PATCH] package/asterisk: fix build caused by
 libjwt bump
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,
Thomas Petazzoni wrote,

> Waldemar: you did the bump of libjwt. Are you using this library?
> Independently of Asterisk?

No, I am fine with that change.

best regards
 Waldemar

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
