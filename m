Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08316F4BB9C
	for <buildroot@archiver.kernel.org>; Wed, 25 Feb 2026 10:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B400E83E3E;
	Wed, 25 Feb 2026 10:55:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YfTt310afNpw; Wed, 25 Feb 2026 10:55:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BABDB83E11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772016945;
	bh=bnalILaaDtI72GZ6pgZJ9TlsIG+fg/VZASKncjUq668=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Tmvve2uw0/EBS/0rAP/u10/vomQATZNhxtElgJfdBF6fnkqPevViyhCgtH8RBPW48
	 JSbg3qwiPeoAkLtvgVgB552NtBr+TwvAlP0Z0zVMUae3o5vGzqAPg7fGRwgpWq2iUl
	 SlIbRLY3CFECZDysh6y3Ac0oUWHJkyV9KpU98UwlynGehGrzYDCG5sd8UlZ/nFGG8k
	 6vGr30lPqrZ+BqIz53k2TPzo4yjAQgBarY2g0GH/i9A6gPIM3FBgQ3QCfykOh3y6gv
	 wz4kCtWW0immYUuB3njBeBSEyRZAc1Hr5eLVW1SWpUe38AzPeuzdTJX/8jn1z5kpmv
	 XjAVWklrJyx8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BABDB83E11;
	Wed, 25 Feb 2026 10:55:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CCCF41B8
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 10:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE93283E11
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 10:55:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0UsNBYEyiBQR for <buildroot@buildroot.org>;
 Wed, 25 Feb 2026 10:55:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::642; helo=mail-ej1-x642.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D838083DF3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D838083DF3
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D838083DF3
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 10:55:42 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id
 a640c23a62f3a-b932fe2e1a7so193538966b.1
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 02:55:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772016940; x=1772621740;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/yTX0QTuJp0zDKtUPnCd6RUj+N8n5qd8EAKiy4U6HG4=;
 b=KHZeIxAV0pC94I9f+C42AwPY7HK8IfpvZ+92SzMtTUeLdaguBg04sgG6lG6c8lZnvj
 aWQsgZiB/Z3tZNkvCLnGrRnkroBGQEPZTzubC8X2AAqHx/dKJH88MtqyUjbrpNg2y/Sl
 LyAI9d7dYGSCGpCaDqtaejMFL/0uapb9+ZqjzY3F3+1xvPsrxSSS8E9H8wiW3D48LDxG
 XgzrgdoH1bU2Sc72119zyGwGjdmzIVgzO2StfCZYBpqT4kkgjXkyvsJ4C1Wgi8RmrU3q
 j8ZbCum4irM+3lrKleiEnKxA0N3xy3vVWRs6yzcAgGgXpeYXDquqxiSnHl1v5dSKlrwU
 AfIw==
X-Gm-Message-State: AOJu0YwMhF+XfQ/zIZkWQvknH1el4emoEh00PGJO5lbVRQJlt+2aRqO5
 E1RzOUYwddeKPkUtpJzVwMJZZ9FfVRaWSDz/6xJx9PJjEm+3Jn2vC4Z1DeE7CajnhlY=
X-Gm-Gg: ATEYQzypmNv8gJkRapISUWnJ8Rsj1MeQjCMmooew2hvqGktbAv2RudV6lKV21zAAsn6
 Tzw1KNFIIqJj1ob0vnVSlohaaZHv6PXsafA0P+C9T/GlpJSwbP/h9J98BWgUTFmTZiY7NOzRPei
 X4dgxZE7eHZidEyG9ezGfKdXoxGDZ7vkjcjLEyucGBhDAmxBIYHgDhVi4yKzqvgAyIC+/K/RZyn
 /VHwiP/FLTPksMpYurbbSQi66H6LqpUgBztFd3RQyRzano6PdtY4Q+t3GfjuaoM2z/8NY5Qou0P
 u7G9K/brOAQe+xNBL17aciuFUj5bHPzR6yF4AGO0u/mhsg5OuaANXLYyCKEkUC9aRhKIqn5BLic
 wKYGeMzclhDXzuVXv4iQ3CrV91QQI8uR3Bn0agzpRkbDWLr1vP+T5RqywReRK9qcrQu0G74gB9w
 qntT3v2xJT1svkuspUurWZls9XFygsHedkZg==
X-Received: by 2002:a17:907:3e05:b0:b83:95c8:15d0 with SMTP id
 a640c23a62f3a-b9081c1880bmr1092180566b.52.1772016940512; 
 Wed, 25 Feb 2026 02:55:40 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9348d6c5c3sm23164366b.11.2026.02.25.02.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 02:55:38 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id C889F5F8BA;
 Wed, 25 Feb 2026 10:55:37 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Wed, 25 Feb 2026 10:55:30 +0000
Message-ID: <20260225105537.1420002-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260225105537.1420002-1-alex.bennee@linaro.org>
References: <20260225105537.1420002-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772016940; x=1772621740; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/yTX0QTuJp0zDKtUPnCd6RUj+N8n5qd8EAKiy4U6HG4=;
 b=nHIS1QL3BbTjApS0HGa9lTY11Md63DHPVgU1sQ+DrInO/kaszvhEG59VcoC01i7Pbl
 cOeFxA+ATTjbUY4K8xdsQOjYIut8dvmg1+V4hwKJUoqIQNNMrzztSYYWthK3ym9VQqrx
 p8cpbBH9IOVs6x3SEm3ZjU85ZfxzKXaubZNLYxR9NUfQe1GVBCNUKcGxWTA0jkxMzIOx
 9yiaWRi6SDyoZ/ydSmti+8fZXitB4E9lbL51F1TyWZl1fxjLOeFp9+Xuq6jp9fkas1+L
 QtF0PIJrgwHN8T6SosaMntsOkfoTWF0s4ybgryDJcJafb+Xkxfys+3JlPqJP8x7aDM7Z
 z9yQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=nHIS1QL3
Subject: [Buildroot] [PATCH v6 1/6] toolchain/external: allow installing of
 libc utils
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rm9yIGJ1aWxkcm9vdCdzIG93biB0b29scyB3ZSBoYXZlIEJSMl9QQUNLQUdFX0dMSUJDX1VUSUxT
IChhbmQgc2ltaWxhcgpmb3IgdWxpYmMpLiBBcyB3ZSBuZWVkIHRoZSB0b29scyBmb3Igc29tZXRo
aW5ncyB3ZSBzaG91bGQgYWxzbyBzdXBwb3J0CnRoaXMgZm9yIGV4dGVybmFsIHRvb2xjaGFpbnMu
CgpTaWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+Ci0t
LQogdG9vbGNoYWluL3Rvb2xjaGFpbi1leHRlcm5hbC9Db25maWcuaW4gICAgICAgIHwgIDcgKysr
KysrCiAuLi4vcGtnLXRvb2xjaGFpbi1leHRlcm5hbC5tayAgICAgICAgICAgICAgICAgfCAyNCAr
KysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS90b29sY2hhaW4vdG9vbGNoYWluLWV4dGVybmFsL0NvbmZpZy5pbiBiL3Rvb2xj
aGFpbi90b29sY2hhaW4tZXh0ZXJuYWwvQ29uZmlnLmluCmluZGV4IDgzMTM4N2JjNGUuLmU3OWRh
ZmEzNjUgMTAwNjQ0Ci0tLSBhL3Rvb2xjaGFpbi90b29sY2hhaW4tZXh0ZXJuYWwvQ29uZmlnLmlu
CisrKyBiL3Rvb2xjaGFpbi90b29sY2hhaW4tZXh0ZXJuYWwvQ29uZmlnLmluCkBAIC0xMjUsNCAr
MTI1LDExIEBAIGNvbmZpZyBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0dEQl9TRVJWRVJfQ09QWQog
CSAgQ29weSB0aGUgZ2Ric2VydmVyIHByb3ZpZGVkIGJ5IHRoZSBleHRlcm5hbCB0b29sY2hhaW4g
dG8gdGhlCiAJICB0YXJnZXQuCiAKK2NvbmZpZyBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0xJQkNf
VVRJTFNfQ09QWQorCWJvb2wgIkluc3RhbGwgbGliYyB1dGlsaXRpZXMiCisJZGVwZW5kcyBvbiBC
UjJfVE9PTENIQUlOX0VYVEVSTkFMCisJaGVscAorCSAgRW5hYmxpbmcgdGhpcyBvcHRpb24gd2ls
bCBjb21waWxlIGFuZCBpbnN0YWxsIHRoZSBnZXRjb25mLAorCSAgbGRkIGFuZCBsb2NhbGUgZ2li
YyB1dGlsaXRpZXMgZm9yIHRoZSB0YXJnZXQuCisKIGVuZGlmICMgQlIyX1RPT0xDSEFJTl9FWFRF
Uk5BTApkaWZmIC0tZ2l0IGEvdG9vbGNoYWluL3Rvb2xjaGFpbi1leHRlcm5hbC9wa2ctdG9vbGNo
YWluLWV4dGVybmFsLm1rIGIvdG9vbGNoYWluL3Rvb2xjaGFpbi1leHRlcm5hbC9wa2ctdG9vbGNo
YWluLWV4dGVybmFsLm1rCmluZGV4IDI3MGNmODE0ZWQuLmI4NGFiYjYxMDYgMTAwNjQ0Ci0tLSBh
L3Rvb2xjaGFpbi90b29sY2hhaW4tZXh0ZXJuYWwvcGtnLXRvb2xjaGFpbi1leHRlcm5hbC5tawor
KysgYi90b29sY2hhaW4vdG9vbGNoYWluLWV4dGVybmFsL3BrZy10b29sY2hhaW4tZXh0ZXJuYWwu
bWsKQEAgLTQ0Niw2ICs0NDYsMjkgQEAgZGVmaW5lIFRPT0xDSEFJTl9FWFRFUk5BTF9JTlNUQUxM
X1RBUkdFVF9HREJTRVJWRVIKIGVuZGVmCiBlbmRpZgogCitpZmVxICgkKEJSMl9UT09MQ0hBSU5f
RVhURVJOQUxfTElCQ19VVElMU19DT1BZKSx5KQorZGVmaW5lIFRPT0xDSEFJTl9FWFRFUk5BTF9J
TlNUQUxMX1RBUkdFVF9MSUJDX1VUSUxTCisJJChRKSQoY2FsbCBNRVNTQUdFLCJDb3B5aW5nIGxp
YmMgdXRpbHMiKQorCSQoUSlBUkNIX1NZU1JPT1RfRElSPSIkKGNhbGwgdG9vbGNoYWluX2ZpbmRf
c3lzcm9vdCwkKFRPT0xDSEFJTl9FWFRFUk5BTF9DQykgJChUT09MQ0hBSU5fRVhURVJOQUxfQ0ZM
QUdTKSkiIDsgXAorCXV0aWxzX2ZvdW5kPTAgOyBcCisJZm9yIGQgaW4gJCR7QVJDSF9TWVNST09U
X0RJUn0gXAorCSAgICAgICAgICQke0FSQ0hfU1lTUk9PVF9ESVJ9L3VzciBcCisJCSAkKFRPT0xD
SEFJTl9FWFRFUk5BTF9JTlNUQUxMX0RJUik7IGRvIFwKKwkJaWYgdGVzdCAtZiAkJHtkfS9iaW4v
Z2V0Y29uZiA7IHRoZW4gXAorCQkJZm9yIGYgaW4gZ2V0Y29uZiBsZGQgbG9jYWxlOyBkbyBcCisJ
CQkJaW5zdGFsbCAtbSAwNzU1IC1EICQke2R9L2Jpbi8kJHtmfSAkKFRBUkdFVF9ESVIpL3Vzci9i
aW4gOyBcCisJCQlkb25lIDsgXAorCQkJdXRpbHNfZm91bmQ9MSA7IFwKKwkJCWJyZWFrIDsgXAor
CQlmaSA7IFwKKwlkb25lIDsgXAorCWlmIFsgJCR7dXRpbHNfZm91bmR9IC1lcSAwIF0gOyB0aGVu
IFwKKwkJZWNobyAiQ291bGQgbm90IGZpbmQgbGliYyB1dGlscyBpbiBleHRlcm5hbCB0b29sY2hh
aW4iIDsgXAorCQlleGl0IDEgOyBcCisJZmkKK2VuZGVmCitlbmRpZgorCiBkZWZpbmUgVE9PTENI
QUlOX0VYVEVSTkFMX0lOU1RBTExfU1lTUk9PVF9MSUJTCiAJJChRKVNZU1JPT1RfRElSPSIkKGNh
bGwgdG9vbGNoYWluX2ZpbmRfc3lzcm9vdCwkKFRPT0xDSEFJTl9FWFRFUk5BTF9DQykpIiA7IFwK
IAlBUkNIX1NZU1JPT1RfRElSPSIkKGNhbGwgdG9vbGNoYWluX2ZpbmRfc3lzcm9vdCwkKFRPT0xD
SEFJTl9FWFRFUk5BTF9DQykgJChUT09MQ0hBSU5fRVhURVJOQUxfQ0ZMQUdTKSkiIDsgXApAQCAt
NjI3LDYgKzY1MCw3IEBAIGVuZGVmCiBkZWZpbmUgJCgyKV9JTlNUQUxMX1RBUkdFVF9DTURTCiAJ
JCQoVE9PTENIQUlOX0VYVEVSTkFMX0NSRUFURV9UQVJHRVRfTElCX1NZTUxJTkspCiAJJCQoVE9P
TENIQUlOX0VYVEVSTkFMX0lOU1RBTExfVEFSR0VUX0xJQlMpCisJJCQoVE9PTENIQUlOX0VYVEVS
TkFMX0lOU1RBTExfVEFSR0VUX0xJQkNfVVRJTFMpCiAJJCQoVE9PTENIQUlOX0VYVEVSTkFMX0lO
U1RBTExfVEFSR0VUX0dEQlNFUlZFUikKIAkkJChUT09MQ0hBSU5fRVhURVJOQUxfRklYVVBfVUNM
SUJDTkdfTERTTykKIAkkJChUT09MQ0hBSU5fRVhURVJOQUxfSU5TVEFMTF9UQVJHRVRfTEREKQot
LSAKMi40Ny4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
