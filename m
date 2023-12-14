Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0D5C4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 11:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9A8C6F5AD;
	Thu, 14 Dec 2023 11:27:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9A8C6F5AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B5oWRLTGOD2x; Thu, 14 Dec 2023 11:27:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C94956F59A;
	Thu, 14 Dec 2023 11:27:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C94956F59A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 228B21BF4E3
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 11:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07BE34013C
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 11:27:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07BE34013C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bxYpAE9AWeuJ for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 11:27:11 +0000 (UTC)
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9451640129
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 11:27:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9451640129
Received: by mail-qt1-x829.google.com with SMTP id
 d75a77b69052e-4259cd18f85so48457661cf.3
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 03:27:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702553230; x=1703158030;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wY1WbT4FESEF+rKN8NSMXCV+/V+lFbVLwjaTYNi+EqM=;
 b=N/3QLfeqC40QRdX9cFUME5gxFXEDOi214C9vqbbwQB3BlwX01KdxVrZ2IySb8YcY2D
 LA0mFu+rPR/kdsn5r++xydsnRkRKXcSXfRxCvYBu+C2gy0o0Cd9QnYbaPnJaDdyAJu4W
 Kwpa/2v5LJYGbAgO6zoJ2U/FYMFcTr+TTFGwKaFJsjutfXTLqBtcd4OR+F3SCwnbG6Pf
 wdSA7a73EyiCXcV71/WcirtmwkzMBlNY9Zwkg+f613UoZcF4cLIpAsDxlxXd7DGPGdk0
 9U/9s5OcxGOKjvj/dOgWiEnnaLrQWW3fqN0Ui9393fFxd4o629v5NJzEZCzfHtIo6d7x
 /Spw==
X-Gm-Message-State: AOJu0YwNX8JS8sdvm7oNGXmmqEipkuYdUWZe8rhAG+jyUCnpfLnrId+R
 o18Y37kGYEbNPcZwYEmCOiU/3v2mXC2pPHozYs0D+XuUkx6HoA==
X-Google-Smtp-Source: AGHT+IGdZ8me0S0A+m4YdQpsBShx6LmszvowOnmL+RngYRDk691PRuUWcaK6WXuDJGbBV4YwFFJPNPMNGb8YbAGXepg=
X-Received: by 2002:a05:622a:205:b0:423:98b9:3842 with SMTP id
 b5-20020a05622a020500b0042398b93842mr14329695qtx.23.1702553230366; Thu, 14
 Dec 2023 03:27:10 -0800 (PST)
MIME-Version: 1.0
References: <20231214094846.115655-1-james.hilliard1@gmail.com>
 <20231214094846.115655-3-james.hilliard1@gmail.com>
 <a93feebc-1591-4edc-8dfe-aa36d5c630cd@othermo.de>
In-Reply-To: <a93feebc-1591-4edc-8dfe-aa36d5c630cd@othermo.de>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 14 Dec 2023 04:26:57 -0700
Message-ID: <CADvTj4ofjMrKaiwoCc2wWp7E0JnvsNR_PA3i8T89x3Q-kf=XEA@mail.gmail.com>
To: Marcus Hoffmann <marcus.hoffmann@othermo.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702553230; x=1703158030; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wY1WbT4FESEF+rKN8NSMXCV+/V+lFbVLwjaTYNi+EqM=;
 b=irJiiNATBwJoq6ajk3mbvh/mC5C4KluO50XltguSZMZVznD3hvSsNdq0i7YdUmnCMG
 bEBEKyMUC6HxiQ13KZUwRVA+DbSS5ffB+vQV78EpGgxrimza1cEndBc8MHekQ/3X6Zss
 Mjy6K4qM5rXB/6SvUckr8v8F5C/wcAz04u+dIiBsQfCYvdjdYV/ItUylMsilZIIrr4yp
 xjKjzFPSzrRQvIaaJ5YTjC9CcCAmvPfAdgc/8oJdDB6kKANmPETwhye324Tc3B4EBLKC
 MnwMqdbdkqXEPf5Lz2aX79KSdvmFWrkdFVoqDX/zLLtbXVyZnRyRL1j/+nXNb7ZODRm6
 0kfA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=irJiiNAT
Subject: Re: [Buildroot] [PATCH 3/3] package/python-fastapi: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCBEZWMgMTQsIDIwMjMgYXQgMzo1NeKAr0FNIE1hcmN1cyBIb2ZmbWFubgo8bWFyY3Vz
LmhvZmZtYW5uQG90aGVybW8uZGU+IHdyb3RlOgo+Cj4gSGkgSmFtZXMsCj4KPiBmYXN0YXBpIGNs
YWltcyB0byBkZXBlbmQgb24gc3RhcmxldHRlIDwwLjI4LjAgYW5kIGFueWlvIDwgNC4wLjAsIHdo
aWNoCj4gYXJlIG5vdCB0aGUgdmVyc2lvbnMgdGhhdCB5b3UgYWRkIGluIHRoaXMgc2VyaWVzLgo+
Cj4gQXMgdGhlc2UgYXJlIHNwZWNpZmljYWxseSBhZGRlZCBmb3IgZmFzdGFwaSwgSSB0aGluayBp
dCdzIGJldHRlciB0bwo+IGZvbGxvdyB0aGUgZmFzdGFwaSBzdXBwb3J0ZWQgdmVyc2lvbnMgYW5k
IGRvd25ncmFkZSB0byBzdGFybGV0dGUgMC4yNy4wCj4gYW5kIGFueWlvIDMuNy4xCgpGaXhlZCBp
biB2MjoKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9saXN0
Lz9zZXJpZXM9Mzg2NjU1Cgo+Cj4gQmVzdCwKPiBNYXJjdXMKPgo+IE9uIDE0LjEyLjIzIDEwOjQ4
LCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiA+IFNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJk
IDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgIHBhY2thZ2UvQ29uZmln
LmluICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiA+ICAgcGFja2FnZS9weXRob24t
ZmFzdGFwaS9Db25maWcuaW4gICAgICAgICAgIHwgMTIgKysrKysrKysrKysrCj4gPiAgIHBhY2th
Z2UvcHl0aG9uLWZhc3RhcGkvcHl0aG9uLWZhc3RhcGkuaGFzaCB8ICA1ICsrKysrCj4gPiAgIHBh
Y2thZ2UvcHl0aG9uLWZhc3RhcGkvcHl0aG9uLWZhc3RhcGkubWsgICB8IDE1ICsrKysrKysrKysr
KysrKwo+ID4gICA0IGZpbGVzIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKykKPiA+ICAgY3JlYXRl
IG1vZGUgMTAwNjQ0IHBhY2thZ2UvcHl0aG9uLWZhc3RhcGkvQ29uZmlnLmluCj4gPiAgIGNyZWF0
ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1mYXN0YXBpL3B5dGhvbi1mYXN0YXBpLmhhc2gK
PiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcHl0aG9uLWZhc3RhcGkvcHl0aG9uLWZh
c3RhcGkubWsKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdl
L0NvbmZpZy5pbgo+ID4gaW5kZXggM2E0YmYyMWEyYS4uOGE5N2ViMjg5NyAxMDA2NDQKPiA+IC0t
LSBhL3BhY2thZ2UvQ29uZmlnLmluCj4gPiArKysgYi9wYWNrYWdlL0NvbmZpZy5pbgo+ID4gQEAg
LTEwNzMsNiArMTA3Myw3IEBAIG1lbnUgIkV4dGVybmFsIHB5dGhvbiBtb2R1bGVzIgo+ID4gICAg
ICAgc291cmNlICJwYWNrYWdlL3B5dGhvbi1ldmRldi9Db25maWcuaW4iCj4gPiAgICAgICBzb3Vy
Y2UgInBhY2thZ2UvcHl0aG9uLWV4ZWN1dGluZy9Db25maWcuaW4iCj4gPiAgICAgICBzb3VyY2Ug
InBhY2thZ2UvcHl0aG9uLWZhbGNvbi9Db25maWcuaW4iCj4gPiArICAgICBzb3VyY2UgInBhY2th
Z2UvcHl0aG9uLWZhc3RhcGkvQ29uZmlnLmluIgo+ID4gICAgICAgc291cmNlICJwYWNrYWdlL3B5
dGhvbi1maWxlbG9jay9Db25maWcuaW4iCj4gPiAgICAgICBzb3VyY2UgInBhY2thZ2UvcHl0aG9u
LWZpcmUvQ29uZmlnLmluIgo+ID4gICAgICAgc291cmNlICJwYWNrYWdlL3B5dGhvbi1mbGFzay9D
b25maWcuaW4iCj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tZmFzdGFwaS9Db25maWcu
aW4gYi9wYWNrYWdlL3B5dGhvbi1mYXN0YXBpL0NvbmZpZy5pbgo+ID4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAuLjdkMzc2ZDNkZDcKPiA+IC0tLSAvZGV2L251bGwK
PiA+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLWZhc3RhcGkvQ29uZmlnLmluCj4gPiBAQCAtMCwwICsx
LDEyIEBACj4gPiArY29uZmlnIEJSMl9QQUNLQUdFX1BZVEhPTl9GQVNUQVBJCj4gPiArICAgICBi
b29sICJweXRob24tZmFzdGFwaSIKPiA+ICsgICAgIGRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSE9T
VF9SVVNUQ19UQVJHRVRfQVJDSF9TVVBQT1JUUyAjIHB5dGhvbi1weWRhbnRpYyAtPiBweXRob24t
cHlkYW50aWMtY29yZQo+ID4gKyAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX1BZVEhPTl9BTllJTyAj
IHJ1bnRpbWUKPiA+ICsgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT05fUFlEQU5USUMgIyBy
dW50aW1lCj4gPiArICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OX1NUQVJMRVRURSAjIHJ1
bnRpbWUKPiA+ICsgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT05fVFlQSU5HX0VYVEVOU0lP
TlMgIyBydW50aW1lCj4gPiArICAgICBoZWxwCj4gPiArICAgICAgIEZhc3RBUEkgZnJhbWV3b3Jr
LCBoaWdoIHBlcmZvcm1hbmNlLCBlYXN5IHRvIGxlYXJuLCBmYXN0IHRvCj4gPiArICAgICAgIGNv
ZGUsIHJlYWR5IGZvciBwcm9kdWN0aW9uLgo+ID4gKwo+ID4gKyAgICAgICBodHRwczovL2dpdGh1
Yi5jb20vdGlhbmdvbG8vZmFzdGFwaQo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWZh
c3RhcGkvcHl0aG9uLWZhc3RhcGkuaGFzaCBiL3BhY2thZ2UvcHl0aG9uLWZhc3RhcGkvcHl0aG9u
LWZhc3RhcGkuaGFzaAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAw
MDAuLjNkYzE1NzhjYjcKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL3BhY2thZ2UvcHl0aG9u
LWZhc3RhcGkvcHl0aG9uLWZhc3RhcGkuaGFzaAo+ID4gQEAgLTAsMCArMSw1IEBACj4gPiArIyBt
ZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlwaS9mYXN0YXBpL2pzb24KPiA+ICtt
ZDUgIDA2YmZhN2M2MTBmYzllODFkMDViMDMxOWViNzBjYWU3ICBmYXN0YXBpLTAuMTA1LjAudGFy
Lmd6Cj4gPiArc2hhMjU2ICA0ZDEyODM4ODE5YWE1MmFmMjQ0NTgwNjc1ODI1ZTc1MGFkNjdjOWRm
NDYxNGY1NTdhNzY5NjA2YWY5MDJjZjIyICBmYXN0YXBpLTAuMTA1LjAudGFyLmd6Cj4gPiArIyBM
b2NhbGx5IGNvbXB1dGVkIHNoYTI1NiBjaGVja3N1bXMKPiA+ICtzaGEyNTYgIDRlYzg5ZmZjODE0
ODViOTdmZWM1ODRiMmQ0YTk2MTAzMmVlZmZlODM0NDUzODk0ZmQ5YzEyNzQ5MDZjYzc0NGUgIExJ
Q0VOU0UKPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1mYXN0YXBpL3B5dGhvbi1mYXN0
YXBpLm1rIGIvcGFja2FnZS9weXRob24tZmFzdGFwaS9weXRob24tZmFzdGFwaS5tawo+ID4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAuLmRiODZiZmNlMzAKPiA+IC0t
LSAvZGV2L251bGwKPiA+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLWZhc3RhcGkvcHl0aG9uLWZhc3Rh
cGkubWsKPiA+IEBAIC0wLDAgKzEsMTUgQEAKPiA+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+
ID4gKyMKPiA+ICsjIHB5dGhvbi1mYXN0YXBpCj4gPiArIwo+ID4gKyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjCj4gPiArCj4gPiArUFlUSE9OX0ZBU1RBUElfVkVSU0lPTiA9IDAuMTA1LjAKPiA+ICtQ
WVRIT05fRkFTVEFQSV9TT1VSQ0UgPSBmYXN0YXBpLSQoUFlUSE9OX0ZBU1RBUElfVkVSU0lPTiku
dGFyLmd6Cj4gPiArUFlUSE9OX0ZBU1RBUElfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9z
dGVkLm9yZy9wYWNrYWdlcy83Ny9iYi81OTQxZTZlMmNlMzAyMGY2NGI1MzlhNDlkMzlmNDliZTA1
ZGUxN2QwYzQ3ZmVhOTUwMTI1ODlmODEyYTUKPiA+ICtQWVRIT05fRkFTVEFQSV9TRVRVUF9UWVBF
ID0gcGVwNTE3Cj4gPiArUFlUSE9OX0ZBU1RBUElfTElDRU5TRSA9IE1JVAo+ID4gK1BZVEhPTl9G
QVNUQVBJX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCj4gPiArUFlUSE9OX0ZBU1RBUElfREVQRU5E
RU5DSUVTID0gaG9zdC1weXRob24taGF0Y2hsaW5nCj4gPiArCj4gPiArJChldmFsICQocHl0aG9u
LXBhY2thZ2UpKQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4KPiBvdGhlcm1v
IEdtYkggfCBTaXR6IGRlciBHZXNlbGxzY2hhZnQ6IEFsemVuYXUgfCBBbXRzZ2VyaWNodCBBc2No
YWZmZW5idXJnOiBIUkIgMTQ3ODMgfCBVU3QtSWROci46IERFMzE5OTc3OTc4IHwgR2VzY2jDpGZ0
c2bDvGhydW5nOiBEci4gRGVubmlzIE1ldHouCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
