Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141CCD0D152
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1782827FD;
	Wed,  7 Jan 2026 17:55:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YfBupUPo4IDO; Wed,  7 Jan 2026 17:55:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6F5B827F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808542;
	bh=rSTH7S3IbpXlGjyO0f6v5FmmuGDJDOxj3gmsuIRkOtk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VmPtSgtrPLmY5RS66OypHAIYKb9JTVcDk3RWwhrOAs20Kd9euYMzz2C25cu+TwgYm
	 qScrtuK2+E+DTto53kjQ4JxtHyGoFbH7i3FwCxwxorfTEvDd4uS9mu7tdn/1WN6x0Q
	 RWAnaYGFgGx401CtEq+Vp1UD18/CbqxiG0xMm1B86CIj8d8A1oLwcz3eldC4MUoeBK
	 QTpf72BS6L1YzaBEAzSNyPwHNRirDgQTUuFjzjZK8Sq2/kOkw396dSDbaBmKGLviJN
	 jLvX+ZStCFkEWXtuWbiC8RhGYBBZHdBDESsM50JGosigwMOQQDY4S52sZq4rA29PiH
	 2+kyNULFMXiOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6F5B827F3;
	Wed,  7 Jan 2026 17:55:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2AB8F9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D47D40962
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UaD7B_BPX761 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:55:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5D10641074
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D10641074
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D10641074
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 94DAEB97A704; Wed,  7 Jan 2026 18:55:34 +0100 (CET)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:55:32 +0100
Message-ID: <20260107175533.230087-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251214153711.766150-2-thomas.petazzoni@bootlin.com>
References: <20251214153711.766150-2-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808534; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=mVbpHyDgpFaN/gZXWLD1YjTdia6sN5rINW9WQnJr+Lo=;
 b=bs37jLTEHT4QaGEDSDORfdO6+FnREbWoonbKCPCKdR5aHGX7Tqgsk3vcARxzYQ1YS+mQLe
 JP4dm9/iLTg/NuVjJJMFhfAjWVAZBiITGF3t7S59RUg1cl2x7ZiMb4L+zQzS5FKIGm63Ob
 nr9hSOGDLz1cSW64pkrWIn4IXoYmJlbJre6DMJ5+Q9j5mdzcmWxtsUwQ0cidWOMd5/16CG
 jQ7xP3w3MlVNdadeFWLXL2Bw/YDt9bYqaXLT+bRldRjMgLVa1wtXdPNUJhNA3M4y7sMBMP
 /ZVHzZDGe0RWVt/EChDQyqZrD64tI7HpUBTn0R2fMrJQVmkGluElEeKMLPm5tg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=bs37jLTE
Subject: Re: [Buildroot] [PATCH 2/2] toolchain/Config.in: drop
 BR2_TOOLCHAIN_HAS_GCC_BUG_121567
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gR0NDIGJ1ZyAxMjE1NjcgaXMgYWN0dWFsbHkgYSBkdXBsaWNhdGUgb2Yg
R0NDIGJ1ZyA4MTQyNiwgd2hpY2ggYWxyZWFkeQo+IGV4aXN0ZWQgdXBzdHJlYW0sIGFuZCBmb3Ig
d2hpY2ggd2UgYWxyZWFkeSBoYWQKPiBCUjJfVE9PTENIQUlOX0hBU19HQ0NfQlVHXzgxMjQ2Lgo+
IAo+IEluIGFkZGl0aW9uLCBCUjJfVE9PTENIQUlOX0hBU19HQ0NfQlVHXzgxMjQ2IGlzIGNvcnJl
Y3RseSBkZWZpbmVkIGFzCj4gYWZmZWN0aW5nIFN1cGVySCByZWdhcmRsZXNzIG9mIHRoZSBvcHRp
bWl6YXRpb24gbGV2ZWwuIEluZGVlZCwgd2hlbgo+IEJSMl9UT09MQ0hBSU5fSEFTX0dDQ19CVUdf
MTIxNTY3IHdhcyBpbnRyb2R1Y2VkLCBpdCB3YXMgdGhvdWdodCB0aGF0Cj4gb25seSAtTzIgYW5k
IC1PMyBsZXZlbHMgYXJlIGFmZmVjdGVkLCBidXQgLU9nLCAtTzEgYW5kIC1PZmFzdCBhcmUgYWxz
bwo+IGFmZmVjdGVkLCBjYXVzaW5nIHRoZSBweXRob24zIGJ1aWxkIHRvIGZhaWwuCj4gCj4gRml4
ZXM6Cj4gCj4gICBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvYWNhMTgx
MjQxNWVlODRlZWYyMjNiMGZkZmY4OGYzMWEzOTc3NTI5NC8gKC1PMSBidWlsZCkKPiAKPiAgIGh0
dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy8zZmQ5MWNlM2ZmODcyN2QyZjlj
MTJmNjcyMWRmOTIyYzYwMjgyZDcwLyAoLU9mYXN0IGJ1aWxkKQo+IAo+ICAgaHR0cHM6Ly9hdXRv
YnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2U1NTM2ZGNmNTk4YTUxZjUwMDYzNDM1MTNhNzZm
NGUyMjNlODBhNTUvICgtT2cgYnVpbGQpCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBldGF6
em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KCkFwcGxpZWQgdG8gMjAyNS4xMS54
LiBUaGFua3MKCj4gLS0tCj4gIHBhY2thZ2UvcHl0aG9uMy9weXRob24zLm1rIHwgIDIgKy0KPiAg
dG9vbGNoYWluL0NvbmZpZy5pbiAgICAgICAgfCAxMyArKystLS0tLS0tLS0tCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9weXRob24zL3B5dGhvbjMubWsgYi9wYWNrYWdlL3B5dGhvbjMvcHl0aG9uMy5t
awo+IGluZGV4IDRlNjYwZWNlZTIuLjA2OTA2NzhjMDQgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9w
eXRob24zL3B5dGhvbjMubWsKPiArKysgYi9wYWNrYWdlL3B5dGhvbjMvcHl0aG9uMy5tawo+IEBA
IC0xOTEsNyArMTkxLDcgQEAgZW5kaWYKPiAgCj4gIFBZVEhPTjNfQ0ZMQUdTID0gJChUQVJHRVRf
Q0ZMQUdTKQo+ICAKPiAtaWZlcSAoJChCUjJfVE9PTENIQUlOX0hBU19HQ0NfQlVHXzEyMTU2Nyks
eSkKPiAraWZlcSAoJChCUjJfVE9PTENIQUlOX0hBU19HQ0NfQlVHXzgxNDI2KSx5KQo+ICBQWVRI
T04zX0NGTEFHUyArPSAtTzAKPiAgZW5kaWYKPiAgCj4gZGlmZiAtLWdpdCBhL3Rvb2xjaGFpbi9D
b25maWcuaW4gYi90b29sY2hhaW4vQ29uZmlnLmluCj4gaW5kZXggODMzMGU2NTJjMi4uOTkzMzdh
MTg3MyAxMDA2NDQKPiAtLS0gYS90b29sY2hhaW4vQ29uZmlnLmluCj4gKysrIGIvdG9vbGNoYWlu
L0NvbmZpZy5pbgo+IEBAIC0xNDEsNiArMTQxLDkgQEAgY29uZmlnIEJSMl9UT09MQ0hBSU5fSEFT
X0dDQ19CVUdfNjg0ODUKPiAgCWRlZmF1bHQgeSBpZiBCUjJfbWljcm9ibGF6ZQo+ICAKPiAgIyBo
dHRwczovL2djYy5nbnUub3JnL2J1Z3ppbGxhL3Nob3dfYnVnLmNnaT9pZD04MTQyNgo+ICsjIGVy
cm9yOiB1bmFibGUgdG8gZmluZCBhIHJlZ2lzdGVyIHRvIHNwaWxsIGluIGNsYXNzIOKAmFIwX1JF
R1PigJkKPiArIyBUaGUgYnVnIGV4aXN0cyBhdCBsZWFzdCBzaW5jZSBnY2MgNi54LCBzbyB3ZSBh
cmUgYXNzdW1pbmcgaXQgYWZmZWN0cwo+ICsjIGFsbCBHQ0MgdmVyc2lvbnMuCj4gIGNvbmZpZyBC
UjJfVE9PTENIQUlOX0hBU19HQ0NfQlVHXzgxNDI2Cj4gIAlib29sCj4gIAlkZWZhdWx0IHkgaWYg
QlIyX3NoCj4gQEAgLTI0MywxNiArMjQ2LDYgQEAgY29uZmlnIEJSMl9UT09MQ0hBSU5fSEFTX0dD
Q19CVUdfMTExMDAxCj4gIAkJICAgQlIyX09QVElNSVpFXzIgfHwgXAo+ICAJCSAgIEJSMl9PUFRJ
TUlaRV8zCj4gIAo+IC0jIGh0dHBzOi8vZ2NjLmdudS5vcmcvYnVnemlsbGEvc2hvd19idWcuY2dp
P2lkPTEyMTU2Nwo+IC0jIGVycm9yOiB1bmFibGUgdG8gZmluZCBhIHJlZ2lzdGVyIHRvIHNwaWxs
IGluIGNsYXNzIOKAmFIwX1JFR1PigJkKPiAtIyBUaGUgYnVnIGV4aXN0cyBhdCBsZWFzdCBzaW5j
ZSBnY2MgNi54LCBzbyB3ZSBhcmUgYXNzdW1pbmcgaXQgYWZmZWN0cwo+IC0jIGFsbCBHQ0MgdmVy
c2lvbnMuCj4gLWNvbmZpZyBCUjJfVE9PTENIQUlOX0hBU19HQ0NfQlVHXzEyMTU2Nwo+IC0JYm9v
bAo+IC0JZGVmYXVsdCB5IGlmIEJSMl9zaAo+IC0JZGVwZW5kcyBvbiBCUjJfT1BUSU1JWkVfMiB8
fCBcCj4gLQkJICAgQlIyX09QVElNSVpFXzMKPiAtCj4gIGNvbmZpZyBCUjJfVE9PTENIQUlOX0hB
U19OQVRJVkVfUlBDCj4gIAlib29sCj4gIAo+IC0tIAo+IDIuNTIuMAo+IAo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcg
bGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
