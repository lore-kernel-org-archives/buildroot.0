Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BA7F94CAA
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 20:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CA4642071;
	Tue, 21 Apr 2026 20:31:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zyxQOR-qab3O; Tue, 21 Apr 2026 20:31:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CB2B41FB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776803486;
	bh=lsylTjUzCSC5+4vAV0l7BZuILnzII3wfOa+xSzfo44U=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=A1sFbmD8+QHlfVxjGJMVEJy/ph/Qr1c+Oj34z16EtbS7nwxe+4kfQijpFpnmzHfrQ
	 Lv87cQNaSI2ZvgyHRtQ2slMr/flH80pWRvYN6WMNAyJDIDDb6rcdPZNVZ9JQm2L0c/
	 16dQs4yxubexKaWCDSzDl+2A2+GCPQubZY4PgLSpXmKy7LBga4zsoKtr8Yz/YYI3rm
	 gzgJ4miRyF0s7vISuXdBNNDq1DRd7lEbqDTtm6r7fhw9k1wxS2os2chkOTMidi0fkt
	 gIjsSEOtaZdMMFKg3K2GxBS0uyKVizta2iXGCMVwI0C6zPQdDB4mwz6An4a/KlyRJ7
	 3BavnUueWwDjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CB2B41FB7;
	Tue, 21 Apr 2026 20:31:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D9A324D
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 20:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6DCD40403
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 20:31:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wmd7eNbYgMbz for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 20:31:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D984D403AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D984D403AA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D984D403AA
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 20:31:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id B285313F89C;
 Tue, 21 Apr 2026 22:31:20 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 21 Apr 2026 22:31:20 +0200
MIME-Version: 1.0
Date: Tue, 21 Apr 2026 22:31:20 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260421185941.2721885-1-bernd@kuhls.net>
References: <20260421185941.2721885-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <796551d3bbf2e9ab64733370ca5a7b39@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776803481;
 bh=QejsfEJWHB/M7PPVtQ2X9Drs/5r72Y7O/xiy2S644jc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CCqT3FLQJxqRbR0U51zXnI03l10WSmajkPSYjMojVgCanVnEEme5AELmsl93JCzq9
 BX2n8ddE/Dd7Bz/mGABiXghW18jCHKfBpkmxL0NzDIQxzyrnjRWglEFz2wrqHgmcXr
 8G/zvykqMuAyYUXWV1CV1GM45hc0mW3CfLT2Q5BXP2s4fA+We2mTemWFQ8oZUgoxtB
 3vFxQab6615/CV6scHh2GRty0a6NFoIpQpQTPI9vfxxhV8ptfC16dw8+S/XOQ547bk
 qeDiqnhniadxyIZ0cFeb8QbP2GdheJwna+XiPP3PbxRrJOfn1QoUCkO+YPgTGW2LAg
 Kvo4dZSjgVhoA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CCqT3FLQ
Subject: Re: [Buildroot] [PATCH 1/1] package/ruby: security bump version to
 4.0.3
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

On 21/04/2026 20:59, Bernd Kuhls wrote:
> https://www.ruby-lang.org/en/news/2026/04/21/ruby-4-0-3-released/
> 
> Added sha512 tarball hash provided by upstream.
> 
> Fixes CVE-2026-41316:
> https://www.ruby-lang.org/en/news/2026/04/21/erb-cve-2026-41316/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
