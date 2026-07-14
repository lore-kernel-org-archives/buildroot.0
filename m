Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21888C43458
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 09:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE04C8110A;
	Tue, 14 Jul 2026 09:25:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fVR4Sn12fGL6; Tue, 14 Jul 2026 09:25:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04B9E810CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784021117;
	bh=YCnhp/Ff7/ftiMF9PVRQS0f1v38U/yQGnS2NXeGTsxI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kg/l4VPNm5M1xb2vxzTFolmV1ZSCJAv30Nzg8mNmX1p657lG707ANwfbEyJ8i3hzH
	 +LhsiAvA3rcfS3fTluySj38Xk9hFKIOUvNrdUoPFNzgTRtW2Gu8/BpnRLdHm4y4p5W
	 66O5RcERj3y3AqWHbxqWAX25ceidcEOHi7XCMBY5dhNG9+2XxU2y2JuWDrS7rruMbF
	 +ebImWFSYDPEG05upNvdSI3BX4GNcK7zRSSAsnHQa6b2GzE45Ksr789c2U63RHgaTn
	 suWhYYfAjkWyKFF7PlCnLHrjA7YNqG0JtiyvAlb2mkcm2lnLR3fNKhuMLTbcDSbng5
	 1cGzc0EujUXFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04B9E810CE;
	Tue, 14 Jul 2026 09:25:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D03A096C
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 09:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1D00810F6
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 09:25:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c2CP40JE9mez for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 09:25:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F3C20810CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3C20810CE
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3C20810CE
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 09:25:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 330B72003D3;
 Tue, 14 Jul 2026 11:25:10 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Jul 2026 11:25:10 +0200
MIME-Version: 1.0
Date: Tue, 14 Jul 2026 11:25:10 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260704100700.2336075-1-bernd@kuhls.net>
References: <20260704100700.2336075-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <9cd20fee98212e3f670168fe7e3a3091@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784021112;
 bh=+y5muXD6S+rDeZ8y4y1rHe0ja5VvnQdZkTR4R6IR0VQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mD5bhowva67j7/NPbo3iOQkC7JuPzKJUosW1nN/zXZgImhqobJ2eZOkppJNl8JlZ5
 b2kUyikK9gR3dDQTl/0z5oJeO3K6Ir+QbqrvQcP56XcQulvXzd69cDVLpTPRhJSDbC
 gf6HFxRONDuSacuJ1Oi5p8y2Pusu+u9tGGcSxV+MHs4vul4no/mLZ+N2YVhz7WcQzJ
 7vtzHNxsiUSR6ycQklPE9Np9DlUxtN1Gpt7c/wwa8pJYknU/Rsfao5mOfL/fSCph6P
 Rq7OIKIaeAY1mGuT+C4gKivkpPPjVGX74lAjV/sHViWTr68l5YrA2q/eIuzaafF+Eo
 ZNcL6ctbYINNA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mD5bhowv
Subject: Re: [Buildroot] [PATCH 1/2] package/libnpupnp: needs gcc >= 7
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMDQvMDcvMjAyNiAxMjowNiwgQmVybmQgS3VobHMgd3JvdGU6Cj4gQnVpbGRyb290IGNvbW1p
dCAyNzc0NTAyMzQ0ZjM1YjU4N2VhOGYxYTJmNDNlYzIzOThjM2ViZGFkIGJ1bXBlZCB0aGUKPiBw
YWNrYWdlIGZyb20gNC4yLjIgdG8gNi4yLjMuIFVwc3RyZWFtIGFkZGVkIHRoZSB1c2FnZSBvZgo+
IHN0ZDo6c2NvcGVkX2xvY2sgaW4gdmVyc2lvbiA2LjIuMDoKPiBodHRwczovL2ZyYW1hZ2l0Lm9y
Zy9tZWRvYzkyL25wdXBucC8tL2NvbW1pdC9hNzYwYjMyNzhhZWUwNjQwOGQ5ZjUwZDBjNTQ5NDJm
NWJhOWRmOTg5Cj4gCj4gY2F1c2luZyBhIGJ1aWxkIGVycm9yIGRldGVjdGVkIGJ5IHRoZSBHaXRs
YWIgcGlwZWxpbmVzIGZvciB0aGUKPiBib290bGluLWFhcmNoNjQtZ2xpYmMtb2xkIGRlZmNvbmZp
ZzoKPiAKPiAuLi9zcmMvaW5jL3VwbnBhcGkuaDoxMzI6MjI6IGVycm9yOgo+ICDigJhzY29wZWRf
bG9ja+KAmSBpcyBub3QgYSBtZW1iZXIgb2Yg4oCYc3Rk4oCZCj4gCj4gc2NvcGVkX2xvY2sgd2Fz
IGludHJvZHVjZWQgaW4gZ2NjIDcuMToKPiBodHRwczovL2djYy5nbnUub3JnL29ubGluZWRvY3Mv
bGlic3RkYysrL21hbnVhbC9zdGF0dXMuaHRtbCNzdGF0dXMuaXNvLjIwMTcKPiAKPiBzbyB3ZSBy
YWlzZSB0aGUgbWluaW11bSByZXF1aXJlZCBnY2MgdmVyc2lvbiBhY2NvcmRpbmdseS4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgoKU2VyaWVzIGFwcGxp
ZWQgdG8gbWFzdGVyLCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
