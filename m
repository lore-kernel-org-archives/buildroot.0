Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB57C4345F
	for <buildroot@archiver.kernel.org>; Wed, 17 Apr 2024 18:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7AB860689;
	Wed, 17 Apr 2024 18:26:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8tJA2LnqlS12; Wed, 17 Apr 2024 18:26:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A24876068F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A24876068F;
	Wed, 17 Apr 2024 18:26:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1FD5F1BF423
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 18:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C81C6068F
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 18:26:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DlVqlvbhhN1W for <buildroot@lists.busybox.net>;
 Wed, 17 Apr 2024 18:26:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=66.163.187.32;
 helo=sonic308-9.consmr.mail.ne1.yahoo.com;
 envelope-from=dterry_engineer@yahoo.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0149460689
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0149460689
Received: from sonic308-9.consmr.mail.ne1.yahoo.com
 (sonic308-9.consmr.mail.ne1.yahoo.com [66.163.187.32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0149460689
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 18:26:15 +0000 (UTC)
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1713378374; bh=9tCI74Q7zmkEyHjn4kiVRw3fecZpfV/ntsz2sDkUO7i=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=PCPfn94o0ywcN6Cun6Yi6AhPV3wBdFXaQSgmvoxJHBJ7ZCZPWnR8QilZF0IWpIDB9g/ybCXq1NmnDfmTRUboSBQnmlCQhRSiwB5QPhDfM6NZu9bi7/Vnlb2JXSG05TlD5RwueV8iVPUfn2nXkQuoSuUj7BGyd/bthG0E4H9QHAakBdf5207O8I2o5RqplAULXIIkFlM9421P/85Gw0IK04Dj7dJaOlVsaGvD7VMiemCV1mB7S4CtHdAsVrjRMUdjFWqV0bUhvwsegWrgx2b3imliNthK0+aMIjD1yaVTRbMfo6362toy+kTlYhwfzvwLDZqLhNCmu2hL7FQejJeKBg==
X-YMail-OSG: yYIpuc0VM1lUz4uxscf.sWEOR4Kb0rMapmFXTXKMmCtcBtDGiGhNv2CZ2vHL1_x
 hNJNaro.MvLTsgYQceI_vOfSY1BGBPWMUVFEZRVtQoG9hvRUQ6VwNZJotRdBlUat8jVGLKz7ucIJ
 w9fOD63mjM6HrEVnUUTmVuktLOE5BYn35h0AiUCc0ljNkPH.fHTsSGXm.QwIsk75VLskgdcMoi5H
 _KJLJ_BCjZctwve2A8mOQNCufpZfUETby6ez9kK5f7LmH9L_T1kksEPh.KeWmHm6R2FV2z4l5DEv
 QfAHXWErSTtrWKUZgrt0Prmgxa7cDXbZtVQPtfOzk1y1omFNy39ivFF8Qu7P58Xz0vCRwqfqPS4H
 T5MErA3pbjf3I_wr7F4QaUwoOfmDurgBCkybKEbHrz7XhV9oy2ZRYRcrcnZfkxqOcIBfFGa1a8Aa
 83qdaBjJA0NYC.CbnQiSqgvXa3TBmkHvS2plAu287EczD.RL3MOG2bxyQI1dvhPGSMZNnRDDw..v
 bMgZQTkQ5L3h_Qj7iWgCMQEukrh_Zsr3vCpD0d_4wbKJLEQefuo2yU9UIH7jFYwboh_rXxrM51Qa
 4LDBaykxgUXGdxM5B21PeP7nCIcFBjEsE0Cd6TIEXOIz_AhiodY9hzeMiqrvGZJpHcEH9bnYMo6j
 mdw7SZZkw2y7tsSxdAQes9Cb07wdmFk3B5NVVHCKCdGyCAzjBIK.qVisqSiyo1khm3Rt5MnPZqzW
 .Ccm6VKUQfaBDuAk_iImeDlayIsLL0qrRSXne8eks6g9O5RaBAfJHcBEsuFMl1dpP7RNmO4UUkdM
 X5lpoIFyPaPSDLIGAUsKWCvoVlv6Zb6DwK1gNwO2756ABtk4V0Zpy1WgdyiNKbNmEXLr9P11k.nr
 b9xKZQPi0cejwYBkVNnA3woAYecpmodcXMj0fJldex4bAc2FklLvrBd25XwiSZVA4xSs3s30Fv9n
 fOViYLpsLpwAvSh6_p7HZP_cKIaGvXOj5VpHYHqRn4ij_z4W9KcXFwlyjI3Oz.AtddwA15Us2YL1
 teaVFW8nkHD4OHGP6pmVdDuHKW1RR4HMWPoKQsWCMH6zujxtpI22ykaqqvFR5XBtzBsaFOqAFfGO
 yGj2TR3QGHOt8m10zBmXJla_JsqyfrseQfO9K7tVuiQMKzwyAl7wie7IdwPbrduElB155ADPfEGk
 dEffaC3L897.ADpvpqoptre6F5x7o_Pq2brRMH.ciIi3HUypIefNbQGwhX12bSz2Gkze9dtBRWxd
 6beFYIu1faGMX1_SzznEK2RF2BmahuDHylHGZR84i7SIJ7t.IDxpezxApobTvcvSEhlfJi.AFSQn
 8vAT0SrOAeoLsEjrgQvlB1T.cQKqmwuwf69kc5El_6ukqaJszbDIWA2TwmQKR44QlsCnbYD73B3D
 efNIKnIZDZvFiFZKp3qeK8JyAcUPFuvaMHd9ZVCfEZTKad2dQdwz2BqSvV2WWabZtiDcJwfGp6U1
 Xb.GU.PAI66m0jPjyHCdaKOycZkZ8RTRZUFxtNiXbGnmtI6klfYwPAcKTJe_dDCymtr0.oQIs.ky
 LPZC73.K5cudzUF1iha82YCY7xN130CjIqxaVATGkHCRYpjoS.2j9GZE4bUA7BvLJ2v_Xna_6GkV
 dv9fUKTTlhI5RfMUIWoVLDDg4Mgpz8yDMWtoMtb5CRNTjDUUqYRHiumirEHM2D7.qGdLqDLK8hCn
 YNMZZOK1XCX_LhmHHSllw2I1oS2DfuXF5eBq_0nI0Zbffn95DRlms6_XD8QyQ8E7JXwn_IvJrgRD
 to541dAxo8fM8u8_2OAJMthUwYk0bBRZ3D1_eV8al2tD2bmFgoByTFT_2sZNLZ86UgS8Z6Np05KT
 .1MpuRdxkmGWQgxcgolDeghKjTbO6MkLb9dRIWl4LDBOR0BM.O7j4Rm58UVE7qZCujEq_V7Xz0hG
 OGsYAR7j_u6acv8DxF._QM7yvB.4Y3riSRVPWuqMu0Q8JbXQLC6dW.GsN2OAxBrNqD58wiP_.8Ju
 JWvnF4VAqdB4yZqrR336DpH8nuRWAYkst8fwoqtcmjhAlXf4nTGIOezeO8deInkUCxaRHBC_ifpi
 _d4xa9oCCmyk1w.oF1uIgoUbv.L1XsgGZhlywz4KRaXHVN1F1usgkcBi6dcGMnaol95TNBVaR74P
 rvHCu69yHP3LGW.yL9ZQ8opPzzW89Fy_dNRcpzDbfDRWwJDGwfQNjkw6xfgdC5rYWA39uWEki7Jb
 bxlPu6r_KPzhbybRHFP4yXy8RtYAjPEghCpkC6amaM.LLu2mIygw4xmflmdMtegP8EHC0kGCROrs
 aIkP0As0qJ__MaCty9l65RYAINPIAW2zNxg--
X-Sonic-MF: <dterry_engineer@yahoo.com>
X-Sonic-ID: 9c59634a-1bb3-4205-a5b9-3418c0d71779
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.ne1.yahoo.com with HTTP; Wed, 17 Apr 2024 18:26:14 +0000
Received: by hermes--production-bf1-5cc9fc94c8-66v88 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 1f5c5c2fb667bae18659282c1becc1f2; 
 Wed, 17 Apr 2024 18:26:13 +0000 (UTC)
Message-ID: <37ec60b9-d7db-440c-a8d4-2993ae9c6a16@yahoo.com>
Date: Wed, 17 Apr 2024 13:26:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Andrea Calabrese <andrea.calabrese@amarulasolutions.com>
References: <e2634bc6-2e68-4331-8354-49407b40f191.ref@yahoo.com>
 <e2634bc6-2e68-4331-8354-49407b40f191@yahoo.com>
 <6068206a-9a0c-4ef4-a5bb-9e6f35218297@benettiengineering.com>
 <d144cbba-9be6-477f-9a79-e72361487734@yahoo.com>
 <CAOf5uwmQBtHf9w7vjxyxDjFuaQj=uv4a0OpLHJ1MNg5V3PjNwQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAOf5uwmQBtHf9w7vjxyxDjFuaQj=uv4a0OpLHJ1MNg5V3PjNwQ@mail.gmail.com>
X-Mailer: WebService/1.1.22256
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yahoo.com; s=s2048; t=1713378374;
 bh=t+mKSzylGgDjV9PmpvQ9oSQW3isbEmcT/du0tqCJaJs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To;
 b=bbbI8/vjlaG+e+g00YY86+MAgM6aO54j5BdrylFNTHaHw5tKSoyCixDiR49+hmdG5nwe+uIPvM24Pbs3Z37XzuqFU6oO1S4Q3UU3xFsLa0SDwnpm5Q4j+15s2e/5kM2YTF+qdZ/QHPfXk0wgUNvH6te2XS4ykjpDh69DFO/lhF5WNnXrebZVD1OI3Tt3RnApgIDy0TWwKlY9VG3Vp8+sDjyDWHfipiEYWWpb/c8hD09FgQSP+Va8TjqEVPOp6bUfZSNC6vHgStTPqbrluPbPmxcGCit0i1KoHaReiRfw2AU0Jd31ooUH6vXqe0Y5wsufmQTpZODxAJyR/cvhalibGA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=yahoo.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com
 header.a=rsa-sha256 header.s=s2048 header.b=bbbI8/vj
Subject: Re: [Buildroot] Problem with device tree
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
From: DTrustee via buildroot <buildroot@buildroot.org>
Reply-To: DTrustee <dterry_engineer@yahoo.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SSBhbSBidWlsZGluZyBmb3IgdGhlIEJlYWdsZWJvbmUgQmxhY2sgd2hpY2ggaXMgY29udmVuaWVu
dCBhcyB0aGUgCkJvb3RsaW4gdHJhaW5pbmcgdXNlcyB0aGUgd2lyZWxlc3MgdmVyc2lvbiBvZiB0
aGF0IGJvYXJkLiBJIGhvcGUgSSBhbSAKZG9pbmcgdGhlIHJpZ2h0IHRoaW5nIGJ5IGluY2x1ZGlu
ZyBldmVyeW9uZSBvbiB0aGUgYWRkcmVzcyBsaXN0IG9mIHRoaXMgCnRocmVhZCwgZG9uJ3Qgd2Fu
dCB0byBmaWxsIHVwIHBlb3BsZSdzIGluYm94IG5lZWRsZXNzbHkuCgpIYXZlIGEgQmxlc3NlZCBk
YXkhCgpEb24KCk9uIDQvMTcvMjQgMTE6MjkgQU0sIE1pY2hhZWwgTmF6emFyZW5vIFRyaW1hcmNo
aSB3cm90ZToKPiBIaQo+Cj4gT24gV2VkLCBBcHIgMTcsIDIwMjQgYXQgNjoyNeKAr1BNIERUcnVz
dGVlIHZpYSBidWlsZHJvb3QKPiA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgo+PiBJ
IGtub3cgeW91IGFyZSBhbGwgYnVzeSwgZG9uJ3QgbWVhbiB0byBidWcgYW55b25lIGJ1dCBJIGNh
bm5vdCBnZXQKPj4gYnVpbGRyb290IHRvIG1ha2Ugd2l0aG91dCBlcnJvcnMuIEkgaGF2ZSBubyBp
ZGVhIHdoeSAib3BlcmF0b3IgJzwnIGhhcwo+PiBubyBsZWZ0IG9wZXJhbmQiIGlzIGdlbmVyYXRl
ZCBvciB3aGljaCBpbmNsdWRlIGZpbGUgaXMgdGhlIGNhdXNlLiBJCj4+IHRydWx5IGFwcHJlY2lh
dGUgeW91ciBoZWxwLiBJcyB0aGVyZSBkb2N1bWVudGF0aW9uIHRoYXQgd2Fsa3MgdGhyb3VnaAo+
PiB0aGUgYnVpbGQgcHJvY2Vzcz8gSSBoYXZlIGxvb2tlZCBhdCB0aGUgQm9vdGxpbiB0cmFpbmlu
ZyBidXQgaXQgaXMKPj4gc2V2ZXJhbCB5ZWFycyBvbGQgbm93IGFuZCBvdXQgb2YgZGF0ZS4KPiBZ
b3UgYXJlIHRyeWluZyB0byBidWlsZCBhIHVib290IGJvYXJkIHRoYXQgaGFzIG5vdCBpbmNsdWRl
IG9mIHRoZQo+IEtjb25maWcgb2YgaXQuICBJIHRoaW5rIHRoYXQgeW91Cj4gaGF2ZSBqdXN0IGEg
YnJva2VuIHVib290LiBXaGF0IGNvbmZpZ3VyYXRpb24gb3IgYm9hcmQgYXJlIHlvdSBidWlsZGlu
Zz8KPgo+IE1pY2hhZWwKPgo+Cj4+IEJ1aWxkbG9nIGlzCj4+Cj4+IGh0dHBzOi8vcGFzdGViaW4u
Y29tL0VxdDZ6aTlhCj4+Cj4+IGNvbmZpZyBpcwo+Pgo+PiBodHRwczovL3Bhc3RlYmluLmNvbS84
UDJoQjl1WQo+Pgo+PiBidWlsZHJvb3QgMjAyNC4wMi4xCj4+Cj4+IEhhdmUgYSBCbGVzc2VkIGRh
eSEKPj4KPj4gRG9uCj4+Cj4+Cj4+Cj4+IE9uIDQvOS8yNCA0OjU5IFBNLCBHaXVsaW8gQmVuZXR0
aSB3cm90ZToKPj4+IEhpIERvbiwKPj4+Cj4+PiBPbiAwOS8wNC8yNCAyMzoyMywgRG9uIHZpYSBi
dWlsZHJvb3Qgd3JvdGU6Cj4+Pj4gVGhpcyBpcyBteSBmaXJzdCB0aW1lIHVzaW5nIGJ1aWxkcm9v
dC4gRm9sbG93aW5nIHRoZSBpbnN0cnVjdGlvbnMgb2YKPj4+PiBib290bGluLmNvbS9kb2MvdHJh
aW5pbmcvYnVpbGRyb290L2J1aWxkcm9vdC1sYWJzLnBkZiwgYnVpbGRpbmcgZm9yCj4+Pj4gQmVh
Z2xlYm9uZSBCbGFjayB0aG91Z2ggbm90IHRoZSB3aXJlbGVzcyBvZiB0aGUgdHJhaW5pbmcgcGRm
LiBVbmRlcgo+Pj4+IEtlcm5lbCAtIHNlbGVjdGVkIGRldmljZSB0cmVlIGJsb2IgYW5kIGluLXRy
ZWUgZGV2aWNlIHRyZWUgbmFtZSBJIHB1dAo+Pj4+IGFtMzM1eC1ib25lYmxhY2suIEhvd2V2ZXIg
SSBnZXQKPj4+Pgo+Pj4+IERldmljZSBUcmVlIFNvdXJjZSAoYXJjaC9hcm0vZHRzL2FtMzM1eC0u
ZHRiKSBpcyBub3QgY29ycmVjdGx5Cj4+Pj4gc3BlY2lmaWVkLgo+Pj4+IFBsZWFzZSBkZWZpbmUg
J0NPTkZJR19ERUZBVUxUX0RFVklDRV9UUkVFJwo+Pj4+IG9yIGJ1aWxkIHdpdGggJ0RFVklDRV9U
UkVFPTxkZXZpY2VfdHJlZT4nIGFyZ3VtZW50Cj4+Pj4KPj4+PiBXaGF0IGRvZXMgaXQgd2FudD8g
U29tZXRoaW5nIGlzIG1pc3NpbmcgYnV0IEkgZG9uJ3Qga25vdyB3aGF0Lgo+Pj4gU3RhcnRpbmcg
ZnJvbSAgTGludXggdmVyc2lvbiA2LjVbMF0geW91IGhhdmUgdG8gc3BlY2lmeSB0aGUKPj4+IG1h
bnVmYWN0dXJlciBmb2xkZXIgdG9vIGNvbXBhcmVkIHRvIHByZXZpb3VzIHZlcnNpb25zKGkuZS4g
Ni40WzFdKS4gU28KPj4+IGlmIHlvdSdyZSB1c2luZyBhIGtlcm5lbCBuZXdlciB0aGFuIDYuNSB5
b3UgaGF2ZSB0byBzcGVjaWZ5IHNvbWV0aGluZwo+Pj4gbGlrZToKPj4+IGFyY2gvYXJtL2R0cy90
aS9vbWFwL2FtMzM1eC0uZHRiCj4+Pgo+Pj4gSG9wZSB0aGlzIGhlbHBzLgo+Pj4KPj4+IFswXTog
aHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuNS1yYzEvc291cmNlL2FyY2gvYXJt
L2Jvb3QvZHRzCj4+PiBbMV06IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjQu
MTYvc291cmNlL2FyY2gvYXJtL2Jvb3QvZHRzCj4+Pgo+Pj4gQmVzdCByZWdhcmRzCj4+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKPj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4KPgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
