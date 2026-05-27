Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76049CD4F54
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 19:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FC6F42351;
	Wed, 27 May 2026 19:54:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 207ktVYy8VxJ; Wed, 27 May 2026 19:54:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 604304234D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779911674;
	bh=Exp6m82k9ahcR5mDkaXYBvXpEHGP0T6USE4/w/8lR/U=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=I/7j0GwI7sxRyCq6ZEZ4DRGD+TI2usySoh9uxpTIywyii8HrAQSh8vAs1MxdNU/DN
	 z7zkI2rNecCWucBlniKzav8EWsxmJwAza2hzQ+zfnFju3pWUhkMihY+q8M6PRBLgJf
	 kx/ra94q/Y+xp7RZCwGha+FshcykQwj7c2SL8Jx/039JfCYHBp+DLdLalSXcn9gWx3
	 lnxkIJlRzgSXNJvOHqUiuwCWYgYqldAM95pzQot2Gjkt7vzMPWkhnxUdF8KaX8rD2A
	 lslbWspi8eNo2XR8tFMD3lPK1DtM3xsoFnZ2GU2eg+0FXaar9e+zBvBwl3xlc/lVT/
	 C4f2k7r19sUnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 604304234D;
	Wed, 27 May 2026 19:54:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E4B928A
 for <buildroot@buildroot.org>; Wed, 27 May 2026 19:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D06680F6D
 for <buildroot@buildroot.org>; Wed, 27 May 2026 19:54:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rzeXgpDfHlop for <buildroot@buildroot.org>;
 Wed, 27 May 2026 19:54:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=rgallaispou@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7CC1E80F61
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CC1E80F61
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7CC1E80F61
 for <buildroot@buildroot.org>; Wed, 27 May 2026 19:54:31 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-48984d29fe3so126922045e9.0
 for <buildroot@buildroot.org>; Wed, 27 May 2026 12:54:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779911669; x=1780516469;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GJhU7HHWUUR6DYgNkcobH1NbvCYSe/I9vJm/8HCSgx0=;
 b=ik2BjabiFPfWgzZc8uSYbZXb3N1P+82R7phkl0mBkqHZw2QpFJzzMtUr+39h62zccw
 xhN3FmjCkMKU+wbmAs8ahrQzIFhlCUeHMDaZFOwj/XyNLhGOybeUUFnxYH54ZSu6VsUE
 rwoCDtv/eALpodrmZToK5IGSKW3HR9yPI66pGgx35I5Hg8zGXBu1DZs5/3GRDGpaaKnp
 8ILrfOrbmQVEoezuc0K2NzlRP6AgTnGzyV1V4a2B2z+F+gquWBw9TjvKf/3TKd/Gxesw
 XmWvNQhwr01Kd0wc5lGDrxhtrLCASGWENH/8qGalMzR8L1g+rEPwa2agV9fqYC0+DBvT
 L/aw==
X-Gm-Message-State: AOJu0YyTADvFRdZkih03pOxj56l7W/Y88euXAUyFuIUF/FtapSxCd24N
 /gl5gViM5HEOgMsB5nlQXZsdR8gTTAC4EFkhVBpMMapPSEVs8ho2N3yYd2igPQ==
X-Gm-Gg: Acq92OH9S3LDZWECUXdTlUStXs1umHf+Ljd/ytYkqDhItyPpcpFjTGzaBMF5vuGJQt6
 SqoitBIHITEHneifPQOhKaOoCa08PDWW/9FphRFhy0Kb/s+ukGxAeMiw2AvX4xQbBFwudeGlcBd
 zERdqAzAOZF+zjhnCp03tG8SfQcwHyewUcEvDpPtaQ3RIEwRl6+fe1U6Q/CMtdMIj+vGGrmIq0d
 JYjDE/eCB71xUAQcXruM7CeqEKSrvUVAyknHKCygOAB/DTcPv56iKtzAgR3wtyYZXPXXColl8cp
 XSQ+bGCKBv0t287Ufy8SxaGeFRkji74Y3V18Pk/7cD20z5WJvxKZdYJElxNptxB7p+mVj9KQm14
 8sTdaCd+OJSE3RqhLlHRJ338Dsu6PkCjRcgJ8My6VujVbWq4/ae4ChgPGZVWfp0JE6SD1v4m+q6
 c7S4JEFbG6ddGgEwFZGu/L2GFT8Fh3/f+b2Lw=
X-Received: by 2002:a05:600c:4ecc:b0:490:3c15:7146 with SMTP id
 5b1f17b1804b1-490426cd872mr394240735e9.19.1779911669005; 
 Wed, 27 May 2026 12:54:29 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:f99c:d6cf:27e6:2b03])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45edb558449sm7702243f8f.13.2026.05.27.12.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 12:54:28 -0700 (PDT)
From: =?utf-8?q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
Date: Wed, 27 May 2026 21:53:52 +0200
MIME-Version: 1.0
Message-Id: <20260527-master-v1-1-0d975f3b3f0d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM2wpAUBCF4VfRXNvFlOOryMXYBqMc2oOUvLuNy
 6/+tS5QdsIKZXCB40NUltkjDgOwA809G2m9ASNMowQzM5Fu7AxygkVBRLkl8PHquJPzO6rq37o
 3I9vtXcN9PwFxiVtqAAAA
X-Change-ID: 20260527-master-2e5299aaa8ca
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1451; i=rgallaispou@gmail.com; 
 h=from:subject:message-id;
 bh=Xdhzk9oI5DRxuqk/K1cKHdS4s3kgL7vPpFRBvBTpOfs=; 
 b=owEBbQKS/ZANAwAKAechimjUEsK1AcsmYgBqF0vTddyDMCh04qIZx49nypPBmlPD+ovw5ukBH
 X/pxc+kopqJAjMEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCahdL0wAKCRDnIYpo1BLC
 tTqeD/9/5TUMqz2KhDuGqaS5wVlGO0K/KKbHZ5mlTPisB2H+za5sBD+ecc2AzLIDTiK7423Zn8q
 NroQby8v09OZgtW746tbxD/G1Kl8WkR4O1D87q/vXrP51stBOh5FWErRxEIjOXow81R8Wc5rBVZ
 //fpmArzzyA3uNvSwK6faxJKVLgMffCLNF5qPH/YPcsBH7OPcUpsa7jvP2Lq7OClTBgZ4VDxtgy
 ps0vhv0VsxTuys0N1MEpUoZTqUft1hFsUy5KRD5Vm8pmql+j8q/udsUKe5TS2PxmXKvQSNtlHlv
 NTZmODxrCVmwh2B4EoCKthVVrUNUbzx6vXIIV1DMP+KtDPN/Jd3LBp8qHBfX4E5XCTLohqAeMrI
 4cS9P3/lVq/eF9uNojSVjp48o7FiBiLtGNMDKZ+ANevhQLmw4MLEH5dc3NAxyE91ZgVrq6EgSwU
 rN57pEuwgBgjH/yPtdSFr54ZHbN0muuXjj3iwK7l4Am+fU38PKUJYKYByxgNzngsxPcuKwMQIHD
 XJUE266MT67NMXHv3l1i4IAwHwItPXfkJy6MWevCllszq55uLRyokPCZ5RwA+cIG5hplJXBF9Ba
 5lNmsMGNpJ3ISiXLfYSiTtkHZDFx06MqZ0stFrp7zUSz069C8FDCTLT8cm4v3HPUTYShM7Imwk5
 cq+4aSFUjVMeQZg==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779911669; x=1780516469; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GJhU7HHWUUR6DYgNkcobH1NbvCYSe/I9vJm/8HCSgx0=;
 b=T3kDjIqKBBm5vhKqwFJ1hk5R+mxdBgb/xJsaceKZrKCgIKCNBFRkC+QzyaT5R4jS8o
 RTnonIHiXNbg5jl/OzSIcnSlrgaW5Hla22Xgi3L4kcpFYBiq6/a1i5TCz5B/HOgZSy0o
 YxoP4GdTVZ4v8lK2i8B44grY7xmeNwQRR1YQIOZMcKgVVSPD5G+Fdyn4d5sxLnB4FB/j
 cODbXSC7ZaCcXAk9kbDF/tdInFz3yanXEiKiylRX+jsDS9iSsNaeICC4Ql/erIIiIdD9
 yTOvM+Oan6RobktQsARiidiNa8Q2df6pO3RXWX7wOY8IPmjVCkWH83GjhjUSIrDRNxJr
 tMMw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=T3kDjIqK
Subject: [Buildroot] [PATCH] package/libxkbcommon: provide xkbregistry when
 libxml2 is enabled
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

eGticmVnaXN0cnkgaXMgZGlzYWJsZWQgYnkgZGVmYXVsdC4gIFlldCwgaXQgb25seSBuZWVkcyBs
aWJ4bWwyIHRvIGJlCmJ1aWx0LCB3aGljaCBpcyBhbHJlYWR5IHN1cHBvcnRlZC4KCkFkZCB0aGUg
Y29tcGlsZSBmbGFncyB0byBidWlsZCB4a2JyZWdpc3RyeSB3aGVuIHBvc3NpYmxlLgoKU2lnbmVk
LW9mZi1ieTogUmFwaGHDq2wgR2FsbGFpcy1Qb3UgPHJnYWxsYWlzcG91QGdtYWlsLmNvbT4KLS0t
CiBwYWNrYWdlL2xpYnhrYmNvbW1vbi9saWJ4a2Jjb21tb24ubWsgfCAxMCArKysrKysrKy0tCiAx
IGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvbGlieGtiY29tbW9uL2xpYnhrYmNvbW1vbi5tayBiL3BhY2thZ2UvbGlieGti
Y29tbW9uL2xpYnhrYmNvbW1vbi5tawppbmRleCAyMWEyYjkzN2VmMDIuLjk4MTU0MzY5YjQxOSAx
MDA2NDQKLS0tIGEvcGFja2FnZS9saWJ4a2Jjb21tb24vbGlieGtiY29tbW9uLm1rCisrKyBiL3Bh
Y2thZ2UvbGlieGtiY29tbW9uL2xpYnhrYmNvbW1vbi5tawpAQCAtMTIsOCArMTIsNyBAQCBMSUJY
S0JDT01NT05fQ1BFX0lEX1ZFTkRPUiA9IHhrYmNvbW1vbgogTElCWEtCQ09NTU9OX0lOU1RBTExf
U1RBR0lORyA9IFlFUwogTElCWEtCQ09NTU9OX0RFUEVOREVOQ0lFUyA9IGhvc3QtYmlzb24gaG9z
dC1mbGV4CiBMSUJYS0JDT01NT05fQ09ORl9PUFRTID0gXAotCS1EZW5hYmxlLWRvY3M9ZmFsc2Ug
XAotCS1EZW5hYmxlLXhrYnJlZ2lzdHJ5PWZhbHNlCisJLURlbmFibGUtZG9jcz1mYWxzZQogCiBp
ZmVxICgkKEJSMl9QQUNLQUdFX1hPUkc3KSx5KQogTElCWEtCQ09NTU9OX0NPTkZfT1BUUyArPSAt
RGVuYWJsZS14MTE9dHJ1ZQpAQCAtMjIsNiArMjEsMTMgQEAgZWxzZQogTElCWEtCQ09NTU9OX0NP
TkZfT1BUUyArPSAtRGVuYWJsZS14MTE9ZmFsc2UKIGVuZGlmCiAKK2lmZXEgKCQoQlIyX1BBQ0tB
R0VfTElCWE1MMikseSkKK0xJQlhLQkNPTU1PTl9DT05GX09QVFMgKz0gLURlbmFibGUteGticmVn
aXN0cnk9dHJ1ZQorTElCWEtCQ09NTU9OX0RFUEVOREVOQ0lFUyArPSBsaWJ4bWwyCitlbHNlCitM
SUJYS0JDT01NT05fQ09ORl9PUFRTICs9IC1EZW5hYmxlLXhrYnJlZ2lzdHJ5PWZhbHNlCitlbmRp
ZgorCiBpZmVxICgkKEJSMl9QQUNLQUdFX0xJQlhLQkNPTU1PTl9UT09MUykseSkKIExJQlhLQkNP
TU1PTl9DT05GX09QVFMgKz0gLURlbmFibGUtdG9vbHM9dHJ1ZQogZWxzZQoKLS0tCmJhc2UtY29t
bWl0OiAwOGYzNzU3YjBmMjEzM2IwZWQ1MGUxZWYzZDdhNWExZDljODBkZTFjCmNoYW5nZS1pZDog
MjAyNjA1MjctbWFzdGVyLTJlNTI5OWFhYThjYQoKQmVzdCByZWdhcmRzLAotLSAgClJhcGhhw6ts
IEdhbGxhaXMtUG91IDxyZ2FsbGFpc3BvdUBnbWFpbC5jb20+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
