Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA88CD13DA
	for <buildroot@archiver.kernel.org>; Sat,  2 May 2026 09:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 863948107D;
	Sat,  2 May 2026 09:41:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UCX8mZVyDwIh; Sat,  2 May 2026 09:41:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8124822D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777714896;
	bh=B8aWIW34D9Qb5qtX4kMFsqLm1WhzoWQU1shwUjEDFPo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VfJDd5jefF8Qxav9dxjQA9WWik5JuckyXjKHEM/kGQB2MVhlck0LJnK4/wZ/gddRP
	 fr6KY/Bvhu49KIAtxWS8faYoPrcKKe9pPTAQQ5z/it7eTacpGnzQdv6mlRDHLySEp6
	 TjK2wkCNue5nDkiAfVjEzHzzZ+0r3YUPIBxoHBydn1+z3AMOCYfx6gox1DKs/Cmvxn
	 kwuQZZj5gWaWlyJySL6xVZ4Wql7WfVrDwXQqUA6Y7LJrOKTuSNNm5yTTjAMdxMl4M+
	 mPxy409PX1JaaUZDqVv6ZMh/2acI/G1v+aKzA0D17PrFkQh0oKbWv4aWC5A+G4ag3r
	 RTLgcJ1ZXKQOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8124822D0;
	Sat,  2 May 2026 09:41:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D810624E
 for <buildroot@buildroot.org>; Sat,  2 May 2026 09:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C92E5822D0
 for <buildroot@buildroot.org>; Sat,  2 May 2026 09:41:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Os7XWlwWgDKR for <buildroot@buildroot.org>;
 Sat,  2 May 2026 09:41:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4CD8A822C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CD8A822C8
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4CD8A822C8
 for <buildroot@buildroot.org>; Sat,  2 May 2026 09:41:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 709B760141;
 Sat,  2 May 2026 11:41:29 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 02 May 2026 11:41:29 +0200
MIME-Version: 1.0
Date: Sat, 02 May 2026 11:41:29 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260430044114.7686-1-bernd@kuhls.net>
References: <20260430044114.7686-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <93cd03c77fbb4c5abdf98f3b636bd3ec@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777714890;
 bh=OtL20nkoYe4tAohYNJY9Zat6TQLmVhrLQsrAWov3NFU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lYgB98Oaz5gK5rK9hcqt/kXyxQUz/N4XIcPLwlzl4qpYF4zZiGAawG3RP3ybi5CR4
 m6P2wU35VxqfNxh76JkJ/UAaw02Y/nWWKPezis0i+a3rF0hsDqoAOZ15KgEu1dIaK3
 7/cUhrDwVD4t8nNX9PLYUIbVRBtwYDDHug8sioj1ncMUzYELo45X/rvMZfKOkkw1po
 VcKmn+L1NA39uCCHaqvbFJcUdtb8w/N8f/e5R5wrNs1P9ftwKUN6gSBZ9dJ9nV/6Ts
 Vc5FXlrRpNHpUtE0/AWiAEWByw0j+kceyOSw4ZXhqaHdIBnjEF6vRTMj67zD85pSni
 9pSr1n2pIhgiA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=lYgB98Oa
Subject: Re: [Buildroot] [PATCH 1/1] package/rsync: security bump version to
 3.4.2
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

On 30/04/2026 06:41, Bernd Kuhls wrote:
> https://download.samba.org/pub/rsync/NEWS#3.4.2
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
