Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B23C52D7C
	for <buildroot@archiver.kernel.org>; Tue, 13 Aug 2024 10:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2707280C62;
	Tue, 13 Aug 2024 10:04:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z3e7ASVhgrMp; Tue, 13 Aug 2024 10:04:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 323B680E3D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 323B680E3D;
	Tue, 13 Aug 2024 10:04:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C976C1BF35F
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 10:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B268380C6C
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 10:04:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w69tNFuoVLD0 for <buildroot@lists.busybox.net>;
 Tue, 13 Aug 2024 10:04:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.123;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 110CD80ADC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 110CD80ADC
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.123])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 110CD80ADC
 for <buildroot@buildroot.org>; Tue, 13 Aug 2024 10:04:36 +0000 (UTC)
Received: from unknown (HELO opfedv1rlp0h.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 12:04:36 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0h.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Aug 2024 12:04:36 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 12:04:35 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Tue, 13 Aug 2024 12:04:34 +0200
X-IronPort-AV: E=Sophos;i="6.09,285,1716242400"; d="scan'208";a="178909847"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Tue, 13 Aug 2024 12:04:31 +0200
Message-ID: <8402ba3c5551505159a155c5cf0fc5b58c6a3614.1723543467.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1723543467.git.yann.morin@orange.com>
References: <cover.1723543467.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX304.corporate.adroot.infra.ftgroup
 (10.115.26.13) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1723543477; x=1755079477;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l4uh5wF4iKBQtWel4atvYvt7fCxgrOAANsi9NDvrcpI=;
 b=nFj/U6djW/95KvtUaWdhC+MRO6BUmdOJ0Mt6yan93fDm/0GHGM7hhCaN
 Cgl58uzcLdZs24ogvrk32fh/qNnhUvjIKm2i3msNQPqSZx4eV4lxOzNts
 rQUKPaQTol5lgvdh23S1uJuDBRt3KJlscdOThCwS65y3QDq+60UHlpjVC
 AUsU4ISjjki3nvBYHhhF+DXDSqRbKs8KUeusNxbc15U550b1oP2ShiAiV
 dTxckK4gdqu0HGR1CgaFt2LsUtcgUJ/+GEzAMo2XCcmvoFeQ7fRPmxtal
 5/1oCpRzPHQDauZFmxz0AqSEVxLXmh/uPE8GIxiDI/yPkk6HPmTvJzyCd
 w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=nFj/U6dj
Subject: [Buildroot] [PATCH 3/3] toolchain/wrapper: move -ztext from LDFLAGS
 to toolchain wrapper
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>, yann.morin@orange.com,
 =?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogIllhbm4gRS4gTU9SSU4iIDx5YW5uLm1vcmluQG9yYW5nZS5jb20+CgpQYXNzaW5nIGxp
bmtlciBmbGFncyB2aWEgTERGTEFHUyBpcyBub3RvcmlvdXNseSBmcmFnaWxlOiBwYWNrYWdlcyBl
aXRoZXIKdXNlIExERkxBR1Mgd2l0aCB0aGUgZ2NjIGZyb250ZW5kLCBvciBkaXJlY3RseSB3aXRo
IGxkLiBUaGlzIG1lYW5zIHRoYXQKY2FyZSBtdXN0IGJlIHRha2VuIHRvIG9ubHkgcGFzcyBmbGFn
cyB0aGF0IGFyZSByZWNvZ25pc2VkIGJ5IGJvdGggZ2NjCmFuZCBsZCwgd2hpY2ggdXN1YWxseSBw
cm92ZXMgYSBiaXQgY2hhbGxlbmdpbmcsIGFzIGJkMDM1ODcyYmU5OQoocGFja2FnZS9NYWtlZmls
ZS5pbjogVXNlICIteiB0ZXh0IiBpbnN0ZWFkIG9mICItV2wsIC16LCB0ZXh0IikKZGVtb25zdHJh
dGVzIChsYXRlciBhbW1lbmRlZCBieSAzYTM5ZTcwNmE5MWEpLgoKSXQgdHVybnMgb3V0IHRoYXQg
d2UgYWxyZWFkeSBoYXZlIGEgYmV0dGVyLCByb2J1c3Qgd2F5IG9mIHBhc3NpbmcKTERGTEFHUyB2
aWEgdGhlIGdjYyBmcm90bmVkOiB0aGUgdG9vbGNoYWluIHdyYXBwZXIsIHdoaWNoIHdlIGFscmVh
ZHkgdXNlCnRvIHBhc3MgcmVscm8gZm9yIGV4YW1wbGUuCgpXZSBjYW4gcmV2ZXJ0IGJhY2sgdG8g
dXNpbmcgLVdsLC16LHRleHQsIGFzIHdlJ3JlIHN1cmUgd2hpcyBpcyBnb2luZyB0bwpiZSBhIGNh
bGwgdG8gdGhlIGdjYyBmcm9udGVuZCAodGhlIHdyYXBwZXIgaXMgbm90IHVzZWQgZm9yIGxkKSwg
d2hpY2gKbWFrZXMgaXQgY29uc2lzdGVudCB3aXRoIHRoZSBvdGhlciBzaW1pbGFyIGFyZ3MgZm9y
IC16IHJlbHJvIGFuZCAteiBub3cuCgpTaWduZWQtb2ZmLWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5u
Lm1vcmluQG9yYW5nZS5jb20+CkNjOiBKLiBOZXVzY2jDpGZlciA8ai5uZXVzY2hhZWZlckBnbXgu
bmV0PgpDYzogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgpDYzogR2l1bGlv
IEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+CkNjOiBUaG9t
YXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgotLS0KIHBhY2thZ2Uv
TWFrZWZpbGUuaW4gICAgICAgICAgICB8IDE5IC0tLS0tLS0tLS0tLS0tLS0tLS0KIHRvb2xjaGFp
bi90b29sY2hhaW4td3JhcHBlci5jICB8ICA2ICsrKysrLQogdG9vbGNoYWluL3Rvb2xjaGFpbi13
cmFwcGVyLm1rIHwgIDkgKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMo
KyksIDIwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvTWFrZWZpbGUuaW4gYi9w
YWNrYWdlL01ha2VmaWxlLmluCmluZGV4IDgwOGI3MWE5M2UuLjQ3YTg5ZjFhZTEgMTAwNjQ0Ci0t
LSBhL3BhY2thZ2UvTWFrZWZpbGUuaW4KKysrIGIvcGFja2FnZS9NYWtlZmlsZS5pbgpAQCAtMTQ5
LDI1ICsxNDksNiBAQCBlbmRpZgogCiBUQVJHRVRfTERGTEFHUyA9ICQoY2FsbCBxc3RyaXAsJChC
UjJfVEFSR0VUX0xERkxBR1MpKQogCi0jIG11c2wncyBkeW5hbWljIGxvYWRlciBkb2Vzbid0IHN1
cHBvcnQgRFRfVEVYVFJFTCwgd2hpY2ggcmVzdWx0cyBpbiBhIHJ1bnRpbWUKLSMgY3Jhc2ggaWYg
aXQgZ2V0cyB1c2VkLiBUaGUgIi16IHRleHQiIGxpbmtlciBvcHRpb24gaXNzdWVzIGEgYnVpbGQt
dGltZSBlcnJvcgotIyB3aGVuIERUX1RFWFJFTCBpcyB1c2VkLCBzbyB3ZSBjYXB0dXJlIHRoZSBw
cm9ibGVtIGVhcmxpZXIuCi0jCi0jIFNlZSBhbHNvOiBodHRwczovL3d3dy5vcGVud2FsbC5jb20v
bGlzdHMvbXVzbC8yMDIwLzA5LzI1LzQKLSMKLSMgTk9URTogV2UncmUgdXNpbmcgIi16dGV4dCIg
aW5zdGVhZCBvZiAiLVdsLC16LHRleHQiIGhlcmUsIGJlY2F1c2Ugc29tZQotIyBwYWNrYWdlcyBw
YXNzIFRBUkdFVF9MREZMQUdTIGRpcmVjdGx5IHRvIGxkIHJhdGhlciB0aGFuIGdjYywgYW5kIGxk
IGRvZXNuJ3QKLSMgc3VwcG9ydCAtV2wsWy4uLl0uIC16IGlzIHN1cHBvcnRlZCBieSBib3RoIGdj
YyBhbmQgY2xhbmcsIHNvIGl0IHByb2JhYmx5Ci0jIHdvbid0IGNhdXNlIHVzIHByb2JsZW1zLgot
IwotIyBXZSdyZSB1c2luZyAiLXp0ZXh0IiBpbnN0ZWFkIG9mICIteiB0ZXh0IiBoZXJlLCBiZWNh
dXNlIHNvbWUgYnVpbGRzeXN0ZW1zCi0jIChsaWtlIHNjb25zLCBmb3IgZ3BzZCkgd2lsbCByZW9y
ZGVyIGFuZC9vciBkcm9wIExERkxBR1MsIGNhdXNpbmcgYSBsb25lCi0jICIteiIgdG8gYmUgcGFz
c2VkIGFuZCB0aGUgInRleHQiIGtleXdvcmQgdG8gYmUgZHJvcHBlZCBvdGhlcndpc2UuIEJvdGgK
LSMgZ2NjIGFuZCBsZCBzdXBwb3J0cyB0aGF0LCBzbyBpdCBwcm9iYWJseSB3b24ndCBjYXVzZSB1
cyBwcm9ibGVtcy4KLWlmZXEgKCQoQlIyX1RPT0xDSEFJTl9VU0VTX01VU0wpOiQoQlIyX1NUQVRJ
Q19MSUJTKSx5OikKLVRBUkdFVF9MREZMQUdTICs9IC16dGV4dAotZW5kaWYKLQogIyBCeSBkZXNp
Z24sIF9GT1JUSUZZX1NPVVJDRSByZXF1aXJlcyBnY2Mgb3B0aW1pemF0aW9uIHRvIGJlIGVuYWJs
ZWQuCiAjIFRoZXJlZm9yZSwgd2UgbmVlZCB0byBwYXNzIF9GT1JUSUZZX1NPVVJDRSBhbmQgdGhl
IG9wdGltaXphdGlvbiBsZXZlbAogIyB0aHJvdWdoIHRoZSBzYW1lIG1lY2hhbmlzbSwgaS5lIGN1
cnJlbnRseSB0aHJvdWdoIENGTEFHUy4gUGFzc2luZwpkaWZmIC0tZ2l0IGEvdG9vbGNoYWluL3Rv
b2xjaGFpbi13cmFwcGVyLmMgYi90b29sY2hhaW4vdG9vbGNoYWluLXdyYXBwZXIuYwppbmRleCA3
NjQ3YTFhMTJkLi5kZTU0ZjgzOGVjIDEwMDY0NAotLS0gYS90b29sY2hhaW4vdG9vbGNoYWluLXdy
YXBwZXIuYworKysgYi90b29sY2hhaW4vdG9vbGNoYWluLXdyYXBwZXIuYwpAQCAtNTEsMTAgKzUx
LDExIEBAIHN0YXRpYyBjaGFyIF9kYXRlX1tzaXplb2YoIi1EX19EQVRFX189XCJNTU0gREQgWVlZ
WVwiIildOwogICogCS1Xbm8tYnVpbHRpbi1tYWNyby1yZWRlZmluZWQKICAqIAktV2wsLXosbm93
CiAgKiAJLVdsLC16LHJlbHJvCisgKiAJLVdsLC16LHRleHQKICAqIAktZlBJRQogICogCS1waWUK
ICAqLwotI2RlZmluZSBFWENMVVNJVkVfQVJHUwkxMAorI2RlZmluZSBFWENMVVNJVkVfQVJHUwkx
MQogCiBzdGF0aWMgY2hhciAqcHJlZGVmX2FyZ3NbXSA9IHsKICNpZmRlZiBCUl9DQ0FDSEUKQEAg
LTQ4Niw2ICs0ODcsOSBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiAJCQlicmVh
azsKIAl9CiAJaWYgKGkgPT0gYXJnYykgeworI2lmZGVmIEJSMl9aVEVYVAorCQkqY3VyKysgPSAi
LVdsLC16LHRleHQiOworI2VuZGlmCiAJCS8qIGh0dHBzOi8vd2lraS5nZW50b28ub3JnL3dpa2kv
SGFyZGVuZWQvVG9vbGNoYWluI01hcmtfUmVhZC1Pbmx5X0FwcHJvcHJpYXRlX1NlY3Rpb25zICov
CiAjaWZkZWYgQlIyX1JFTFJPX1BBUlRJQUwKIAkJKmN1cisrID0gIi1XbCwteixyZWxybyI7CmRp
ZmYgLS1naXQgYS90b29sY2hhaW4vdG9vbGNoYWluLXdyYXBwZXIubWsgYi90b29sY2hhaW4vdG9v
bGNoYWluLXdyYXBwZXIubWsKaW5kZXggY2JmNDZmMTVmYS4uZDYwNWU0MWYyYyAxMDA2NDQKLS0t
IGEvdG9vbGNoYWluL3Rvb2xjaGFpbi13cmFwcGVyLm1rCisrKyBiL3Rvb2xjaGFpbi90b29sY2hh
aW4td3JhcHBlci5tawpAQCAtODMsNiArODMsMTUgQEAgZWxzZSBpZmVxICgkKEJSMl9SRUxST19G
VUxMKSx5KQogVE9PTENIQUlOX1dSQVBQRVJfQVJHUyArPSAtREJSMl9SRUxST19GVUxMCiBlbmRp
ZgogCisjIG11c2wncyBkeW5hbWljIGxvYWRlciBkb2Vzbid0IHN1cHBvcnQgRFRfVEVYVFJFTCwg
d2hpY2ggcmVzdWx0cyBpbiBhIHJ1bnRpbWUKKyMgY3Jhc2ggaWYgaXQgZ2V0cyB1c2VkLiBUaGUg
Ii16IHRleHQiIGxpbmtlciBvcHRpb24gaXNzdWVzIGEgYnVpbGQtdGltZSBlcnJvcgorIyB3aGVu
IERUX1RFWFJFTCBpcyB1c2VkLCBzbyB3ZSBjYXB0dXJlIHRoZSBwcm9ibGVtIGVhcmxpZXIuCisj
CisjIFNlZSBhbHNvOiBodHRwczovL3d3dy5vcGVud2FsbC5jb20vbGlzdHMvbXVzbC8yMDIwLzA5
LzI1LzQKK2lmZXEgKCQoQlIyX1RPT0xDSEFJTl9VU0VTX01VU0wpOiQoQlIyX1NUQVRJQ19MSUJT
KSx5OikKK1RPT0xDSEFJTl9XUkFQUEVSX0FSR1MgKz0gLURCUjJfWlRFWFQKK2VuZGlmCisKIGRl
ZmluZSBUT09MQ0hBSU5fV1JBUFBFUl9CVUlMRAogCSQoSE9TVENDKSAkKEhPU1RfQ0ZMQUdTKSAk
KFRPT0xDSEFJTl9XUkFQUEVSX0FSR1MpIFwKIAkJLXMgLVdsLC0taGFzaC1zdHlsZT0kKFRPT0xD
SEFJTl9XUkFQUEVSX0hBU0hfU1RZTEUpIFwKLS0gCjIuMzQuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQpDZSBtZXNzYWdlIGV0IHNlcyBwaWVj
ZXMgam9pbnRlcyBwZXV2ZW50IGNvbnRlbmlyIGRlcyBpbmZvcm1hdGlvbnMgY29uZmlkZW50aWVs
bGVzIG91IHByaXZpbGVnaWVlcyBldCBuZSBkb2l2ZW50IGRvbmMNCnBhcyBldHJlIGRpZmZ1c2Vz
LCBleHBsb2l0ZXMgb3UgY29waWVzIHNhbnMgYXV0b3Jpc2F0aW9uLiBTaSB2b3VzIGF2ZXogcmVj
dSBjZSBtZXNzYWdlIHBhciBlcnJldXIsIHZldWlsbGV6IGxlIHNpZ25hbGVyDQphIGwnZXhwZWRp
dGV1ciBldCBsZSBkZXRydWlyZSBhaW5zaSBxdWUgbGVzIHBpZWNlcyBqb2ludGVzLiBMZXMgbWVz
c2FnZXMgZWxlY3Ryb25pcXVlcyBldGFudCBzdXNjZXB0aWJsZXMgZCdhbHRlcmF0aW9uLA0KT3Jh
bmdlIGRlY2xpbmUgdG91dGUgcmVzcG9uc2FiaWxpdGUgc2kgY2UgbWVzc2FnZSBhIGV0ZSBhbHRl
cmUsIGRlZm9ybWUgb3UgZmFsc2lmaWUuIE1lcmNpLg0KDQpUaGlzIG1lc3NhZ2UgYW5kIGl0cyBh
dHRhY2htZW50cyBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgb3IgcHJpdmlsZWdlZCBpbmZvcm1h
dGlvbiB0aGF0IG1heSBiZSBwcm90ZWN0ZWQgYnkgbGF3Ow0KdGhleSBzaG91bGQgbm90IGJlIGRp
c3RyaWJ1dGVkLCB1c2VkIG9yIGNvcGllZCB3aXRob3V0IGF1dGhvcmlzYXRpb24uDQpJZiB5b3Ug
aGF2ZSByZWNlaXZlZCB0aGlzIGVtYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5k
ZXIgYW5kIGRlbGV0ZSB0aGlzIG1lc3NhZ2UgYW5kIGl0cyBhdHRhY2htZW50cy4NCkFzIGVtYWls
cyBtYXkgYmUgYWx0ZXJlZCwgT3JhbmdlIGlzIG5vdCBsaWFibGUgZm9yIG1lc3NhZ2VzIHRoYXQg
aGF2ZSBiZWVuIG1vZGlmaWVkLCBjaGFuZ2VkIG9yIGZhbHNpZmllZC4NClRoYW5rIHlvdS4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
