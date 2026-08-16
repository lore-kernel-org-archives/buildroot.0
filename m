Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D39CC5B572
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 20:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 236A14068C;
	Sun, 16 Aug 2026 20:18:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3kPqG_x2EbnG; Sun, 16 Aug 2026 20:18:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1421040619
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786911531;
	bh=AHeNdw+j6h2oLKVDSmowAaPVTXP6NQCNzg0KzcXUp5Q=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nzGWVOyfMBcsFatqutZPjmbWXXnbjr7hcYCZy76UI5KqOX7jpcQU9krS10ZZui8VW
	 InKv5N3k1ywhjfPMeiwvnyYiJpsI3OdtcANs0F2uQ3QY6KWJfhIbutTa4/Zw0pf+h0
	 /9z8YCbwV8D1U8OdU4CmSbhrkoXxEZgdTHYJLRsLT3KvDifeD6w8u+a04AVdChh5BJ
	 m595ZqTLgalAClDwrmzzKlkSFGUgeVc+ya5p6dI04LX4zFDbLZHbZoJuHdMOlicsmB
	 9mPUGJpq3Bf8YRoo9EIYVwdj8BPx7QloNtiSnJQEI/tLpudeJKoWKT4gRjqJcTHQk4
	 kwffcFj+HvsEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1421040619;
	Sun, 16 Aug 2026 20:18:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DE4413A0
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 20:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C496C6060B
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 20:18:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id meX-FgIOU2_1 for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 20:18:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c29; helo=mail-oo1-xc29.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B328C6061A
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B328C6061A
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=bmFpJOG1
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B328C6061A
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 20:18:48 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-6b03e59a9b4so1166125eaf.3
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 13:18:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786911527; cv=none;
 d=google.com; s=arc-20260327;
 b=qAnElLuKdzH+2+P7ygF7nHZPWPfZMv4ClP6Gt2vvubRC1jBCmtY18svmDaV0F7Qlae
 HQQWVaTLaVobWkkIOHe6EoTNjfYQKNrgIBGAVDnR8TQQuFxRPueGtlHGpYs4mISZq6uz
 4hXTxJtIxCIQe4rUHU/U1mvPt7+KQO5OJl5zH3Zsp4G7cNUmooLW++0/O3bjOBqrK3dv
 EIaUs1opfBPRxNTdSkr/JoNbYWUxxEo6Nb0efBbLIMQU3aqcKxUFFrdIoKqsuOrcanat
 Il2Fftzt772WcraSVIoIWr/otDcbkJUL8knJPmvU/pw1I+dSiFOUVrXH6rcyQYKSnixG
 wqug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=O/7ruVpv90p2F37sSGIDhUbWLrxviqXADeYY70P20nc=;
 fh=FRQJCU2rgZux+XlYjD4Zr07q0G9dcXfWdVHRPr65poM=;
 b=EDOfoFSY+P4Tfw+T5S0dyUcgJ/FOhVguBT6pYVBFp843Ykf/2ylijou6bywHn77R/F
 2H9Qlbpjx0VfoOsgAOV67ok4hbDkuaZo4DAm6EHRm4NHD9qcb5ldN7PsJbSCwhnd50Zd
 wFUbt5M5T5Oalujmw4my4kd4VamC0H/V84yCiVtksdAfkz/ai1UiiY4vbkVP4xhQopvB
 zwbhdl2D5DuLnNfCy6bHilSpyN6XMGDUD14Lakw0FO+VJ5QM5L49A6K1erhZ53SWNOzy
 KmCi0OjfOYTwTnIUurN5zS+Uekz1XpSRhhX30UAV8fLlAWDNgzmvKoUoRipoGnq/xXNg
 zwzw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786911527; x=1787516327; darn=buildroot.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=O/7ruVpv90p2F37sSGIDhUbWLrxviqXADeYY70P20nc=;
 b=bmFpJOG1t1ChhcALOTYMPXTqFp9R4jgzmM0kntI3dXJBD6HzaEX3G2lw7AGp3+VdTj
 sg7Mpgas21IvZpwLfDGW0Z6XKrl9d51QdpCkHZHghEZZqACf1G9R6XoFtrckF5/Zy0xS
 VSz1cOZkKxUdIO9rmTeTDFvqTStxRD0Hx+j11vtzxBESaXOTaQM4N7rT+kIFcOFcPFdp
 kzT0fLgDXXmmmFsQYX8L48cAMnVf9VCnmulvcldAsi2KXCKLQlgQSoNlhscdmOCn0DfV
 guAG/mX8jz3QvO0YjLAqPP32US/EgoMXB3R3f5Iyj5qAhsKSTuqrv3OY0k8Ga9pg6SOd
 hyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786911527; x=1787516327;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=O/7ruVpv90p2F37sSGIDhUbWLrxviqXADeYY70P20nc=;
 b=Ihpdy+YPKrIKqAVdHYTpviqqaQkMaMgatGoT3MlPkP7ZWShtJxQyeg6xcvZc4kRt7G
 P6JwHUb6iX+bprAyRD3/QFoOkNkLnQS8YGLE+pXfcUUlZxpsnwHpc+3E6e9B5+lojHVv
 QDaVkEHtmMEGjizXw0unJBntEe8GzfSv9JCYEnCVHzKpy0QfHAty8O6xZJjaQciD9EHf
 0ysigWTUQUmYqShlDfsWlimLsCt8iNiqDve81OucKn7sqU9zJGkdGW3m8B0oPC5s2V3V
 bAdxQs0NrjW9DKSlT3HF7umvJZtaSQP49e9aDOMgNKUrCWjjOQYZRvBAu1OLftNdmUZo
 ONpA==
X-Gm-Message-State: AOJu0YwRNnU7WMl9ph+DuYMKxOoYlIo7GAxUtbzBAbNDR/mOidbnO97q
 d2Fok1Pf4RbJsLiM5EuP3l9imNqhAlUOFJ31M2vYM3K5s3gjzJ3J5wtXbyK4cuKcsCQueWo5ZIA
 2J8kbCYCboUdUMXMYoqfUf97ruP1my0uyBh8mUvU=
X-Gm-Gg: AR+sD11ybGgIBFGGWGC5l6yhsxMkWEHlms1m/hrxEQmSJUriHKOIh4pzxQawf7xoDMM
 o2xlpdrfDKBgbGJLc3i57lj3PaCwOPZwf1g6iicXLk+JW3QBdWp+6VFdHoD9OrfRPI5lJtqmOJm
 1gbCbkNF2bTuMfFzsJbLay0EAj8nxHXFkTiysGihy1lSFg0gGh6Toaypmk7DoH9kQQcu132OulY
 LG7+s+Y+N5MIEPQbLyJUsBGGa4smqPRT3S2hzRgiOLtC+BOM0ffopfcP8XzJKiArDwg2AtMfOjy
 zRwnGYaZZdqH+65NkAR7JXQa3rzyfvco5l4Yc9xjT2eK
X-Received: by 2002:a05:6820:4c8b:b0:6a3:d77e:725a with SMTP id
 006d021491bc7-6b0d6246236mr17852633eaf.20.1786911527475; Sun, 16 Aug 2026
 13:18:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260710133225.484041-1-aford173@gmail.com>
In-Reply-To: <20260710133225.484041-1-aford173@gmail.com>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Sun, 16 Aug 2026 13:18:11 -0700
X-Gm-Features: AcwNN1X_SJs1zmJjWv6e-Nqy7L3DSjrSnwBfDHZjNLwUSGeF1O1wbGeHDW-DMCA
Message-ID: <CAMWSM7i+F_03QNzUGx=6AA2M5kwoVj9unBtyLy+FqfRVMkP4RQ@mail.gmail.com>
To: Adam Ford <aford173@gmail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, 
 Romain Naour <romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/mesa3d: add intel-virtio host
 native context config
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

SGVsbG8gQWRhbSwKClRoYW5rcyBmb3Igc3VibWl0dGluZyB0aGlzLgoKT24gRnJpLCBKdWwgMTAs
IDIwMjYgYXQgNjozMuKAr0FNIEFkYW0gRm9yZCA8YWZvcmQxNzNAZ21haWwuY29tPiB3cm90ZToK
Pgo+IEFkZCBCUjJfUEFDS0FHRV9NRVNBM0RfSE9TVF9OQVRJVkVfQ09OVEVYVF9EUklWRVJfSU5U
RUwgaW4gdGhlIHNhbWUKPiBwYXR0ZXJuIGFzIGFtZGdwdS12aXJ0aW8uIFdoZW4gZW5hYmxlZCwg
LURpbnRlbC12aXJ0aW8tZXhwZXJpbWVudGFsPXRydWUKPiBkZWZpbmVzIEhBVkVfSU5URUxfVklS
VElPIHNvIHRoZSBndWVzdC1zaWRlIEludGVsIG5hdGl2ZSBjb250ZXh0Cj4gKGk5MTUgYW5kIHhl
IGNvbnRleHQgdHlwZXMpIGlzIGNvbXBpbGVkIGluLiBUaGlzIGlzIHRoZSBndWVzdCBoYWxmCj4g
b2YgdGhlIEludGVsIHZEUk0gR1BVIHBhc3N0aHJvdWdoIHBhdGgsIHVzYWJsZSBieSB0aGUgY3Jv
Y3VzL2lyaXMKPiAoT3BlbkdMKSBhbmQgQU5WIChWdWxrYW4pIGRyaXZlcnMuCj4KCkFzIEkgdW5k
ZXJzdGFuZCwgdGhpcyBjdXJyZW50bHkgcmVxdWlyZXMgdGhlIGk5MTUgS01ELCBhbmQgZG9lcyBu
b3QKc3VwcG9ydCB0aGUgbmV3ZXIgWGUgS01EIHRoYXQgYWxzbyBzdXBwb3J0cyB0aGUgSXJpcy9h
bnYgVU1EcywgaXMgdGhhdApjb3JyZWN0PyBQZXJoYXBzIHdlIHNob3VsZCBub3RlIHRoYXQgaW4g
dGhlIEtjb25maWcgaGVscCwgYW5kIHJlbW92ZQptZW50aW9uIG9mIFhlIGNvbnRleHQgc3VwcG9y
dCwgdG8gcHJldmVudCBjb25mdXNpb24uCgpJdCBsb29rcyBsaWtlIHRoZXJlJ3Mgc29tZSBvdXQt
b2YtdHJlZSBlZmZvcnQgdG8gc3VwcG9ydCBYZSBjb250ZXh0cywKYnV0IHRoaXMgaXMgbm90IHVw
c3RyZWFtIG9yIHBlbmRpbmcgcmV2aWV3IGFzIG9mIG5vdy4gWzBdCgo+IE5vdGUgdGhhdCB0aGlz
IGlzIGFuIGV4cGVyaW1lbnRhbCBNZXNhIGZlYXR1cmUgKHRoZSB1cHN0cmVhbSBtZXNvbgo+IG9w
dGlvbiBpcyBuYW1lZCBpbnRlbC12aXJ0aW8tZXhwZXJpbWVudGFsKSBhbmQgaXMgZGlzYWJsZWQg
YnkgZGVmYXVsdC4KPgo+IFNpZ25lZC1vZmYtYnk6IEFkYW0gRm9yZCA8YWZvcmQxNzNAZ21haWwu
Y29tPgo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbWVzYTNkL0NvbmZpZy5pbiBiL3BhY2thZ2Uv
bWVzYTNkL0NvbmZpZy5pbgo+IGluZGV4IGUxODQwMzkxNTAuLmFkMDJiNWU4MjkgMTAwNjQ0Cj4g
LS0tIGEvcGFja2FnZS9tZXNhM2QvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9tZXNhM2QvQ29u
ZmlnLmluCj4gQEAgLTEzMCw2ICsxMzAsNyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfTUVTQTNEX0dB
TExJVU1fRFJJVkVSX0NST0NVUwo+ICAgICAgICAgYm9vbCAiR2FsbGl1bSBjcm9jdXMgZHJpdmVy
Igo+ICAgICAgICAgZGVwZW5kcyBvbiBCUjJfaTM4NiB8fCBCUjJfeDg2XzY0Cj4gICAgICAgICBz
ZWxlY3QgQlIyX1BBQ0tBR0VfTUVTQTNEX0dBTExJVU1fRFJJVkVSCj4gKyAgICAgICBzZWxlY3Qg
QlIyX1BBQ0tBR0VfTUVTQTNEX0hPU1RfTkFUSVZFX0NPTlRFWFRfU1VQUE9SVEVEX0RSSVZFUgo+
ICAgICAgICAgaGVscAo+ICAgICAgICAgICBNZXNhIGRyaXZlciBmb3IgZ2VuNC03IEludGVsIEdQ
VXMuCj4KPiBAQCAtMTY3LDYgKzE2OCw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9NRVNBM0RfR0FM
TElVTV9EUklWRVJfSVJJUwo+ICAgICAgICAgYm9vbCAiR2FsbGl1bSBpcmlzIGRyaXZlciIKPiAg
ICAgICAgIGRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfTUVTQTNEX0xMVk0KPiAgICAgICAgIHNlbGVj
dCBCUjJfUEFDS0FHRV9NRVNBM0RfR0FMTElVTV9EUklWRVIKPiArICAgICAgIHNlbGVjdCBCUjJf
UEFDS0FHRV9NRVNBM0RfSE9TVF9OQVRJVkVfQ09OVEVYVF9TVVBQT1JURURfRFJJVkVSCj4gICAg
ICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfTUVTQTNEX05FRURTX1BSRUNPTVBfQ09NUElMRVIKPiAg
ICAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9NRVNBM0RfUlVTVElDTF9TVVBQT1JURURfRFJJVkVS
Cj4gICAgICAgICBoZWxwCj4gQEAgLTM5Myw2ICszOTUsNyBAQCBjb25maWcgQlIyX1BBQ0tBR0Vf
TUVTQTNEX1ZVTEtBTl9EUklWRVJfSU5URUwKPiAgICAgICAgIGRlcGVuZHMgb24gQlIyX1RPT0xD
SEFJTl9IRUFERVJTX0FUX0xFQVNUXzNfMTcgIyBtZW1mZC5oCj4gICAgICAgICBkZXBlbmRzIG9u
IEJSMl9UT09MQ0hBSU5fVVNFU19HTElCQyAjIGlmdW5jLCBzdGF0aWNfYXNzZXJ0Cj4gICAgICAg
ICBkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX01FU0EzRF9MTFZNCj4gKyAgICAgICBzZWxlY3QgQlIy
X1BBQ0tBR0VfTUVTQTNEX0hPU1RfTkFUSVZFX0NPTlRFWFRfU1VQUE9SVEVEX0RSSVZFUgo+ICAg
ICAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX01FU0EzRF9ORUVEU19QUkVDT01QX0NPTVBJTEVSCj4g
ICAgICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfTUVTQTNEX1ZVTEtBTl9EUklWRVIKPiAgICAgICAg
IGhlbHAKPiBAQCAtNDU5LDYgKzQ2MiwyMiBAQCBjb25maWcgQlIyX1BBQ0tBR0VfTUVTQTNEX0hP
U1RfTkFUSVZFX0NPTlRFWFRfRFJJVkVSX0ZSRUVEUkVOTwo+ICAgICAgICAgICBTZWxlY3QgdGhp
cyB3aGVuIHJ1bm5pbmcgTWVzYSBpbnNpZGUgYSB2aXJ0dWFsIG1hY2hpbmUKPiAgICAgICAgICAg
d2l0aCB2aXJ0aW8tZ3B1IGhvc3QgbmF0aXZlIGNvbnRleHQgc3VwcG9ydC4KPgo+ICtjb25maWcg
QlIyX1BBQ0tBR0VfTUVTQTNEX0hPU1RfTkFUSVZFX0NPTlRFWFRfRFJJVkVSX0lOVEVMCj4gKyAg
ICAgICBib29sICJpbnRlbC12aXJ0aW8iCj4gKyAgICAgICBkZXBlbmRzIG9uIEJSMl9QQUNLQUdF
X01FU0EzRF9HQUxMSVVNX0RSSVZFUl9DUk9DVVMgfHwgXAo+ICsgICAgICAgICAgICAgICBCUjJf
UEFDS0FHRV9NRVNBM0RfR0FMTElVTV9EUklWRVJfSVJJUyB8fCBcCj4gKyAgICAgICAgICAgICAg
IEJSMl9QQUNLQUdFX01FU0EzRF9WVUxLQU5fRFJJVkVSX0lOVEVMCj4gKyAgICAgICBoZWxwCj4g
KyAgICAgICAgIEVuYWJsZSBWaXJ0SU8gc3VwcG9ydCBmb3IgSW50ZWwgbmF0aXZlIGNvbnRleHRz
Cj4gKyAgICAgICAgIHVzZWQgYnkgdGhlIGNyb2N1cy9pcmlzIChPcGVuR0wpIGFuZCBBTlYgKFZ1
bGthbikKPiArICAgICAgICAgZHJpdmVycy4KPiArCj4gKyAgICAgICAgIFRoaXMgaXMgYW4gZXhw
ZXJpbWVudGFsIE1lc2EgZmVhdHVyZSBhbmQgaXMgZGlzYWJsZWQKPiArICAgICAgICAgYnkgZGVm
YXVsdC4KPiArCj4gKyAgICAgICAgIFNlbGVjdCB0aGlzIHdoZW4gcnVubmluZyBNZXNhIGluc2lk
ZSBhIHZpcnR1YWwgbWFjaGluZQo+ICsgICAgICAgICB3aXRoIHZpcnRpby1ncHUgaG9zdCBuYXRp
dmUgY29udGV4dCBzdXBwb3J0Lgo+ICsKPiAgY29uZmlnIEJSMl9QQUNLQUdFX01FU0EzRF9IT1NU
X05BVElWRV9DT05URVhUX1NVUFBPUlRFRF9EUklWRVIKPiAgICAgICAgIGJvb2wKPgo+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL21lc2EzZC9tZXNhM2QubWsgYi9wYWNrYWdlL21lc2EzZC9tZXNhM2Qu
bWsKPiBpbmRleCA4ZTZjMmVlNWI4Li44NzM3N2I3Y2U0IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uv
bWVzYTNkL21lc2EzZC5tawo+ICsrKyBiL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5tawo+IEBAIC0x
NjQsNiArMTY0LDEyIEBAIGVsc2UKPiAgTUVTQTNEX0NPTkZfT1BUUyArPSAtRGFtZGdwdS12aXJ0
aW89ZmFsc2UKPiAgZW5kaWYKPgo+ICtpZmVxICgkKEJSMl9QQUNLQUdFX01FU0EzRF9IT1NUX05B
VElWRV9DT05URVhUX0RSSVZFUl9JTlRFTCkseSkKPiArTUVTQTNEX0NPTkZfT1BUUyArPSAtRGlu
dGVsLXZpcnRpby1leHBlcmltZW50YWw9dHJ1ZQo+ICtlbHNlCj4gK01FU0EzRF9DT05GX09QVFMg
Kz0gLURpbnRlbC12aXJ0aW8tZXhwZXJpbWVudGFsPWZhbHNlCj4gK2VuZGlmCj4gKwo+ICBpZm5l
cSAoJChCUjJfUEFDS0FHRV9NRVNBM0RfR0FMTElVTV9EUklWRVJfRlJFRURSRU5PKSQoQlIyX1BB
Q0tBR0VfTUVTQTNEX1ZVTEtBTl9EUklWRVJfRlJFRURSRU5PKSwpCj4gIE1FU0EzRF9GUkVFRFJF
Tk9fS01EUyA9IG1zbQo+ICBpZmVxICgkKEJSMl9QQUNLQUdFX01FU0EzRF9IT1NUX05BVElWRV9D
T05URVhUX0RSSVZFUl9GUkVFRFJFTk8pLHkpCj4gLS0KPiAyLjUzLjAKPgoKV2l0aCB0aGUgcmV2
aXNlZCBoZWxwIG1lc3NhZ2UsIHlvdSBoYXZlIG15CgpSZXZpZXdlZC1ieTogSm9zZXBoIEtvZ3V0
IDxqb3NlcGgua29ndXRAZ21haWwuY29tPgoKQmVzdApKb3NlcGgKClswXSBodHRwczovL2dpdGh1
Yi5jb20vY21zcGFtL3hlLW5hdGl2ZS1jb250ZXh0LWVuYWJsZW1lbnQKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
