Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30541C433F5
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 20:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCEF660D5A;
	Wed,  4 May 2022 20:54:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kc63Ztj_hQH5; Wed,  4 May 2022 20:54:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD76060B18;
	Wed,  4 May 2022 20:54:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF37A1BF3D2
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 20:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE53483F6A
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 20:54:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oStVqvDfMSni for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 20:54:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A399383F67
 for <buildroot@buildroot.org>; Wed,  4 May 2022 20:54:35 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id fu47so1822876qtb.5
 for <buildroot@buildroot.org>; Wed, 04 May 2022 13:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p5LgMcyjfaPBuXGlXrNx41MynUnIkNiaIP0zHi0CyvY=;
 b=UaQy1R2agWOF/I6HiYZSC2CyNIWwmuqMQ7Z10VE8iyCNLBWL4uNmAUFFEGCewLkOHD
 B/ZUrK0utk8/x2SiePLcTQrrb23Y2DnOxitR/hJ1rLMNB7ER53fIwtyQn2A008wsdGEC
 pQHj+tWdM4VOlyaxu0zTqvpf0QK4ji3/RKnvDQE9Ti1lkiPL/ENSl3Owu5gzVQh0o2EF
 qMhXLy2r/SiQQY56h4FdD7+MA/bbIezH/nR/zoNnpQ6LY80Tk2wGVO2yR0SuRb+whZzc
 6B/IQYsrbPUJshkyRxROkN0/+nl9OSfMvPuKomVNp6IAP4J8sebHU9W0AEZJjVtXO53f
 xLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p5LgMcyjfaPBuXGlXrNx41MynUnIkNiaIP0zHi0CyvY=;
 b=judyQiNn/KxvJDdW/uj64MSd1JAh9qj2cA8X8aeEyKIMZvv4WXJyzJF/AStRQV5xLe
 P6Dt8ffAQHmAV43l19fPRrhWVHvO+0/zYE1rtrqDY1ZK+68rL0T9PsXTtnA+SbCz4oOm
 oydABvHSv/S6dAqsO+8vi+HBA6PWiJA9ck2ZYz67eVLlvmfvoY++L/4wINH2H/taEzNV
 QtIEOC6PJidOP8VFMIlYf4W2z5EzMa9oV9qBYMQsbEbmv15sKVgkxIVlJnSE8+HBKtwn
 lHIrVB1OIQc4kuJE8E4WfH7Kd4VBCiRlRgfzSqKilUxLLTThxKaMfcCNhqgAlVbPeORa
 KYpg==
X-Gm-Message-State: AOAM530jbstJ/pVGzSDf19K5dZuqWXj3PX1+ni0M6N2/TnJDgd0aozSy
 2BY/5CJqFG8QJQLuXiKQm1fnyLQ+J2k=
X-Google-Smtp-Source: ABdhPJz4E+VxsneP2Qr23b2rv/GCVElfU/4K928UomG9JJRRCu1mIHZvHUu4IE/ifXajvyT3WtOPQA==
X-Received: by 2002:ac8:5c8a:0:b0:2f3:abd2:f5b8 with SMTP id
 r10-20020ac85c8a000000b002f3abd2f5b8mr11801485qta.554.1651697674234; 
 Wed, 04 May 2022 13:54:34 -0700 (PDT)
Received: from grrm.lan
 (bras-base-mtrlpq4809w-grc-17-70-53-205-21.dsl.bell.ca. [70.53.205.21])
 by smtp.gmail.com with ESMTPSA id
 138-20020a370a90000000b0069fc13ce1ffsm8333263qkk.48.2022.05.04.13.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 13:54:33 -0700 (PDT)
From: Yannick Brosseau <yannick.brosseau@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 May 2022 16:54:13 -0400
Message-Id: <20220504205413.1219619-1-yannick.brosseau@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/openocd: Fix segfault when using
 ST-Link driver
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
Cc: Yannick Brosseau <yannick.brosseau@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UmVjZW50IGNoYW5nZXMgaW4gbGlidXNiIGhhdmUgZXhwb3NlZCBhIGJ1ZyBpbiBPcGVuT0NEIHdo
aWNoIG5vdyBjcmFzaCB3aGVuIHRyeWluZwp0byB1c2UgdGhlIFNULUxpbmsgZHJpdmVyLgoKVXBz
dHJlYW0gaGFzIGEgZml4IGFzIGNvbW1pdCBjZmYwZTQxN2RhNThhZGVmMWNlZWY5YTYzYTk5NDEy
YzJjYzg3ZmYzLiBUaGlzIGFkZCB0aGUgY29tbWl0CmFzIGEgc3RhbmQgYWxvbmUgcGF0Y2guIFRo
ZSBjcmFzaCBhbHNvIGhhcHBlbiBvbiBMaW51eCwgd2hpY2ggd2FzIG5vdCBtZW50aW9ubmVkIGlu
IHRoYXQKY29tbWl0IG1lc3NhZ2UuCgpTaG91bGQgYmUgcmVtb3ZlZCB3aGVuIE9wZW5PQ0QgaXMg
dXBkYXRlZCB0byBhIHJlbGVhc2UgbmV3ZXIgdGhhbiAwLjExCgpTaWduZWQtb2ZmLWJ5OiBZYW5u
aWNrIEJyb3NzZWF1IDx5YW5uaWNrLmJyb3NzZWF1QGdtYWlsLmNvbT4KLS0tCiAuLi5HVi13aXRo
LWxpYnVzYi12MS4wLjI0LTMzLWczMmEyMjA2LTEucGF0Y2ggfCA4OSArKysrKysrKysrKysrKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgODkgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0
IHBhY2thZ2Uvb3Blbm9jZC8wMDAzLXN0bGluay1maXgtU0lHU0VHVi13aXRoLWxpYnVzYi12MS4w
LjI0LTMzLWczMmEyMjA2LTEucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL29wZW5vY2QvMDAw
My1zdGxpbmstZml4LVNJR1NFR1Ytd2l0aC1saWJ1c2ItdjEuMC4yNC0zMy1nMzJhMjIwNi0xLnBh
dGNoIGIvcGFja2FnZS9vcGVub2NkLzAwMDMtc3RsaW5rLWZpeC1TSUdTRUdWLXdpdGgtbGlidXNi
LXYxLjAuMjQtMzMtZzMyYTIyMDYtMS5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwMDAwLi43NzY4MTY4OTJiCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9vcGVub2Nk
LzAwMDMtc3RsaW5rLWZpeC1TSUdTRUdWLXdpdGgtbGlidXNiLXYxLjAuMjQtMzMtZzMyYTIyMDYt
MS5wYXRjaApAQCAtMCwwICsxLDg5IEBACitGcm9tIGNmZjBlNDE3ZGE1OGFkZWYxY2VlZjlhNjNh
OTk0MTJjMmNjODdmZjMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBBbnRvbmlvIEJv
cm5lbyA8Ym9ybmVvLmFudG9uaW9AZ21haWwuY29tPgorRGF0ZTogV2VkLCAyMyBKdW4gMjAyMSAx
Njo1MjoxNiArMDIwMAorU3ViamVjdDogW1BBVENIXSBzdGxpbms6IGZpeCBTSUdTRUdWIHdpdGgg
bGlidXNiIHYxLjAuMjQtMzMtZzMyYTIyMDYgKDExNjE4KQorTUlNRS1WZXJzaW9uOiAxLjAKK0Nv
bnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAorQ29udGVudC1UcmFuc2Zlci1F
bmNvZGluZzogOGJpdAorCitUaGUgc3RsaW5rIGRyaXZlciBpbmNvcnJlY3RseSB1c2VzIGEgTlVM
TCBwb2ludGVyIGZvciBsaWJ1c2Incworc3RydWN0IGxpYnVzYl9jb250ZXh0LgorVGhlIGNvcnJl
Y3QgdmFsdWUgdG8gYmUgdXNlZCBpcyBsb2NhbCBpbiBsaWJ1c2JfaGVscGVyLmMuCisKK01vdmUg
aW4gdGhlIGhlbHBlciBmaWxlLCBpbiBhIHdyYXBwZXIgZnVuY3Rpb24sIHRoZSBvbmx5IGNhbGwg
dGhhdAorcmVxdWlyZXMgdGhlIGFib3ZlIHZhbHVlLCBhbmQgbGV0IHN0bGluayBkcml2ZXIgdG8g
dXNlIHRoaXMKK3dyYXBwZXIuCisKK1RoaXMgaXNzdWUgaGFzIG5vdCB0cmlnZ2VyZWQgYW55IHZp
c2libGUgcHJvYmxlbSB1bnRpbCBhIGNvZGUKK3JlZmFjdG9yaW5nIFsxXSBpbiBsaWJ1c2IgaGFz
IG1hZGUgT3Blbk9DRCBjcmFzaGluZyBvbiBXaW5kb3dzIGFuZAorb24gTWFjT1MuCisKK0NoYW5n
ZS1JZDogSWQxODE4YzhhZjdjZjBkNGQxN2RmYTFkMjJhYWQwNzlkYTAxZWY3NDAKK1NpZ25lZC1v
ZmYtYnk6IEFudG9uaW8gQm9ybmVvIDxib3JuZW8uYW50b25pb0BnbWFpbC5jb20+CitGaXhlczog
aHR0cHM6Ly9zb3VyY2Vmb3JnZS5uZXQvcC9vcGVub2NkL3RpY2tldHMvMzA4LworRml4ZXM6IGh0
dHBzOi8vZ2l0aHViLmNvbS9saWJ1c2IvbGlidXNiL2lzc3Vlcy85MjgvCitGaXhlczogNDJkOGZh
ODk5YzZhICgic3RsaW5rX3VzYjogU3VibWl0IG11bHRpcGxlIFVTQiBVUkJzIGF0IG9uY2UgdG8g
aW1wcm92ZSBwZXJmb3JtYW5jZSIpCitMaW5rOiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL2xpYnVz
Yi9saWJ1c2IvY29tbWl0LzMyYTIyMDY5NDI4YworUmVwb3J0ZWQtYnk6IEFuZHJ6ZWogU2llcsW8
xJlnYSA8YXNpZXI3MEBnbWFpbC5jb20+CitDby1kZXZlbG9wZWQtYnk6IEFuZHJ6ZWogU2llcsW8
xJlnYSA8YXNpZXI3MEBnbWFpbC5jb20+CitDby1kZXZlbG9wZWQtYnk6IFhpYW9mYW4gQ2hlbiA8
eGlhb2ZhbmNAZ21haWwuY29tPgorUmV2aWV3ZWQtb246IGh0dHA6Ly9vcGVub2NkLnp5bGluLmNv
bS82MzMxCitUZXN0ZWQtYnk6IGplbmtpbnMKK1Jldmlld2VkLWJ5OiBNYXJjIFNjaGluayA8ZGV2
QHphcGIuZGU+CitSZXZpZXdlZC1ieTogWGlhb2ZhbiA8eGlhb2ZhbmNAZ21haWwuY29tPgorUmV2
aWV3ZWQtYnk6IEFuZHJ6ZWogU2llcsW8xJlnYSA8YXNpZXI3MEBnbWFpbC5jb20+CitSZXZpZXdl
ZC1ieTogT2xla3NpaiBSZW1wZWwgPGxpbnV4QHJlbXBlbC1wcml2YXQuZGU+CitSZXZpZXdlZC1i
eTogQW5kcmVhcyBGcml0aW9mc29uIDxhbmRyZWFzLmZyaXRpb2Zzb25AZ21haWwuY29tPgorU2ln
bmVkLW9mZi1ieTogWWFubmljayBCcm9zc2VhdSA8eWFubmljay5icm9zc2VhdUBnbWFpbC5jb20+
CistLS0KKyBzcmMvanRhZy9kcml2ZXJzL2xpYnVzYl9oZWxwZXIuYyB8IDUgKysrKysKKyBzcmMv
anRhZy9kcml2ZXJzL2xpYnVzYl9oZWxwZXIuaCB8IDEgKworIHNyYy9qdGFnL2RyaXZlcnMvc3Rs
aW5rX3VzYi5jICAgIHwgNyArLS0tLS0tCisgMyBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KyksIDYgZGVsZXRpb25zKC0pCisKK2RpZmYgLS1naXQgYS9zcmMvanRhZy9kcml2ZXJzL2xpYnVz
Yl9oZWxwZXIuYyBiL3NyYy9qdGFnL2RyaXZlcnMvbGlidXNiX2hlbHBlci5jCitpbmRleCBmMDEy
MmQ1MzQuLjE4ZmU0YmFkNCAxMDA2NDQKKy0tLSBhL3NyYy9qdGFnL2RyaXZlcnMvbGlidXNiX2hl
bHBlci5jCisrKysgYi9zcmMvanRhZy9kcml2ZXJzL2xpYnVzYl9oZWxwZXIuYworQEAgLTM2Mywz
ICszNjMsOCBAQCBpbnQganRhZ19saWJ1c2JfZ2V0X3BpZChzdHJ1Y3QgbGlidXNiX2RldmljZSAq
ZGV2LCB1aW50MTZfdCAqcGlkKQorIAorIAlyZXR1cm4gRVJST1JfRkFJTDsKKyB9CisrCisraW50
IGp0YWdfbGlidXNiX2hhbmRsZV9ldmVudHNfY29tcGxldGVkKGludCAqY29tcGxldGVkKQorK3sK
KysJcmV0dXJuIGxpYnVzYl9oYW5kbGVfZXZlbnRzX2NvbXBsZXRlZChqdGFnX2xpYnVzYl9jb250
ZXh0LCBjb21wbGV0ZWQpOworK30KK2RpZmYgLS1naXQgYS9zcmMvanRhZy9kcml2ZXJzL2xpYnVz
Yl9oZWxwZXIuaCBiL3NyYy9qdGFnL2RyaXZlcnMvbGlidXNiX2hlbHBlci5oCitpbmRleCBmYTdk
MDZlMjguLjNlNzc4NjVkNiAxMDA2NDQKKy0tLSBhL3NyYy9qdGFnL2RyaXZlcnMvbGlidXNiX2hl
bHBlci5oCisrKysgYi9zcmMvanRhZy9kcml2ZXJzL2xpYnVzYl9oZWxwZXIuaAorQEAgLTYwLDUg
KzYwLDYgQEAgaW50IGp0YWdfbGlidXNiX2Nob29zZV9pbnRlcmZhY2Uoc3RydWN0IGxpYnVzYl9k
ZXZpY2VfaGFuZGxlICpkZXZoLAorIAkJdW5zaWduZWQgaW50ICp1c2Jfd3JpdGVfZXAsCisgCQlp
bnQgYmNsYXNzLCBpbnQgc3ViY2xhc3MsIGludCBwcm90b2NvbCwgaW50IHRyYW5zX3R5cGUpOwor
IGludCBqdGFnX2xpYnVzYl9nZXRfcGlkKHN0cnVjdCBsaWJ1c2JfZGV2aWNlICpkZXYsIHVpbnQx
Nl90ICpwaWQpOworK2ludCBqdGFnX2xpYnVzYl9oYW5kbGVfZXZlbnRzX2NvbXBsZXRlZChpbnQg
KmNvbXBsZXRlZCk7CisgCisgI2VuZGlmIC8qIE9QRU5PQ0RfSlRBR19EUklWRVJTX0xJQlVTQl9I
RUxQRVJfSCAqLworZGlmZiAtLWdpdCBhL3NyYy9qdGFnL2RyaXZlcnMvc3RsaW5rX3VzYi5jIGIv
c3JjL2p0YWcvZHJpdmVycy9zdGxpbmtfdXNiLmMKK2luZGV4IGM2OGJiYjNjYS4uN2IxOTMyYjlm
IDEwMDY0NAorLS0tIGEvc3JjL2p0YWcvZHJpdmVycy9zdGxpbmtfdXNiLmMKKysrKyBiL3NyYy9q
dGFnL2RyaXZlcnMvc3RsaW5rX3VzYi5jCitAQCAtNDk3LDEzICs0OTcsOCBAQCBzdGF0aWMgdm9p
ZCBzeW5jX3RyYW5zZmVyX3dhaXRfZm9yX2NvbXBsZXRpb24oc3RydWN0IGxpYnVzYl90cmFuc2Zl
ciAqdHJhbnNmZXIpCisgeworIAlpbnQgciwgKmNvbXBsZXRlZCA9IHRyYW5zZmVyLT51c2VyX2Rh
dGE7CisgCistCS8qIEFzc3VtaW5nIGEgc2luZ2xlIGxpYnVzYiBjb250ZXh0IGV4aXN0cy4gIFRo
ZXJlIG5vIGV4aXN0aW5nIGludGVyZmFjZSBpbnRvIHRoaXMKKy0JICogbW9kdWxlIHRvIHBhc3Mg
YSBsaWJ1c2IgY29udGV4dC4KKy0JICovCistCXN0cnVjdCBsaWJ1c2JfY29udGV4dCAqY3R4ID0g
TlVMTDsKKy0KKyAJd2hpbGUgKCEqY29tcGxldGVkKSB7CistCQlyID0gbGlidXNiX2hhbmRsZV9l
dmVudHNfY29tcGxldGVkKGN0eCwgY29tcGxldGVkKTsKKysJCXIgPSBqdGFnX2xpYnVzYl9oYW5k
bGVfZXZlbnRzX2NvbXBsZXRlZChjb21wbGV0ZWQpOworIAkJaWYgKHIgPCAwKSB7CisgCQkJaWYg
KHIgPT0gTElCVVNCX0VSUk9SX0lOVEVSUlVQVEVEKQorIAkJCQljb250aW51ZTsKKy0tIAorMi4z
NS4xCisKLS0gCjIuMzYuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
