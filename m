Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B38FC617E
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 12:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3B75407A1;
	Sat,  3 Jan 2026 12:00:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G1gMj2ia3qmH; Sat,  3 Jan 2026 12:00:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6E1C4077F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767441609;
	bh=8hFdv8vS6T6RNgZFwlkFTlvLUrXb9YCzeW8knhuxy74=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Jy05XIZ53TuEIKcWQzPErFToq87B2GFAYE9Ee0DR6ZDWp1LLuYuMVPSWaA+zHgpP0
	 V1ESPydGtc0OLUHxIU3eYeClgt+QF/GK8gl+uJo8JXX+IfjqxnRv9eT8eS2me8kgoj
	 8/ZECzTBA7zXZQ5M/u8ii7OrNcYe+quf0XuEVJjkIC5gwoBzOeMDD37/wlLofNz5vH
	 elLdYORNYq6buQgMKYhBiQRD62kJZShWoTXSETE3UD4VZAWM0VXoGLy3rIIEk1c0n7
	 BVPlYfxKBi8wv0ecY1bMoTBYwvZu/Fnk1/mGSwRq6wMi5Rra5HMUBODDuAmHQGYmQH
	 IVzMiJy9X6SsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6E1C4077F;
	Sat,  3 Jan 2026 12:00:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CF148249
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 12:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5BE840799
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:59:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d7NIDssksj6j for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 11:59:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E768C407AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E768C407AA
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E768C407AA
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:59:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id D2980B0053E;
 Sat,  3 Jan 2026 12:59:47 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 03 Jan 2026 12:59:47 +0100
MIME-Version: 1.0
Date: Sat, 03 Jan 2026 12:59:47 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Marcin Niestroj <m.niestroj@grinn-global.com>
In-Reply-To: <20260103013159.773935-1-james.hilliard1@gmail.com>
References: <20260103013159.773935-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <298ddcb87e19b50a8ecc5ede9ce88d23@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767441590;
 bh=g28bIXw00Sl+Zf0VozEUXFR3pjDv1hLfQyti6ak+Ots=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sEiv/v2NVxHE2hWfNmmA64i4ilt5LBfezUxPoYF0mMUPXErVCI2M6S4GdGpli5sJo
 aw6mtRzfemWyselCIR7LmP2RlEgrMPklVVDm9JtF5I/iUk2FPVH+aIKXnNfJg47MUg
 +tAHRmjSexaJ+P+KD5YYdq835Giqv3/4e7uGMr5aDFAbvjnJZ7MBc2smbvaq2hDg6A
 vgczwxP1qJ3fR+Egja3+MCD0McvLqFsJiTL5jPKMeXsDfiSGiOQlb81YX16EzzqtjU
 mstmmLlwZiZsxxoAnbte2egMhOeKdMLNu5SI9fbatEGYDkzADEpBVhEQPKd5jwQm59
 WFAG6FpjY/F9Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sEiv/v2N
Subject: Re: [Buildroot] [PATCH 1/1] package/python-bleak: bump to version
 2.1.1
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

On 03/01/2026 02:31, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
