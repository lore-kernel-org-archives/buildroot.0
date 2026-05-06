Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37503CD342C
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 12:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E68BA80E07;
	Wed,  6 May 2026 12:18:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K1jSrbeWhh10; Wed,  6 May 2026 12:18:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F13CF81230
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778069898;
	bh=GCLm3MAzZ/ODh+UsIVFwZMA/iC+xFzzqlvBvroyDD8s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=RV+53kR+jPILJlxuH1SkSejrjpxFQWlXxcHueGRI9uVYbmx+hORRzlG6uX8VmyrUV
	 mIotPUldQDWTKATVwaU4UK1XIG4l8uCmPgrGaCXY1G3UD/CBGJkqjj+tVRVCqaKwv6
	 iIUR7b3x5QFIFVeEKecAExah8/NRzGuteLzzcHQ5WoSQ57Z5jStwtM81g8eHF2QBLH
	 JACk43pQ73YQanm3red00aZu6ze+vzmIYNeQjXaxRUuW/vhbDvQTa5mapmtvRUe+Eq
	 2iRXB+nPwFIzhCYrmcNTbYje8VqSfY3IzbIo4GqObIOG9BhoiLwvhTxgserj9OW6Et
	 j2uqWOQy+aqiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F13CF81230;
	Wed,  6 May 2026 12:18:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EFBBE11B
 for <buildroot@buildroot.org>; Wed,  6 May 2026 12:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D606140591
 for <buildroot@buildroot.org>; Wed,  6 May 2026 12:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bwqyRRw_xxVW for <buildroot@buildroot.org>;
 Wed,  6 May 2026 12:18:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DA8584058F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA8584058F
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA8584058F
 for <buildroot@buildroot.org>; Wed,  6 May 2026 12:18:15 +0000 (UTC)
Received: from bubutux.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 213F02C84123;
 Wed, 06 May 2026 14:18:13 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 14:17:58 +0200
Message-ID: <20260506121800.507252-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1778069893; bh=HLggiZprFI6O53H12p/SQGqnywdTBOPc7at2KXCHzNc=;
 h=From:To:Cc:Subject:Date;
 b=GwlAepNM5qe4fvwSbb8mmoHJAZstMFIUXTn+5/3m/v16jqHmWf4Ri9nkZtPMjUcKV
 lN066B+gX9jawHha8JX0QPVkmdG+kFVeMf202/77AxeiioBgKJoq31HU0hfF5owXqC
 f0WNldP9cZrweF0i6N+Yec/UZSNOfsafgF64AgYQU1YmoXRe+sw+61ElwPCSGFBqGZ
 HVd8+r3Xjnmp/VQADWlIJzGwtmblSVP/LLL220D5cCJrKTza84zH8O+0UaCCHl1tez
 iJULkAlFLds2X8kiA7Z9caalMNgwzB3yG/iYt2TQpaMt1/xFZXsJNGVI6jeU7/S9We
 QIzVi/HZAvOaw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=GwlAepNM
Subject: [Buildroot] [PATCH] package/python-django: security bump to 6.0.5
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Manuel Diener <manuel.diener@oss.othermo.de>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RGphbmdvIDYuMC41IGZpeGVzIHRocmVlIHNlY3VyaXR5IGlzc3VlcyB3aXRoIHNldmVyaXR5IOKA
nGxvd+KAnSBhbmQgc2V2ZXJhbCBidWdzIGluIDYuMC40LgoKU2VjdXJpdHkgRml4ZXM6CiogQ1ZF
LTIwMjYtNTc2NjogUG90ZW50aWFsIGRlbmlhbC1vZi1zZXJ2aWNlIHZ1bG5lcmFiaWxpdHkgaW4g
QVNHSQogICAgcmVxdWVzdHMgdmlhIGZpbGUgdXBsb2FkIGxpbWl0IGJ5cGFzcyBBU0dJIHJlcXVl
c3RzIHdpdGggYSBtaXNzaW5nCiAgICBvciB1bmRlcnN0YXRlZCBDb250ZW50LUxlbmd0aCBoZWFk
ZXIgY291bGQgYnlwYXNzIHRoZQogICAgRklMRV9VUExPQURfTUFYX01FTU9SWV9TSVpFIGxpbWl0
LCBwb3RlbnRpYWxseSBsb2FkaW5nIGxhcmdlIGZpbGVzIGludG8KICAgIG1lbW9yeSBhbmQgY2F1
c2luZyBzZXJ2aWNlIGRlZ3JhZGF0aW9uLgoKICAgIEFzIGEgcmVtaW5kZXIsIERqYW5nbyBleHBl
Y3RzIGEgbGltaXQgdG8gYmUgY29uZmlndXJlZCBhdCB0aGUgd2ViIHNlcnZlcgogICAgbGV2ZWwg
cmF0aGVyIHRoYW4gc29sZWx5IHJlbHlpbmcgb24gRklMRV9VUExPQURfTUFYX01FTU9SWV9TSVpF
LgoKICAgIFRoaXMgaXNzdWUgaGFzIHNldmVyaXR5IOKAnGxvd+KAnSBhY2NvcmRpbmcgdG8gdGhl
IERqYW5nbyBzZWN1cml0eSBwb2xpY3kKCiogQ1ZFLTIwMjYtMzUxOTI6IFNlc3Npb24gZml4YXRp
b24gdmlhIHB1YmxpYyBjYWNoZWQgcGFnZXMgYW5kIFNFU1NJT05fU0FWRV9FVkVSWV9SRVFVRVNU
CiAgICBSZXNwb25zZSBoZWFkZXJzIGRpZCBub3QgdmFyeSBvbiBjb29raWVzIGlmIGEgc2Vzc2lv
biB3YXMgbm90IG1vZGlmaWVkLAogICAgYnV0IFNFU1NJT05fU0FWRV9FVkVSWV9SRVFVRVNUIHdh
cyBUcnVlLiBBIHJlbW90ZSBhdHRhY2tlciBjb3VsZCBzdGVhbCBhCiAgICB1c2Vy4oCZcyBzZXNz
aW9uIGFmdGVyIHRoYXQgdXNlciB2aXNpdHMgYSBjYWNoZWQgcHVibGljIHBhZ2UuCgogICAgVGhp
cyBpc3N1ZSBoYXMgc2V2ZXJpdHkg4oCcbG934oCdIGFjY29yZGluZyB0byB0aGUgRGphbmdvIHNl
Y3VyaXR5IHBvbGljeS4KCiogQ1ZFLTIwMjYtNjkwNzogUG90ZW50aWFsIGV4cG9zdXJlIG9mIHBy
aXZhdGUgZGF0YSBkdWUgdG8gaW5jb3JyZWN0CiAgICBoYW5kbGluZyBvZiBWYXJ5OiAqIGluIFVw
ZGF0ZUNhY2hlTWlkZGxld2FyZQoKICAgIFByZXZpb3VzbHksIFVwZGF0ZUNhY2hlTWlkZGxld2Fy
ZSB3b3VsZCBlcnJvbmVvdXNseSBjYWNoZSByZXF1ZXN0cyB3aGVyZQogICAgdGhlIFZhcnkgaGVh
ZGVyIGNvbnRhaW5lZCBhbiBhc3RlcmlzayAoJyonKS4gVGhpcyBjb3VsZCBsZWFkIHRvIHByaXZh
dGUKICAgIGRhdGEgYmVpbmcgc3RvcmVkIGFuZCBzZXJ2ZWQuCgogICAgVGhpcyBpc3N1ZSBoYXMg
c2V2ZXJpdHkg4oCcbG934oCdIGFjY29yZGluZyB0byB0aGUgRGphbmdvIHNlY3VyaXR5IHBvbGlj
eS4KCkJ1Z2ZpeGVzOgoqIEZpeGVkIGEgbWlzcGxhY2VkIDwvZGl2PiBpbiB0aGUKICBkamFuZ28v
Y29udHJpYi9hZG1pbi90ZW1wbGF0ZXMvYWRtaW4vY2hhbmdlX2xpc3QuaHRtbCB0ZW1wbGF0ZSBh
ZGRlZAogIGluIERqYW5nbyA2LjAgdGhhdCBjb3VsZCBiZSBwcm9ibGVtYXRpYyB3aGVuIG92ZXJy
aWRpbmcgdGhlIHBhZ2luYXRpb24KICBibG9jayAoIzM3MDI5KS4KKiBGaXhlZCBhIGJ1ZyBpbiBE
amFuZ28gNi4wIHdoZXJlIGRlcHJlY2F0aW9uIHdhcm5pbmdzIGluY29ycmVjdGx5CiAgc2tpcHBl
ZCBsaW5lcyBmcm9tIHRoaXJkLXBhcnR5IHBhY2thZ2VzIHByZWZpeGVkIHdpdGgg4oCcZGphbmdv
4oCdCiAgKCMzNzA2NykuCgpSZWxlYXNlIG5vdGVzOiBodHRwczovL2RvY3MuZGphbmdvcHJvamVj
dC5jb20vZW4vNi4wL3JlbGVhc2VzLzYuMC41LwoKU2lnbmVkLW9mZi1ieTogTWFyY3VzIEhvZmZt
YW5uIDxidWlsZHJvb3RAYnVidTEuZXU+Ci0tLQogcGFja2FnZS9weXRob24tZGphbmdvL3B5dGhv
bi1kamFuZ28uaGFzaCB8IDQgKystLQogcGFja2FnZS9weXRob24tZGphbmdvL3B5dGhvbi1kamFu
Z28ubWsgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWRqYW5nby9weXRob24tZGphbmdv
Lmhhc2ggYi9wYWNrYWdlL3B5dGhvbi1kamFuZ28vcHl0aG9uLWRqYW5nby5oYXNoCmluZGV4IDZj
MzE3Y2Y2ZTAuLjVhZjA0M2YyYzIgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcHl0aG9uLWRqYW5nby9w
eXRob24tZGphbmdvLmhhc2gKKysrIGIvcGFja2FnZS9weXRob24tZGphbmdvL3B5dGhvbi1kamFu
Z28uaGFzaApAQCAtMSw2ICsxLDYgQEAKICMgbWQ1LCBzaGEyNTYgZnJvbSBodHRwczovL3B5cGku
b3JnL3B5cGkvZGphbmdvL2pzb24KLW1kNSAgOWQ0MjljYmVmOGM4MzU3YTQ4MGQwYjkyMGRkOWE5
NTYgIGRqYW5nby02LjAuNC50YXIuZ3oKLXNoYTI1NiAgOGNmYTI1NzJiM2YyNzY4YjJlODQ5ODNj
ZjNjNDgxMTg3N2EwMWVkYjY0ZTgxNzk4NmVjNWQ2MDc1MWMxMTNhYyAgZGphbmdvLTYuMC40LnRh
ci5negorbWQ1ICA0NGMxOGE4ZjI2NGMxMzI2ZTZmZTRmMTA1M2ZlYTVmYyAgZGphbmdvLTYuMC41
LnRhci5negorc2hhMjU2ICBiYzZkNjg3MmU5OGEyODY0YzgzNmU0MmVkZDY0NGIzNjJkYjMxMTE0
N2RkNWFhOGQ1YjgyYmE3YTAzMmY1MjY5ICBkamFuZ28tNi4wLjUudGFyLmd6CiAjIExvY2FsbHkg
Y29tcHV0ZWQgc2hhMjU2IGNoZWNrc3Vtcwogc2hhMjU2ICBiODQ2NDE1ZDFiNTE0ZTljMWRmZjE0
YTIyZGViOTA2ZDc5NGJjNTQ2Y2E2MTI5Zjk1MGExOGNkMDkxZTJhNjY5ICBMSUNFTlNFCiBzaGEy
NTYgIGJlMzBkYzBlM2Y3MDEwYWY2YzQ1M2QyMDVmZWFlY2UxZjg5NDk0Nzg5YjZlOTJmMGMyNTVl
ZjU5N2ExZTY4NjQgIGRqYW5nby9jb250cmliL2dpcy9tZWFzdXJlLnB5CmRpZmYgLS1naXQgYS9w
YWNrYWdlL3B5dGhvbi1kamFuZ28vcHl0aG9uLWRqYW5nby5tayBiL3BhY2thZ2UvcHl0aG9uLWRq
YW5nby9weXRob24tZGphbmdvLm1rCmluZGV4IDIwMWVlY2UxNjQuLmZlODgxMjhlMjQgMTAwNjQ0
Ci0tLSBhL3BhY2thZ2UvcHl0aG9uLWRqYW5nby9weXRob24tZGphbmdvLm1rCisrKyBiL3BhY2th
Z2UvcHl0aG9uLWRqYW5nby9weXRob24tZGphbmdvLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotUFlUSE9OX0RKQU5HT19WRVJTSU9OID0gNi4wLjQKK1BZ
VEhPTl9ESkFOR09fVkVSU0lPTiA9IDYuMC41CiBQWVRIT05fREpBTkdPX1NPVVJDRSA9IGRqYW5n
by0kKFBZVEhPTl9ESkFOR09fVkVSU0lPTikudGFyLmd6CiBQWVRIT05fREpBTkdPX1NJVEUgPSBo
dHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvc291cmNlL2QvZGphbmdvCiBQ
WVRIT05fREpBTkdPX0xJQ0VOU0UgPSBCU0QtMy1DbGF1c2UsIE1JVCAoanF1ZXJ5LCB1dGlscy9h
cmNoaXZlLnB5KSwgQlNELTItQ2xhdXNlIChpbmxpbmVzLmpzKSwgQ0MtQlktNC4wIChhZG1pbiBz
dmcgZmlsZXMpCi0tIAoyLjU0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
