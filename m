Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B260C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:30:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A146600EF
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:30:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0A146600EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC6F9827A8;
	Sat,  7 Aug 2021 17:30:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7QmjNroCKELh; Sat,  7 Aug 2021 17:30:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DBD182881;
	Sat,  7 Aug 2021 17:30:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9760E1BF39E
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 942A9402BD
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:30:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0hbqXfKEXCy8 for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 17:30:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F3AE402A6
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 17:30:50 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id t9so24839620lfc.6
 for <buildroot@buildroot.org>; Sat, 07 Aug 2021 10:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VXfuHHa2pUt5S61NtF2MjoN2qjIdw0TJUOhchs0NL68=;
 b=K7YRoGuByOl/TfEo0MHGS0QTV+J3fwF6IQvCT7a/BUs6MgX6iETmz1kpLvNZIW3Kn0
 l2f9M2xZqoxYpwoKWxyC7uruOidcOwi11boewxNBYyKrkxCGREVXXQCvIwxeOaLZa9Y3
 E/FceICc2Zn89mBGQMswztbTKv0QkY1+G97quzDpRD3246aXo4xXlcTLeixk6OCoSyJr
 ZkAervYb0/KrKxcwM/aR98XDGaloo6nylU8hWZL3EoYCe0Rte5VcRJhpA2DsdDitzD5w
 +67gRlD3m50fftKydTaciMk0hTL0A7+T1cD3PdBl4LTwbP9rqDu7f4OhrBMyPZTIQqCh
 4lXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VXfuHHa2pUt5S61NtF2MjoN2qjIdw0TJUOhchs0NL68=;
 b=HsObTa7Cvw8h1PnQz5+VgBQ/qUl2Zn+468a2h0WjErAHkt0wHScmNnLpf7DfdxE6Jc
 tfaOYMcTkT3yUl8ZIJOMvR32p6s/YUTmfKpE8amJfHVfyX2lwRrYifWxIu8nGhnl5yIr
 3/M1GP8GpSfWwZB7MTncQKtQ/eHxXjqC8XgYXXAjPjFB6BnJVAY4p4zmZF5skyMmxGom
 uWUHTPCOHUkOm4xbPfNUodG0FFTD5Fkqokd6+jgQ5PoYrD+xmVeLB0jfpDqBI/qdHmbI
 fH+BVMl1stKeBdT8/ZISuKh61QkGWm+zlWHZ42nfeLgKYgrzqLaStYad88uw+QgCQnr0
 Ryyg==
X-Gm-Message-State: AOAM532Argwp0qKSVztNlTAe1JlMl9uXh2Y2M/XX3Ro8RGwetuBh/hn8
 l8w0wmnIPncfxijEABNu/kV7HzrNOgMamrs8pMYFlEDazUs=
X-Google-Smtp-Source: ABdhPJyE3NjoNb5SNr3Vb3jnHh5To+BplaM57avgFGRmN9FYEcjofVvhwiHaamJZMUNyqiln7swRFlkQMB7vSgeCqDw=
X-Received: by 2002:a05:6512:318c:: with SMTP id
 i12mr12127010lfe.155.1628357448337; 
 Sat, 07 Aug 2021 10:30:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210806184411.4062961-1-fontaine.fabrice@gmail.com>
 <20210807085303.GU27036@scaer>
 <CAPi7W81cMuZYxxLKYW22N6-htbfCaXYkHoJCmnV-izpjCvSMew@mail.gmail.com>
 <20210807171249.GE27036@scaer>
In-Reply-To: <20210807171249.GE27036@scaer>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 7 Aug 2021 19:30:35 +0200
Message-ID: <CAPi7W805DspE_i1aD+UR-f9eH02jc21mH13M3DwFBLxfGWWOYw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/guile: fix build on riscv32
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

WWFubiwKCkxlIHNhbS4gNyBhb8O7dCAyMDIxIMOgIDE5OjEyLCBZYW5uIEUuIE1PUklOIDx5YW5u
Lm1vcmluLjE5OThAZnJlZS5mcj4gYSDDqWNyaXQgOgo+Cj4gRmFicmljZSwgQWxsLAo+Cj4gT24g
MjAyMS0wOC0wNyAxNzowOCArMDIwMCwgRmFicmljZSBGb250YWluZSBzcGFrZSB0aHVzbHk6Cj4g
PiBMZSBzYW0uIDcgYW/Du3QgMjAyMSDDoCAxMDo1MywgWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jp
bi4xOTk4QGZyZWUuZnI+IGEgw6ljcml0IDoKPiA+ID4gT24gMjAyMS0wOC0wNiAyMDo0NCArMDIw
MCwgRmFicmljZSBGb250YWluZSBzcGFrZSB0aHVzbHk6Cj4gPiA+ID4gRml4IHRoZSBmb2xsb3dp
bmcgYnVpbGQgZmFpbHVyZSBvbiByaXNjdjMyOgo+ID4gPiA+IHN5c3RlbS9iYXNlL3RhcmdldC5z
Y206MTMyOjE2OiBJbiBwcm9jZWR1cmUgdHJpcGxldC1wb2ludGVyLXNpemU6Cj4gPiA+ID4gdW5r
bm93biBDUFUgd29yZCBzaXplICJyaXNjdjMyIgo+IFstLVNOSVAtLV0KPiA+ID4gPiArKyAgICAg
ICAgICAoKHN0cmluZy1tYXRjaCAiXnJpc2N2LioiIGNwdSkgOCkKPiA+ID4gQXJlIHlvdSBzdXJl
IHRoYXQgYSAzMi1iaXQgQ1BVIHdpbGwgaGF2ZSA4LWJ5dGUgd2lkZSB3b3Jkcz8gSSB3b3VsZAo+
ID4gPiBoYXZlIG5hdHVycmFsbHkgZXhwZWN0ZWQgdGhlbSB0byBiZSBqdXN0IDQtYnl0ZSB3aWRl
Li4uCj4gPiBBcyBJJ20gbm90IGFuIGV4cGVydCBpbiByaXNjdiwgSSBzZWFyY2hlZCBvbiB3aWtp
cGVkaWEgYW5kIGhlcmUgaXMgYW4KPiA+IGV4dHJhY3Qgb2YgaHR0cHM6Ly9lbi53aWtpcGVkaWEu
b3JnL3dpa2kvUklTQy1WOgo+ID4gIk1lbW9yeSBpcyBhZGRyZXNzZWQgYXMgOC1iaXQgYnl0ZXMs
IHdpdGggd29yZHMgYmVpbmcgaW4gbGl0dGxlLWVuZGlhbiBvcmRlciIKPiA+IEl0IHdvdWxkIGJl
IGdyZWF0IGlmIGEgcmlzY3YgZXhwZXJ0IGNvdWxkIGNvbmZpcm0gb3Igbm90IHRoaXMgaW5mb3Jt
YXRpb24uCj4KPiBTbywgeWVzLiBSZS1yZWFkIHRoYXQgY2FyZWZ1bGx5Ogo+Cj4gICAtIDgtYml0
IGJ5dGVzLiBJLmUuIGEgYnl0ZSBpcyA4IGJpdHMKPgo+ICAgLSB3b3JkcyBiZWluZyBpbiBsaXR0
bGUtZW5kaWFuIG9yZGVyCj4KPiBUaGF0IGluZGVlZCBzYXlzIG5vdGhpbmcgYWJvdXQgd29yZCBz
aXplIGluIGJ5dGVzIChub3QgaW4gYml0cyEpLgo+Cj4gSSBtaWdodCBiZSB3cm9uZywgYnV0IG9u
IGEgMzItYml0IGFyY2gsIHdvcmRzIGFyZSBhbHdheXMgNC1ieXRlcyB3aWRlcywKPiBpLmUuIDMy
IGJpdHMsIHdoaWxlIG9uIGEgNjQtYml0IGFyY2hpdGVjdXRyZSwgd29yZHMgYXJlIDgtYnl0ZSB3
aWRlLAo+IGkuZS4gNjQgYml0cy4KPgo+IFNvLCBJIHdvdWxkIHdhZ2VyIHRoYXQgcmlzY3YzMiBo
YXMgNC1ieXRlIHdpZGUsIGllIDMyLWJpdCB3aWRlLCB3b3Jkcy4KVGhhbmtzIGZvciBzcG90dGlu
ZyBteSBtaXN0YWtlLCBJJ2xsIHJlc2VuZCBhIHYyLgo+Cj4gUmVnYXJkcywKPiBZYW5uIEUuIE1P
UklOLgo+Cj4gPiA+IElmIGh0aXMgaXMgaW5kZWVkIHRoZSBjYXNlLCB0aGVuIHBsZWFzZSBleHBs
YWluIHRoYXQgaW4gdGhlIHBhdGNoIGNvbW1pdAo+ID4gPiBsb2cuLi4KPiA+ID4KPiA+ID4gUmVn
YXJkcywKPiA+ID4gWWFubiBFLiBNT1JJTi4KPiA+ID4KPiA+ID4gPiArICAgICAgICAgICAoZWxz
ZSAoZXJyb3IgInVua25vd24gQ1BVIHdvcmQgc2l6ZSIgY3B1KSkpKSkKPiA+ID4gPiArCj4gPiA+
ID4gKyAoZGVmaW5lICh0cmlwbGV0LWNwdSB0KQo+ID4gPiA+ICstLQo+ID4gPiA+ICsyLjMwLjIK
PiA+ID4gPiArCj4gPiA+ID4gLS0KPiA+ID4gPiAyLjMwLjIKPiA+ID4gPgo+ID4gPiA+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiA+ID4gYnVpbGRy
b290IG1haWxpbmcgbGlzdAo+ID4gPiA+IGJ1aWxkcm9vdEBidXN5Ym94Lm5ldAo+ID4gPiA+IGh0
dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+ID4gPgo+
ID4gPiAtLQo+ID4gPiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0t
LS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgo+ID4gPiB8ICBZYW5uIEUuIE1P
UklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29u
c3BpcmFjeTogfAo+ID4gPiB8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8
IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAo+ID4gPiB8ICszMyA1NjEg
MDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBU
aGVyZSBpcyBubyAgfAo+ID4gPiB8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypc
XyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAo+ID4gPiAnLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0t
LS0tLS0tLS0tLS0tLS0tJwo+ID4gQmVzdCBSZWdhcmRzLAo+ID4KPiA+IEZhYnJpY2UKPgo+IC0t
Cj4gLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KPiB8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGlt
ZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAo+IHwg
KzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8
ICBfX18gICAgICAgICAgICAgICB8Cj4gfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4t
LS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKPiB8IGh0dHA6
Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYg
ICBjb25zcGlyYWN5LiAgfAo+ICctLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0t
LV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCkJlc3QgUmVnYXJkcywK
CkZhYnJpY2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3Rz
LmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
