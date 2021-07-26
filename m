Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C83CC4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 22:03:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA3C060F59
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 22:03:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA3C060F59
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98F7A8376E;
	Mon, 26 Jul 2021 22:03:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cDx09IaPFNyJ; Mon, 26 Jul 2021 22:03:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6893836F6;
	Mon, 26 Jul 2021 22:03:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0D8421BF2F1
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 22:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E46EC60882
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 22:03:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4jNNX3lUxJTa for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 22:03:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60E9260881
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 22:03:31 +0000 (UTC)
Received: from smtpclient.apple ([146.241.155.191])
 by Aruba Outgoing Smtp  with ESMTPA
 id 88h5mQ6Jxa4UM88h5ma5C5; Tue, 27 Jul 2021 00:03:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1627337009; bh=uru4vgvcmDPp6lquYxNewygLPd011iJ4fMBnrz3u6sg=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=KPHVi1eFJNSqSrW4CZBGsOnJMw1EO789BD9Z8mHr1EOCOVk/vm2KcOf+7JuqXnOa0
 3OqpoPuWBtcBfVU8aYtF9uNWFXo3DxhrdcxB005Ch0EQWt2JbboibX7nfxPcKmto6o
 /6+kloEPzRVU6Bz4tcTpIlHIoeKqNZ4iKC5IzKv7r4qFqcf6HFfUfJFiBSvHBN+dka
 DtgF8x0reh2hHnW44sjYDLL12HzMJfuUvnyNLDI01NVOPfRRz6i/ROQAEUVEa6pGVL
 qrynQnzheNObd+gooFZBagxi1QNJL5ledj/82ndDJHEmWaOM5D+9vhyicvPerVYG/W
 jHE9XKpoHv3bg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 27 Jul 2021 00:03:26 +0200
Message-Id: <202F1345-5617-42A1-B307-529C9BBAB7D9@benettiengineering.com>
References: <20210726235656.1df4ddeb@windsurf>
In-Reply-To: <20210726235656.1df4ddeb@windsurf>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: iPhone Mail (18F72)
X-CMAE-Envelope: MS4wfJjb2DKvXgZYipWh9TQOx/DqnOkKHYc7lFVuJRZQ9m/9Y4VAB3ioPubeCm5zZxROnsnu/4lEhtcHQPJ25/njQeph0rXNRhD8QRKkV3VrVbXHBhmMTnzI
 llDocF3YJCyRca64ElZhzV0puFkAO+ZDg+fd7xV1wi/thtwq6oIW0W4ldYaXH+lkSAgwPGPMEcbzVaNU1mMa8xqhVnCyk6WQe/PlihxuEEObCukxrYTQVJmA
 xT+yvriLWlWPVnfMmutm2ZgGwYHJbubroQK5F1fZJsomdm10jazLq4/ndZDHD1lnQfRMA2ZRb9nkiHRS2sXUenkWTZ/lfXxoLZFlIr9dTeNyUnTOPgWsbPX8
 Qstpq3Bnh0I7CdOw1fmVCqF+zgCjy4Fu68wfCSx2n+unK42nUFHaOzWuRS0zlIatQKXvgu8V5IhEGEpMfZjodguRjIMydg==
Subject: Re: [Buildroot] [PATCH v2] toolchain: remove binutils bug 21464
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Michael Nosthoff <buildroot@heine.tech>,
 Maxim Kochetkov <fido_max@inbox.ru>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Cj4gSWwgZ2lvcm5vIDI2IGx1ZyAyMDIxLCBhbGxlIG9yZSAyMzo1NywgVGhvbWFzIFBldGF6em9u
aSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gaGEgc2NyaXR0bzoKPiAKPiDvu79PbiBG
cmksIDIxIE1heSAyMDIxIDE2OjA5OjQyICswMjAwCj4gR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5i
ZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+IHdyb3RlOgo+IAo+PiBUaGlzIGJ1ZyBoYXMg
YmVlbiBmaXhlZCB1cHN0cmVhbSBhbmQgYmFja3BvcnRlZCB0byBidWlsZHJvb3QgYmludXRpbHMK
Pj4gcGFja2FnZS4gU28gbGV0J3MgcmVtb3ZlIGl0IGZyb20gdG9vbGNoYWluL0NvbmZpZy5pbiBh
bmQgZnJvbSBwYWNrYWdlcwo+PiB0aGF0IGFyZSBhZmZlY3RlZCBieSBpdDoKPj4gLSBsaWJnZW9z
Cj4+IC0gcG9zdGdpcwo+PiAtIHByb3RvYnVmCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBHaXVsaW8g
QmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4KPj4gLS0tCj4+
IFYxLT5WMjoKPj4gKiBzcXVhc2hlZCA0IGRpZmZlcmVudCBwYXRjaGVzIGludG8gb25lCj4+IC0t
LQo+PiBwYWNrYWdlL2xpYmdlb3MvQ29uZmlnLmluICB8IDQgKy0tLQo+PiBwYWNrYWdlL3Bvc3Rn
aXMvQ29uZmlnLmluICB8IDQgKy0tLQo+PiBwYWNrYWdlL3Byb3RvYnVmL0NvbmZpZy5pbiB8IDEg
LQo+PiB0b29sY2hhaW4vQ29uZmlnLmluICAgICAgICB8IDYgLS0tLS0tCj4+IDQgZmlsZXMgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKPiAKPiBJbiBmYWN0LCBubyBJ
IHJldmVydGVkIHRoaXMgcGF0Y2guIEl0IGRlcGVuZHMgb24gb3RoZXIgcGF0Y2hlcyB0byBiZQo+
IGFwcGxpZWQgZmlyc3QuIFRoaXMgaXMgYW4gaWxsdXN0cmF0aW9uIG9mIHdoeSB5b3Ugc2hvdWxk
ICpuZXZlciogZXZlcgo+IHJlc2VuZCBqdXN0IGEgc2luZ2xlIHBhdGNoIG91dCBvZiBhIGxhcmdl
ciBzZXJpZXMuIEV2ZW4gaWYgb25seSBvbmUKPiBwYXRjaCBpcyBjaGFuZ2VkLCBwbGVhc2UgcmVz
ZW5kIHRoZSBlbnRpcmUgc2VyaWVzLgoKT2gsIEkgc2VlIHRoZSByZWFzb24sIHNvcnJ5LgoKPiAK
PiBDb3VsZCB5b3UgdXBkYXRlIHlvdXIgIkZpeCBiaW51dGlscyBidWcgMjE0NjQgYW5kIHJlbW92
ZSBpdCIgc2VyaWVzIGFuZAo+IHJlc2VuZCBpdD8KClN1cmUgSSB3aWxsLgoKQmVzdCByZWdhcmRz
CkdpdWxpbyBCZW5ldHRpCgo+IAo+IFRoYW5rcywKPiAKPiBUaG9tYXMKPiAtLSAKPiBUaG9tYXMg
UGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2lu
ZWVyaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVz
eWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
