Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3F6F4BB9E
	for <buildroot@archiver.kernel.org>; Wed, 25 Feb 2026 10:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E027D41E4F;
	Wed, 25 Feb 2026 10:55:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QG5t4pme1I-V; Wed, 25 Feb 2026 10:55:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0501241E6E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772016953;
	bh=2injUL2XjoxKtRwJU3a4hVQK3QBP/F2QoB73uEtDqHU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Q0uqdFruvdQiYdkvEHsuI1Zvh3pU1Asjy9KNC+O/P60dHh20L7CxVq+m8H4sZ1BUo
	 tGroBa6R/Y9a4J/yWzgLHkFu1xVgeMkW32mZmoHknct+QT0S23YZIQIZN8dXOU6DxE
	 Q8ByMZRnhgwZlhw1r/kHJ+mRdcEBnfDZa7HCsiLtxfN9S9tLHedkmuKlSfUSMUnfOq
	 OYL9FkvI9nU8gBtR9w+jyRUEu212j4VAHRiUWnfVZGVdbqYa97Pa/fWewQmjb1bT8m
	 osEhLrXrvOwHYfMBkOIF6nPmXO/4aQmrCxzTYvAgr4oSx66fDUQsAB/cANhVw3vqTc
	 zYGJpm80uRxWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0501241E6E;
	Wed, 25 Feb 2026 10:55:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C7B53204
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 10:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD80B846BE
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 10:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 77vNoGWuNpCt for <buildroot@buildroot.org>;
 Wed, 25 Feb 2026 10:55:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::541; helo=mail-ed1-x541.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4E53883E39
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E53883E39
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E53883E39
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 10:55:46 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id
 4fb4d7f45d1cf-658b6757f7fso1576096a12.1
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 02:55:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772016944; x=1772621744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rzimJo2ZUQtqbKllCijmAA+uGbd7QhThTMtkmn0r/aM=;
 b=p5FBiZ+iEP0vJ9JeyZwn3MgqYu7/dofZB4gi7Aruzyij6n5oa+MfXLQnDpSzmQ9QWw
 +SDYk3r3JbDuUp7xux5em2LcStnyAkJwJUhphtwQn3GBmkYz5fE+EuyE9xNFutgrH8dK
 h4E4CBhYmvWiYYFPfJsoVg975ppQSjwOf+DBU2YOFNP64Dk8TkuHxRwGkRoVaUTrGCK0
 ShQcnukBPF9vpRgNAVIeeL69u/jilQCKj+Plr59w8MPj9d0mHvDKv9aF93LVo3VdQgGC
 dMxw6PNGvxoVVhZI3p8nDldNrPGQeZpPj7ZOnUuSuvRwWzv3N2k6erDLQ8z0eJKJXoKO
 Isqg==
X-Gm-Message-State: AOJu0YzJEq+f5we6cM0aY7sT6c4/7d+e7TsVFkTR0t4O5CKa2KgH7kdI
 7FFOvXJyj3kK8HNRV5bI9Zpylz5TMFcXNmqMiFYna39BtgL66mcJMzztPAwsY2ztbYeAdPSGivX
 FKeUn
X-Gm-Gg: ATEYQzyknKiINvQJuDyygxhF/yTWVnVzXUow1du9QEyhL26PGKc3CC3J3NtzR/Z0bZj
 rPn11zHbtEKUuZpjT14ps8Xd0ptKtL5CSeiOHNSi/TxdVgRvQcEkOOjYwSCHSysR3VbfO7VlaUD
 tpXbdqKLSpiIyXNrZ5MSEM3xKupbXLJm+yBAFTIq3opoObsx0HWMOFZtuFnRQJC29ppP4N+t2NX
 NggKZKgVkTPGc0Tjw3G6d9tzFzVz/sivE+/7oMjpSRb/HBr6IeccdixamlIRVYWYPxMP1sodJch
 F+VYOMSBy3QJD3pNjqAesbkopVzv7q1ZjtUA6325VHN8MrhOLCWyGjDLb3/RFJ3j9iT7OrltgW6
 NszbvBmrQkT7l3KXGsDspOu4MqfhujbAk+qmdToFGuXjeB16RfQc7tfN08M+w435eAc9MAYmmfv
 i75dPei/xopzgHm5JRImUxpxd6zATwZJVu7A==
X-Received: by 2002:a05:6402:34c5:b0:65a:1b27:b64f with SMTP id
 4fb4d7f45d1cf-65f7af8506fmr1870545a12.13.1772016943519; 
 Wed, 25 Feb 2026 02:55:43 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65f6e6b3dcasm1079252a12.25.2026.02.25.02.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 02:55:40 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 5F0265F8D3;
 Wed, 25 Feb 2026 10:55:39 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Wed, 25 Feb 2026 10:55:35 +0000
Message-ID: <20260225105537.1420002-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260225105537.1420002-1-alex.bennee@linaro.org>
References: <20260225105537.1420002-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772016944; x=1772621744; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rzimJo2ZUQtqbKllCijmAA+uGbd7QhThTMtkmn0r/aM=;
 b=CXFtrUdarMaiw36ZSAqOWIkgxCQsBNQ9HnwYcrUZnqEj/j36oC0L2vxWHf4XUhBkno
 PG6UhBAf5Dq2Lmy0LtCKZDDDZIQlXV3DlJgEKUjj9NRuFK20BE82tuLBtM4j0DdHDxlF
 KLt+OPj3+zRXaswatjhwh3rfofc3mksm6sbIfQoiBqc7ZM7AG2Y4OaT9J72H5Og11p56
 adlzgViOAj/oDBj5y4VmX8zWsemH35tKy2Ux5NrSuFs6jGo6Wt8m+6iNZwPlujs5hpkg
 Oe24zFX/zbIZWkq1s0gfEQNZxP6235vr/qiK4Eba76sppCDgjU745CuL9H6TJLGjQ8HA
 7tvg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=CXFtrUda
Subject: [Buildroot] [PATCH v6 6/6] package/kvm-unit-tests: allow kvmtool to
 be used
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
Cc: Thomas Huth <huth@tuxfamily.org>, Thomas Huth <th.huth+br@posteo.eu>,
 Cyril Bur <cyrilbur@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rm9yIHNvbWUgdGFyZ2V0cyBsYXVuY2hpbmcgdGVzdHMgd2l0aCBrdm10b29sIGlzIGFuIG9wdGlv
biB3aGljaCBtYWtlcwpmb3IgYW4gZXZlbiBzbWFsbGVyIHRlc3QgaW1hZ2UuIENyZWF0ZSBhIG5l
dyBzeW1ib2wgd2hpY2ggY2FuIGJlCmV4cGFuZGVkIHdpdGggYWRkaXRpb25hbCB0YXJnZXRzIHRo
YXQgd2lsbCBhbGxvdyB0aGUgc2tpcHBpbmcgb2YgdGhlCnNlbGVjdGlvbiBvZiBRRU1VIGlmIG5v
dCBuZWVkZWQuCgpSZXZpZXdlZC1ieTogVGhvbWFzIEh1dGggPGh1dGhAdHV4ZmFtaWx5Lm9yZz4K
U2lnbmVkLW9mZi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgoKLS0t
CnYyCiAgLSBleHBhbmQgdG8gaW5jbHVkZSByaXNjdiwgZGlkbid0IGJvdGhlciB3aXRoIDMyIGJp
dCBhcm0gZ2l2ZW4gaXRzIGRlcHJlY2F0ZWQKICAtIG9ubHkgZXhwYW5kIHRhcmdldCB3aGVuIGFy
Y2ggY2FuIHN1cHBvcnQgaXQKICAtIHVwZGF0ZSBjb21tZW50IGRlcGVuZHMKLS0tCiBwYWNrYWdl
L2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbiAgICAgICAgIHwgMTIgKysrKysrKysrLS0tCiBwYWNr
YWdlL2t2bS11bml0LXRlc3RzL2t2bS11bml0LXRlc3RzLm1rIHwgMTEgKysrKysrKysrKysKIDIg
ZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbiBiL3BhY2thZ2Uva3ZtLXVuaXQt
dGVzdHMvQ29uZmlnLmluCmluZGV4IDc0YzMyZjQ2ZTAuLmY1YjQxNzcxMDYgMTAwNjQ0Ci0tLSBh
L3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMvQ29uZmlnLmluCisrKyBiL3BhY2thZ2Uva3ZtLXVuaXQt
dGVzdHMvQ29uZmlnLmluCkBAIC0xMyw2ICsxMywxMSBAQCBjb25maWcgQlIyX1BBQ0tBR0VfS1ZN
X1VOSVRfVEVTVFNfQVJDSF9TVVBQT1JUUwogCWRlZmF1bHQgeSBpZiBCUjJfcG93ZXJwYzY0IHx8
IEJSMl9wb3dlcnBjNjRsZQogCWRlZmF1bHQgeSBpZiBCUjJfczM5MHgKIAorIyBTb21lIGFyY2hp
dGVjdHVyZXMgY2FuIHVzZSBrdm10b29sIGluc3RlYWQgb2YgUUVNVSB0byBsYXVuY2ggdGhlIHRl
c3RzCitjb25maWcgQlIyX1BBQ0tBR0VfS1ZNX1VOSVRfVEVTVFNfQ0FOX1VTRV9LVk1UT09MCisJ
Ym9vbAorCWRlZmF1bHQgeSBpZiAoQlIyX2FhcmNoNjQgfHwgQlIyX3Jpc2N2KSAmJiBCUjJfUEFD
S0FHRV9LVk1UT09MCisKIGNvbmZpZyBCUjJfUEFDS0FHRV9LVk1fVU5JVF9URVNUUwogCWJvb2wg
Imt2bS11bml0LXRlc3RzIgogCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfS1ZNX1VOSVRfVEVTVFNf
QVJDSF9TVVBQT1JUUwpAQCAtMjQsOCArMjksOCBAQCBjb25maWcgQlIyX1BBQ0tBR0VfS1ZNX1VO
SVRfVEVTVFMKIAlkZXBlbmRzIG9uIChCUjJfUEFDS0FHRV9HTElCQ19VVElMUyB8fCBcCiAJCSAg
ICBCUjJfVUNMSUJDX0lOU1RBTExfVVRJTFMgfHwgXAogCQkgICAgQlIyX1RPT0xDSEFJTl9FWFRF
Uk5BTF9MSUJDX1VUSUxTX0NPUFkpICMgcnVudGltZSBnZXRjb25mCi0Jc2VsZWN0IEJSMl9QQUNL
QUdFX1FFTVUKLQlzZWxlY3QgQlIyX1BBQ0tBR0VfUUVNVV9TWVNURU0gIyBydW50aW1lIGZvciBx
ZW11LXN5c3RlbS0kQVJDSAorCXNlbGVjdCBCUjJfUEFDS0FHRV9RRU1VIGlmICFCUjJfUEFDS0FH
RV9LVk1fVU5JVF9URVNUU19DQU5fVVNFX0tWTVRPT0wKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfUUVN
VV9TWVNURU0gaWYgIUJSMl9QQUNLQUdFX0tWTV9VTklUX1RFU1RTX0NBTl9VU0VfS1ZNVE9PTCAj
IHJ1bnRpbWUgZm9yIHFlbXUtc3lzdGVtLSRBUkNICiAJc2VsZWN0IEJSMl9QQUNLQUdFX0NPUkVV
VElMUyAjIHJ1bnRpbWUgZm9yIHRpbWVvdXQKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfQkFTSCAjIHJ1
bnRpbWUKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTk1BUApAQCAtNTUsNCArNjAsNSBAQCBjb21tZW50
ICJrdm0tdW5pdC10ZXN0cyBuZWVkcyBhIHRvb2xjaGFpbiB3LyB1dGlscywgZ2NjID49IDggYW5k
IHFlbXUiCiAJZGVwZW5kcyBvbiAhKEJSMl9QQUNLQUdFX0dMSUJDX1VUSUxTIHx8IFwKIAkJQlIy
X1VDTElCQ19JTlNUQUxMX1VUSUxTIHx8IFwKIAkJQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9MSUJD
X1VUSUxTX0NPUFkpCi0JZGVwZW5kcyBvbiAhQlIyX1BBQ0tBR0VfUUVNVV9BUkNIX1NVUFBPUlRT
X1RBUkdFVAorCWRlcGVuZHMgb24gIShCUjJfUEFDS0FHRV9RRU1VX0FSQ0hfU1VQUE9SVFNfVEFS
R0VUIHx8IFwKKwkJQlIyX1BBQ0tBR0VfS1ZNX1VOSVRfVEVTVFNfQ0FOX1VTRV9LVk1UT09MKQpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10ZXN0cy5tayBiL3Bh
Y2thZ2Uva3ZtLXVuaXQtdGVzdHMva3ZtLXVuaXQtdGVzdHMubWsKaW5kZXggZWZjM2M4NTlhYS4u
MDIxOTEyNzVhMiAxMDA2NDQKLS0tIGEvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10
ZXN0cy5taworKysgYi9wYWNrYWdlL2t2bS11bml0LXRlc3RzL2t2bS11bml0LXRlc3RzLm1rCkBA
IC00MCw2ICs0MCwxNyBAQCBLVk1fVU5JVF9URVNUU19DT05GX09QVFMgPVwKIAktLXByb2Nlc3Nv
cj0iJChHQ0NfVEFSR0VUX0NQVSkiIFwKIAktLWVuZGlhbj0iJChLVk1fVU5JVF9URVNUU19FTkRJ
QU4pIgogCisjIFRoZSBkZWZhdWx0IHJ1bm5lciBpcyBRRU1VIGJ1dCBrdm10b29sIGNhbiBhbHNv
IGJlIHVzZWQgb24gc29tZQorIyBhcmNoaXRlY3R1cmVzLiBUaGUgZmxhZyBvbmx5IHdvcmtzIGZv
ciB0aG9zZSBhcmNoaXRlY3R1cmVzIHRoYXQgY2FuCisjIHN1cHBvcnQgYm90aC4KK2lmZXEgKCQo
QlIyX1BBQ0tBR0VfS1ZNX1VOSVRfVEVTVFNfQ0FOX1VTRV9LVk1UT09MKSwgeSkKK2lmZXEgKCQo
QlIyX1BBQ0tBR0VfUUVNVV9TWVNURU0pLHkpCitLVk1fVU5JVF9URVNUU19DT05GX09QVFMgKz0g
LS10YXJnZXQ9cWVtdQorZWxzZSBpZmVxICgkKEJSMl9QQUNLQUdFX0tWTVRPT0wpLHkpCitLVk1f
VU5JVF9URVNUU19DT05GX09QVFMgKz0gLS10YXJnZXQ9a3ZtdG9vbAorZW5kaWYKK2VuZGlmCisK
IGlmZXEgKCQoQlIyX0FSTTY0X1BBR0VfU0laRV80SykseSkKIEtWTV9VTklUX1RFU1RTX0NPTkZf
T1BUUyArPSAtLXBhZ2Utc2l6ZT00awogZWxzZSBpZmVxICgkKEJSMl9BUk02NF9QQUdFX1NJWkVf
MTZLKSx5KQotLSAKMi40Ny4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
