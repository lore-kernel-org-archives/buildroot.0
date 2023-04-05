Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4071BC76188
	for <buildroot@archiver.kernel.org>; Wed,  5 Apr 2023 18:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7721541742;
	Wed,  5 Apr 2023 18:38:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7721541742
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mPKqOfG7AV5f; Wed,  5 Apr 2023 18:38:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54F8641755;
	Wed,  5 Apr 2023 18:38:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54F8641755
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B36411C2AD0
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 18:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 893BB60E92
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 18:38:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 893BB60E92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v0l3I91rNtfR for <buildroot@lists.busybox.net>;
 Wed,  5 Apr 2023 18:38:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4063A60E55
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4063A60E55
 for <buildroot@buildroot.org>; Wed,  5 Apr 2023 18:38:41 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-17786581fe1so39547654fac.10
 for <buildroot@buildroot.org>; Wed, 05 Apr 2023 11:38:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680719920; x=1683311920;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JqUljWYMG2OAQcDGcBcehLev6KSR4yrAiSADYgcrKhU=;
 b=ZNKHCBIO5/2EGwjW63uiNJsg5Xwwb/TFJESn+NwrWJemR5qnWcqtxmfu7/jZ20WVIv
 IflDGdh8lNKCmOhhXXUwQ68njuQHj9VkINUiXU+DQB6892e7SRQOUnie069MS5hTYFuH
 OkkFTYbeas9POD6WEPKiE1D13AQ6u3sgph5Kckeqk7iv/z1E6xJ9z5E+p+n72UosviKi
 VR2iXZ90pDbpj6f6+T4uRLjJvPRc9NRGaAT/+TSi8llDRr0qPjhqnrYeY/iPPcuiNx+P
 RD+2hv0w+BpddbtAp0R+vp+mWxPCVSrsTDTjjaCJ1LrulwTYaZcOe2EiESVF9k8EZiCj
 kGqQ==
X-Gm-Message-State: AAQBX9e5iFNDU6z7owOrMT5h0HQajdEWH1rxVtW3g0qbAOOmVUeUBnMV
 gDUhHHWX/oOCP2tvLoYwXulKYM/p0GrhMTEPY/RYCUtenm1gLw==
X-Google-Smtp-Source: AKy350ZjDRDpxBOokReVtQxhpgT2CEivFoWwqUW7vVQM8QPh/lwDqLGbARsul9vfzDUxmz6ryC0U8K5r90XBJycbeU0=
X-Received: by 2002:a05:6870:9598:b0:177:b393:4009 with SMTP id
 k24-20020a056870959800b00177b3934009mr3626054oao.4.1680719920214; Wed, 05 Apr
 2023 11:38:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230405053134.83F264014B@smtp2.osuosl.org>
 <BY5PR12MB5542A39031912B609E3F87DDB2909@BY5PR12MB5542.namprd12.prod.outlook.com>
In-Reply-To: <BY5PR12MB5542A39031912B609E3F87DDB2909@BY5PR12MB5542.namprd12.prod.outlook.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 5 Apr 2023 12:38:29 -0600
Message-ID: <CADvTj4ryv1HTaVvdP9oOD5=zUbehCvPcJQVbg=-w+N9nF5Qg4A@mail.gmail.com>
To: Nitesh Divecha <NDivecha@granitenet.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680719920; x=1683311920;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JqUljWYMG2OAQcDGcBcehLev6KSR4yrAiSADYgcrKhU=;
 b=TzZHscWnT7DSkCI7maJ4Y9TkUM7hYxN3xxkgVE5GAsK8JEhLUhkr1odwbSiLjnIok8
 dX5ZifjkN38ehx+BiN3Lt3d9CGYuJ3fMbUVw2DxsJ1wJD9nNXo8yYfWJru7ndJrZCm7g
 ME6q/fB3zJaXgmZWnfHp1cJGlftuz+24LR63sb+koqEvIqGIfvFrWkXeUCmcW8Z9c+/w
 uGucqowtJ0NavlfN3jSQ82adkt/exgri2h0udaEsAdxcUzFsuydwe8BwhgRgb3S/yHZT
 oWpLSaiKgt0YCLgecjF1vDVWmIYTInfpCMTITcL0IHpmdAMm0kVV/B20WFM0ojmYtlNH
 t5AA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TzZHscWn
Subject: Re: [Buildroot] - Python-awscrt/awsiotsdk Package
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCBBcHIgNSwgMjAyMyBhdCA5OjA24oCvQU0gTml0ZXNoIERpdmVjaGEgPE5EaXZlY2hh
QGdyYW5pdGVuZXQuY29tPiB3cm90ZToKPgo+IEhlbGxvIEFsbCwKPgo+Cj4KPiBUaGlzIGlzIG15
IGZpcnN0IHRpbWUgd2l0aCBCdWlsZHJvb3Qgc28gcGxlYXNlIGJlYXIgd2l0aCBtZSEKPgo+Cj4K
PiBJIGdvdCB0d28gaXNzdWVzOgo+Cj4KPgo+IElzc3VlICMxOgo+Cj4gSeKAmW0gdHJ5aW5nIHRv
IGJ1aWxkIGEgY3VzdG9tIExpbnV4IGRpc3RybyB3aXRoIEFXUyBwYWNrYWdlIGZvciBteSBTYW1h
N2c1NC1FSyBib2FyZC4gRm9sbG93aW5nIHRoZSBndWlkZSAoaHR0cHM6Ly9idWlsZHJvb3Qub3Jn
L2Rvd25sb2Fkcy9tYW51YWwvbWFudWFsLmh0bWwjX2luZnJhc3RydWN0dXJlX2Zvcl9weXRob25f
cGFja2FnZXMpIC0gMTguOS4zLiBHZW5lcmF0aW5nIGEgcHl0aG9uLXBhY2thZ2UgZnJvbSBhIFB5
UEkgcmVwb3NpdG9yeSwgSSB3YXMgYWJsZSB0byBhZGQgdGhlIGF3c2NydC9hd3Npb3RzZGsgUGFj
a2FnZSBhbmQgc2VsZWN0IGJvdGggUHl0aG9uIHBhY2thZ2UgdW5kZXIg4oCcbWFrZSBtZW51Y29u
Zmln4oCdIGFuZCBJIHdhcyBhYmxlIHRvIGJ1aWxkIHN1Y2Nlc3NmdWwgaW1hZ2UgKG5vIGVycm9y
cykuCj4KPgo+Cj4gQnVybiB0aGUgc2RjYXJkLmltZyBhbmQgYm9vdGVkIHRoZSBTYW1hN2c1NC1F
SyBib2FyZCBhbmQgdHJpZWQgdG8gcnVuIG15IFB5dGhvbiBzY3JpcHQgYW5kIGdvdCBmb2xsb3dp
bmcgZXJyb3I6Cj4KPgo+Cj4gIyBweXRob24zIGFwcC1jb2RlL3Byb3Zpc2lvbmluZy5weSA3Nzcw
MDAxMTExCj4KPiBUcmFjZWJhY2sgKG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6Cj4KPiAgIEZpbGUg
Ii9ob21lL3Jvb3QvYXBwLWNvZGUvcHJvdmlzaW9uaW5nLnB5IiwgbGluZSA0LCBpbiA8bW9kdWxl
Pgo+Cj4gICAgIGZyb20gYXdzY3J0IGltcG9ydCBtcXR0Cj4KPiAgIEZpbGUgIi91c3IvbGliL3B5
dGhvbjMuMTAvc2l0ZS1wYWNrYWdlcy9hd3NjcnQvbXF0dC5weSIsIGxpbmUgOSwgaW4gPG1vZHVs
ZT4KPgo+IEltcG9ydEVycm9yOiAvdXNyL2xpYi9weXRob24zLjEwL3NpdGUtcGFja2FnZXMvX2F3
c2NydC5jcHl0aG9uLTMxMC1hcm0tbGludXgtZ251ZWFiaWhmLnNvOiB1bmRlZmluZWQgc3ltYm9s
OiBhZXNfaHdfZW5jcnlwdAo+Cj4gIwo+Cj4KPgo+IElzc3VlICMyOgo+Cj4gQW5kIGp1c3QgZm9y
IHRlc3RpbmcvZGV2ZWxvcG1lbnQgcHVycG9zZSBJIGRpZCBpbmNsdWRlIOKAnHB5dGhvbi1waXDi
gJ0gcGFja2FnZSBidXQgZXZlcnkgdGltZSBJIHJ1biDigJxwaXDigJ0gSSBnZXQgZm9sbG93aW5n
IGVycm9yOgoKVGhhdCdzIG5vdCBnb2luZyB0byB3b3JrLCB3ZSBkb24ndCByZWFsbHkgaGF2ZSBw
cm9wZXIgcGlwIHN1cHBvcnQKc2luY2Ugd2UgZG9uJ3Qgc3VwcG9ydCBjb21waWxlcnMgb24gdGhl
IHRhcmdldC4KCj4KPiAjIHB5dGhvbjMgLW0gcGlwIGluc3RhbGwgLi9hd3MtaW90LWRldmljZS1z
ZGstcHl0aG9uLXYyCj4KPiBUcmFjZWJhY2sgKG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6Cj4KPiAg
IEZpbGUgIi91c3IvbGliL3B5dGhvbjMuMTAvcnVucHkucHkiLCBsaW5lIDE5NiwgaW4gX3J1bl9t
b2R1bGVfYXNfbWFpbgo+Cj4gICBGaWxlICIvdXNyL2xpYi9weXRob24zLjEwL3J1bnB5LnB5Iiwg
bGluZSA4NiwgaW4gX3J1bl9jb2RlCj4KPiAgIEZpbGUgIi91c3IvbGliL3B5dGhvbjMuMTAvc2l0
ZS1wYWNrYWdlcy9waXAvX19tYWluX18ucHkiLCBsaW5lIDI5LCBpbiA8bW9kdWxlPgo+Cj4gICBG
aWxlICIvdXNyL2xpYi9weXRob24zLjEwL3NpdGUtcGFja2FnZXMvcGlwL19pbnRlcm5hbC9jbGkv
bWFpbi5weSIsIGxpbmUgOSwgaW4gPG1vZHVsZT4KPgo+ICAgRmlsZSAiL3Vzci9saWIvcHl0aG9u
My4xMC9zaXRlLXBhY2thZ2VzL3BpcC9faW50ZXJuYWwvY2xpL2F1dG9jb21wbGV0aW9uLnB5Iiwg
bGluZSAxMCwgaW4gPG1vZHVsZT4KPgo+ICAgRmlsZSAiL3Vzci9saWIvcHl0aG9uMy4xMC9zaXRl
LXBhY2thZ2VzL3BpcC9faW50ZXJuYWwvY2xpL21haW5fcGFyc2VyLnB5IiwgbGluZSA4LCBpbiA8
bW9kdWxlPgo+Cj4gICBGaWxlICIvdXNyL2xpYi9weXRob24zLjEwL3NpdGUtcGFja2FnZXMvcGlw
L19pbnRlcm5hbC9jbGkvY21kb3B0aW9ucy5weSIsIGxpbmUgMjMsIGluIDxtb2R1bGU+Cj4KPiAg
IEZpbGUgIi91c3IvbGliL3B5dGhvbjMuMTAvc2l0ZS1wYWNrYWdlcy9waXAvX2ludGVybmFsL2Ns
aS9wYXJzZXIucHkiLCBsaW5lIDEyLCBpbiA8bW9kdWxlPgo+Cj4gICBGaWxlICIvdXNyL2xpYi9w
eXRob24zLjEwL3NpdGUtcGFja2FnZXMvcGlwL19pbnRlcm5hbC9jb25maWd1cmF0aW9uLnB5Iiwg
bGluZSAyMSwgaW4gPG1vZHVsZT4KPgo+ICAgRmlsZSAiL3Vzci9saWIvcHl0aG9uMy4xMC9zaXRl
LXBhY2thZ2VzL3BpcC9faW50ZXJuYWwvZXhjZXB0aW9ucy5weSIsIGxpbmUgNywgaW4gPG1vZHVs
ZT4KPgo+ICAgRmlsZSAiL3Vzci9saWIvcHl0aG9uMy4xMC9zaXRlLXBhY2thZ2VzL3BpcC9fdmVu
ZG9yL3BrZ19yZXNvdXJjZXMvX19pbml0X18ucHkiLCBsaW5lIDM1LCBpbiA8bW9kdWxlPgo+Cj4g
ICBGaWxlICIvdXNyL2xpYi9weXRob24zLjEwL3BsaXN0bGliLnB5IiwgbGluZSA2MSwgaW4gPG1v
ZHVsZT4KPgo+IE1vZHVsZU5vdEZvdW5kRXJyb3I6IE5vIG1vZHVsZSBuYW1lZCAneG1sJwo+Cj4K
Pgo+IFRyaWVkIHRvIGxvb2sgZm9yIFB5dGhvbiBYTUwgbW9kdWxlIGJ1dCBkaWQgbm90IGZpbmQg
YW554oCmCgpZb3UgbmVlZCB0byBzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OM19QWUVYUEFUIHBy
b2JhYmx5LgoKPgo+Cj4KPiBNeSBkZXYgZW52aXJvbm1lbnQgaW5mbzoKPgo+IFVzaW5nIExpbnV4
NFNhbSB0byBidWlsZCB0aGUgZGlzdHJvIGZvciBTYW1hN2c1NC1FSyBib2FyZCAoQVQ5MSBhbmQg
VS1Cb290KTogaHR0cHM6Ly93d3cubGludXg0c2FtLm9yZy9iaW4vdmlldy9MaW51eDRTQU0vQnVp
bGRSb290Cj4KPiBEZWJpYW4gMTE6IExpbnV4IDUuMTAuMC0yMS1hbWQ2NCAjMSBTTVAgRGViaWFu
IDUuMTAuMTYyLTEgKDIwMjMtMDEtMjEpIHg4Nl82NCBHTlUvTGludXgKPgo+Cj4KPiBBbnkgaGVs
cCB3aWxsIGJlIGhpZ2hseSBhcHByZWNpYXRlZC4KCkkgd3JvdGUgdXAgc29tZSBpbnN0cnVjdGlv
bnMgb24gaG93IHRvIGFkZCB0aGlzIHBhY2thZ2UgcHJldmlvdXNseToKaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYnVpbGRyb290L0NBRHZUajRyNTRwSm5uZ0ZCR1FYeD16QVRVUlNtaE5BdXZ0a2M3
bldBX3l2UjNrRjFCd0BtYWlsLmdtYWlsLmNvbS8KCj4KPgo+Cj4gQ2hlZXJzLAo+Cj4gTml0ZXNo
Cj4KPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
