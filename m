Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7F4C77B7F
	for <buildroot@archiver.kernel.org>; Fri, 27 Jun 2025 12:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38C6F404EF;
	Fri, 27 Jun 2025 12:55:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0DD2TjQCrbf5; Fri, 27 Jun 2025 12:55:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D125419C0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D125419C0;
	Fri, 27 Jun 2025 12:55:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FB66154
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 12:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 751E541A1A
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 12:55:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HKjtX9AVvhe3 for <buildroot@buildroot.org>;
 Fri, 27 Jun 2025 12:55:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C085E404EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C085E404EF
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C085E404EF
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 12:55:30 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-60780d74c85so3214534a12.2
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 05:55:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751028928; x=1751633728;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z+U1T8c1r2aAydTmRAgBWaDOoBlB4og4Z6GivHFVyB0=;
 b=DCshR/o4amPf2XJ2aW/tigr3SFZykmNkrGCWHA6ohxEUehFqus5kLIRhzaMrGl8IQT
 h0E/YAT7outwR+SYvnnzljrXC7cVVlMFC2B/Ymn7DcgNtkMC6mwpe0mF2nUJ1jKiaJ6S
 q0K9MIoo48NUt5qFGO2MhFaNZIz4y2hq1ZGXVyniP3xLj4MkxEVdMP28KjqJWvtzbStC
 vio3mC3VtuJCaPOWv/vQXBBb6Cx/J9Dl1jsVmmePyysqObiH49AvzPCcpix1UrHUYqA4
 0Ffq1IaaopTBcjWqbzU2ligqb2IyFmlgfkdQI2DEtjAYOxTgDGibIbi8kDQL3Qxg9vls
 bi8A==
X-Gm-Message-State: AOJu0YzSRi8zie2jYJ7vO8kEsLRTxf5q8NwFlo4l5HEZI/4X1kO3+6AJ
 WiZs6pPPVoR5mS/H4FkXy5ocbb8K75cfG7c9OJg23mxlsX7+uFT5OMaQZ29QUxQ=
X-Gm-Gg: ASbGncu4Ht5bva+OrXLC69rk4LUnBvFjZszMoxFFoWT8O8g3t/yuHO2F/XRSnPfXF1n
 MIlqVT+69SUyQzIZhZPSrk5j/wOJElSZxyRIaaMaQE8OujuxJx6uygrz9OXgA7v8s99Xdwxvhh8
 vIqm+y6sF7trCGhFD9vnPlGvPpNgzWNTRDTaiXI0CHOz3CZ9DfBO2nIjZ+wjHboK7qdJbOK56PQ
 u/YKDQI3G3f2ZhOo9cGyRTpTwrgFBzQWvKSTwWp9/7iT+bQFfuKiLwSXBdqiTRcb8Wfev+OIWKm
 bM9s7aK7L0oHXNQNmuUFjgtKxoYcqy5wdYW+ZPyeMyy558mDiV1T5NiEQEheVrPEclSP2YVcnrZ
 M
X-Google-Smtp-Source: AGHT+IGR2uNXJ3l6aRBH8ahkkqf+3LsfS2a2gTuJVuJmc1RJevioBFp3pON1mFWEGoUvNhLuLgT99g==
X-Received: by 2002:a17:907:da1:b0:ae0:daca:f08c with SMTP id
 a640c23a62f3a-ae350194c5cmr245755066b.47.1751028928144; 
 Fri, 27 Jun 2025 05:55:28 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae353ca18bbsm117835166b.151.2025.06.27.05.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 05:55:25 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: elmehdi.younes@smile.fr
Date: Fri, 27 Jun 2025 14:55:23 +0200
Message-ID: <20250627125524.242475-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250527171400.78560-1-shirokovalexs@gmail.com>
References: <20250527171400.78560-1-shirokovalexs@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751028928; x=1751633728; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z+U1T8c1r2aAydTmRAgBWaDOoBlB4og4Z6GivHFVyB0=;
 b=DhlAl3UTTvf0LF4nRtgaMK58lkcWOGIdiiAydZ5yfbo4gO3/Z8ZDjS6ZwjQuK50q34
 q8T39yYf90YIc6hXai3VRuBlVrdH5fukG7ROcS9EVD4nLFkSzttY10RxfI0o1iICwcnX
 b6WPHU7lc7PowKwEMzXK4PZsKucHd6IdMqnEeShRcwMrcI/rhOhzblkgFsyDI4T/rn/l
 HjpsOGVDmop61iOZiruv0VpbAVZtnlmjb3++86xHWqrWCN9eAxeYtSKuBCgJphc+L3Nr
 8J19pChuGJ/g2vB67oVdArMfCgggVFpseIWog7qfbJEF3/+svOvqnJ50Tv+rjhtojCOk
 LnQw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DhlAl3UT
Subject: [Buildroot] [next,v5,1/3] package/uutils-coreutils: new package
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

SGkgRWwgTWVoZGksIGFsbAoKVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3LCBlZmZvcnRzLCBhbmQg
dmFsdWFibGUgY29tbWVudHMuCgpJIGxpa2UgdGhlIGltcHJvdmVtZW50IHdpdGggcmVhZGluZyBg
ZmVhdF9jb21tb25fY29yZWAgZnJvbSBDYXJnby50b21sLiBIb3dldmVyLAppdCBzZWVtcyB0aGF0
IHRoZSBtb2RpZmljYXRpb24gbmVlZHMgdG8gZ28gZGVlcGVyLiBUaGlzIGlzIGV4YWN0bHkgd2hh
dCBJIHdhbnRlZAp0byBkaXNjdXNzIHdpdGggb3RoZXIgZGV2ZWxvcGVycy4gSGVyZSBhcmUgbXkg
Y29uY2VybnM6CgoxLiBEdXJpbmcgbWlncmF0aW9uLCBpdOKAmXMgdmVyeSBkZXNpcmFibGUgdG8g
cmVwbGFjZSB1dGlsaXRlcyBpbiBzbWFsbCBwaWVjZXMgLQp1cGRhdGUgMi0zIGFwcHMsIHByZXBh
cmUgdGhlIGltYWdlLCBydW4gdGVzdHMsIGFuYWx5emUsIHRoZW4gcmVwZWF0LiBUaGlzIGtpbmQK
b2YgbWlncmF0aW9uIHByb3ZpZGVzIGJldHRlciBjb250cm9sIG92ZXIgdGhlIHByb2Nlc3MuIFRv
IGRvIHRoaXMsIHdlIG5lZWQgYQptZWNoYW5pc20gdG8gZW5hYmxlL2Rpc2FibGUgYSBzaW5nbGUg
YXBwLCBub3QgYWxsIGFwcHMuIEnigJl2ZSBhbHJlYWR5IGVuY291bnRlcmVkCnRoZSBuZWVkIGZv
ciBzdWNoIGZ1bmN0aW9uYWxpdHkgaW4gcHJhY3RpY2UuCgoyLiBOb3QgYWxsIHV0aWxpdGllcyBh
cmUgbmVlZGVkLCBlc3BlY2lhbGx5IG9uIHByb2R1Y3Rpb24gZGV2aWNlcy4gRm9yIGV4YW1wbGUs
CmBjcGAsIGBtdmAsIGFuZCBgY2F0YCBhcmUgY29tbW9uLCB3aGlsZSBgZGlyY29sb3JzYCwgYGZh
Y3RvcmAsIGFuZCBgbmxgIGFyZQpyYXJlIChhdCBsZWFzdCBpbiBteSBleHBlcmllbmNlKS4gU28s
IGhhdmluZyBhIG1lY2hhbmlzbSB0byBpbmNsdWRlIG9ubHkgdGhlCm5lZWRlZCBhcHBzIHNlZW1z
IHZlcnkgZGVzaXJhYmxlLiBJIGhhdmVu4oCZdCBmYWNlZCB0aGlzIGlzc3VlIHlldCwgYnV0IGl0
IGxvb2tzCmxpa2VseS4KCjMuIFVzaW5nIGBmZWF0X2NvbW1vbl9jb3JlYCBjb3VsZCBpbXBsaWNp
dGx5IGNoYW5nZSB0aGUgc2V0IG9mIGFwcHMgd2hlbgptb2RpZnlpbmcgcGFja2FnZSB2ZXJzaW9u
cywgd2hpY2ggd291bGQgYmUgdW5leHBlY3RlZC4gSSBoYXZlbuKAmXQgZW5jb3VudGVyZWQKdGhp
cyBteXNlbGYsIHNvIGl04oCZcyBvbmx5IGEgdGhlb3JldGljYWwgcHJvYmxlbS4KClNvLCBpdCBz
ZWVtcyB0aGF0IGZvciBhIG5vbi1tdWx0aWNhbGwgYnVpbGQsIGl04oCZcyB2ZXJ5IGxpa2VseSBu
ZWNlc3NhcnkgdG8gaGF2ZQphIG1lY2hhbmlzbSB0byBjb25maWd1cmUgdGhlIGxpc3Qgb2YgdXRp
bGl0ZXMgdmlhIENvbmZpZy5pbi4KClNvbWUgdGhvdWdodHMgYWJvdXQgcG9zc2libGUgc29sdXRp
b25zOgoKVGhvdWdodCAjMToKClRvIGFkZHJlc3MgdGhlIHByb2JsZW0sIEkgY2FuIGFkZCBtb3Jl
IHBhcmFtZXRlcnMgdG8gdGhlIENvbmZpZy5pbiBmaWxlLiBCdXQKdGhpcyBhcHByb2FjaCBoYXMg
c2V2ZXJhbCBkcmF3YmFja3M6CgotIGluY3JlYXNlcyB0aGUgZmluYWwgQnVpbGRyb290IGNvbmZp
ZyBieSBhZGRpbmcgNTAtNzAgcGFyYW1ldGVycwotIGluY3JlYXNlcyBjb21wbGV4aXR5IG9mIENv
bmZpZy5pbiBhbmQgbWFrZWZpbGVzCi0gaW5jcmVhc2VzIGNvbW1pdCBzaXplcwoKU3VyZSwgcGxh
eWluZyB3aXRoIGRlZmF1bHRzIGlzIHBvc3NpYmxlLCBidXQgaXQgZG9lc27igJl0IHNvbHZlIHRo
ZSBjb3JlIHByb2JsZW0Kb2YgZ3JhbnVsYXJpdHkuCgoKVGhvdWdodCAjMjoKCkZvciBtZSwgdGhl
IGlkZWFsIHNvbHV0aW9uIHdvdWxkIGJlIGEgQnVzeUJveC1saWtlIGNvbmZpZy4gSG93ZXZlciwg
dXV0aWxzCmRvZXNu4oCZdCBzdXBwb3J0IHRoaXMgZnVuY3Rpb25hbGl0eS4gSSBjYW4gc3RhcnQg
ZGlzY3Vzc2luZyBpdCB3aXRoIHRoZSB1dXRpbHMKZGV2ZWxvcGVycywgYnV0IGl0IHdvdWxkIGNh
dXNlIGEgc2lnbmlmaWNhbnQgZGVsYXkgLSBhbmQgSeKAmW0gbm90IHN1cmUgaXQgd291bGQKc3Vj
Y2VlZC4KCgpUaG91Z2h0ICMzOiAKClNpbmNlIHdlIGhhdmUgbWsgZmlsZXMsIHdlIGNhbiBjb25m
aWd1cmUgdGhlIHV0aWxpdGVzIGxpc3RzIGluIHNlcGFyYXRlIG1rIGZpbGVzCmFjdGluZyBhcyBj
b25maWdzLiBUaGVuLCB3ZSBjYW4gc3BlY2lmeSB0aGUgZXhhY3QgZmlsZSAob3ZlciBDb25maWcu
aW4pIGFuZAppbmNsdWRlIGl0IGluIHV1dGlscy1jb3JldXRpbHMubWsgZHVyaW5nIHRoZSBidWls
ZC4gT3ZlcmFsbCwgdGhpcyBzaG91bGQgc29sdmUKdGhlIGNvcmUgZ3JhbnVsYXJpdHkgcHJvYmxl
bSBhbmQgc2VlbXMgdGVjaG5pY2FsbHkgZmVhc2libGUuIEhvd2V2ZXIsIEnigJltIG5vdApzdXJl
IGhvdyB3ZWxsIGl0IGFsaWducyB3aXRoIEJ1aWxkcm9vdOKAmXMgYXBwcm9hY2hlcy4KCgpUaG91
Z2h0ICM0OiAKCkp1c3QgcHJvY2VlZCBzdGVwLWJ5LXN0ZXAuIExldOKAmXMgZW5hYmxlIGl0IGFu
ZCBtZXJnZSwgYXMgaXQgbG9va3MgZ29vZCBlbm91Z2ggdG8Kc3RhcnQuIExhdGVyLCB3ZSBjYW4g
aW1wcm92ZSB0aGUgY29uZmlndXJhdGlvbiBtZWNoYW5pc20gZGVsaXZlcmluZyB0aG9zZQpjaGFu
Z2VzIGluIHNlcGFyYXRlIHBhdGNoZXMuIAoKClRoYW5rIHlvdS4gUGxlYXNlIGZlZWwgZnJlZSB0
byBzaGFyZSBhbnkgdGhvdWdodHMgYW5kIGlkZWFzLiBUaGV54oCZcmUgbXVjaAphcHByZWNpYXRl
ZC4KClBTOiBTb3JyeSBmb3IgdGhlIGxvbmcgbWVzc2FnZS4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
