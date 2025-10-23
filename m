Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA16CCD1BE
	for <buildroot@archiver.kernel.org>; Thu, 23 Oct 2025 13:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C440845D7;
	Thu, 23 Oct 2025 13:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MinBSinQAg5G; Thu, 23 Oct 2025 13:50:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43CC3845D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43CC3845D4;
	Thu, 23 Oct 2025 13:50:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DC63070A
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 13:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C239341188
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 13:50:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i2aVgfUr8SJL for <buildroot@buildroot.org>;
 Thu, 23 Oct 2025 13:50:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9C7C941123
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C7C941123
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9C7C941123
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 13:50:17 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-63e076e24f2so1783240a12.3
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 06:50:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761227415; x=1761832215;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=EIJQvctgA4OXxH5q9oMz9QX4jq5b1fvhk5T2XB2J4Pg=;
 b=OGGvagnaNp1RS3NdzY2O39xDciKPx4+0piysMmvoXHBfa8yKAFkQiwCUvhO+bChZgH
 n2xX05JQZWCzn/egCFbOOxONWxwq76mx0O0CZ9s6DQy/fZOpXLfoIWh6Vx1mhwhMD0Vb
 +6vwqqg8xd7U1tmJ5skd6LJDVJmk94dkokyRXnN8IkizEm887KvM3nihDcSxPcZa8swC
 I0OehLeM27mCQzTtA/OLf6DuL4E4EvE2zi2ZkGu+t7x+LUFvN65+P42rhNrNuc91mzIC
 edqKMw1laTFwgc0FsIIaxV5b76MYsYMX0hp2bpKk4y+QPamDYtsN8a9Z+gJmb7OT1dSK
 7Ltw==
X-Gm-Message-State: AOJu0Yw6j50kokz40XoufvQB2iToLmBWWGk0pDndAXeSmsgEQzJWryb8
 EuHs2IRHY92EKK4XJwFj5z3EoPgAevr5NmqBj8hJP1HYwDSUcDSo4QGp6QIegjmcAxt5dlmnQ36
 L759MIpM=
X-Gm-Gg: ASbGncv09DHfRxnVLZjC0gEhdGkYH0KquOBKcK9PnoqLGAhtI9JSqdR1pVLZli1/fOD
 2ZGZfnyI/wN4PziNQhFnd4yyB0An25rMIgiRIwztjJTh7jMBjW4xVAviBgIPm0dgCXnEBkPAJWG
 zWlXwVbfPPlkDKh33koZIbH4R1+hO/ueuenCqqKCdLZ1UM9rSqEeEs4lljtvxlcoV1s5sPKcV8t
 x++SEPcPMch08JcAVjTxdFCUAQBw8gsJaFStIsUwyoXfXIxA1MyiBQA89GamEYXe4FnXcrnQo/Z
 cN7r7kuGY176xX52NdntTYYh0iEaMDsyqlNbE20vtmtNFCz23KBKZOlG7XSkvgRHcqICtcsJ4xV
 QstGRlhdC+5C+2xMiYCxyMGY9FmwRlXNVM4h7VSCmUgjy1jgtZGVYN1/cIPVDMO212ju9q0Q8OS
 NshOhgVuVDqv8hQZoaFJ52GfmYiME=
X-Google-Smtp-Source: AGHT+IFaePGPltCcY/UW0HWFfdF5vtxU2Hw6tWMYJ9hcbLOBr06Re+KN+VI2dZSvVUkjWlggzFODSA==
X-Received: by 2002:a17:906:4fc4:b0:b3a:b22e:dd35 with SMTP id
 a640c23a62f3a-b6471d45a69mr2875352766b.2.1761227414922; 
 Thu, 23 Oct 2025 06:50:14 -0700 (PDT)
Received: from [192.168.129.33] ([109.136.97.112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63e3f322cf3sm1708481a12.29.2025.10.23.06.50.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 06:50:14 -0700 (PDT)
Message-ID: <34229503-5bda-4427-9dea-17ea1dd4a688@mind.be>
Date: Thu, 23 Oct 2025 15:49:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: nvd@nist.gov
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1761227415; x=1761832215; darn=buildroot.org;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EIJQvctgA4OXxH5q9oMz9QX4jq5b1fvhk5T2XB2J4Pg=;
 b=AcuTyrzDVPP7G1aIMq2prf8SjYzsgU93bmcKv8jpV1EnjeLXi3oJldQUHRJWC4HtE6
 /EdJKJzQKhKvjNLsZuzVkg3c+/U/PCA1RkyQODLf9nLkGqDOBxmL9+WGocjINEEw0mFO
 3NlXgOekVUAS4VppgJEunD4UvxPrn267K2pPG5qn7Rf2xUsFPJV4knNtSSr2Nv6aHki/
 Z9vtc8del2nyN7x+xvqkWgBaG7WF3MN5++7RNbh1YDSbmWnZHP2Lnw/UQd2e8KoAyP08
 QtJxxleVGjmaHJa+u9HbXRF6YXNjCy45gF8NBqoM+ofuBeRzajakFKL/zwxgF1GePPvM
 ATEg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=AcuTyrzD
Subject: [Buildroot] Corrections to Known Affected Software Configurations
 in NVD CVE entries
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RGVhciBOVkQgbWFpbnRlbmFuY2UgdGVhbSwKCldoaWxlIHdvcmtpbmcgb24gdGhlIEJ1aWxkcm9v
dCAoaHR0cHM6Ly9idWlsZHJvb3Qub3JnLykgTG9uZy1UZXJtIApTdXBwb3J0IGJyYW5jaGVzLCBJ
IGNhbWUgYWNyb3NzIGEgZmV3IENWRSBlbnRyaWVzIGZyb20geW91ciBkYXRhYmFzZSAKd2hlcmUg
dGhlIEtub3duIEFmZmVjdGVkIFNvZnR3YXJlIENvbmZpZ3VyYXRpb24gYXJlIGluY29tcGxldGUg
b3IgCmluYWNjdXJhdGUuIENvbnNlcXVlbnRseSwgb3VyIGF1dG9tYXRlZCBhbmFseXNpcyBpbmNv
cnJlY3RseSBtYXJrcyBzb21lIApwYWNrYWdlcyBhcyBhZmZlY3RlZCBieSBDVkVzLCB3aGlsZSB0
aGV5IGFyZW4ndC4KCkNvdWxkIHlvdSBwbGVhc2UgdXBkYXRlIHRoZW0gd2l0aCB0aGUgZm9sbG93
aW5nIGluZm9ybWF0aW9uOgoKLSBodHRwczovL252ZC5uaXN0Lmdvdi92dWxuL2RldGFpbC9DVkUt
MjAyNS00NDc4OiBhcyBpbmRpY2F0ZWQgb24gdGhlIAp1cHN0cmVhbSBjb2RlIHJlcG9zaXRvcnkg
CihodHRwczovL2dpdGh1Yi5jb20vRnJlZVJEUC9GcmVlUkRQL3B1bGwvMTE1NzMjaXNzdWVjb21t
ZW50LTI5MDQxNjA1MjQpLCAKdGhlIGlzc3VlIG9ubHkgYWZmZWN0cyBmcmVlcmRwPj0zLjAuCiDC
oCDCoCA9PiBDb3VsZCB5b3UgcGxlYXNlIGluZGljYXRlIHRoYXQgaXQgYWZmZWN0cyAKYGNwZToy
LjM6YTpmcmVlcmRwOmZyZWVyZHA6KjoqOio6KjoqOio6KjoqYCBzdGFydGluZyBmcm9tIHZlcnNp
b24gMy4wID8KCi0gaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjUtNTMx
ODogdGhlIEN1cnJlbnQgCkRlc2NyaXB0aW9uIHRleHQgb2YgdGhlIENWRSBpbmRpY2F0ZXMgdGhh
dCB0aGUgaXNzdWUgYWZmZWN0cyBsaWJzc2ggCjwwLjExLjIsIGJ1dCB0aGlzIGlzIG5vdCByZWZs
ZWN0ZWQgaW4gdGhlIEtub3duIFNvZnR3YXJlIENvbmZpZ3VyYXRpb24gCnNlY3Rpb24uCiDCoCDC
oCA9PiBDb3VsZCB5b3UgcGxlYXNlIGluZGljYXRlIHRoYXQgaXQgYWZmZWN0cyAKYGNwZToyLjM6
YTpsaWJzc2g6bGlic3NoOio6KjoqOio6KjoqOio6KmAgdXAgdG8gKGV4Y2x1ZGluZykgdmVyc2lv
biAwLjExLjIgPwoKLSBodHRwczovL252ZC5uaXN0Lmdvdi92dWxuL2RldGFpbC9DVkUtMjAyMS0z
MTY5MzogdGhlIEN1cnJlbnQgCkRlc2NyaXB0aW9uIHRleHQgb2YgdGhlIENWRSBpbmRpY2F0ZXMg
dGhhdCAiVk13YXJlIGluZm9ybWF0aW9uLCAKcHJldmlvdXNseSBjb25uZWN0ZWQgdG8gdGhpcyBD
VkUgSUQgYmVjYXVzZSBvZiBhIHR5cG8sIGlzIGF0IApDVkUtMjAyMi0zMTY5MyIuIEluZGVlZCwg
dGhpcyBDVkUgaXMgcmVsYXRlZCB0byBhIFdvcmRwcmVzcyBQbHVnaW4sIGJ1dCAKdGhlIEtub3du
IEFmZmVjdGVkIFNvZnR3YXJlIENvbmZpZ3VyYXRpb24gbWVudGlvbnMgVk1XYXJlIHRvb2xzCiDC
oCDCoCA9PiBDb3VsZCB5b3UgcGxlYXNlIHJlbW92ZSB0aGUgS25vd24gQWZmZWN0ZWQgU29mdHdh
cmUgCkNvbmZpZ3VyYXRpb24gYGNwZToyLjM6YTp2bXdhcmU6dG9vbHM6KjoqOio6Kjp3aW5kb3dz
Oio6KjoqYCA/CgotIGh0dHBzOi8vbnZkLm5pc3QuZ292L3Z1bG4vZGV0YWlsL0NWRS0yMDIzLTIy
NzQ1OiB0aGUgdXBzdHJlYW0gY29tbWl0IAp0aGF0IGZpeGVzIHRoZSBpc3N1ZSwgcmVmZXJlbmNl
ZCBvbiB0aGUgQ1ZFIHBhZ2UgCihodHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0y
LXRzcy9jb21taXQvMzA2NDkwYzhkODQ4YzM2N2ZhYTJkOWRmODFmNWU2OWRhYjQ2ZmZiNSkgCmhh
cyBhbHNvIGJlZW4gYmFja3BvcnRlZCB0byB0aGUgMy4yIGJyYW5jaCAoc2VlIApodHRwczovL2dp
dGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRzcy9jb21taXQvN2FiNDI5NTMyMTZhZGVjMDQ2
ZDAwMGE1ZTMwODVmM2VlNWU5Y2FiZiksIAphbmQgdGhlcmVmb3JlIHRwbTItdHNzIDMuMi4yIGlz
IG5vIGxvbmdlciBhZmZlY3RlZCAoc2VlIGFsc28gCmh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNv
ZnR3YXJlL3RwbTItdHNzL3JlbGVhc2VzL3RhZy8zLjIuMikKIMKgIMKgID0+IENvdWxkIHlvdSBw
bGVhc2UgcmVmbGVjdCB0aGF0IGluIHRoZSBLbm93biBBZmZlY3RlZCBTb2Z0d2FyZSAKQ29uZmln
dXJhdGlvbiA/CgpUaGFuayB5b3UgaW4gYWR2YW5jZSwgYW5kIGhhdmUgYSBnb29kIGRheSAhCgpU
aXRvdWFuIENocmlzdG9waGUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
