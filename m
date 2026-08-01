Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998AFC55172
	for <buildroot@archiver.kernel.org>; Sat,  1 Aug 2026 12:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F4F840802;
	Sat,  1 Aug 2026 12:49:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JZRao0lhVnqz; Sat,  1 Aug 2026 12:49:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A15FF40810
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785588541;
	bh=kWJ6yiKu5DPY/HoIO1LJd7nCBXTyFk/cDqYNtysSmXM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QL6wkCQQegEepH15rQVKM1oBiAnu63nh7IQ4rsWdx8QL1lCfzDsbFhpnDuQdBd0TQ
	 +zNXQOZmkROvIpmP62hP5AeH7jRCKYWHTzwHBL9FpBgm4YjqgbNez8LCihNvUAUqkq
	 dOM40NjWhqw2UrdDWrDgJzzPfR6Gn9OFWZnptO4hWsHtasyBjGTa9dmcKSypX+XfAK
	 MR34sRexdA+zPMLfJF+QI+yltPoy05hR9o+CA0u2fY3d6oi/O5riEsTqGe72EWWBB1
	 OWjX8owUTWt8nyqRDw19gJIeBkSwJ/pKmRVFFUbrMZQ2VXf61VWAJU3ADvYidO10BM
	 VuJ0zP2dsbfBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A15FF40810;
	Sat,  1 Aug 2026 12:49:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B9CB9FE3
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 12:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F733400D8
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 12:49:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GVtMvUKu440A for <buildroot@buildroot.org>;
 Sat,  1 Aug 2026 12:49:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DA194400D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA194400D1
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA194400D1
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 12:48:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 0A53EB0054C;
 Sat,  1 Aug 2026 14:48:55 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 01 Aug 2026 14:48:55 +0200
MIME-Version: 1.0
Date: Sat, 01 Aug 2026 14:48:55 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260726132650.1438371-1-ju.o@free.fr>
References: <20260726132650.1438371-1-ju.o@free.fr>
User-Agent: Webmail Free/1.6.17
Message-ID: <e377c62011b7a9f323d6c681278f8795@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785588537;
 bh=mDGVF2viM0BIJfAxb3gXB45bGpQBD85+5yd1lD0r5pw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uInkuCSRI2xPdKzAp8ajObWLnusmusVlm9jALo+FL8Lc1jcxrrw/fZkNfD1BlxmAQ
 8xibOcizOQ3jHWewFfVIhrTYMbkfXLJANtREKMHtJOriCQ1gBDzYtdlHm83jMUyMn8
 FCrOMTSaf6t/f3D4hs3crUgpiXXF34UO7Nel5iu5mzAxY8zk434cAys/PtFzcjXObu
 +q2Qoi0VEGlwdd22UB+mpsX/5Aikr1/Z8JjVOeWfUXt/qs0OR98esHqie+V1B2GpX+
 vBtn4Y7+eYI/DYjENLAKRXjyB+CHW+jlNz2VM0s0G8kUL+LQhAYlHoWOYpjDs8BuxJ
 rFtP0ck8VYqQA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uInkuCSR
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: php: new runtime test
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

On 26/07/2026 15:26, Julien Olivain via buildroot wrote:
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
