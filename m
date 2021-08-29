Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9456C432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 10:43:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E6AB60F42
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 10:43:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E6AB60F42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A8EE400DA;
	Sun, 29 Aug 2021 10:43:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2NC0j2Yw1W5k; Sun, 29 Aug 2021 10:42:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE33A4013F;
	Sun, 29 Aug 2021 10:42:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 530971BF336
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 10:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 400484039D
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 10:42:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fHgEk9d9DTjP for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 10:42:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 99F90402DD
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 10:42:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c87f:483a:a09f:382b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 376CE5FFA1;
 Sun, 29 Aug 2021 12:42:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1630233767;
 bh=fX1YAMvyF4hQ/gHhJp0Oyee8h37v4iVv68+yeU2xHGY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ERkYNgpbPdl2ulFkK5tk5yrbzaKs8t4J0HjSJxo1yhD8iX5HtpqlPcmAiVIIoXyXN
 Pk6cN9vn5l5axk1fY0m/HIBtpcmiW2lfy8gdWxb6YJFvxsEmoiX8kiFPCJU3W6Rq+4
 Ylbdpl4DGy7ErukHVIvt3sYPWOIRiblULsLbvxUHdJiGYTFJp3jgtaKB2Piy651wnE
 DDJx24J/ld6Eqi2KkpwKqeFv2rADl12GyMql65y3i6rtJty+FiYGYdDMtEWOOP1q1e
 XoM/E15YP4UR5kXny2K03fO5OrS8VLtj95fcKG71GI84oBpbkXpuVBcmMFZf1n2R8q
 1BSs1HRlOcQMQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Aug 2021 12:42:31 +0200
Date: Sun, 29 Aug 2021 12:42:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Herve Codina <herve.codina@bootlin.com>
Message-ID: <20210829104231.GT2661@scaer>
References: <20210817083930.3718711-1-herve.codina@bootlin.com>
 <20210817083930.3718711-14-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210817083930.3718711-14-herve.codina@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 13/16] support/testing/infra: add
 log_file_path() function
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
Cc: Naumann Andreas <ANaumann@ultratronik.de>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVydsOpLCBBbGwsCgpPbiAyMDIxLTA4LTE3IDEwOjM5ICswMjAwLCBIZXJ2ZSBDb2RpbmEgc3Bh
a2UgdGh1c2x5Ogo+IEZyb206IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9v
dGxpbi5jb20+Cj4gCj4gU29tZSB0ZXN0cyB3aWxsIG5lZWQgdG8gZ3JlcCB0aHJvdWdoIHRoZSBi
dWlsZCBsb2cgdG8gdmVyaWZ5IHRoYXQgc29tZQo+IGZlYXR1cmVzIGFyZSB3b3JraW5nIGFyZSBl
eHBlY3RlZC4gSW4gb3JkZXIgdG8gYWxsb3cgdGhlbSB0byBvcGVuIHRoZQo+IGJ1aWxkIGxvZywg
d2UgcHJvdmlkZSBhIG5ldyBmdW5jdGlvbiBjYWxsZWQgbG9nX2ZpbGVfcGF0aCgpLCB3aGljaAo+
IHJldHVybnMgdGhlIHBhdGggdG8gdGhlIGxvZyBmaWxlIGlmIGF2YWlsYWJsZS4KPiAKPiBXZSBh
bHNvIHVzZSB0aGlzIGZ1bmN0aW9uIGluIG9wZW5fbG9nX2ZpbGUoKS4KPiAKPiBOb3RlIHRoYXQg
b3Blbl9sb2dfZmlsZSgpIGNhbm5vdCBiZSB1c2VkIGRpcmVjdGx5IHRvIGdyZXAgdGhyb3VnaCB0
aGUKPiBsb2cgZmlsZSBhdCB0aGUgZW5kIG9mIGEgYnVpbGQ6IGJlY2F1c2UgaXQgb3BlbnMgaW4g
ImErIiBtb2RlLCBpdAo+IGdyZXBzIHN0YXJ0aW5nIGZyb20gdGhlIGVuZCBvZiB0aGUgZmlsZS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJv
b3RsaW4uY29tPgo+IFNpZ25lZC1vZmYtYnk6IEhlcnZlIENvZGluYSA8aGVydmUuY29kaW5hQGJv
b3RsaW4uY29tPgoKVGhpcyB3YXMgbm90IHJlYWxseSBwYXJ0IG9mIHRoZSBQUEQvVExQQiBzdHVm
ZiwgYW5kIGRpZCBub3Qgc2VlbSB0bwpkZXBlbmQgb24gaXQgaW4gYW55IHdheSwgc286IGFwcGxp
ZWQgdG8gbmV4dCwgdGhhbmtzLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gLS0tCj4gTmV3
IHBhdGNoIGluIHRoaXMgdjIgc2VyaWVzCj4gCj4gVGhpcyBwYXRjaCBpcyByZXRyaWV2ZWQgZnJv
bSBUaG9tYXMncyB3b3JrLgo+IFRoZSBmaXJzdCB2ZXJzaW9uIHdhcyBkaXNjdXNzZWQKPiBodHRw
czovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjAwNDMw
MDk1MjQ5Ljc4MjU5Ny0xMC10aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tLwo+IAo+IFRoaXMg
bmV3IHZlcnNpb24gd2FzIG5vdCBhbHJlYWR5IHN1Ym1pdHRlZCBieSBUaG9tYXMgb3IgSSBtaXNz
ZWQgaXQuCj4gQ29tcGFyZWQgdG8gdGhlIGZpcnN0IHZlcnNpb24sIHRoaXMgcGF0Y2ggdXNlIGEg
bW9yZSBweXRob24tbGlrZQo+IHN5bnRheCBhcyBwcm9wb3NlZCBieSBZYW5uIGluIHRoZSBwcmV2
aW91cyByZXZpZXcuCj4gCj4gQ2hhbmdlcyB2MiB0byB2MzoKPiBOb25lCj4gCj4gIHN1cHBvcnQv
dGVzdGluZy9pbmZyYS9fX2luaXRfXy5weSB8IDExICsrKysrKy0tLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3N1
cHBvcnQvdGVzdGluZy9pbmZyYS9fX2luaXRfXy5weSBiL3N1cHBvcnQvdGVzdGluZy9pbmZyYS9f
X2luaXRfXy5weQo+IGluZGV4IGIxMGE3NjAxYTMuLjFmMDAzZjI0YzYgMTAwNjQ0Cj4gLS0tIGEv
c3VwcG9ydC90ZXN0aW5nL2luZnJhL19faW5pdF9fLnB5Cj4gKysrIGIvc3VwcG9ydC90ZXN0aW5n
L2luZnJhL19faW5pdF9fLnB5Cj4gQEAgLTEwLDE3ICsxMCwxOCBAQCBBUlRJRkFDVFNfVVJMID0g
Imh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9hcnRlZmFjdHMvIgo+ICBCQVNFX0RJUiA9
IG9zLnBhdGgucmVhbHBhdGgob3MucGF0aC5qb2luKG9zLnBhdGguZGlybmFtZShfX2ZpbGVfXyks
ICIuLi8uLi8uLiIpKQo+ICAKPiAgCj4gK2RlZiBsb2dfZmlsZV9wYXRoKGJ1aWxkZGlyLCBzdGFn
ZSwgbG9ndG9maWxlPVRydWUpOgo+ICsgICAgIiIiUmV0dXJuIHBhdGggdG8gbG9nIGZpbGUiIiIK
PiArICAgIHJldHVybiAie30te30ubG9nIi5mb3JtYXQoYnVpbGRkaXIsIHN0YWdlKSBpZiBsb2d0
b2ZpbGUgZWxzZSBOb25lCj4gKwo+ICsKPiAgZGVmIG9wZW5fbG9nX2ZpbGUoYnVpbGRkaXIsIHN0
YWdlLCBsb2d0b2ZpbGU9VHJ1ZSk6Cj4gICAgICAiIiIKPiAgICAgIE9wZW4gYSBmaWxlIGZvciBs
b2dnaW5nIGFuZCByZXR1cm4gaXRzIGhhbmRsZXIuCj4gICAgICBJZiBsb2d0b2ZpbGUgaXMgVHJ1
ZSwgcmV0dXJucyBzeXMuc3Rkb3V0LiBPdGhlcndpc2Ugb3BlbnMgYSBmaWxlCj4gICAgICB3aXRo
IGEgc3VpdGFibGUgbmFtZSBpbiB0aGUgYnVpbGQgZGlyZWN0b3J5Lgo+ICAgICAgIiIiCj4gLSAg
ICBpZiBsb2d0b2ZpbGU6Cj4gLSAgICAgICAgZmhhbmRsZSA9IG9wZW4oInt9LXt9LmxvZyIuZm9y
bWF0KGJ1aWxkZGlyLCBzdGFnZSksICdhKycpCj4gLSAgICBlbHNlOgo+IC0gICAgICAgIGZoYW5k
bGUgPSBzeXMuc3Rkb3V0Cj4gLSAgICByZXR1cm4gZmhhbmRsZQo+ICsgICAgcmV0dXJuIG9wZW4o
bG9nX2ZpbGVfcGF0aChidWlsZGRpciwgc3RhZ2UsIGxvZ3RvZmlsZSksICdhKycpIGlmIGxvZ3Rv
ZmlsZSBlbHNlIHN5cy5zdGRvdXQKPiAgCj4gIAo+ICBkZWYgYmFzZXBhdGgocmVscGF0aD0iIik6
Cj4gLS0gCj4gMi4zMS4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1c3lib3gu
bmV0Cj4gaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRp
bWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCAr
MzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwg
IF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0t
LS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1v
cmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29u
c3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0t
LS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
