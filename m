Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E345CAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 21:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1DD784D89;
	Thu, 11 Sep 2025 21:28:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7sqNw0uQcB06; Thu, 11 Sep 2025 21:28:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1324184D80
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1324184D80;
	Thu, 11 Sep 2025 21:28:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 678F612D
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 21:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59D6C84D69
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 21:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KIhfpeVyOsXd for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 21:27:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6D5FB84D6D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D5FB84D6D
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6D5FB84D6D
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 21:27:59 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45b9c35bc0aso10058735e9.2
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 14:27:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757626077; x=1758230877;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q2OqyvZMIUhcLUFLAu0RnvX9ZJEe+7tCs8zWk03ruxA=;
 b=aTKWyWud5QlYuBwuTA0MfcsJpZrGPTTGQ6+TdX2+kIyuyOMUA2L84tm5k3qxtSiRWz
 lES/sJlh7pxdDjF/Dn7MZNPbZMH8vZd9/Dbv+p3KOz6AGk564hYRKp5EjCDDISnPN/bp
 7wKkxfsqoXY1O16JCzgEMuA65DhSPbdE6C5JgqHIikC/f0KwEjE9jAqgRmj3p/9KoCnH
 ki+OocHpD9BEqWtVRRbiBptYLUxvMkSnwT7WDmvw3rFe4tLlbyI/Pl4fBudN59QLiISM
 MEgTdUopN1RUMrWOz8SOmYKwv3IpZaHjlgJJqMazZxSwyITwqcvFFCF6PAgQI1kA9q5a
 VjkA==
X-Gm-Message-State: AOJu0Yx8D8aPoDMiSYaydS+G3kKYmvxBAUi0GSzdghEnpSvkieTWLgo8
 jLqCogVxeH79cGwOsymKEmI0F4X1iiWIrB+GpGq8bb2AAvIKJYIgQbu7uvl0qxjem/c=
X-Gm-Gg: ASbGncsjBe+vbyT9E1lwPMRbV8FOv6EAWEwHJ7jNXxSRZJG88D/Us3ocKKgeq8ip2PM
 Tsc1eEG4c91OMqxY6pwu0A26152sMmE36ETgYynlQ/A59JXvgotApv1nHcp5/49WtqanVGkhrqo
 lyVPkR1OEzrCwico2x+SLcgDTnAg0BoRh+xPzC42ld87N7o3SzRObfSRDqvfvwVw15FP4t/Jgna
 gb9dmuRnQoaZMq9IBZc5h2npxeB41urLSXCXdA09OJK9amKtJmekUzUT8thmYGCIcfEifChJJNV
 /anCu9Ptbe7OyuooBhNQBEXvp2Mdco152fhpr6mYxvBdeBY9VDpFLf7Nwp6pMELrPTQpCPeGHIb
 5jD9zkB45zBB/mEBHao7DJ+ZtpRA3CiVSDg==
X-Google-Smtp-Source: AGHT+IGgiCoyTu/2L5UMtbF//0gwrf7iQfSOJgE6iOIl5UXB2k7wxJLtJ3V3kO6FIG/XCEz2pewTrw==
X-Received: by 2002:a05:600c:4453:b0:45d:e6b6:55fe with SMTP id
 5b1f17b1804b1-45f2120955fmr6644165e9.34.1757626077479; 
 Thu, 11 Sep 2025 14:27:57 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7607e2eb5sm3906718f8f.58.2025.09.11.14.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 14:27:55 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 65AF45F834;
 Thu, 11 Sep 2025 22:27:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 22:27:41 +0100
Message-ID: <20250911212752.266940-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250911212752.266940-1-alex.bennee@linaro.org>
References: <20250911212752.266940-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757626077; x=1758230877; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q2OqyvZMIUhcLUFLAu0RnvX9ZJEe+7tCs8zWk03ruxA=;
 b=ZFhpn4yZmbGyKvfrkotr1V7kHZSpduu+B8hsFv79StWct+6vDAkvM0+QMIptDMcP13
 lQwc6WuzoL7VnAabisSWPBDGu4pSI98Er+V6XQhsKN1/l4jS1peHjBbOfuLozka0ATGw
 FZ+1CvDcRq3J0m3OURQkX8POHW1jozfDdWmXgriUs3a7VZ1BsVy5JgwQwFbqEk+glmJR
 E4t/Ud2dsvJTWFNzQeuHaeMq6aDSaMYMIgALY84LOOSppyKB7UplZ1g9fHVn7H+cyaTf
 fo3ah0ghlbe21LfgQ2gNEI3IlUJMvVCWSuroSu1JCYDTXzsr0SBlTqRxzvuIAoDHRTxs
 zk4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=ZFhpn4yZ
Subject: [Buildroot] [PATCH v5 1/9] toolchain/external: allow installing of
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
YWluLWV4dGVybmFsLm1rCmluZGV4IDJjMmFmYTc2YzAuLjQyODFjMjQwYWYgMTAwNjQ0Ci0tLSBh
L3Rvb2xjaGFpbi90b29sY2hhaW4tZXh0ZXJuYWwvcGtnLXRvb2xjaGFpbi1leHRlcm5hbC5tawor
KysgYi90b29sY2hhaW4vdG9vbGNoYWluLWV4dGVybmFsL3BrZy10b29sY2hhaW4tZXh0ZXJuYWwu
bWsKQEAgLTQ1MCw2ICs0NTAsMjkgQEAgZGVmaW5lIFRPT0xDSEFJTl9FWFRFUk5BTF9JTlNUQUxM
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
NjMxLDYgKzY1NCw3IEBAIGVuZGVmCiBkZWZpbmUgJCgyKV9JTlNUQUxMX1RBUkdFVF9DTURTCiAJ
JCQoVE9PTENIQUlOX0VYVEVSTkFMX0NSRUFURV9UQVJHRVRfTElCX1NZTUxJTkspCiAJJCQoVE9P
TENIQUlOX0VYVEVSTkFMX0lOU1RBTExfVEFSR0VUX0xJQlMpCisJJCQoVE9PTENIQUlOX0VYVEVS
TkFMX0lOU1RBTExfVEFSR0VUX0xJQkNfVVRJTFMpCiAJJCQoVE9PTENIQUlOX0VYVEVSTkFMX0lO
U1RBTExfVEFSR0VUX0dEQlNFUlZFUikKIAkkJChUT09MQ0hBSU5fRVhURVJOQUxfRklYVVBfVUNM
SUJDTkdfTERTTykKIAkkJChUT09MQ0hBSU5fRVhURVJOQUxfSU5TVEFMTF9UQVJHRVRfTEREKQot
LSAKMi40Ny4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
