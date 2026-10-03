Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D42CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64CB840BDB;
	Sat,  3 Oct 2026 07:02:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FypiazecziUh; Sat,  3 Oct 2026 07:02:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9157040BB6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791010935;
	b=o9UomXkRHbXdIC+qWDdf2x43aT4GfbS8BGyJUpAljKxcrk+eaaimDQlzKTsE30LB98bB
	 DlWB852MRVVaZBF88w3ysUqdSv7pv4wlPvCzGbmhZzMrUXcwozIiLUhHrm7fZPWEE3U6y
	 UXbqCGOZNI5Bm9Q/7VGX1YIT21H1avR25597Zzf8BAOSTOJNWh9Yb8Phr/7Yea1WEhoEi
	 3hm8sINM6C5nXpypAs6144P1C2Krli3MbJ6oC/8MfvMpSWEBlM49PIyg4QtfR2fLgxQs4
	 c9LDj7k/wu4n5GH5TUSICLKqMfkfGshCZyL19lgC+j+IPtbqKf8PFRpCRCT7OMDcn9A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791010935;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QbtGfrxZ5Lgiw6QZf2SYlcsWjqseCstgzCc+1ix/51Y=;
	b=oKK0e+7AtXiF9D39cOHTsE9iZz3RLABDjZklyFHTiLeJ484tKO55JHCXE048f0BMTH49
	 4NsVJoaXXGoZQiJihJ27i1ism8X47Q9s1/YVUx9TWOrrhUAQ7Kq95XM3kGzQa3OI+ZLrw
	 Z+NPwIYac0mFNTr+qIdcLiENMRLUbNEtWlk74MB04y4zLMr6iAiPh56de94Vq2ZGS0Pbz
	 Gru7BVxqzlhLy5xmO1b7Gbi3VlkgsCzstO0wvd4zTxivkJBmuIjrLuPNlwZeGV/Fcg6Ta
	 2u9z0S3qM0qf9M/L51hZNk7T91bdgNzRwSiE8gf71sZzJQY5Q+6rd80Zd9tuqpQp0iQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791010935;
	bh=QbtGfrxZ5Lgiw6QZf2SYlcsWjqseCstgzCc+1ix/51Y=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YtDIYiAxtxwB7zhQxs5ebZZsViDAqGLgBJHDbffeY7l3KWeM8cORaN3/d+PafMbXu
	 rDZkwdpb2gOe+rH81PnPsJMYk2C+btQvWgHuYjl9JTg+PJO71d23nHti/C7IRmOBVd
	 gK1sJmveXS2yLBw9DhHEHRbHGzXs5waVcElKHFyWgHvasd6VytqB6DQRzrDiQmIP8R
	 K0/nq5kk5xXLMG+O+Bkli8aLkY8eV6jPkXxVrPL7T2tsnnqpFBuVDGZoOp/rzwgZ1c
	 0xVHUD3NACUAxYQ85IGgGD49jYShr2/QCXP+SYxWDcNsAuqsdBiyyAYgwRBO0iHIeu
	 A7hgLATU72Qew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9157040BB6;
	Sat,  3 Oct 2026 07:02:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CF7B2E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3313560623
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:02:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JuTf92XganAp for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:02:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2F43B60622
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791010933;
 b=U2Ns9Uvw9dfbcYaOlHiN4icL+wCP/O5Kk0vM+zdX4qYjNNaoDGhhhgO8QYaWCAnjQj/N
 +FEYNDRItkS9nd+XguNGhGF4WNEUvTrmB7ggGoC3I8l0yzhPpgkqdDIpM8E0o63pOczHL
 kiUt6EUybrB7Hl1JBGKq8SOZXCtOWaHOvJ89z6hfhDs7PPirJyMqfnVllExSu7pGSdIvo
 2gpjrCLU1V7dtA3fZpBMdA2rVGYS0NkU65QNXGGdOBj1TYTkJ/feET9frevIk1fcJaM3Z
 VljS73JgClRgbM3T5TMngzogJBVfbv+8Tn28Rw5mVp8JvbqcTwswJJthzDQAT4z84Zg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791010933;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=wdxjOvOZP7bd8COq7jUF/u37AG2GVYQNLeZfjxwcM/0=;
 b=tZy6AjmYTZIrB5YhjUMx3VVVKBl1spwAlx6LouMbT/A0HR7P25aIKJQWaPpOnz9ZDezq
 mSl3UmhzM15nTASjjSnSCcLuHqKVFeI1bHlI3hXDHJD0igB4wZueSm73U7is1Eda8NHEn
 imydCyrqA/im+muCEkjE7aEu39zxSxnXKr1nGCjj5/+XRQ9D5aaV9JtrGaXxing16YhSY
 /wQESbyj+ik3KG8ZGK5DQukiuj3FfG5z01nbWPYS6U4UCBtCc0aKWJu5Sn/Spb2FfJY71
 rI+ZszCBKIPjUN184tZcVRw04lbBPP0P90Rr4oV2LosXT1wrGhcSbBj8g5sZln6uVzw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=FYi+PrqY; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=FYi+PrqY
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2F43B60622
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010901;
 bh=wdxjOvOZP7bd8COq7jUF/u37AG2GVYQNLeZfjxwcM/0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=FYi+PrqYrK8bhpDBWHuN/gEMZjZB8mlJyHNZ7VNHyGrpwbBX0KG+nzAQuzxRmyw03
 qx9/qCWYJ/vp7H6+y3SjbrYQF2y0wWQmreqTCnni11VhR5gVvgbBIbP6ClWFmcx4Yd
 drtjIB1p3z9Pskk1RWBFt5ED7JLJxRqYvvml9Y2CiZ3hdWGNCIzIAlEf+PBiCB193E
 e0ac8pDCCFF9Wf2SPdcdUQIMLGm8S6zsz6UmCbGxbM2XJ5p0R9WfYHE/DObphQiAFb
 WI90qOHsKOX9GmsA3kKxPo5XHrU3F85NUJWSvzw9snVmWcITIvJ7oM2v2Rqx+HBiPd
 CvSZ1MHRzV6WQ==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 7mZuI3zj/Fic4ApkujcDHENtfOK2SN6br4knrwy11+pc0wVzKz0ZwbJPbN9GgpjvkSHq27wRI8E
 EFt3suEEQ6Oig9yW5dbpaub8p2MPnbJf4bNF5pmOVcKnHf8zzojUt1EoXeFTYGWvegL1YsTgC4Y
 II2dhCV8nyffaoRL8ZKnva+ncUa5poymGQrkMV1voCBT4k5NW1HqyPImTbFHjlWPISV1D96o1me
 eWsnJeNDeDNFJXElu8kLdA7LgSs2aERAbFrJ7aojGOYaY9VYzqRD0pU/sQoUWzRRgg1+drJjlB3
 2/+AOXj1XEEdPIdajUT35yZqCmDS906MGThRA/6oVgCL0WAnkZ8ELnfvAD1w6sVfRgj9vXI/Lvv
 QDit+ddYBe7xvaxH0xNlnIck4V9avdeO17HRA3qJe+AeExecxi3k7kAp3rwQLR+5Ez+RshunpCO
 QFYfvF2zzcAMEOTR7aRQiJFxOewP1Olr0tsd7hQ0KzzQouINQ8sR+vFdR0D02pkpzJI4DI3xxZ6
 DE4YTNXNs47kmzXqeLC2v80TXXBUCPBSwBpMe4hv+RtLPBK1wJskkTaLWpEKSnt9Wb4CMmzsrw3
 I1pzzRzv549E27jXQhJSDxGlNzdaG7ld1T/AGgvxyGUynsiuSqK0WH5OjO0pdq0=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CE328A4C53C2;
 Sat,  3 Oct 2026 09:01:41 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkb-000000007Zo-2TTH;
 Sat, 03 Oct 2026 07:01:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 08:59:39 +0200
Message-ID: <20261003070128.1295458-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 007/114] package/python-boto3: bump version to
 1.43.103
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KQ2M6IEphbWVzIEhp
bGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgpDYzogUmFwaGHDq2wgTcOpbG90dGUg
PHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgpDYzogWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xpc3Rz
QGdvb2dsZW1haWwuY29tPgotLS0KIHBhY2thZ2UvcHl0aG9uLWJvdG8zL3B5dGhvbi1ib3RvMy5o
YXNoIHwgNCArKy0tCiBwYWNrYWdlL3B5dGhvbi1ib3RvMy9weXRob24tYm90bzMubWsgICB8IDQg
KystLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tYm90bzMvcHl0aG9uLWJvdG8zLmhhc2ggYi9wYWNr
YWdlL3B5dGhvbi1ib3RvMy9weXRob24tYm90bzMuaGFzaAppbmRleCAwYTYyMGFmZjIxLi5iMzUz
OTRiOGM0IDEwMDY0NAotLS0gYS9wYWNrYWdlL3B5dGhvbi1ib3RvMy9weXRob24tYm90bzMuaGFz
aAorKysgYi9wYWNrYWdlL3B5dGhvbi1ib3RvMy9weXRob24tYm90bzMuaGFzaApAQCAtMSw1ICsx
LDUgQEAKICMgbWQ1LCBzaGEyNTYgZnJvbSBodHRwczovL3B5cGkub3JnL3B5cGkvYm90bzMvanNv
bgotbWQ1ICA4ZjY5MTZhN2U1MDYzMjU5M2NkZjU2YjVmY2RiZDM2NSAgYm90bzMtMS40My4xLnRh
ci5negotc2hhMjU2ICA5ZTRmODVhNzg4NDc5N2ZmMGY1MmMyNTcwOTQ3MzBlZDIyOGFhYTA3ZmE4
MTM0Nzc1ZmY4Zjg2OTA5Y2Y0ZjJhICBib3RvMy0xLjQzLjEudGFyLmd6CittZDUgIGU3NTZmNzc4
ODZhMWFhNTlkOTE2ZGUzNTM0MGRhNjhhICBib3RvMy0xLjQzLjEwMy50YXIuZ3oKK3NoYTI1NiAg
NTI0ODIxMDUyNTI3ZjY0NDZkMjQ5YmY3MTA4NDdiMDMyZDliMTIxMzVlMzQ2Yzk3NTE3NzdhMGEy
ODExY2YwNCAgYm90bzMtMS40My4xMDMudGFyLmd6CiAjIExvY2FsbHkgY29tcHV0ZWQgc2hhMjU2
IGNoZWNrc3Vtcwogc2hhMjU2ICAwZDU0MmUwYzg4MDRlMzlhYTdmMzdlYjAwZGE1YTc2MjE0OWRj
NjgyZDc4Mjk0NTEyODdlMTFiOTM4ZTk0NTk0ICBMSUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdl
L3B5dGhvbi1ib3RvMy9weXRob24tYm90bzMubWsgYi9wYWNrYWdlL3B5dGhvbi1ib3RvMy9weXRo
b24tYm90bzMubWsKaW5kZXggNGE4OGUxMTVjZi4uODM5MGU4ZDMxMCAxMDA2NDQKLS0tIGEvcGFj
a2FnZS9weXRob24tYm90bzMvcHl0aG9uLWJvdG8zLm1rCisrKyBiL3BhY2thZ2UvcHl0aG9uLWJv
dG8zL3B5dGhvbi1ib3RvMy5tawpAQCAtNCw5ICs0LDkgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjCiAKLVBZVEhPTl9CT1RPM19WRVJTSU9OID0gMS40My4xCitQWVRIT05fQk9UTzNfVkVS
U0lPTiA9IDEuNDMuMTAzCiBQWVRIT05fQk9UTzNfU09VUkNFID0gYm90bzMtJChQWVRIT05fQk9U
TzNfVkVSU0lPTikudGFyLmd6Ci1QWVRIT05fQk9UTzNfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0
aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy85OC8zNi8wMjhjMTJlZDZlZDg1MDA5YTIxYjU0NzJlYjc2
YzI3ZjliMDM0MWM2OTg2ZjA2ZjgzNDc1YjQwYWFmNTEKK1BZVEhPTl9CT1RPM19TSVRFID0gaHR0
cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzQ2LzU5LzAxMjg5OGQ3ODA4NzEw
NWU5YzIwZmUzMTYwNWQzZjE5OTk5MjE3NDVlMTg5MGVlMGYwZDk5Mzg0NmUyZQogUFlUSE9OX0JP
VE8zX1NFVFVQX1RZUEUgPSBzZXR1cHRvb2xzCiBQWVRIT05fQk9UTzNfTElDRU5TRSA9IEFwYWNo
ZS0yLjAKIFBZVEhPTl9CT1RPM19MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQotLSAKMi40Ny4zCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
