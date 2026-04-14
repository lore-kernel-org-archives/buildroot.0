Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F2BF9D0EB
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 17:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51ADD84DD9;
	Tue, 14 Apr 2026 17:58:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RhtcURkayTW7; Tue, 14 Apr 2026 17:58:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C8C384DCA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776189534;
	bh=q9GE2TkjbtS8UXwiAckBwF+kes6vDkNTQm6UMp7xuug=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cIMu6JDj6TjDdmygi9suV0MCfwUDj2OROGVAKyaCQd08Mz65Ensq09h4LG6dhxfsv
	 RlfPhsrZONZ6ZtsXk2NAOeP+izTOGkh2pmcuc/gz9iZGCUvpiIr/14tHaIpEEzZFCo
	 oZyxaxP7mZIQqhVQZL3gdIKluHgv8cTtJuweCKrcl1g5nf6quzjLksByXq2nDa8Jz+
	 oXA59prwa5aSoOpkBUxF9zfNxYtLI3eMYFQftDx/ADkono8IQANXPFiYxjfIuSji1B
	 J6psHhUVCqzowQxurWZ8yVwQ2VI35UBGRg/R+QqI48GlpdiILomPMUM9rEYhPVJWwl
	 tC30yAXVbWn6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C8C384DCA;
	Tue, 14 Apr 2026 17:58:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F02EB283
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5BD36F49F
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hreVIkL-aVVI for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 17:58:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DDE2D6F496
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDE2D6F496
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DDE2D6F496
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:58:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id CF4B813F8BA;
 Tue, 14 Apr 2026 19:58:48 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Apr 2026 19:58:48 +0200
MIME-Version: 1.0
Date: Tue, 14 Apr 2026 19:58:48 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260408085542.1641857-1-bernd@kuhls.net>
References: <20260408085542.1641857-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <1c1474bd29290aa2cac4e3d0884b9875@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776189530;
 bh=RtlLvlxtzXXy8PWEHBytgRsF2ZbDeZzXyIkzPz62mRI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QKS9eZ+Zd9IEfR1GGUeJ8AF89+sH3fH7XYUYE6NQXuo7LQUResrL92xzzI1RGUeQj
 cSpLfrjfUrxvCfkwBzq9+mSWwoGHgiIXgqQoqAMWqMFZRVoGyn+sogi+iys9rtfQ6W
 cdZQAkskxxmxqwmWxVPhF4sbUdt8UCYyKZVkAku96JZGmIaJhc2Xtutui+MeOFfe+b
 Wu8NY51jTEVa5g9Ts/xXRsZnETrOK6QD/QR708qVelhVM5NFgh5aqpHjxytiamnIdT
 r64uEDS4kWT5f1NX27ACbbBIDE2ouhrhFXNAr/yHaYqjjj0kFOvBROiUlJ7UjK8X+S
 9bedzXgVwaacQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QKS9eZ+Z
Subject: Re: [Buildroot] [PATCH 1/1] package/libsoundtouch: bump version to
 2.4.1
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

On 08/04/2026 10:55, Bernd Kuhls wrote:
> https://soundtouch.surina.net/README.html#changehistory
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
