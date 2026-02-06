Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC19EB28E2
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 08:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 402826114A;
	Fri,  6 Feb 2026 08:11:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0P5A6QvZq7Jx; Fri,  6 Feb 2026 08:11:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19C83611C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770365503;
	bh=pGAazw2YfSxrfXNln9HCX51rxSbCTZHnZNvS00lKECk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UkFu1lucOApNzBrs6vOM9BNufFWZdEnMdorhoTaHZFq3/ehN85SCde7JD2eKXeBnA
	 iTjcXxSHyjUhujTDt8mwDQRzSeEqr/m0ksJ2/3rkUG43jgQuPeAwYZ1Il8U2cRbixu
	 WtDelPtSX58sb23FtiEUnB9m9c1OtU88gC/nLzWNLlzhmyjgeLt0Tl+V4ktLON5xJp
	 8wzm9MXbHW7PzoZoDBVPmcAa1ZmHKZCk0W1hROgZtylzPVbd1hytUd28TS2MhpRXAK
	 1qQIsuZcZI01vP1HVUTFN4DDkrPEcBVV7W1vcjYzCne2DyK8a4J0srG6w4TlPaKfsx
	 lVRQQiPwfL6sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19C83611C7;
	Fri,  6 Feb 2026 08:11:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D992173
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BCC8408E9
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7gwO_DNmnSH4 for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 08:11:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0D703408D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D703408D4
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D703408D4
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:34 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4806e0f6b69so13406185e9.3
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 00:11:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770365493; x=1770970293;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GRyRIbUnyCWr1TMpWfaSGIorERsQyG4sKISfNhuyhMw=;
 b=GW2Wj+tVTPefJ25/bpgYxXLuOiZbvgNgam+oF/V4rWwX6D7UYzZjWw0VyFEhjLTbdK
 9VrRFyHd9AMFz4IoikJNTvn4A4IFRCb2qpsQ9NDjuZKo3BlVSdVXiWg37hmaJv7BCuQB
 bwTAyHS8IRysuq1Mo2v320MdEnz0NprPrMxC9+82HV26E1zQGm7C6ZoMjGrqJ1D9nvGO
 XxmuPueWe2NQ53a8x6GewCTGbPXqpwLKrm8FNdIkTrRzBMVMrTvmIeIkP4SEdPcL9gMv
 JVUoItMBEw+7CBU7uuznIZgfICq/oF4kdY2hdHa+pNFuEvD47txyllKpo3zSHTWhu8v/
 RNgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUD0vT8AyELoReqqfjzFotMIjPhkN5PZe+xJ3VMMypGA00POmx5667idBdG77DdyNUtovVs9U3YbDg=@buildroot.org
X-Gm-Message-State: AOJu0YxGz2yGOM14V+VM1zsgfoIRq8XxQ5QwzPYF4TUBQ2x7x/XHuANt
 I3g2/MTd/WeCHH6M/NMLoXRWJtGC/nkU1BeKigzGtb5LFBnrZkNynaJICSAJp7+IeaE=
X-Gm-Gg: AZuq6aKezt2X7lITdxXNbOo7AjQIXOVhEAg+XF9lR9WQFa4cAKkfiKz1Q4CCBWXVAUX
 BRiiiX2oSx7KHxSqqdOeszN8nYLOkRTeUCMOR29aR3Ob+kfSjX3pFt2GubPPpgzSCsnLWxe5wQk
 P1Mj9cTXmzr2VKLKKKrquy8JCmiaUyAMYmjZzJSXE8dFsuxkw49h8aNEUbImmUp2ASIR5W8x3B3
 v2atqlHka9LRQrlYkPB4jM1YG8iF9KF6OFB7XDykGWmrqlazazPs+4eXAeSsrWjMM19+47pTwu2
 DrelIjqBJ6/feUkvyPdx9JBmdoV5apaD0xLfykeoV513K1kgGdKqwrzeisxDqhs2TkSB5TZsBw9
 kRVqxYCSH9YqxXZ/nBdTFNbxE1uaNMWiXx4mIxSJ0UZas8YQ6KJq0pQBqrbJOx3zPwb6FKOVMc8
 0lJ4nwenT0uXyPSw==
X-Received: by 2002:a05:600c:c04b:20b0:477:7af8:c88b with SMTP id
 5b1f17b1804b1-483201dd234mr18562205e9.11.1770365492919; 
 Fri, 06 Feb 2026 00:11:32 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48320961505sm23685545e9.4.2026.02.06.00.11.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:11:32 -0800 (PST)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Feb 2026 09:11:31 +0100
Message-ID: <20260206081132.31810-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128090645.1023133-1-peter@korsgaard.com>
References: <20260128090645.1023133-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770365493; x=1770970293; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GRyRIbUnyCWr1TMpWfaSGIorERsQyG4sKISfNhuyhMw=;
 b=ZijfDKm3X0glILZw5v44FwPnYjArOG4Qw+RYUTAhL1a+lQiPRLh+TK906LhoU2rJH7
 bk1qARF7r7eDhaR96uI++E3pYt09+iBm7ginBF2kf7gqpb+avEmGkG7XWPaYRiOJ9iqb
 qTSIj2xC/EIoCfBZyWznFzZm2U8mzyV4ieoU+GbJxPaQleDk4ORPxS8oBV6wFX5uqZs/
 ov6pfe90UQjie4cipLEyh2ZUZxI05UUkeARXgHTOl5BjNly7p6nxLWesUzOnt9Xgh6oT
 z11wQHO50wdrTUfqLrI2gB4r7/KAVudAZ+rxdiVFw5YGBkTMW4MGYRV1lRnq4UxsXAju
 tOrw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZijfDKm3
Subject: Re: [Buildroot] [PATCH] package/libopenssl: security bump to
 version 3.6.1
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyB2dWxuZXJhYmlsaXRpZXM6Cj4gCj4g
Q1ZFLTIwMjUtMTExODcgLSBJbXByb3BlciB2YWxpZGF0aW9uIG9mIFBCTUFDMSBwYXJhbWV0ZXJz
IGluIFBLQ1MjMTIgTUFDIHZlcmlmaWNhdGlvbi4KPiBDVkUtMjAyNS0xNTQ2NyAtIFN0YWNrIGJ1
ZmZlciBvdmVyZmxvdyBpbiBDTVMgQXV0aEVudmVsb3BlZERhdGEgcGFyc2luZy4KPiBDVkUtMjAy
NS0xNTQ2OCAtIE5VTEwgZGVyZWZlcmVuY2UgaW4gU1NMX0NJUEhFUl9maW5kKCkgZnVuY3Rpb24g
b24gdW5rbm93biBjaXBoZXIgSUQuCj4gQ1ZFLTIwMjUtMTU0NjkgLSDigJhvcGVuc3NsIGRnc3Ti
gJkgb25lLXNob3QgY29kZXBhdGggc2lsZW50bHkgdHJ1bmNhdGVzIGlucHV0cyA+MTZNQi4KPiBD
VkUtMjAyNS02NjE5OSAtIFRMUyAxLjMgQ29tcHJlc3NlZENlcnRpZmljYXRlIGV4Y2Vzc2l2ZSBt
ZW1vcnkgYWxsb2NhdGlvbi4KPiBDVkUtMjAyNS02ODE2MCAtIEhlYXAgb3V0LW9mLWJvdW5kcyB3
cml0ZSBpbiBCSU9fZl9saW5lYnVmZmVyIG9uIHNob3J0IHdyaXRlcy4KPiBDVkUtMjAyNS02OTQx
OCAtIFVuYXV0aGVudGljYXRlZC91bmVuY3J5cHRlZCB0cmFpbGluZyBieXRlcyB3aXRoIGxvdy1s
ZXZlbCBPQ0IgZnVuY3Rpb24gY2FsbHMKPiBDVkUtMjAyNS02OTQxOSAtIE91dCBvZiBib3VuZHMg
d3JpdGUgaW4gUEtDUzEyX2dldF9mcmllbmRseW5hbWUoKSBVVEYtOCBjb252ZXJzaW9uLgo+IENW
RS0yMDI1LTY5NDIwIC0gTWlzc2luZyBBU04xX1RZUEUgdmFsaWRhdGlvbiBpbiBUU19SRVNQX3Zl
cmlmeV9yZXNwb25zZSgpIGZ1bmN0aW9uLgo+IENWRS0yMDI1LTY5NDIxIC0gTlVMTCBQb2ludGVy
IERlcmVmZXJlbmNlIGluIFBLQ1MxMl9pdGVtX2RlY3J5cHRfZDJpX2V4IGZ1bmN0aW9uCj4gQ1ZF
LTIwMjYtMjI3OTUgLSBNaXNzaW5nIEFTTjFfVFlQRSB2YWxpZGF0aW9uIGluIFBLQ1MjMTIgcGFy
c2luZwo+IENWRS0yMDI2LTIyNzk2IC0gQVNOMV9UWVBFIFR5cGUgQ29uZnVzaW9uIGluIHRoZSBQ
S0NTN19kaWdlc3RfZnJvbV9hdHRyaWJ1dGVzKCkgZnVuY3Rpb24KPiAKPiBGb3IgbW9yZSBkZXRh
aWxzLCBzZWUgdGhlIGFubm91bmNlbWVudDoKPiBodHRwczovL29wZW5zc2wtbGlicmFyeS5vcmcv
cG9zdC8yMDI2LTAxLTI3LXJlbGVhc2UtYW5ub3VuY2VtZW50Lwo+IAo+IERyb3Agbm93IHVwc3Ry
ZWFtZWQgMDAwNC1TY29wZS1hZXNfY2ZiMTI4X3ZhZXNfZW5jZGVjX3dyYXBwZXItdG8teDY0LnBh
dGNoOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuc3NsL29wZW5zc2wvY29tbWl0L2Y1MjlkMjY1
OTE1NTg4MzAyNmNjNWZlMWUzYTU2MGMyNzRkYTg2YjkKPiAKPiBTaWduZWQtb2ZmLWJ5OiBQZXRl
ciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+CgpBcHBsaWVkIHRvIDIwMjUuMTEueC4g
VGhhbmtzCgo+IC0tLQo+ICAuLi5lc19jZmIxMjhfdmFlc19lbmNkZWNfd3JhcHBlci10by14NjQu
cGF0Y2ggfCAzNiAtLS0tLS0tLS0tLS0tLS0tLS0tCj4gIHBhY2thZ2UvbGlib3BlbnNzbC9saWJv
cGVuc3NsLmhhc2ggICAgICAgICAgICB8ICA0ICstLQo+ICBwYWNrYWdlL2xpYm9wZW5zc2wvbGli
b3BlbnNzbC5tayAgICAgICAgICAgICAgfCAgMiArLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMzkgZGVsZXRpb25zKC0pCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdl
L2xpYm9wZW5zc2wvMDAwNC1TY29wZS1hZXNfY2ZiMTI4X3ZhZXNfZW5jZGVjX3dyYXBwZXItdG8t
eDY0LnBhdGNoCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlib3BlbnNzbC8wMDA0LVNjb3Bl
LWFlc19jZmIxMjhfdmFlc19lbmNkZWNfd3JhcHBlci10by14NjQucGF0Y2ggYi9wYWNrYWdlL2xp
Ym9wZW5zc2wvMDAwNC1TY29wZS1hZXNfY2ZiMTI4X3ZhZXNfZW5jZGVjX3dyYXBwZXItdG8teDY0
LnBhdGNoCj4gZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggYWI0Y2Y4OGE0MC4uMDAw
MDAwMDAwMAo+IC0tLSBhL3BhY2thZ2UvbGlib3BlbnNzbC8wMDA0LVNjb3BlLWFlc19jZmIxMjhf
dmFlc19lbmNkZWNfd3JhcHBlci10by14NjQucGF0Y2gKPiArKysgL2Rldi9udWxsCj4gQEAgLTEs
MzYgKzAsMCBAQAo+IC1Gcm9tIGEzN2QzMTZlNjQzYTRjMmJlNDcwOGQ1MDRjYzNlY2JmMzdlYzE3
NzMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gLUZyb206IEthaSBQYXN0b3IgPGRnMHl0QGRh
cmMuZGU+Cj4gLURhdGU6IFdlZCwgOCBPY3QgMjAyNSAxODo1MDozMyArMDIwMAo+IC1TdWJqZWN0
OiBbUEFUQ0hdIFNjb3BlIGFlc19jZmIxMjhfdmFlc19lbmNkZWNfd3JhcHBlciB0byB4NjQKPiAt
Cj4gLVRoaXMgZnVuY3Rpb24gaXMgb25seSB1c2VkIG9uIHg2NCBhbmQgcmVsaWVzIG9uIG90aGVy
IGZ1bmN0aW9ucyB3aGljaAo+IC1hcmUgb25seSBpbXBsZW1lbnRlZCBmb3IgeDY0Lgo+IC1GaXhl
cyAjMjg3NDUuCj4gLQo+IC1VcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL29wZW5zc2wvb3Bl
bnNzbC9wdWxsLzI4NzkyCj4gLQo+IC1TaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRA
a3VobHMubmV0Pgo+IC0tLS0KPiAtIHByb3ZpZGVycy9pbXBsZW1lbnRhdGlvbnMvY2lwaGVycy9j
aXBoZXJfYWVzX2NmYl9od19hZXNuaS5pbmMgfCAyICsrCj4gLSAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspCj4gLQo+IC1kaWZmIC0tZ2l0IGEvcHJvdmlkZXJzL2ltcGxlbWVudGF0aW9u
cy9jaXBoZXJzL2NpcGhlcl9hZXNfY2ZiX2h3X2Flc25pLmluYyBiL3Byb3ZpZGVycy9pbXBsZW1l
bnRhdGlvbnMvY2lwaGVycy9jaXBoZXJfYWVzX2NmYl9od19hZXNuaS5pbmMKPiAtaW5kZXggZDU1
NzdkMDBmMTMyZS4uZWI4ZTAxNjRhYzllZCAxMDA2NDQKPiAtLS0tIGEvcHJvdmlkZXJzL2ltcGxl
bWVudGF0aW9ucy9jaXBoZXJzL2NpcGhlcl9hZXNfY2ZiX2h3X2Flc25pLmluYwo+IC0rKysgYi9w
cm92aWRlcnMvaW1wbGVtZW50YXRpb25zL2NpcGhlcnMvY2lwaGVyX2Flc19jZmJfaHdfYWVzbmku
aW5jCj4gLUBAIC0zMCw2ICszMCw3IEBACj4gLSBzdGF0aWMgaW50IG9zc2xfYWVzX2NmYjhfdmFl
c19lbGlnaWJsZSh2b2lkKSB7IHJldHVybiAwOyB9Cj4gLSBzdGF0aWMgaW50IG9zc2xfYWVzX2Nm
YjFfdmFlc19lbGlnaWJsZSh2b2lkKSB7IHJldHVybiAwOyB9Cj4gLSAKPiAtKyNpZiAoZGVmaW5l
ZChfX3g4Nl82NCkgfHwgZGVmaW5lZChfX3g4Nl82NF9fKSB8fCBkZWZpbmVkKF9NX0FNRDY0KSB8
fCBkZWZpbmVkKF9NX1g2NCkpCj4gLSAvKiBhY3RpdmUgaW4gNjQtYml0IGJ1aWxkcyB3aGVuIEFF
Uy1OSSwgQVZYNTEyRiwgYW5kIFZBRVMgYXJlIGRldGVjdGVkICovCj4gLSBzdGF0aWMgaW50IGFl
c19jZmIxMjhfdmFlc19lbmNkZWNfd3JhcHBlcigKPiAtICAgICBQUk9WX0NJUEhFUl9DVFgqIGRh
dCwKPiAtQEAgLTU2LDYgKzU3LDcgQEAgc3RhdGljIGludCBhZXNfY2ZiMTI4X3ZhZXNfZW5jZGVj
X3dyYXBwZXIoCj4gLSAKPiAtICAgICByZXR1cm4gMTsKPiAtIH0KPiAtKyNlbmRpZgo+IC0gIAo+
IC0gLyogZ2VuZXJhdGVzIEFFUyByb3VuZCBrZXlzIGZvciBBRVMtTkkgYW5kIFZBRVMgaW1wbGVt
ZW50YXRpb25zICovCj4gLSBzdGF0aWMgaW50IGNpcGhlcl9od19hZXNuaV9pbml0a2V5KFBST1Zf
Q0lQSEVSX0NUWCAqZGF0LAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYm9wZW5zc2wvbGlib3Bl
bnNzbC5oYXNoIGIvcGFja2FnZS9saWJvcGVuc3NsL2xpYm9wZW5zc2wuaGFzaAo+IGluZGV4IDkz
MjJhNTZlNzYuLjBlMGRiZDM5MjYgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9saWJvcGVuc3NsL2xp
Ym9wZW5zc2wuaGFzaAo+ICsrKyBiL3BhY2thZ2UvbGlib3BlbnNzbC9saWJvcGVuc3NsLmhhc2gK
PiBAQCAtMSw1ICsxLDUgQEAKPiAtIyBGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuc3NsL29w
ZW5zc2wvcmVsZWFzZXMvZG93bmxvYWQvb3BlbnNzbC0zLjYuMC9vcGVuc3NsLTMuNi4wLnRhci5n
ei5zaGEyNTYKPiAtc2hhMjU2ICBiNmE1ZjQ0YjdlYjY5ZTNmYTM1ZGJmMTU1MjQ0MDViNDQ4Mzdh
NDgxZDQzZDgxZGFkZGRlM2ZmMjFmY2JiOGU5ICBvcGVuc3NsLTMuNi4wLnRhci5nego+ICsjIEZy
b20gaHR0cHM6Ly9naXRodWIuY29tL29wZW5zc2wvb3BlbnNzbC9yZWxlYXNlcy9kb3dubG9hZC9v
cGVuc3NsLTMuNi4xL29wZW5zc2wtMy42LjEudGFyLmd6LnNoYTI1Ngo+ICtzaGEyNTYgIGIxYmZl
ZGNkNWIyODlmZjIyYWVlODdjOWQ2MDBmNTE1NzY3ZWJmNDVmNzcxNjhjYjZkNjRmMjMxZjUxOGE4
MmUgIG9wZW5zc2wtMy42LjEudGFyLmd6Cj4gIAo+ICAjIExpY2Vuc2UgZmlsZXMKPiAgc2hhMjU2
ICA3ZDU0NTBjYjJkMTQyNjUxYjhhZmEzMTViNWYyMzhlZmM4MDVkYWQ4MjdkOTFiYTM2N2Q4NTE2
YmM5ZDQ5ZTdhICBMSUNFTlNFLnR4dAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYm9wZW5zc2wv
bGlib3BlbnNzbC5tayBiL3BhY2thZ2UvbGlib3BlbnNzbC9saWJvcGVuc3NsLm1rCj4gaW5kZXgg
MjhkY2I5ZGZjMi4uZDU4MDk0Nzg5OSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xpYm9wZW5zc2wv
bGlib3BlbnNzbC5tawo+ICsrKyBiL3BhY2thZ2UvbGlib3BlbnNzbC9saWJvcGVuc3NsLm1rCj4g
QEAgLTQsNyArNCw3IEBACj4gICMKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgCj4gLUxJ
Qk9QRU5TU0xfVkVSU0lPTiA9IDMuNi4wCj4gK0xJQk9QRU5TU0xfVkVSU0lPTiA9IDMuNi4xCj4g
IExJQk9QRU5TU0xfU0lURSA9IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuc3NsL29wZW5zc2wvcmVs
ZWFzZXMvZG93bmxvYWQvb3BlbnNzbC0kKExJQk9QRU5TU0xfVkVSU0lPTikKPiAgTElCT1BFTlNT
TF9TT1VSQ0UgPSBvcGVuc3NsLSQoTElCT1BFTlNTTF9WRVJTSU9OKS50YXIuZ3oKPiAgTElCT1BF
TlNTTF9MSUNFTlNFID0gQXBhY2hlLTIuMAo+IC0tIAo+IDIuNDcuMwo+IAo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcg
bGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
