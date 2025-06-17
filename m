Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB88C71136
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 15:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5D48406B7;
	Tue, 17 Jun 2025 15:47:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4XQdHbDt-FQS; Tue, 17 Jun 2025 15:47:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 200DF40687
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 200DF40687;
	Tue, 17 Jun 2025 15:47:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CED8D79
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 15:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E9EF4007D
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 15:47:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ExNj3TXZ4g_1 for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 15:47:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2872B4018D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2872B4018D
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2872B4018D
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 15:47:19 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-553bcba4ff8so2858101e87.2
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 08:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750175237; x=1750780037;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QN1Bgu3mh8WzIyfMbmrGVfZn1z29wGaycNBW1Ond29E=;
 b=MT8FFMpleaZ0C1tp/QJx9j70aYLN8m8qYH3JJmuUuL10WBaFTD2kkI6JoURw1Muk/s
 uhPE9u4XrRnt6IMrBULKn2/enBeGt1Wir2NHX3tctlvxDBLCtxhbPkaLDY4rptl2KSCy
 xm9BuOxlf1J7QT7ymZWeYETJBgRlg/N9WjjswZyGK2zlOHQHRS/O+eplXOfoLvXeVRWx
 j0nj+xQ1F3f2VbYmsjcXKJup7DcsYxghGtu0OwYU7DDOuHXAk5jzR4Fh+Pq9pXxXRhAn
 DbZAtP1SoZRGTxLc4lAwjIRQPchWdNtiJTbkQ/JCKzbUeJgXwn3SMlwVFpA6bR50b14P
 EjxQ==
X-Gm-Message-State: AOJu0YwQ+AYa7gh8qBfsYCAq/W1+KJVuHQ1q5pXFUG9FcyDohDQcyms5
 YgMHNhko3n33rnZ0/dCTLHoSusNfZ7DhkaYFrF/nT7OBuEfROu4cSlGHrOi6ijcbwBB1j/ukUGw
 4fnRLywzoJzixH58NlCUPJ7og8RMBYf9914Y+Fa5AqVXPthTADLf9c4sUvA==
X-Gm-Gg: ASbGncvB4AJA4MOGyD0qft88DPGEh+QdbdWaHW/lrAkm9MFZQm49fQiWsne++RCRx8S
 Xdb0QaIBipSTO7ZG+tBctnoE/bFb2NvTI9sUZnhwQpXaxeoc02z9odC8tsK4E1178CFhvM0E6/r
 l6B7ICfJle8+xB1MH2BCTidefpYEz9lXRFI4w8A0eVPZdekgCdHaH2KjrH46oCZzt4LDSF/FIoA
 w==
X-Google-Smtp-Source: AGHT+IEf0e7HpA679482DicKX67AcA8pVzKCrzuCm/AOyLMZDwD1dBo48hRSrTUeq9Bpo80jC+XnIiIMpI0jUdO2fRs=
X-Received: by 2002:a05:6512:b8c:b0:553:3916:4e1c with SMTP id
 2adb3069b0e04-553b6e7345fmr3350392e87.2.1750175236772; Tue, 17 Jun 2025
 08:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250613110559.2665663-1-fabien.lehoussel@smile.fr>
 <20250613110559.2665663-4-fabien.lehoussel@smile.fr>
 <7cafc718-5f76-4f5d-bce4-10f7364cd0a5@rnout.be>
In-Reply-To: <7cafc718-5f76-4f5d-bce4-10f7364cd0a5@rnout.be>
Date: Tue, 17 Jun 2025 17:47:04 +0200
X-Gm-Features: AX0GCFu_4b-gNOnU0C-1obXa_ioml1m09aHHNcm3OjthwU5UrzuYRmP82Ww2prc
Message-ID: <CAKWtHtwZQd7NytwHC5yLitS5ZwOiMFpsVE1-_7dhOKWH_LjXaA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1750175237; x=1750780037; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QN1Bgu3mh8WzIyfMbmrGVfZn1z29wGaycNBW1Ond29E=;
 b=Pogyzrx/Az7ul2T/dLaQ4WtE8J3cvJUYq+88sa/I9vu3c+4Nn01Gkqnw6tBdYm8IgP
 m0a9xjfMQlf8YbuF7z5Y5cS3q7j01CFlc2v8Aqet7QZYXoulQzSfy4NAn4pr4rVRjyva
 4w921N7fUEl/xQJED50JhXou+samP3j9tDDaw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=Pogyzrx/
Subject: Re: [Buildroot] [PATCH 4/7] utils/generate-cyclonedx: add timestamp
 field in metadata
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgbHVuLiAxNiBqdWluIDIwMjUgw6AgMjE6NTUsIEFybm91dCBWYW5kZWNhcHBlbGxlIDxhcm5v
dXRAcm5vdXQuYmU+IGEgw6ljcml0IDoKPgo+Cj4KPiBPbiAxMy8wNi8yMDI1IDEzOjA1LCBGYWJp
ZW4gTGVob3Vzc2VsIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4gPiBBZGRzIGEgdGltZXN0YW1wIGZp
ZWxkIHRvIHRoZSBTQk9NIG1ldGFkYXRhIHNlY3Rpb24sIGZvbGxvd2luZyB0aGUKPiA+IEN5Y2xv
bmVEWCBzcGVjaWZpY2F0aW9uIHJlcXVpcmVtZW50cy4gVGhpcyBpbXByb3ZlcyBjb21wbGlhbmNl
IHdpdGgKPgo+ICAgImltcHJvdmVzIGNvbXBsaWFuY2UiIHN1Z2dlc3RzIHRoYXQgaXQgaXMgY3Vy
cmVudGx5IG5vdCBjb21wbGlhbnQuIEFGQUlDUyB0aGUKPiBzcGVjIFsxXSBkb2Vzbid0IG1hcmsg
dGhlIHRpbWVzdGFtcCBwcm9wZXJ0eSBhcyByZXF1aXJlZCB0aG91Z2guCj4KPiA+IHRoZSBzdGFu
ZGFyZCBhbmQgcHJvdmlkZXMgdmFsdWFibGUgaW5mb3JtYXRpb24gYWJvdXQgd2hlbiB0aGUgU0JP
TQo+ID4gd2FzIGdlbmVyYXRlZC4KPgo+ICAgVGhlIHZhbHVlIG9mIGEgdGltZXN0YW1wIG9uIGEg
Z2VuZXJhdGVkIGFydGlmYWN0IGlzIHZlcnkgcXVlc3Rpb25hYmxlLiBJbgo+IGFkZGl0aW9uLCBp
dCBtYWtlcyB0aGlzIG5vbi1yZXByb2R1Y2libGUgKGkuZS4gcnVubmluZyB0aGUgdG9vbCB0d2lj
ZSBvbiB0aGUKPiBzYW1lIGNvbmZpZywgd2l0aCB0aGUgc2FtZSBCdWlsZHJvb3QgdmVyc2lvbiwg
d2lsbCB5aWVsZCBkaWZmZXJlbnQgcmVzdWx0cwo+IGJlY2F1c2Ugb2YgdGhpcyB0aW1lc3RhbXAp
LiBBbmQgZmluYWxseSwgeW91IGRvIGhhdmUgdGhpcyBpbmZvcm1hdGlvbiBhbHJlYWR5LAo+IHdp
dGggdGhlIGxhc3QgbW9kaWZpZWQgdGltZXN0YW1wIG9mIHRoZSBvdXRwdXQgZmlsZS4KPgo+ICAg
U28gSSdtIG5vdCBpbiBmYXZvdXIgb2YgdGhpcyBjaGFuZ2UuCj4KPiAgIFJlZ2FyZHMsCj4gICBB
cm5vdXQKCk9rLCBJJ2xsIGRyb3AgdGhlIGNvbW1pdCBpbiB2MiBvZiB0aGUgcGF0Y2ggc2V0LgoK
RmFiaWVuCgo+IFsxXSBodHRwczovL2N5Y2xvbmVkeC5vcmcvZG9jcy8xLjYvanNvbi8jbWV0YWRh
dGFfdGltZXN0YW1wCj4KPgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYmllbiBMZWhvdXNzZWwg
PGZhYmllbi5sZWhvdXNzZWxAc21pbGUuZnI+Cj4gPiAtLS0KPiA+ICAgdXRpbHMvZ2VuZXJhdGUt
Y3ljbG9uZWR4IHwgMiArKwo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4g
Pgo+ID4gZGlmZiAtLWdpdCBhL3V0aWxzL2dlbmVyYXRlLWN5Y2xvbmVkeCBiL3V0aWxzL2dlbmVy
YXRlLWN5Y2xvbmVkeAo+ID4gaW5kZXggYTA2OWY0NjdiNi4uNWE2YTE5MTYwNiAxMDA3NTUKPiA+
IC0tLSBhL3V0aWxzL2dlbmVyYXRlLWN5Y2xvbmVkeAo+ID4gKysrIGIvdXRpbHMvZ2VuZXJhdGUt
Y3ljbG9uZWR4Cj4gPiBAQCAtMTcsNiArMTcsNyBAQCBmcm9tIHBhdGhsaWIgaW1wb3J0IFBhdGgK
PiA+ICAgaW1wb3J0IHVybGxpYi5yZXF1ZXN0Cj4gPiAgIGltcG9ydCBzdWJwcm9jZXNzCj4gPiAg
IGltcG9ydCBzeXMKPiA+ICtpbXBvcnQgZGF0ZXRpbWUKPiA+Cj4gPiAgIENZQ0xPTkVEWF9WRVJT
SU9OID0gIjEuNiIKPiA+ICAgU1BEWF9TQ0hFTUFfVVJMID0gZiJodHRwczovL3Jhdy5naXRodWJ1
c2VyY29udGVudC5jb20vQ3ljbG9uZURYL3NwZWNpZmljYXRpb24ve0NZQ0xPTkVEWF9WRVJTSU9O
fS9zY2hlbWEvc3BkeC5zY2hlbWEuanNvbiIKPiA+IEBAIC0zMDIsNiArMzAzLDcgQEAgZGVmIG1h
aW4oKToKPiA+ICAgICAgICAgICAiJHNjaGVtYSI6IGYiaHR0cDovL2N5Y2xvbmVkeC5vcmcvc2No
ZW1hL2JvbS17Q1lDTE9ORURYX1ZFUlNJT059LnNjaGVtYS5qc29uIiwKPiA+ICAgICAgICAgICAi
c3BlY1ZlcnNpb24iOiBmIntDWUNMT05FRFhfVkVSU0lPTn0iLAo+ID4gICAgICAgICAgICJtZXRh
ZGF0YSI6IHsKPiA+ICsgICAgICAgICAgICAidGltZXN0YW1wIjogZGF0ZXRpbWUuZGF0ZXRpbWUu
bm93KCkuYXN0aW1lem9uZSgpLmlzb2Zvcm1hdCgpLAo+ID4gICAgICAgICAgICAgICAiY29tcG9u
ZW50Ijogewo+ID4gICAgICAgICAgICAgICAgICAgImJvbS1yZWYiOiAiYnVpbGRyb290IiwKPiA+
ICAgICAgICAgICAgICAgICAgICJuYW1lIjogImJ1aWxkcm9vdCIsCj4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
