Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BD4CD98F8
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 09:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 173A642DB2;
	Fri, 19 Jun 2026 09:00:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P1atRwuaZDtK; Fri, 19 Jun 2026 09:00:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEFBD42DB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781859640;
	bh=KxhttN7oog1ZrF+5vr2LpfVMN4oUse4sJXoD1f2plaE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=m17rEB4QISnsfuDfmcpC+jzOpQ5ZkAU7s7uK8NVD9+Y6V9uYcdADbMOAn/sEYqXXK
	 QR5DJb5YdLLiEWSQ2X8Lk+zNxaYpkdAXCqxN3DQIo30u+EjqO0wfBpJMniyl9zIWKU
	 AaH948sKMDTBX0S8G0hu6TOfDhquYrJvN5r+IJHcR3m7umGG0oGbrMFv3jNjEKsdxh
	 /21OZnBZgiMT+ivqzjLyVXRGiktRg74GFnHipMAKQLAGqU9qjILAzmyaBK+DloK4I9
	 07s0EIG5DsJmYJHl6IJ2C/ynnD34OAtSV79v2ZnkHByteo3PaG+N/sqW/IBEHRPcx3
	 30CJAHCbOWeLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEFBD42DB0;
	Fri, 19 Jun 2026 09:00:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 23CC6367
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1503842DB0
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:00:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IS2874S-PwMq for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 09:00:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 21CE042D47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21CE042D47
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 21CE042D47
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:00:36 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1293944893; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 19 Jun 2026 09:00:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1waV5U-0000000DCJ6-0tN8;
 Fri, 19 Jun 2026 11:00:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 19 Jun 2026 11:00:26 +0200
Message-ID: <20260619090027.3145553-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=kpts/Zck0IXfXtDt19yuJkL14llpNGb5eoCbchozcYcHLz8j+V0MXVzdmHiHvxLwbI46z+Kb6O16Jpb39hzt1hUV2B7YeD3Y+WJcb8UL8gs31A0h3QuVpZ+G48PTOrfs2PtH62VGeGUgc4zM8eHNGIcFp2cp7OJ1KQFt0FL6FAEgMVOVNgUyruYBkPYGD2YzpV35+BAp7117fucFwNKIUrcgMW8Ud+Y9qTN7BwUmUQZ7lgMag15SAbI+dc0cvQQAa2DLyC1ycIgNV2Cd588CyopdAU53pYR4lmtWoxcT3i0clkd/am7GSW02diEJFtJ6HLxM22IRlRbVX9Q8SJtiYQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=6OuVr9vrNn17oelv/y8KiAm9/FLcD9nCg8JuasVegJ4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=kpts/Zck
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] utils/generate-cyclonedx: fixup scp-style git
 sites
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
Cc: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q29tbWl0IGU4YzU0ZmZiM2QgKCJ1dGlscy9nZW5lcmF0ZS1jeWNsb25lZHg6IGdlbmVyYXRlIHZj
cwpleHRlcm5hbFJlZmVyZW5jZXMgZm9yIHNvdXJjZSByZXBvcyIpIGFkZGVkIGV4dGVybmFsUmVm
ZXJlbmNlcyB0byB0aGUgc291cmNlCmNvZGUgb2YgcGFja2FnZXMuCgpUaGlzIHVuZm9ydHVuYXRl
bHkgY2F1c2VzIGlzc3VlcyB3aXRoIHBhY2thZ2VzIChpbiBicjItZXh0ZXJuYWwpIGZldGNoaW5n
CmZyb20gZ2l0IHVzaW5nIHRoZSBzY3AtbGlrZSBzeW50YXgsIEUuRy46CgogRk9PX1NJVEVfTUVU
SE9EID0gZ2l0CiBGT09fU0lURSA9IGdpdEBnaXRodWIuY29tOjxwcm9qZWN0Pi88cmVwbz4uZ2l0
CgpXaGljaCBlbmRzIHVwIGluIHRoZSBTQk9NIGFzOgoKWwogIHsKICAgICJ0eXBlIjogInZjcyIs
CiAgICAidXJsIjogImdpdEBnaXRodWIuY29tOjxwcm9qZWN0Pi88cmVwbz4uZ2l0IiwKICAgICJj
b21tZW50IjogImdpdCByZXBvc2l0b3J5IgogIH0KXQoKVGhpcyAoY29ycmVjdGx5KSBjYXVzZXMg
RGVwZW5kZW5jeSB0cmFjayB0byByZWplY3QgdGhlIFNCT00gaW1wb3J0IHdpdGg6Cgp7CiAgInN0
YXR1cyI6IDQwMCwKICAidGl0bGUiOiAiVGhlIHVwbG9hZGVkIEJPTSBpcyBpbnZhbGlkIiwKICAi
ZGV0YWlsIjogIlNjaGVtYSB2YWxpZGF0aW9uIGZhaWxlZCIsCiAgImVycm9ycyI6IFsKICAgICIk
LmNvbXBvbmVudHNbMl0uZXh0ZXJuYWxSZWZlcmVuY2VzWzBdLnVybDogZG9lcyBub3QgbWF0Y2gg
dGhlIGlyaS1yZWZlcmVuY2UgcGF0dGVybiBtdXN0IGJlIGEgdmFsaWQgUkZDIDM5ODcgSVJJLXJl
ZmVyZW5jZSIsCiAgICAiJC5jb21wb25lbnRzWzJdLmV4dGVybmFsUmVmZXJlbmNlc1swXS51cmw6
IGRvZXMgbm90IG1hdGNoIHRoZSBpcmktcmVmZXJlbmNlIHBhdHRlcm4gbXVzdCBiZSBhIHZhbGlk
IFJGQyAzOTg3IElSSS1yZWZlcmVuY2UiLAogICAgIiQuY29tcG9uZW50c1syXS5leHRlcm5hbFJl
ZmVyZW5jZXNbMF0udXJsOiBkb2VzIG5vdCBtYXRjaCB0aGUgcmVnZXggcGF0dGVybiBedXJuOmNk
eDpbMC05YS1mXXs4fS1bMC05YS1mXXs0fS1bMC05YS1mXXs0fS1bMC05YS1mXXs0fS1bMC05YS1m
XXsxMn0vWzEtOV1bMC05XSokIiwKICAgXQp9CgpUaGUgQ3ljbG9uZURYIHNwZWMgaW5kZWVkIHJl
cXVpcmVzIGEgVVJJOgoKVGhlIFVSSSAoVVJMIG9yIFVSTikgdG8gdGhlIGV4dGVybmFsIHJlZmVy
ZW5jZS4gIEV4dGVybmFsIHJlZmVyZW5jZXMgYXJlClVSSXMgYW5kIHRoZXJlZm9yZSBjYW4gYWNj
ZXB0IGFueSBVUkwgc2NoZW1lIGluY2x1ZGluZyBodHRwcyAoUkZDLTcyMzApLAptYWlsdG8gKFJG
Qy0yMzY4KSwgdGVsIChSRkMtMzk2NiksIGFuZCBkbnMgKFJGQy00NTAxKQoKaHR0cHM6Ly9jeWNs
b25lZHgub3JnL2RvY3MvMS42L2pzb24vI21ldGFkYXRhX3Rvb2xzX29uZU9mX2kwX2NvbXBvbmVu
dHNfaXRlbXNfZXh0ZXJuYWxSZWZlcmVuY2VzX2l0ZW1zX3VybAoKVGhlIHVzZXJAaG9zdDpwcm9q
ZWN0L3JlcG8uZ2l0IGlzIGEgZ2l0LXNwZWNpZmljIHNob3J0aGFuZCBmb3IgYSBnaXQtb3Zlci1z
c2ggVVJMLiBGcm9tIG1hbiBnaXQtY2xvbmU6CgogR2l0IHN1cHBvcnRzIHNzaCwgZ2l0LCBodHRw
LCBhbmQgaHR0cHMgcHJvdG9jb2xzIChpbiBhZGRpdGlvbiwgZnRwIGFuZCBmdHBzCiBjYW4gYmUg
dXNlZCBmb3IgZmV0Y2hpbmcsIGJ1dCB0aGlzIGlzIGluZWZmaWNpZW50IGFuZCBkZXByZWNhdGVk
OyBkbyBub3QgdXNlCiB0aGVtKS4KCiBUaGUgbmF0aXZlIHRyYW5zcG9ydCAoaS5lLiAgZ2l0Oi8v
IFVSTCkgZG9lcyBubyBhdXRoZW50aWNhdGlvbiBhbmQgc2hvdWxkCiBiZSB1c2VkIHdpdGggY2F1
dGlvbiBvbiB1bnNlY3VyZWQgbmV0d29ya3MuCgogVGhlIGZvbGxvd2luZyBzeW50YXhlcyBtYXkg
YmUgdXNlZCB3aXRoIHRoZW06Cgog4oCiICAgc3NoOi8vW3VzZXJAXWhvc3QueHpbOnBvcnRdL3Bh
dGgvdG8vcmVwby5naXQvCiDigKIgICBnaXQ6Ly9ob3N0Lnh6Wzpwb3J0XS9wYXRoL3RvL3JlcG8u
Z2l0Lwog4oCiICAgaHR0cFtzXTovL2hvc3QueHpbOnBvcnRdL3BhdGgvdG8vcmVwby5naXQvCiDi
gKIgICBmdHBbc106Ly9ob3N0Lnh6Wzpwb3J0XS9wYXRoL3RvL3JlcG8uZ2l0LwoKIEFuIGFsdGVy
bmF0aXZlIHNjcC1saWtlIHN5bnRheCBtYXkgYWxzbyBiZSB1c2VkIHdpdGggdGhlIHNzaCBwcm90
b2NvbDoKCiDigKIgICBbdXNlckBdaG9zdC54ejpwYXRoL3RvL3JlcG8uZ2l0LwoKU28gY29udmVy
dCB0aGUgc2NwLWxpa2Ugc3ludGF4IHRvIHNzaDovLyBVUkxzIGluIHBhcnNlX3VyaXMoKSBmb3Ig
c3BlYwpjb21wbGlhbmNlLgoKU2lnbmVkLW9mZi1ieTogUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBr
b3JzZ2FhcmQuY29tPgotLS0KIHV0aWxzL2dlbmVyYXRlLWN5Y2xvbmVkeCB8IDYgKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdXRpbHMvZ2VuZXJh
dGUtY3ljbG9uZWR4IGIvdXRpbHMvZ2VuZXJhdGUtY3ljbG9uZWR4CmluZGV4IGJhZGUwMThjZDQu
LmRmMTJlZTg0YzAgMTAwNzU1Ci0tLSBhL3V0aWxzL2dlbmVyYXRlLWN5Y2xvbmVkeAorKysgYi91
dGlscy9nZW5lcmF0ZS1jeWNsb25lZHgKQEAgLTI4MCw2ICsyODAsMTIgQEAgZGVmIHBhcnNlX3Vy
aXModXJpczogbGlzdFtzdHJdKSAtPiBJdGVyYXRvclt0dXBsZVtsaXN0W3N0cl0sIHN0cl1dOgog
ICAgICAgICBzY2hlbWUsIF8sIHN0cmlwcGVkX3VyaSA9IHVyaS5wYXJ0aXRpb24oIisiKQogICAg
ICAgICBpZiBzdHJpcHBlZF91cmk6CiAgICAgICAgICAgICBwYXJzZWQgPSB1cmxsaWIucGFyc2Uu
dXJscGFyc2Uoc3RyaXBwZWRfdXJpKQorCisgICAgICAgICAgICAjIGNvbnZlcnQgc2NwLXN0eWxl
IGhvc3Q6cGF0aCBzaXRlIHRvIHNzaDovLyB1cmkKKyAgICAgICAgICAgIGlmIHNjaGVtZSA9PSAi
Z2l0IiBhbmQgbm90IHBhcnNlZC5zY2hlbWU6CisgICAgICAgICAgICAgICAgaG9zdCwgXywgcGF0
aCA9IHN0cmlwcGVkX3VyaS5wYXJ0aXRpb24oIjoiKQorICAgICAgICAgICAgICAgIHN0cmlwcGVk
X3VyaSA9ICJzc2g6Ly8iICsgaG9zdCArICIvIiArIHBhdGgKKwogICAgICAgICAgICAgaWYgcGFy
c2VkLmhvc3RuYW1lICE9ICJzb3VyY2VzLmJ1aWxkcm9vdC5uZXQiOgogICAgICAgICAgICAgICAg
IHlpZWxkIHNjaGVtZS5zcGxpdCgifCIpLCBzdHJpcHBlZF91cmkKIAotLSAKMi40Ny4zCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
