Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A47CA1016
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 18:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 590A881337;
	Mon,  8 Sep 2025 18:38:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tU4VXiSK4QqQ; Mon,  8 Sep 2025 18:38:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2290A81330
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2290A81330;
	Mon,  8 Sep 2025 18:38:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B2ABE1D9
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 18:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4DE9402A8
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 18:38:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B-VxM6JzFPvl for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 18:38:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 91DC540101
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91DC540101
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 91DC540101
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 18:38:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id B4662C8F1E8
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 18:38:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 43D1F6061A;
 Mon,  8 Sep 2025 18:38:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C716B102F1CF6; 
 Mon,  8 Sep 2025 20:38:19 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?R=C3=A9mi=20R=C3=A9rolle?= <remi.rerolle@gmail.com>
Date: Mon,  8 Sep 2025 20:38:14 +0200
Message-ID: <20250908183816.3689041-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757356702; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=H8bGvXm2siIwP0KU3BfRS3UCWN3wbAMDT7sFfch2r+U=;
 b=Q9qWDCwshePUS/+y/1rgOiJqW7za3pXk6Ub3veqw/CDHCtoaqLXzQJypAV8SoBZq4a3txD
 cFb/w8qmC+9FNhNnMru5yaAj/DE46Js5PWC7X4VCFvY/MtQEBl5gR8kJ4HO6ZiXRemxE9c
 9g7ogmede5M/QcywR0BMdGaZFxKIo9XTkbb2SW4u2owYGF9trWw8KyFO2v6s92ymOY8n45
 CgdCSgeaLtDz4lBiyfU7KOPfZN/ONrSikU/ghFH8SdTt+nKa3LjXDBJ1elmWd2ktP+fFj8
 cCm+kiXNZRamHBo1e/ABXWIRnPeMcf86mTwG2B5H/k//g0jTpmq142cRToZ1sQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Q9qWDCws
Subject: [Buildroot] [PATCH] package/libfreeimage: fix build with GCC 14.x
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGFrZSB0d28gcGF0Y2hlcyBmcm9tIHRoZSBEZWJpYW4ganhybGliIHBhY2thZ2UsIGFuZCBpbnRl
Z3JhdGUgdGhlbSB0bwpmaXggdGhlIGJ1aWxkIG9mIHRoZSBidW5kbGVkIGp4cmxpYiBsaWJyYXJ5
IGZvdW5kIGluIHRoZSBsaWJmcmVlaW1hZ2UKcGFja2FnZS4KCmxpYmZyZWVpbWFnZSBpc24ndCBl
eGFjdGx5IHdlbGwgbWFpbnRhaW5lZDogaXRzIGxhc3QgdmVyc2lvbiAzLjE4LjAgaXMKcXVpdGUg
b2xkIChKdWx5IDIwMTgpLCB0aGVyZSdzIGEgZmFpcmx5IGxhcmdlIG51bWJlciBvZiB0aWNrZXRz
IGluIHRoZQpidWcgdHJhY2tlciBjbGFpbWluZyB0byBiZSBDVkUKcmVwb3J0cyAoaHR0cHM6Ly9z
b3VyY2Vmb3JnZS5uZXQvcC9mcmVlaW1hZ2UvYnVncy8pLCBpdCBpcyBzdGlsbCB1c2luZwpTVk4g
YXMgdGhlIHZlcnNpb24gY29udHJvbCBzeXN0ZW0uCgpIb3dldmVyLCBpdCBpcyB1c2VkIGFzIGFu
IG9wdGlvbmFsIGRlcGVuZGVuY3kgZm9yIENFR1VJLCBhbmQgYQptYW5kYXRvcnkgZGVwZW5kZW5j
eSBmb3IgT2dyZS4gSG93ZXZlciwgaXQgbm8gbG9uZ2VyIHNlZW1zIHRvIGJlIGEKZGVwZW5kZW5j
eSBmb3IgbW9yZSByZWNlbnQgdmVyc2lvbnMgb2YgT2dyZS4gQnV0IGluIGFueSBjYXNlIGl0IGNh
bm5vdApzaW1wbHkgYmUgZHJvcHBlZC4KCkZpeGVzOgoKICBodHRwczovL2F1dG9idWlsZC5idWls
ZHJvb3QubmV0L3Jlc3VsdHMvNDUyNDYyMjg1YmY5M2IxM2YwOTJmYjQxNjk2OTUyZjQxNWU3NWIy
Zi8KClNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9v
dGxpbi5jb20+Ci0tLQogLi4uLzAwMDUtanhybGliLWZ0YmZzLXdpdGgtR0NDLTE0LnBhdGNoICAg
ICAgIHwgNDAgKysrKysrKysrKysrKysrKysrKwogLi4uQkZTLWZpeC1mb3ItZnVuY3Rpb24tcHJv
dG90eXBlLWVycm9yLnBhdGNoIHwgMjkgKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwg
NjkgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbGliZnJlZWltYWdl
LzAwMDUtanhybGliLWZ0YmZzLXdpdGgtR0NDLTE0LnBhdGNoCiBjcmVhdGUgbW9kZSAxMDA2NDQg
cGFja2FnZS9saWJmcmVlaW1hZ2UvMDAwNi1GVEJGUy1maXgtZm9yLWZ1bmN0aW9uLXByb3RvdHlw
ZS1lcnJvci5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGliZnJlZWltYWdlLzAwMDUtanhy
bGliLWZ0YmZzLXdpdGgtR0NDLTE0LnBhdGNoIGIvcGFja2FnZS9saWJmcmVlaW1hZ2UvMDAwNS1q
eHJsaWItZnRiZnMtd2l0aC1HQ0MtMTQucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMDAwMC4uYzEzYThkYzI2ZgotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvbGliZnJl
ZWltYWdlLzAwMDUtanhybGliLWZ0YmZzLXdpdGgtR0NDLTE0LnBhdGNoCkBAIC0wLDAgKzEsNDAg
QEAKK0Zyb20gMTEzODNhMDE3ZThkMDQwZjEzNzZjOTY0ZDJiODc2OTEwODIwNGYwYiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IFlPS09UQSBIaXJvc2hpIDx5b2tvdGEuaGdtbEBnbWFp
bC5jb20+CitEYXRlOiBUaHUsIDI1IEp1bCAyMDI0IDE1OjAzOjMxICswOTAwCitTdWJqZWN0OiBb
UEFUQ0hdIGp4cmxpYjogZnRiZnMgd2l0aCBHQ0MtMTQKK01JTUUtVmVyc2lvbjogMS4wCitDb250
ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKK0NvbnRlbnQtVHJhbnNmZXItRW5j
b2Rpbmc6IDhiaXQKKworQnVnLURlYmlhbjogaHR0cHM6Ly9idWdzLmRlYmlhbi5vcmcvMTA3NTEw
NQorCitfYnl0ZXN3YXBfdWxvbmcoKSBpcyBkZWZpbmVkIGluIGltYWdlL3N5cy9zdHJjb2RlYy5j
CisKK1Vwc3RyZWFtOiBCdWcgc3VibWl0dGVkIGF0IGh0dHBzOi8vc291cmNlZm9yZ2UubmV0L3Av
ZnJlZWltYWdlL2J1Z3MvMzg5LworW1Rob21hczogcGF0Y2ggdGFrZW4gZnJvbSBodHRwczovL3Nv
dXJjZXMuZGViaWFuLm9yZy9wYXRjaGVzL2p4cmxpYi8xLjJ+Z2l0MjAxNzA2MTUuZjc1MjE4Ny01
LjMvMDAxMy1qeHJsaWItZnRiZnMtd2l0aC1HQ0MtMTQucGF0Y2gvXQorU2lnbmVkLW9mZi1ieTog
VGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KKy0tLS0KKy91
c3IvYmluL2NjIC1ERElTQUJMRV9QRVJGX01FQVNVUkVNRU5UIC1EX19BTlNJX18gLURqcGVneHJf
RVhQT1JUUyAtSSIvPDxQS0dCVUlMRERJUj4+L2NvbW1vbi9pbmNsdWRlIiAtSSIvPDxQS0dCVUlM
RERJUj4+L2ltYWdlL3N5cyIgLUkiLzw8UEtHQlVJTERESVI+Pi9qeHJnbHVlbGliIiAtSSIvPDxQ
S0dCVUlMRERJUj4+L2p4cnRlc3RsaWIiIC1nIC1PMiAtV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9u
LWRlY2xhcmF0aW9uIC1mZmlsZS1wcmVmaXgtbWFwPS88PFBLR0JVSUxERElSPj49LiAtZnN0YWNr
LXByb3RlY3Rvci1zdHJvbmcgLWZzdGFjay1jbGFzaC1wcm90ZWN0aW9uIC1XZm9ybWF0IC1XZXJy
b3I9Zm9ybWF0LXNlY3VyaXR5IC1mY2YtcHJvdGVjdGlvbiAtV2FsbCAtV2V4dHJhIC1XZGF0ZS10
aW1lIC1EX0ZPUlRJRllfU09VUkNFPTIgLWZQSUMgLXcgLU1EIC1NVCBDTWFrZUZpbGVzL2pwZWd4
ci5kaXIvaW1hZ2UvZW5jb2RlL3N0cmVuYy5jLm8gLU1GIENNYWtlRmlsZXMvanBlZ3hyLmRpci9p
bWFnZS9lbmNvZGUvc3RyZW5jLmMuby5kIC1vIENNYWtlRmlsZXMvanBlZ3hyLmRpci9pbWFnZS9l
bmNvZGUvc3RyZW5jLmMubyAtYyAiLzw8UEtHQlVJTERESVI+Pi9pbWFnZS9lbmNvZGUvc3RyZW5j
LmMiCisvPDxQS0dCVUlMRERJUj4+L2ltYWdlL2RlY29kZS9zZWdkZWMuYzogSW4gZnVuY3Rpb24g
4oCYX2xvYWQ04oCZOgorLzw8UEtHQlVJTERESVI+Pi9pbWFnZS9kZWNvZGUvc2VnZGVjLmM6Njg6
MTI6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhfYnl0ZXN3YXBf
dWxvbmfigJkgWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCisgICA2OCB8ICAgICBy
ZXR1cm4gX2J5dGVzd2FwX3Vsb25nKHYpOworICAgICAgfCAgICAgICAgICAgIF5+fn5+fn5+fn5+
fn5+fgorLS0tCisgU291cmNlL0xpYkpYUi9pbWFnZS9kZWNvZGUvc2VnZGVjLmMgfCAxICsKKyAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKKworZGlmZiAtLWdpdCBhL1NvdXJjZS9MaWJK
WFIvaW1hZ2UvZGVjb2RlL3NlZ2RlYy5jIGIvU291cmNlL0xpYkpYUi9pbWFnZS9kZWNvZGUvc2Vn
ZGVjLmMKK2luZGV4IDEyOTk0NTguLjgwNTAzNTUgMTAwNjQ0CistLS0gYS9Tb3VyY2UvTGliSlhS
L2ltYWdlL2RlY29kZS9zZWdkZWMuYworKysrIGIvU291cmNlL0xpYkpYUi9pbWFnZS9kZWNvZGUv
c2VnZGVjLmMKK0BAIC02Myw2ICs2Myw3IEBAIHN0YXRpYyBVMzIgX0ZPUkNFSU5MSU5FIF9sb2Fk
NCh2b2lkKiBwdikKKyAgICAgdiB8PSAoKFUzMikoKFUxNiAqKSBwdilbMV0pIDw8IDE2Ow0KKyAg
ICAgcmV0dXJuIF9ieXRlc3dhcF91bG9uZyh2KTsNCisgI2Vsc2UgLy8gX01fSUE2NA0KKysgICAg
VTMyIF9ieXRlc3dhcF91bG9uZyhVMzIgYml0cyk7IC8vIGZyb20gaW1hZ2Uvc3lzL3N0cmNvZGVj
LmMNCisgICAgIHJldHVybiBfYnl0ZXN3YXBfdWxvbmcoKihVMzIqKXB2KTsNCisgI2VuZGlmIC8v
IF9NX0lBNjQNCisgI2VuZGlmIC8vIF9CSUdfX0VORElBTl8NCistLSAKKzIuNTEuMAorCmRpZmYg
LS1naXQgYS9wYWNrYWdlL2xpYmZyZWVpbWFnZS8wMDA2LUZUQkZTLWZpeC1mb3ItZnVuY3Rpb24t
cHJvdG90eXBlLWVycm9yLnBhdGNoIGIvcGFja2FnZS9saWJmcmVlaW1hZ2UvMDAwNi1GVEJGUy1m
aXgtZm9yLWZ1bmN0aW9uLXByb3RvdHlwZS1lcnJvci5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCAwMDAwMDAwMDAwLi5iZGRhMzc2NDY3Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2Fn
ZS9saWJmcmVlaW1hZ2UvMDAwNi1GVEJGUy1maXgtZm9yLWZ1bmN0aW9uLXByb3RvdHlwZS1lcnJv
ci5wYXRjaApAQCAtMCwwICsxLDI5IEBACitGcm9tIDdiNTliMzc1NzUyMWQ4MjQwNjc3MWNjNDcx
MjdhYTcwZmZiMjZmM2YgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBZT0tPVEEgSGly
b3NoaSA8eW9rb3RhLmhnbWxAZ21haWwuY29tPgorRGF0ZTogVGh1LCAyNSBKdWwgMjAyNCAxNjow
MTowMSArMDkwMAorU3ViamVjdDogW1BBVENIXSBGVEJGUyBmaXggZm9yIGZ1bmN0aW9uIHByb3Rv
dHlwZSBlcnJvcgorCitCdWctRGViaWFuOiBodHRwczovL2J1Z3MuZGViaWFuLm9yZy8xMDc1MTA1
CisKK1Vwc3RyZWFtOiBCdWcgc3VibWl0dGVkIGF0IGh0dHBzOi8vc291cmNlZm9yZ2UubmV0L3Av
ZnJlZWltYWdlL2J1Z3MvMzg5LworW1Rob21hczogcGF0Y2ggdGFrZW4gZnJvbSBodHRwczovL3Nv
dXJjZXMuZGViaWFuLm9yZy9wYXRjaGVzL2p4cmxpYi8xLjJ+Z2l0MjAxNzA2MTUuZjc1MjE4Ny01
LjMvMDAxNS1GVEJGUy1maXgtZm9yLWZ1bmN0aW9uLXByb3RvdHlwZS1lcnJvci5wYXRjaC9dCitT
aWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4u
Y29tPgorLS0tCisgU291cmNlL0xpYkpYUi9qeHJnbHVlbGliL0pYUkdsdWVKeHIuYyB8IDEgKwor
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQorCitkaWZmIC0tZ2l0IGEvU291cmNlL0xp
YkpYUi9qeHJnbHVlbGliL0pYUkdsdWVKeHIuYyBiL1NvdXJjZS9MaWJKWFIvanhyZ2x1ZWxpYi9K
WFJHbHVlSnhyLmMKK2luZGV4IDJiZjA4NWEuLjE4MmZjN2YgMTAwNjQ0CistLS0gYS9Tb3VyY2Uv
TGliSlhSL2p4cmdsdWVsaWIvSlhSR2x1ZUp4ci5jCisrKysgYi9Tb3VyY2UvTGliSlhSL2p4cmds
dWVsaWIvSlhSR2x1ZUp4ci5jCitAQCAtMjgsNiArMjgsNyBAQAorIC8vKkBAQC0tLUBAQEAqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioNCisgI2luY2x1ZGUgPGxpbWl0cy5oPg0KKyAjaW5jbHVkZSA8SlhSR2x1ZS5oPg0KKysj
aW5jbHVkZSA8d2NoYXIuaD4NCisgDQorIA0KKyBzdGF0aWMgY29uc3QgY2hhciBzekhEUGhvdG9G
b3JtYXRbXSA9ICI8ZGM6Zm9ybWF0PmltYWdlL3ZuZC5tcy1waG90bzwvZGM6Zm9ybWF0PiI7DQor
LS0gCisyLjUxLjAKKwotLSAKMi41MS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
