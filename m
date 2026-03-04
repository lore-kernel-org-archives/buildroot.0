Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE6DEFCE4C
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 21:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D0D281A18;
	Wed,  4 Mar 2026 21:41:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id avbfBQuAp0pg; Wed,  4 Mar 2026 21:41:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 306778187F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772660486;
	bh=IhE5BB9T8B/6LhoceZ6UwJv+59j9dp82ZMGYpw/oiVU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=g/Zp5IstPKgU0kUkEZdsTA82kNK4Oaf2oRTNP0THiY9KIUffkgzDQak+XMXwYs7LQ
	 21dELccqmoxqHtR+g4bDq0tb0hwTsP+XXteSCUZrUma1BDI8Z00eIgKUZkyIBxoIC/
	 bh9q4ggfAfwwZh5TRCaNPlnOoc88ykU0xk1GjRkWgPrx2DMyk8y5h7n5AuNUmrrEkd
	 cCIf+q0rBLKHmMDImZl0bO+l4LKOMTnoReHHlB3mgTevavypHcUUe8afBp8Z5/2JGd
	 kpe2FFAErcz/8uWx4/2KAziDcAq93ed9ixflfgB74I1etPhHGxXHnaYrTAZheWND+3
	 qWoQ5xX+GYw1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 306778187F;
	Wed,  4 Mar 2026 21:41:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 75D4E223
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BB62608E9
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:41:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VBqJn8op0p0s for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 21:41:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 344A9608E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 344A9608E8
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 344A9608E8
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:41:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 9B31E5FFBA;
 Wed,  4 Mar 2026 22:41:20 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 04 Mar 2026 22:41:20 +0100
MIME-Version: 1.0
Date: Wed, 04 Mar 2026 22:41:20 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260304193908.3512983-1-bernd@kuhls.net>
References: <20260304193908.3512983-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <1ded8dac495eaabeed3bfbedc384e2fb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772660481;
 bh=Qe0gWYY8lplsEMuqx4QsKtiDgtLbplKjHy7xssZf+ns=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XNHt6RoCW6n8geTeVlM7caIly0S9wBqgs0MlQ4b9eaUsriAy4JT44TQt2r9Ev+YFl
 E3YGiumIz66FtlvXhWszXvxkdJadjwtk+VPI9tubhCXIW4fT1D8TlGzXBI3BMj4E3r
 5uQ0okvVLEIDpJ6HuKIvnl2oDxAHeeajfoWnxwesPQ8RfrDGll8wfoYyCVKa1r6375
 iCFYpKo7HFE9Dn5ibMJ5kX7GRq0qNz7+uPJNoGCgaEq/OChanlmrWlI5CiCQniqNkN
 xHO6Jn5BzSO+gVfTeKV/JhnFWNlChJVgEC/ZMc4ps8rDrjYqN6gQ89gKx6fD5fFne9
 2ukl78mGLg7WA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=XNHt6RoC
Subject: Re: [Buildroot] [PATCH 1/1] package/clamav: security bump version
 to 1.5.2
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

On 04/03/2026 20:39, Bernd Kuhls wrote:
> https://blog.clamav.net/2026/03/clamav-152-and-144-security-patch.html
> 
> Fixes CVE-2026-20031: https://www.cve.org/CVERecord?id=CVE-2026-20031
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
