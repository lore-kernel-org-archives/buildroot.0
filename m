Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD44CDD0EC
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 20:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA3436087A;
	Tue, 22 Oct 2024 20:37:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oMZDl0I3lppn; Tue, 22 Oct 2024 20:37:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F83260875
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F83260875;
	Tue, 22 Oct 2024 20:37:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C79F59F4
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A0FB40675
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:36:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9s_8HViSmo4o for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 20:36:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.219.175;
 helo=mail-yb1-f175.google.com; envelope-from=bryce.d.johnson@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2BCA44061D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BCA44061D
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2BCA44061D
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:36:58 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-e29047bec8fso209237276.0
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 13:36:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729629417; x=1730234217;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oth7Xg4+2DmiWXM1UPlWYlHda5QlnGiXeuRH0hTmRK0=;
 b=JU9YpZMikP8ePWVJh0f0/U3B68nyTWvlq+PZ/jR1xpFnceiLRdCFiP8Pj6QRERqnZO
 D8eFSzoAUkQTZ6kVXceBaJ/r6tleLmXtgYD2C1sE/D1/uEqdJygPPxgEohqxrxtHGvwr
 g2o3C1TF2Y19EqrhV7CxkqJVoOectEg1+8wo8WxWADive0Re/V5t0N0V8kVW2cc0nU0W
 p9kPnnVk/sH5qlTe1BoLDzDZ+yNxfXercjUdPfbzdwS5hcgum56PEgIqOMUeSrDFijg0
 Plb0oJmwL0G5InVpseNKd+3wbKC54GvNdsNdB4iHxVPnFYBTj7Yr0uGoFNamO/5+zQBP
 WP3Q==
X-Gm-Message-State: AOJu0YyuyGbW2tM5yf+kFRIsW60dzL+aoj/5H1h8ybY+epH7MSgNkk6J
 oc1BoWP5TlVPc5Z3Gf2mo43HLV+Su8D20JUOLCNkkwnhu29fza/UWouafA==
X-Google-Smtp-Source: AGHT+IE9BQA5NvBNKUoUVNiSkO45UtEGdlvlQiBhQSacN2cG5ondOOd7G9nq7ABH85pevZi0uPETxw==
X-Received: by 2002:a05:6902:843:b0:e2b:d72f:c184 with SMTP id
 3f1490d57ef6-e2e39c366bcmr502798276.4.1729629416722; 
 Tue, 22 Oct 2024 13:36:56 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com.
 [209.85.128.178]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e2bdc9b3dc4sm1192600276.35.2024.10.22.13.36.55
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Oct 2024 13:36:56 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-6e330b7752cso1739437b3.1
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 13:36:55 -0700 (PDT)
X-Received: by 2002:a05:690c:698e:b0:6dd:dd40:54e2 with SMTP id
 00721157ae682-6e7d47dd9d1mr38853667b3.12.1729629415691; Tue, 22 Oct 2024
 13:36:55 -0700 (PDT)
MIME-Version: 1.0
References: <20241022180542.224972-1-bryce@redpinelabs.com>
 <20241022212800.570cbcfc@windsurf>
In-Reply-To: <20241022212800.570cbcfc@windsurf>
From: Bryce Johnson <bryce@redpinelabs.com>
Date: Tue, 22 Oct 2024 14:36:44 -0600
X-Gmail-Original-Message-ID: <CADXxVS+0bHz+Hqe4437vb5K3=Qmt3DLfNSFMEmsWJTFXGkiFTg@mail.gmail.com>
Message-ID: <CADXxVS+0bHz+Hqe4437vb5K3=Qmt3DLfNSFMEmsWJTFXGkiFTg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Suniel Mahesh <sunil@amarulasolutions.com>
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=redpinelabs.com
Subject: Re: [Buildroot] [PATCH] package/arm-gnu-toolchain: Add $(HOSTARCH)
 so it can be built with aarch64
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLApZZXMgSSdsbCBkbyB0aGF0LiBGaW5hbGx5IGdvdCB0aGUgZ2l0IHNlbmQgZW1h
aWwgd2l0aCBteSBnbWFpbCBhY2NvdW50CndvcmtpbmcgYW5kIHRob3VnaHQgdGhlIFNpZ25lZC1v
ZmYtYnkgZ290IGFkZGVkLiAgSSdsbCBjbGVhbiB1cCB0aGF0CmFuZCB0aGUgbGluZSBsZW5ndGgg
YXMgd2VsbC4KCkJyeWNlCgpPbiBUdWUsIE9jdCAyMiwgMjAyNCBhdCAxOjI44oCvUE0gVGhvbWFz
IFBldGF6em9uaQo8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIZWxs
byBCcnljZSEKPgo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaC4gU29tZSBjb21tZW50cy9xdWVzdGlv
bnMgYmVsb3cuCj4KPiBPbiBUdWUsIDIyIE9jdCAyMDI0IDEyOjA1OjQwIC0wNjAwCj4gYnJ5Y2VA
cmFzcGJlcnJ5d29vZC5jb20gd3JvdGU6Cj4KPiA+IEZyb206IEJyeWNlIEpvaG5zb24gPGJyeWNl
QHJlZHBpbmVsYWJzLmNvbT4KPiA+Cj4gPiBXYXMgdGVzdGluZyBidWlsZGluZyB3aXRoIGFybTY0
IGJ1aWxkIHNlcnZlciBhbmQgZmFpbGVkIGJlY2F1c2UgaXQgd2FzIGRvd25sb2FkaW5nIHRoZSB4
ODZfNjQgdmVyc2lvbi4gVXNlICQoSE9TVEFSQ0gpIGluc3RlYWQgc28gaXQgY2FuIGFsc28gZG93
bmxvYWRlZAo+Cj4gTWlub3Igbml0OiBjb21taXQgbWVzc2FnZXMgc2hvdWxkIGhhdmUgbGluZSB3
cmFwcGVkIGF0IH44MCBjb2x1bW5zLgo+Cj4gPgo+ID4gVGVzdGVkIHdpdGggYnVpbGRpbmcgY29u
Zmlncy90aV9hbTYyeF9za19kZWZjb25maWcgb24gYXJtNjQuIFRoYXQgaXQgdXNlcyB0byBidWls
ZCB0aGUgMzJiaXQgUjUgTUNVLgo+Cj4gTW9yZSBpbXBvcnRhbnQgbml0OiB3ZSBuZWVkIHlvdSB0
byBhZGQgeW91ciBTaWduZWQtb2ZmLWJ5OiBsaW5lIGF0IHRoZQo+IGVuZCBvZiB0aGUgY29tbWl0
IGxvZyB0byBhbGxvdyB1cyB0byBhcHBseSB5b3VyIHBhdGNoLgo+Cj4gPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9hcm0tZ251LXRvb2xjaGFpbi9hcm0tZ251LXRvb2xjaGFpbi5oYXNoIGIvcGFja2Fn
ZS9hcm0tZ251LXRvb2xjaGFpbi9hcm0tZ251LXRvb2xjaGFpbi5oYXNoCj4gPiBpbmRleCAwODAw
ZmEyMTY4Li4xMTBlYzQwYzA5IDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS9hcm0tZ251LXRvb2xj
aGFpbi9hcm0tZ251LXRvb2xjaGFpbi5oYXNoCj4gPiArKysgYi9wYWNrYWdlL2FybS1nbnUtdG9v
bGNoYWluL2FybS1nbnUtdG9vbGNoYWluLmhhc2gKPiA+IEBAIC0xLDIgKzEsNCBAQAo+ID4gICMg
dGFrZW4gZnJvbSBodHRwczovL2RldmVsb3Blci5hcm0uY29tLy0vbWVkaWEvRmlsZXMvZG93bmxv
YWRzL2dudS8xMy4yLnJlbDEvYmlucmVsL2FybS1nbnUtdG9vbGNoYWluLTEzLjIucmVsMS14ODZf
NjQtYXJtLW5vbmUtZWFiaS50YXIueHouc2hhMjU2YXNjCj4gPiAgc2hhMjU2ICA2Y2QxYmJjMWQ5
YWU1NzMxMmJjZDE2OWFlMjgzMTUzYTk1NzJiZDZhOGU0ZWVhZTJmZWRmYmMzM2IxMTVmZGJiICBh
cm0tZ251LXRvb2xjaGFpbi0xMy4yLnJlbDEteDg2XzY0LWFybS1ub25lLWVhYmkudGFyLnh6Cj4g
PiArIyB0YWtlbiBmcm9tIGh0dHBzOi8vZGV2ZWxvcGVyLmFybS5jb20vLS9tZWRpYS9GaWxlcy9k
b3dubG9hZHMvZ251LzEzLjIucmVsMS9iaW5yZWwvYXJtLWdudS10b29sY2hhaW4tMTMuMi5yZWwx
LWFhcmNoNjQtYXJtLW5vbmUtZWFiaS50YXIueHouc2hhMjU2YXNjCj4gPiArc2hhMjU2ICA4ZmQ4
YjRhMGE4ZDQ0YWIyZTE5NWNjZmJlZWY0MjIyM2RmYjNlZGUyOWQ4MGYxNGRjZjIxODNjMzRiOGQx
OTlhICBhcm0tZ251LXRvb2xjaGFpbi0xMy4yLnJlbDEtYWFyY2g2NC1hcm0tbm9uZS1lYWJpLnRh
ci54ego+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvYXJtLWdudS10b29sY2hhaW4vYXJtLWdudS10
b29sY2hhaW4ubWsgYi9wYWNrYWdlL2FybS1nbnUtdG9vbGNoYWluL2FybS1nbnUtdG9vbGNoYWlu
Lm1rCj4gPiBpbmRleCAwM2JiNGRjNWRhLi5mY2U4MGYyZjNhIDEwMDY0NAo+ID4gLS0tIGEvcGFj
a2FnZS9hcm0tZ251LXRvb2xjaGFpbi9hcm0tZ251LXRvb2xjaGFpbi5tawo+ID4gKysrIGIvcGFj
a2FnZS9hcm0tZ251LXRvb2xjaGFpbi9hcm0tZ251LXRvb2xjaGFpbi5tawo+ID4gQEAgLTYsNyAr
Niw3IEBACj4gPgo+ID4gIEFSTV9HTlVfVE9PTENIQUlOX1ZFUlNJT04gPSAxMy4yLnJlbDEKPiA+
ICBBUk1fR05VX1RPT0xDSEFJTl9TSVRFID0gaHR0cHM6Ly9kZXZlbG9wZXIuYXJtLmNvbS8tL21l
ZGlhL0ZpbGVzL2Rvd25sb2Fkcy9nbnUvJChBUk1fR05VX1RPT0xDSEFJTl9WRVJTSU9OKS9iaW5y
ZWwKPiA+IC1BUk1fR05VX1RPT0xDSEFJTl9TT1VSQ0UgPSBhcm0tZ251LXRvb2xjaGFpbi0kKEFS
TV9HTlVfVE9PTENIQUlOX1ZFUlNJT04pLXg4Nl82NC1hcm0tbm9uZS1lYWJpLnRhci54ego+ID4g
K0FSTV9HTlVfVE9PTENIQUlOX1NPVVJDRSA9IGFybS1nbnUtdG9vbGNoYWluLSQoQVJNX0dOVV9U
T09MQ0hBSU5fVkVSU0lPTiktJChIT1NUQVJDSCktYXJtLW5vbmUtZWFiaS50YXIueHoKPgo+IFRo
ZSBjaGFuZ2UgbG9va3MgY29ycmVjdCBhcy1pcyBvZiBjb3Vyc2UsIGFzIGl0IGRvZXNuJ3QgbWFr
ZSBhbnl0aGluZwo+IHdvcnNlLiBIb3dldmVyLCBJIGJlbGlldmUgdG8gbWFrZSB0aGluZ3MgY2xl
YW5lciwgd2Ugc2hvdWxkIHBlcmhhcHMKPiBpbnRyb2R1Y2UgYSBwYWNrYWdlL2FybS1nbnUtdG9v
bGNoYWluL0NvbmZpZy5pbi5ob3N0IGZpbGUsIHdpdGggYSBibGluZAo+IG9wdGlvbiBCUjJfSE9T
VF9QQUNLQUdFX0FSTV9HTlVfVE9PTENIQUlOLCB0aGF0IGhhcyBhICJkZXBlbmRzIG9uIiB0aGUK
PiBob3N0IGFyY2hpdGVjdHVyZXMgdGhhdCBhcmUgc3VwcG9ydGVkLiBBbmQgdGhlIHBhY2thZ2Vz
IHRoYXQgdXNlCj4gaG9zdC1hcm0tZ251LXRvb2xjaGFpbiB3b3VsZCBoYXZlIHRvIGJlIGNhcmVm
dWwgdG8gcHJvcGFnYXRlIHRob3NlCj4gZGVwZW5kcyBvbiwgc28gdGhhdCB3ZSBkbyBub3QgYWxs
b3cgdXNpbmcgaG9zdC1hcm0tZ251LXRvb2xjaGFpbiBvbgo+IGNvbmZpZ3VyYXRpb25zIHRoYXQg
ZG8gbm90IGFsbG93IHVzaW5nIHRoZSBob3N0LWFybS1nbnUtdG9vbGNoYWluCj4gcGFja2FnZS4g
SG93ZXZlciB0aGlzIGNhbiBiZSBkb25lIGFzIGEgc2VwYXJhdGUgcGF0Y2gsIGFzIGFnYWluIHlv
dXIKPiBjaGFuZ2UgaXMgbm90IG1ha2luZyB0aGluZ3MgYW55IHdvcnNlIHRoYW4gdGhleSBhbHJl
YWR5IGFyZSA6KQo+Cj4gQ291bGQgeW91IHNlbmQgYSB2MiBvZiB5b3VyIHBhdGNoIHdpdGggdGhl
IHByb3Bvc2VkIGNoYW5nZXM/Cj4KPiBUaGFua3MgYWdhaW4hCj4KPiBUaG9tYXMKPiAtLQo+IFRo
b21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51
eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwo+IGh0dHBzOi8vYm9vdGxpbi5j
b20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
