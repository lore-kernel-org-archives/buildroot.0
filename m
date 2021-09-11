Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F3AC433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 16:07:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F5F260F56
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 16:07:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F5F260F56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EFAF60832;
	Sat, 11 Sep 2021 16:07:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A46ku1rBUvKF; Sat, 11 Sep 2021 16:07:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FC426080F;
	Sat, 11 Sep 2021 16:07:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3F9341BF304
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 16:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BC8B406F5
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 16:07:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y2pg6Gau_fnq for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 16:07:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2BD1F406E8
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 16:07:16 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id c8so10893732lfi.3
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 09:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+DnRuOQVQfQjwHoilCEH5vKNa2iiAEbvrbJmCx4e1nU=;
 b=BNRYmS+qEAFC/iKgriC9z++RKMtvV/GIrffCxBvXDPb39V1fY9drgegD5lPaqNPrnm
 64fYBKKlCzR46BNPyx443RtiHw1C+Ms4ma6zRjnGLAK6tOue3tUFV+th3ZNgnzfOlA8L
 40ZIWbQacM6OXtvM6r8wdWSFt3iNJzXFYnheWO2RdXlOwNhNLITl3Iov/fDzQdzU/ROd
 V+IMirpAvMYG6KpBigwvXbiIdJ0IUGRw3AwJ52mzjJNCIIJh/hKdQhUVMt0KxEu95XzA
 K47SoqbVELhiNqH6eZJq5i/ou53nt69F9pJnpL6lv0oTBGvR5BniEvFXLjikyxvX5u3+
 +6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+DnRuOQVQfQjwHoilCEH5vKNa2iiAEbvrbJmCx4e1nU=;
 b=hJq7E4kkRz+1Py/Shx8yEF96I2nRcrqqWe8qLyc6kY8AmeWeqlwBSXqXWaSUCRsZKx
 dKoCzFWDkM2y7tFn2Rt1NGUkgASLfNGCdUZnb//e+l+xwsurptQvyoUPtp7pZjwtUAdh
 fKfK96seUvvw7Mp2QXbq4XMtLJdhGaxKAc2dDoaZ2k7qZhK/npHj0SKmbFGnzQ4aAH2i
 8Z+3Max5TmgbEvVM0D48MOw8IHBx+dmvl7BAQlzJinTJOx8uCm8aH/scBoLfG6poJaST
 LQDYCt2JZdbQtjn/VBgf4MXnBddhjj0IyvhYGY6FAprfj1lyCFbvkVEM1Sy/LKcSpiXk
 kz2Q==
X-Gm-Message-State: AOAM530Gx4dyLMSgllSWyG8t5AFfoGucRrYSNG5IovNf4qHxQ0UgRLyX
 NQs9Mt6QOD5Cb5Q0GOdZSof8ALpNYpeiSZyGlZQ=
X-Google-Smtp-Source: ABdhPJxl8dZoJ1ocNWH6OXzkhBBq1xYmB72Kd6YAt5APW+n/Lni4ZUayfuCiB+cnL7HKmrX7MFDvCNKRA/HG+psYbPU=
X-Received: by 2002:a05:6512:31c9:: with SMTP id
 j9mr2490769lfe.322.1631376434138; 
 Sat, 11 Sep 2021 09:07:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210908164536.474998-1-fontaine.fabrice@gmail.com>
 <20210911125500.GN1053080@scaer>
In-Reply-To: <20210911125500.GN1053080@scaer>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 11 Sep 2021 18:07:02 +0200
Message-ID: <CAPi7W82x1VFV2Lb+=m=7fhzV7MDc0743TjkDN9n0nXNYefPUsg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/uboot-tools: fix MKIMAGE_ARCH handling
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Matt Weber <matthew.weber@collins.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

WWFubiwKCkxlIHNhbS4gMTEgc2VwdC4gMjAyMSDDoCAxNDo1NSwgWWFubiBFLiBNT1JJTiA8eWFu
bi5tb3Jpbi4xOTk4QGZyZWUuZnI+IGEgw6ljcml0IDoKPgo+IEZhYnJpY2UsIEFsbCwKPgo+IE9u
IDIwMjEtMDktMDggMTg6NDUgKzAyMDAsIEZhYnJpY2UgRm9udGFpbmUgc3Bha2UgdGh1c2x5Ogo+
ID4gRml4IE1LSU1BR0VfQVJDSCBoYW5kbGluZyB0byBhdm9pZCB0aGUgZm9sbG93aW5nIGJ1aWxk
IGZhaWx1cmU6Cj4gPgo+ID4gL2hvbWUvYnVpbGRyb290L2F1dG9idWlsZC9pbnN0YW5jZS0wL291
dHB1dC0xL2J1aWxkL2hvc3QtdWJvb3QtdG9vbHMtMjAyMS4wNy90b29scy9ta2ltYWdlIC1DIG5v
bmUgLUEgb3BlbnJpc2MgLVQgc2NyaXB0IC1kIC9ob21lL2J1aWxkcm9vdC9hdXRvYnVpbGQvaW5z
dGFuY2UtMC9vdXRwdXQtMS9ib290X3NjcmlwdC50eHQgL2hvbWUvYnVpbGRyb290L2F1dG9idWls
ZC9pbnN0YW5jZS0wL291dHB1dC0xL2J1aWxkL2hvc3QtdWJvb3QtdG9vbHMtMjAyMS4wNy90b29s
cy9ib290LnNjcgo+ID4KPiA+IEludmFsaWQgYXJjaGl0ZWN0dXJlLCBzdXBwb3J0ZWQgYXJlOgo+
IFstLVNOSVAtLV0KPiA+Cj4gPiBTdHJhbmdlbHkgZW5vdWdoLCB3ZSBvbmx5IGhhdmUgYXV0b2J1
aWxkZXIgZmFpbHVyZXMgc2luY2UgSnVseSAyMDIxIGV2ZW4KPiA+IGlmIG9yMWsgbXVzdCBiZSB1
c2VkIHNpbmNlIHRoZSBhZGRpdGlvbiBvZiBvcGVucmlzY3Ygc3VwcG9ydCBpbiAyMDEyOgo+ID4g
aHR0cHM6Ly9naXRodWIuY29tL3UtYm9vdC91LWJvb3QvY29tbWl0LzNkZGNhY2NkYTM4MjRlMWM3
ZjcyNjZkNTQzZTRjMGViM2VhOTg1MWMKPgo+IC4uLiBldmVuIGFzIG9yMWsgaGFzIGJlZW4gdXNl
ZCBzaW5jZSAuLi4KPgo+ID4gRml4ZXM6Cj4gPiAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9v
dC5vcmcvcmVzdWx0cy9jM2YwZjJhM2ZiODdkNzRiZmRhY2NmOWI5NGM2NmYwYjViYWU3NTIwCj4g
Pgo+ID4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBn
bWFpbC5jb20+Cj4gPiAtLS0KPiA+IENoYW5nZXMgdjEgLT4gdjI6Cj4gPiAgLSBGaXggY29tbWl0
IG1lc3NhZ2UgdG8gc3BlY2lmeSB0aGF0IGF1dG9idWlsZGVyIGZhaWx1cmVzIGFyZSByYWlzZWQK
PiA+ICAgIHNpbmNlIEp1bHkgMjAyMQo+ID4KPiA+ICBwYWNrYWdlL3Vib290LXRvb2xzL3Vib290
LXRvb2xzLm1rIHwgMTQgKysrKysrKy0tLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3Vi
b290LXRvb2xzL3Vib290LXRvb2xzLm1rIGIvcGFja2FnZS91Ym9vdC10b29scy91Ym9vdC10b29s
cy5tawo+ID4gaW5kZXggYTg3OTU2ZDAyOC4uODFmNjA5NjNlYyAxMDA2NDQKPiA+IC0tLSBhL3Bh
Y2thZ2UvdWJvb3QtdG9vbHMvdWJvb3QtdG9vbHMubWsKPiA+ICsrKyBiL3BhY2thZ2UvdWJvb3Qt
dG9vbHMvdWJvb3QtdG9vbHMubWsKPiA+IEBAIC0yMDYsMTUgKzIwNiwxNSBAQCAkKGV2YWwgJCho
b3N0LWdlbmVyaWMtcGFja2FnZSkpCj4gPgo+ID4gIE1LSU1BR0UgPSAkKEhPU1RfRElSKS9iaW4v
bWtpbWFnZQo+ID4KPiA+IC0jIG1raW1hZ2Ugc3VwcG9ydHMgYXJtIGJsYWNrZmluIG02OGsgbWlj
cm9ibGF6ZSBtaXBzIG1pcHM2NCBuaW9zMiBwb3dlcnBjIHBwYyBzaCBzcGFyYyBzcGFyYzY0IHg4
Ngo+ID4gKyMgbWtpbWFnZSBzdXBwb3J0cyBhbHBoYSBhcmMgYXJtIGFybTY0IGJsYWNrZmluIGlh
NjQgaW52YWxpZCBtNjhrIG1pY3JvYmxhemUgbWlwcyBtaXBzNjQgbmRzMzIgbmlvczIgb3IxayBw
b3dlcnBjIHJpc2N2IHMzOTAgc2FuZGJveCBzaCBzcGFyYyBzcGFyYzY0IHg4NiB4ODZfNjQgeHRl
bnNhCj4gPiAgIyBLRVJORUxfQVJDSCBjYW4gYmUgYXJtNjQgYXJjIGFybSBibGFja2ZpbiBtNjhr
IG1pY3JvYmxhemUgbWlwcyBuaW9zMiBwb3dlcnBjIHNoIHNwYXJjIGkzODYgeDg2XzY0IHh0ZW5z
YQo+ID4gLSMgRm9yIGFybTY0LCBhcmMsIHh0ZW5zYSB3ZSdsbCBqdXN0IGtlZXAgS0VSTkVMX0FS
Q0gKPiA+IC0jIEZvciBtaXBzNjQsIHdlJ2xsIGp1c3Qga2VlcCBtaXBzCj4gPiAtIyBGb3IgaTM4
NiBhbmQgeDg2XzY0LCB3ZSBuZWVkIHRvIGNvbnZlcnQKPiA+IC1pZmVxICgkKEtFUk5FTF9BUkNI
KSx4ODZfNjQpCj4gPiAtTUtJTUFHRV9BUkNIID0geDg2Cj4gPiAtZWxzZSBpZmVxICgkKEtFUk5F
TF9BUkNIKSxpMzg2KQo+ID4gKyMgRm9yIGkzODYsIHdlIG5lZWQgdG8gY29udmVydAo+ID4gKyMg
Rm9yIG9wZW5yaXNjLCB3ZSBuZWVkIHRvIGNvbnZlcnQKPiA+ICsjIEZvciBvdGhlcnMsIHdlJ2xs
IGp1c3Qga2VlcCBLRVJORUxfQVJDSAo+ID4gK2lmZXEgKCQoS0VSTkVMX0FSQ0gpLGkzODYpCj4g
PiAgTUtJTUFHRV9BUkNIID0geDg2Cj4KPiBCdXQgdGhlbiwgeDg2XzY0IHNob3VsZCBzdGlsbCBi
ZSBjaGFuZ2VkIHRvIHg4Niwgbm8/Ck5vcGUsIHg4Nl82NCBpcyByZWNvZ25pemVkIGFzIGEgdmFs
aWQgYXJjaGl0ZWN0dXJlLCBoZXJlIGlzIGFuIGV4dHJhY3QKb2YgdGhlIGNvbW1pdCBtZXNzYWdl
OgoKICAgICAgICB4ODYgICAgICAgICAgICAgIEludGVsIHg4NgogICAgICAgIHg4Nl82NCAgICAg
ICAgICAgQU1EIHg4Nl82NAogICAgICAgIHh0ZW5zYSAgICAgICAgICAgWHRlbnNhCj4KPiBSZWdh
cmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4KPiA+ICtlbHNlIGlmZXEgKCQoS0VSTkVMX0FSQ0gpLG9w
ZW5yaXNjKQo+ID4gK01LSU1BR0VfQVJDSCA9IG9yMWsKPiA+ICBlbHNlCj4gPiAgTUtJTUFHRV9B
UkNIID0gJChLRVJORUxfQVJDSCkKPiA+ICBlbmRpZgo+ID4gLS0KPiA+IDIuMzMuMAo+ID4KPiA+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBidWls
ZHJvb3QgbWFpbGluZyBsaXN0Cj4gPiBidWlsZHJvb3RAbGlzdHMuYnVpbGRyb290Lm9yZwo+ID4g
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4K
PiAtLQo+IC4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0t
LS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCj4gfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFs
LVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwK
PiB8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAg
ICAgfCAgX19fICAgICAgICAgICAgICAgfAo+IHwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0t
LS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8Cj4gfCBo
dHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwg
ICB2ICAgY29uc3BpcmFjeS4gIHwKPiAnLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0t
LS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpCZXN0IFJlZ2Fy
ZHMsCgpGYWJyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGxpc3RzLmJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
