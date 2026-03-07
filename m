Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C0DF55102
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 21:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A33D41BE2;
	Sat,  7 Mar 2026 21:38:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dEmeOkClu7_Z; Sat,  7 Mar 2026 21:38:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B3F441BFC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772919523;
	bh=m3YdV/mAYjOIGqStOuC0pGBZBFfUMpA9kyQvATYU9RQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=b/1IDVIF8MmqXlGevlWPtCRyZzfKO3rnJB7/9xyl/Q7m+DaYuZ/zgdy/0DnrHTYUN
	 8RVMadsagFvozuARBBGYG4j8vAQy5BJ2K+ueRPYkr9bH1YEUpuf8IKzyUc/WWxZAIt
	 UxK9+2oT+VCdAyNxo3aRPujoxA09IcY0cgNBBuHgx6kmm/Ux6/A7n3DJUgKXjB6rqY
	 CHakQ36oxXm/NLHafLhbadh+xjk5uSkZ/W0umedsvbnXeLtML2IYMId2ztdrIOBz4r
	 ICquDceGKxx+iX1xPC1G6YGEvtVIuVKMPVNcyYE9mBN0il4q+eRlgNdDwrNF8vNLK0
	 nglJYMiMaOfnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B3F441BFC;
	Sat,  7 Mar 2026 21:38:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DA0B158
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 21:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 638CF83D6F
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 21:38:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RcRC_8y15MXB for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 21:38:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5355683D6A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5355683D6A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5355683D6A
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 21:38:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 61267B00535;
 Sat,  7 Mar 2026 22:38:38 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 07 Mar 2026 22:38:38 +0100
MIME-Version: 1.0
Date: Sat, 07 Mar 2026 22:38:38 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260209203227.3837422-1-bernd@kuhls.net>
References: <20260209203227.3837422-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <613e6e41e2cc29d92bda7ca684979338@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772919519;
 bh=nm6IJclAhG4/+G2lyas/foWdqg4rnqz2HP4TC9TZsCk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ut5AK4JpDKoM3G5YGJkTbzXgEBLzb2MUCAYXf7H7DjMT3nC0SwOjMG8T1bHKMbheM
 QmrQ2bvryrtbRz4bdzVc4DBHzH/OOYmfGNIW+bNXY3XDxtQAQHa6xOBCQdWgZr1hl6
 2kJGgjz744BAZYY0mTHdkxk52bARPia1jeawwWHK9hYuaDr1kjQWLpGZhDWHkWKB12
 uuQFghkfg9n3mNt/bDmWQH2KqbUMoQCqRD7E/qBy3HKhpGNgsJOyD4nVtDr6PEiFmD
 YadiSuNqxl9kUjvQs1mXPojNgEXMsBgLZ72BynBQKBG+PGPwf1U3LOokQKdf0EarKU
 9siQFzQRcHjTQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ut5AK4Jp
Subject: Re: [Buildroot] [PATCH 1/1] package/libheif: bump version to 1.21.2
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

On 09/02/2026 21:32, Bernd Kuhls wrote:
> https://github.com/strukturag/libheif/releases/tag/v1.21.2
> 
> Use sha256 tarball hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
