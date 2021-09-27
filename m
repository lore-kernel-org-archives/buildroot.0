Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42B5BC433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 11:04:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75FB961058
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 11:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 75FB961058
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 265DC400DB;
	Mon, 27 Sep 2021 11:04:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L8jJ1lV7WPgP; Mon, 27 Sep 2021 11:04:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1390140285;
	Mon, 27 Sep 2021 11:04:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E15741BF293
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 11:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDEB360796
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 11:04:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DLw7bst5sajk for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 11:04:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6B213606FA
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 11:04:25 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id dj4so67794610edb.5
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 04:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h/opWbz7O/cEwpUDQFy9grk92jYOlJV2Id2U/Nke+Qg=;
 b=R9V+BHmij2q7ZpiQ7aZjBzkVOqloh/3VpGUBDl2MgDMCT/VvL2A3kSVemvVO6UzT7o
 Bxd0DXtA2/zSjZ726NrC1jJWV9gzAjK9pKfkSn+BpagKkK3mVg4syHW/rWTtUnokRfGq
 w3JThU1aSSiwVvD+Qh/57U2HQvqLtC6RI7yTRtnw0qkzFakEV1yjpApz/dsbc+o8Bkfg
 kdq7EK+gz7iYzpMG6P/HcZqWd6Qc0Zr+t12XX4/Zdl9LvFtx50DWFakZ0NJcYima+bqx
 pz/61V/RVpw1ALlAhRan8K6ml2rIHv7KtMJxO7ntdvX2xRqjqjnob1eQzTClGL+fdM5G
 T7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h/opWbz7O/cEwpUDQFy9grk92jYOlJV2Id2U/Nke+Qg=;
 b=zQwsuVoXyFSsEV0Dfi4Nl4+sUIVWJFRgEH6XBqz0N1WoPM1kLokeZbBUgP9a2oxWPP
 UBLCRWn8RtGULH18CUefGsFkGFRdg5YIFzwyox/LdHZ5dp1Dtujj/SO63/IjTvnCyng1
 bEBhX3UYUV/w6HI5ov6WkWPPHjjuw45dho+QRMvvhNiEPzz09vvrt6El0xqfoevmnhOs
 ceswYIWWxCUezeFHNVeFQFEq1oejHb0q8lor4OaGtNaULx4bmE7ljBVHAohNg7McAueJ
 l8qcmwOYOOfi/jRiYggYg8QKzn3YOjncdj+Cv+/urGZsgoitLyysp8JIZ14gYQDZiMan
 H04Q==
X-Gm-Message-State: AOAM533oi2RxOrHFHwx5ROSSQnTboZ47Dr++NwGA4J/oAAKriSooysAm
 sSkz0otzXOaxmY8e3PtU/GCko1+Ojefco2aS
X-Google-Smtp-Source: ABdhPJy76stNNuCaU8uCB3BLL2+sD3rrnp8wEZ0LIkGz9x+UfnBBO6d/SQt9ULakoMlO8THTZ1JocA==
X-Received: by 2002:aa7:d9d7:: with SMTP id v23mr22053580eds.248.1632740663460; 
 Mon, 27 Sep 2021 04:04:23 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:6bfb:d00:4149:7987:6bcf:f1e1])
 by smtp.gmail.com with ESMTPSA id k7sm2617629eds.96.2021.09.27.04.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 04:04:23 -0700 (PDT)
From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 13:03:53 +0200
Message-Id: <20210927110354.1193430-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210907120933.31647-1-raphael.melotte@mind.be>
References: <20210907120933.31647-1-raphael.melotte@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3] package/mupdf: fix building with mips
 toolchains
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2l0aCBzb21lIHRvb2xjaGFpbnMgKGUuZy4gbWlwczY0ZWwpLCBwYXJ0aWFsIGxpbmtpbmcgZmFp
bHMgaW4gdGhlCmZvbGxvd2luZyB3YXk6Ci90bXAvaW5zdGFuY2UtMS9vdXRwdXQtMS9ob3N0L29w
dC9leHQtdG9vbGNoYWluL2Jpbi8uLi9saWIvZ2NjL21pcHM2NGVsLWJ1aWxkcm9vdC1saW51eC11
Y2xpYmMvOC40LjAvLi4vLi4vLi4vLi4vbWlwczY0ZWwtYnVpbGRyb290LWxpbnV4LXVjbGliYy9i
aW4vbGQ6IGJ1aWxkL3JlbGVhc2UvbGlibXVwZGYuYShEaW5nYmF0cy5jZmYubyk6IEFCSSBpcyBp
bmNvbXBhdGlibGUgd2l0aCB0aGF0IG9mIHRoZSBzZWxlY3RlZCBlbXVsYXRpb24KL3RtcC9pbnN0
YW5jZS0xL291dHB1dC0xL2hvc3Qvb3B0L2V4dC10b29sY2hhaW4vYmluLy4uL2xpYi9nY2MvbWlw
czY0ZWwtYnVpbGRyb290LWxpbnV4LXVjbGliYy84LjQuMC8uLi8uLi8uLi8uLi9taXBzNjRlbC1i
dWlsZHJvb3QtbGludXgtdWNsaWJjL2Jpbi9sZDogZmFpbGVkIHRvIG1lcmdlIHRhcmdldCBzcGVj
aWZpYyBkYXRhIG9mIGZpbGUgYnVpbGQvcmVsZWFzZS9saWJtdXBkZi5hKERpbmdiYXRzLmNmZi5v
KQoKVGFraW5nIGluc3BpcmF0aW9uIGZyb20gY29tbWl0CjllY2E0YjlmODRmZTI1MzVkOGNhZWU2
ZWViMDYyY2UzMzczM2JkZjEsIGZpeCBpdCBieSB1c2luZyBHQ0MgaW5zdGVhZApvZiBMRCBmb3Ig
cGFydGlhbCBsaW5raW5nLgoKTm90ZSB0aGF0IG9uIG1pcHMgdGhlIGJ1aWxkIHdpbGwgbm93IHBy
b2R1Y2Ugd2FybmluZ3Mgc2ltaWxhciB0byB0aGlzCm9uZToKYnVpbGRyb290L291dHB1dC9ob3N0
L2xpYi9nY2MvbWlwczY0ZWwtYnVpbGRyb290LWxpbnV4LWdudS8xMC4zLjAvLi4vLi4vLi4vLi4v
bWlwczY0ZWwtYnVpbGRyb290LWxpbnV4LWdudS9iaW4vbGQ6IGJ1aWxkL3JlbGVhc2UvbGlibXVw
ZGYuYShOb3RvU2Fuc1RhaVRoYW0tUmVndWxhci50dGYubyk6IHdhcm5pbmc6IGxpbmtpbmcgYWJp
Y2FsbHMgZmlsZXMgd2l0aCBub24tYWJpY2FsbHMgZmlsZXMKCkR1cmluZyBhIHJ1bnRpbWUgdGVz
dCBvbiBtaXBzNjRlbCB1bmRlciBxZW11LCBtdXBkZi14MTEgd2FzCm5vbmV0aGVsZXNzIGFibGUg
dG8gZGlzcGxheSBhIHNhbXBsZSBQREYgZmlsZSBjb3JyZWN0bHkuCgpGaXhlczoKLSBodHRwOi8v
YXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy8xNTZmZTllZTVmNmRjY2RjOTg5OTBmNmM1
ZGU1NTYyMzgzYmMyYjc0LwoKU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhh
ZWwubWVsb3R0ZUBtaW5kLmJlPgotLS0KQ2hhbmdlcyB2MiAtPiB2MzoKICAtIEZpeCBwYXRjaCBz
byB0aGF0IGl0IGFwcGxpZXMgY2xlYW5seSBhZ2FpbiBvbiAxLjE4LjAuCiAgLSBSZW51bWJlciBw
YXRjaC4KCkNoYW5nZXMgdjEgLT4gdjI6CiAgLSBBZGQgdXBzdHJlYW0gc3RhdHVzLgogIC0gUmV3
b3JkIHBhdGNoIG1lc3NhZ2UgYW5kIG5hbWUuCiAgLSBDaGFuZ2UgY29tbWl0IHRpdGxlLgogLi4u
MDA0LVVzZS1DQy1pbnN0ZWFkLW9mLUxELWZvci1PQkpDT1BZLnBhdGNoIHwgNDIgKysrKysrKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL211cGRmLzAwMDQtVXNlLUNDLWluc3RlYWQtb2YtTEQtZm9yLU9CSkNP
UFkucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL211cGRmLzAwMDQtVXNlLUNDLWluc3RlYWQt
b2YtTEQtZm9yLU9CSkNPUFkucGF0Y2ggYi9wYWNrYWdlL211cGRmLzAwMDQtVXNlLUNDLWluc3Rl
YWQtb2YtTEQtZm9yLU9CSkNPUFkucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMDAwMC4uOGMxMTNlNGVlNAotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvbXVwZGYvMDAw
NC1Vc2UtQ0MtaW5zdGVhZC1vZi1MRC1mb3ItT0JKQ09QWS5wYXRjaApAQCAtMCwwICsxLDQzIEBA
CitGcm9tIGRhNGI5ODQ0NzU3M2RhZjc3ODI5ODExZTk1ZTM3NzJlOGEyOTY5MzQgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tOiA9P1VURi04P3E/UmFwaGE9QzM9QUJsPTIwTT1DMz1BOWxv
dHRlPz0gPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgorRGF0ZTogVGh1LCAyIFNlcCAyMDIxIDIw
OjE3OjI2ICswMjAwCitTdWJqZWN0OiBbUEFUQ0hdIFVzZSBDQyBpbnN0ZWFkIG9mIExEIGZvciBP
QkpDT1BZCitNSU1FLVZlcnNpb246IDEuMAorQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFy
c2V0PVVURi04CitDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CisKK1doZW4gY3Jvc3Mt
Y29tcGlsaW5nIGZvciBtaXBzIHRhcmdldHMgdXNpbmcgQnVpbGRyb290LCB1c2luZyBMRCBmb3IK
K3BhcnRpYWwgbGlua2luZyBmYWlscyBpbiB0aGUgZm9sbG93aW5nIHdheToKKy90bXAvaW5zdGFu
Y2UtMS9vdXRwdXQtMS9ob3N0L29wdC9leHQtdG9vbGNoYWluL2Jpbi8uLi9saWIvZ2NjL21pcHM2
NGVsLWJ1aWxkcm9vdC1saW51eC11Y2xpYmMvOC40LjAvLi4vLi4vLi4vLi4vbWlwczY0ZWwtYnVp
bGRyb290LWxpbnV4LXVjbGliYy9iaW4vbGQ6IGJ1aWxkL3JlbGVhc2UvbGlibXVwZGYuYShEaW5n
YmF0cy5jZmYubyk6IEFCSSBpcyBpbmNvbXBhdGlibGUgd2l0aCB0aGF0IG9mIHRoZSBzZWxlY3Rl
ZCBlbXVsYXRpb24KKy90bXAvaW5zdGFuY2UtMS9vdXRwdXQtMS9ob3N0L29wdC9leHQtdG9vbGNo
YWluL2Jpbi8uLi9saWIvZ2NjL21pcHM2NGVsLWJ1aWxkcm9vdC1saW51eC11Y2xpYmMvOC40LjAv
Li4vLi4vLi4vLi4vbWlwczY0ZWwtYnVpbGRyb290LWxpbnV4LXVjbGliYy9iaW4vbGQ6IGZhaWxl
ZCB0byBtZXJnZSB0YXJnZXQgc3BlY2lmaWMgZGF0YSBvZiBmaWxlIGJ1aWxkL3JlbGVhc2UvbGli
bXVwZGYuYShEaW5nYmF0cy5jZmYubykKKworVG8gZml4IGl0LCB1c2UgQ0MgaW5zdGVhZCBvZiBM
RCBmb3IgcGFydGlhbCBsaW5raW5nLgorCisnbm9zdGRsaWInIGhhcyB0byBiZSBhZGRlZCwgb3Ig
aXQgd2lsbCB0cnkgdG8gdXNlIEdDQyBsaWJyYXJpZXMgZm9yCitwYXJ0aWFsIGxpbmtpbmcgYW5k
IGZhaWwgd2l0aCAnY2Fubm90IGZpbmQgLWxnY2NfcycuCisKK0ZpeGVzOgorLSBodHRwOi8vYXV0
b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy8xNTZmZTllZTVmNmRjY2RjOTg5OTBmNmM1ZGU1
NTYyMzgzYmMyYjc0CisKK1NpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVs
Lm1lbG90dGVAbWluZC5iZT4KK1tVcHN0cmVhbSBzdGF0dXM6IGh0dHBzOi8vYnVncy5naG9zdHNj
cmlwdC5jb20vc2hvd19idWcuY2dpP2lkPTcwNDQ0Ml0KKy0tLQorIE1ha2VmaWxlIHwgMiArLQor
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQorCitkaWZmIC0t
Z2l0IGEvTWFrZWZpbGUgYi9NYWtlZmlsZQoraW5kZXggYjBmYjYxN2UyLi4wYTg3OTVlMGUgMTAw
NjQ0CistLS0gYS9NYWtlZmlsZQorKysrIGIvTWFrZWZpbGUKK0BAIC02NCw3ICs2NCw3IEBAIGVu
ZGlmCisgTElOS19DTUQgPSAkKFFVSUVUX0xJTkspICQoTUtUR1RESVIpIDsgJChDQykgJChMREZM
QUdTKSAtbyAkQCAkXiAkKExJQlMpCisgVEFHU19DTUQgPSAkKFFVSUVUX1RBR1MpIGN0YWdzIC1S
IC0tYy1raW5kcz0rcAorIFdJTkRSRVNfQ01EID0gJChRVUlFVF9XSU5EUkVTKSAkKE1LVEdURElS
KSA7ICQoV0lORFJFUykgJDwgJEAKKy1PQkpDT1BZX0NNRCA9ICQoUVVJRVRfT0JKQ09QWSkgJChN
S1RHVERJUikgOyAkKExEKSAtciAtYiBiaW5hcnkgLXogbm9leGVjc3RhY2sgLW8gJEAgJDwKKytP
QkpDT1BZX0NNRCA9ICQoUVVJRVRfT0JKQ09QWSkgJChNS1RHVERJUikgOyAkKENDKSAtV2wsLXIg
LVdsLC1iIC1XbCxiaW5hcnkgLVdsLC16IC1XbCxub2V4ZWNzdGFjayAtbm9zdGRsaWIgLW8gJEAg
JDwKKyAKKyAjIC0tLSBSdWxlcyAtLS0KKyAKKy0tIAorMi4zMy4wCisKLS0gCjIuMzMuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
