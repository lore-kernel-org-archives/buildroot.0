Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE458CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7790840EDF;
	Sat,  3 Oct 2026 07:11:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9UTMlz12vLzt; Sat,  3 Oct 2026 07:11:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A739340ED0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011483;
	b=N4Of9/UyPxNS/36Q5rtTygNM7SF4jShtDjF7kaSGI8NStPvLstZS03nQu2eU3auaE7C3
	 x7XiS5iMiF2C2pl9HzavdtQceBG27rL+UdDEfjoR99TbNgW9lYGEEhXX8QA6Qvqi15ORq
	 hcFduub1+bC9tu6rGEZ9esM1vvUTkd2aIAxIsQE3WfG0k9FC25NdMIsVJlSEJMrdxULbW
	 bKgvkLryymHYZNnsR3kTQuSa45YMmX8fcMGl7yepaM74orFI8jfVQkQI/IBaiVKL6aNkd
	 vXp3uLEbj4/WJxwKCTFM2dqgLMLnJldHrBAbk7Z9LePn3yOKuZYx4n/ZiZ7vHB+dpHQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011483;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=mQfvrVD+eV3jzhkfb17L3B21+dWvHOuTxR/SFKA/F2g=;
	b=oGvXg8JCjeXIWubFtgnMKEzNxzO4zqHE9xZ6Bnix5L+H4jWBybu74vhKHLpXcgX1ZvAE
	 ExcuQTxn/viRgaXkp4kzliZIWBkYkU0QghQZyNtj3S4GulaK8fYCFrVtyuEhRYskNGVxS
	 6dAyhLzVgbjYpgB5GY8S3v6d8tTGjHMTkyvHTaTQiZ/AQid6ArfNtiKhDJ9yiLc5ZZCrS
	 CLOofcP6mXyZgIFxWkJcCH4f5rIxnmb+J4vTFcJW9GtBoYEQdJFO+zCKe9NZozM+dN0aX
	 jM+ArXOVB42ix2DDDSOHld8THq2BUiswnXsY2uq3XOfSFuOpuqlqaffvxRn3qXovquA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=K1lsFYz9;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011483;
	bh=mQfvrVD+eV3jzhkfb17L3B21+dWvHOuTxR/SFKA/F2g=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=lDZH4b6aqRmyMsjsNTXb6VdPfabG23EPomMcBKZpNF/QkGKXV6Zvrwht7Rvvda47I
	 1FYfQSetx6+95Dc+fNR20FJtvKqEmPG3ZM7UsHwJPe0XekR4aQPZGtFbFIPvA+udos
	 o7JPmM2AT50smy8LG9aRyHcHX4rQ0I49FGYhTsBA1Es8jIj36XS2kxoDO104/jx6z6
	 dYafBMMENaJbLB3Camo7oWTNQztZU/iwoyVttes0QzovlmfmQOivC/5i49L5MZnnhB
	 8GlCCP9hkU+K0GpotS9g6Igpguq0Q44e14YjdZuDZNtqgScwgX6pHUJT4nACJ223qn
	 P39xW9UVh78wQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A739340ED0;
	Sat,  3 Oct 2026 07:11:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CAB5134E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0EC540ED0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:11:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id atpghPPceJlG for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:11:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C8A1940ECB
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011482;
 b=jwxoFmS27x/YBDDug+xq9MVfPQH232ubiJX1zBo4g3WR4U09Ukcgz+MzMEvGXALIpHmh
 8EbAoSxSwKTnCgYZVj42y8lld3H5IOlj5cuH6X+S9Ff2hoVa1tCICgRjC/hzGHwi06oXP
 U1Jy5cl0LrIn1dgbCcWyGqbTS7852M3Q4Kr+HLQQdK7n5gFscT8qNB2QKKRgeq+pz9E0w
 7qcmFSPrVuGddF+F4HO8L92Z/bFAQZNZ2nFDNNUUilrSHGDdhlz9eWfC/BykRvJBOBh9B
 xbqjZVmwHaiwq5NY5A/u54pNkZq6n+Dx3U5HywY4bIWGbAilX6dEsf5Fqw/LDIYbhBQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011482;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=nS0BKH8DdIXEF+pPgfsw4Ffb+b8+hLdezZoaT2uW60o=;
 b=KkTh6BLMe3fke/hS6mlUxf9WqJg+j4eFKgsNQGIvKEWTQKRh5JxcoGgtutHaNx4GgCMj
 +zQJ8dCj9aimIETD+wijKvU2Z/8w3Og6sjsophaz3zjvaMYUMaEImxADhwQADYydLhtYh
 gA3dazqlJguQeovecKqTBtYmIzrdLuim0fIuka03krDuap487fhhPYQSnyy2cF1/u1ab0
 OCldah83nY+k8TzaiIjE2PfYsF77s270ZOefKYE34M+Ir1tQ3Nt+rJKt4rt25oQTUAiZ7
 DQ96NSjfOm9zuKPfyiG8nunYZVQEitg2oPC+W6khhOo1GkrYmQBoIWQsq9pYs8BOm1A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=K1lsFYz9; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=K1lsFYz9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C8A1940ECB
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010930;
 bh=nS0BKH8DdIXEF+pPgfsw4Ffb+b8+hLdezZoaT2uW60o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=K1lsFYz96yOe4rBJuc81Qqnuk3pODuXZi+p0TfMdCd5qIUbH4ManKoN26BKmkzz81
 M+FilKsDntEpiSHg+faMPUdZiGeEhCLjOmRGAh6FUKLwmDw1mK28OQGiup9P1BzMQF
 UUXxwgY5ahgsuUrucnFdm/f2Ppo3CO0JM5i6DqYmXlPZh5V0upnu4CUr5HLScgnGx4
 br9aqqZ7MFE3lIZR02357rtEityCWC9mSfdHIfjuJNabFRY/V1ZVB1Lfb+8uee9g9A
 HkvyIW1i6vRZk/k9YiJgBBHUv7MBvtrYhJ6sLP7h4bOftiE2HLOCMEesvadluv3vYp
 R03rbt+Z2fmfQ==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 Op8GQnoA6XQyP1bDgNWGXYwDI6f6kyqCLDefA4jNOdsgdagiJ9qbbCIsImsMJUUtmx2l8iojqqC
 DbqFeKJE0q/hq9JMBGo050AbZGbUAbp8JoU5IsBf8sxy5TKh5M5q+IduxgU13ONEDbJ2WsS3dXn
 wQSYxfAYIGZevboL/y46krM9wCELxCt9wgP/DG0WgswZAoc77CzdJrLVt4BGYT1OHP81m7Ml+Xl
 IzMj+hesBOCcUBg0HiYamnWyvUUOskWs25dzPVdjScaie0MpEmWY6w3PFTiBmUIOmRpzDoNxE4+
 NJ0TABYRc7xgR3FHUKLCxLgXl2BqGRY9Kb3vdLMxsR99lUuSKDwU0YwLGtFVTXCZ5dFoIDJK3At
 gbUkycRjKwqmWrgDmrWYo1Cb/N9yk/b6COpyu5IptCzUeotY8MwseFoynvqLfXGmeo64VbBl03Y
 pq5XjBrqawdCuJtS1o/mNQgK0KO7JgRMtYUCoTW2yPpzqKTlNRvvnQbQWCwmrR3B7UmJTfYD387
 khV7dLDiFnpAQLvspDz3q3cjkLyOlvvsGGAbsmayRtL+mVrRVkTjeID8BpUo1HYzu5qbNYh1xG5
 7cz2p8U4qg+kS7pJOjy1z8DYSL1RSz7peSCA0mpIovI+rJ5Zbe7J6D7zwPoDOBdP
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 948BEA4C5438;
 Sat,  3 Oct 2026 09:02:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkh-000000007Zo-30cb;
 Sat, 03 Oct 2026 07:01:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:57 +0200
Message-ID: <20261003070128.1295458-85-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 085/114] package/python-sqlalchemy: bump version
 to 2.1.1
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
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KQ2M6IEZsw6F2aW8g
VGFwYWrDs3MgPGZsYXZpby50YXBham9zQG5ld3Rlc2MuY29tLmJyPgpDYzogSmFtZXMgSGlsbGlh
cmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+CkNjOiBZZWdvciBZZWZyZW1vdiA8eWVnb3Jz
bGlzdHNAZ29vZ2xlbWFpbC5jb20+Ci0tLQogcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9weXRo
b24tc3FsYWxjaGVteS5oYXNoIHwgNCArKy0tCiBwYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5
dGhvbi1zcWxhbGNoZW15Lm1rICAgfCA0ICsrLS0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXNxbGFs
Y2hlbXkvcHl0aG9uLXNxbGFsY2hlbXkuaGFzaCBiL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkv
cHl0aG9uLXNxbGFsY2hlbXkuaGFzaAppbmRleCA4NWVmNzNkMThjLi5mM2E1NTk2MmYxIDEwMDY0
NAotLS0gYS9wYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15Lmhhc2gK
KysrIGIvcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5oYXNoCkBA
IC0xLDUgKzEsNSBAQAogIyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlwaS9z
cWxhbGNoZW15L2pzb24KLW1kNSAgZTdlOTQxYTE0ZmZlNzhkNjZiZjIzY2RhYWNjZGVlN2QgIHNx
bGFsY2hlbXktMi4wLjQ5LnRhci5negotc2hhMjU2ICBkMTU5NTBhNTdhMjEwZTM2ZGQ0Y2VjMWFh
YzIyNzg3ZTJhNGQ1N2JhOTMxODIzM2UyZWY4YjJkYWY5ZmYyZDVmICBzcWxhbGNoZW15LTIuMC40
OS50YXIuZ3oKK21kNSAgZDAyYmM4NzYzNjhjMTBlNzNmZWIwMGY4MjgwMzA5M2EgIHNxbGFsY2hl
bXktMi4xLjEudGFyLmd6CitzaGEyNTYgIGZjZjNjYmIzM2JiMjNiYWQ3NWQyMTUwMTU3YzIxODA0
NjE4NzQ1NzMxZTk5MzFhYjI3ZTYxODc5YTlmNjEyM2IgIHNxbGFsY2hlbXktMi4xLjEudGFyLmd6
CiAjIExvY2FsbHkgY29tcHV0ZWQgc2hhMjU2IGNoZWNrc3Vtcwogc2hhMjU2ICBlODYyYmI1Yjkw
NGZiNTUxM2MzZTE0Mjg4ZDdhMjVhMTJlYjBlY2M3ODQ3YTBhOTY1ZDMxMGU5YTk1NWU3Y2I5ICBM
SUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxh
bGNoZW15Lm1rIGIvcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5t
awppbmRleCA0NmExODBhNGQ0Li5mZGVhOWU0MzI1IDEwMDY0NAotLS0gYS9wYWNrYWdlL3B5dGhv
bi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15Lm1rCisrKyBiL3BhY2thZ2UvcHl0aG9uLXNx
bGFsY2hlbXkvcHl0aG9uLXNxbGFsY2hlbXkubWsKQEAgLTQsOSArNCw5IEBACiAjCiAjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIwogCi1QWVRIT05fU1FMQUxDSEVNWV9WRVJTSU9OID0gMi4wLjQ5CitQ
WVRIT05fU1FMQUxDSEVNWV9WRVJTSU9OID0gMi4xLjEKIFBZVEhPTl9TUUxBTENIRU1ZX1NPVVJD
RSA9IHNxbGFsY2hlbXktJChQWVRIT05fU1FMQUxDSEVNWV9WRVJTSU9OKS50YXIuZ3oKLVBZVEhP
Tl9TUUxBTENIRU1ZX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2Fn
ZXMvMDkvNDUvNDYxNzg4ZjM1ZTAzNjRhOGRhN2JkYTUxYTFmZTFiMDk3NjJkMGMzMmYxMmY2Mzcy
Nzk5OGQ4NWE4NzNiCitQWVRIT05fU1FMQUxDSEVNWV9TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRo
b25ob3N0ZWQub3JnL3BhY2thZ2VzL2E4L2NiLzdjNjhkYTgyMjM5ZmZhZTkzNzhlY2EwNzZhZmUx
NGMzMTBlMTdhNGYwMWUzZDMxNTExMmYyNjZlMjZjNwogUFlUSE9OX1NRTEFMQ0hFTVlfU0VUVVBf
VFlQRSA9IHNldHVwdG9vbHMKIFBZVEhPTl9TUUxBTENIRU1ZX0xJQ0VOU0UgPSBNSVQKIFBZVEhP
Tl9TUUxBTENIRU1ZX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCi0tIAoyLjQ3LjMKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
