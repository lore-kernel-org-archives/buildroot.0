Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D424C5B572
	for <buildroot@archiver.kernel.org>; Mon, 17 Aug 2026 17:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05A284081A;
	Mon, 17 Aug 2026 17:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LX8goMKCo4hv; Mon, 17 Aug 2026 17:09:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20EB340804
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786986598;
	bh=3TnqQ7MGwsN6LZa8GYtYj12l1vC+izVlA08m0eCbnL4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qwhFEv5BAHzJJ2BypEStp4Ft8aCKbcZVw/PuBuAFkmpSei1DStmG9z7dFq7fD+SnY
	 hJlNmHHMHeDM1YZgXtBgEAUcfkh+EfH+JOh5bMOx4ylh0G9V6kjLArCIfVHmVoQ8Hr
	 a0L3RImPYggRfd7L8OnYMQZglsDgAV2CovgO8eBvJR9slG4psjake2yjB6/Bb/qEUX
	 TG7KFHashA5PNExJNfe9IdN10l0ExrYexjYY53z0jHL/Wlc0iTkc8bU2werVhxGYLT
	 Aa2hwdjSps9UniyeSpowqmQD2fw6a0LFTS1nh9CBhiQsA2hgZ6xhITZ3to5kkebWvx
	 H0JO+0OZplaSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20EB340804;
	Mon, 17 Aug 2026 17:09:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 896662EF
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 17:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A34740804
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 17:09:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lFEvgemc6sEJ for <buildroot@buildroot.org>;
 Mon, 17 Aug 2026 17:09:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 93D3A407E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93D3A407E7
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 93D3A407E7
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 17:09:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 41B1619F57B;
 Mon, 17 Aug 2026 19:09:51 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 17 Aug 2026 19:09:51 +0200
MIME-Version: 1.0
Date: Mon, 17 Aug 2026 19:09:51 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Sergey Matyukevich <geomatsi@gmail.com>
In-Reply-To: <20260816211536.3994135-1-bernd@kuhls.net>
References: <20260816211536.3994135-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <df4229ef35eaa0760a8bef87dab85e51@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/libnl: fix build with kernel <
 4.15
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

T24gMTYvMDgvMjAyNiAyMzoxNSwgQmVybmQgS3VobHMgd3JvdGU6Cj4gQnVpbGRyb290IGNvbW1p
dCAwZjJlOWNjODc4NDcxNWJkZjE4ZTcyYzQzM2ZlOWJlY2U0NTM3Zjg1IGJ1bXBlZCB0aGUKPiBw
YWNrYWdlIGZyb20gMy4xMS4wIHRvIDMuMTIuMC4gVGhpcyBidW1wIGluY2x1ZGVzIHVwc3RyZWFt
IGNvbW1pdAo+IGh0dHBzOi8vZ2l0aHViLmNvbS90aG9tMzExL2xpYm5sL2NvbW1pdC85Zjg5NDUy
NTFkYTQwNGZiNTk3NzhlZGM3NGJlNTc3NTA5MWUxZjQ0Cj4gd2hpY2ggYWRkZWQgdGhlIHVzYWdl
IG9mIGVudW1zIG5vdCBwcmVzZW50IGluIG9sZGVyIGtlcm5lbCB2ZXJzaW9ucy4KPiAKPiBUaGUg
R2l0bGFiIHBpcGVsaW5lcyBjYXVnaHQgdGhlIGJ1aWxkIGVycm9ycyB3aXRoIHRoZSBkZWZjb25m
aWcKPiBib290bGluLWFhcmNoNjQtZ2xpYmMtb2xkOgo+IAo+IGxpYi9yb3V0ZS9uaF9lbmNhcF9p
bGEuYzo1MDoxOTogZXJyb3I6IOKAmElMQV9BVFRSX0lERU5UX1RZUEXigJkgdW5kZWNsYXJlZAo+
ICAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pCj4gbGliL3JvdXRlL25oX2VuY2FwX2lsYS5j
OjUzOjE5OiBlcnJvcjog4oCYSUxBX0FUVFJfSE9PS19UWVBF4oCZIHVuZGVjbGFyZWQKPiAgKGZp
cnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQo+IAo+IEJvdGggZW51bXMgd2VyZSBhZGRlZCB0byB0
aGUgTGludXgga2VybmVsIGluIHZlcnNpb24gNC4xNToKPiBodHRwczovL2dpdGh1Yi5jb20vdG9y
dmFsZHMvbGludXgvY29tbWl0L2ZkZGIyMzFlYmU2NDc3NDk3ODJhOWViZjExMTA2YTgxZjcxNjhi
YTcKPiBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvY29tbWl0LzcwZDVhZWY0OGE0
MjFhNjhiZDlkMWJmOGY4MjY3YWY0MDY2ODE1ODAKPiAKPiBBZGQgdXBzdHJlYW0gY29tbWl0IHRv
IGZpeCB0aGUgcHJvYmxlbS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRA
a3VobHMubmV0PgoKU2VyaWVzIGFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
