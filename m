Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C220E103E168
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 12:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8193B60698;
	Wed, 18 Mar 2026 12:37:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WxAp_LPSgI5w; Wed, 18 Mar 2026 12:37:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3065606BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773837442;
	bh=AkoP0OS311ZlMYvrHlpn0jaaLkbIaZt1I5SIB3JgpsA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HRMc0GQw2QhHX5YccnBtaT0YKv9xR48v43ZYKPW1x8JelB25n9z+PI57252xipKTr
	 +xEGNfbqUykFMsKm1WJWImYRlrdT7evNYRutDbi3u9ie0GTS4WCiIgH/S5AIybYDQQ
	 Oor11kBFeddV/CBSmAYk9cKTXf65wK0bT9NRE14wifN42bj99buZtBYD1BjPFpLglU
	 P08rHA7B7UpmYuYk0DssfLvXYUJGFZD7/5wurI4KT32FMPD0qICXCbmtG3pQOuykjn
	 h5sEsZcxl9zad43JQdIDR/g8PduIFA4mYQdWAbUCWgr0PZUr2wgdUNM9zCQNQXwXJG
	 v508vutdKq8cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3065606BF;
	Wed, 18 Mar 2026 12:37:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 16AB41BD
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 12:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10F8F8118E
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 12:37:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rOyflGUI1A6V for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 12:37:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BDCB081182
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDCB081182
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDCB081182
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 12:37:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A0491FCD;
 Wed, 18 Mar 2026 05:37:13 -0700 (PDT)
Received: from debian (X72Y076X74-2.nice.arm.com [10.34.125.25])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B920C3F778;
 Wed, 18 Mar 2026 05:37:18 -0700 (PDT)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Alistair Francis <alistair@alistair23.me>,
 Dowan Gullient <dowan.gullient@smile.fr>
Date: Wed, 18 Mar 2026 13:37:14 +0100
Message-ID: <20260318123714.2494747-1-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: [Buildroot] [PATCH] package/xen: fix armv7 build with gcc-15
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

QmFja3BvcnQgYSBwYXRjaCBmcm9tIFhlbiA0LjIxIHRvIGZpeCB0aGUgZm9sbG93aW5nIGJ1aWxk
IGVycm9ycyBmb3IgQXJtIHY3CndpdGggZ2NjLTE1OgoKICB4ZW4tNC4xNC42L3hlbi9pbmNsdWRl
L2FzbS9wbGF0Zm9ybXMvbWlkd2F5Lmg6MTogZXJyb3I6IGhlYWRlciBndWFyZCAnX19BU01fQVJN
X1BMQVRGT1JNU19NSURXQVlfSCcgZm9sbG93ZWQgYnkgJyNkZWZpbmUnIG9mIGEgZGlmZmVyZW50
IG1hY3JvIFstV2Vycm9yPWhlYWRlci1ndWFyZF0KICB4ZW4tNC4xNC42L3hlbi9pbmNsdWRlL2Fz
bS9wbGF0Zm9ybXMvb21hcDUuaDoxOiBlcnJvcjogaGVhZGVyIGd1YXJkICdfX0FTTV9BUk1fUExB
VEZPUk1TX09NQVA1X0gnIGZvbGxvd2VkIGJ5ICcjZGVmaW5lJyBvZiBhIGRpZmZlcmVudCBtYWNy
byBbLVdlcnJvcj1oZWFkZXItZ3VhcmRdCgpTaW5jZSB0aGUgZXh0ZXJuYWwgMzJiIGFybSB0b29s
Y2hhaW4gaGFzIGJlZW4gdXBkYXRlZCB0byBhIHZlcnNpb24gYmFzZWQgb24KZ2NjLTE1LCB0aGUg
dGVzdHMucGFja2FnZS50ZXN0X3hlbi5UZXN0WGVuQXJtdjcgcHl0aG9uIHRlc3QgZG9lcyBub3Qg
YnVpbGQKYW55bW9yZS4KQWRkaW5nIHRoZSBwYXRjaCByZXBhaXJzIGl0LgoKTGluazogaHR0cHM6
Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8xMzUxODMxODQ3MwpG
aXhlczogODZkNDUzYTdkYzA4ICgidG9vbGNoYWluL3Rvb2xjaGFpbi1leHRlcm5hbC90b29sY2hh
aW4tZXh0ZXJuYWwtYXJtLWFybTogYnVtcCB0byAxNS4yLnJlbDEiKQpTaWduZWQtb2ZmLWJ5OiBW
aW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+CkNjOiBBbGlzdGFpciBGcmFu
Y2lzIDxhbGlzdGFpckBhbGlzdGFpcjIzLm1lPgpDYzogRG93YW4gR3VsbGllbnQgPGRvd2FuLmd1
bGxpZW50QHNtaWxlLmZyPgotLS0KIC4uLjktQXJtLXBsYXRmb3Jtcy1maXgtYnVpbGQtd2l0aC1n
Y2MxNS5wYXRjaCB8IDQ2ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA0NiBp
bnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS94ZW4vMDAwOS1Bcm0tcGxh
dGZvcm1zLWZpeC1idWlsZC13aXRoLWdjYzE1LnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS94
ZW4vMDAwOS1Bcm0tcGxhdGZvcm1zLWZpeC1idWlsZC13aXRoLWdjYzE1LnBhdGNoIGIvcGFja2Fn
ZS94ZW4vMDAwOS1Bcm0tcGxhdGZvcm1zLWZpeC1idWlsZC13aXRoLWdjYzE1LnBhdGNoCm5ldyBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmZiOTVjYTlmYTUKLS0tIC9kZXYvbnVs
bAorKysgYi9wYWNrYWdlL3hlbi8wMDA5LUFybS1wbGF0Zm9ybXMtZml4LWJ1aWxkLXdpdGgtZ2Nj
MTUucGF0Y2gKQEAgLTAsMCArMSw0NiBAQAorRnJvbSBkMTI2NjZkNzRkYzc0MmJiMDZjMzBiOTZk
NmI4NzRhM2UxNGM2YjQ2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgorRGF0ZTogVHVlLCAyNiBBdWcgMjAyNSAwODo0MToxOCAr
MDIwMAorU3ViamVjdDogW1BBVENIXSBBcm0vcGxhdGZvcm1zOiBmaXggYnVpbGQgd2l0aCBnY2Mx
NQorTUlNRS1WZXJzaW9uOiAxLjAKK0NvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1V
VEYtOAorQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAorCitGb3IgdHdvIG9mIHRoZSBo
ZWFkZXJzIGdjYzE1IGNvbXBsYWlucyAiaGVhZGVyIGd1YXJkIC4uLiBmb2xsb3dlZCBieQorJyNk
ZWZpbmUnIG9mIGEgZGlmZmVyZW50IG1hY3JvIi4gTWlzcmEgY2VydGFpbmx5IHdvdWxkbid0IGhh
dmUgbGlrZWQKK3RoaXMgZWl0aGVyLCBpZiB0aGVzZSBoZWFkZXJzIHdlcmUgY292ZXJlZCBieSBh
IHNjYW4uCisKK1NpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
K0Fja2VkLWJ5OiBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnplbEBhbWQuY29tPgorVXBzdHJlYW06
IGh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9Y29tbWl0ZGlmZjto
PTM5Zjk1MDg5ZTJiYTE1YzU0MzhjZTkwNGMwY2JiZDhkNzlkM2U2ZTcKK1NpZ25lZC1vZmYtYnk6
IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KKy0tLQorIHhlbi9pbmNs
dWRlL2FzbS1hcm0vcGxhdGZvcm1zL21pZHdheS5oIHwgMiArLQorIHhlbi9pbmNsdWRlL2FzbS1h
cm0vcGxhdGZvcm1zL29tYXA1LmggIHwgMiArLQorIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFy
bS9wbGF0Zm9ybXMvbWlkd2F5LmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL3BsYXRmb3Jtcy9taWR3
YXkuaAoraW5kZXggMDk5ZTQzNS4uNjkxNDM5MyAxMDA2NDQKKy0tLSBhL3hlbi9pbmNsdWRlL2Fz
bS1hcm0vcGxhdGZvcm1zL21pZHdheS5oCisrKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL3BsYXRm
b3Jtcy9taWR3YXkuaAorQEAgLTEsNSArMSw1IEBACisgI2lmbmRlZiBfX0FTTV9BUk1fUExBVEZP
Uk1TX01JRFdBWV9ICistI2RlZmluZSBfX0FTTV9BU01fUExBVEZPUk1TX01JRFdBWV9ICisrI2Rl
ZmluZSBfX0FTTV9BUk1fUExBVEZPUk1TX01JRFdBWV9ICisgCisgLyogYWRkcmVzc2VzIG9mIFNS
RUcgcmVnaXN0ZXJzIGZvciByZXNldHRpbmcgdGhlIFNvQyAqLworICNkZWZpbmUgTVdfU1JFR19Q
V1JfUkVRICAgICAgICAgICAgIDB4ZmZmM2NmMDAKK2RpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9h
c20tYXJtL3BsYXRmb3Jtcy9vbWFwNS5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9wbGF0Zm9ybXMv
b21hcDUuaAoraW5kZXggYzU1OWM4NC4uODg2N2I0NSAxMDA2NDQKKy0tLSBhL3hlbi9pbmNsdWRl
L2FzbS1hcm0vcGxhdGZvcm1zL29tYXA1LmgKKysrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vcGxh
dGZvcm1zL29tYXA1LmgKK0BAIC0xLDUgKzEsNSBAQAorICNpZm5kZWYgX19BU01fQVJNX1BMQVRG
T1JNU19PTUFQNV9ICistI2RlZmluZSBfX0FTTV9BU01fUExBVEZPUk1TX09NQVA1X0gKKysjZGVm
aW5lIF9fQVNNX0FSTV9QTEFURk9STVNfT01BUDVfSAorIAorICNkZWZpbmUgUkVBTFRJTUVfQ09V
TlRFUl9CQVNFICAgICAgICAgICAgICAgICAgIDB4NDgyNDMyMDAKKyAjZGVmaW5lIElOQ1JFTUVO
VEVSX05VTUVSQVRPUl9PRkZTRVQgICAgICAgICAgICAweDEwCistLSAKKzIuNTMuMAorCi0tIAoy
LjUxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
