Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87076C433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 21:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FF2E81B3E;
	Tue, 22 Feb 2022 21:00:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8mCVwpb2iUIr; Tue, 22 Feb 2022 21:00:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BC8B81AD1;
	Tue, 22 Feb 2022 21:00:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 958B11BF33C
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 21:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83F2981324
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 21:00:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D2r4vp_PvU-b for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 21:00:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 117C3812D3
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 21:00:28 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8961242664;
 Tue, 22 Feb 2022 21:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1645563627; bh=JOYaIFvLby25IrZWUeJMswSseYo66vB1DupjhF50z0k=;
 h=From:To:Cc:Subject:Date:From;
 b=hInimG7usHpyxEP2QC0s2Jx/j4A/LYlDiFPr+1ndphcBw6NBJLT65iruWyyF0Gl8G
 EzMLUIg65Og61tvwNEikIDZcnRIJGe9GqwSlKlOaqJJiT60E98HF3y83hMm13GpbjU
 PMoNWkIzQ58EitVyNCRs+Br/xzLu/A3wV1ZiJKMYH1pYtBCPBm/YG+GGMc/dyHng99
 eYDIse9Qremu+YeC1D6i7XACuBSmuLpObXfY0dIW8Gdifknz3FVMQJ2uORwn2rDFrD
 Z8AWm8CvZMIKRFbVWyjcXFylbzJpAiO8aBauFENsORd+0a3XOaDfpuri4SHVJ8r89M
 PaoR3pnQgdaOg==
Received: from abrodkin-5550.internal.synopsys.com (unknown [10.121.15.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id 931FAA0061;
 Tue, 22 Feb 2022 21:00:23 +0000 (UTC)
X-SNPS-Relay: synopsys.com
To: buildroot@buildroot.org
Date: Wed, 23 Feb 2022 00:00:24 +0300
Message-Id: <20220222210024.6013-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/qt5/qt5webkit: needs OpenSSL
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
From: Alexey Brodkin via buildroot <buildroot@buildroot.org>
Reply-To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: Peter Seiderer <ps.report@gmx.net>,
 James Hilliard <james.hilliard1@gmail.com>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Vy9vIE9wZW5TU0wgUVQ1V2Via2l0IGZhaWxzIHRvIGJ1aWxkIHRoYXQgd2F5OgotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLT44LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KLi4u
L2J1aWxkL3F0NXdlYmtpdC01LjIxMi4wLWFscGhhNC9Tb3VyY2UvV2ViQ29yZS9wbGF0Zm9ybS9u
ZXR3b3JrL3F0L1Jlc291cmNlUmVxdWVzdFF0LmNwcDogSW4gc3RhdGljIG1lbWJlciBmdW5jdGlv
biDigJhzdGF0aWMgYm9vbCBXZWJDb3JlOjpSZXNvdXJjZVJlcXVlc3Q6OmFscG5Jc1N1cHBvcnRl
ZCgp4oCZOgouLi4vYnVpbGQvcXQ1d2Via2l0LTUuMjEyLjAtYWxwaGE0L1NvdXJjZS9XZWJDb3Jl
L3BsYXRmb3JtL25ldHdvcmsvcXQvUmVzb3VyY2VSZXF1ZXN0UXQuY3BwOjY4OjEyOiBlcnJvcjog
4oCYUVNzbFNvY2tldOKAmSBoYXMgbm90IGJlZW4gZGVjbGFyZWQKICAgNjggfCAgICAgcmV0dXJu
IFFTc2xTb2NrZXQ6OnNzbExpYnJhcnlWZXJzaW9uTnVtYmVyKCkgPiAweDEwMDAyMDAwTCAmJgog
ICAgICB8ICAgICAgICAgICAgXn5+fn5+fn5+fgouLi4vYnVpbGQvcXQ1d2Via2l0LTUuMjEyLjAt
YWxwaGE0L1NvdXJjZS9XZWJDb3JlL3BsYXRmb3JtL25ldHdvcmsvcXQvUmVzb3VyY2VSZXF1ZXN0
UXQuY3BwOjY5Ojk6IGVycm9yOiDigJhRU3NsU29ja2V04oCZIGhhcyBub3QgYmVlbiBkZWNsYXJl
ZAogICA2OSB8ICAgICAgICAgUVNzbFNvY2tldDo6c3NsTGlicmFyeVZlcnNpb25TdHJpbmcoKS5z
dGFydHNXaXRoKFFMYXRpbjFTdHJpbmcoIk9wZW5TU0wiKSk7CiAgICAgIHwgICAgICAgICBefn5+
fn5+fn5+Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tPjgtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQoKU2lnbmVkLW9mZi1ieTogQWxleGV5IEJyb2RraW4gPGFicm9ka2luQHN5
bm9wc3lzLmNvbT4KQ2M6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwu
Y29tPgpDYzogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+CkNjOiBQ
ZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+CkNjOiBZYW5uIEUuIE1PUklOIDx5YW5u
Lm1vcmluLjE5OThAZnJlZS5mcj4KLS0tCgpDaGFuZ2VzIHYxIC0+IHYyOgoKICogQWRkZWQgIm9w
ZW5zc2wiIHRvIFFUNVdFQktJVF9ERVBFTkRFTkNJRVMsIHRoYW5rcyBZYW5uIGZvcgogICBzcG90
dGluZyB0aGlzIG9uZS4KCk5vdGUgdGhhdCBJIGludGVybnRpb25hbGx5IGFkZGVkICJvcGVuc3Ns
IiBub3QgZm9sbG93aW5nCmFscGhhYmV0aWMgb3JkZXIgYmVjYXVzZToKCiAxLiBFeGlzdGluZyBk
ZXBlbmRlbmNpZXMgYXJlIGFscmVhZHkgYSBiaXQgc2h1ZmZmbGVkCiAyLiBJIHdhbnRlZCB0byBr
ZWVwIHRoaXMgZGlmZiBhcyBzbWFsbCBhcyBwb3NzaWJsZSwgdy9vCiAgICByZS1zaHVmZmxpbmcg
bXVsdGlwbGUgbGluZXMuIElmIHJlYWxseSBuZWVkZWQgd2UgbWF5IGRvCiAgICByZW9yZGVyaW5n
IGluIGEgc2VwYXJhdGUgcGF0Y2guCgotLS0KIHBhY2thZ2UvcXQ1L3F0NXdlYmtpdC9Db25maWcu
aW4gICAgfCAxICsKIHBhY2thZ2UvcXQ1L3F0NXdlYmtpdC9xdDV3ZWJraXQubWsgfCAyICstCiAy
IGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvcXQ1L3F0NXdlYmtpdC9Db25maWcuaW4gYi9wYWNrYWdlL3F0NS9xdDV3ZWJr
aXQvQ29uZmlnLmluCmluZGV4IGVkODdlZmNhOTUuLjI2YzM4OTdkMWQgMTAwNjQ0Ci0tLSBhL3Bh
Y2thZ2UvcXQ1L3F0NXdlYmtpdC9Db25maWcuaW4KKysrIGIvcGFja2FnZS9xdDUvcXQ1d2Via2l0
L0NvbmZpZy5pbgpAQCAtMTUsNiArMTUsNyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfUVQ1V0VCS0lU
CiAJc2VsZWN0IEJSMl9QQUNLQUdFX0pQRUcKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTEVWRUxEQgog
CXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJQTkcKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfT1BFTlNTTAog
CXNlbGVjdCBCUjJfUEFDS0FHRV9RVDVCQVNFX0lDVQogCXNlbGVjdCBCUjJfUEFDS0FHRV9RVDVC
QVNFX0dVSQogCXNlbGVjdCBCUjJfUEFDS0FHRV9RVDVCQVNFX1dJREdFVFMKZGlmZiAtLWdpdCBh
L3BhY2thZ2UvcXQ1L3F0NXdlYmtpdC9xdDV3ZWJraXQubWsgYi9wYWNrYWdlL3F0NS9xdDV3ZWJr
aXQvcXQ1d2Via2l0Lm1rCmluZGV4IDJlOTZhY2MwMGYuLmM5YjM1NGU3MjUgMTAwNjQ0Ci0tLSBh
L3BhY2thZ2UvcXQ1L3F0NXdlYmtpdC9xdDV3ZWJraXQubWsKKysrIGIvcGFja2FnZS9xdDUvcXQ1
d2Via2l0L3F0NXdlYmtpdC5tawpAQCAtMTAsNyArMTAsNyBAQCBRVDVXRUJLSVRfU09VUkNFID0g
cXR3ZWJraXQtJChRVDVXRUJLSVRfVkVSU0lPTikudGFyLnh6CiBRVDVXRUJLSVRfREVQRU5ERU5D
SUVTID0gXAogCWhvc3QtYmlzb24gaG9zdC1mbGV4IGhvc3QtZ3BlcmYgaG9zdC1weXRob24zIGhv
c3QtcnVieSBnc3RyZWFtZXIxIFwKIAlnc3QxLXBsdWdpbnMtYmFzZSBpY3UgbGV2ZWxkYiBqcGVn
IGxpYnBuZyBsaWJ4bWwyIGxpYnhzbHQgcXQ1bG9jYXRpb24gXAotCXF0NXNlbnNvcnMgcXQ1d2Vi
Y2hhbm5lbCBzcWxpdGUgd2VicCB3b2ZmMgorCW9wZW5zc2wgcXQ1c2Vuc29ycyBxdDV3ZWJjaGFu
bmVsIHNxbGl0ZSB3ZWJwIHdvZmYyCiBRVDVXRUJLSVRfSU5TVEFMTF9TVEFHSU5HID0gWUVTCiAK
IFFUNVdFQktJVF9MSUNFTlNFX0ZJTEVTID0gU291cmNlL1dlYkNvcmUvTElDRU5TRS1MR1BMLTIg
U291cmNlL1dlYkNvcmUvTElDRU5TRS1MR1BMLTIuMQotLSAKMi4yNS4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
