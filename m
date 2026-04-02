Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56C8CC6B32
	for <buildroot@archiver.kernel.org>; Thu,  2 Apr 2026 08:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78E7160E01;
	Thu,  2 Apr 2026 08:31:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ULTfeNlt3kUT; Thu,  2 Apr 2026 08:31:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C64DD606D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775118716;
	bh=RHRGtnMGbV/ZPMFGJl104deZBdDxKOD1LTNwvv9MGB8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bqBJOOijKo0KIZkgIVXJyvmlTDBfuz961Bq0TM2n+A/eYYVUkk7lNxtdNkJox81Oh
	 zHfSHdhZi+qHh5pOSMl2e8IgOmKrslEPfltC++qxUJXqV6OUA3xo7eQy5Dz3IfgW2n
	 YZ5xcN30teVxoaNQePmSw6tqhitDFvWO45tFDB0DNNfr0gFee9Xw8EQR6XRrUMF+fH
	 01fxDa0RfU+chLjZ2id/CSRvK2BjmW4Wn0f1imVzzkMcANdbR+1C3zzDgrCGhT8epT
	 noEKwpcXDK00Oyn2V01lNrP1cP9WhtH4+1mlUiVw9UyN6e5z1/PSE2kWkCusPfkuJP
	 AR60G9x/WdbXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C64DD606D7;
	Thu,  2 Apr 2026 08:31:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9088F2A2
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 08:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76338813D8
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 08:31:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F2OW8H76Iosr for <buildroot@buildroot.org>;
 Thu,  2 Apr 2026 08:31:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E45D2813CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E45D2813CF
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E45D2813CF
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 08:31:53 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso17988005e9.0
 for <buildroot@buildroot.org>; Thu, 02 Apr 2026 01:31:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775118711; x=1775723511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/I9JeRArLjNqICEHgnV9Q1GMbLnuKc3u1G/eRXSiTMY=;
 b=aJKpNX22ff7AJ/9WVoI3DpXGxGbhZtiU0HpH+p8af9GPa7b1FNYzxeBItm7x32ZAXv
 BCR1woF17FdEKsilQ2p9g8w3pi6C6LJKsv1AoiyjU+2g58P0NBVtx5ARWmjFuDWV78Bz
 tDEzup8cgaI3lGLL5OikmhvB2U1Vcs4r0YHGm2loIsc1SH5OMoHK6wWcSnXM7mTcuoj9
 JXv9mR6SXHsvYqT9rcFeU1wVbbMwILdt5qdYDsNPBbszgKJNzB23KcG3kKr3TRJLtE3o
 UpA0nxuAo1VwqcTJ4CyV/VH3XIMq1uZ2NnEXoO7FeVmtftd4UbHTzKd0egcdyuhLGID+
 m+0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3n8VGEZYaHUvDMtayec/6A8CmrjBKM8lon1ZnW9PSbFCNqOLcyBrk8o7+StN7ZEN/Db3f0r3j+UE=@buildroot.org
X-Gm-Message-State: AOJu0Ywu24DB6z3i5kNVmGWidKKQugkvFyD1mt+fK4yw3gv/GIstymeJ
 bScPF5hU4SLiCZCv/F5+vCjOn8DVBflR7OPp4OZMUmS1qD1o3yKMgqJjMadMTymmc2x5NLAoo57
 UPyHwRGw=
X-Gm-Gg: ATEYQzxtiRUdTlHEnSyzVexr89/eth4p6Ay8c+2knF4EU236Lj/WW6cuU5vD2b2L/v+
 BzPYDv3wx3LBZK3LcmFmvA/HL3itJ6AY6sN2BSIKuNzfUP0EI2BYTxMghzsTs138irtd8XadSfJ
 +5bZsFxZrGpPQONE1NkDLdtIbxW5E0n5hRo3/0r9bEDQ4mXPuo9wEvKLNLWIAZPaB+EJbV7bpek
 yLfzngBkYzuIF9o1U9z04SMskbhdnsoXX6otjdaH6NdcudzrUi7DE2YFJ+6spjN8Vfe1ipFgzM+
 yVelL3zyqePUwTUhkLKSYSmBmWYRpvf10VvJDO32ht8BVY+GkLot+qihVykV/rq25SoCDQSAtif
 F0o5PW2HWxgzqEds4qcUrnbyDV5jHPbqm5P8nkBuPHOu4av715cDfjTmINkmGhH7MuQi909IJKo
 P0f4jpQ1YFBCteC2Ff
X-Received: by 2002:a05:600c:19d0:b0:477:9890:9ab8 with SMTP id
 5b1f17b1804b1-4888e01f5c4mr21138145e9.3.1775118711273; 
 Thu, 02 Apr 2026 01:31:51 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e967badsm227314345e9.14.2026.04.02.01.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2026 01:31:50 -0700 (PDT)
To: Martin Willi <martin@strongswan.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  2 Apr 2026 10:31:49 +0200
Message-ID: <20260402083150.168514-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <b195db8b73619949850e3d99f2282c3b4f69165f.camel@strongswan.org>
References: <b195db8b73619949850e3d99f2282c3b4f69165f.camel@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1775118711; x=1775723511; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/I9JeRArLjNqICEHgnV9Q1GMbLnuKc3u1G/eRXSiTMY=;
 b=SDpo1odTA2Y/zjQhz22TBqBcwbY+jswt9NS6ygSpZPQIo7bIvJk3ciXqt6T6raYpUj
 JQciXfWhPcvY6sWYa0DOqitYn6PeCIZuBZtFagChk1o8hFLvtaORFBhjVghlJ8VcH/ng
 wGq0oPM/SUbnJYdvmQgAS5W4mcskar5FoyrHp5cp4L7MXVVgmDmNQw9/v4bxcs9GA9FH
 AlSCSt+uTN0s2LFei9YW2MI8WQF/2bxZNGxa34qYhGbayyCvJLzWTAKZO4g1voQx8wJP
 NSE4JS99iipovZ1um3TeQURjNF+ZPac7SL0fPRxzmdJA/DMGWjzrmE31A4fY2AJkhB+f
 0QtA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=SDpo1odT
Subject: Re: [Buildroot] [PATCH v3 3/5] utils/generate-cyclonedx: generate
 externalReferences with source-distribution
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTWFydGluLAoKVGhpcyB3YXMgYW4gb3BlbiBxdWVzdGlvbiwgdGhhdCB3ZSBjYW4gZXhwbG9y
ZSBpbiB0aGUgZnV0dXJlLiBGb3IgbWUgSSB0aGluawp0aGlzIHBhdGNoIGlzIG9rIHRvIGJlIGFw
cGxpZWQgb3RoZXJ3aXNlLgoKSW4gcmVwbHkgb2Y6Cj4gSGkgVGhvbWFzLAo+IAo+IFRoYW5rcyBm
b3IgeW91ciByZXZpZXcuCj4gCj4gPiA+IElmIGEgaHR0cCBvciBodHRwcyBzb3VyY2UgZG93bmxv
YWQgVVJJIGlzIGF2YWlsYWJsZSBmcm9tIHNob3ctaW5mbywKPiA+ID4gZXh0cmFjdCBpdCBhbmQg
aW5jbHVkZSBpdCBhcyBhbiBleHRlcm5hbFJlZmVyZW5jZSBvZiB0eXBlCj4gPiA+ICJzb3VyY2Ut
ZGlzdHJpYnV0aW9uIiBpbiB0aGUgQ3ljbG9uZURYIG91dHB1dC4KPiAKPiA+IFdoYXQgYWJvdXQg
J2dpdCcgcmVwb3MgPyBJZiBJIHVuZGVyc3RhbmQgY29ycmVjdGx5IFVSSSBzdWNoIGFzOgo+ID4g
Cj4gPiBgYGAKPiA+IGdpdCtodHRwczovL2dpdGh1Yi5jb20vY29udGFpbmVycy9hYXJkdmFyay1k
bnMKPiA+IGBgYAo+ID4gCj4gPiBXb24ndCBiZSBwYXJ0IG9mIHRoZSAnc291cmNlLWRpc3RyaWJ1
dGlvbicuIFdoaWNoIGxvb2tzIHRvIG1ha2Ugc2Vuc2UKPiA+IGluIHJlZ2FyZCBvZiB0aGUgQ0RY
IHNwZWMuIENvdWxkIHdlIHVzZSBtYXliZSB0aGUgImRpc3RyaWJ1dGlvbiIKPiA+IHByb3BlcnR5
IGZvciB0aG9zZSA/IERvZXMgaXQgbWFrZSBzZW5zZSA/Cj4gPiAKPiA+IGh0dHBzOi8vY3ljbG9u
ZWR4Lm9yZy91c2UtY2FzZXMvZXh0ZXJuYWwtcmVzb3VyY2UtbGlua3MvCj4gCj4gSXQgbWFrZXMg
c2Vuc2UsIHllcywgYnV0IHRoZXJlIGFyZSBzb21lIHF1ZXN0aW9ucyB0aGF0IGFyaXNlOgo+IAo+
ICAqIFRoZXJlIGlzIGFsc28gYSAidmNzIiB0eXBlLCB3b3VsZCB0aGF0IG1hdGNoIGJldHRlciB0
aGFuCj4gICAgImRpc3RyaWJ1dGlvbiI/CgpJbmRlZWQgaXQgbG9va3MgZXZlbiBiZXR0ZXIgc3Vp
dGVkLiBJIGZpcnN0IHRob3VnaHQgaXQgd291bGQgdGhlIGFuIGlkZW50aWZpZXIKZm9yIHRoZSBW
Q1MgYnV0IGFjY29yZGluZyB0byB0aGUgZm9sbG93aW5nIGV4YW1wbGUgdGhleSB1c2UgdGhlIHJl
cG8gVVJMLgoKaHR0cHM6Ly9naXRodWIuY29tL0N5Y2xvbmVEWC9ib20tZXhhbXBsZXMvYmxvYi83
ZDkxNzJkMDBjODhjMDVhOGYxY2NiOTA1ODlkMTExODcwZmM5ZDg2L1NCT00vbGFyYXZlbC03LjEy
LjAvYm9tLjEuMy5qc29uI0wxMDkKCkxvb2tpbmcgYXQgdGhpcyBleGFtcGxlIG1ha2UgdGhlIGZy
b250aWVyIGJldHdlZW4KImRpc3RyaWJ1dGlvbiIvInNvdXJjZS1kaXN0cmlidXRpb24iLyJ2c2Mi
IGV2ZW4gbGVzcyBjbGVhciBhcyB0aGV5IHVzZSB0aGUKJ2Rpc3RyaWJ1dGlvbicgaWRlbnRpZmll
ciB0byBwb2ludCB0byB0aGUgJ3ppcCcuLi4KCj4gICogVGhlcmUgYXJlIChhIGZldykgb3RoZXIg
VkNTIHR5cGVzIGluIHVzZSwgc28gd2UgcHJvYmFibHkgc2hvdWxkIGRvCj4gICAgdGhpcyBmb3Ig
c3ZuL2N2cy9oZy9ienIgYXMgd2VsbD8KClllcyBtYWtlIHNlbnNlLgoKPiAgKiBNb3N0IGdpdCBT
SVRFcyB1c2UgaHR0cHM6Ly/CoFVSTHMuIEZyb20gdGhlIFVSTCBhbG9uZSwgaXQgbWF5IG5vdCBi
ZQo+ICAgIG9idmlvdXMgdGhhdCB0aGlzIGlzIGFuIFVSTCBmb3IgYSBnaXQgcmVwb3NpdG9yeS4g
U2hhbGwgd2UgYWRkIGEKPiAgICAiY29tbWVudCI/CgpTdXJlIGNvdWxkIGJlIHVzZWZ1bC4KCj4g
ICogQWRkaW5nIGhhc2hlcyBmcm9tIC5oYXNoIGZpbGVzIHByb2JhYmx5IGRvZXMgbm90IG1ha2Ug
c2Vuc2UsIGFzIGl0Cj4gICAgaXMgZm9yIGEgbG9jYWxseSBjb21wdXRlZCB0YXJiYWxsLCBub3Qg
YSBnaXQgcmVmZXJlbmNlIG9yIHNvbWV0aGluZy4KPiAgICBXZSBwcm9iYWJseSBzaG91bGQganVz
dCBub3QgYWRkIGhhc2hlcyBmb3IgcmVwb3NpdG9yeSByZWZlcmVuY2VzPwoKSWYgSSBsb29rIGF0
IHRoZSAnYWFyZHZhcmstZG5zJyBvciAnbGlieG1scnBjJyBleGFtcGxlIHRoZXJlIGlzIHN0aWxs
IGFuIGhhc2gKYXNzb2NpYXRlZCB0byBpdCB3b3VsZCBpdCBtYWtlIHNlbnNlIHRvIGFkZCB0aGVt
IGFueXdheSA/CgpCZXN0IHJlZ2FyZHMsClBFUkFMRSBUaG9tYXMKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
