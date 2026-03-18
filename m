Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF3910775FC
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 18:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F5CF60BE1;
	Wed, 18 Mar 2026 18:09:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i6cfmZjM-zoy; Wed, 18 Mar 2026 18:09:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E98E760BBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773857381;
	bh=AhEVifIpqwfDFFlcMPsZ4lfSe9fOEHyzvzcSqV6VdGQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=A7cH0FUO9TQrx6AAMDVJmeDyPtDTToLKUsF8eKTumVVJbN1U0IKusZF4lU452pig1
	 m7Fv4ayBpnrJxLN+P9NJgFY8ZP+FGuRwHIthq6NcDL3L15KpQpyz62EdI/PpAyOPu0
	 P6axBHJxehyz044isEU333hRUKhrjylztYwKSHoIRuK5Ccd+KZg6P9Zepqa9O7BGJE
	 Z1kvri9IpDR8gfTkpj5x7I3ir0Z55TVksbTPDXJwbTVYZNA1ITL45xbKqm8oLF/R5Y
	 d9zS0BWZ+iQECD9Wl7+TKjz+2GvyHJsmnPf3S57CG23HG6ivYugsE5IlxWlcm7kCao
	 vJ3ZJWaQf4PAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E98E760BBE;
	Wed, 18 Mar 2026 18:09:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A917A1BD
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EAE3404A0
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:09:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QRaW4GmJblsO for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 18:09:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B0797400C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0797400C5
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B0797400C5
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:09:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id B0B786012F;
 Wed, 18 Mar 2026 19:09:33 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 18 Mar 2026 19:09:33 +0100
MIME-Version: 1.0
Date: Wed, 18 Mar 2026 19:09:33 +0100
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
Cc: buildroot@buildroot.org, Alistair Francis <alistair@alistair23.me>,
 Dowan Gullient <dowan.gullient@smile.fr>
In-Reply-To: <20260318123714.2494747-1-vincent.stehle@arm.com>
References: <20260318123714.2494747-1-vincent.stehle@arm.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <9444a675ade792e71ac0afa29b1f9895@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773857377;
 bh=rUogNUFUxoKutrt+QcSO9RO0hjSeqQODMpIQdRduJLk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=I/rHI+qsHOYpEVB8ml6cNstVza0dI3+0Hxw0JXBPWcEDSwPOUxTBA2cPRt1uatXlB
 wtxM8u3cwZOqeStMZ7W27oEFpXWeuu4Z3duUeIfBGYqPB2x4EfUbY7I2ox4FbIXJ3a
 WN4spGrRohF/+5jlkF3jXd607mnn6w+CSkpbhxZGrRXozC2c1kXT4SUM/a++dEFqRC
 o0PA+ueuQeoilqd87AWsHOpZ4+AsCoBu0wbdNDCSeSvwCTZqHGGgVzSjNqAx7O/sqL
 pnopBNe3u7l6JUalj2sfckhJphKeYs/VgOMVk9sdcN32pVn+/XB8/7mBkqENRsomGk
 MuvuM1B6BSM5w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=I/rHI+qs
Subject: Re: [Buildroot] [PATCH] package/xen: fix armv7 build with gcc-15
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

T24gMTgvMDMvMjAyNiAxMzozNywgVmluY2VudCBTdGVobMOpIHdyb3RlOgo+IEJhY2twb3J0IGEg
cGF0Y2ggZnJvbSBYZW4gNC4yMSB0byBmaXggdGhlIGZvbGxvd2luZyBidWlsZCBlcnJvcnMgZm9y
IAo+IEFybSB2Nwo+IHdpdGggZ2NjLTE1Ogo+IAo+ICAgeGVuLTQuMTQuNi94ZW4vaW5jbHVkZS9h
c20vcGxhdGZvcm1zL21pZHdheS5oOjE6IGVycm9yOiBoZWFkZXIgZ3VhcmQgCj4gJ19fQVNNX0FS
TV9QTEFURk9STVNfTUlEV0FZX0gnIGZvbGxvd2VkIGJ5ICcjZGVmaW5lJyBvZiBhIGRpZmZlcmVu
dCAKPiBtYWNybyBbLVdlcnJvcj1oZWFkZXItZ3VhcmRdCj4gICB4ZW4tNC4xNC42L3hlbi9pbmNs
dWRlL2FzbS9wbGF0Zm9ybXMvb21hcDUuaDoxOiBlcnJvcjogaGVhZGVyIGd1YXJkIAo+ICdfX0FT
TV9BUk1fUExBVEZPUk1TX09NQVA1X0gnIGZvbGxvd2VkIGJ5ICcjZGVmaW5lJyBvZiBhIGRpZmZl
cmVudCAKPiBtYWNybyBbLVdlcnJvcj1oZWFkZXItZ3VhcmRdCj4gCj4gU2luY2UgdGhlIGV4dGVy
bmFsIDMyYiBhcm0gdG9vbGNoYWluIGhhcyBiZWVuIHVwZGF0ZWQgdG8gYSB2ZXJzaW9uIAo+IGJh
c2VkIG9uCj4gZ2NjLTE1LCB0aGUgdGVzdHMucGFja2FnZS50ZXN0X3hlbi5UZXN0WGVuQXJtdjcg
cHl0aG9uIHRlc3QgZG9lcyBub3QgCj4gYnVpbGQKPiBhbnltb3JlLgo+IEFkZGluZyB0aGUgcGF0
Y2ggcmVwYWlycyBpdC4KPiAKPiBMaW5rOiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9y
Zy9idWlsZHJvb3QvLS9qb2JzLzEzNTE4MzE4NDczCj4gRml4ZXM6IDg2ZDQ1M2E3ZGMwOCAKPiAo
InRvb2xjaGFpbi90b29sY2hhaW4tZXh0ZXJuYWwvdG9vbGNoYWluLWV4dGVybmFsLWFybS1hcm06
IGJ1bXAgdG8gCj4gMTUuMi5yZWwxIikKPiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kg
PHZpbmNlbnQuc3RlaGxlQGFybS5jb20+Cj4gQ2M6IEFsaXN0YWlyIEZyYW5jaXMgPGFsaXN0YWly
QGFsaXN0YWlyMjMubWU+Cj4gQ2M6IERvd2FuIEd1bGxpZW50IDxkb3dhbi5ndWxsaWVudEBzbWls
ZS5mcj4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
