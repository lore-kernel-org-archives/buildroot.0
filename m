Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF4EC433F5
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 14:57:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B40561037
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 14:57:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B40561037
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B46B2403A3;
	Sat,  6 Nov 2021 14:57:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6VBcBF25XXG2; Sat,  6 Nov 2021 14:57:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E237E40438;
	Sat,  6 Nov 2021 14:57:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B2AF61BF82F
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 14:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AAE7760717
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 14:57:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xRmzZdrzbTDo for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 14:57:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 589DC6061F
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 14:57:10 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:25fa:8f3c:50f:ca5])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id E10D419F5CC;
 Sat,  6 Nov 2021 15:56:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636210627;
 bh=BuaUB5BdAko0srUCHruRuyiNMfSwj3JTdSQ3iT7m5tE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dBi7ILA5qUaZo3xA+x209cSL97XRSQYzEnZ8yTH+bSIv/QEtqXIhmg/I3tWqMUzRx
 XbNwq4Fqw4KnzICS50C8SIwuAbFbIsLOYy8fV3E02rAiQ06K1jBg0a+6AADnsFcF4q
 C08MgKjSzsFm3V0bGyNrg9kLwxtx7gHJ3hAAvDkX7LA1pSrHx9c31VkEdO8TwAXkAw
 4i7SmYcnL17ZHLurMHQ1BB8o+kR0mmGkH0K8xlBrPjdxjvFqPyLJLCu1rVGNJ9LfdG
 ASHGPycDzfNjS6lR4kbhrPxAPoKgvogAjv+lymwmSdX6UkwUG3erJlMNpYhLaOasgr
 57CxuzGdf6NwQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 06 Nov 2021 15:56:58 +0100
Date: Sat, 6 Nov 2021 15:56:58 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211106145658.GA680793@scaer>
References: <20211013065446.1857356-1-fontaine.fabrice@gmail.com>
 <20211018223458.6d52ee5e@windsurf>
 <CAPi7W83t+A1eip2Ewr7pTwm+PZmUgTWq_MOuaH5UswHtbPSjiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPi7W83t+A1eip2Ewr7pTwm+PZmUgTWq_MOuaH5UswHtbPSjiQ@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/tpm2-tss: needs host-acl
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
Cc: Yair Ben-Avraham <yairba@protonmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RmFicmljZSwgVGhvbWFzLCBZYWlyLCBBbGwsCgpPbiAyMDIxLTEwLTE5IDIzOjI4ICswMjAwLCBG
YWJyaWNlIEZvbnRhaW5lIHNwYWtlIHRodXNseToKPiBMZSBsdW4uIDE4IG9jdC4gMjAyMSDDoCAy
MjozNSwgVGhvbWFzIFBldGF6em9uaQo+IDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiBh
IMOpY3JpdCA6Cj4gPiBPbiBXZWQsIDEzIE9jdCAyMDIxIDA4OjU0OjQ2ICswMjAwCj4gPiBGYWJy
aWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+IEFk
ZCBob3N0LWFjbCBtYW5kYXRvcnkgZGVwZW5kZW5jeSBmb3Igc2V0ZmFjbCB0byBhdm9pZCB0aGUg
Zm9sbG93aW5nCj4gPiA+IGJ1aWxkIGZhaWx1cmUgc2luY2UgYnVtcCB0byB2ZXJzaW9uIDMuMS4w
IGluIGNvbW1pdAo+ID4gPiA0NzBlMmU5YmM1MjExMTg0NDMxZmJjODY4MzU5YTlkNjk1ZTYyNGY0
IGFuZAo+ID4gPiBodHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRzcy9jb21t
aXQvOWQ0MmY0ZGJkZTZhOTQ3MjRlOTVkNTdjMzMzY2RhNzcxMWRkYTU3YzoKPiA+IFNvIHRoaXMg
Y29tbWl0IGFkZHM6Cj4gPiAjIENoZWNrIGFsbCB0b29scyB1c2VkIGJ5IG1ha2UgaW5zdGFsbAo+
ID4gQVNfSUYoW3Rlc3QgIiRIT1NUT1MiID0gIkxpbnV4Il0sCj4gPiAgICAgICBbRVJST1JfSUZf
Tk9fUFJPRyhbZ3JvdXBhZGRdKQo+ID4gICAgICAgIEVSUk9SX0lGX05PX1BST0coW3VzZXJhZGRd
KQo+ID4gICAgICAgIEVSUk9SX0lGX05PX1BST0coW2lkXSkKPiA+ICAgICAgICBFUlJPUl9JRl9O
T19QUk9HKFtjaG93bl0pCj4gPiAgICAgICAgRVJST1JfSUZfTk9fUFJPRyhbY2htb2RdKQo+ID4g
ICAgICAgIEVSUk9SX0lGX05PX1BST0coW21rZGlyXSkKPiA+ICAgICAgICBFUlJPUl9JRl9OT19Q
Uk9HKFtzZXRmYWNsXSldKQo+ID4KPiA+IEJ1dCBpbiB0aGUgY29udGV4dCBvZiBCdWlsZHJvb3Qs
IHVzaW5nIGdyb3VwYWRkLCB1c2VyYWRkLCBjaG93biwgY2htb2QsCj4gPiBzZXRmYWNsIGF0IGlu
c3RhbGwgdGltZSBjYW5ub3Qgd29yaywgc2luY2Ugd2UncmUgbm90IGRvaW5nICJtYWtlCj4gPiBp
bnN0YWxsIiBhcyByb290Lgo+ID4KPiA+IFNvIGFyZSB3ZSBzdXJlIHRoYXQgYWRkaW5nIGhvc3Qt
YWNsIGFzIGEgZGVwZW5kZW5jeSB0byBnZXQgYSBob3N0Cj4gPiB2YXJpYW50IG9mIHNldGZhY2wg
aXMgcmVhbGx5IHRoZSBnb29kIHNvbHV0aW9uPwo+ID4KPiA+IEhvdyBpcyBpdCBoYW5kbGVkIGZv
ciBncm91cGFkZC91c2VyYWRkL2Nob3duL2NobW9kIHRvZGF5ID8KPiBncm91cGFkZC91c2VyYWRk
L2Nob3duL2NobW9kIGFyZSBjYWxsZWQgc2luY2UgdmVyc2lvbiAzLjAuMCBhbmQKPiBodHRwczov
L2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRzcy9jb21taXQvZDAxYzI0ZTZjYjA5NWUx
OGM1ZTI5YWY0YTMwMTgwMTBiMzIzMGE2ZAo+IAo+IHNldGZhY2wgaXMgY2FsbGVkIHNpbmNlIHZl
cnNpb24gMy4wLjAgYW5kCj4gaHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10
c3MvY29tbWl0LzgxMWU0NTFjOTQyNTQ0OTYzMzhkMzY3ODNjZGE0NGE3NzI5YjA4NWEKPiAKPiBC
dXQgbW9yZSBpbXBvcnRhbnRseSwgYWxsIHRob3NlIGZ1bmN0aW9ucyBhcmUgbm90IGV2ZW4gdXNl
ZCBvbiBhCj4gdGFyZ2V0IHdpdGhvdXQgc3lzdGVtZCBhbmQgYSBob3N0IHdpdGgKPiBzeXN0ZW1k
LXtzeXN1c2Vycyx0bXBmaWxlc30gYmVjYXVzZSB0cG0yLXRzcyB0cnkgdG8gaW5zdGFsbCBmaWxl
cyBpbgo+ICQoVEFSR0VUX0RJUikvZXRjL3tzeXN1c2Vycyx0bXBmaWxlc30uZCB3aGljaCBkb24n
dCBldmVuIGV4aXN0IGlmCj4gQlIyX0lOSVRfU1lTVEVNRCBpcyBub3Qgc2V0Lgo+IEV2ZW4gaWYg
QlIyX0lOSVRfU1lTVEVNRCBpcyBzZXQsIHRoZSBwYXRoIGlzIHdyb25nIGFzIGl0IHNob3VsZCBi
ZQo+IGluc3RhbGxlZCBpbiAkKFRBUkdFVF9ESVIpL3Vzci9saWIve3N5c3VzZXJzLHRtcGZpbGVz
fS5kCj4gCj4gVG8gY29uY2x1ZGUsIEkgd291bGQgc2F5IHRoYXQgaW5zdGFsbCBvZiB0cG0yLXRz
cyBpcyBwYXJ0aWFsbHkgYnJva2VuCj4gc2luY2UgYXQgbGVhc3QgYnVtcCB0byB2ZXJzaW9uIDMu
MC4wIGluIGNvbW1pdAo+IDg5ZjNkOTBlMjRiYjI0YjcwZmM0YTM3YmY4Y2ZmNjE4NjY3MjQ3NWMu
CgpBZ3JlZWQsIHRoZSBpbnN0YWxsIGlzIGJvcmtlZCBiZWNhdXNlIGl0IGlzIGxvb2tpbmcgZm9y
IHByb2dyYW1zIGF0CmNvbmZpZ3VyZSB0aW1lLCBzbyBpdCBmaW5kcyB0aG9zZSBvbiB0aGUgaG9z
dCBpZiB0aGV5IGV4aXN0LCBvciBkbyBub3QKZmluZCBhbnkgYXQgYWxsLCB3aGljaCBjYW4gdmVy
eSB3ZWxsIGRpZmZlciBmcm9tIHdoYXQgd2lsbCBiZSBwcmVzZW50Cm9uIHRoZSB0YXJnZXQuCgpC
dXQgSSB3b3VsZCBzYXkgdGhhdCB0aGlzIGlzIG5vdCB0b3RhbGx5IHVucmVhc29uYWJsZTogdGhl
cmUgaXMgbm8gd2F5LAphdCBjcm9zcy1jb25maWd1cmUgdGltZSwgZm9yIGEgcGFja2FnZSB0byBm
aW5kIHRoZSB0b29scyB0aGF0IHdpbGwgYmUKcHJlc2VudCBhdCBydW50aW1lLgoKQWxsIHdlIGNh
biBkbyBpbiBzdWNoIGEgY2FzZSBpdCBmb3JjZSB0aGUgcGF0aCB0byBzdWNoIHRvb2xzLgoKSG93
ZXZlciwgaW4gdGhpcyBjYXNlLCB0cG0yLXRzcyBvbmx5IHVzZXMgc2V0ZmFjbCBpZiBzeXN0ZW1k
LXRtcGZpbGVzIGlzCm5vdCBhdmFpbGFibGUuIElmIHRoZSBjYWxsIHRvIHNldGZhY2wgZmFpbHMs
IHRoZSBpbnN0YWxsIGRvZXMgbm90IGZhaWwKKHNwbGl0IG9uIHR3byBsaW5lcyBmb3IgcmVhZGFi
aWxpdHkpOgoKICAgIEAtJChjYWxsIG1ha2VfZmFwaV9kaXJzKSAmJiAkKGNhbGwgc2V0X2ZhcGlf
cGVybWlzc2lvbnMpIFwKICAgIHx8IGVjaG8gIldBUk5JTkcgRmFpbGVkIHRvIGNyZWF0ZSB0aGUg
RkFQSSBkaXJlY3RvcmllcyB3aXRoIHRoZSBjb3JyZWN0IHBlcm1pc3Npb25zIgoKc2V0X2ZhcGlf
cGVybWlzc2lvbnMgaXMgYSBtYWNybyB0aGF0IGV2ZW50dWFsbHkgZXhwYW5kcyB0bzoKCiAgICAo
Y2hvd24gLVIgdHNzOnRzcyAiJDEiKSAmJiBcCiAgICAoY2htb2QgLVIgMjc3NSAiJDEiKSAmJiBc
CiAgICAoc2V0ZmFjbCAtbSBkZWZhdWx0Omdyb3VwOnRzczpyd3ggIiQxIikKClNvIHRoZSBjYWxs
IHRvIHNldGZhY2wgd2lsbCBub3QgZXZlbiBiZSBldmVyIGF0dGVtcHRlZCwgYmVjYXVzZSB0aGUK
Y2hvd24gd2lsbCBmYWlsIGZpcnN0LgoKV2UgaGF2ZSB0aHJlZSBzb2x1dGlvbnMgdG8gdGhhdDoK
CiAgLSBlaXRoZXIgd2UgZm9yY2UgdGhlIHVzZSBvZiBzeXN0ZW1kLXRtcGZpbGVzIHdoZW4gdHBt
Mi10c3MgaXMKICAgIGVuYWJsZWQsCgogIC0gb3Igd2UgZGlzYWJsZSB0cG0yLXRzcyBpZiBzeXN0
ZW1kLXRtcGZpbGVzIGlzIG5vdCBlbmFibGVkLAoKICAtIG9yIHdlIGp1c3QgY29uZmlndXJlIHRw
bTItdHNzIHdpdGggYWNfY3ZfcHJvZ19yZXN1bHRfc2V0ZmFjbD10cnVlLAogICAgYW5kIGxldCB0
aGUgaW5zdGFsbCB1c2UgdGhlIGZhbGxiYWNrIHBhdGggYW5kIGJlIGRvbmUgd2l0aCBpdC4KClNv
LCB0aGlzIHdvdWxkIGZpeCB0aGUgaW1tZWRpYXRlIGlzc3VlLgoKTm93IHRoZXJlIHdvdWxkIHJl
bWFpbiB0aGUgaXNzdWUgdGhhdCBzb21lIGZlYXR1cmVzIG9mIHRwbTItdHNzIHNpbGwgYmUKaW5j
b3JyZWN0bHkgZW5hYmxlZC9kaXNhYmxlZCBkZXBlbmRpbmcgb24gd2h0aGVyIHRoZSBob3N0IGhh
cyBvciBpcwptaXNzaW5nIHN5c3RlbWQtdXNlcnMgYW5kL29yIHN5c3RlbWQtdG1wZmlsZXM6Cgog
ICAgIyBDaGVjayBmb3Igc3lzdGVtZCBoZWxwZXIgdG9vbHMgdXNlZCBieSBtYWtlIGluc3RhbGwK
ICAgIEFDX0NIRUNLX1BST0coc3lzdGVtZF9zeXN1c2Vycywgc3lzdGVtZC1zeXN1c2VycywgeWVz
KQogICAgQU1fQ09ORElUSU9OQUwoU1lTRF9TWVNVU0VSUywgdGVzdCAieCRzeXN0ZW1kX3N5c3Vz
ZXJzIiA9ICJ4eWVzIikKICAgIEFDX0NIRUNLX1BST0coc3lzdGVtZF90bXBmaWxlcywgc3lzdGVt
ZC10bXBmaWxlcywgeWVzKQogICAgQU1fQ09ORElUSU9OQUwoU1lTRF9UTVBGSUxFUywgdGVzdCAi
eCRzeXN0ZW1kX3RtcGZpbGVzIiA9ICJ4eWVzIikKCkluIHdoaWNoIGNhc2Ugd2Ugd291bGQgbmVl
ZCB0byBwYXNzIGFjX2N2X3Byb2dfc3lzdGVtZF9zeXN1c2Vycz15ZXMgYW5kCnN5c3RlbWRfdG1w
ZmlsZXM9eWVzIHdoZW4gdGhleSBhcmUgZW5hYmxlZCBpbiBvdXIgY29uZmlnLgoKVGhpcyB3b3Vs
ZCBiZSBmb3IgYW5vdGhlciBwYXRjaCwgb2YgY291cnNlLgoKSSdsbCBzZWUgdG8gc2VuZCBhcHBy
b3ByaWF0ZSBwYXRjaGVzIHNvb25pc2guCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKLS0gCi4t
LS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0u
LS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVk
ZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAz
NzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAg
ICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFgg
IEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1h
LWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3ku
ICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0t
LS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
