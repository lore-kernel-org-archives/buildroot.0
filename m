Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ECF9C433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 18:11:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E51B36128B
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 18:11:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E51B36128B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CF076067A;
	Wed, 20 Oct 2021 18:11:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PRzvs31J2rSQ; Wed, 20 Oct 2021 18:11:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA79D60B3B;
	Wed, 20 Oct 2021 18:11:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DC9E01BF584
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 18:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB4E540775
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 18:11:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ca9zDgA9DeIi for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 18:10:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 376E0404C1
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 18:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634753455;
 bh=Ze33UcsLM4JZMjdtZlxG/XukC9DxyfMLEp5CgJHanws=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=aFAFQ0cE4UgLfE+Hl3RfxFwOEx9/NGRgO8ho2Vl/pFe+dEEQaBDzjXElnwCmc8E2v
 lE4GnUYfaL+CeB2ERCwZ81d1ilx4EM5yh++ywJfvxgp7d+UbPnM63+RCExqnmdaQ5+
 aGdu5v9VcsInO07gtxUExGgH8AdBMujq7fVYMRCY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.182]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQ5rO-1mHApa3ELQ-00M4mr; Wed, 20
 Oct 2021 20:10:54 +0200
Date: Wed, 20 Oct 2021 20:10:53 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Steve <sleepy_dog@gmx.de>
Message-ID: <20211020201053.0a88c199@gmx.net>
In-Reply-To: <trinity-37320d19-a174-46c4-9f92-823a8454c4d5-1634734547955@3c-app-gmx-bap28>
References: <trinity-072a3cc2-e02b-45ac-9f17-5037678caabf-1634728973216@3c-app-gmx-bap28>
 <107f4e64-9a30-0b86-48fc-769cf12976b8@mind.be>
 <trinity-925a029f-87a5-4638-b533-9c4c46e363cc-1634732988358@3c-app-gmx-bap28>
 <52787ac7-f1cc-1c34-f8b3-03cda8a7d458@mind.be>
 <trinity-37320d19-a174-46c4-9f92-823a8454c4d5-1634734547955@3c-app-gmx-bap28>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:zt7gutOWSc091TmhQvRfC0TBq/28pr9Hnehw2l6JFKgpUx58X8t
 3z6dJCwl+lO2zyZhFSO3xQWkQhCx/5cl8BXraKstyzY+5JpKZZgA/PFA5795KGvcs+sYRge
 JxgKU7iSWUT/6jhFudjYVCpfchW+lkXRy1IB8nPSorvTHYaV66HEwfSKTXWmimCka3seotA
 cbEA4uuwlgcCPX4TreVNg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JVeURayR2yY=:D+GV9gS8QeoCCJ7amgOGZG
 NzhT3uoCzOZ8IqYLmFia3VBMo07QstObrbCfioLQcrO3fChwsdjPtakGLAKmGpimzgdJNErrI
 1166O42KrWmcccgdk5ItaA++v/QDA+/r/tSVITSDGNbOy8uxonb/0+bjWw27RfYHfO+3OYTVh
 Mt9nFAwkgMLfkij9mE0uRm28VPoygyNL//3gDL2PpztjFOAnsIiV5F17nTuG9D41Ph+Ghpbno
 MoMYEnuOqbBSJDjs796HOCtwv+d30OuEYoRiv6BDngehJCU5uQ9N28PQxSFIDgtmn0PSgy7J3
 Rq39M97mfnK+eQtM1CFBKFhEnPqD7rXIk5bVFWEHCl12h955ftWq7JzrdaH+o+2O8T73dD21r
 5VOCFo7f4t7LoB49X4XroI8AL4C53aEsGFcxXx/V9iC25vI8+ezExaT3j61M3gVazisB03jnW
 he62S8nRLF/wPsVUx9YPml4caBBnuicfQqAw4CtLTT3Zg1hQ0V0RdAvoi4dFqgjFqBpddUSsb
 qAcoTNldnqn2gjtCHhmtfSoIx9UO4C4goWD/3CWMLXgA4qUXLD/X1FEwRIbYpp5BiPMf/Cic9
 TyVsDn5xUWYDuRo+2/lKcuW3yG6kKLmRkR4axk19zM1E/ZVAjOJK76evWQxQCDpkTd0MZ+aBp
 sqKm0Fh53D/8Zrah9hHvuZfHs6cwN5l+5AGDHq6GaSnT4CcYTDGL6ANjkYO7IioOWvFpgOg6h
 jQIxMDoSwPS30/axm8AMJfyaQGXy6LhJp7ZtnEUvRyE8bgBIgweTPLi+jwc0cLU8WcY++08dR
 JizGuHk43Mfuv83SFobSMFFqtibbh3IFiQo606CIZHk2N0bDPe/hMeyWcU0j/SMXFKCV4F7gc
 qUxdFgd9VeLPIxm+J+0ietA50D1YXJ3tsXHcdkvHxI/gCrzj1t68YOQYRQ2oWNXI0a1KeyA7F
 4G+/6G6RUihJO+2jTTax0an0qcX2J+NMK8PCby6c1CsRmlTYVXySeZ3Aljmng2GN5vgerPBpR
 tNCqD95T6f63YVqcI0qOt7FWFlHRvJLmAvwPPrtlDILgn3ZyMhmfrTYHRCuGIxT3ev/QPsBQ9
 Fwm63psdTEARdM=
Subject: Re: [Buildroot] htop - "No btime in /proc/stat: Success"
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gU3RldmUsIEFybm91dCwKCk9uIFdlZCwgMjAgT2N0IDIwMjEgMTQ6NTU6NDcgKzAyMDAs
IFN0ZXZlIDxzbGVlcHlfZG9nQGdteC5kZT4gd3JvdGU6Cgo+IMKgCj4gPsKgSSBkb24ndCB1bmRl
cnN0YW5kIGhvdyBidGltZSBjYW4gYmUgMCB0aG91Z2guIElzIHRoZSB1cHRpbWUgKGluIC9wcm9j
L3VwdGltZSkgYWxzbyAwPwoKTW9zdCBSYXNwYmVycnkgUGkncyBhcmUgZGVsaXZlcmVkIHdpdGhv
dXQgUlRDIGFuZCAvcHJvYy9zdGF0IGJ0aW1lIGlzIHNldCB0bwonLi4udGhlIHRpbWUgcmVhZCBv
ZmYgdGhlIFJUQy4gVGhpcyBpcyByZXByZXNlbnRlZCBpbiBVbml4IHRpbWUgKGFrYSBQT1NJWCB0
aW1lCm9yIEVwb2NoIHRpbWUpLicgKHNlZSBbMV0pIGFuZCBzbyB3aWxsIGFsd2F5cyBiZSAnMCcg
KHVudGlsIHlvdSBjaGFuZ2UgdGhlCmRhdGUgcGVyIGNtZGxpbmUgb3IgbnRwKS4uLgoKVGhlIGh0
b3AgbWlzbGVhZGluZyBlcnJvciBtZXNzYWdlIGlzIGZpeGVkIHVwc3RyZWFtIGJ5IFsyXSBhbmQg
dGhlIGN1cnJlbnQgdmVyc2lvbgp1c2VkIG9uIGJ1aWxkcm9vdCBnaXQgbWFzdGVyIChodG9wLTMu
MS4xKSBhbHJlYWR5IGNvbnRhaW5zIHRoZSBmaXguLi4KClJlZ2FyZHMsClBldGVyCgpbMV0gaHR0
cHM6Ly9zdXBwb3J0LmN1bXVsdXNuZXR3b3Jrcy5jb20vaGMvZW4tdXMvYXJ0aWNsZXMvMjA0MzY0
ODg3LUVycm9yLU1lc3NhZ2UtU2Vlbi1taXNzaW5nLWJ0aW1lLWluLXByb2Mtc3RhdC0KWzJdIGh0
dHBzOi8vZ2l0aHViLmNvbS9odG9wLWRldi9odG9wL2NvbW1pdC83NDMzYmY0YjE4Mjc4MDgwZmIy
YWMyMmM1ODI4NDkwODgzMDY2NTcwCgo+IMKgCj4gTm8sIGl0J3Mgbm93ICIxMTAxNC41OCAyMjg5
Mi4wOSIKPiDCoAo+IFZvbjrCoCJBcm5vdXQgVmFuZGVjYXBwZWxsZSIgPGFybm91dEBtaW5kLmJl
Pgo+IAo+IE9uIDIwLzEwLzIwMjEgMTQ6MjksIFN0ZXZlIHdyb3RlOgo+ID4gPiBJcyAvcHJvYyBt
b3VudGVkPwo+ID4gaWYgIm1vdW50IiBvdXRwdXR0aW5nIGEgbGluZSwgYW1vbmcgb3RoZXJzLCBz
YXlpbmcgInByb2Mgb24gL3Byb2MgdHlwZSBwcm9jCj4gPiAocncscmVsYXRpbWUpIiBtZWFucyB0
aGF0LCB0aGVuIHllcwo+ID4KPiA+ID4gV2hhdCBpcyB0aGUgY29udGVudHMgb2YgL3Byb2Mvc3Rh
dD8KPiA+Cj4gPiAjIGNhdCAvcHJvYy9zdGF0Cj4gPiBjcHUgwqA3NSAwIDkxNyAzNjMxNDc0IDQ3
IDAgNCAwIDAgMAo+ID4gY3B1MCAyNiAwIDMzNiA5MDc4NzIgMSAwIDIgMCAwIDAKPiA+IGNwdTEg
MjMgMCA1MzYgOTA3MjQxIDE3IDAgMCAwIDAgMAo+ID4gY3B1MiAxOSAwIDIyIDkwODI0MiA3IDAg
MCAwIDAgMAo+ID4gY3B1MyA3IDAgMjMgOTA4MTE3IDIxIDAgMiAwIDAgMAo+ID4gaW50ciAxMjM1
NTYgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAxNjkgMjI3NSAwIDMgMCAw
IDAgMCAwIDAgMCAwIDAKPiA+IDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDYw
IDEgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDY0NCAwIDAgMCAwCj4gPiAwIDAgMCAwIDU1
MyAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAw
IDAgMCAwIDAgMCAwCj4gPiAwIDAgMCAyNTcgNDUwNDYgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAg
MCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwCj4gPiAwIDAgMCAwIDAgMCAw
IDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAg
MCAwIDAgMCAwCj4gPiAwIDAgMCAwIDAgMCAwIDAgNzQ1NDggMCAwIDAKPiA+IGN0eHQgMTg0Nzgx
Cj4gPiBidGltZSAwCj4gCj4gQWgsIHNvIGJ0aW1lIGlzIHRoZXJlLCBidXQgaXQncyB6ZXJvLCBh
bmQgaHRvcCBhcHBhcmVudGx5IGRvZXNuJ3QgbGlrZSB0aGF0Lgo+IAo+IEkgZG9uJ3QgdW5kZXJz
dGFuZCBob3cgYnRpbWUgY2FuIGJlIDAgdGhvdWdoLiBJcyB0aGUgdXB0aW1lIChpbiAvcHJvYy91
cHRpbWUpCj4gYWxzbyAwPwo+IAo+IAo+IFJlZ2FyZHMsCj4gQXJub3V0Cj4gCj4gCj4gPiBwcm9j
ZXNzZXMgMTg0Cj4gPiBwcm9jc19ydW5uaW5nIDEKPiA+IHByb2NzX2Jsb2NrZWQgMAo+ID4gc29m
dGlycSAxNTY2NTcgMCA3MDYxOSAzMyA1MzUgNTUzIDAgMTAzNTEgNzIyMDYgMCAyMzYwCj4gPiAq
Vm9uOirCoCJBcm5vdXQgVmFuZGVjYXBwZWxsZSIgPGFybm91dEBtaW5kLmJlPgo+ID4KPiA+IE9u
IDIwLzEwLzIwMjEgMTM6MjIsIFN0ZXZlIHdyb3RlOgo+ID4gPiBIZWxsbywKPiA+ID4gYSBMaW51
eCBpbWFnZSBidWlsdCB3aXRoIGEgcmVjZW50bHkgZG93bmxvYWRlZCBidWlsZHJvb3QsIHN0YXJ0
aW5nIHdpdGggdGhlCj4gPiA+IGRlZmNvbmZpZyBmb3IgUmFzcGJlcnJ5UGkzIGFuZCBhZGRpbmcg
c29tZSB0aGluZ3MgKGh0b3AgaWYgaXQgd2Fzbid0IGFscmVhZHksCj4gPiA+IG5hbm8sIG9wZW5z
c2gsIG9wZW52cG47IGFsc28gdGhlIGxpbnV4LW1lbnVjb25maWcgd2FzIGFsdGVyZWQsIGNvbmNl
cm5pbmcgVVNCCj4gPiA+IGRyaXZlciBzdHVmZikuCj4gPiA+Cj4gPiA+IFdoZW4sIGluIG1lbnVj
b25maWcsIEkgc2VhcmNoIHdpdGggLyBmb3IgaHRvcCwgaXQgc2hvd3MgdGhhdCBodG9wIGFuZCBh
bGwKPiA+ID4gZGVwZW5kZW5jaWVzIGFyZSBtZXQgKGFsbCBwb3NpdGl2ZSBkZXBlbmRlbmNpZXMg
YXJlIFs9eV0gYW5kIHRoZSBvbmUgbmVnYXRpdmUKPiA+ID4gKHN0YXRpYyBsaWJzKSBpcyBbPW5d
Lgo+ID4gPiBCdXQgd2hlbiBJIGNhbGwgaHRvcCBvbiB0aGUgcnVubmluZyBzeXN0ZW0sIEkgb25s
eSBnZXQgdGhlIGxpbmUgZ2l2ZW4gaW4gdGhlCj4gPiB0b3BpYy4KPiA+ID4gV2hhdCBjb3VsZCBi
ZSB0aGUgcHJvYmxlbT8KPiA+Cj4gPiBUaGlzIGlzIHNxdWFyZWx5IGluIHRoZSAidGhpcyBzaG91
bGRuJ3QgaGFwcGVuIiBkb21haW4uLi4KPiA+Cj4gPiBJcyAvcHJvYyBtb3VudGVkPwo+ID4KPiA+
IFdoYXQgaXMgdGhlIGNvbnRlbnRzIG9mIC9wcm9jL3N0YXQ/Cj4gPgo+ID4KPiA+IFJlZ2FyZHMs
Cj4gPiBBcm5vdXQKPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+ID4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+ID4gYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo+ID4gPGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdD4KPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+ID4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+ID4gYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo+ID4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
