Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60CD1C433EF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 22:32:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23804611BF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 22:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 23804611BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC4EF608DA;
	Tue,  9 Nov 2021 22:32:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hqhMhHNw1Qyl; Tue,  9 Nov 2021 22:32:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08342608CF;
	Tue,  9 Nov 2021 22:32:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 767B81BF3C2
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 22:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 650C5401E7
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 22:32:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pY7XBBEc-1ZP for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 22:32:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1CB08403D7
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 22:32:18 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id bi35so1057274lfb.9
 for <buildroot@buildroot.org>; Tue, 09 Nov 2021 14:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=v7vKQTYHeJezlvEncTiu1vY4VjcbgpjEXPHcGB7SB/8=;
 b=M8BVuornlR4pEJ+MbCDhuGLOvjIMzVKIj9ds2e5CZOaR3PlFH2cqMtWrtZ7PLigjWC
 HsKEUO261AQVYYovMngCvmXIRAK+4sNlyeLumGDvJEOVdz6zQkkpNOyuoLIqDjaF1d09
 650TXNsGa3K+TY/75kdg8mV3VHXE429vkWoADMXXBns33VE6p01GchHovQABpvvCmibq
 rBSR9oUVkc3SLUn5KW7ExmRloKgPaqvDTgImFkKIdAjVNPP3g3upo/hCz8Uq3G29h6tG
 vZMBwa4AinyFt79AmDZm00DPNgZA2UwB0HqcrrsScbfCfEbplbYHJNFTqzyxRY1TFdB4
 kHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=v7vKQTYHeJezlvEncTiu1vY4VjcbgpjEXPHcGB7SB/8=;
 b=0DbzA0rWS/0STiab356cQzF7qf3gh+4rDoJgpEM+ojIHcJr4Ba3vcDPad7g1EeDJkS
 AHD6ykPDoVvgcIIssjIAMjQ/jJ0XzpuoVFv5VjFaWbJ1qUQu0CdJI3z3Q1u5DMWQYaSr
 VP7+ohLCFAq8ey0vlQlDqL8KbcAJ1t/nn8H9PQUjrdEPSqjaQx879jO9Ll6CaatyPu/F
 uWoKTnDqSo4mYzC/y5Dr49d1xD07BRRtNWauipaZpKuxT8kunkHFowxhaiPwxIxM70gh
 YME7wAFt/30xKASNaAC4LOMGSE9c4zTR3uBtofLNl1ai7bdm+RIUUaYGC0MwUM3ExyWE
 Cf6w==
X-Gm-Message-State: AOAM530xPv5L9/CF2tpqhIJcVc3Y5BGk/h9NoxebOLBen8+MhoO9Mz0J
 6vMIpR0Wq1gCpg22xoYHbBSGBpJn77z6ykvh7mhbtEQnNvM=
X-Google-Smtp-Source: ABdhPJz1E/uAjww6LyPxaDOhM7U3LpQ4PUIzwsABIm0oH5LRTV8eFnBvNJO27W0CnxZ4Y7H7M/UHRGyF8SVj+NsJSQI=
X-Received: by 2002:a19:5e59:: with SMTP id z25mr10419471lfi.686.1636497136019; 
 Tue, 09 Nov 2021 14:32:16 -0800 (PST)
MIME-Version: 1.0
References: <20211105201257.2589008-1-fontaine.fabrice@gmail.com>
 <1f024089-4dff-0a78-ae7b-1b27895c511e@mind.be>
In-Reply-To: <1f024089-4dff-0a78-ae7b-1b27895c511e@mind.be>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 9 Nov 2021 23:30:12 +0100
Message-ID: <CAPi7W81aZKKUjq7rW8Ywgg3bzUVJxuCgp6E-NDnkqvxxp-aFjA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/bird: fix build with autoconf
 >= 2.70
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
Cc: =?UTF-8?Q?Adrien_Gallou=C3=ABt?= <adrien@gallouet.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgbWFyLiA5IG5vdi4gMjAyMSDDoCAyMzoxNiwgQXJub3V0IFZhbmRlY2FwcGVsbGUgPGFybm91
dEBtaW5kLmJlPiBhIMOpY3JpdCA6Cj4KPgo+Cj4gT24gMDUvMTEvMjAyMSAyMToxMiwgRmFicmlj
ZSBGb250YWluZSB3cm90ZToKPiA+IEZpeCB0aGUgZm9sbG93aW5nIGJ1aWxkIGZhaWx1cmUgcmFp
c2VkIHNpbmNlIGJ1bXAgb2YgYXV0b2NvbmYgdG8gdmVyc2lvbgo+ID4gMi43MSBpbiBjb21taXQg
ZWNkNTRiNjVjMWY5OThhN2NjZDkxZjdjNTIzZTRmZjM4YzQ3ODFkYToKPiA+Cj4gPiBjaGVja2lu
ZyBmb3IgZ2xvYi5oLi4uIG5vCj4gPiBjb25maWd1cmU6IGVycm9yOiBnbG9iLmggbm90IGZvdW5k
Lgo+ID4KPiA+IEZpeGVzOgo+ID4gICAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9y
ZXN1bHRzL2Q3YWFiN2RmMTk2ZTBmNmQ2Mzg5Yjg3ZmYyOWRhN2MyOTcxZTZiNmQKPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNv
bT4KPiA+IC0tLQo+ID4gICAuLi5ndXJlLmFjLWZpeC1idWlsZC13aXRoLWF1dG9jb25mLTIuNzAu
cGF0Y2ggfCA0MyArKysrKysrKysrKysrKysrKysrCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA0MyBp
bnNlcnRpb25zKCspCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2JpcmQvMDAwMS1j
b25maWd1cmUuYWMtZml4LWJ1aWxkLXdpdGgtYXV0b2NvbmYtMi43MC5wYXRjaAo+ID4KPiA+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL2JpcmQvMDAwMS1jb25maWd1cmUuYWMtZml4LWJ1aWxkLXdpdGgt
YXV0b2NvbmYtMi43MC5wYXRjaCBiL3BhY2thZ2UvYmlyZC8wMDAxLWNvbmZpZ3VyZS5hYy1maXgt
YnVpbGQtd2l0aC1hdXRvY29uZi0yLjcwLnBhdGNoCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
ID4gaW5kZXggMDAwMDAwMDAwMC4uYjQxMmE1NWVhZAo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysr
IGIvcGFja2FnZS9iaXJkLzAwMDEtY29uZmlndXJlLmFjLWZpeC1idWlsZC13aXRoLWF1dG9jb25m
LTIuNzAucGF0Y2gKPiA+IEBAIC0wLDAgKzEsNDMgQEAKPiA+ICtGcm9tIGFhNWJjNmQyZTU5YzUy
NTdkNzc3YTQ1ZWU0YTBlMGE3ODRjNDQyNDQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gPiAr
RnJvbTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gPiAr
RGF0ZTogRnJpLCA1IE5vdiAyMDIxIDIwOjU4OjQxICswMTAwCj4gPiArU3ViamVjdDogW1BBVENI
XSBjb25maWd1cmUuYWM6IGZpeCBidWlsZCB3aXRoIGF1dG9jb25mID49IDIuNzAKPiA+ICsKPiA+
ICtPbiBzb21lIGVtYmVkZGVkIHRvb2xjaGFpbnMsIGdsb2IuaCBkZXRlY3Rpb24gZmFpbHMgYmVj
YXVzZSAtZyBpcwo+ID4gK3dyb25nbHkgYWRkZWQgKGV2ZW4gd2hlbiBDRkxBR1MgaXMgb3Zlcndy
aXR0ZW4pOgo+ID4gKwo+ID4gK2NvbmZpZ3VyZTo1ODgxOiBjaGVja2luZyBmb3IgZ2xvYi5oCj4g
PiArY29uZmlndXJlOjU5MDQ6IC9ob21lL2dpdWxpb2JlbmV0dGkvYXV0b2J1aWxkL3J1bi9pbnN0
YW5jZS0yL291dHB1dC0xL2hvc3QvYmluL21pcHM2NGVsLWxpbnV4LWdjYyAtbyBjb25mdGVzdCAt
RF9MQVJHRUZJTEVfU09VUkNFIC1EX0xBUkdFRklMRTY0X1NPVVJDRSAtRF9GSUxFX09GRlNFVF9C
SVRTPTY0ICAtT3MgLWcwICAtcHRocmVhZCAtZm5vLXN0cmljdC1hbGlhc2luZyAtZm5vLXN0cmlj
dC1vdmVyZmxvdyAtZmx0byAtV2FsbCAtV2V4dHJhIC1Xc3RyaWN0LXByb3RvdHlwZXMgLVduby1w
YXJlbnRoZXNlcyAtV25vLXBvaW50ZXItc2lnbiAtV25vLW1pc3NpbmctZmllbGQtaW5pdGlhbGl6
ZXJzIC1EX0xBUkdFRklMRV9TT1VSQ0UgLURfTEFSR0VGSUxFNjRfU09VUkNFIC1EX0ZJTEVfT0ZG
U0VUX0JJVFM9NjQgIC1wdGhyZWFkIC1mbHRvPTQgLWcgY29uZnRlc3QuYyAgPiY1Cj4gPiArL2hv
bWUvZ2l1bGlvYmVuZXR0aS9hdXRvYnVpbGQvcnVuL2luc3RhbmNlLTIvb3V0cHV0LTEvaG9zdC9v
cHQvZXh0LXRvb2xjaGFpbi9iaW4vLi4vbGliL2djYy9taXBzNjRlbC1idWlsZHJvb3QtbGludXgt
dWNsaWJjLzguNC4wLy4uLy4uLy4uLy4uL21pcHM2NGVsLWJ1aWxkcm9vdC1saW51eC11Y2xpYmMv
YmluL2xkOiAvdG1wL2NjbGRsRUQ5Lmx0cmFuczAubHRyYW5zLm86KC5kZWJ1Z19pbmZvKzB4MmEp
OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBjb25mdGVzdC5jLmZiNzI5ZDEzJwo+ID4gKy9ob21l
L2dpdWxpb2JlbmV0dGkvYXV0b2J1aWxkL3J1bi9pbnN0YW5jZS0yL291dHB1dC0xL2hvc3Qvb3B0
L2V4dC10b29sY2hhaW4vYmluLy4uL2xpYi9nY2MvbWlwczY0ZWwtYnVpbGRyb290LWxpbnV4LXVj
bGliYy84LjQuMC8uLi8uLi8uLi8uLi9taXBzNjRlbC1idWlsZHJvb3QtbGludXgtdWNsaWJjL2Jp
bi9sZDogL3RtcC9jY2xkbEVEOS5sdHJhbnMwLmx0cmFucy5vOiguZGVidWdfaW5mbysweDJmKTog
dW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgY29uZnRlc3QuYy5mYjcyOWQxMycKPiA+ICsKPiA+ICtU
aGlzIGJ1aWxkIGZhaWx1cmUgaXMgcmFpc2VkIHNpbmNlIGF1dG9jb25mIDIuNzAgYW5kCj4gPiAr
aHR0cHM6Ly9naXQuc2F2YW5uYWguZ251Lm9yZy9jZ2l0L2F1dG9jb25mLmdpdC9jb21taXQvP2lk
PTc2NzU0ZTA0ZmNlNWY2YTc3MDFiZWM1N2IwNTcwMjA1ODVkZjJhZTMKPiA+ICtiZWNhdXNlIGFj
X3Rlc3RfQ0ZMQUdTIGlzIG5vdyBzZXQgdG8gJHtDRkxBR1MreX0gaW5zdGVhZCBvZgo+ID4gKyR7
Q0ZMQUdTK3NldH0KPiA+ICsKPiA+ICtGaXhlczoKPiA+ICsgLSBodHRwOi8vYXV0b2J1aWxkLmJ1
aWxkcm9vdC5vcmcvcmVzdWx0cy9kN2FhYjdkZjE5NmUwZjZkNjM4OWI4N2ZmMjlkYTdjMjk3MWU2
YjZkCj4gPiArCj4gPiArU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUu
ZmFicmljZUBnbWFpbC5jb20+Cj4gPiArW1Vwc3RyZWFtIHN0YXR1czogc2VudCB0byBiaXJkLXVz
ZXJzQG5ldHdvcmsuY3pdCj4KPiAgIFdoeSBub3QgY3JlYXRlIGFuIE1SPyBZb3UgY2FuIGxvZyBp
biB0byB0aGVpciBnaXRsYWIgd2l0aCBhIGdpdGh1YiBhY2NvdW50Cj4gKGZ1bm55IHRoYXQgeW91
IGNhbid0IGxvZyBpbiB3aXRoIGEgZ2l0bGFiLmNvbSBhY2NvdW50Li4uKQpJIHdhcyBhYmxlIHRv
IGxvZyBpbiB3aXRoIG15IGdpdGh1YiBhY2NvdW50IGJ1dCB0aGVuIEkgY291bGRuJ3QgZm9yawp0
aGUgcHJvamVjdCAocHJvamVjdCBsaW1pdCByZWFjaGVkIC4uLikuIE9wZW5pbmcgYW4gaXNzdWUg
aXMgbm90CnBvc3NpYmxlIGVpdGhlci4gU28gSSBzZW50IGluIGJ5IGVtYWlsLgo+Cj4gPiArLS0t
Cj4gPiArIGNvbmZpZ3VyZS5hYyB8IDIgKy0KPiA+ICsgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPiArCj4gPiArZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5h
YyBiL2NvbmZpZ3VyZS5hYwo+ID4gK2luZGV4IDY0MTgxZDI5Li5iNGIzZmNmYiAxMDA2NDQKPiA+
ICstLS0gYS9jb25maWd1cmUuYWMKPiA+ICsrKysgYi9jb25maWd1cmUuYWMKPiA+ICtAQCAtMTE0
LDcgKzExNCw3IEBAIEFDX1NFQVJDSF9MSUJTKFtjbG9ja19nZXR0aW1lXSwgW3J0IHBvc2l4NF0s
Cj4gPiArIEFDX0NBTk9OSUNBTF9IT1NUCj4gPiArCj4gPiArICMgU3RvcmUgdGhpcyB2YWx1ZSBi
ZWNhdXNlIGFjX3Rlc3RfQ0ZMQUdTIGlzIG92ZXJ3cml0dGVuIGJ5IEFDX1BST0dfQ0MKPiA+ICst
aWYgdGVzdCAiJGFjX3Rlc3RfQ0ZMQUdTIiAhPSBzZXQgOyB0aGVuCj4gPiArK2lmICEgdGVzdCAk
YWNfdGVzdF9DRkxBR1MgOyB0aGVuCj4KPiAgIFdvdWxkbid0IGl0IGJlIG1vcmUgZnV0dXJlLXNh
ZmUgdG8gcHV0IHF1b3RlcyBhcm91bmQgJGFjX3Rlc3RfQ0ZMQUdTPwpXaHkgbm90LCBJIGp1c3Qg
Y29weS9wYXN0ZWQgdGhlIGNoYW5nZSBtYWRlIGJ5IGF1dG9jb25mIGxpYi9hdXRvY29uZi9jLm00
OgoKLWlmIHRlc3QgIiRhY190ZXN0X0NYWEZMQUdTIiA9IHNldDsgdGhlbgoraWYgdGVzdCAkYWNf
dGVzdF9DWFhGTEFHUzsgdGhlbgo+Cj4gICBSZWdhcmRzLAo+ICAgQXJub3V0Cj4KPiA+ICsgICBi
aXJkX2NmbGFnc19kZWZhdWx0PXllcwo+ID4gKyBmaQo+ID4gKwo+ID4gKy0tCj4gPiArMi4zMy4w
Cj4gPiArCj4gPgpCZXN0IFJlZ2FyZHMsCgpGYWJyaWNlCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
