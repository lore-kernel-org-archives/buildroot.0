Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E60C433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:58:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AF3D60720
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5AF3D60720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22C188268F;
	Tue, 12 Oct 2021 20:58:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2A-awvIo30iZ; Tue, 12 Oct 2021 20:58:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E1F782690;
	Tue, 12 Oct 2021 20:58:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C16E31BF681
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0A9760BFB
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:58:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eJTDMJcWFjOj for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 20:58:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 40DB760662
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 20:58:16 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id d9so1284401edh.5
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 13:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/OaC4lgcoUaNrABrFgCx2qXmuA5Z9Cp0Cw9lqYufk8Y=;
 b=Nl5lQSxPRT5I3CnYH7QrNA4oeRLlZmT/hXQOu+feG8mmQ+fGAlYn2VoAq3W2qrXxvw
 KUyYi1jHCqZoBx4Du7PNV67+3DOWO18S92j1i79ytuTAagtqPLAtcIR7ul/tqGKiB5Xl
 3+ccq2FJ0SUSeWr22L5guxo/R+952E+Vf99Z5unhL+jczu7LqkQxwh0z2gIpS5WhBAqn
 nwHM+gLHv0FbU57SXkw55s1Nqoz4faVb+E5C4PPOnIeddZ09RTqIJryHqkDkc37RAb9U
 dyUEdBHAU7Ld6ed5NPxOTccClmi/F38TdZGQo36hiMb/QikaJ1xVLCMS0gVXeBwW3K7b
 2TPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/OaC4lgcoUaNrABrFgCx2qXmuA5Z9Cp0Cw9lqYufk8Y=;
 b=LDrlkJQpxs56aUujq61eH6j/BtGe2ovw0mCmdWXDzN/JSXXL8bWxR8Icwc1K0JSpxc
 oIb0PylfZ7fpHVdOYz9ChveX4AChpxYOyUPX8ULhYW1rN//gvcR+BSa+m+bP4yN51Vf0
 U+EPlNsBV3rg0wsMNWVHBLB4/LI/VnVl9JqrCeLnsmHp7JmlDoGoI4Kg8FoccLUXcNsW
 uK44hhdh6Z6Kn2EM3y9vDvmEODORErH7XdzqOLvUM1ZuCndAk0ordTjcFc728Ay9XaNd
 RvTxIheLmseswvMHBUaVa3+Ljo0yJH2oeuIrobH01TiJ28g3bE3zDf3cgQ7nXnzYhcG4
 OKzw==
X-Gm-Message-State: AOAM532k2yCNJFGc7hsfQS2W4kMaq/159Go4VaCJeAhFYizaZv71SbH0
 yhHF3yCBxsRRXBSv64qvBVW3tg==
X-Google-Smtp-Source: ABdhPJx91DhQ/ibl98WGwMJZdAHSb4R3alw/EGjzyVqbBF5MTwIh7xI4bvwTJUhSYZNtrUBZf3ECxg==
X-Received: by 2002:a50:d809:: with SMTP id o9mr3059557edj.149.1634072294378; 
 Tue, 12 Oct 2021 13:58:14 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id dt4sm5545266ejb.27.2021.10.12.13.58.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 13:58:14 -0700 (PDT)
Message-ID: <b1aa1e5e-18b1-11b6-0f8d-14982d25ad3b@mind.be>
Date: Tue, 12 Oct 2021 22:58:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>,
 =?UTF-8?Q?Esa=c3=afe_Ledoux_NJONGSSI_KOUAM?= <kouamdoux@gmail.com>
References: <CA+eej5MzpM30U7sMqba5gKQ3dG5FznZqd6roacphLhx6J-9auA@mail.gmail.com>
 <f04ffb9e-04d5-0167-8ec2-957a3d1973e6@grenoble.cnrs.fr>
 <CA+eej5NPy3otW728B0+zrwJqVfJPEFhW_dYBKpKT=9XC9EdbOg@mail.gmail.com>
 <1819f3c3-52db-7e21-8d42-f5c2ae434f33@gmail.com>
 <CA+eej5ObHKKx4x=uOYRDF1npRR4kqnucWByTtNkbS40A+1y-GA@mail.gmail.com>
 <fe8b5e30-6cb7-161d-6e6e-cdddadcbbe01@gmail.com>
 <CA+eej5M-SbCseCpknXdMboR7Lz+A94BNHMBZd2WJkcbDD6pZAg@mail.gmail.com>
 <59c215b4-63e2-ba22-285f-0fb4032111b8@mind.be>
 <CA+eej5M2CjZvH+cYL31OhspJCkN0isrbmJA9pUKHsnOzdbuegA@mail.gmail.com>
 <CA+eej5Niy_Qkag54jkV39WgcCLy2t11=S-gY+UndMtjOMqNWpQ@mail.gmail.com>
 <CA+eej5NNTNONO_GX1T=DhRyvbQJzxNhJMrRi-T4Ue-bexYRR3w@mail.gmail.com>
 <CA+eej5NKcWV6n_sM19Px+NP4EoqSDmUqw2W3DdTDGGKQRSqZ5Q@mail.gmail.com>
 <20211012225224.23525d4f@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211012225224.23525d4f@gmx.net>
Subject: Re: [Buildroot] error when i build buidroot
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
Cc: Joachim Wiberg <troglobit@gmail.com>, Edgar Bonet <bonet@grenoble.cnrs.fr>,
 buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxMi8xMC8yMDIxIDIyOjUyLCBQZXRlciBTZWlkZXJlciB3cm90ZToKPiBIZWxsbyBFc2HD
r2UsCj4gCj4gT24gVHVlLCAxMiBPY3QgMjAyMSAxOTo0MToxMSArMDIwMCwgRXNhw69lIExlZG91
eCBOSk9OR1NTSSBLT1VBTSA8a291YW1kb3V4QGdtYWlsLmNvbT4gd3JvdGU6Cj4gCj4+IEFub3Ro
ZXIgcHJvYmxlbSBvY2N1ciAsCj4+IExpbnV4IDUtMTAgYnVpbGRpbmcgZ2VuZXJhdGUgY29tcGls
YXRpb24gZXJyb3JzCj4+Cj4+IGkgaGF2ZSBhIGxvdCBvZiBlcnJvciA6KAo+Pgo+PiBhcmNoL3g4
Ni9lbnRyeS90aHVua182NC5vOiB3YXJuaW5nOiBvYmp0b29sOiBtaXNzaW5nIHN5bWJvbCB0YWJs
ZQo+PiBtYWtlWzNdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6MzYwIDogYXJjaC94ODYv
ZW50cnkvdGh1bmtfNjQub10KPj4gRXJyZXVyIDEKPj4gbWFrZVszXTogKioqIFN1cHByZXNzaW9u
IGR1IGZpY2hpZXIgwqsgYXJjaC94ODYvZW50cnkvdGh1bmtfNjQubyDCuwo+PiBtYWtlWzJdOiAq
KiogW3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6NDk2IDogYXJjaC94ODYvZW50cnldIEVycmV1ciAy
Cj4+Cj4+ICAgIENDICAgICAgYXJjaC94ODYvbW0vY3B1X2VudHJ5X2FyZWEubwo+PiAgICBDQyAg
ICAgIGFyY2gveDg2L21tL21hY2Nlc3Mubwo+PiAgICBDQyAgICAgIGFyY2gveDg2L21tL3BrZXlz
Lm8KPj4gICAgQ0MgICAgICBhcmNoL3g4Ni9tbS9rYXNsci5vCj4+ICAgIENDICAgICAgYXJjaC94
ODYvbW0vcHRpLm8KPj4gICAgQVIgICAgICBhcmNoL3g4Ni9tbS9idWlsdC1pbi5hCj4+IG1ha2Vb
MV06ICoqKiBbTWFrZWZpbGU6MTgwNSA6IGFyY2gveDg2XSBFcnJldXIgMgo+PiBtYWtlWzFdOiAq
KiogQXR0ZW50ZSBkZXMgdMOiY2hlcyBub24gdGVybWluw6llcy4uLi4KPj4gbWFrZVsxXSA6IG9u
IHF1aXR0ZSBsZSByw6lwZXJ0b2lyZQo+PiDCqyAvaG9tZS9sZWRvdXgvRG9jdW1lbnRzL2J1aWxk
cm9vdC9vdXRwdXQvYnVpbGQvbGludXgtNS4xMC43IMK7Cj4+IG1ha2U6ICoqKiBbcGFja2FnZS9w
a2ctZ2VuZXJpYy5tazoyOTQgOgo+PiAvaG9tZS9sZWRvdXgvRG9jdW1lbnRzL2J1aWxkcm9vdC9v
dXRwdXQvYnVpbGQvbGludXgtNS4xMC43Ly5zdGFtcF9idWlsdF0KPj4gRXJyZXVyIDIKPiAKPiBD
YW4gY29uZmlybSB0aGUgZXJyb3Igd2l0aCBxZW11X3g4Nl82NF9kZWZjb25maWcsIGJ1bXBpbmcg
dGhlCj4ga2VybmVsIHZlcnNpb24gZnJvbSA1LjEwLjcgdG8gNS4xMC43MiAobGF0ZXN0IDUuMTAu
eCkgc29sdmVzCj4gdGhlIHByb2JsZW0gaGVyZS4uLgoKICBJIGhlYWQganVzdCBjb25maXJtZWQg
dGhlIHNhbWUgdGhpbmcgOi0pCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IAo+IFJlZ2FyZHMsCj4g
UGV0ZXIKPiAKPj4KPj4gZGVmaW5pdGVseSwgSSBkb24ndCBrbm93IHdoYXQgdG8gZG8uCj4+IEkn
bSBhZnJhaWQgdG8gc29sdmUgdGhpcyBwcm9ibGVtIGFuZCBydW4gaW50byBvdGhlcnMuCj4+Cj4+
Cj4+Cj4+IExlIG1hci4gMTIgb2N0LiAyMDIxIMOgIDE1OjAxLCBFc2HDr2UgTGVkb3V4IE5KT05H
U1NJIEtPVUFNIDwKPj4ga291YW1kb3V4QGdtYWlsLmNvbT4gYSDDqWNyaXQgOgo+Pgo+Pj4gaSBo
YXZlIHNlZW4gc29tZXRoaW5nICwgLi4uCj4+PiBJdCBpcyB3b3JraW5nIHZlcnkgd2VsbCAsIGJl
Y2F1c2UgdGhlIHByb2JsZW0gd2FzIHJzeW5jIHZlcnNpb24gLCBzbyBpCj4+PiBoYXZlIHRha2Ug
dGhlIGJldHRlciB2ZXJzaW9uCj4+PiBodHRwczovL2dpdGh1Yi5jb20vV2F5bmVEL3JzeW5jL2Js
b2IvbWFzdGVyL0lOU1RBTEwubWQgLCAuLi4KPj4+IHRoYW5rIHlvdSBmb3IgYWxsCj4+Pgo+Pj4g
TGUgbWFyLiAxMiBvY3QuIDIwMjEgw6AgMTQ6NDEsIEVzYcOvZSBMZWRvdXggTkpPTkdTU0kgS09V
QU0gPAo+Pj4ga291YW1kb3V4QGdtYWlsLmNvbT4gYSDDqWNyaXQgOgo+Pj4gICAKPj4+Pj4gaW4g
dGhlIGJ1aWxkcm9vdCBkaXJlY3RvcnkuIElmIHRoYXQgZ2l2ZXMgYW4gZXJyb3IsIHRoZXJlIGlz
IHJlYWxseQo+Pj4+IHNvbWV0aGluZwo+Pj4+PiB3cm9uZyB3aXRoIHlvdXIgT1MuCj4+Pj4KPj4+
PiBpJ20gdHJ5aW5nIHRvIHJlaW5zdGFsbCByc3luYyAsIGkgaG9wZSB0aGF0IHNvbWV0aGluZyB3
aWxsIGJlIGZpbmUgdW50aWwKPj4+PiB0aGUgZW5kCj4+Pj4KPj4+PiBMZSBtYXIuIDEyIG9jdC4g
MjAyMSDDoCAxMzowMCwgRXNhw69lIExlZG91eCBOSk9OR1NTSSBLT1VBTSA8Cj4+Pj4ga291YW1k
b3V4QGdtYWlsLmNvbT4gYSDDqWNyaXQgOgo+Pj4+ICAgCj4+Pj4+ICAgID4gQXMgSm9hY2hpbSBh
c2tlZCwgY2FuIHlvdSBwcm92aWRlIHRoZSBvdXRwdXQgb2YKPj4+Pj4gICAKPj4+Pj4gICAgPiAg
ICBwd2QKPj4+Pj4gICAKPj4+Pj4+IGFuZAo+Pj4+PiAgIAo+Pj4+PiAgICA+ICAgIGZpbmRtbnQK
Pj4+Pj4KPj4+Pj4gbGVkb3V4QGthbGk6fi9Eb2N1bWVudHMvYnVpbGRyb290JCBwd2QKPj4+Pj4g
L2hvbWUvbGVkb3V4L0RvY3VtZW50cy9idWlsZHJvb3QKPj4+Pj4gbGVkb3V4QGthbGk6fi9Eb2N1
bWVudHMvYnVpbGRyb290JCBmaW5kbW50Cj4+Pj4+IFRBUkdFVCAgICAgICAgICAgICAgICAgICAg
ICAgICBTT1VSQ0UgICAgICBGU1RZUEUgIE9QVElPTlMKPj4+Pj4gLyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC9kZXYvc2RhMTAgIGV4dDQKPj4+Pj4gICBydyxyZWxhdGltZSxlcnJvcnM9
cmVtb3VudC1ybwo+Pj4+PiDilJzilIAvc3lzICAgICAgICAgICAgICAgICAgICAgICAgIHN5c2Zz
ICAgICAgIHN5c2ZzCj4+Pj4+IHJ3LG5vc3VpZCxub2Rldixub2V4ZWMscmVsYXRpCj4+Pj4+IOKU
giDilJzilIAvc3lzL2tlcm5lbC9zZWN1cml0eSAgICAgICBzZWN1cml0eWZzICBzZWN1cml0Cj4+
Pj4+IHJ3LG5vc3VpZCxub2Rldixub2V4ZWMscmVsYXRpCj4+Pj4+IOKUgiDilJzilIAvc3lzL2Zz
L2Nncm91cCAgICAgICAgICAgICBjZ3JvdXAyICAgICBjZ3JvdXAyCj4+Pj4+IHJ3LG5vc3VpZCxu
b2Rldixub2V4ZWMscmVsYXRpCj4+Pj4+IOKUgiDilJzilIAvc3lzL2ZzL3BzdG9yZSAgICAgICAg
ICAgICBwc3RvcmUgICAgICBwc3RvcmUKPj4+Pj4gICBydyxub3N1aWQsbm9kZXYsbm9leGVjLHJl
bGF0aQo+Pj4+PiDilIIg4pSc4pSAL3N5cy9maXJtd2FyZS9lZmkvZWZpdmFycyAgZWZpdmFyZnMg
ICAgZWZpdmFyZgo+Pj4+PiBydyxub3N1aWQsbm9kZXYsbm9leGVjLHJlbGF0aQo+Pj4+PiDilIIg
4pSc4pSAL3N5cy9mcy9icGYgICAgICAgICAgICAgICAgbm9uZSAgICAgICAgYnBmCj4+Pj4+IHJ3
LG5vc3VpZCxub2Rldixub2V4ZWMscmVsYXRpCj4+Pj4+IOKUgiDilJzilIAvc3lzL2tlcm5lbC90
cmFjaW5nICAgICAgICB0cmFjZWZzICAgICB0cmFjZWZzCj4+Pj4+IHJ3LG5vc3VpZCxub2Rldixu
b2V4ZWMscmVsYXRpCj4+Pj4+IOKUgiDilJzilIAvc3lzL2tlcm5lbC9kZWJ1ZyAgICAgICAgICBk
ZWJ1Z2ZzICAgICBkZWJ1Z2ZzCj4+Pj4+IHJ3LG5vc3VpZCxub2Rldixub2V4ZWMscmVsYXRpCj4+
Pj4+IOKUgiDilJzilIAvc3lzL2tlcm5lbC9jb25maWcgICAgICAgICBjb25maWdmcyAgICBjb25m
aWdmCj4+Pj4+IHJ3LG5vc3VpZCxub2Rldixub2V4ZWMscmVsYXRpCj4+Pj4+IOKUgiDilJTilIAv
c3lzL2ZzL2Z1c2UvY29ubmVjdGlvbnMgICBmdXNlY3RsICAgICBmdXNlY3RsCj4+Pj4+IHJ3LG5v
c3VpZCxub2Rldixub2V4ZWMscmVsYXRpCj4+Pj4+IOKUnOKUgC9wcm9jICAgICAgICAgICAgICAg
ICAgICAgICAgcHJvYyAgICAgICAgcHJvYwo+Pj4+PiAgIHJ3LG5vc3VpZCxub2Rldixub2V4ZWMs
cmVsYXRpCj4+Pj4+IOKUgiDilJTilIAvcHJvYy9zeXMvZnMvYmluZm10X21pc2MgICBzeXN0ZW1k
LTEgICBhdXRvZnMKPj4+Pj4gICBydyxyZWxhdGltZSxmZD0yOSxwZ3JwPTEsdGltZQo+Pj4+PiDi
lIIgICDilJTilIAvcHJvYy9zeXMvZnMvYmluZm10X21pc2MgYmluZm10X21pc2MgYmluZm10Xwo+
Pj4+PiBydyxub3N1aWQsbm9kZXYsbm9leGVjLHJlbGF0aQo+Pj4+PiDilJzilIAvZGV2ICAgICAg
ICAgICAgICAgICAgICAgICAgIHVkZXYgICAgICAgIGRldnRtcGYKPj4+Pj4gcncsbm9zdWlkLHJl
bGF0aW1lLHNpemU9MTcwMTgKPj4+Pj4g4pSCIOKUnOKUgC9kZXYvcHRzICAgICAgICAgICAgICAg
ICAgIGRldnB0cyAgICAgIGRldnB0cwo+Pj4+PiAgIHJ3LG5vc3VpZCxub2V4ZWMscmVsYXRpbWUs
Z2lkCj4+Pj4+IOKUgiDilJzilIAvZGV2L3NobSAgICAgICAgICAgICAgICAgICB0bXBmcyAgICAg
ICB0bXBmcyAgIHJ3LG5vc3VpZCxub2Rldgo+Pj4+PiDilIIg4pSc4pSAL2Rldi9odWdlcGFnZXMg
ICAgICAgICAgICAgaHVnZXRsYmZzICAgaHVnZXRsYgo+Pj4+PiBydyxyZWxhdGltZSxwYWdlc2l6
ZT0yTQo+Pj4+PiDilIIg4pSU4pSAL2Rldi9tcXVldWUgICAgICAgICAgICAgICAgbXF1ZXVlICAg
ICAgbXF1ZXVlCj4+Pj4+ICAgcncsbm9zdWlkLG5vZGV2LG5vZXhlYyxyZWxhdGkKPj4+Pj4g4pSc
4pSAL3J1biAgICAgICAgICAgICAgICAgICAgICAgICB0bXBmcyAgICAgICB0bXBmcwo+Pj4+PiBy
dyxub3N1aWQsbm9kZXYsbm9leGVjLHJlbGF0aQo+Pj4+PiDilIIg4pSc4pSAL3J1bi9sb2NrICAg
ICAgICAgICAgICAgICAgdG1wZnMgICAgICAgdG1wZnMKPj4+Pj4gcncsbm9zdWlkLG5vZGV2LG5v
ZXhlYyxyZWxhdGkKPj4+Pj4g4pSCIOKUnOKUgC9ydW4vcnBjX3BpcGVmcyAgICAgICAgICAgIHN1
bnJwYyAgICAgIHJwY19waXAgcncscmVsYXRpbWUKPj4+Pj4g4pSCIOKUlOKUgC9ydW4vdXNlci8x
MDAwICAgICAgICAgICAgIHRtcGZzICAgICAgIHRtcGZzCj4+Pj4+IHJ3LG5vc3VpZCxub2Rldixy
ZWxhdGltZSxzaXplCj4+Pj4+IOKUgiAgIOKUlOKUgC9ydW4vdXNlci8xMDAwL2RvYyAgICAgICBw
b3J0YWwgICAgICBmdXNlLnBvCj4+Pj4+IHJ3LG5vc3VpZCxub2RldixyZWxhdGltZSx1c2VyCj4+
Pj4+IOKUnOKUgC90bXAgICAgICAgICAgICAgICAgICAgICAgICAgL2Rldi9zZGE5ICAgZXh0NCAg
ICBydyxyZWxhdGltZQo+Pj4+PiDilJzilIAvdmFyICAgICAgICAgICAgICAgICAgICAgICAgIC9k
ZXYvc2RhNyAgIGV4dDQgICAgcncscmVsYXRpbWUKPj4+Pj4g4pSc4pSAL2hvbWUgICAgICAgICAg
ICAgICAgICAgICAgICAvZGV2L3NkYTExICBleHQ0ICAgIHJ3LHJlbGF0aW1lCj4+Pj4+IOKUnOKU
gC9ib290L2VmaSAgICAgICAgICAgICAgICAgICAgL2Rldi9zZGEyICAgdmZhdAo+Pj4+PiAgIHJ3
LHJlbGF0aW1lLGZtYXNrPTAwNzcsZG1hc2s9Cj4+Pj4+IOKUlOKUgC9tZWRpYS9sZWRvdXgvRGF0
YSAgICAgICAgICAgL2Rldi9zZGE2ICAgZnVzZWJsawo+Pj4+PiBydyxub3N1aWQsbm9kZXYscmVs
YXRpbWUsdXNlcgo+Pj4+Pgo+Pj4+Pgo+Pj4+Pgo+Pj4+PiBMZSBsdW4uIDExIG9jdC4gMjAyMSDD
oCAyMjoyNSwgQXJub3V0IFZhbmRlY2FwcGVsbGUgPGFybm91dEBtaW5kLmJlPiBhCj4+Pj4+IMOp
Y3JpdCA6Cj4+Pj4+ICAgCj4+Pj4+PiAgICBIaSBFc2FpZSwKPj4+Pj4+Cj4+Pj4+PiAgICBQbGVh
c2UgZG9uJ3QgdG9wLXBvc3QsIGJ1dCByZXBseSBpbmxpbmUgbGlrZSBJIGRvIGJlbG93LiBOb3Rl
IHRoYXQKPj4+Pj4+IHRoaXMKPj4+Pj4+IHJlcXVpcmVzIGNvbmZpZ3VyaW5nIHlvdXIgbWFpbGVy
IHRvIHF1b3RlIHJlcGxpZXMgcHJvcGVybHkgKGkuZS4gcHV0ID4KPj4+Pj4+IG1hcmtlcnMKPj4+
Pj4+IGluIGZyb250IG9mIGVhY2ggbGluZSkuCj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IE9uIDExLzEw
LzIwMjEgMTI6MjAsIEVzYcOvZSBMZWRvdXggTkpPTkdTU0kgS09VQU0gd3JvdGU6Cj4+Pj4+Pj4g
aSBoYXZlIHRyaWVkCj4+Pj4+Pj4gZ2l0IGNsb25lIGdpdDovL2dpdC5idWlsZHJvb3QubmV0L2J1
aWxkcm9vdCA8Cj4+Pj4+PiBodHRwOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290Pgo+Pj4+
Pj4+IG1ha2UgcWVtdV94ODZfNjRfZGVmY29uZmlnCj4+Pj4+Pj4gbWFrZQo+Pj4+Pj4+Cj4+Pj4+
Pj4gaSBoYXZlIHR5cGUgaXQgb24gRG9jdW1lbnRzIGZvbGRlciB0aGF0IGhhcyBleHQ0IGZpbGUg
c3lzdGVtCj4+Pj4+Pgo+Pj4+Pj4gICAgQXMgSm9hY2hpbSBhc2tlZCwgY2FuIHlvdSBwcm92aWRl
IHRoZSBvdXRwdXQgb2YKPj4+Pj4+Cj4+Pj4+PiAgICAgICBwd2QKPj4+Pj4+Cj4+Pj4+PiBhbmQK
Pj4+Pj4+Cj4+Pj4+PiAgICAgICBmaW5kbW50Cj4+Pj4+Pgo+Pj4+Pj4gc28gd2UgY2FuIHNlZSBp
ZiB0aGUgZmlsZXN5c3RlbSByZWFsbHkgaXMgZXh0NCwgb3IgaXQgaGFzIHNvbWUgd2VpcmQKPj4+
Pj4+IG1vdW50Cj4+Pj4+PiBvcHRpb24sIG9yIGFueXRoaW5nIGVsc2UgdGhhdCBjb3VsZCBleHBs
YWluIHRoZSBpc3N1ZT8KPj4+Pj4+Cj4+Pj4+PiAgICBZb3UgY2FuIGFsc28gdHJ5Ogo+Pj4+Pj4K
Pj4+Pj4+ICAgICAgIHRvdWNoIGZvbwo+Pj4+Pj4gICAgICAgY2htb2QgNjY2IGZvbwo+Pj4+Pj4K
Pj4+Pj4+IGluIHRoZSBidWlsZHJvb3QgZGlyZWN0b3J5LiBJZiB0aGF0IGdpdmVzIGFuIGVycm9y
LCB0aGVyZSBpcyByZWFsbHkKPj4+Pj4+IHNvbWV0aGluZwo+Pj4+Pj4gd3Jvbmcgd2l0aCB5b3Vy
IE9TLgo+Pj4+Pj4KPj4+Pj4+ICAgIFJlZ2FyZHMsCj4+Pj4+PiAgICBBcm5vdXQKPj4+Pj4+ICAg
Cj4+Pj4+Pj4KPj4+Pj4+Pgo+Pj4+Pj4+IHN0aWxsIG5vdyBpIGhhdmUgdGhlIHNhbWUgZXJyb3IK
Pj4+Pj4+Pgo+Pj4+Pj4+IExlIGRpbS4gMTAgb2N0LiAyMDIxIMOgIDIxOjU3LCBKb2FjaGltIFdp
YmVyZyA8dHJvZ2xvYml0QGdtYWlsLmNvbQo+Pj4+Pj4+IDxtYWlsdG86dHJvZ2xvYml0QGdtYWls
LmNvbT4+IGEgw6ljcml0IDoKPj4+Pj4+Pgo+Pj4+Pj4+ICAgICAgSGksCj4+Pj4+Pj4KPj4+Pj4+
PiAgICAgIE9uIDEwLzEwLzIxIDY6NTIgUE0sIEVzYcOvZSBMZWRvdXggTkpPTkdTU0kgS09VQU0g
d3JvdGU6Cj4+Pj4+Pj4gICAgICAgPiBubyBmaWxlc3lzdGVtIGhhcyBiZWVuIGNvbmZpZ3VyZWQg
Li4uCj4+Pj4+Pj4gICAgICAgPiBJJ20ganVzdCB0cnlpbmcgdGhlIGRlZmF1bHQgY29uZmlndXJh
dGlvbgo+Pj4+Pj4+Cj4+Pj4+Pj4gICAgICBUaGlzIGlzIGZpbmUuICBJIHRoaW5rIHlvdSd2ZSBn
b3Qgc29tZXRoaW5nIHJlYWxseSB3cm9uZyB3aXRoIHlvdXIKPj4+Pj4+PiAgICAgIEthbGkgTGlu
dXggaG9zdCBzeXN0ZW0uCj4+Pj4+Pj4gICAKPj4+Pj4+PiAgICAgICA+IHNob3VsZCBpIGNvbmZp
Z3VyZSBmaWxlIHN5c3RlbSBmb3IgbXkgYnVpbGRyb290ID8/Cj4+Pj4+Pj4KPj4+Pj4+PiAgICAg
IE5vLCB3ZSBtZWFuIHRoZSBmaWxlIHN5c3RlbSB5b3UgYXJlIHVzaW5nIGZvciBidWlsZGluZyBC
dWlsZHJvb3QKPj4+Pj4+IG9uLAo+Pj4+Pj4+ICAgICAgaW4geW91ciBLYWxpIExpbnV4IGluc3Rh
bGwuICBUaGUgcnN5bmMgZXJyb3IgbG9va3MgYXMgaWYgeW91ciBkaXNrCj4+Pj4+Pj4gICAgICBw
YXJ0aXRpb24gaXMgYSBub24tbmF0aXZlIExpbnV4IGZpbGUgc3lzdGVtLCBsaWtlIEZBVCwgd2hp
Y2ggZG9lcwo+Pj4+Pj4+ICAgICAgbm90IHN1cHBvcnQgdGhlIG9wZXJhdGlvbnMgcnN5bmMgdHJp
ZXMgdG8gcGVyZm9ybS4KPj4+Pj4+Pgo+Pj4+Pj4+ICAgICAgSG93IGhhdmUgeW91IHNldCB1cCB5
b3VyIEthbGkgTGludXg/ICBEbyB5b3UgaGF2ZSB0aGUgYnVpbGRyb290Cj4+Pj4+PiBnaXQKPj4+
Pj4+PiAgICAgIHNvdXJjZXMgY2hlY2tlZCBvdXQgdG8geW91ciBob21lIGRpcmVjdG9yeSBvciBz
b21lIG90aGVyCj4+Pj4+PiBkaXJlY3RvcnksCj4+Pj4+Pj4gICAgICBwZXJoYXBzIHNoYXJlZCB3
aXRoIFdpbmRvd3M/ICBJZiBzbywgSSdkIGRlZmluaXRlbHkgYXZvaWQgdGhhdC4KPj4+Pj4+IFlv
dQo+Pj4+Pj4+ICAgICAgY2FuIGNoZWNrIHRoZSBmaWxlc3lzdGVtIG9mIHlvdXIgYnVpbGQgZGly
ZWN0b3J5IGJ5IGNvbXBhcmluZyB0aGUKPj4+Pj4+PiAgICAgIG91dHB1dCBvZgo+Pj4+Pj4+Cj4+
Pj4+Pj4gICAgICAgICAgcHdkCj4+Pj4+Pj4KPj4+Pj4+PiAgICAgIHdpdGggdGhlIG91dHB1dCBm
cm9tCj4+Pj4+Pj4KPj4+Pj4+PiAgICAgICAgICBmaW5kbW50Cj4+Pj4+Pj4KPj4+Pj4+PiAgICAg
IE9uIG15IHN5c3RlbSBJIGhhdmUgZXh0NCBpbiB0aGUgRlNUWVBFIGNvbHVtbiBmb3IgbXkgaG9t
ZQo+Pj4+Pj4gZGlyZWN0b3J5LAo+Pj4+Pj4+ICAgICAgd2hpY2ggaXMgaW4gdGhlIC8gVEFSR0VU
Lgo+Pj4+Pj4+Cj4+Pj4+Pj4gICAgICBJIGZpbmlzaGVkIG15IGluc3RhbGwgb2YgS2FsaSBpbiBt
eSBvd24gVk0uICBJdCBjcmFzaGVkIGJhZGx5Cj4+Pj4+PiBiZWZvcmUKPj4+Pj4+PiAgICAgIEkg
Z2F2ZSBpdCBlbm91Z2ggZGlzayAoNDAgR2lCKSBhbmQgUkFNICg0IEdpQikuICBUaGF0J3MgYW5v
dGhlcgo+Pj4+Pj4gdGhpbmcKPj4+Pj4+PiAgICAgIHRoYXQgbWlnaHQgaGF2ZSBtZXNzZWQgdXAg
eW91ciBidWlsZCB0cmVlLgo+Pj4+Pj4+ICAgCj4+Pj4+Pj4gICAgICAgPiB0aGUgZXJyb3IgcGVy
c2lzdHMgZXZlbiBpZiBpIGNvbXBpbGUgaXQgYXMgbm9ybWFsIHVzZXIKPj4+Pj4+Pgo+Pj4+Pj4+
ICAgICAgV2VsbCB0aGF0J3MgZ29vZCB0byBrbm93LCBhdCBsZWFzdCBpdCdzIGNvbnNpc3RlbnQu
ICBKdXN0IGJld2FyZQo+Pj4+Pj4+ICAgICAgdGhhdCBpZiB5b3UgcmV1c2UgdGhlIHNhbWUgc291
cmNlIHRyZWUsIGhhdmluZyBzd2l0Y2hlZCB0byBhbm90aGVyCj4+Pj4+Pj4gICAgICB1c2VyLCBh
IGxvdCBvZiBmaWxlcyBtYXkgc3RpbGwgaGF2ZSByb290IGFzIHRoZSBvd25lciwgd2hpY2ggbWF5
Cj4+Pj4+Pj4gICAgICBnaXZlIHlvdSBvdGhlciBwcm9ibGVtcy4gIEVpdGhlciBgc3VkbyBjaG93
biAtUiB1c2VyOnVzZXIgLmAgZnJvbQo+Pj4+Pj4+ICAgICAgaW5zaWRlIHRoZSBCdWlsZHJvb3Qg
c291cmNlIHRyZWUsIG9yIGNoZWNrIG91dCBhIG5ldyB0cmVlLgo+Pj4+Pj4+Cj4+Pj4+Pj4gICAg
ICBCZXN0IHJlZ2FyZHMKPj4+Pj4+PiAgICAgICAgL0pvYWNoaW0KPj4+Pj4+Pgo+Pj4+Pj4+Cj4+
Pj4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+
Pj4+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+Pj4+Pj4gYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKPj4+Pj4+PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QKPj4+Pj4+PiAgIAo+Pj4+Pj4gICAKPj4+Pj4gICAKPiAKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
