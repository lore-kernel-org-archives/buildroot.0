Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F455CAC5AA
	for <buildroot@archiver.kernel.org>; Sun, 21 Sep 2025 14:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADD9583FC6;
	Sun, 21 Sep 2025 14:53:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bm6mEm2nc7GD; Sun, 21 Sep 2025 14:53:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7076F8409F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7076F8409F;
	Sun, 21 Sep 2025 14:53:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 64F07E7
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 14:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4561560A6A
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 14:53:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X_kN37YgIVgH for <buildroot@buildroot.org>;
 Sun, 21 Sep 2025 14:53:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=160.92.124.107;
 helo=smtp-outgoing-1903.laposte.net; envelope-from=vincent.stehle@laposte.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3F68060A4E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F68060A4E
Received: from smtp-outgoing-1903.laposte.net (smtp-outgoing-1903.laposte.net
 [160.92.124.107])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F68060A4E
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 14:53:48 +0000 (UTC)
X-mail-filterd: {"version":"1.9.4","queueID":"4cV5lC4QhZzdZLg","contextId":
 "01163b3e-7c07-4f19-83b3-094e543ae6f9"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0106.laposte.net (SMTP Server) with ESMTP id 4cV5lC4QhZzdZLg;
 Sun, 21 Sep 2025 14:53:27 +0200 (CEST)
X-mail-filterd: {"version":"1.9.4","queueID":"4cV5lC3CzZzdZLZ","contextId":
 "ad60f911-0a26-46ec-b481-e12ef988834e"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from romuald.bergerie (88-169-129-225.subs.proxad.net
 [88.169.129.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mlpnf0106.laposte.net (SMTP Server) with ESMTPSA id 4cV5lC3CzZzdZLZ;
 Sun, 21 Sep 2025 14:53:27 +0200 (CEST)
Received: from radicelle (radicelle.bergerie [192.168.42.3])
 by romuald.bergerie (Postfix) with ESMTP id BE7576A1890B;
 Sun, 21 Sep 2025 14:53:32 +0200 (CEST)
Received: from vincent by radicelle with local (Exim 4.98.2)
 (envelope-from <vincent@radicelle.bergerie>)
 id 1v0JaQ-000000002H9-0iha; Sun, 21 Sep 2025 14:54:38 +0200
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Sun, 21 Sep 2025 14:54:17 +0200
Message-ID: <20250921125422.7944-2-vincent.stehle@laposte.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250921125422.7944-1-vincent.stehle@laposte.net>
References: <20250921125422.7944-1-vincent.stehle@laposte.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=laposte.net; s=lpn-wlmd; t=1758466426;
 bh=h9hVZsBiXPwsZ8gfaePHUXDP+QBQkz7iRTZmfFrnKSc=;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=R/xjZmSohN+YUBMzptNO/TlJ5m741jhhTdK0O74xeOOYiTrXkh9RrhNiBabVC5QTC2nGqqYODqa1SAS5bAXiIROAQEPG/DGTLdnnfeHZDCgIjhhjJS3hDJezYrWEAS60cmtH76dYCxNfpL9jL/tN9CQuMKsGy9KDuM+Jzm8nM9wq5dTstacc4MoiE3SzM2CaGC4gZ4+ga+SypSQtiAXQWhKmjSLicCuc7yxHMMCb+4gcWjO4YCKOMPcL6mZV9FueUCIPNQ0FcdLW9H/QhXYgmJwbf9bdlOIyrsExkZXw1quVxXBQOQmX6QWrme6UepjyClam2hxmJWseObyYapSmdA==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=laposte.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=laposte.net header.i=@laposte.net header.a=rsa-sha256
 header.s=lpn-wlmd header.b=R/xjZmSo
Subject: [Buildroot] [PATCH 1/6 v2] hppa: Add new architecture
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
V2hpbGUgYXQgaXQsIGFkZCB0aGlzIGFyY2ggdG8gbXlzZWxmIGluIERFVkVMT1BFUlMuCgpTaWdu
ZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGxhcG9zdGUubmV0PgpD
YzogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgpDYzogSnVsaWVuIE9saXZh
aW4gPGp1Lm9AZnJlZS5mcj4KLS0tCgpDaGFuZ2VzIHYxIC0+IHYyOgogIC0gU2VsZWN0IEJSMl9B
UkNIX0hBU19OT19UT09MQ0hBSU5fQlVJTERST09UIHNpbmNlIG91ciBpbnRlcm5hbAogICAgdG9v
bGNoYWluIGJhY2tlbmQgZG9uJ3Qgc3VwcG9ydCB5ZXQgdGhpcyBhcmNoaXRlY3R1cmUKICAgIChz
dWdnZXN0ZWQgYnkgUm9tYWluKQogIC0gU3dpdGNoIHRvIGJpZyBlbmRpYW4gIChzdWdnZXN0ZWQg
YnkgSnVsaWVuKQoKIERFVkVMT1BFUlMgICAgICAgICAgfCAgMiArKwogYXJjaC9Db25maWcuaW4g
ICAgICB8IDEzICsrKysrKysrKysrKysKIGFyY2gvQ29uZmlnLmluLmhwcGEgfCAyMiArKysrKysr
KysrKysrKysrKysrKysrCiBhcmNoL2FyY2gubWsuaHBwYSAgIHwgMTMgKysrKysrKysrKysrKwog
NCBmaWxlcyBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJj
aC9Db25maWcuaW4uaHBwYQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJjaC5tay5ocHBhCgpk
aWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXggMTZkOWVlODkyYi4uZjQ2
NDg3MWRhNCAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBAIC0zMzYw
LDYgKzMzNjAsOCBAQCBGOglwYWNrYWdlL2VkazItbm9uLW9zaS8KIEY6CXN1cHBvcnQvdGVzdGlu
Zy90ZXN0cy9ib290L3Rlc3RfZWRrMi5weQogCiBOOglWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQu
c3RlaGxlQGxhcG9zdGUubmV0PgorRjoJYXJjaC9Db25maWcuaW4uaHBwYQorRjoJYXJjaC9hcmNo
Lm1rLmhwcGEKIEY6CWJvYXJkL2FybS9mb3VuZGF0aW9uLXY4LwogRjoJYm9hcmQvYmFuYW5hcGkv
YmFuYW5hcGktbTItemVyby8KIEY6CWNvbmZpZ3MvYXJtX2ZvdW5kYXRpb252OF9kZWZjb25maWcK
ZGlmZiAtLWdpdCBhL2FyY2gvQ29uZmlnLmluIGIvYXJjaC9Db25maWcuaW4KaW5kZXggMzQ0MjJj
MGQ1MC4uYjFjNWE1ZTc2MyAxMDA2NDQKLS0tIGEvYXJjaC9Db25maWcuaW4KKysrIGIvYXJjaC9D
b25maWcuaW4KQEAgLTczLDYgKzczLDE1IEBAIGNvbmZpZyBCUjJfYWFyY2g2NF9iZQogCSAgaHR0
cDovL3d3dy5hcm0uY29tL3Byb2R1Y3RzL3Byb2Nlc3NvcnMvaW5zdHJ1Y3Rpb24tc2V0LWFyY2hp
dGVjdHVyZXMvYXJtdjgtYXJjaGl0ZWN0dXJlLnBocAogCSAgaHR0cDovL2VuLndpa2lwZWRpYS5v
cmcvd2lraS9BUk0KIAorY29uZmlnIEJSMl9ocHBhCisJYm9vbCAiSFBQQSIKKwlzZWxlY3QgQlIy
X1VTRV9NTVUKKwlzZWxlY3QgQlIyX0FSQ0hfSEFTX05PX1RPT0xDSEFJTl9CVUlMRFJPT1QKKwlo
ZWxwCisJICBQcmVjaXNpb24gQXJjaGl0ZWN0dXJlIChhLmsuYS4gUEEtUklTQykgaXMgYSAzMi1i
aXQKKwkgIChiaWcgZW5kaWFuKSBhcmNoaXRlY3R1cmUgZGV2ZWxvcGVkIGJ5IEhld2xldHQgUGFj
a2FyZC4KKwkgIGh0dHBzOi8vZW4ud2lraXBlZGlhLm9yZy93aWtpL1BBLVJJU0MKKwogY29uZmln
IEJSMl9pMzg2CiAJYm9vbCAiaTM4NiIKIAlzZWxlY3QgQlIyX1VTRV9NTVUKQEAgLTM5Myw2ICs0
MDIsMTAgQEAgaWYgQlIyX2FybSB8fCBCUjJfYXJtZWIgfHwgQlIyX2FhcmNoNjQgfHwgQlIyX2Fh
cmNoNjRfYmUKIHNvdXJjZSAiYXJjaC9Db25maWcuaW4uYXJtIgogZW5kaWYKIAoraWYgQlIyX2hw
cGEKK3NvdXJjZSAiYXJjaC9Db25maWcuaW4uaHBwYSIKK2VuZGlmCisKIGlmIEJSMl9sb29uZ2Fy
Y2g2NAogc291cmNlICJhcmNoL0NvbmZpZy5pbi5sb29uZ2FyY2giCiBlbmRpZgpkaWZmIC0tZ2l0
IGEvYXJjaC9Db25maWcuaW4uaHBwYSBiL2FyY2gvQ29uZmlnLmluLmhwcGEKbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uNTc2ODQ2OWYzMAotLS0gL2Rldi9udWxsCisrKyBi
L2FyY2gvQ29uZmlnLmluLmhwcGEKQEAgLTAsMCArMSwyMiBAQAorY2hvaWNlCisJcHJvbXB0ICJU
YXJnZXQgQXJjaGl0ZWN0dXJlIFR5cGUiCisJaGVscAorCSAgQXJjaGl0ZWN0dXJlIHR5cGUgKG9y
IHZlcnNpb24pIHRvIHVzZS4KKworY29uZmlnIEJSMl9wYXJpc2MxMAorCWJvb2wgIlBBLVJJU0Mg
MS4wIgorY29uZmlnIEJSMl9wYXJpc2MxMQorCWJvb2wgIlBBLVJJU0MgMS4xIgorZW5kY2hvaWNl
CisKK2NvbmZpZyBCUjJfQVJDSAorCWRlZmF1bHQgImhwcGEiCisKK2NvbmZpZyBCUjJfTk9STUFM
SVpFRF9BUkNICisJZGVmYXVsdCAicGFyaXNjIgorCitjb25maWcgQlIyX0VORElBTgorCWRlZmF1
bHQgIkJJRyIKKworY29uZmlnIEJSMl9SRUFERUxGX0FSQ0hfTkFNRQorCWRlZmF1bHQgIkhQUEEi
CmRpZmYgLS1naXQgYS9hcmNoL2FyY2gubWsuaHBwYSBiL2FyY2gvYXJjaC5tay5ocHBhCm5ldyBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjlkMjJlNDM3MWYKLS0tIC9kZXYvbnVs
bAorKysgYi9hcmNoL2FyY2gubWsuaHBwYQpAQCAtMCwwICsxLDEzIEBACisjCisjIENvbmZpZ3Vy
ZSB0aGUgR0NDX1RBUkdFVF9BUkNIIHZhcmlhYmxlLgorIworCitpZmVxICgkKEJSMl9ocHBhKSx5
KQorCitpZmVxICgkKEJSMl9wYXJpc2MxMCkseSkKK0dDQ19UQVJHRVRfQVJDSCA6PSAxLjAKK2Vs
c2UgaWZlcSAoJChCUjJfcGFyaXNjMTEpLHkpCitHQ0NfVEFSR0VUX0FSQ0ggOj0gMS4xCitlbmRp
ZgorCitlbmRpZgotLSAKMi41MS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
