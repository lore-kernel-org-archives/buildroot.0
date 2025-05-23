Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76EABC54EDA
	for <buildroot@archiver.kernel.org>; Fri, 23 May 2025 17:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E318484012;
	Fri, 23 May 2025 17:42:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PkAEbJ-shNNZ; Fri, 23 May 2025 17:42:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B58A8400D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B58A8400D;
	Fri, 23 May 2025 17:42:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 785B368
 for <buildroot@buildroot.org>; Fri, 23 May 2025 17:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69DE080E88
 for <buildroot@buildroot.org>; Fri, 23 May 2025 17:42:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ehkgw7iFHC22 for <buildroot@buildroot.org>;
 Fri, 23 May 2025 17:42:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=160.92.124.102;
 helo=smtp-outgoing-1801.laposte.net; envelope-from=vincent.stehle@laposte.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1296980E79
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1296980E79
Received: from smtp-outgoing-1801.laposte.net (smtp-outgoing-1801.laposte.net
 [160.92.124.102])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1296980E79
 for <buildroot@buildroot.org>; Fri, 23 May 2025 17:42:24 +0000 (UTC)
X-mail-filterd: {"version":"1.9.1","queueID":"4b3stQ0fNwzKm44","contextId":
 "5054fa7d-f38b-4ec2-85d4-8aa1472eb768"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0115.laposte.net (SMTP Server) with ESMTP id 4b3stQ0fNwzKm44;
 Fri, 23 May 2025 19:42:22 +0200 (CEST)
X-mail-filterd: {"version":"1.9.1","queueID":"4b3stP6HZNzKm43","contextId":
 "f3b061a7-f638-4cb7-977a-e2976eea319c"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from romuald.bergerie (88-169-129-225.subs.proxad.net
 [88.169.129.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mlpnf0115.laposte.net (SMTP Server) with ESMTPSA id 4b3stP6HZNzKm43;
 Fri, 23 May 2025 19:42:21 +0200 (CEST)
Received: from radicelle (radicelle.bergerie [192.168.42.3])
 by romuald.bergerie (Postfix) with ESMTP id D43C1670D666;
 Fri, 23 May 2025 19:42:30 +0200 (CEST)
Received: from vincent by radicelle with local (Exim 4.98.1)
 (envelope-from <vincent@radicelle.bergerie>)
 id 1uIWQN-0000000022X-0YnD; Fri, 23 May 2025 19:43:15 +0200
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Date: Fri, 23 May 2025 19:43:09 +0200
Message-ID: <20250523174313.7056-2-vincent.stehle@laposte.net>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250523174313.7056-1-vincent.stehle@laposte.net>
References: <20250523174313.7056-1-vincent.stehle@laposte.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=laposte.net; s=lpn-wlmd; t=1748022142;
 bh=C0FlbdPPZp+9IGQQBuk1K1KX9uKLDY/jfEXO0DLUiYU=;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=HqHYXid7NyTLu/zmeArt+VwGOzAYPQfCrl6V9SwbZTnoT+KPKg9d81YLX+770diJVEZvgUVP3nC47Z8T9omuzXf4UVoZ6lHDif6fDWEirXeWKhrlxibKI7sjtZ/TfX8r8T1AxD2O8lOCk889llKhc7pvtylm6ywgFvN7u2bURxjDX9qYeVarRAXXMM3Z5KeoX+se3k3xl3v4anx5V0ahWG9RbfrEpYEVGKK4c/EMvdq/9+7OucXn7F2nPvInQWzl17igzWR+5L0xu88E0jL5/x+SxgNfUKcc/wBHc6fC3Vby7ayEA75uxlDhF+pX6Vx51JszLlN1gB2AYj/4UBYvKQ==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=laposte.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=laposte.net header.i=@laposte.net header.a=rsa-sha256
 header.s=lpn-wlmd header.b=HqHYXid7
Subject: [Buildroot] [PATCH 1/5] hppa: Add new architecture
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
From: =?utf-8?q?Vincent_Stehl=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIHN1cHBvcnQgZm9yIHRoZSBQcmVjaXNpb24gQXJjaGl0ZWN0dXJlIChhLmsuYS4gUEEtUklT
QyksCmEgMzItYml0IGFyY2hpdGVjdHVyZSBkZXZlbG9wZWQgYnkgSGV3bGV0dCBQYWNrYXJkLgoK
V2hpbGUgYXQgaXQsIGFkZCBteXNlbGYgaW4gREVWRUxPUEVSUy4KClNpZ25lZC1vZmYtYnk6IFZp
bmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAbGFwb3N0ZS5uZXQ+Ci0tLQogREVWRUxPUEVS
UyAgICAgICAgICB8ICAyICsrCiBhcmNoL0NvbmZpZy5pbiAgICAgIHwgMTIgKysrKysrKysrKysr
CiBhcmNoL0NvbmZpZy5pbi5ocHBhIHwgMjIgKysrKysrKysrKysrKysrKysrKysrKwogYXJjaC9h
cmNoLm1rLmhwcGEgICB8IDEzICsrKysrKysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgNDkgaW5z
ZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvQ29uZmlnLmluLmhwcGEKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBhcmNoL2FyY2gubWsuaHBwYQoKZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMg
Yi9ERVZFTE9QRVJTCmluZGV4IGQ0NzFiOWFiNmYuLjQ3ZjNlMDMwZTUgMTAwNjQ0Ci0tLSBhL0RF
VkVMT1BFUlMKKysrIGIvREVWRUxPUEVSUwpAQCAtMzM4MSw2ICszMzgxLDggQEAgRjoJcGFja2Fn
ZS9lZGsyLW5vbi1vc2kvCiBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvYm9vdC90ZXN0X2VkazIu
cHkKIAogTjoJVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBsYXBvc3RlLm5ldD4KK0Y6
CWFyY2gvQ29uZmlnLmluLmhwcGEKK0Y6CWFyY2gvYXJjaC5tay5ocHBhCiBGOglib2FyZC9hcm0v
Zm91bmRhdGlvbi12OC8KIEY6CWJvYXJkL2JhbmFuYXBpL2JhbmFuYXBpLW0yLXplcm8vCiBGOglj
b25maWdzL2FybV9mb3VuZGF0aW9udjhfZGVmY29uZmlnCmRpZmYgLS1naXQgYS9hcmNoL0NvbmZp
Zy5pbiBiL2FyY2gvQ29uZmlnLmluCmluZGV4IDZiNTRjNjVkZjkuLmI5NGFlNGRlZjYgMTAwNjQ0
Ci0tLSBhL2FyY2gvQ29uZmlnLmluCisrKyBiL2FyY2gvQ29uZmlnLmluCkBAIC03Myw2ICs3Mywx
NCBAQCBjb25maWcgQlIyX2FhcmNoNjRfYmUKIAkgIGh0dHA6Ly93d3cuYXJtLmNvbS9wcm9kdWN0
cy9wcm9jZXNzb3JzL2luc3RydWN0aW9uLXNldC1hcmNoaXRlY3R1cmVzL2FybXY4LWFyY2hpdGVj
dHVyZS5waHAKIAkgIGh0dHA6Ly9lbi53aWtpcGVkaWEub3JnL3dpa2kvQVJNCiAKK2NvbmZpZyBC
UjJfaHBwYQorCWJvb2wgIkhQUEEiCisJc2VsZWN0IEJSMl9VU0VfTU1VCisJaGVscAorCSAgUHJl
Y2lzaW9uIEFyY2hpdGVjdHVyZSAoYS5rLmEuIFBBLVJJU0MpIGlzIGEgMzItYml0CisJICBhcmNo
aXRlY3R1cmUgZGV2ZWxvcGVkIGJ5IEhld2xldHQgUGFja2FyZC4KKwkgIGh0dHBzOi8vZW4ud2lr
aXBlZGlhLm9yZy93aWtpL1BBLVJJU0MKKwogY29uZmlnIEJSMl9pMzg2CiAJYm9vbCAiaTM4NiIK
IAlzZWxlY3QgQlIyX1VTRV9NTVUKQEAgLTM3Myw2ICszODEsMTAgQEAgaWYgQlIyX2FybSB8fCBC
UjJfYXJtZWIgfHwgQlIyX2FhcmNoNjQgfHwgQlIyX2FhcmNoNjRfYmUKIHNvdXJjZSAiYXJjaC9D
b25maWcuaW4uYXJtIgogZW5kaWYKIAoraWYgQlIyX2hwcGEKK3NvdXJjZSAiYXJjaC9Db25maWcu
aW4uaHBwYSIKK2VuZGlmCisKIGlmIEJSMl9tNjhrCiBzb3VyY2UgImFyY2gvQ29uZmlnLmluLm02
OGsiCiBlbmRpZgpkaWZmIC0tZ2l0IGEvYXJjaC9Db25maWcuaW4uaHBwYSBiL2FyY2gvQ29uZmln
LmluLmhwcGEKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uNzg1OWE4YTIz
YQotLS0gL2Rldi9udWxsCisrKyBiL2FyY2gvQ29uZmlnLmluLmhwcGEKQEAgLTAsMCArMSwyMiBA
QAorY2hvaWNlCisJcHJvbXB0ICJUYXJnZXQgQXJjaGl0ZWN0dXJlIFR5cGUiCisJaGVscAorCSAg
QXJjaGl0ZWN0dXJlIHR5cGUgKG9yIHZlcnNpb24pIHRvIHVzZS4KKworY29uZmlnIEJSMl9wYXJp
c2MxMAorCWJvb2wgIlBBLVJJU0MgMS4wIgorY29uZmlnIEJSMl9wYXJpc2MxMQorCWJvb2wgIlBB
LVJJU0MgMS4xIgorZW5kY2hvaWNlCisKK2NvbmZpZyBCUjJfQVJDSAorCWRlZmF1bHQgImhwcGEi
CisKK2NvbmZpZyBCUjJfTk9STUFMSVpFRF9BUkNICisJZGVmYXVsdCAicGFyaXNjIgorCitjb25m
aWcgQlIyX0VORElBTgorCWRlZmF1bHQgIkxJVFRMRSIKKworY29uZmlnIEJSMl9SRUFERUxGX0FS
Q0hfTkFNRQorCWRlZmF1bHQgIkhQUEEiCmRpZmYgLS1naXQgYS9hcmNoL2FyY2gubWsuaHBwYSBi
L2FyY2gvYXJjaC5tay5ocHBhCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAu
LjlkMjJlNDM3MWYKLS0tIC9kZXYvbnVsbAorKysgYi9hcmNoL2FyY2gubWsuaHBwYQpAQCAtMCww
ICsxLDEzIEBACisjCisjIENvbmZpZ3VyZSB0aGUgR0NDX1RBUkdFVF9BUkNIIHZhcmlhYmxlLgor
IworCitpZmVxICgkKEJSMl9ocHBhKSx5KQorCitpZmVxICgkKEJSMl9wYXJpc2MxMCkseSkKK0dD
Q19UQVJHRVRfQVJDSCA6PSAxLjAKK2Vsc2UgaWZlcSAoJChCUjJfcGFyaXNjMTEpLHkpCitHQ0Nf
VEFSR0VUX0FSQ0ggOj0gMS4xCitlbmRpZgorCitlbmRpZgotLSAKMi40Ny4yCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
