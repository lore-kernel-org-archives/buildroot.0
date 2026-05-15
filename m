Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF14CD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 15:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4684B84311;
	Fri, 15 May 2026 15:11:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FmSLFlesSfLT; Fri, 15 May 2026 15:11:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 465248430E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778857916;
	bh=i6qpDrSenlwvWMpgl58gYZwpHxONsspuxBcNQxQ0kdk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CcKKPBGdEPzgi7Igq7TBrD/UMMrv/PN1JKT2x3Aux3rzMD+h9YrZtdxwTudM4xV07
	 QrYbMjONVBeQkj+RyqTKk9v87XWaYMO0M10keHfTXfD9pqlivl1yIyXpy5K/Cb+deg
	 KsZ1J5UNv56NuMvr/dsN2vQyj6L2vwdchGd3rwP5RJ8DYXQbw2nbbMsTX2MD0tMOmk
	 6W5nC0ocYCgV2GtOe1G+HTBtXvnwZbUFtJO8fam+U9HC/YwJVXzGsYDmJ+VavJaWvJ
	 mjMbldW7yHu9aRJNP2YUaac3IVWJy/I6JJAkGgKrj6UvNvvewislc2dHB16gO73ybQ
	 NRTv4ldcqyA6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 465248430E;
	Fri, 15 May 2026 15:11:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 04579E7
 for <buildroot@buildroot.org>; Fri, 15 May 2026 15:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA2C68430E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 15:11:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dLOO5426gqDi for <buildroot@buildroot.org>;
 Fri, 15 May 2026 15:11:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C45328430D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C45328430D
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C45328430D
 for <buildroot@buildroot.org>; Fri, 15 May 2026 15:11:53 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-45562c41ec7so4817995f8f.1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 08:11:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778857912; x=1779462712;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oIo7ri5+4DR1bfJeq/EvmPD2TI80/piSluKBMVdQ6CU=;
 b=c4p351WY9Lh4qYkmaxnABcVdF/loR3O7oTO7coZ2d2JBf1nzas4fzmt2PRFTiXPgSX
 TA3ofz5bd4b7gyC84FbbAKiak3T1Pl6flJfDJtuTenh3KYIhqyyXVt5Nx8uP1rQ1ECJW
 Az0iVEH1tWBlm2j/OhA92giovO4Zk+ExzouH7uOLUIHSmscyzzZUeAp8/4rUdSgQYxRT
 wt/sdLa/7pgA6YHpqFRE5YSgYHTBK3rwIqK9LzLPendENuUwF+mNP41Gsm2ZM/wGggu/
 FNn3NfUHMU06ckssBt0I32amsQNSg5MC9rbh6AMGbZBI2BkGJe5Ff3QnW2/P8o3VB/cd
 uSWQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/fsN7Y2H77H3XEkTBSptplhc4TJF66jhvjJudSI1URJng7BgvmhhqEA/0x08w/CrbE1j0tDnVZPcA=@buildroot.org
X-Gm-Message-State: AOJu0Yxm0FoaUCG8CcDHsVM2eFVUnwL236bZ1g+TyEBFok5Wt9mst/e5
 UmsVRY2TA3TOPI3XXlecvcz29GzM6+LNaQeavTDVEKM6vL+NSPufHounVo+FGp68+co=
X-Gm-Gg: Acq92OFTDeOWS0TC0Zs7WeEJ4jhYIZi3UonD/hc2s8KvahgGYvJConJi/h48/QBGQk4
 r4f67h31tTf93sob0bnZoT9SAjkhKt7pCSQQA6Ukpej/YUQzNPdnDIELS9zGtadYJGKYWwR+9n6
 O8nojh6kdFU4TKXURXiZ3C/Ut5FFgTo4Eatuwcef7OzOTvSOoNArMHz3mhk5adAhTnFTlm6YkuR
 oc82znYN+zyX7VBAL09NpOJdvj3XDlcoOJG7QBEwaZjKswQ9wYAiA+kELtQ47gxNPWeVX52Zdpj
 DnQU6K3qeOo7nK3O1oGdEijc/Vrk3cYtBd2u7gx5bgFxSLkCX8JyJ8KCzmqnP0jLCJz9YNBP/iO
 j5eGXVmxmLJWFEKWdaVMJTPRmzsxeUQ1l7v3vGp71qthhEGpXX5fEbdutTLO2vcpKpJIHlDL9wu
 QURUd2YmGBfWxVc33lSvfMKO4qDYk2ChA5QIyqLzJNcdpo299yB9QGNJAwmUqYV75WYYqdrP2Gp
 ciJBtNnR+ZRahQkJufsEC1Ur5TAT/meBOUFhx88Rm2vKfBS8/kEOspf5jeJEWNKJw==
X-Received: by 2002:a05:6000:22c5:b0:43c:f5a0:4e56 with SMTP id
 ffacd0b85a97d-45e5c5f9d94mr5824239f8f.42.1778857911686; 
 Fri, 15 May 2026 08:11:51 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0fe222bsm12374239f8f.27.2026.05.15.08.11.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 08:11:51 -0700 (PDT)
Message-ID: <dcc7125e-a944-427f-a3b3-21de76c6f983@smile.fr>
Date: Fri, 15 May 2026 17:11:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>
References: <20251229170331.1299723-1-giulio.benetti@benettiengineering.com>
Content-Language: fr
In-Reply-To: <20251229170331.1299723-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1778857912; x=1779462712; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oIo7ri5+4DR1bfJeq/EvmPD2TI80/piSluKBMVdQ6CU=;
 b=uMiXygGhYR9dELTqeQFhVlyrATZR+m8lsTtC0vtzhvwfxn5J7hohnjSib558vQZzn8
 TXmKrpQeqM9Ad57WNb0Iq0T3U7g0TVC83bzvsA+mpcRI7jqFJOddlkqKkrlozB9Z+Rx+
 Jab8CUxYtfmgGuFlhdAFuYXPYrT2BbttX7Q4k=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=uMiXygGh
Subject: Re: [Buildroot] [PATCH] package/libnss: fix Makefile ifndef
 FREEBL_NO_DEPEND
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gR2l1bGlvLAoKTGUgMjkvMTIvMjAyNSDDoCAxODowMywgR2l1bGlvIEJlbmV0dGkgYSDD
qWNyaXTCoDoKPiBOU1MgTWFrZWZpbGUgYnVpbGQgc3lzdGVtIGlzIHByZXR0eSB3ZWFrIGlmIHVz
ZWQgd2l0aCBwYXJhbGxlbCBidWlsZC4gSW4KPiB0aGlzIGNhc2Ugd2hhdCBoYXBwZW5zIGlzIHRo
YXQgJ2lmbmRlZiBGUkVFQkxfTk9fREVQRU5EJyBhcHBlYXJzIGluCj4gbGliL2ZyZWVibC9tYW5p
ZmVzdC5tbiBhbmQgY29yZWNvbmYvTGludXgubWsuIFdoZW4gcGFyYWxsZWwgYnVpbGRpbmcKPiB2
YXJpYWJsZSBGUkVFQkxfTk9fREVQRU5EIGdldHMgZGVmaW5lZCBpZiBub3QgZGVmaW5lZCB0byAx
LCBidXQgaW4gdGhlCj4gMiBvY2N1cmVuY2VzIHdlIGVuZCB1cCBoYXZpbmcgb24gdmFyaWFibGUg
c2V0IHRvIDEgYW5kIDEgc3RpbGwgbm90Cj4gZGVmaW5lZC4gVGhpcyByZXN1bHRzIGluOgo+IGAK
PiAvaG9tZS9naXVsaW9iZW5ldHRpL2JyLXJlcHJvZHVjZS8zZTA0NmM5OTY4MjU0NDdmNDgzNzdm
N2M0MzYxYjVkYjI2Yjg0Zjk1L291dHB1dC9ob3N0L2xpYi9nY2MvYXJtLWJ1aWxkcm9vdC1saW51
eC1tdXNsZWFiaS8xNC4zLjAvLi4vLi4vLi4vLi4vYXJtLWJ1aWxkcm9vdC1saW51eC1tdXNsZWFi
aS9iaW4vbGQ6IExpbnV4Mi42X2FybV9hcm0tYnVpbGRyb290LWxpbnV4LW11c2xlYWJpLWdjYy5i
cl9yZWFsX2dsaWJjX1BUSF9EQkcuT0JKL0xpbnV4X1NJTkdMRV9TSExJQi9sb3doYXNoX3ZlY3Rv
ci5vOiBpbiBmdW5jdGlvbiBgbG9hZGVyX0dldE9yaWdpbmFsUGF0aG5hbWUnOgo+IGxvd2hhc2hf
dmVjdG9yLmM6KC50ZXh0LmxvYWRlcl9HZXRPcmlnaW5hbFBhdGhuYW1lKzB4NjgpOiB1bmRlZmlu
ZWQgcmVmZXJlbmNlIHRvIGBQUl9TZXRFcnJvcicKPiBjb2xsZWN0MjogZXJyb3I6IGxkIHJldHVy
bmVkIDEgZXhpdCBzdGF0dXMKPiBgCj4gU28gbGV0J3MgcGFzcyBGUkVFQkxfTk9fREVQRU5EPTEg
d2hlbiBidWlsZGluZyB0byBkZWZpbmUgdGhhdCB2YXJpYWJsZQo+IGluc3RlYWQgdG8gbGV0IE5T
UyBNYWtlZmlsZSB0byBjYWxjdWxhdGUgaXQuCj4gCj4gRml4ZXM6Cj4gaHR0cHM6Ly9hdXRvYnVp
bGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2FkNC9hZDQwNTM2NzI4MzAzYzU2ZDFkMDk2OGUzOGFj
MzZkYTEyY2NhNDE2Ly8KCk5vdGU6IEZlZG9yYSBzZWVtcyB0byBzZXQgRlJFRUJMX05PX0RFUEVO
RD0xIHRvIGJ1aWxkIHRoZWlyIG5zcyBwYWNrYWdlOgpodHRwczovL3NyYy5mZWRvcmFwcm9qZWN0
Lm9yZy9ycG1zL25zcy9ibG9iL3Jhd2hpZGUvZi9uc3Muc3BlYyNfNjc2CgpBcHBsaWVkIHRvIG1h
c3Rlci4gVGhhbmtzLgoKQmVzdCByZWdhcmRzLApSb21haW4KCj4gCj4gU2lnbmVkLW9mZi1ieTog
R2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+Cj4g
LS0tCj4gIHBhY2thZ2UvbGlibnNzL2xpYm5zcy5tayB8IDYgKysrKy0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvbGlibnNzL2xpYm5zcy5tayBiL3BhY2thZ2UvbGlibnNzL2xpYm5zcy5tawo+IGluZGV4
IGI2YmU2ZGJjOGMuLmRiNzFjMDAxOGQgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9saWJuc3MvbGli
bnNzLm1rCj4gKysrIGIvcGFja2FnZS9saWJuc3MvbGlibnNzLm1rCj4gQEAgLTU3LDcgKzU3LDgg
QEAgTElCTlNTX0JVSUxEX1ZBUlMgPSBcCj4gIAlPU19BUkNIPSJMaW51eCIgXAo+ICAJT1NfUkVM
RUFTRT0iMi42IiBcCj4gIAlPU19URVNUPSQoQlIyX1BBQ0tBR0VfTElCTlNTX0FSQ0gpIFwKPiAt
CU5TU19FTkFCTEVfV0VSUk9SPTAKPiArCU5TU19FTkFCTEVfV0VSUk9SPTAgXAo+ICsJRlJFRUJM
X05PX0RFUEVORD0xCj4gIAo+ICBpZmVxICgkKEJSMl9QT1dFUlBDX0NQVV9IQVNfQUxUSVZFQyks
KQo+ICAjIERpc2FibGUgQWx0aXZlYyBpZiBub3Qgc3VwcG9ydGVkCj4gQEAgLTEzNiw3ICsxMzcs
OCBAQCBIT1NUX0xJQk5TU19CVUlMRF9WQVJTID0gXAo+ICAJTlNTX1VTRV9TWVNURU1fU1FMSVRF
PTEgXAo+ICAJU1FMSVRFX0lOQ0xVREVfRElSPSQoSE9TVF9ESVIpL2luY2x1ZGUgXAo+ICAJWkxJ
Ql9JTkNMVURFX0RJUj0kKEhPU1RfRElSKS9pbmNsdWRlIFwKPiAtCU5TU19FTkFCTEVfV0VSUk9S
PTAKPiArCU5TU19FTkFCTEVfV0VSUk9SPTAgXAo+ICsJRlJFRUJMX05PX0RFUEVORD0xCj4gIAo+
ICBIT1NUX0xJQk5TU19ERVBFTkRFTkNJRVMgPSBob3N0LWxpYm5zcHIgaG9zdC1zcWxpdGUgaG9z
dC16bGliCj4gIAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
