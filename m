Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4559C7EE23
	for <buildroot@archiver.kernel.org>; Sun, 21 May 2023 20:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42F74408BA;
	Sun, 21 May 2023 20:45:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42F74408BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Npy4fs9eSYAA; Sun, 21 May 2023 20:45:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F23B24089D;
	Sun, 21 May 2023 20:45:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F23B24089D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 05A6A1BF3CB
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 20:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0F384089D
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 20:45:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0F384089D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jj8uwnNPDIAj for <buildroot@lists.busybox.net>;
 Sun, 21 May 2023 20:45:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84CFD40882
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 84CFD40882
 for <buildroot@buildroot.org>; Sun, 21 May 2023 20:45:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:a137:d754:ea62:50f7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 533B65FFBA;
 Sun, 21 May 2023 22:45:15 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 May 2023 22:45:14 +0200
Date: Sun, 21 May 2023 22:45:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230521204514.GG621937@scaer>
References: <20230518102222.11946-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230518102222.11946-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684701920;
 bh=6GuA+QbmmPZqfKRIHb5kR3oR/cLQpWFUc0yftpLPRaE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s6Qet/EEr+mZHInxz/X7sEfneLdYcVkJgnQtV7d0oHCzntiHHm5cwOOWop/IXGJND
 3UTy9/hbSH+BAWb32kZtVmef+/4U38CW7Mj3q4IP9eP3DUn3g9mWYS+B+DI9RXXJmX
 IndkgB5Br3vGM6zD9ie7bkkrT52E5g+VwkbC+0zI7F0EiRzvEBIgUHaPv6OqzA7D1D
 cgmEqyxAt28RgWaVhAIFrEN0TBdVgcEPVM+nUz6G4EqoNc03hEd4HFIugjGmJcEdlv
 hhUBu5EbXABtofjGcpg/4Fq0xJ6V1JUsyVY5+m5bnBvngcVnicUfFD3aNxP4Enip0s
 q8gHCDiW/sZ6A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=s6Qet/EE
Subject: Re: [Buildroot] [PATCH v1] package/llvm: add upstream patch to fix
 host compile (missing include in Signals.h)
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UGV0ZXIsIEFsbCwKCk9uIDIwMjMtMDUtMTggMTI6MjIgKzAyMDAsIFBldGVyIFNlaWRlcmVyIHNw
YWtlIHRodXNseToKPiBBZGQgdXBzdHJlYW0gcGF0Y2ggdG8gZml4IGhvc3QgY29tcGlsZSBlcnJv
ciBvbiBvcGVuU1VTRSBUdW1ibGV3ZWVkCj4gKGdjYy0xMy4wLjEpLgo+IAo+IEZpeGVzOgo+IAo+
ICAgLi4uL2J1aWxkL2hvc3QtbGx2bS0xMS4xLjAvaW5jbHVkZS9sbHZtL1N1cHBvcnQvU2lnbmFs
cy5oOjExNzo4OiBlcnJvcjogdmFyaWFibGUgb3IgZmllbGQg4oCYQ2xlYW51cE9uU2lnbmFs4oCZ
IGRlY2xhcmVkIHZvaWQKPiAgICAgMTE3IHwgICB2b2lkIENsZWFudXBPblNpZ25hbCh1aW50cHRy
X3QgQ29udGV4dCk7Cj4gICAgICAgICB8ICAgICAgICBefn5+fn5+fn5+fn5+fn4KPiAgIC4uLi9i
dWlsZC9ob3N0LWxsdm0tMTEuMS4wL2luY2x1ZGUvbGx2bS9TdXBwb3J0L1NpZ25hbHMuaDoxMTc6
MjQ6IGVycm9yOiDigJh1aW50cHRyX3TigJkgd2FzIG5vdCBkZWNsYXJlZCBpbiB0aGlzIHNjb3Bl
Cj4gICAgIDExNyB8ICAgdm9pZCBDbGVhbnVwT25TaWduYWwodWludHB0cl90IENvbnRleHQpOwo+
ICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fgo+ICAgLi4uL2J1aWxk
L2hvc3QtbGx2bS0xMS4xLjAvaW5jbHVkZS9sbHZtL1N1cHBvcnQvU2lnbmFscy5oOjE4OjE6IG5v
dGU6IOKAmHVpbnRwdHJfdOKAmSBpcyBkZWZpbmVkIGluIGhlYWRlciDigJg8Y3N0ZGludD7igJk7
IGRpZCB5b3UgZm9yZ2V0IHRvIOKAmCNpbmNsdWRlIDxjc3RkaW50PuKAmT8KPiAgICAgIDE3IHwg
I2luY2x1ZGUgPHN0cmluZz4KPiAgICAgKysrIHwrI2luY2x1ZGUgPGNzdGRpbnQ+Cj4gICAgICAx
OCB8Cj4gCj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9ydEBnbXgubmV0
PgoKQXBwbGllZCB0byBtYXN0ZXIsIHdpdGggYSByZXdyaXR0ZW4gY29tbWl0IHRpdGxlLCB0aGFu
a3MuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiAtLS0KPiAgLi4uLW1pc3NpbmctY3N0ZGlu
dC1oZWFkZXItdG8tU2lnbmFscy5oLnBhdGNoIHwgMzQgKysrKysrKysrKysrKysrKysrKwo+ICAx
IGZpbGUgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS9sbHZtLzAwMDItQWRkLW1pc3NpbmctY3N0ZGludC1oZWFkZXItdG8tU2lnbmFscy5oLnBh
dGNoCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGx2bS8wMDAyLUFkZC1taXNzaW5nLWNzdGRp
bnQtaGVhZGVyLXRvLVNpZ25hbHMuaC5wYXRjaCBiL3BhY2thZ2UvbGx2bS8wMDAyLUFkZC1taXNz
aW5nLWNzdGRpbnQtaGVhZGVyLXRvLVNpZ25hbHMuaC5wYXRjaAo+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uYzc5OGY1ODVkNgo+IC0tLSAvZGV2L251bGwKPiArKysg
Yi9wYWNrYWdlL2xsdm0vMDAwMi1BZGQtbWlzc2luZy1jc3RkaW50LWhlYWRlci10by1TaWduYWxz
LmgucGF0Y2gKPiBAQCAtMCwwICsxLDM0IEBACj4gK0Zyb20gYzZjNzFhYjQ3ZDY1OGFiOGY4NGU2
YTYwNjZkNDc2ZmQ5NjMyYmJjYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogU2Vy
Z2VpIFRyb2ZpbW92aWNoIDxzbHlpY2hAZ21haWwuY29tPgo+ICtEYXRlOiBNb24sIDIzIE1heSAy
MDIyIDA4OjAzOjIzICswMTAwCj4gK1N1YmplY3Q6IFtQQVRDSF0gQWRkIG1pc3NpbmcgPGNzdGRp
bnQ+IGhlYWRlciB0byBTaWduYWxzLmgKPiArCj4gK1dpdGhvdXQgdGhlIGNoYW5nZSBsbHZtIGJ1
aWxkIGZhaWxzIG9uIHRoaXMgd2VlaydzIGdjYy0xMyBzbmFwc2hvdCBhczoKPiArCj4gKyAgICBb
ICAwJV0gQnVpbGRpbmcgQ1hYIG9iamVjdCBsaWIvU3VwcG9ydC9DTWFrZUZpbGVzL0xMVk1TdXBw
b3J0LmRpci9TaWduYWxzLmNwcC5vCj4gKyAgICBJbiBmaWxlIGluY2x1ZGVkIGZyb20gbGx2bS9s
aWIvU3VwcG9ydC9TaWduYWxzLmNwcDoxNDoKPiArICAgIGxsdm0vaW5jbHVkZS9sbHZtL1N1cHBv
cnQvU2lnbmFscy5oOjExOTo4OiBlcnJvcjogdmFyaWFibGUgb3IgZmllbGQgJ0NsZWFudXBPblNp
Z25hbCcgZGVjbGFyZWQgdm9pZAo+ICsgICAgICAxMTkgfCAgIHZvaWQgQ2xlYW51cE9uU2lnbmFs
KHVpbnRwdHJfdCBDb250ZXh0KTsKPiArICAgICAgICAgIHwgICAgICAgIF5+fn5+fn5+fn5+fn5+
fgo+ICsKPiArVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9sbHZtL2xsdm0tcHJvamVjdC9j
b21taXQvZmYxNjgxZGRiMzAzMjIzOTczNjUzZjdmNWYzZjM0MzViNDhhMTk4My5wYXRjaAo+ICtT
aWduZWQtb2ZmLWJ5OiBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+Cj4gKy0tLQo+
ICsgaW5jbHVkZS9sbHZtL1N1cHBvcnQvU2lnbmFscy5oIHwgMSArCj4gKyAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykKPiArCj4gK2RpZmYgLS1naXQgYS9pbmNsdWRlL2xsdm0vU3VwcG9y
dC9TaWduYWxzLmggYi9pbmNsdWRlL2xsdm0vU3VwcG9ydC9TaWduYWxzLmgKPiAraW5kZXggZTBh
MThlNzIuLjE0ODIxNmI4IDEwMDY0NAo+ICstLS0gYS9pbmNsdWRlL2xsdm0vU3VwcG9ydC9TaWdu
YWxzLmgKPiArKysrIGIvaW5jbHVkZS9sbHZtL1N1cHBvcnQvU2lnbmFscy5oCj4gK0BAIC0xNCw2
ICsxNCw3IEBACj4gKyAjaWZuZGVmIExMVk1fU1VQUE9SVF9TSUdOQUxTX0gKPiArICNkZWZpbmUg
TExWTV9TVVBQT1JUX1NJR05BTFNfSAo+ICsgCj4gKysjaW5jbHVkZSA8Y3N0ZGludD4KPiArICNp
bmNsdWRlIDxzdHJpbmc+Cj4gKyAKPiArIG5hbWVzcGFjZSBsbHZtIHsKPiArLS0gCj4gKzIuNDAu
MQo+ICsKPiAtLSAKPiAyLjQwLjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4t
LS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4g
IHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGly
YWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBB
SUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0t
LS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8Cnwg
aHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8
ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0t
LS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
