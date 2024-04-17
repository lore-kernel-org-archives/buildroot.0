Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07619C4345F
	for <buildroot@archiver.kernel.org>; Wed, 17 Apr 2024 19:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B064A4046D;
	Wed, 17 Apr 2024 19:00:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1eKxLPESCHFB; Wed, 17 Apr 2024 19:00:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AEFF4053B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AEFF4053B;
	Wed, 17 Apr 2024 19:00:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C71521BF25F
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 18:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B20A74053B
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 18:59:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iTk_RFu7wQBY for <buildroot@lists.busybox.net>;
 Wed, 17 Apr 2024 18:59:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=66.163.184.147;
 helo=sonic309-21.consmr.mail.ne1.yahoo.com;
 envelope-from=dterry_engineer@yahoo.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A2C714046D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2C714046D
Received: from sonic309-21.consmr.mail.ne1.yahoo.com
 (sonic309-21.consmr.mail.ne1.yahoo.com [66.163.184.147])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A2C714046D
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 18:59:55 +0000 (UTC)
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1713380394; bh=L4JYc58sKetZx2e3EL9DcJhCXH3CQFUvAmBnhXXJXcU=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=TsVacD/abMlkpZB/MXR4HWPv6xDlwvEbAqne+Kr1FdorMDZsomCWRQ9dtLrfqKi2rf1TuY0l9DK2Q3bCZveZ70IlP6zXsNjCPzqYMkBXpEtWqCsnnpgjk9U4U0ehYzstLOZSIkUw6mqaEq5n62kuiQnWolJEDCOLRRHkD/dpjcx+sJkU9Aei/VcT3ZgVWcjSW6ZN5d0udgj1wdP2m59gfcBsh76CZSrbjTngf9NzFE61HquTxuZJwcvpIty0xFKoO3KAhMhPXZbrWO95sSslxjZ4JT0bQJBu2Up9EI/NEfATIXqrsGslXOo2bcSH8CLDuwKfJS0MKqodYjK9KI7Exw==
X-YMail-OSG: h6x75G8VM1lbd7Lkrjmq16ecRkAl_AnakmlKl0wCLU5mZtRFbm635FY4y_E9LcT
 Ae3xw_vTIRvlfgCTtlw1aUrszEqkItWV31yezu6e5nNbONZW0OpUTombrCC3vz_CqaWKjo00U3vZ
 JUiE22VDfyZx5KJ82OAxY0fwWsa.YmjDh7kO9fdE5xqt9NkJjLf1sjxPeVMLBU8ZKpOwZyWJUqtG
 0plrRY5dQq5Ce10yI7xbb.vW0pI.LvGbOwecfEqSgc.FnOpmmFujk50wP4fWxbgC8x.p.QczYEur
 aa_0WVleWrtVfrkkVZkYmeP.3M.RaTE1kvKSiseExoiu46rWbRrTMHE84gJ6NTkUyrtrw0Fy7yOZ
 _GiI9hYy5E.SoCwUIINrrq02ksHc4ILjatqIcM1sQab7STaS68ZadnE4y8ATXZ8_bjftAKmXWxzX
 TPnvzXokZX1cDmgh_kkw_s2kRndwD2OWcPdpvO9pnUu4.0pPwpYNUkUcmoCZENyeMoFAtsqCO3Ui
 _D3bzaijODF7RajsAyXqaojVwxrO.4kTA2oVV0SbSXr0FpGa_mXDZLw0Hy8zDYgFbXdCokruJ_y2
 p85cqV9k0pkLx11TYGSiPZQLDoRtNcn03.1UF.a7Fed7jzfaGmTjs2ta.lnewDKMbiip.JUFpPeX
 C8uXQhhl1clprFjdoB0vAwBQNZQYCjCbOcG5.5WWWQBGMTT21IawHgGHadQIYV4Fc4AkVgO13JyM
 m8h2PRTz2oKVAbbtb37xPRVx1MS8R1.nMQVJz7akVwwaNbbOKsu2yBzeoRxB0P0.oZ9AJapRubns
 lRkuhz0uOl4f4ewilgIKYCRi8iMV_rCbWz2G_f3DMWa58IMrj8eQVtN1jxXI4RV6uaPz6nujpuVC
 .weeTbHAdaCyBJiXMzbSLQrJElBFnPCV7Sfp1.sNR0JOZ.EAD_bSruct0Toomp6UjM1HF2X5D_RA
 ByBkz1zhu3VX4PQiBm556u6bCyKuszf_rGZssdKbUUBovfodzAnJA72tVuqBVs1oNld6ZltZYYb7
 InqWPSxMQ02F0UU.11szjeQIuL1Y_SiHcE_rPRc9SO4QfGw8dzUnltB3uCVsWrjPFkYrz6LvK6BU
 kIuDmfwz1OTIQ20OTJs5.Eihlhb2FRXw4XRarE7VfILsnfyYMq5yXosTJFbQXJy3edosRyJPvoqP
 .d.aBYP8UbCGzeJRiXRN2P83dSQ6sfAX4zZgtzIn7HpiUfQv8r9Lw0DM3iFSCaOTGkc_63zdxW.Z
 yJ9GC0dzPhr.2EgjCs9Hrg86tDlpfJJfL1q_mWNU_Yo5hVL6cXCk0TPo_JTPaUpdqd5WMf3wVmSy
 Bd.Snve83i3DQkxfsHpx_BJQ4XTmJ3JxBu7bxRNjz7N.I4JUQUUvUvWtCEntBA83rO2u3uGwrp_F
 sZws5_IyeC9vfaDl7IBLg8ypJkScU9sdYpo37Wj9C2_PyMrlXfBKi2Q0qWwkgU7OgoPOZn8Z4s3D
 kSkSXmeHmiOVB4Hb4GkQVGsdi6R5xlqMOtVEhUAMKy5b82F_QWinyHfG8.6CxPXbgx_HT6GjKZkO
 _2PAReiVYp.EBnvkhib25O6ih46hNaP22okrsu64O8kOd7sUCBjV6nXupuXJcVvsKNJvGFsEueBa
 dVc9OLNOkbVsc2HKoZb8kY6YFonJBYvbMSSnc9RfTvOtAc4GTJheFQzz1tyxDxtftzb254ferjp8
 LbIBkqCFg6XTNjNwH7zPTfMkSVgMvJ0Il7v4oDJUFMyfCeZkIl1qYQIlj4wvqV5CCPhchAt0B.O6
 ZtMCYEEYioTj.dFQLFSWNDWhp3KFS4BSAkM6TJwDQ.Romvfe3SzIQqVEts_sesOs47KSll7WMSfP
 jVkSNVLQBl33TnNAo7LmwxdVa5pr2m6X2QUH_AWqq1JnP5bxM0IoHcPKh_iGCnWgC2jYfQ04uOLq
 k6mtw7VXvSmdBNvmnO3Majjs1Drk5V9VUWdu_fqlW76MAj3.KGlt1KAPC7J0jWqEUXYJVVf0roTZ
 TIEG_pVkv2bKxvmoZmBFfOC_Cfe2UCsLBC6iJmHEP_d1MRu5.iD0lZZAag1zrJ9K_cwmgRCGpIAE
 Y0vIo3ioIf.4sa6Bysz.9l_2V.1iucbjtAZKpn37XN2PgLXj8l_MafYzvvivkxbA7LGKurMsB_y8
 VaurfhCcTWgUfL7ccrHlxETic0nDL8QeGbLufCtnTC5TSuVcjaxOTGKhRsVY.NN4zLJl6I66PPuu
 jJMm.PUaOtY4oV5Cd9RbWawhHeTyqRtr.0yswcG6nGOLitfSdv.tr1tZoC8SwAjuzKKBHjk3hTAF
 DWk4K4n3kKSx8oL_9AvtNEESE
X-Sonic-MF: <dterry_engineer@yahoo.com>
X-Sonic-ID: 885d6d0a-b6b3-4d43-801a-b3c23e1ba0e9
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.ne1.yahoo.com with HTTP; Wed, 17 Apr 2024 18:59:54 +0000
Received: by hermes--production-bf1-5cc9fc94c8-z5l2w (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 2ae6598f82591742b6defc9cd5b2dd31; 
 Wed, 17 Apr 2024 18:59:52 +0000 (UTC)
Message-ID: <71a73a03-5b7c-425c-959c-8eb516ca565e@yahoo.com>
Date: Wed, 17 Apr 2024 13:59:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
References: <e2634bc6-2e68-4331-8354-49407b40f191.ref@yahoo.com>
 <e2634bc6-2e68-4331-8354-49407b40f191@yahoo.com>
 <6068206a-9a0c-4ef4-a5bb-9e6f35218297@benettiengineering.com>
 <d144cbba-9be6-477f-9a79-e72361487734@yahoo.com>
 <CAOf5uwmQBtHf9w7vjxyxDjFuaQj=uv4a0OpLHJ1MNg5V3PjNwQ@mail.gmail.com>
 <37ec60b9-d7db-440c-a8d4-2993ae9c6a16@yahoo.com>
 <CAOf5uwmOi0V7t7GmwNvrwy8qoKyVnaGJziwZhqPd2jCAZMK5EQ@mail.gmail.com>
 <CAOf5uwkmcuBvXSp0oHuCXQX+HqNP6O52QEvxTWm0hEnF=W2eNw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAOf5uwkmcuBvXSp0oHuCXQX+HqNP6O52QEvxTWm0hEnF=W2eNw@mail.gmail.com>
X-Mailer: WebService/1.1.22256
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yahoo.com; s=s2048; t=1713380394;
 bh=zEKtMxaIUYqA8NPcZ9T1E4VefTyU4hLN3xfmQx+Dstc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To;
 b=NzILTFWNdNelGyBwt+yE6cowWWnb37PF9A0S5rQOu3dvrOXK+cW3qPB/tItbbZhWYsRPg/1sLy55ML12JkoTv/lTsnQweVtPyKy5knqKdXWO3asgSV/ouhg9Mhc7ZlAUmEbN3xweK7NQK0zj/Ewbll7sna9e9onUXYCc6H6RjDGEvBB/20jH4EQoIhAWFMIH390D/n80luEyS/okalQ5asZhD681u72HzGzeqjRAV6WEj+9IPiaKeNBkLLqsixAjSSBsYulun+N4h/RYFNVAwlejLAUrpYFNY6aFZBLXL1LQhyC3m4nA9ZiGyzZxJ/ha4erlE+R6+47n0VoPp3k20g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=yahoo.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com
 header.a=rsa-sha256 header.s=s2048 header.b=NzILTFWN
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
Cc: Andrea Calabrese <andrea.calabrese@amarulasolutions.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SSB3YXMgZm9sbG93aW5nIHRoZSBzdGVwcyBpbiAKaHR0cHM6Ly9ib290bGluLmNvbS9kb2MvdHJh
aW5pbmcvYnVpbGRyb290L2J1aWxkcm9vdC1sYWJzLnBkZiAsIHRoZXkgCmNoYW5nZWQgdGhlIGRl
ZmF1bHQgY29uZmlnIHRvIHNob3cgaG93IGl0IGlzIGRvbmUgcmF0aGVyIHRoYW4gdXNpbmcgCmJl
YWdsZWJvbmVfZGVmY29uZmlnLiBTbyBJIGNoYW5nZWQgVGFyZ2V0IE9wdGlvbnMsIFRvb2xjaGFp
biwgS2VybmVsIGFuZCAKQm9vdGxvYWRlciBtZW51cyBhcyB0aGUgdHV0b3JpYWwgc3VnZ2VzdGVk
IGluIHNlY3Rpb24gQ29uZmlndXJpbmcgCkJ1aWxkcm9vdC4gRGlkIG5vdCBhZGQgYW55IGxvY2Fs
IC5tayAtIGRvIG5vdCBrbm93IHdoYXQgdGhhdCBpcywgdGhpcyBpcyAKbXkgZmlyc3QgYnVpbGQg
d2l0aCBidWlsZHJvb3QuIE5vciBkaWQgSSBvdmVycmlkZSBhbnl0aGluZy4KCkhhdmUgYSBCbGVz
c2VkIGRheSEKCkRvbgoKCk9uIDQvMTcvMjQgMTo0MCBQTSwgTWljaGFlbCBOYXp6YXJlbm8gVHJp
bWFyY2hpIHdyb3RlOgo+IEhpdGhlCj4KPiBPbiBXZWQsIEFwciAxNywgMjAyNCBhdCA4OjM54oCv
UE0gTWljaGFlbCBOYXp6YXJlbm8gVHJpbWFyY2hpCj4gPG1pY2hhZWxAYW1hcnVsYXNvbHV0aW9u
cy5jb20+IHdyb3RlOgo+PiBIaQo+Pgo+PiBPbiBXZWQsIEFwciAxNywgMjAyNCBhdCA4OjI24oCv
UE0gRFRydXN0ZWUgPGR0ZXJyeV9lbmdpbmVlckB5YWhvby5jb20+IHdyb3RlOgo+Pj4gSSBhbSBi
dWlsZGluZyBmb3IgdGhlIEJlYWdsZWJvbmUgQmxhY2sgd2hpY2ggaXMgY29udmVuaWVudCBhcyB0
aGUKPj4+IEJvb3RsaW4gdHJhaW5pbmcgdXNlcyB0aGUgd2lyZWxlc3MgdmVyc2lvbiBvZiB0aGF0
IGJvYXJkLiBJIGhvcGUgSSBhbQo+Pj4gZG9pbmcgdGhlIHJpZ2h0IHRoaW5nIGJ5IGluY2x1ZGlu
ZyBldmVyeW9uZSBvbiB0aGUgYWRkcmVzcyBsaXN0IG9mIHRoaXMKPj4+IHRocmVhZCwgZG9uJ3Qg
d2FudCB0byBmaWxsIHVwIHBlb3BsZSdzIGluYm94IG5lZWRsZXNzbHkuCj4+Pgo+PiBQbGVhc2Ug
cHJvdmlkZSB0aGUgc3RlcHMgaGVyZQo+IG1ha2UgYmVhZ2xlYm9uZV9kZWZjb25maWcKPgo+IG1h
a2UKPgo+IFJpZ2h0Pwo+PiBNaWNoYWVsCj4+Cj4+PiBIYXZlIGEgQmxlc3NlZCBkYXkhCj4+Pgo+
Pj4gRG9uCj4+Pgo+Pj4gT24gNC8xNy8yNCAxMToyOSBBTSwgTWljaGFlbCBOYXp6YXJlbm8gVHJp
bWFyY2hpIHdyb3RlOgo+Pj4+IEhpCj4+Pj4KPj4+PiBPbiBXZWQsIEFwciAxNywgMjAyNCBhdCA2
OjI14oCvUE0gRFRydXN0ZWUgdmlhIGJ1aWxkcm9vdAo+Pj4+IDxidWlsZHJvb3RAYnVpbGRyb290
Lm9yZz4gd3JvdGU6Cj4+Pj4+IEkga25vdyB5b3UgYXJlIGFsbCBidXN5LCBkb24ndCBtZWFuIHRv
IGJ1ZyBhbnlvbmUgYnV0IEkgY2Fubm90IGdldAo+Pj4+PiBidWlsZHJvb3QgdG8gbWFrZSB3aXRo
b3V0IGVycm9ycy4gSSBoYXZlIG5vIGlkZWEgd2h5ICJvcGVyYXRvciAnPCcgaGFzCj4+Pj4+IG5v
IGxlZnQgb3BlcmFuZCIgaXMgZ2VuZXJhdGVkIG9yIHdoaWNoIGluY2x1ZGUgZmlsZSBpcyB0aGUg
Y2F1c2UuIEkKPj4+Pj4gdHJ1bHkgYXBwcmVjaWF0ZSB5b3VyIGhlbHAuIElzIHRoZXJlIGRvY3Vt
ZW50YXRpb24gdGhhdCB3YWxrcyB0aHJvdWdoCj4+Pj4+IHRoZSBidWlsZCBwcm9jZXNzPyBJIGhh
dmUgbG9va2VkIGF0IHRoZSBCb290bGluIHRyYWluaW5nIGJ1dCBpdCBpcwo+Pj4+PiBzZXZlcmFs
IHllYXJzIG9sZCBub3cgYW5kIG91dCBvZiBkYXRlLgo+Pj4+IFlvdSBhcmUgdHJ5aW5nIHRvIGJ1
aWxkIGEgdWJvb3QgYm9hcmQgdGhhdCBoYXMgbm90IGluY2x1ZGUgb2YgdGhlCj4+Pj4gS2NvbmZp
ZyBvZiBpdC4gIEkgdGhpbmsgdGhhdCB5b3UKPj4+PiBoYXZlIGp1c3QgYSBicm9rZW4gdWJvb3Qu
IFdoYXQgY29uZmlndXJhdGlvbiBvciBib2FyZCBhcmUgeW91IGJ1aWxkaW5nPwo+Pj4+Cj4+Pj4g
TWljaGFlbAo+Pj4+Cj4+Pj4KPj4+Pj4gQnVpbGRsb2cgaXMKPj4+Pj4KPj4+Pj4gaHR0cHM6Ly9w
YXN0ZWJpbi5jb20vRXF0NnppOWEKPj4+Pj4KPj4+Pj4gY29uZmlnIGlzCj4+Pj4+Cj4+Pj4+IGh0
dHBzOi8vcGFzdGViaW4uY29tLzhQMmhCOXVZCj4+Pj4+Cj4+Pj4+IGJ1aWxkcm9vdCAyMDI0LjAy
LjEKPj4+Pj4KPj4+Pj4gSGF2ZSBhIEJsZXNzZWQgZGF5IQo+Pj4+Pgo+Pj4+PiBEb24KPj4+Pj4K
Pj4+Pj4KPj4+Pj4KPj4+Pj4gT24gNC85LzI0IDQ6NTkgUE0sIEdpdWxpbyBCZW5ldHRpIHdyb3Rl
Ogo+Pj4+Pj4gSGkgRG9uLAo+Pj4+Pj4KPj4+Pj4+IE9uIDA5LzA0LzI0IDIzOjIzLCBEb24gdmlh
IGJ1aWxkcm9vdCB3cm90ZToKPj4+Pj4+PiBUaGlzIGlzIG15IGZpcnN0IHRpbWUgdXNpbmcgYnVp
bGRyb290LiBGb2xsb3dpbmcgdGhlIGluc3RydWN0aW9ucyBvZgo+Pj4+Pj4+IGJvb3RsaW4uY29t
L2RvYy90cmFpbmluZy9idWlsZHJvb3QvYnVpbGRyb290LWxhYnMucGRmLCBidWlsZGluZyBmb3IK
Pj4+Pj4+PiBCZWFnbGVib25lIEJsYWNrIHRob3VnaCBub3QgdGhlIHdpcmVsZXNzIG9mIHRoZSB0
cmFpbmluZyBwZGYuIFVuZGVyCj4+Pj4+Pj4gS2VybmVsIC0gc2VsZWN0ZWQgZGV2aWNlIHRyZWUg
YmxvYiBhbmQgaW4tdHJlZSBkZXZpY2UgdHJlZSBuYW1lIEkgcHV0Cj4+Pj4+Pj4gYW0zMzV4LWJv
bmVibGFjay4gSG93ZXZlciBJIGdldAo+Pj4+Pj4+Cj4+Pj4+Pj4gRGV2aWNlIFRyZWUgU291cmNl
IChhcmNoL2FybS9kdHMvYW0zMzV4LS5kdGIpIGlzIG5vdCBjb3JyZWN0bHkKPj4+Pj4+PiBzcGVj
aWZpZWQuCj4+Pj4+Pj4gUGxlYXNlIGRlZmluZSAnQ09ORklHX0RFRkFVTFRfREVWSUNFX1RSRUUn
Cj4+Pj4+Pj4gb3IgYnVpbGQgd2l0aCAnREVWSUNFX1RSRUU9PGRldmljZV90cmVlPicgYXJndW1l
bnQKPj4+Pj4+Pgo+Pj4+Pj4+IFdoYXQgZG9lcyBpdCB3YW50PyBTb21ldGhpbmcgaXMgbWlzc2lu
ZyBidXQgSSBkb24ndCBrbm93IHdoYXQuCj4+Pj4+PiBTdGFydGluZyBmcm9tICBMaW51eCB2ZXJz
aW9uIDYuNVswXSB5b3UgaGF2ZSB0byBzcGVjaWZ5IHRoZQo+Pj4+Pj4gbWFudWZhY3R1cmVyIGZv
bGRlciB0b28gY29tcGFyZWQgdG8gcHJldmlvdXMgdmVyc2lvbnMoaS5lLiA2LjRbMV0pLiBTbwo+
Pj4+Pj4gaWYgeW91J3JlIHVzaW5nIGEga2VybmVsIG5ld2VyIHRoYW4gNi41IHlvdSBoYXZlIHRv
IHNwZWNpZnkgc29tZXRoaW5nCj4+Pj4+PiBsaWtlOgo+Pj4+Pj4gYXJjaC9hcm0vZHRzL3RpL29t
YXAvYW0zMzV4LS5kdGIKPj4+Pj4+Cj4+Pj4+PiBIb3BlIHRoaXMgaGVscHMuCj4+Pj4+Pgo+Pj4+
Pj4gWzBdOiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni41LXJjMS9zb3VyY2Uv
YXJjaC9hcm0vYm9vdC9kdHMKPj4+Pj4+IFsxXTogaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20v
bGludXgvdjYuNC4xNi9zb3VyY2UvYXJjaC9hcm0vYm9vdC9kdHMKPj4+Pj4+Cj4+Pj4+PiBCZXN0
IHJlZ2FyZHMKPj4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPj4+Pj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+Pj4+PiBidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwo+Pj4+PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QKPj4+Pgo+Pgo+Pgo+PiAtLQo+PiBNaWNoYWVsIE5henphcmVubyBUcmltYXJj
aGkKPj4gQ28tRm91bmRlciAmIENoaWVmIEV4ZWN1dGl2ZSBPZmZpY2VyCj4+IE0uICszOSAzNDcg
OTEzIDIxNzAKPj4gbWljaGFlbEBhbWFydWxhc29sdXRpb25zLmNvbQo+PiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4+Cj4+IEFtYXJ1bGEgU29sdXRpb25zIEJWCj4+IEpvb3Ag
R2Vlc2lua3dlZyAxMjUsIDExMTQgQUIsIEFtc3RlcmRhbSwgTkwKPj4gVC4gKzMxICgwKTg1IDEx
MSA5MTcyCj4+IGluZm9AYW1hcnVsYXNvbHV0aW9ucy5jb20KPj4gd3d3LmFtYXJ1bGFzb2x1dGlv
bnMuY29tCj4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
