Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D718D3E78C
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 09:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA07460659;
	Wed,  6 Nov 2024 09:37:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y_MeodNE4YCR; Wed,  6 Nov 2024 09:37:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A799260844
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A799260844;
	Wed,  6 Nov 2024 09:37:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FBAF3B
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 09:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D46780E79
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 09:37:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W8zg73KiWMfP for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 09:37:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com;
 envelope-from=josephzik@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0E6B280E76
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E6B280E76
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E6B280E76
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 09:37:35 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2e5b1aaad96so656551a91.0
 for <buildroot@buildroot.org>; Wed, 06 Nov 2024 01:37:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730885855; x=1731490655;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8UWrp9jxtY39Hu4wvXzKqTmxb2689tpJE2DweVR73bY=;
 b=f0dv2iJXmBuv1GbAJQ1EXdEwCzIVtjvdChnjaASJSbBbBKlcDa10rOorpsXgHZ7U9Q
 se4eHY5xfAqs6QKEiKxr/wjgFKfK50Y8uFOQWnneUvSw6GCWTBR/CtPKTxeC56Ylej3e
 IzqstLDm98A566Ugpf4yanDbE09z+rb/xsst2mheO5GC6fyMhSFDvvQh/NjOwkmY2q88
 PyG8yc7+/yKoDdfXohtFNYL/a/LxJw9l6jFCFZ9gdil+vxfLMEHrDygq3tSqs85dR4lh
 IrPzwXU0got307PRb85AQ1HtUAKp+pqQZxrnPkQ79hzALRXDGhmX9ZA/Kmi6jfCsmaj5
 R24Q==
X-Gm-Message-State: AOJu0YwS7+BcG33BISy7cE9id69SNtrqmijeDEvac+BwQEOFx4YA7nzI
 zmd2KU7AZmFZ/yT8GLZd94gNV6TSJZfqNYF3B9GVVFbtJjNV89iN/LCgpQX45oqZpPVu/efiYWP
 yR/EgPrAaFD00m1FtG4DyxN7tzmDVkodH
X-Google-Smtp-Source: AGHT+IFTX1hWVKea0Ya2WDxwnR/PgWp5cvKfz3aUjj/nzOGNfV7MhvBLZyKI3A/bYRwYRUHQthwJPAvFjrlqs0hzLSE=
X-Received: by 2002:a17:90b:4a90:b0:2e2:a70a:f107 with SMTP id
 98e67ed59e1d1-2e8f0f4f79cmr19338471a91.1.1730885855043; Wed, 06 Nov 2024
 01:37:35 -0800 (PST)
MIME-Version: 1.0
From: Joseph Zikusooka <josephzik@gmail.com>
Date: Wed, 6 Nov 2024 12:37:20 +0300
Message-ID: <CAPWx8vt5DbqipAoG4TAfKmFQikEdn9kxJMLJpFX=0aaCfD8DwQ@mail.gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/mixed; boundary="0000000000008a2dfb06263b443d"
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730885855; x=1731490655; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=8UWrp9jxtY39Hu4wvXzKqTmxb2689tpJE2DweVR73bY=;
 b=moaAj9r5ckCLivQEFfkwuNg8Etpmd/0lSNgLoc8k+bAtHeqmJn3M5pJOFwIl+yqxke
 7+CiOJnzdmL/Dq8iw6vIUavSRTJKzto0MQWZrgSTJfB7AlJCmoyTD+jHMUD4wYzmzCMQ
 eI56KjvXmS4dF7hIIHAG0fzbpDhYcNb/TthNx8IH8/qPiGCHOp9+KOIXjrMQfJLvdl19
 IJ3GiYgGqLVq6/qxFW2vZyW4NUMhDmEIH6/MInrH9qNBfSmG26Ufa2AxygJTFT2wzTjK
 nwWI9p/d7PqJDhJEZnQRV1P7lB48r5D6RAvJkIfiNo9lNikwv9L1jw0rOGippZsFOv7A
 T/Lg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=moaAj9r5
Subject: [Buildroot] New package: Kea DHCP
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
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--0000000000008a2dfb06263b443d
Content-Type: text/plain; charset="UTF-8"

Please find attached patch for new package

Thank you!

-- 
Joseph Zikusooka

--0000000000008a2dfb06263b443d
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-Kea-new-package-kea-version-2.6.1.patch"
Content-Disposition: attachment; 
	filename="0001-Kea-new-package-kea-version-2.6.1.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m35oot210>
X-Attachment-Id: f_m35oot210

RnJvbSBhMDE1MjkxZGM5NGI1NDk3YWMxZmQ2MGEyZTRjZjg0ZmUzYzgyY2I1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKb3NlcGggWmlrdXNvb2thIDxqb3NlcGhAamFtYnVsYS5uZXQ+
CkRhdGU6IFN1biwgMyBOb3YgMjAyNCAxNTowOTo1NiArMDMwMApTdWJqZWN0OiBbUEFUQ0ggMS8x
XSAgS2VhOiBuZXcgcGFja2FnZSAtIGtlYSB2ZXJzaW9uIDIuNi4xCgogQWRkIEtlYSwgYW4gb3Bl
bi1zb3VyY2UgRHluYW1pYyBIb3N0IENvbmZpZ3VyYXRpb24gUHJvdG9jb2wgKERIQ1ApCiBzZXJ2
ZXIgZGV2ZWxvcGVkIGJ5IHRoZSBJbnRlcm5ldCBTeXN0ZW1zIENvbnNvcnRpdW0gKElTQykuCiBJ
dCdzIGRlc2lnbmVkIHRvIHByb3ZpZGUgZHluYW1pYyBJUCBhZGRyZXNzIGFsbG9jYXRpb24gYW5k
CiBjb25maWd1cmF0aW9uIGZvciBkZXZpY2VzIG9uIGEgbmV0d29yay4gS2VhIGlzIGtub3duIGZv
ciBpdHMKIG1vZHVsYXIgYXJjaGl0ZWN0dXJlLCBhbGxvd2luZyBmb3IgZWFzeSBleHRlbnNpb24g
YW5kIGludGVncmF0aW9uCiB3aXRoIG90aGVyIHNlcnZpY2VzLgoKU2lnbmVkLW9mZi1ieTogSm9z
ZXBoIFppa3Vzb29rYSA8am9zZXBoQGphbWJ1bGEubmV0PgotLS0KIHBhY2thZ2UvQ29uZmlnLmlu
ICAgICB8ICAxICsKIHBhY2thZ2Uva2VhL0NvbmZpZy5pbiB8IDE2ICsrKysrKysrKysrKysrKysK
IHBhY2thZ2Uva2VhL2tlYS5oYXNoICB8ICAzICsrKwogcGFja2FnZS9rZWEva2VhLm1rICAgIHwg
MTcgKysrKysrKysrKysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKQog
Y3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uva2VhL0NvbmZpZy5pbgogY3JlYXRlIG1vZGUgMTAw
NjQ0IHBhY2thZ2Uva2VhL2tlYS5oYXNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9rZWEv
a2VhLm1rCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5p
bgppbmRleCA4NzZiMzQwYThhLi40YmZjMTRiZGJmIDEwMDY0NAotLS0gYS9wYWNrYWdlL0NvbmZp
Zy5pbgorKysgYi9wYWNrYWdlL0NvbmZpZy5pbgpAQCAtMjUxNiw2ICsyNTE2LDcgQEAgZW5kaWYK
IAlzb3VyY2UgInBhY2thZ2UvaXcvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9pd2QvQ29u
ZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9qYW51cy1nYXRld2F5L0NvbmZpZy5pbiIKKwlzb3Vy
Y2UgInBhY2thZ2Uva2VhL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2Uva2VlcGFsaXZlZC9D
b25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL2tpc21ldC9Db25maWcuaW4iCiAJc291cmNlICJw
YWNrYWdlL2tub2NrL0NvbmZpZy5pbiIKZGlmZiAtLWdpdCBhL3BhY2thZ2Uva2VhL0NvbmZpZy5p
biBiL3BhY2thZ2Uva2VhL0NvbmZpZy5pbgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAw
MDAwMDAwLi41MDg2NzFhOTgzCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9rZWEvQ29uZmln
LmluCkBAIC0wLDAgKzEsMTYgQEAKK2NvbmZpZyBCUjJfUEFDS0FHRV9LRUEKKworCWJvb2wgImtl
YSIKKworCXNlbGVjdCBCUjJfUEFDS0FHRV9CT09TVAorCXNlbGVjdCBCUjJfUEFDS0FHRV9PUEVO
U1NMCisJc2VsZWN0IEJSMl9QQUNLQUdFX0xPRzRDUExVUworCisJaGVscAorCSAgREhDUCBpbXBs
ZW1lbnRhdGlvbiBmcm9tIEludGVybmV0IFN5c3RlbXMgQ29uc29ydGl1bSwgSW5jLiB0aGF0IGZl
YXR1cmVzIGZ1bGx5CisJICBmdW5jdGlvbmFsIERIQ1B2NCwgREhDUHY2IGFuZCBEeW5hbWljIERO
UyBzZXJ2ZXJzLgorCSAgQm90aCBESENQIHNlcnZlcnMgZnVsbHkgc3VwcG9ydCBzZXJ2ZXIgZGlz
Y292ZXJ5LCBhZGRyZXNzIGFzc2lnbm1lbnQsIHJlbmV3YWwsCisJICByZWJpbmRpbmcgYW5kIHJl
bGVhc2UuIFRoZSBESENQdjYgc2VydmVyIHN1cHBvcnRzIHByZWZpeCBkZWxlZ2F0aW9uLiBCb3Ro
CisJICBzZXJ2ZXJzIHN1cHBvcnQgRE5TIFVwZGF0ZSBtZWNoYW5pc20sIHVzaW5nIHN0YW5kLWFs
b25lIERETlMgZGFlbW9uCisKKyAgICAgICAgICBodHRwczovL3d3dy5pc2Mub3JnL2tlYQpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9rZWEva2VhLmhhc2ggYi9wYWNrYWdlL2tlYS9rZWEuaGFzaApuZXcg
ZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5jMzYyZGFkYmIxCi0tLSAvZGV2L251
bGwKKysrIGIvcGFja2FnZS9rZWEva2VhLmhhc2gKQEAgLTAsMCArMSwzIEBACisjIExvY2FsbHkg
Y29tcHV0ZWQgLSBzaGEyNTYKK3NoYTI1NiAgZDJjZTE0YTkxYzJlMjQ4YWQyODc2ZTI5MTUyZDY0
N2JjYzVlNDMzYmM2OGRhZmFkMGVlOTZlYzE2NmZjZmFkMSAga2VhLTIuNi4xLnRhci5negorc2hh
MjU2ICBiYjkzZTk2OGEzYzJmMDQ4NzkzOGQyNDVjNTFiMTFlZGRhMDQ4YzE5MDBjZDNmZGZkOTg5
N2U0OGNlNmI4MzhmICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL2tlYS9rZWEubWsgYi9w
YWNrYWdlL2tlYS9rZWEubWsKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4u
YThiZGI5YzRlMAotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2Uva2VhL2tlYS5tawpAQCAtMCww
ICsxLDE3IEBACisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworIworIyBrZWEKKyMKKyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjCisKK0tFQV9WRVJTSU9OID0gMi42LjEKK0tFQV9TT1VSQ0UgPSBrZWEt
JChLRUFfVkVSU0lPTikudGFyLmd6CitLRUFfU0lURSA9IGh0dHBzOi8vZGwuY2xvdWRzbWl0aC5p
by9wdWJsaWMvaXNjL2tlYS0yLTYvcmF3L3ZlcnNpb25zLyQoS0VBX1ZFUlNJT04pCisKK0tFQV9M
SUNFTlNFID0gTVBMIDIuMAorS0VBX0xJQ0VOU0VfRklMRVMgPSBDT1BZUklHSFQKKworS0VBX0lO
U1RBTExfU1RBR0lORyA9IFlFUworS0VBX0lOU1RBTExfVEFSR0VUID0gWUVTCisKKyQoZXZhbCAk
KGF1dG90b29scy1wYWNrYWdlKSkKLS0gCjIuNDAuMQoK
--0000000000008a2dfb06263b443d
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--0000000000008a2dfb06263b443d--
