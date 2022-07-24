Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 071AEC43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 09:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A613660FE6;
	Sun, 24 Jul 2022 09:20:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A613660FE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N7aL0BniMfPw; Sun, 24 Jul 2022 09:20:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 971CA60B56;
	Sun, 24 Jul 2022 09:20:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 971CA60B56
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 802A81BF2B9
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 09:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59C3560B56
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 09:20:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59C3560B56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wARBTnXo6XJA for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 09:20:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E189C60B4F
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E189C60B4F
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 09:20:51 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 b21-20020a05600c4e1500b003a32bc8612fso4704566wmq.3
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 02:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=f81hVWDQaUCepHpbKHhVvSgIBsZNo0Z6wCXZjjs+vHo=;
 b=UG++Tr+BAol8X6XPNREw7Vjzx1wGShMwpkbJDLExQjKy6eJ/FBpdDhq5WBKwcOnp9P
 QbygRq2ZXYvfbkfqs/hwXEgVnbr6Nj7hjnI0bmRhPQ9f6rRk0OEM1S7C3XLdFtAZC47u
 aOqKu+Xhfeszwgc33/t0N0Wa/0wbBPOnZQD20NAMf5pWZcYhJgrNJyS/9oJUSQHvO+ZO
 vEw/QB7lgTeVMrcruNoyJFOtCRkz8z2LgOAttWHtDiKCf6JjFYA8H5CySApA4Uc1LTxy
 UVe/Nky2ykaa0AiMbRXUifV+jfaI1ZdE+daPgeEfdNv2DFlX5dzmd2510WXX48wXUay1
 /lBw==
X-Gm-Message-State: AJIora+jyi1T0YwcZhIc86Fd3C8S+diwPFnWyC3Wics4oMByWWGhAAGm
 ryZYgqvGp9aLN+xVJuLsNJHclA==
X-Google-Smtp-Source: AGRyM1uEg7ZAEQdJBZ3TeKmSgbj9TKfz2kEEx15Yj41UpTTc1obcSYeHScCoK8R9/ktWXoaHA1uCyg==
X-Received: by 2002:a05:600c:4e44:b0:3a3:279b:30e4 with SMTP id
 e4-20020a05600c4e4400b003a3279b30e4mr5182233wmq.37.1658654449638; 
 Sun, 24 Jul 2022 02:20:49 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 9-20020a05600c22c900b003a3270735besm10514979wmg.28.2022.07.24.02.20.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 02:20:49 -0700 (PDT)
Message-ID: <3e52a7cc-8858-dfb6-a761-021404a5ce5e@smile.fr>
Date: Sun, 24 Jul 2022 11:20:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Norbert Lange <nolange79@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210415144226.2354048-1-jpcartal@free.fr>
 <20210419232810.4ceef826@windsurf.home>
 <CADYdroPo=C9766obODNYLTfGy6+=2zgBFFOcgGH2s0DAuS58rg@mail.gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <CADYdroPo=C9766obODNYLTfGy6+=2zgBFFOcgGH2s0DAuS58rg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=f81hVWDQaUCepHpbKHhVvSgIBsZNo0Z6wCXZjjs+vHo=;
 b=MDfezIASKI/K71XoyBeDVpO0MJKTGRk/T8xjB4aQ0dTh0+gl0H4Nt5sGgksZu748pr
 y1i50cClkk2bLn2dZN0XDY3X7ivAbt0PHROwY+BEUEzW97GhQ3B39bm05k/9JX576eb/
 7dsLyECFlSg64raVj7I9J36+wR1FmPEROiw2YzIaRx2+Hl5dEPvelwCXG7tPLr3XSKhd
 FavjFLFOJlzeUeofjug6ctrdYLqI9DDHRWJkzAd6lmflauP4ps0RexFaLPVzwiahWqJr
 TQG42oesXroqAN40rJcStZP6Em1+mgOfZuvgJv6EynyKDJbSMBVWYQVCCmolWaI2s/6g
 h24g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=MDfezIAS
Subject: Re: [Buildroot] [PATCH 1/1] package/libglib2: fix dbus system
 socket location
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
Cc: Jean-pierre Cartal <jpcartal@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSAyMC8wNC8yMDIxIMOgIDEwOjE5LCBOb3JiZXJ0IExhbmdlIGEgw6ljcml0wqA6
Cj4gQW0gTW8uLCAxOS4gQXByLiAyMDIxIHVtIDIzOjI4IFVociBzY2hyaWViIFRob21hcyBQZXRh
enpvbmkKPiA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT46Cj4+Cj4+IEhlbGxvIEplYW4t
UGllcnJlLAo+Pgo+PiArTm9yYmVydCBpbiBDYywgc2luY2UgaGUgY2hhbmdlZCB0aGUgREJ1cyBz
b2NrZXQgbG9jYXRpb24gaW4gY29tbWl0Cj4+IDZiOWE3NWE1YmQxYjFhNTU5YjczNTIwMDM1ODhk
MTQ2MWRlOGM0ZDEuCj4+Cj4+IE9uIFRodSwgMTUgQXByIDIwMjEgMTY6NDI6MjYgKzAyMDAKPj4g
SmVhbi1waWVycmUgQ2FydGFsIDxqcGNhcnRhbEBmcmVlLmZyPiB3cm90ZToKPj4KPj4+IEZpeCBk
YnVzIHN5c3RlbSBzb2NrZXQgbG9jYXRpb24gbW92ZWQgZnJvbQo+Pj4gL3Zhci9ydW4vZGJ1cy9z
eXN0ZW1fYnVzX3NvY2tldCB0byAvcnVuL2RidXMvc3lzdGVtX2J1c19zb2NrZXQKPj4+Cj4+PiBT
aWduZWQtb2ZmLWJ5OiBKZWFuLXBpZXJyZSBDYXJ0YWwgPGpwY2FydGFsQGZyZWUuZnI+Cj4+PiAt
LS0KPj4+ICBwYWNrYWdlL2xpYmdsaWIyLzAwMDUtZGJ1cy1zeXN0ZW0tc29ja2V0LXBhdGgucGF0
Y2ggfCAxMSArKysrKysrKysrKwo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCsp
Cj4+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbGliZ2xpYjIvMDAwNS1kYnVzLXN5c3Rl
bS1zb2NrZXQtcGF0aC5wYXRjaAo+Pj4KPj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYmdsaWIy
LzAwMDUtZGJ1cy1zeXN0ZW0tc29ja2V0LXBhdGgucGF0Y2ggYi9wYWNrYWdlL2xpYmdsaWIyLzAw
MDUtZGJ1cy1zeXN0ZW0tc29ja2V0LXBhdGgucGF0Y2gKPj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cj4+PiBpbmRleCAwMDAwMDAwMDAwLi5iYjJlYzMzZGM2Cj4+PiAtLS0gL2Rldi9udWxsCj4+PiAr
KysgYi9wYWNrYWdlL2xpYmdsaWIyLzAwMDUtZGJ1cy1zeXN0ZW0tc29ja2V0LXBhdGgucGF0Y2gK
Pj4+IEBAIC0wLDAgKzEsMTEgQEAKPj4+ICtkaWZmIC1OYXVyIGxpYmdsaWIyLTIuNjYuOC5vcmln
L2dpby9nZGJ1c2FkZHJlc3MuYyBsaWJnbGliMi0yLjY2LjgvZ2lvL2dkYnVzYWRkcmVzcy5jCj4+
PiArLS0tIGxpYmdsaWIyLTIuNjYuOC5vcmlnL2dpby9nZGJ1c2FkZHJlc3MuYyAgICAgMjAyMS0w
My0xOCAxNDo0Nzo0OC4yNTY2OTMwMDAgKzAxMDAKPj4+ICsrKysgbGliZ2xpYjItMi42Ni44L2dp
by9nZGJ1c2FkZHJlc3MuYyAgMjAyMS0wNC0xNSAxNjoxNDoyOC41MTkyOTY1ODQgKzAyMDAKPj4+
ICtAQCAtMTMzMSw3ICsxMzMxLDcgQEAKPj4+ICsKPj4+ICsgICAgICAgaWYgKHJldCA9PSBOVUxM
KQo+Pj4gKyAgICAgICAgIHsKPj4+ICstICAgICAgICAgIHJldCA9IGdfc3RyZHVwICgidW5peDpw
YXRoPS92YXIvcnVuL2RidXMvc3lzdGVtX2J1c19zb2NrZXQiKTsKPj4+ICsrICAgICAgICAgIHJl
dCA9IGdfc3RyZHVwICgidW5peDpwYXRoPS9ydW4vZGJ1cy9zeXN0ZW1fYnVzX3NvY2tldCIpOwo+
Pj4gKyAgICAgICAgIH0KPj4+ICsgICAgICAgYnJlYWs7Cj4+Cj4+IE9uIHRoZSBmb3JtLCBhbGwg
cGF0Y2hlcyBpbiBCdWlsZHJvb3QgbmVlZCB0byBoYXZlIGEgcHJvcGVyIGNvbW1pdAo+PiBkZXNj
cmlwdGlvbiBhbmQgU2lnbmVkLW9mZi1ieSBsaW5lLgo+Pgo+PiBCdXQgb24gdGhlIGFjdHVhbCBj
b250ZW50LCBJIGFtIHdvbmRlcmluZyBpZiB0aGlzIGlzIHRoZSByaWdodAo+PiBkaXJlY3Rpb24g
dG8gdGFrZS4gRG8gd2Ugd2FudCB0byBrZWVwIHRoaXMgbm9uLXVwc3RyZWFtYWJsZSBwYXRjaAo+
PiBhcm91bmQgZm9yZXZlciA/Cj4gCj4gd2h5IG5vbi11cHN0cmVhbWFibGU/Cj4gQWxsIHRoZSBt
b2Rlcm4gYnVpbGQgc3lzdGVtcyBsaWtlIENNYWtlIFsxXSBhbmQgQXV0b3Rvb2xzIFsyXSBoYXZl
IGEKPiAicnVuc3RhdGVkaXIiLCB3b3VsZAo+IGJlIGdvb2QgcHJhY3RpY2UgdG8gdXNlIGl0LiBE
b250IHNlZSB3aHkgdGhpcyBzaG91bGRuJ3QgYmUgZml4ZWQgdXBzdHJlYW0uCj4gCj4gKE1pZ2h0
IGJlIGEgZ29vZCBpZGVhIGlmIGJ1aWxkcm9vdCBjb3VsZCBzZXQgdGhlIHJ1bnN0YXRlZGlyIGZv
ciBDTWFrZQo+IGFuZCBBdXRvdG9vbHMsIGJ1dCBpdHMgYSBiaXQgb2YgYSBoYXNzbGUgdG8gY2hl
Y2sgaWYgdGhlIGxhdGVyCj4gc3VwcG9ydHMgdGhlIGFyZ3VtZW50KQo+IAo+PiBBY2NvcmRpbmcg
dG8gY29tbWl0IDZiOWE3NWE1YmQxYjFhNTU5YjczNTIwMDM1ODhkMTQ2MWRlOGM0ZDEsIC92YXIv
cnVuCj4+IGlzIHN1cHBvc2VkIHRvIGJlIGEgc3ltbGluayB0byAvcnVuLCBzbyB5b3VyIHBhdGNo
IHNob3VsZCBiZSBhIG5vLW9wLgo+PiBCb3RoIG91ciBzeXN0ZW1kIGFuZCBzeXN2IHNrZWxldG9u
cyBlbnN1cmUgdGhpcyBzeW1saW5rIGV4aXN0Lgo+Pgo+PiBDb3VsZCB5b3UgcHJvdmlkZSBtb3Jl
IGRldGFpbHMgYWJvdXQgdGhlIGlzc3VlID8KPiAKPiBUbyBxdW90ZSBGSFMgMy4xNToKPiAiVGhl
IHB1cnBvc2VzIG9mIHRoaXMgZGlyZWN0b3J5IHdlcmUgb25jZSBzZXJ2ZWQgYnkgL3Zhci9ydW4u
IEluCj4gZ2VuZXJhbCwgcHJvZ3JhbXMgbWF5IGNvbnRpbnVlIHRvIHVzZSAvdmFyL3J1biB0byBm
dWxmaWxsIHRoZQo+IHJlcXVpcmVtZW50cyBzZXQgb3V0IGZvciAvcnVuIGZvciB0aGUgcHVycG9z
ZXMgb2YgYmFja3dhcmRzCj4gY29tcGF0aWJpbGl0eS4gUHJvZ3JhbXMgd2hpY2ggaGF2ZSBtaWdy
YXRlZCB0byB1c2UgL3J1biBzaG91bGQgY2Vhc2UKPiB0aGVpciB1c2FnZSBvZiAvdmFyL3J1biwg
ZXhjZXB0IGFzIG5vdGVkIGluIHRoZSBzZWN0aW9uIG9uIC92YXIvcnVuLiIKPiAKPiBpZiB5b3Ug
dXNlIC9ydW4geW91IHNob3VsZCBkbyBzbyBjb25zaXN0ZW50bHksIC92YXIvcnVuIHN5bWxpbmsg
aXMgYQo+IGJhbmRhaWQuIGlmIHlvdSB3YW50IGEgdGVjaG5pY2FsIHJlYXNvbiwgdGhpbmsgb2Yg
LyBiZWluZyBhIHRtcGZzIGFuZAo+IC92YXIgYmVpbmcgYSBORlMgbW91bnQsCj4geW91IGRvbid0
IHdhbnQgdG8gdHJhdmVyc2UgL3ZhciBpZiB5b3UgZG9udCBoYXZlIHRvLgoKSSBoYXZlIG1hcmtl
ZCB0aGlzIHBhdGNoIGFzICJSZWplY3RlZCIgaW4gcGF0Y2h3b3JrLgoKdXBzdHJlYW0gbGliZ2xp
YjIgc3RpbGwgdXNlIC92YXIvcnVuIHRvIGNvbm5lY3Qgd2l0aCB0aGUgZGJ1cyBzeXN0ZW0gc29j
a2V0LgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IE5vcmJlcnQKPiAKPiBbMV0gLSBodHRw
czovL2NtYWtlLm9yZy9jbWFrZS9oZWxwL2xhdGVzdC9tb2R1bGUvR05VSW5zdGFsbERpcnMuaHRt
bAo+IFsyXSAtIGh0dHBzOi8vd3d3LmdudS5vcmcvcHJlcC9zdGFuZGFyZHMvaHRtbF9ub2RlL0Rp
cmVjdG9yeS1WYXJpYWJsZXMuaHRtbAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidXN5
Ym94Lm5ldAo+IGh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
