Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D5BC4707B
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 19:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B107241816;
	Tue,  9 Jan 2024 19:07:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B107241816
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pAtLwD10ELzs; Tue,  9 Jan 2024 19:07:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB5F141823;
	Tue,  9 Jan 2024 19:07:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB5F141823
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 784171BF41A
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 19:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E0C56080A
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 19:07:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E0C56080A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YQW27taS-W0g for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 19:07:24 +0000 (UTC)
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 54E2C607E1
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 19:07:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54E2C607E1
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-7bade847536so155122339f.0
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 11:07:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704827243; x=1705432043;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rh8hDaD5hsHi4tlXn4oQi4jPBfiBDYbIhafhDjzUX2o=;
 b=DVc7huarQdmTX2w2xgbd+i6nOVUpPUn3F3H4WPKMZukB9a2cvyMGvx5FVBfq9NcgQ4
 pZzi1hiNssCjOxRWt8lHAmIYIc9ortwQ2UFNQmHmOlXoQvMJ8T+WTGj8Ld4JBizngxLn
 oo6+jnIDVkBfZLzcSOZcYAavl/IrutaVGtTs+WVTqbT7opCsxwvqlV2/m3Yk7n7KU+BO
 e7zOqLU8hd1ikeWjtKRK1ppfClu4naJes1dRAve3iHTuy25IsjXzr7B+F1SuYv4qi/zb
 3EHek3f2bhFBmwcMz0qAxs+2IhqBD6qEbgm1db9ltgt6mnVaGKFHmFlasENNCyvahdmX
 Duhw==
X-Gm-Message-State: AOJu0Yx5kzqdNGS0qWqAJ2vcRtxXtlrrYcgDlDudboreOelv/VT0lOZY
 dvMXTftzSsJoyeUZ3VJ0v075as9Y2WVGfA==
X-Google-Smtp-Source: AGHT+IH6uiSq0SJOkacwC3FbAmHlbQppMMKlB3bpj77776MSVkrEWhVtMoYRploP+ADIK1yTqgvXYw==
X-Received: by 2002:a05:6602:57:b0:7be:d959:68df with SMTP id
 z23-20020a056602005700b007bed95968dfmr1444253ioz.32.1704827242826; 
 Tue, 09 Jan 2024 11:07:22 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 i14-20020a05663815ce00b0046e2c5ac810sm791499jat.178.2024.01.09.11.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 11:07:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 12:07:20 -0700
Message-Id: <20240109190720.816841-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704827243; x=1705432043; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rh8hDaD5hsHi4tlXn4oQi4jPBfiBDYbIhafhDjzUX2o=;
 b=grIiCdvxXJSSoh6RsPESvVNFgg3Nqjb91iree9tnR7HXWIuVW1NHguMu1A9Rii4TiK
 2qxdMissoumOXdvIET1YPHwwBUFG8wh5HQALcjW/aDzV38SDltV4RmBT6v61FVB5s+dL
 4TPngF8nPzPjQXV6OyrUb0GcRKmQHPZ8P4E4SZkWlJW0S7HL+WocxFEZOVgm6xeuC/ev
 C22MbEybeXS/31kRJwJdFi39kwvS6VSqXiVuKpE1PfNwN7RYK5E3CH6/i1ZnoPTRPIN2
 Sqyc62CnINDGJaKX5OKuIjbuiZH9m+S15DN3BsIlTL/7Tt+nsoEvGWx++0AO3CyE/wAk
 c74g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=grIiCdvx
Subject: [Buildroot] [PATCH 1/1] package/zbar: bump to version 0.23.93
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Volkov Viacheslav <sv99@inbox.ru>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RHJvcCBwYXRjaCB3aGljaCBpcyBub3cgdXBzdHJlYW0uCgpTaWduZWQtb2ZmLWJ5OiBKYW1lcyBI
aWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KLS0tCiAuLi55dGhvbi1lbnVtLWZp
eC1idWlsZC1mb3ItUHl0aG9uLTMuMTEucGF0Y2ggfCA2MiAtLS0tLS0tLS0tLS0tLS0tLS0tCiBw
YWNrYWdlL3piYXIvemJhci5oYXNoICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQogcGFj
a2FnZS96YmFyL3piYXIubWsgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIDMgZmls
ZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA2NCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL3piYXIvMDAwMS1weXRob24tZW51bS1maXgtYnVpbGQtZm9yLVB5dGhv
bi0zLjExLnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS96YmFyLzAwMDEtcHl0aG9uLWVudW0t
Zml4LWJ1aWxkLWZvci1QeXRob24tMy4xMS5wYXRjaCBiL3BhY2thZ2UvemJhci8wMDAxLXB5dGhv
bi1lbnVtLWZpeC1idWlsZC1mb3ItUHl0aG9uLTMuMTEucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IGY1MjViNjIxODQuLjAwMDAwMDAwMDAKLS0tIGEvcGFja2FnZS96YmFyLzAw
MDEtcHl0aG9uLWVudW0tZml4LWJ1aWxkLWZvci1QeXRob24tMy4xMS5wYXRjaAorKysgL2Rldi9u
dWxsCkBAIC0xLDYyICswLDAgQEAKLUZyb20gZmJhZWM0YjRlNmZlNzM1ZWZlNjkxNmZlNWI5Mjgw
NWEwZDk2YmY4YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206ID0/VVRGLTg/cT89QzQ9
OTBvPUMzPUEwbj0yMFRyPUUxPUJBPUE3bj0yMEM9QzM9QjRuZz0yMERhbmg/PQotIDxjb25nZGFu
aHF4QGdtYWlsLmNvbT4KLURhdGU6IFdlZCwgMjEgU2VwIDIwMjIgMTA6MzI6MTEgKzA3MDAKLVN1
YmplY3Q6IFtQQVRDSF0gcHl0aG9uOiBlbnVtOiBmaXggYnVpbGQgZm9yIFB5dGhvbiAzLjExCi1N
SU1FLVZlcnNpb246IDEuMAotQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04
Ci1Db250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0Ci0KLVB5dGhvbiAzLjkgaW50cm9kdWNl
ZCBQeV9TRVRfU0laRSBmdW5jdGlvbiB0byBzZXQgc2l6ZSBpbnN0ZWFkIG9mCi1yZWx5aW5nIG9u
IFB5X1NJWkUoKSBhcyBhIG1hY3JvIFszLjldLgotCi1QeXRob24gMy4xMCBzdGFydGVkIHRvIGVu
Y291cmFnZSB0byB1c2UgUHlfU0VUX1NJWkUgaW5zdGVhZCBvZgotYXNzaWduaW5nIGludG8gcmV0
dXJuIHZhbHVlIG9mIFB5X1NJWkUgWzMuMTBdLgotCi1QeXRob24gMy4xMSBmbGlwcyB0aGUgc3dp
dGNoLCB0dXJuIFB5X1NJWkUgaW50byBhIGZ1bmN0aW9uIFszLjExXSwKLXRodXMgUHlfU0laRShv
YmopIHdpbGwgYmUgYSBydmFsdWUuIFdlIG5lZWQgdG8gdXNlIFB5X1NFVF9TSVpFCi10byBzZXQg
c2l6ZSBub3cuCi0KLVszLjldOiBodHRwczovL2RvY3MucHl0aG9uLm9yZy8zLjkvYy1hcGkvc3Ry
dWN0dXJlcy5odG1sI2MuUHlfU0VUX1NJWkUKLVszLjEwXTogaHR0cHM6Ly9kb2NzLnB5dGhvbi5v
cmcvMy4xMC9jLWFwaS9zdHJ1Y3R1cmVzLmh0bWwjYy5QeV9TSVpFCi1bMy4xMV06IGh0dHBzOi8v
ZG9jcy5weXRob24ub3JnLzMuMTEvYy1hcGkvc3RydWN0dXJlcy5odG1sI2MuUHlfU0laRQotCi1T
aWduZWQtb2ZmLWJ5OiDEkG/DoG4gVHLhuqduIEPDtG5nIERhbmggPGNvbmdkYW5ocXhAZ21haWwu
Y29tPgotU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFp
bC5jb20+Ci1bVXBzdHJlYW0gc3RhdHVzOgotaHR0cHM6Ly9naXRodWIuY29tL21jaGVoYWIvemJh
ci9wdWxsLzIzMV0KLS0tLQotIHB5dGhvbi9lbnVtLmMgfCA4ICsrKysrKysrCi0gMSBmaWxlIGNo
YW5nZWQsIDggaW5zZXJ0aW9ucygrKQotCi1kaWZmIC0tZ2l0IGEvcHl0aG9uL2VudW0uYyBiL3B5
dGhvbi9lbnVtLmMKLWluZGV4IGRmZTFiMWUuLjk0NjM0NGYgMTAwNjQ0Ci0tLS0gYS9weXRob24v
ZW51bS5jCi0rKysgYi9weXRob24vZW51bS5jCi1AQCAtNTIsNyArNTIsMTEgQEAgZW51bWl0ZW1f
bmV3IChQeVR5cGVPYmplY3QgKnR5cGUsCi0gCi0gICAgIC8qIHdlIGFzc3VtZSB0aGUgImZhc3Qg
cGF0aCIgZm9yIGEgc2luZ2xlLWRpZ2l0IGludHMgKHNlZSBsb25nb2JqZWN0LmMpICovCi0gICAg
IC8qIHRoaXMgYWxzbyBob2xkcyBpZiB3ZSBnZXQgYSBzbWFsbF9pbnQgcHJlYWxsb2NhdGVkIGxv
bmcgKi8KLSsjaWYgUFlfVkVSU0lPTl9IRVggPj0gMHgwMzA5MDAwMAotKyAgICBQeV9TRVRfU0la
RSgmc2VsZi0+dmFsLCBQeV9TSVpFKGxvbmd2YWwpKTsKLSsjZWxzZQotICAgICBQeV9TSVpFKCZz
ZWxmLT52YWwpID0gUHlfU0laRShsb25ndmFsKTsKLSsjZW5kaWYKLSAgICAgc2VsZi0+dmFsLm9i
X2RpZ2l0WzBdID0gbG9uZ3ZhbC0+b2JfZGlnaXRbMF07Ci0gICAgIFB5X0RFQ1JFRihsb25ndmFs
KTsKLSAjZWxzZQotQEAgLTE0Myw3ICsxNDcsMTEgQEAgemJhckVudW1JdGVtX05ldyAoUHlPYmpl
Y3QgKmJ5bmFtZSwKLSAKLSAgICAgLyogd2UgYXNzdW1lIHRoZSAiZmFzdCBwYXRoIiBmb3IgYSBz
aW5nbGUtZGlnaXQgaW50cyAoc2VlIGxvbmdvYmplY3QuYykgKi8KLSAgICAgLyogdGhpcyBhbHNv
IGhvbGRzIGlmIHdlIGdldCBhIHNtYWxsX2ludCBwcmVhbGxvY2F0ZWQgbG9uZyAqLwotKyNpZiBQ
WV9WRVJTSU9OX0hFWCA+PSAweDAzMDkwMDAwCi0rICAgIFB5X1NFVF9TSVpFKCZzZWxmLT52YWws
IFB5X1NJWkUobG9uZ3ZhbCkpOwotKyNlbHNlCi0gICAgIFB5X1NJWkUoJnNlbGYtPnZhbCkgPSBQ
eV9TSVpFKGxvbmd2YWwpOwotKyNlbmRpZgotICAgICBzZWxmLT52YWwub2JfZGlnaXRbMF0gPSBs
b25ndmFsLT5vYl9kaWdpdFswXTsKLSAgICAgUHlfREVDUkVGKGxvbmd2YWwpOwotIAotLS0gCi0y
LjM0LjEKLQpkaWZmIC0tZ2l0IGEvcGFja2FnZS96YmFyL3piYXIuaGFzaCBiL3BhY2thZ2UvemJh
ci96YmFyLmhhc2gKaW5kZXggYTQzMDMyNjZkYi4uMDEzNmIxZDFmMyAxMDA2NDQKLS0tIGEvcGFj
a2FnZS96YmFyL3piYXIuaGFzaAorKysgYi9wYWNrYWdlL3piYXIvemJhci5oYXNoCkBAIC0xLDMg
KzEsMyBAQAogIyBMb2NhbGx5IGNvbXB1dGVkOgotc2hhMjU2ICA5MTUyYzhmYjMwMmIzODkxZTFj
YjljYzcxOTg4M2QyZjRjY2QyNDgzZTM0MzA3ODNhMmNmMmQ5M2JkNTkwMWFkICB6YmFyLTAuMjMu
OTAudGFyLmJ6Mgorc2hhMjU2ICA4M2JlOGY4NWZjN2MyODhmZDkxZjk4ZDUyZmM1NWRiN2VlZGJk
ZGNmMTBhODNkOTIyMWQ3MDM0NjM2NjgzZmEwICB6YmFyLTAuMjMuOTMudGFyLmJ6Mgogc2hhMjU2
ICA0NDI2MGY5MjUyYzdmZTM4YmE4ZGZiNjQ1MzMwNTA0ZjRhMzc1ZTNhNWU5ZGQ3ZDVkNmI5ZjA0
YWRiNDk1MmYxICBMSUNFTlNFLm1kCmRpZmYgLS1naXQgYS9wYWNrYWdlL3piYXIvemJhci5tayBi
L3BhY2thZ2UvemJhci96YmFyLm1rCmluZGV4IDJjOTMzOTI5Y2YuLjFhMWU0ZWIyNGIgMTAwNjQ0
Ci0tLSBhL3BhY2thZ2UvemJhci96YmFyLm1rCisrKyBiL3BhY2thZ2UvemJhci96YmFyLm1rCkBA
IC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotWkJBUl9WRVJTSU9O
ID0gMC4yMy45MAorWkJBUl9WRVJTSU9OID0gMC4yMy45MwogWkJBUl9TT1VSQ0UgPSB6YmFyLSQo
WkJBUl9WRVJTSU9OKS50YXIuYnoyCiBaQkFSX1NJVEUgPSBodHRwczovL3d3dy5saW51eHR2Lm9y
Zy9kb3dubG9hZHMvemJhcgogWkJBUl9MSUNFTlNFID0gTEdQTC0yLjErCi0tIAoyLjM0LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
