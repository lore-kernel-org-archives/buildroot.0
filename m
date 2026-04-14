Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A189F9D0CA
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 12:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 268B84027C;
	Tue, 14 Apr 2026 12:50:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id piGi67EitBry; Tue, 14 Apr 2026 12:50:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2297840242
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776171006;
	bh=PY1E7Bh4Pw2riU/9mYslJQ3LF2lusrnejY9ouhow7UM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KQm7ZYHGSBiGu1iosDIJGn3eSeXzbAb4M9WU1r2LWBz4Rm0/WgSXFDxQPgbQMHvwY
	 B4TzMUXr4BGfcHHjep1E+AbqPaSYGQB9kAHMyEi6gEon9ORr//CqLz8GHIPaS4JG71
	 h3X3qYegyDdzahJGFsjkaCp2GKGKjKeFEYEGtSXyM9vAF0R4WeWsNxW6fL5vNSu+BE
	 xojUzFDoZJBQrf2EfG3avfhZVRDql0Lmf7kbuyLcL25R+vubUIL6AdfHHvO/w4bYBg
	 U0jpFUUKbx7xyTJkhmwESEx5aJYprI+bKvntTNqfMlBO0Wi3Y28w3ip9j1Asyx4eiY
	 LdLjawzeD3Wow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2297840242;
	Tue, 14 Apr 2026 12:50:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 89AEB237
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 12:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7ED04806C6
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 12:50:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5AhCj-A91wKC for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 12:50:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 96D02806A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96D02806A5
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96D02806A5
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 12:50:03 +0000 (UTC)
Received: from L13942.iliad.fr (unknown [213.36.7.12])
 (Authenticated sender: vjardin@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id C849D78034E;
 Tue, 14 Apr 2026 14:49:57 +0200 (CEST)
Date: Tue, 14 Apr 2026 14:49:56 +0200
To: Vincent Cruz <mooz@blockos.org>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ad439G29nhY3vWGf@L13942.iliad.fr>
References: <20260414095841.445592-1-mooz@blockos.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260414095841.445592-1-mooz@blockos.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776171001;
 bh=KwDNdzc2M6IaOsFzA643KsDLjSqaAvG6+yRBfvKVs9Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ARMAQANF6L/f1LJUHVOf8yqizrnlMvIOs5Ypab3Ec/+C5RFsp/zkoAgxHSPjjwW1f
 45IoZ4JVJoJPliZWbNPnkNgwUSRtPiMaMMFw2ayyNqO5y57oxHp4PLXjkfJJN8TSdW
 ErqzouYOKYtcaZmsAlk9s8ZGwN9de0Y1zD7Ck1CnNsWw3syb9KII3sVL+ZfMIGFNiI
 BRBQAGE667bGIoCJB7Gg1b82dN7CU1GIIIoIWk+qc22EYX6J4M4g7w5hJ28xkxTtQy
 ppPOoccfrtYQ87ULSDaM+8CCXTrBVcjHsC72J3GnPNRSZ6BLcbULEKS9ApaR7G9hWk
 gZaE0XtN3EWeg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ARMAQANF
Subject: Re: [Buildroot] [PATCH v2] package/python-ncclient: new package
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Vincent,

Nice to get an update of this serie with related basic tests.

> ncclient is a Python library for NETCONF clients. It facilitates
> client-side scripting and application development around NETCONF.
> 
> https://github.com/ncclient/ncclient
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> Signed-off-by: Vincent Cruz <mooz@blockos.org>

Can you share the buildroot build ci with those running properly ?

thanks,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
