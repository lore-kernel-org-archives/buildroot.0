Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 221EAC87FCB
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 20:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2D806E4FA;
	Wed,  6 Aug 2025 20:52:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2OSzmkDALMjf; Wed,  6 Aug 2025 20:52:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D93926E278
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D93926E278;
	Wed,  6 Aug 2025 20:52:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EA03D79
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 20:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7062040092
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 20:52:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T039vN5IP7_c for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 20:52:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4951B41B4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4951B41B4A
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4951B41B4A
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 20:52:28 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-55b9c2482e9so348815e87.1
 for <buildroot@buildroot.org>; Wed, 06 Aug 2025 13:52:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754513546; x=1755118346;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jLfSYXO6gUno+5ewnPAM3SdDcBJUyKsCbsD4qDqNMF8=;
 b=lPWNF5KaqSG1g9o+QeGVoXjMe3A/9FE1w9Tr5X8gKo8cHJhomnBdDRrLIBc1+CPpTf
 TLGmrkTPHlFAbdUR/Ty9YbNJcz5MjZNF2dEjUOZrokeXTPJaCib14NYDsHvwU0IkCr5m
 2m0anHjLkUVazvxVnR943gfqYa/6m8gBXhpMelBSurbW83n2ac7bVt2sp9DoW1n/wCrc
 lf5pnW0Qvvo9GzXcbEsVOKJJ1319wH5p+tyQgfJdT1s6BCNQ3v03ulvh4/i/1/NdasCm
 yxSvZIGfSa7qs6mfg6B4Yu81/6WRVyNcsJbdbep0SM2CdkTwjyifi5OpH8UyuUls+ORS
 ajPw==
X-Gm-Message-State: AOJu0YxqE2XAh0hIjYULJw1nczCzy2oVWrXdUWfCzIvChNMjgYEF0OFm
 NQnumNlShcYm7gujUpS033+WGcrIOizzjdWS4f7u9Wa+aP/ENFCvXAs1eXj81pZ8d/SXF0Rgvzl
 qoKSwhr8RSYMeYNsFDzT0t4mGI7U/RDDHLIf+KJ4ZAw==
X-Gm-Gg: ASbGnctE/rDSMuGNeOvsEADVWA0O7LB3jUXtRc/aVprFephx8+DZsuLVLp0b4B1aDTp
 Ml95gAMuHtJyNIzXEGUOC4gYwJ4BdTjXSCQnynTroz1W3EW4yZklcAIsAVehY8BCwszYcZ5yQjm
 9VCFtrl+yIVi7Cu/pzSnFJr7b98s9DQLWDvj+rn101bNurYzTCg9bivG8NuAgI+D4UkKHeaIk6A
 u+9Z2raFG4iMtHxQm9zEdql3oGCaxC+SG1MIw==
X-Google-Smtp-Source: AGHT+IGjNoSi55H6LTh+TEK7X9NjMWL5ZUaOYs3Y/pXIqtUBFNLjO8W3r3EIjEjAxQP/NhGqLWfqV8nrR6Aufh8Uay8=
X-Received: by 2002:a05:6512:3b29:b0:553:2ef3:f73f with SMTP id
 2adb3069b0e04-55caf2d68f0mr1455560e87.3.1754513545886; Wed, 06 Aug 2025
 13:52:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250716093401.1213358-1-fabien.lehoussel@smile.fr>
 <20250716093401.1213358-5-fabien.lehoussel@smile.fr>
 <87ldnwilxr.fsf@dell.be.48ers.dk>
 <CAKWtHtx781ztPikYLoD9XZZ_ZsFXdDUwv0KMDuqpx8F0Z3jWdQ@mail.gmail.com>
In-Reply-To: <CAKWtHtx781ztPikYLoD9XZZ_ZsFXdDUwv0KMDuqpx8F0Z3jWdQ@mail.gmail.com>
Date: Wed, 6 Aug 2025 22:52:15 +0200
X-Gm-Features: Ac12FXyV5cyMr37lT8wKLOjzQMc5KM0mCpT5hpFiAx-TZLVZ91yKOA--S2PU7Us
Message-ID: <CAKWtHtyz6pS6YZtADK4+KXoqJEkTSFX9ea-hUgD=r6ArQnYnpA@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754513546; x=1755118346; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jLfSYXO6gUno+5ewnPAM3SdDcBJUyKsCbsD4qDqNMF8=;
 b=lATVYZezIA5k49wfc8Xf8NSLMocb4z0rg+XKT+1tlrx4Wbni8onY6k2tJPk2WxYCOc
 bnshGIBojmiBhQOQ9ZxKra2PvyhvS63/Z7dcYKBQXA3OHvKPhSOjXSuEfqsXr/k8VZyR
 ezQkZIiUA5lJEoQ6E/r9moJvFLNQiwdWfzd84=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=lATVYZez
Subject: Re: [Buildroot] [PATCH v2 5/5] utils/generate-cyclonedx: add source
 field to CVE entries
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
From: Fabien LEHOUSSEL via buildroot <buildroot@buildroot.org>
Reply-To: Fabien LEHOUSSEL <fabien.lehoussel@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Fabien Lehoussel via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgbWVyLiA2IGFvw7t0IDIwMjUgw6AgMTc6NTgsIEZhYmllbiBMRUhPVVNTRUwKPGZhYmllbi5s
ZWhvdXNzZWxAc21pbGUuZnI+IGEgw6ljcml0IDoKPgo+IExlIG1lci4gNiBhb8O7dCAyMDI1IMOg
IDE2OjA2LCBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+IGEgw6ljcml0IDoK
PiA+Cj4gPiA+Pj4+PiAiRmFiaWVuIiA9PSBGYWJpZW4gTGVob3Vzc2VsIHZpYSBidWlsZHJvb3Qg
PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cml0ZXM6Cj4gPgo+ID4gID4gTWFuZGF0b3J5IGZv
ciBEZXBlbmRlbmN5VHJhY2sgY29tcGF0aWJpbGl0eQo+ID4gID4gU2lnbmVkLW9mZi1ieTogRmFi
aWVuIExlaG91c3NlbCA8ZmFiaWVuLmxlaG91c3NlbEBzbWlsZS5mcj4KPiA+Cj4gPiBBcm5vdXQg
bWVudGlvbmVkIGluCj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3QvZDg1YTk1
ODctYTFmMC00YmRkLTg3NmQtOTM5MTYwMTAyNzQ2QHJub3V0LmJlLwo+ID4gdGhhdCBpdCBpcyBt
YXJrZWQgYXMgb3B0aW9uYWwgaW4gdGhlIGN5Y2xvbmVkeCBzcGVjLiBDYW4geW91IGNsYXJpZnkK
PiA+IHdoYXQgaXMgdGhlIGRpZmZlcmVuY2UgaW4gYmVoYXZpb3VyIGluIERlcGVuZGVuY3lUcmFj
ayBpZiB0aGlzIGlzCj4gPiBpbmNsdWRlZD8KPgo+IEknbGwgcnVuIGEgZmV3IG1vcmUgdGVzdHMs
IGJ1dCBJIHJlbWVtYmVyIHRoYXQgdGhlIGlkZW50aWZpZWQgQ1ZFcwo+IHdlcmUgbm90IHJlY29n
bml6ZWQgd2l0aG91dCB0aGlzIGZpZWxkIGluIERUIHY0LjEyLjEKCk5ldyB0ZXN0IHdpdGggRFQg
djQuMTMuMwoKV2l0aG91dCBzb3VyY2UgaW5mb3JtYXRpb24sIHRoZSBWRVggaW1wb3J0IGlzIG5v
dCBwcm9jZXNzZWQKCmFwaXNlcnZlcl8xIHwgMjAyNS0wOC0wNiAyMDozNDo0Miw1NzUgSU5GTyBb
VmV4VXBsb2FkUHJvY2Vzc2luZ1Rhc2tdClByb2Nlc3NpbmcgQ3ljbG9uZURYIFZFWCB1cGxvYWRl
ZCB0byBwcm9qZWN0Ogo0ZWY1NGM5YS1jMDYwLTQzNDUtYTM5Yy1kMjBmMTY4ZmE3MzUKYXBpc2Vy
dmVyXzEgfCAyMDI1LTA4LTA2IDIwOjM0OjQyLDY4OSBXQVJOIFtDeWNsb25lRFhWZXhJbXBvcnRl
cl0gVkVYCnZ1bG5lcmFiaWxpdHkgYXQgcG9zaXRpb24gIzAgZG9lcyBub3QgaGF2ZSBhbiBJRCBh
bmQgLyBvciBzb3VyY2U7ClNraXBwaW5nIGl0CmFwaXNlcnZlcl8xIHwgMjAyNS0wOC0wNiAyMDoz
NDo0Miw2ODkgV0FSTiBbQ3ljbG9uZURYVmV4SW1wb3J0ZXJdIFZFWAp2dWxuZXJhYmlsaXR5IGF0
IHBvc2l0aW9uICMxIGRvZXMgbm90IGhhdmUgYW4gSUQgYW5kIC8gb3Igc291cmNlOwpTa2lwcGlu
ZyBpdAphcGlzZXJ2ZXJfMSB8IDIwMjUtMDgtMDYgMjA6MzQ6NDIsNjg5IFdBUk4gW0N5Y2xvbmVE
WFZleEltcG9ydGVyXSBWRVgKdnVsbmVyYWJpbGl0eSBhdCBwb3NpdGlvbiAjMiBkb2VzIG5vdCBo
YXZlIGFuIElEIGFuZCAvIG9yIHNvdXJjZTsKU2tpcHBpbmcgaXQKYXBpc2VydmVyXzEgfCAyMDI1
LTA4LTA2IDIwOjM0OjQyLDY4OSBJTkZPIFtDeWNsb25lRFhWZXhJbXBvcnRlcl0gVGhlCnVwbG9h
ZGVkIFZFWCBkb2VzIG5vdCBjb250YWluIGFueSBhcHBsaWNhYmxlIHZ1bG5lcmFiaWxpdGllczsg
U2tpcHBpbmcKVkVYIGltcG9ydAphcGlzZXJ2ZXJfMSB8IDIwMjUtMDgtMDYgMjA6MzQ6NDIsNjg5
IElORk8gW1ZleFVwbG9hZFByb2Nlc3NpbmdUYXNrXQpDb21wbGV0ZWQgcHJvY2Vzc2luZyBvZiBD
eWNsb25lRFggVkVYIGZvciBwcm9qZWN0Ogo0ZWY1NGM5YS1jMDYwLTQzNDUtYTM5Yy1kMjBmMTY4
ZmE3MzUKCldpdGggc291cmNlIGluZm9ybWF0aW9uIDoKCmFwaXNlcnZlcl8xIHwgMjAyNS0wOC0w
NiAyMDozNDo0Miw2ODkgSU5GTyBbVmV4VXBsb2FkUHJvY2Vzc2luZ1Rhc2tdCkNvbXBsZXRlZCBw
cm9jZXNzaW5nIG9mIEN5Y2xvbmVEWCBWRVggZm9yIHByb2plY3Q6CjRlZjU0YzlhLWMwNjAtNDM0
NS1hMzljLWQyMGYxNjhmYTczNQphcGlzZXJ2ZXJfMSB8IDIwMjUtMDgtMDYgMjA6MzY6MjYsOTE5
IElORk8gW1ZleFVwbG9hZFByb2Nlc3NpbmdUYXNrXQpQcm9jZXNzaW5nIEN5Y2xvbmVEWCBWRVgg
dXBsb2FkZWQgdG8gcHJvamVjdDoKCkNWRSBhcmUgdmlzaWJsZSBvbiB0aGUg4oCcVnVsbmVyYWJp
bGl0eSBBdWRpdOKAnSBwYWdlLgoKPiA+ID4gLS0tCj4gPiAgPiAgdXRpbHMvZ2VuZXJhdGUtY3lj
bG9uZWR4IHwgNCArKysrCj4gPiAgPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+
ID4KPiA+ICA+IGRpZmYgLS1naXQgYS91dGlscy9nZW5lcmF0ZS1jeWNsb25lZHggYi91dGlscy9n
ZW5lcmF0ZS1jeWNsb25lZHgKPiA+ICA+IGluZGV4IGQyODc1MDczNWYuLjVlZmZhMDI4MmMgMTAw
NzU1Cj4gPiAgPiAtLS0gYS91dGlscy9nZW5lcmF0ZS1jeWNsb25lZHgKPiA+ICA+ICsrKyBiL3V0
aWxzL2dlbmVyYXRlLWN5Y2xvbmVkeAo+ID4gID4gQEAgLTIyOCw2ICsyMjgsMTAgQEAgZGVmIGN5
Y2xvbmVkeF92dWxuZXJhYmlsaXRpZXMoc2hvd19pbmZvX2RpY3QpOgo+ID4KPiA+ICA+ICAgICAg
cmV0dXJuIFt7Cj4gPiAgPiAgICAgICAgICAiaWQiOiBjdmUsCj4gPiAgPiArICAgICAgICAic291
cmNlIjogewo+ID4gID4gKyAgICAgICAgICAgICJuYW1lIjogIk5WRCIsCj4gPiAgPiArICAgICAg
ICAgICAgInVybCI6ICJodHRwczovL252ZC5uaXN0Lmdvdi92dWxuL2RldGFpbC8iICsgY3ZlCj4g
PiAgPiArICAgICAgICB9LAo+ID4gID4gICAgICAgICAgImFuYWx5c2lzIjogewo+ID4gID4gICAg
ICAgICAgICAgICJzdGF0ZSI6ICJpbl90cmlhZ2UiLAo+ID4gID4gICAgICAgICAgICAgICJkZXRh
aWwiOiBmIlRoZSBDVkUgJ3tjdmV9JyBoYXMgYmVlbiBtYXJrZWQgYXMgaWdub3JlZCBieSBCdWls
ZHJvb3QiCj4gPiAgPiAtLQo+ID4KPiA+ICA+IDIuNDMuMAo+ID4KPiA+ICA+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiAgPiBidWlsZHJvb3QgbWFp
bGluZyBsaXN0Cj4gPiAgPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+ID4gID4gaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gPgo+ID4KPiA+
IC0tCj4gPiBCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
