Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021FFC5CFC1
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 05:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4BC260686;
	Fri, 14 Aug 2026 05:42:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tBQUkLuIiVKh; Fri, 14 Aug 2026 05:42:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C503D60680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786686155;
	bh=duv4e+Ut/FHKOuwkpNBl4noKJDKHb+PgghCZftdDzq4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=puoQpytesjsEREKzp3dHCTO7D1TTES/1b37saCbC1t/PLsFqXp1x3Rd6qkCzyKj90
	 8qHfTyqi3Qee7pWrTsoQaHraB7lSEyFqNYFU//kDb4GcZR+xbaKyT5zyGTVkHThc88
	 Ra3OL0yCV+G3NxjdTDuS0wrfCYhTeZkbTSBXik0a4OEunXBAwYEGDzd1CEQ7a85fFs
	 FuSNNPBPdb8U9WtKXfG3yHHxfwGXLYHQxYj79/cnuxS8+H2OTyOrneKJHDNcafdA2w
	 kERPOl/IzbZ2rSVVwXJtg/gXPMKKppVl2qO+jQRweHY47CCMCQxqX2duNi3AkvNcU5
	 3QV+QAieLbesw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C503D60680;
	Fri, 14 Aug 2026 05:42:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FE5C3A0
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 05:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01F9E4086C
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 05:42:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m3DCOw8atvZJ for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 05:42:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DFFBB40877
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFFBB40877
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=B0bCAwSL
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DFFBB40877
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 05:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1786686137;
 bh=alI6BQAajhGd6kMFN6VY2aFsnWBJxFzeFkqkwXhhHJk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=B0bCAwSLp30PAShSJ7wv4eR4o41bolXdQ+25dQL0cZ6Vg7XoXmhCjIQ2MdR8QKhCd
 +vxypnqcc+Fpx+qBzCiD43VmG6xVD1TbrcnSwOeh4aAPjPgQOieul7hCH9kf7quKLj
 PSoEJaP20JF3fhXhEhAg9cMXdYgpMunGIzgPvJkxf4faEZWDFRb7s8RYS2veWnIcsr
 029hZ3aagQ6v88ZxStz8LzvT46RCRudHbdmfFS6KLTZ6iCLwavrXf/yXV+43tf8Ve+
 Tv3WVIeDwRFgCNtc0iuVXKyPj1CuTso8JaZH4izWbdtMtidLETdEznPi+PAH0FMG2j
 r39fZCfOOB7wA==
Received: from fli4l.lan.fli4l (p54a1bf47.dip0.t-ipconnect.de [84.161.191.71])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 81C13A4C0596;
 Fri, 14 Aug 2026 07:42:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37362)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wukgK-000000004rF-2ea7;
 Fri, 14 Aug 2026 05:42:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Steve Kenton <skenton@ou.edu>
Date: Fri, 14 Aug 2026 07:42:14 +0200
Message-ID: <20260814054216.7491-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260814054216.7491-1-bernd@kuhls.net>
References: <20260814054216.7491-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v2 2/3] package/libdvdcss: bump version to 1.6.0
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

aHR0cHM6Ly9jb2RlLnZpZGVvbGFuLm9yZy92aWRlb2xhbi9saWJkdmRjc3MvLS9ibG9iLzEuNi4w
L05FV1MKClJlbW92ZWQgc2hhMSBoYXNoLCBzaGEyNTYgaXMgZW5vdWdoLgoKUmVtb3ZlZCBwYXRj
aCB3aGljaCBpcyBpbmNsdWRlZCBpbiB0aGlzIHJlbGVhc2UuCgpTaWduZWQtb2ZmLWJ5OiBCZXJu
ZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgotLS0KdjI6IG5vIGNoYW5nZXMKCkdpdGxhYiBwaXBl
bGluZXMgcGFzc2VkOgpodHRwczovL2dpdGxhYi5jb20vYmt1aGxzL2J1aWxkcm9vdC8tL2NvbW1p
dHMvMDg0MGNjZmIxOWE5OTQ0OWI3NGY3N2Y2NTFhZjM1MGE1YzAxYTVhYQoKIC4uLmQtY29tcGls
YXRpb24tcHJvYmxlbXMtd2l0aC1QQVRIX01BWC5wYXRjaCB8IDQ2IC0tLS0tLS0tLS0tLS0tLS0t
LS0KIHBhY2thZ2UvbGliZHZkY3NzL2xpYmR2ZGNzcy5oYXNoICAgICAgICAgICAgICB8ICA2ICst
LQogcGFja2FnZS9saWJkdmRjc3MvbGliZHZkY3NzLm1rICAgICAgICAgICAgICAgIHwgIDIgKy0K
IDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA1MSBkZWxldGlvbnMoLSkKIGRlbGV0
ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xpYmR2ZGNzcy8wMDAxLUZpeGVkLWNvbXBpbGF0aW9uLXBy
b2JsZW1zLXdpdGgtUEFUSF9NQVgucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYmR2ZGNz
cy8wMDAxLUZpeGVkLWNvbXBpbGF0aW9uLXByb2JsZW1zLXdpdGgtUEFUSF9NQVgucGF0Y2ggYi9w
YWNrYWdlL2xpYmR2ZGNzcy8wMDAxLUZpeGVkLWNvbXBpbGF0aW9uLXByb2JsZW1zLXdpdGgtUEFU
SF9NQVgucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDM1ZWJmNGY0ZDEuLjAw
MDAwMDAwMDAKLS0tIGEvcGFja2FnZS9saWJkdmRjc3MvMDAwMS1GaXhlZC1jb21waWxhdGlvbi1w
cm9ibGVtcy13aXRoLVBBVEhfTUFYLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsNDYgKzAsMCBA
QAotRnJvbSBiZTM0ZDAyNmY0NDM4OTc0NWUyOWE3ZGE5NzdmODQ3MTIwNjZkM2QwIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQotRnJvbTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KLURh
dGU6IFNhdCwgMTUgTm92IDIwMjUgMTk6NDE6MDkgKzAxMDAKLVN1YmplY3Q6IFtQQVRDSF0gRml4
ZWQgY29tcGlsYXRpb24gcHJvYmxlbXMgd2l0aCBQQVRIX01BWAotTUlNRS1WZXJzaW9uOiAxLjAK
LUNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAotQ29udGVudC1UcmFuc2Zl
ci1FbmNvZGluZzogOGJpdAotCi1JbiBmaWxlIGluY2x1ZGVkIGZyb20gLi4vc3JjL2NweG0uYzoz
ODoKLS4uL3NyYy9saWJkdmRjc3MuaDo2NToyNjogZXJyb3I6IOKAmFBBVEhfTUFY4oCZIHVuZGVj
bGFyZWQgaGVyZSAobm90IGluIGEgZnVuY3Rpb24pCi0gICA2NSB8ICAgICBjaGFyICAgcHN6X2Nh
Y2hlZmlsZVtQQVRIX01BWF07Ci0KLUluIGZpbGUgaW5jbHVkZWQgZnJvbSAuLi9zcmMvZXJyb3Iu
YzoyNjoKLS4uL3NyYy9saWJkdmRjc3MuaDo2NToyNjogZXJyb3I6IOKAmFBBVEhfTUFY4oCZIHVu
ZGVjbGFyZWQgaGVyZSAobm90IGluIGEgZnVuY3Rpb24pCi0gICA2NSB8ICAgICBjaGFyICAgcHN6
X2NhY2hlZmlsZVtQQVRIX01BWF07Ci0KLUluIGZpbGUgaW5jbHVkZWQgZnJvbSAuLi9zcmMvbGli
ZHZkY3B4bS5jOjQ3OgotLi4vc3JjL2xpYmR2ZGNzcy5oOjY1OjI2OiBlcnJvcjog4oCYUEFUSF9N
QVjigJkgdW5kZWNsYXJlZCBoZXJlIChub3QgaW4gYSBmdW5jdGlvbikKLSAgIDY1IHwgICAgIGNo
YXIgICBwc3pfY2FjaGVmaWxlW1BBVEhfTUFYXTsKLQotVXBzdHJlYW06IGh0dHBzOi8vY29kZS52
aWRlb2xhbi5vcmcvdmlkZW9sYW4vbGliZHZkY3NzLy0vbWVyZ2VfcmVxdWVzdHMvMjQKLQotU2ln
bmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KLS0tLQotIHNyYy9saWJk
dmRjc3MuaCB8IDUgKysrKysKLSAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCi0KLWRp
ZmYgLS1naXQgYS9zcmMvbGliZHZkY3NzLmggYi9zcmMvbGliZHZkY3NzLmgKLWluZGV4IGY5ZDM2
YmEuLjk5N2FmMzQgMTAwNjQ0Ci0tLS0gYS9zcmMvbGliZHZkY3NzLmgKLSsrKyBiL3NyYy9saWJk
dmRjc3MuaAotQEAgLTI2LDYgKzI2LDExIEBACi0gCi0gI2luY2x1ZGUgPGxpbWl0cy5oPgotIAot
KyNpbmNsdWRlIDxjb25maWcuaD4KLSsjaWZkZWYgSEFWRV9TWVNfUEFSQU1fSAotKyMgICBpbmNs
dWRlIDxzeXMvcGFyYW0uaD4KLSsjZW5kaWYKLSsKLSAjaW5jbHVkZSAiZHZkY3NzL2R2ZGNzcy5o
IgotICNpbmNsdWRlICJjcHhtLmgiCi0gI2luY2x1ZGUgImNzcy5oIgotLS0gCi0yLjQ3LjMKLQpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9saWJkdmRjc3MvbGliZHZkY3NzLmhhc2ggYi9wYWNrYWdlL2xp
YmR2ZGNzcy9saWJkdmRjc3MuaGFzaAppbmRleCA4MzUxNTViZTgwLi5hNmI5OTkyYTEzIDEwMDY0
NAotLS0gYS9wYWNrYWdlL2xpYmR2ZGNzcy9saWJkdmRjc3MuaGFzaAorKysgYi9wYWNrYWdlL2xp
YmR2ZGNzcy9saWJkdmRjc3MuaGFzaApAQCAtMSw3ICsxLDUgQEAKLSMgRnJvbSBodHRwczovL2Rv
d25sb2FkLnZpZGVvbGFuLm9yZy9wdWIvdmlkZW9sYW4vbGliZHZkY3NzLzEuNS4wL2xpYmR2ZGNz
cy0xLjUuMC50YXIueHouc2hhMQotc2hhMSAgYmIyMWEyN2EzMmZhMmExZDFlODE0NDg3MjJmZGM2
MmM1MjFhODgwMyAgbGliZHZkY3NzLTEuNS4wLnRhci54egotIyBGcm9tIGh0dHBzOi8vZG93bmxv
YWQudmlkZW9sYW4ub3JnL3B1Yi92aWRlb2xhbi9saWJkdmRjc3MvMS41LjAvbGliZHZkY3NzLTEu
NS4wLnRhci54ei5zaGEyNTYKLXNoYTI1NiAgNTI5NDYzZTRkMWJlZmVmODJlNWM2ZTQ3MGRiNzY2
MWEyZGIwMzQzZTA5MmEyZmIwZDZjMDM3Y2FiOGE1YzM5OSAgbGliZHZkY3NzLTEuNS4wLnRhci54
egorIyBGcm9tIGh0dHA6Ly9kb3dubG9hZC52aWRlb2xhbi5vcmcvcHViL3ZpZGVvbGFuL2xpYmR2
ZGNzcy8xLjYuMC9saWJkdmRjc3MtMS42LjAudGFyLnh6LnNoYTI1Ngorc2hhMjU2ICA3ZWE1NTZj
ODQ2YjdiZmMzMmQ0N2I0MWNhZTU2ZDE4NjNhNmI2ZDVmNzA2YmIxNjI3NzhkNmYyOTg0OTA5Nzdj
ICBsaWJkdmRjc3MtMS42LjAudGFyLnh6CiAKICMgSGFzaCBmb3IgbGljZW5zZSBmaWxlOgogc2hh
MjU2ICA4MTc3Zjk3NTEzMjEzNTI2ZGYyY2Y2MTg0ZDhmZjk4NmM2NzVhZmI1MTRkNGU2OGE0MDQw
MTA1MjFiODgwNjQzICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYmR2ZGNzcy9saWJk
dmRjc3MubWsgYi9wYWNrYWdlL2xpYmR2ZGNzcy9saWJkdmRjc3MubWsKaW5kZXggZGFlNjJmYjU5
Mi4uYTk1MzE0NTU0NyAxMDA2NDQKLS0tIGEvcGFja2FnZS9saWJkdmRjc3MvbGliZHZkY3NzLm1r
CisrKyBiL3BhY2thZ2UvbGliZHZkY3NzL2xpYmR2ZGNzcy5tawpAQCAtNCw3ICs0LDcgQEAKICMK
ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLUxJQkRWRENTU19WRVJTSU9OID0gMS41LjAKK0xJ
QkRWRENTU19WRVJTSU9OID0gMS42LjAKIExJQkRWRENTU19TT1VSQ0UgPSBsaWJkdmRjc3MtJChM
SUJEVkRDU1NfVkVSU0lPTikudGFyLnh6CiBMSUJEVkRDU1NfU0lURSA9IGh0dHBzOi8vZG93bmxv
YWQudmlkZW9sYW4ub3JnL3B1Yi92aWRlb2xhbi9saWJkdmRjc3MvJChMSUJEVkRDU1NfVkVSU0lP
TikKIExJQkRWRENTU19JTlNUQUxMX1NUQUdJTkcgPSBZRVMKLS0gCjIuNDcuMwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
