Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D95C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 12:47:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A3816126A
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 12:47:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A3816126A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42FE1400F1;
	Sun,  3 Oct 2021 12:47:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xsNcaS5SWRW4; Sun,  3 Oct 2021 12:47:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F922402A2;
	Sun,  3 Oct 2021 12:47:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C6F231BF327
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 12:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B676A426C7
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 12:47:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WgjUdN3FAKPn for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 12:47:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 619BC426C6
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 12:47:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:acc5:ef3b:8cb0:272a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 8CE3AB00563;
 Sun,  3 Oct 2021 14:47:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633265245;
 bh=IYSzFoAU93uGeKKZXxKE58kx2qelgzmuRmcBYl0SPCE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EnPDB0XwazNA4KUNpjHj0jJJ8CkGjbB0zHsBbwONK8pRs5qHKbIHmpb1FuPSMoLeL
 iD/jKgiH8loFPiZw2y8mbvLR7aar2WmMcw2zkHtDAFEDY51/Nxtl3AYNTrqG1GkDc5
 0NE8XeTVp2OYFW3xwRDhspdsg+0c/+DpN84X9fdPoEoNaS+PURQvvkesXh8d0Y3onb
 1DGlaentlHDIeV1yuPSCMzU4YzpbwdyhClGA3Ji2b9XhCrbD6GgRGYsisbMAlf3Scm
 P5PcDoDujw9Q1kqMFvxiQiIXo0qimK0bu40nfsxyQXNaLZrAzUegmael2BUSiehZ/d
 atrGj9OsuKhtw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Oct 2021 14:47:19 +0200
Date: Sun, 3 Oct 2021 14:47:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Kory Maincent <kory.maincent@bootlin.com>
Message-ID: <20211003124719.GH1504958@scaer>
References: <20210923155726.87851-1-kory.maincent@bootlin.com>
 <20210923155726.87851-6-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210923155726.87851-6-kory.maincent@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 5/7] support/testing/infra/emulator.py:
 update encoding when calling qemu
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

S8O2cnksIEFsbCwKCk9uIDIwMjEtMDktMjMgMTc6NTcgKzAyMDAsIEtvcnkgTWFpbmNlbnQgc3Bh
a2UgdGh1c2x5Ogo+IFdpdGggVVRGLTggZ290IGlzc3VlIHdpdGggd3JvbmcgY2hhcmFjdGVyIHJl
dHVybmVkIGJ5IFFlbXUgd2hlbiB1c2luZyBFRkkKPiBCSU9TLiBUaGlzIGJyZWFrcyB0aGUgdGVz
dCBwcm9jZXNzIHdpdGggdGhlIGZvbGxvd2luZyBlcnJvci4gVXBkYXRlIHRvCj4gSVNPLTg4NTkt
MSBlbmNvZGluZyB0byBhdm9pZCBpdC4KPiAKPiAgICAgZW11bGF0b3IubG9naW4oKQo+ICAgRmls
ZSAiL2hvbWUva21haW5jZW50L0RvY3VtZW50cy9wcm9qZWN0cy9hcmlhbmUtZ3JvdXBlL2J1aWxk
cm9vdC9zdXBwb3J0L3Rlc3RpbmcvaW5mcmEvZW11bGF0b3IucHkiLCBsaW5lIDg5LCBpbiBsb2dp
bgo+ICAgICBpbmRleCA9IHNlbGYucWVtdS5leHBlY3QoWyJidWlsZHJvb3QgbG9naW46IiwgcGV4
cGVjdC5USU1FT1VUXSwKPiAgIEZpbGUgIi91c3IvbGliL3B5dGhvbjMvZGlzdC1wYWNrYWdlcy9w
ZXhwZWN0L3NwYXduYmFzZS5weSIsIGxpbmUgMzQwLCBpbiBleHBlY3QKPiAgICAgcmV0dXJuIHNl
bGYuZXhwZWN0X2xpc3QoY29tcGlsZWRfcGF0dGVybl9saXN0LAo+ICAgRmlsZSAiL3Vzci9saWIv
cHl0aG9uMy9kaXN0LXBhY2thZ2VzL3BleHBlY3Qvc3Bhd25iYXNlLnB5IiwgbGluZSAzNjksIGlu
IGV4cGVjdF9saXN0Cj4gICAgIHJldHVybiBleHAuZXhwZWN0X2xvb3AodGltZW91dCkKPiAgIEZp
bGUgIi91c3IvbGliL3B5dGhvbjMvZGlzdC1wYWNrYWdlcy9wZXhwZWN0L2V4cGVjdC5weSIsIGxp
bmUgMTExLCBpbiBleHBlY3RfbG9vcAo+ICAgICBpbmNvbWluZyA9IHNwYXduLnJlYWRfbm9uYmxv
Y2tpbmcoc3Bhd24ubWF4cmVhZCwgdGltZW91dCkKPiAgIEZpbGUgIi91c3IvbGliL3B5dGhvbjMv
ZGlzdC1wYWNrYWdlcy9wZXhwZWN0L3B0eV9zcGF3bi5weSIsIGxpbmUgNDg1LCBpbiByZWFkX25v
bmJsb2NraW5nCj4gICAgIHJldHVybiBzdXBlcihzcGF3biwgc2VsZikucmVhZF9ub25ibG9ja2lu
ZyhzaXplKQo+ICAgRmlsZSAiL3Vzci9saWIvcHl0aG9uMy9kaXN0LXBhY2thZ2VzL3BleHBlY3Qv
c3Bhd25iYXNlLnB5IiwgbGluZSAxNzgsIGluIHJlYWRfbm9uYmxvY2tpbmcKPiAgICAgcyA9IHNl
bGYuX2RlY29kZXIuZGVjb2RlKHMsIGZpbmFsPUZhbHNlKQo+ICAgRmlsZSAiL3Vzci9saWIvcHl0
aG9uMy44L2NvZGVjcy5weSIsIGxpbmUgMzIyLCBpbiBkZWNvZGUKPiAgICAgKHJlc3VsdCwgY29u
c3VtZWQpID0gc2VsZi5fYnVmZmVyX2RlY29kZShkYXRhLCBzZWxmLmVycm9ycywgZmluYWwpCj4g
VW5pY29kZURlY29kZUVycm9yOiAndXRmLTgnIGNvZGVjIGNhbid0IGRlY29kZSBieXRlIDB4ZGEg
aW4gcG9zaXRpb24gMDogaW52YWxpZCBjb250aW51YXRpb24gYnl0ZQo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEtvcnkgTWFpbmNlbnQgPGtvcnkubWFpbmNlbnRAYm9vdGxpbi5jb20+Cj4gLS0tCj4gIHN1
cHBvcnQvdGVzdGluZy9pbmZyYS9lbXVsYXRvci5weSB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3N1cHBvcnQv
dGVzdGluZy9pbmZyYS9lbXVsYXRvci5weSBiL3N1cHBvcnQvdGVzdGluZy9pbmZyYS9lbXVsYXRv
ci5weQo+IGluZGV4IDBhNzdlYjgwZmMuLjFmYWI5Y2FhZDggMTAwNjQ0Cj4gLS0tIGEvc3VwcG9y
dC90ZXN0aW5nL2luZnJhL2VtdWxhdG9yLnB5Cj4gKysrIGIvc3VwcG9ydC90ZXN0aW5nL2luZnJh
L2VtdWxhdG9yLnB5Cj4gQEAgLTc2LDcgKzc2LDcgQEAgY2xhc3MgRW11bGF0b3Iob2JqZWN0KToK
PiAgICAgICAgICBzZWxmLmxvZ2ZpbGUud3JpdGUoIj4gc3RhcnRpbmcgcWVtdSB3aXRoICclcydc
biIgJSAiICIuam9pbihxZW11X2NtZCkpCj4gICAgICAgICAgc2VsZi5xZW11ID0gcGV4cGVjdC5z
cGF3bihxZW11X2NtZFswXSwgcWVtdV9jbWRbMTpdLAo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdGltZW91dD01ICogc2VsZi50aW1lb3V0X211bHRpcGxpZXIsCj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbmNvZGluZz0ndXRmLTgnLAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZW5jb2Rpbmc9J0lTTy04ODU5LTEnLAoKQWZ0ZXIg
cmV2aWV3IGZyb20gVGhvbWFzLCBJJ3ZlIGluZGVlZCByZXZlcnRlZCB0byB1c2luZyB1dGYtOCwg
YnV0IHVzaW5nCmNvZGVjZXJyb3JzPSdyZXBsYWNlJyB0byBmaXggaW52YWxpZCB1dGYtOCBzZXF1
ZW5jZXMuCgpJJ3ZlIGFsc28gcmV3b3JkZWQgdGhlIGNvbW1pdCBsb2cgYWNjb3JkaW5nbHkuCgpB
cHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbnY9eyJRRU1VX0FVRElPX0RSViI6ICJu
b25lIn0pCj4gICAgICAgICAgIyBXZSB3YW50IG9ubHkgc3Rkb3V0IGludG8gdGhlIGxvZyB0byBh
dm9pZCBkb3VibGUgZWNobwo+ICAgICAgICAgIHNlbGYucWVtdS5sb2dmaWxlX3JlYWQgPSBzZWxm
LmxvZ2ZpbGUKPiAtLSAKPiAyLjI1LjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RA
bGlzdHMuYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4g
RS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNz
JyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwg
XCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3
IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlz
IG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwg
TUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
