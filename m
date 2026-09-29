Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B08CA5FA7
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB62A80F66;
	Tue, 29 Sep 2026 18:38:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yI-6DQXmdRxn; Tue, 29 Sep 2026 18:38:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0ED9D80F7D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707133;
	b=LwDN8SBvUa79frq6/ikvg+1QydWmjoBgNw4l2oGvidXYk674axtBxuDtEyChjnRLybUF
	 8m4IzlECI7+6uTGQDgLCHnG42cB87VEwCSRfnLGgN6V/Y7pGbqlr5EHKnvio4GquOcPOu
	 oek4TLyIy0lwvq9qf9jjKP9Env4dex/99NatHlvyiOgFpHrqRHtg/7SxebfNb2EuQbqX2
	 ZdOgCjr2Q7KWQWdOdhomreZCtOwS1yTuEYF/T2iEONkedqy2ykomr9tOGeb2+rJh3dKYO
	 Cf1s2RUuhYwQoF2THGLkXqDgK7Fpj+no2g//IUQ5vc16vUdvoBQbbso41SWI/TNxtSg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707133;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=YQbtep1GjKztyXO+XVMuIFrCesnCvpPxiza9gjCKZX0=;
	b=aclHOWu/ONmW5Is59wkQWPwlcQ665biEAphKJWbW8/kxQN01w3VkQdke2yqiJ/EK6zca
	 kGK0BD1LiV9sKdvYj4k3Xg51yDZxvEtvqppZkblY5jdXSoG33mXQwlIusUf0QPqLikgpa
	 LJeErbd4TP2+TIGYQmfrXj5Bc7mEVupe7meZnu5d7X/bgB3NhmImu5KjKeKrSTXacs/bv
	 VyNaSHKXWVOOWb/IRTZDpAWiXAMgGHEZC6ZX/fzHJsKTcTYTTw4e6ihZ/vFaCLnYAf0E5
	 +TBXX5JkbTgViuoSnrbU9+IWyEH2nk7e2sPuXWLwQuRS0Wxr0WvilNenRETPV4KJlXg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707133;
	bh=YQbtep1GjKztyXO+XVMuIFrCesnCvpPxiza9gjCKZX0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S4LmyAJbdB5pkB6nhIZsxKUFhYC8eYQNGP7NskU1UWv3Zk1oKN2cWLQdRur+t5SBU
	 ojjKyN0XT6XC6f/fAIjbTycpvYAjaMs2PXOzPfKpwu7GZmC5QCGLjckiOO1oNpaA6i
	 32EjsK1kptj5L1oH+ZBbajstXLjJJ3N86JksI1tUHVMmf10YnNIlEXvziEzzpP7Nz0
	 xPl+zBVIqMmDi9q5oq7/GmqG1DiiqNVgRBElsa1jxDDDGoF7kvGjVSUFDLFH5uJQin
	 F06BLjwBcfb0ul1rTg3rUamrouN5jH4UyE8ZktZfUttXjqc7P8B0SWz45Muki74yu+
	 WRqzhhSYKeevA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0ED9D80F7D;
	Tue, 29 Sep 2026 18:38:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 939133D8
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 913E94032B
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:38:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q9NvK6m_j_0V for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:38:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org BE577400D5
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707131;
 b=j6J48AMspbMMK2gxIg8GT1eZtPC5JI4U364Od5bajKluLuxrFWGD+yIYVac9bruopxB0
 pt7BOXIPhIUnR875aK5kwjbz0EAU3MJMU7rHj6dyoTlYKYZqyuTgeiljPZuUwHoP0kWkP
 QYjuMpgBII/VRNtBnWqwwl6tHqkfEL3KjszQZg4oBM+9/e/Ko//jvcfqPUTcLki9V6g8I
 is1qoSbgg7enY5w33z/PD4ZUdH7DoXBuEYaTHsGLFdqSeofdFqtGjPXVajFwW/wqRwMeg
 R3J/+0L3Bn/OTJOZycfWeXHHqZ4+rpS/XIz0URtHZqhqGE5t2CjPexh5z1hHCPjTeUg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707131;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=i4E79ACSjbp87B0JexCcjSKBmD0ULIhZSkRGVtInlNk=;
 b=j/USsNy4XCdStYSFPMASrrsJ0g69rVsOGHI4EGMoq+f2kztyaqK7ScCF5tIzXrK3EDY/
 LreQ3OizuWtAYN8MjjDSvK4mAcS9lbQjGWj79M2ABOFice5tJUIJxF0yzPUorn3Dh8FY6
 5/NbZYao550N6mdcQZyfLQzhtf7ZQE0yXJHNE6gio3JcqUh1dN/2mt48lGAxkz/T/secJ
 v9mi305hOnrBAPjb9GSb/D7t60bUj9HUFXGkIYenn/yKRvyn+9bNrKQZON2q8yqUrOu46
 cRlzIHytv6PANbakWVuzEd2xZ6BuGwCEuSrqIq0toX0U1IzbeSn+raANGAEv6wVdSFA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=SiPh5qij; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=SiPh5qij
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE577400D5
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707022;
 bh=i4E79ACSjbp87B0JexCcjSKBmD0ULIhZSkRGVtInlNk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=SiPh5qijnCe3SXcTA/cD7Quv50OVmi8UXfyCqgU+uw0qBBo1FguE45SEk0Ki9bn+j
 v/NvaJzANkTLs/xA7wpQt3c6VfBuq5X1bnAdlPMS7rpD7y6yEcg1Q78meWdCQN3SQT
 d0UtXJRIE/bDdMQkUTBCYkulxtCJyZLepE7nAPx13yxk4wf/eeRyoUKxsAw2KI5hs1
 cS9j6s03PDHvp8GQq7ElxC988ZGstSuX5tst/HKrySYkpzqpFUEMyUFDwRuexSskGd
 P5qAcyjy2OHaQ8WqQNEuxv7ToYUUoQT2O8EocMEqahoVm12ubrQWjROcPwZdrPLvcG
 L7gRpURbP69jw==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 UP0xYO48Kc08UdG+KAlHerdy8bxEFOqW32YsHOP9Kgadz8VzPrgbR07WY8DZZj4aIC6uL1dSoUo
 MegRFl3AyC/GiIMOJYzGFDZtfEJZGG+bZkjhYUm2M+nRNTScuRnjOcXaAxksReMLaH181+Ido8U
 UplBFTXO7FylDkprnYo40Tb/wtf79T83Yc0ckaq0bsJc8Q2BbeiFvHBWDMLtMCEmWXgyoswPn/N
 wHtgHWWdxFGDQsVqYmPXv1SLXa8oRNgPiOfSLdpj6MBQgG+Ro2KHQNs+qhVBw/7zeeLIZk9ZAYs
 efZki0ZXEStZ+Q8CdBaCoR9msey03WpyYVwTVWiUA14fLVwi7fLSJyXEZeBmxBoVvvHtwQR+Hwc
 a4ymLrxRWBbyNxVJ98Co81rnsxxpNGybwWh6Gy779K1A1zJL89EGbYvn9Ez3ucsg+TRNUCsoL+G
 GK7d2bxf4WqkB887uHjXa0XBlDOdQCV2YHVqRJQD77UnG/zosKZzVfsSpRzPYHS7DqKz+TWNpeA
 OQqToI1zTQUHzGbbWEbK2MqlY6gVSHhYYaVHcptof395wHS9zP+7M84Fu6FQocQdTdETSJzVPv8
 DfbncVLI064nE7w1CQBB6+OI8VR5A+rtohMbbmxZe6GADj0ISzQNFimiMdwa4Ah2IYU97AUG
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1075CA4C518F;
 Tue, 29 Sep 2026 20:37:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgn-000000006Jn-0VCl;
 Tue, 29 Sep 2026 18:36:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>
Date: Tue, 29 Sep 2026 20:36:01 +0200
Message-ID: <20260929183607.1849293-63-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v7 62/66] package/trousers: Fix build with
 OpenSSL 4.0.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KQ2M6IE5vw6kgUnVi
aW5zdGVpbiA8bm9lLnJ1Ymluc3RlaW5AZ21haWwuY29tPgotLS0KIHBhY2thZ2UvdHJvdXNlcnMv
MDAwNC1vcGVuc3NsNC5wYXRjaCB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZp
bGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uv
dHJvdXNlcnMvMDAwNC1vcGVuc3NsNC5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvdHJvdXNl
cnMvMDAwNC1vcGVuc3NsNC5wYXRjaCBiL3BhY2thZ2UvdHJvdXNlcnMvMDAwNC1vcGVuc3NsNC5w
YXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi41ZWY2Y2IxOWIwCi0t
LSAvZGV2L251bGwKKysrIGIvcGFja2FnZS90cm91c2Vycy8wMDA0LW9wZW5zc2w0LnBhdGNoCkBA
IC0wLDAgKzEsMjYgQEAKK0Rlc2NyaXB0aW9uOiBGaXggZm9yIE9wZW5TU0w0IGNvbXBhdGliaWxp
dHkKKyBSZXBsYWNlIGRpcmVjdCBhY2Nlc3MgdG8gb3BhcXVlIEFTTjFfT0NURVRfU1RSSU5HLT5k
YXRhIGZpZWxkIHdpdGgKKyBBU04xX1NUUklOR19nZXQwX2RhdGEoKSBhY2Nlc3Nvci4gQVNOMV9T
VFJJTkcgaXMgZnVsbHkgb3BhcXVlIGluIE9wZW5TU0wgNC4wLgorQXV0aG9yOiBSYXZpIEthbnQg
U2hhcm1hIDxyYXZpLmthbnQuc2hhcm1hQGNhbm9uaWNhbC5jb20+CitCdWctVWJ1bnR1OiBodHRw
czovL2J1Z3MubGF1bmNocGFkLm5ldC9idWdzLzIxNTUwMDMKK0J1Zy1EZWJpYW46IGh0dHBzOi8v
YnVncy5kZWJpYW4ub3JnLzExMzg0NTEKK0ZvcndhcmRlZDogbm8KKworUGF0Y2ggZG93bmxvYWRl
ZCBmcm9tIERlYmlhbjoKK2h0dHBzOi8vYnVncy5kZWJpYW4ub3JnL2NnaS1iaW4vYnVncmVwb3J0
LmNnaT9idWc9MTEzODQ1MSMxMgorCitVcHN0cmVhbTogaHR0cHM6Ly9zb3VyY2Vmb3JnZS5uZXQv
cC90cm91c2Vycy9idWdzLzI0MC8KKworU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5k
QGt1aGxzLm5ldD4KKworLS0tIGEvc3JjL3RzcGkvdHNwaV9hc24xLmMKKysrKyBiL3NyYy90c3Bp
L3RzcGlfYXNuMS5jCitAQCAtMjM3LDcgKzIzNyw3IEBACisgCisgCWlmICgqcmF3QmxvYlNpemUg
IT0gMCkgeworIAkJaWYgKGRlY0Jsb2JTaXplIDw9ICpyYXdCbG9iU2l6ZSkgeworLQkJCW1lbWNw
eShyYXdCbG9iLCB0c3NCbG9iLT5ibG9iLT5kYXRhLCBkZWNCbG9iU2l6ZSk7CisrCQkJbWVtY3B5
KHJhd0Jsb2IsIEFTTjFfU1RSSU5HX2dldDBfZGF0YSh0c3NCbG9iLT5ibG9iKSwgZGVjQmxvYlNp
emUpOworIAkJfQorIAkJZWxzZSB7CisgCQkJVFNTX0JMT0JfZnJlZSh0c3NCbG9iKTsKLS0gCjIu
NDcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
