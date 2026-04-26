Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72011FF885E
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 18:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9320042A42;
	Sun, 26 Apr 2026 18:32:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cf5luHkhyxly; Sun, 26 Apr 2026 18:32:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A654942904
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777228360;
	bh=QewfFAS2KBpfONuARtzFVZUC0MKvfEwifNlP0/Nf/ZM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JEuWixMc7DqGjL6pK2a8Ni+xpCNBUAcmmXFV5NmTH0WyAf6PVqj4suOoSaKVPhnb4
	 iEZQPDO1FnhyPvOCs5tZi9ELXG0nV6gtH19WnNLgHFSVFt/0WTYmv2UNzq5+Jrrx0A
	 eyXgx+Zz4ixCAipsebHM8+6QlFpp/TYenoTT1anlXk2iJgyIMg5JltXj9LKribXONJ
	 WjU5ksW3fcK7E+eFFF+Zz4b6eoACsTBJZVbS9jM7/6qZ+So78V6liscp2/ig+FQIuN
	 fTuFTT5gxQLKQEMN4Y7D23P6ilG58nHs7OTX5CIOrfOzQ5kXE+TpSYsyp8qBbC3Wfj
	 0SpYdh7d3MMig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A654942904;
	Sun, 26 Apr 2026 18:32:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 00D1D231
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 18:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E62AF61C89
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 18:32:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cffd1IZ_RfrT for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 18:32:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B9102606FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9102606FF
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9102606FF
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 18:32:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id E12652003C8;
 Sun, 26 Apr 2026 20:32:32 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 Apr 2026 20:32:32 +0200
MIME-Version: 1.0
Date: Sun, 26 Apr 2026 20:32:32 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
In-Reply-To: <20260426080013.607198-1-bernd@kuhls.net>
References: <20260426080013.607198-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <a423eff4859a226f1388ad983008df4b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777228355;
 bh=i7BBq+duZ9bEH5put4PZjQb8On8h146rE8dzx1CqQuA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=h/m6cd775YU1gIO7ilQ8xULyCJbga5aaOIixHX1ocz6kz+NC1gS9+eC0xp2L4gsz8
 zyamRbsRny4Qdt3KZP6UWjsdrrAHJ0Ljb/REqx7D9Xu1QLqID4APBbqyBjYCk5P858
 e/A+6JdElUCsCA4QFN66bsY5EaVdUSlcdqmEtUP9G4bG6KIBZSrDK2Qhydm2oo+7Vf
 csvFDdGli4EanjxvQhU3PnMxa81njI4gHZg3zxlpLKhngrffTRvCSi7VCIRWfTPUIp
 GKhUrgXrqQhSxyzlR6polApB92mIx7AGAqzAI0X0oR15E0ZqzDqYhM5Qz1mj69FEts
 caBMotqARZdAQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=h/m6cd77
Subject: Re: [Buildroot] [PATCH 1/1] package/{rust,
 rust-bin}: bump to version 1.95.0
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

On 26/04/2026 10:00, Bernd Kuhls wrote:
> https://blog.rust-lang.org/2026/04/16/Rust-1.95.0/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
