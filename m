Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E7CCF9C79
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 14:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84D2E40FBE;
	Wed, 25 Sep 2024 14:45:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aNiG-0kasa7y; Wed, 25 Sep 2024 14:45:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15A7F40290
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15A7F40290;
	Wed, 25 Sep 2024 14:45:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 39BFE1BF3DA
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 14:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2950084962
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 14:44:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZPvNKG8gvSKM for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 14:44:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=david.oberhollenzer@sigma-star.at; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 07F5684748
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07F5684748
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07F5684748
 for <buildroot@busybox.net>; Wed, 25 Sep 2024 14:44:56 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a90349aa7e5so999368366b.0
 for <buildroot@busybox.net>; Wed, 25 Sep 2024 07:44:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727275494; x=1727880294;
 h=subject:from:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3bcVt9docIOi0IW07bgSJvxTaZCOXvRBfktXeoptuB0=;
 b=KwqumsyBzbC9IqUz6VFI3Rw7J5ayNGnImzoBGC1tJCKFKd7Rsu7/ViBNbGEF4j320h
 HhNP1YpxjNxW6HLAd5lDjtT60AnUrpUAVF6QMqnxmB4qSpnVMWlFdMpcRVPvEDQv4uq0
 QyE9ojBHxe/xokVHGD3IzeSS5+K7R7jNw3baDR/6VeM+1ekxjlDzXxoJbtwSGYoS7/9Q
 RCyW3XkU2s6gxyAt/TktyTpaIYQYBqWN60LKrNQd0WIzfxAIfmqvyIaIUe46q0LgCOQW
 fyUN+HGAGIjsIV/wEEeSKg93v3Jm6ejymGRv1EB0SUl7uKnufEEf99NKGC3gptVVLYPp
 fh0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3ImDrSt3uwWmiqmxRd0Y9biLxTRTZVjFVY7BQHLzIaYLQBzQcKPwWiB/C1o9c/EEjP03tu5fQ3FU=@busybox.net
X-Gm-Message-State: AOJu0Yw62gtVpVlNy8yElXjl2g2cc2EmECGdYH5Blx8r2ZtbDHm6BA3/
 WrUoildXyyT7PJ4MWV9rVnJH1B1bcoIJkHZjR+RFvqtiYLDxo098uZ4WSU/ubuA=
X-Google-Smtp-Source: AGHT+IGim/otQGiCvx3ciGQg32gB+hyHim3ez5OY9QGu76J6ZpU7ZEI6pVGHR43sN2dW+Mnbo8/PYA==
X-Received: by 2002:a17:906:c144:b0:a8a:5bfb:7d1a with SMTP id
 a640c23a62f3a-a93a03c10a8mr282238466b.35.1727275493817; 
 Wed, 25 Sep 2024 07:44:53 -0700 (PDT)
Received: from [192.168.40.74] (046075014122.atmpu0009.highway.a1.net.
 [46.75.14.122]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930f46ffsm213807666b.155.2024.09.25.07.44.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 07:44:53 -0700 (PDT)
Message-ID: <5dcaf594-e727-4ec3-af69-86e578029160@sigma-star.at>
Date: Wed, 25 Sep 2024 16:44:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: MTD Mailing List <linux-mtd@lists.infradead.org>,
 Buildroot Mailing List <buildroot@busybox.net>,
 "Josh Boyer (Fedora)" <mtd-utils-maintainers@fedoraproject.org>,
 "Bastian Germann (Debian)" <bage@debian.org>,
 =?UTF-8?Q?Tomasz_Pawe=C5=82_Gajc_=28OpenMandriva=29?=
 <bero+massbuild@lindev.ch>, =?UTF-8?B?0JDQu9C10LrRgdCw0L3QtNGAIChSb3NhIExp?=
 =?UTF-8?Q?nux=29?= <a.proklov@rosalinux.ru>,
 Embedded Gentoo <embedded@gentoo.org>, "Robin H. Johnson"
 <robbat2@gentoo.org>, "John (Entware)" <john@phrozen.org>,
 "Michael Tross (T2 SDE)" <michael@tross.org>,
 "Oliver Schinagl (Alpine)" <oliver@schinagl.nl>,
 "Orphaned (Void Linux)" <orphan@voidlinux.org>,
 "Sergey Bolshakov (ALT Linux)" <sbolshakov@altlinux.org>,
 "Silvan Calarco (openmamba)" <silvan.calarco@mambasoft.it>,
 "Viric (nixpkgs)" <viric@viric.name>,
 "Pascal Bleser (SUSE)" <pascal.bleser@opensuse.org>,
 "Levente Polyak (Arch)" <anthraxx@archlinux.org>,
 =?UTF-8?Q?Llu=C3=ADs_Batlle_i_Rossell_=28NixOS=29?= <shaba@altlinux.org>,
 Richard Weinberger <richard@nod.at>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sigma-star.at; s=google; t=1727275494; x=1727880294; darn=busybox.net;
 h=subject:from:to:content-language:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=3bcVt9docIOi0IW07bgSJvxTaZCOXvRBfktXeoptuB0=;
 b=jsGPi3ZN5d23NzGx9g/7mLhr9CHJzSVnloGrJb61jmM3fU4GDFlR/Tg0coRD4MdZ6d
 H8lTE6S6qc8TQWa0P3iC26oTuKPSObJjXPtaYZQEKrleKDQolcsSh7MTvjf2mp70tqak
 q5SUqfOC7QAOHjl2MvldKngFgttdo0+5IIr+oMj5hNfpDJWfq1pHpACERpBnFeWXqOkb
 Em3YK8HrbCmgd9VYeLvaQ4ApOeLQPfDPAuUoiQQtj8/T4Vrocb675rkl+C9+hlpYGdFj
 U7tZXktR8Ih74RzWfXx0DYJ9PgKhMLEUzueXYjG7W0/ItAU3TCzdRx1OxuN0adLpL/gu
 8kOQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=sigma-star.at
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sigma-star.at header.i=@sigma-star.at
 header.a=rsa-sha256 header.s=google header.b=jsGPi3ZN
Subject: [Buildroot] [ANNOUNCE] mtd-utils-2.2.1 is released
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
Content-Type: multipart/mixed; boundary="===============0879735459981567911=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0879735459981567911==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------V6g9PkV5wDBS7TWJKqwZEdgL"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------V6g9PkV5wDBS7TWJKqwZEdgL
Content-Type: multipart/mixed; boundary="------------RzJtmEoBC39K0SQ4xJAaRejh";
 protected-headers="v1"
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: MTD Mailing List <linux-mtd@lists.infradead.org>,
 Buildroot Mailing List <buildroot@busybox.net>,
 "Josh Boyer (Fedora)" <mtd-utils-maintainers@fedoraproject.org>,
 "Bastian Germann (Debian)" <bage@debian.org>,
 =?UTF-8?Q?Tomasz_Pawe=C5=82_Gajc_=28OpenMandriva=29?=
 <bero+massbuild@lindev.ch>, =?UTF-8?B?0JDQu9C10LrRgdCw0L3QtNGAIChSb3NhIExp?=
 =?UTF-8?Q?nux=29?= <a.proklov@rosalinux.ru>,
 Embedded Gentoo <embedded@gentoo.org>, "Robin H. Johnson"
 <robbat2@gentoo.org>, "John (Entware)" <john@phrozen.org>,
 "Michael Tross (T2 SDE)" <michael@tross.org>,
 "Oliver Schinagl (Alpine)" <oliver@schinagl.nl>,
 "Orphaned (Void Linux)" <orphan@voidlinux.org>,
 "Sergey Bolshakov (ALT Linux)" <sbolshakov@altlinux.org>,
 "Silvan Calarco (openmamba)" <silvan.calarco@mambasoft.it>,
 "Viric (nixpkgs)" <viric@viric.name>,
 "Pascal Bleser (SUSE)" <pascal.bleser@opensuse.org>,
 "Levente Polyak (Arch)" <anthraxx@archlinux.org>,
 =?UTF-8?Q?Llu=C3=ADs_Batlle_i_Rossell_=28NixOS=29?= <shaba@altlinux.org>,
 Richard Weinberger <richard@nod.at>
Message-ID: <5dcaf594-e727-4ec3-af69-86e578029160@sigma-star.at>
Subject: [ANNOUNCE] mtd-utils-2.2.1 is released

--------------RzJtmEoBC39K0SQ4xJAaRejh
Content-Type: multipart/mixed; boundary="------------XlaSHLS0X4D1seAfO0Xsmb9d"

--------------XlaSHLS0X4D1seAfO0Xsmb9d
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCm10ZC11dGlscy0yLjIuMSBpcyByZWxlYXNlZC4NCg0KVGFyYmFsbDogICAgICAg
ICAgICAgICBmdHA6Ly9mdHAuaW5mcmFkZWFkLm9yZy9wdWIvbXRkLXV0aWxzL210ZC11dGls
cy0yLjIuMS50YXIuYnoyDQpUYXJiYWxsIGdwZyBzaWduYXR1cmU6IGZ0cDovL2Z0cC5pbmZy
YWRlYWQub3JnL3B1Yi9tdGQtdXRpbHMvbXRkLXV0aWxzLTIuMi4xLnRhci5iejIuYXNjDQpT
aWduZWQgZ2l0IHRhZzogICAgICAgIGdpdDovL2dpdC5pbmZyYWRlYWQub3JnL210ZC11dGls
cy5naXQgdjIuMi4xDQoNCkFsdGVybmF0aXZlbHkgYWxzbyBtaXJyb3JlZCBoZXJlOg0KDQpU
YXJiYWxsOiAgICAgICAgICAgICAgIGh0dHBzOi8vaW5mcmFyb290LmF0L3B1Yi9tdGQvbXRk
LXV0aWxzLTIuMi4xLnRhci5iejINClRhcmJhbGwgZ3BnIHNpZ25hdHVyZTogaHR0cHM6Ly9p
bmZyYXJvb3QuYXQvcHViL210ZC9tdGQtdXRpbHMtMi4yLjEudGFyLmJ6Mi5hc2MNClNpZ25l
ZCBnaXQgdGFnOiAgICAgICAgaHR0cHM6Ly9naXQuaW5mcmFyb290LmF0L210ZC11dGlscy5n
aXQgdjIuMi4xDQoNClRoaXMgaXMgYSBzbWFsbCByZWxlYXNlIG9mIGZpeGVzIHRoYXQgaGF2
ZSBhY2N1bXVsYXRlZCBzaW5jZSBNYXJjaC4NCg0KQ2hhbmdlcyBmcm9tIDIuMi4wIHRvIDIu
Mi4xOg0KDQpGaXhlczoNCiAgLSBmZWN0ZXN0OiBGaXggdGltZSBmb3JtYXR0aW5nIHdpdGgg
X1RJTUVfQklUUz02NCBvbiAzMi1iaXQgc3lzdGVtDQogIC0gYWxzbyBjaGVjayBmb3Igc3Rh
dGljIGxpYnV1aWQNCiAgLSBta2ZzLnViaWZzOiBDbGVhciBkaXJlY3Rfd3JpdGUgcHJvcGVy
dHkgd2hlbiBjbG9zaW5nIHRhcmdldA0KICAtIG1rZnMudWJpZnM6IEluaXRpYWxpemUgJ2Np
cGhlcl9uYW1lJyBhcyBOVUxMDQogIC0gbWtmcy51YmlmczogRml4IHdyb25nIHhhdHRyIGVu
dHJ5IHR5cGUNCiAgLSBta2ZzLnViaWZzOiBGaXggaW5jb3JyZWN0IGRpciBzaXplIGNhbGN1
bGF0aW9uIGluIGVuY3J5cHRpb24gc2NlbmFyaW8NCiAgLSBta2ZzLnViaWZzOiBDbG9zZSBs
aWJ1YmkgaW4gZXJyb3IgaGFuZGxpbmcgcGF0aHMNCiAgLSBta2ZzLnViaWZzOiBGaXggbWlz
c2VkIGNsb3Npbmcgb3V0X2ZkDQogIC0gbWtmcy51YmlmczogRml4IG1lbWxlYWsgZm9yICdv
dXRwdXQnIGluIGVycm9yIHBhdGhzDQoNCkNoYW5nZXM6DQogIC0gbGlidWJpOiB1YmlfdXBk
YXRlX3N0YXJ0OiBzbGlnaHRseSBpbXByb3ZlIGRvY3VtZW50YXRpb24NCiAgLSBmcy10ZXN0
czogaW50ZWdjazogUmVmYWN0b3I6IHNwbGl0IG91dCBjb21tb24gcmVtb3VudCBsb2dpYw0K
ICAtIGZzLXRlc3RzOiBpbnRlZ2NrOiBSZWZhY3Rvcjogc3BsaXQgb3V0IGNvbW1vbiByZW1v
dW50IGxvZ2ljDQogIC0gRXh0cmFjdCBsaXN0IGltcGxlbWVudGF0aW9uIHRvIGNvbW1vbiBs
aWIgYW5kIGFkZCBsaXN0X3NvcnQgc3VwcG9ydA0KICAtIEV4dHJhY3QgcmJ0cmVlIGltcGxl
bWVudGF0aW9uIHRvIGNvbW1vbiBsaWINCg0KDQpSYXcgc2hvcnQgbG9nIHNpbmNlIHRoZSAy
LjIuMCByZWxlYXNlOg0KDQpCZW4gSHV0Y2hpbmdzICgxKToNCiAgICAgICBtdGQtdXRpbHM6
IGZlY3Rlc3Q6IEZpeCB0aW1lIGZvcm1hdHRpbmcgd2l0aCBfVElNRV9CSVRTPTY0IG9uIDMy
LWJpdCBzeXN0ZW0NCg0KQ2hyaXN0aWFuIEVnZ2VycyAoMSk6DQogICAgICAgbGlidWJpOiB1
YmlfdXBkYXRlX3N0YXJ0OiBzbGlnaHRseSBpbXByb3ZlIGRvY3VtZW50YXRpb24NCg0KQ3PD
s2vDoXMsIEJlbmNlICgyKToNCiAgICAgICBmcy10ZXN0czogaW50ZWdjazogUmVmYWN0b3I6
IHNwbGl0IG91dCBjb21tb24gcmVtb3VudCBsb2dpYw0KICAgICAgIGZzLXRlc3RzOiBpbnRl
Z2NrOiBSZWZhY3Rvcjogc3BsaXQgb3V0IGNvbW1vbiByZW1vdW50IGxvZ2ljDQoNClJvc2Vu
IFBlbmV2ICgxKToNCiAgICAgICBtdGQtdXRpbHM6IGFsc28gY2hlY2sgZm9yIHN0YXRpYyBs
aWJ1dWlkDQoNClpoaWhhbyBDaGVuZyAoOSk6DQogICAgICAgbWtmcy51YmlmczogQ2xlYXIg
ZGlyZWN0X3dyaXRlIHByb3BlcnR5IHdoZW4gY2xvc2luZyB0YXJnZXQNCiAgICAgICBta2Zz
LnViaWZzOiBJbml0aWFsaXplICdjaXBoZXJfbmFtZScgYXMgTlVMTA0KICAgICAgIG1rZnMu
dWJpZnM6IEZpeCB3cm9uZyB4YXR0ciBlbnRyeSB0eXBlDQogICAgICAgbWtmcy51Ymlmczog
Rml4IGluY29ycmVjdCBkaXIgc2l6ZSBjYWxjdWxhdGlvbiBpbiBlbmNyeXB0aW9uIHNjZW5h
cmlvDQogICAgICAgbWtmcy51YmlmczogQ2xvc2UgbGlidWJpIGluIGVycm9yIGhhbmRsaW5n
IHBhdGhzDQogICAgICAgbWtmcy51YmlmczogRml4IG1pc3NlZCBjbG9zaW5nIG91dF9mZA0K
ICAgICAgIG1rZnMudWJpZnM6IEZpeCBtZW1sZWFrIGZvciAnb3V0cHV0JyBpbiBlcnJvciBw
YXRocw0KICAgICAgIG10ZC11dGlsczogRXh0cmFjdCBsaXN0IGltcGxlbWVudGF0aW9uIHRv
IGNvbW1vbiBsaWIgYW5kIGFkZCBsaXN0X3NvcnQgc3VwcG9ydA0KICAgICAgIG10ZC11dGls
czogRXh0cmFjdCByYnRyZWUgaW1wbGVtZW50YXRpb24gdG8gY29tbW9uIGxpYg0KDQpSZWdh
cmRzLA0KDQpEYXZpZA0K
--------------XlaSHLS0X4D1seAfO0Xsmb9d
Content-Type: application/pgp-keys; name="OpenPGP_0xBCE5DC3C741A02D1.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBCE5DC3C741A02D1.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFZyf0YBCADHyKhABhxthCC9n48pvsuk5p3IEdYXMs8Apenh1N/Z4cViAz/d
/nSCZ+FGFX/PSubEzq8AilZLejchAltaORCvA1Y6FgTlpcdJ6gHDfStDbJL/vk5N
8aL7YNF7VfjTRntBtKbhKcrG05nbdNjIioAm04pt9rx5mV5KMbf22/FdZpOSSsC6
/N7b/cFH9+fx8kwi4pNFuJwrBkWRuQ7rEtCoSpd22t+Vh9qA7kymW9gWY405258j
nN65jBO7ElqU2CCuGRPg6uryAHV3RVCB9j9AE3HLacQReFtt5ylyydSQbaK4K9as
nd7U2/C11vIuuciXCppX4bPap/pMnGpzw0UNABEBAAHNN0RhdmlkIE9iZXJob2xs
ZW56ZXIgPGRhdmlkLm9iZXJob2xsZW56ZXJAc2lnbWEtc3Rhci5hdD7CwHcEEwEI
ACEFAlZyf0YCGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4AACgkQvOXcPHQaAtFu
EAgArXOhaoaVvCMVCa5N25Q/+Q6K1wrVpPmkH89yhQqCmfM6f+2VM5MGFDPfaSJ3
5fBDH0iwBQwlXIb7NSXWtzdXX9rMvJkJqv45TgeKtJApf/sRhmcN+clrwzP8oZQb
xkP1YWzoVwo4lOb3Kv7aY9yeCjqNbdJJ57NpvYOUrzrCpGkrDPBBQOvKF3wbq3oU
/o3dT23NDeQ20jXgquJf/PCw6WCzRxqg58wH02MdMDQe8vByzVig2bM2e7DErtt+
hPK/Dmdsqgns+Z+SrQcOvRa3GMAHAuHB0u2LhYO6NyaNCgzdgutorilYcq7FEKr8
XqwOnfVmZdCW3qGKmLbn6qMEdM7ATQRWcn9GAQgAvugF8cFjv2Zs4BBb44SnxGaw
BySC1bMRas/MjA9EMHUAx/StcecQmxnl6BzEyGpr+TRnXIzcb5xI8SxitBDU5MLv
wsHgNvpYp9fscd4kWP7oMir9ta3Q8SvT4OLbO4FZBGaURzGPak8JmjMMtOoOBh4m
eOjz6GrJe9UIGxT94aB01w7YohfBANzK8xyk4ykKC5Op4XgaaMKOEQUah7wajcoj
YSlvgOiXqEisMHlRDAW6sXL2sEM7TIpvYhy9txMLllpkYb0Pu1BvUpY/unsybWKA
FyiTmeiY+nEveUvqX6Ef7BWdClBeCk2UaRvtcoLd22VxMlKTniHQcNMOXlRRawAR
AQABwsBfBBgBCAAJBQJWcn9GAhsMAAoJELzl3Dx0GgLRPtcH/jD6rn2+VIKgrHdt
3ao3Abpu2fqYfwbIyPAtpXOddDptVq+0A/2arXT1Y8+jNSZpbAg8K+bLaEAcSUEj
viKMpfI7ppTUBuGKrpgc5xsiUpKkJCb7oB1ZraIBNBPtPPVUhbwLie4uW/LVt+8r
BKz3W9KEDOsT0ZCG/pW8Ld+EpDR9l0fmqoVHaw8PhLAtez+B7HS7Hv7iJPDtX85k
FYpud8kIPENXVn9EjZudyMWgZb2LhYlcavNcszgR7In6ift5SNySojCOfAV0iKZb
8QUXWktLleY8kQ8jltOsSRTuO4PDfzvtCQDixUw4tQ7WLwDTqyUpot0oG03vtSG4
LIRCdxI=3D
=3DjujX
-----END PGP PUBLIC KEY BLOCK-----

--------------XlaSHLS0X4D1seAfO0Xsmb9d--

--------------RzJtmEoBC39K0SQ4xJAaRejh--

--------------V6g9PkV5wDBS7TWJKqwZEdgL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEEwY/cjyeWErqzVubvOXcPHQaAtEFAmb0IeMFAwAAAAAACgkQvOXcPHQaAtH9
mQf+PYcFNimZ8zryuYOZKlZJ4P2nLFZfIqsosbDIInXLqtTUPZyqThtC4ESHCrE6yAT+j6mqSVj3
P0YNEWjiRpHKEz4zGIlZEoCG5TZVoFDPkE0c4whd4UwEGc1AuvRHvyAT45iLSO1S5lCyC9zYu7wE
3jxUhfAm+9DUSXod61IDqcPuSJUWSZg5aL5BRxTkbSM3oDNRdFET5E1nsrxohs4OhFdwTBkPfItq
Uw9TLvH6CwuChtr8furIYkBpJK8QCbQ5uXVRgqehI6Qy8o/eJjsgyfWatORieEk/ptLWHNbSUMMa
P0tl0Fu0I9MMvyeE63J/VmjV89zbR/hOO5CD5aPzIQ==
=kgBP
-----END PGP SIGNATURE-----

--------------V6g9PkV5wDBS7TWJKqwZEdgL--

--===============0879735459981567911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0879735459981567911==--
