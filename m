Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418FEC4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 09:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9A3B4040D;
	Wed,  7 Feb 2024 09:52:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3lWaC9toR97H; Wed,  7 Feb 2024 09:52:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9922F402E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9922F402E6;
	Wed,  7 Feb 2024 09:52:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F3041BF868
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 09:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EEE4F402E6
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 09:52:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rACH9l6B-Cnt for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 09:52:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1E339400C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E339400C1
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E339400C1
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 09:52:34 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40fd2f7ef55so8757995e9.0
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 01:52:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707299553; x=1707904353;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y8yX7xDtVSxYgXH2M3m1tTdFUI4kAU8BlSRiHXNKJjM=;
 b=p80y0uH/jiVhAYpIy9S5WhVRmSdVRDrp8ID/7rBKqgv3A98noAW0iGp7fiRQ8XTHnC
 mshkdh4TMp7z1qA5SEuVGWoqPuvFNhRWdLLfPI228Xo+kguA6Exewo29TOlvxr8FijbO
 1aCwnkoJ6/p4ZxePGd4tu7st5zC9s7/iuzWM+os/McOSk6bJlOMoQ4SARLF9ud9FdryU
 9nPO+rXGpb+Jxj96Qa7bUzHKnYN+jaTLcaTSpfBdf6RNu50hKxjq+4rp5cUnkjOTueXC
 S3JuGl8egvs7pNjp5awckk+DaGjtXttAoKwEEU3KsSgKNWt6kiI/Fw5XXa7QlY5Mfku1
 RmMw==
X-Gm-Message-State: AOJu0YyZht89fZrzgDBSFvCp/Uvf1IwuDGrpPrdWxOW9GTQiUgoBD+w0
 I+J9YKgZc/YXupqtceZYC36FJINKV50ecgnAZOmIU7/jLSV9g599E5g90uNryzo=
X-Google-Smtp-Source: AGHT+IEOr+2ENqzrx8M9ifI+i4KwhtYXY6QNFQ7ROyEzKSEcx5runCiphqO95aMFIuoY85U7QOXCHQ==
X-Received: by 2002:a05:6000:dc9:b0:33b:51d5:bd1c with SMTP id
 dw9-20020a0560000dc900b0033b51d5bd1cmr46644wrb.12.1707299552749; 
 Wed, 07 Feb 2024 01:52:32 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV4fZGjtCEbvC+NM2cbRkva9Oxo7pVvE6P/A95wiC0Z4/uMbT41/CFSB7GpvXkGPTTMz2PvqvIGKyfiezVn6RtKMkP+Bp5DsggdYQt3pdcaEoWqH2XZ/Sp/8ui8Jt71ZOe/4ecL2bTr0DyY/9FflqB6aJQFPZBskMwBwL4va3FGqlfjD3GDghzNZDHK5MX/8MawO+NlsBoDUaLVz22hsSqTwGXLCjUP0mhlLOHeIRqlprJ5mbJRiSwswNjbYy0KPINcuXy5+CPbqrt36UffE9+OOvPBZW+xlWBD+xEDtDRAIBJ1MyLnuRiirCT7xkbZPqwUsOk=
Received: from [192.168.17.126] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 m7-20020a05600c4f4700b0040efb445698sm4775325wmq.5.2024.02.07.01.52.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 01:52:32 -0800 (PST)
Message-ID: <51c20d9b-e85b-4ae1-a4e2-fa6c8741be3c@smile.fr>
Date: Wed, 7 Feb 2024 10:52:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20231218081958.506691-1-dario.binacchi@amarulasolutions.com>
 <20231218081958.506691-2-dario.binacchi@amarulasolutions.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20231218081958.506691-2-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707299553; x=1707904353;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y8yX7xDtVSxYgXH2M3m1tTdFUI4kAU8BlSRiHXNKJjM=;
 b=cOGXGpiLSjTqU7ZhxfXscFwL3U2MLum7sigRWQ0ebsyg3/MCJzA6h1QCREwTHbS2vd
 ntH7YhRg7PU37vUANzmaGeCxT9xEsygKbWc3me6BOXyICOsEofPn1O82oEKH2XA22/xN
 SmcLD6ud3AYOWumyaSa+pHMQVrbaR9769yeXTY1lhO3wl8l3UE+ws2CDkldmRMEFiJ69
 pwIJ0CtLGN9Y6Cr2JVkKdrp1X3QG5MHr+C2E3O6aWyaSm3wDouUsRwodNbLWkizZH9qp
 iLCIAPKQL5eFGPEF/FPgDDgLd7p3bid/l5DZU/JJW6R85zduA8m16+V1RLypgSE08/Mn
 fT0Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=cOGXGpiL
Subject: Re: [Buildroot] [PATCH v3 01/11] boot/ti-k3-core-secdev: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sIEFsbCwKCkxlIDE4LzEyLzIwMjMgw6AgMDk6MTksIERhcmlvIEJpbmFjY2hp
IGEgw6ljcml0wqA6Cj4gVGhpcyBpcyBhIHNlY3VyaXR5IGRldmVsb3BtZW50IHBhY2thZ2UgY29u
dGFpbmluZyB0b29scyBmb3IKPiBIaWdoLVNlY3VyaXR5KEhTKSBUSSBLMyBwbGF0Zm9ybSBkZXZp
Y2VzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBh
bWFydWxhc29sdXRpb25zLmNvbT4KPiAtLS0KPiAgREVWRUxPUEVSUyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICBib290L0NvbmZpZy5pbiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgMSArCj4gIGJvb3QvdGktazMtY29yZS1zZWNkZXYvQ29uZmln
LmluICAgICAgICAgICAgICB8ICA5ICsrKysrKysrKwo+ICBib290L3RpLWszLWNvcmUtc2VjZGV2
L3RpLWszLWNvcmUtc2VjZGV2Lmhhc2ggfCAgMyArKysKPiAgYm9vdC90aS1rMy1jb3JlLXNlY2Rl
di90aS1rMy1jb3JlLXNlY2Rldi5tayAgIHwgMTkgKysrKysrKysrKysrKysrKysrKwo+ICA1IGZp
bGVzIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGJvb3Qv
dGktazMtY29yZS1zZWNkZXYvQ29uZmlnLmluCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBib290L3Rp
LWszLWNvcmUtc2VjZGV2L3RpLWszLWNvcmUtc2VjZGV2Lmhhc2gKPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGJvb3QvdGktazMtY29yZS1zZWNkZXYvdGktazMtY29yZS1zZWNkZXYubWsKPiAKPiBkaWZm
IC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKPiBpbmRleCAzMTFkY2Q5NTA0ODEuLjYw
YTk1NDM0YzcwZiAxMDA2NDQKPiAtLS0gYS9ERVZFTE9QRVJTCj4gKysrIGIvREVWRUxPUEVSUwo+
IEBAIC03NTQsNiArNzU0LDcgQEAgRjoJcGFja2FnZS94aW5ldGQvCj4gIE46CURhcmlvIEJpbmFj
Y2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KPiAgRjoJYm9hcmQvYnNo
Lwo+ICBGOglib2FyZC9zdG1pY3JvZWxlY3Ryb25pY3Mvc3RtMzJmNzY5LWRpc2NvLwo+ICtGOgli
b290L3RpLWszLWNvcmUtc2VjZGV2Lwo+ICBGOgljb25maWdzL2lteDhtbl9ic2hfc21tX3MyX2Rl
ZmNvbmZpZwo+ICBGOgljb25maWdzL2lteDhtbl9ic2hfc21tX3MyX3Byb19kZWZjb25maWcKPiAg
RjoJY29uZmlncy9zdG0zMmY3NjlfZGlzY29fc2RfZGVmY29uZmlnCj4gZGlmZiAtLWdpdCBhL2Jv
b3QvQ29uZmlnLmluIGIvYm9vdC9Db25maWcuaW4KPiBpbmRleCBlNWZkZjdhZDQzOWUuLjE4YTdk
MjY4Zjk1YSAxMDA2NDQKPiAtLS0gYS9ib290L0NvbmZpZy5pbgo+ICsrKyBiL2Jvb3QvQ29uZmln
LmluCj4gQEAgLTIwLDYgKzIwLDcgQEAgc291cmNlICJib290L3M1MDAtYm9vdGxvYWRlci9Db25m
aWcuaW4iCj4gIHNvdXJjZSAiYm9vdC9zaGltL0NvbmZpZy5pbiIKPiAgc291cmNlICJib290L3N5
c2xpbnV4L0NvbmZpZy5pbiIKPiAgc291cmNlICJib290L3RpLWszLWJvb3QtZmlybXdhcmUvQ29u
ZmlnLmluIgo+ICtzb3VyY2UgImJvb3QvdGktazMtY29yZS1zZWNkZXYvQ29uZmlnLmluIgo+ICBz
b3VyY2UgImJvb3QvdGktazMtaW1hZ2UtZ2VuL0NvbmZpZy5pbiIKPiAgc291cmNlICJib290L3Rp
LWszLXI1LWxvYWRlci9Db25maWcuaW4iCj4gIHNvdXJjZSAiYm9vdC91Ym9vdC9Db25maWcuaW4i
Cj4gZGlmZiAtLWdpdCBhL2Jvb3QvdGktazMtY29yZS1zZWNkZXYvQ29uZmlnLmluIGIvYm9vdC90
aS1rMy1jb3JlLXNlY2Rldi9Db25maWcuaW4KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4
IDAwMDAwMDAwMDAwMC4uMTc0OWI3YWI1ZmQ5Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2Jvb3Qv
dGktazMtY29yZS1zZWNkZXYvQ29uZmlnLmluCj4gQEAgLTAsMCArMSw5IEBACj4gK2NvbmZpZyBC
UjJfVEFSR0VUX1RJX0szX0NPUkVfU0VDREVWCj4gKwlib29sICJ0aS1rMy1jb3JlLXNlY2RldiIK
PiArCWRlcGVuZHMgb24gQlIyX2FhcmNoNjQKPiArCWhlbHAKPiArCSAgVGhpcyBwYWNrYWdlIGRv
d25sb2FkcyBhbmQgaW5zdGFsbHMgZGV2ZWxvcG1lbnQgdG9vbHMgZm9yCj4gKwkgIEhpZ2gtU2Vj
dXJpdHkoSFMpIFRJIEszIHBsYXRmb3JtcyAod2hpY2ggaW5jbHVkZSBBTTYyeCwKPiArCSAgQU02
NHgsIEFNNjV4IGFuZCBtb3JlKS4KPiArCj4gKwkgIGh0dHBzOi8vZ2l0LnRpLmNvbS9jZ2l0L3Nl
Y3VyaXR5LWRldmVsb3BtZW50LXRvb2xzL2NvcmUtc2VjZGV2LWszLwoKUmVtb3ZlIHRoZSB0cmFp
bGluZyAnLycgYXQgdGhlIGVuZCBvZiB0aGUgdXJsLgoKPiBkaWZmIC0tZ2l0IGEvYm9vdC90aS1r
My1jb3JlLXNlY2Rldi90aS1rMy1jb3JlLXNlY2Rldi5oYXNoIGIvYm9vdC90aS1rMy1jb3JlLXNl
Y2Rldi90aS1rMy1jb3JlLXNlY2Rldi5oYXNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRl
eCAwMDAwMDAwMDAwMDAuLjA0NjBjZmY2YzU5Zgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9ib290
L3RpLWszLWNvcmUtc2VjZGV2L3RpLWszLWNvcmUtc2VjZGV2Lmhhc2gKPiBAQCAtMCwwICsxLDMg
QEAKPiArIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiArc2hhMjU2ICBiNmQzYmNhMGQ1NjFkMDU1YzY4
NjljNTU2NGIwNmYyZmIxYjlmNjdlNGVmMTgwYzJiYWY4YTE0YTZhNmFmYTA2ICBjb3JlLXNlY2Rl
di1rMy0wOC4wNi4wMC4wMDcudGFyLnh6Cj4gK3NoYTI1NiAgM2U1Y2Y0ZjVhYjlmMDMzM2Y0NmNk
NjhmYWJlZGUzZjIxZTU1ZGUxYTllM2M2YWQ2NzNmMjQxZjQ1MTRkODM2OSAgazMtc2VjZGV2LTAu
Mi1tYW5pZmVzdC5odG1sCj4gZGlmZiAtLWdpdCBhL2Jvb3QvdGktazMtY29yZS1zZWNkZXYvdGkt
azMtY29yZS1zZWNkZXYubWsgYi9ib290L3RpLWszLWNvcmUtc2VjZGV2L3RpLWszLWNvcmUtc2Vj
ZGV2Lm1rCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjAxMjdl
NjUwM2Q0ZAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9ib290L3RpLWszLWNvcmUtc2VjZGV2L3Rp
LWszLWNvcmUtc2VjZGV2Lm1rCj4gQEAgLTAsMCArMSwxOSBAQAo+ICsjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIwo+ICsjCj4gKyMgdGktazMtY29yZS1zZWNkZXYKPiArIwo+ICsjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIwo+ICsKPiArVElfSzNfQ09SRV9TRUNERVZfVkVSU0lPTiA9IDA4LjA2LjAwLjAw
Nwo+ICtUSV9LM19DT1JFX1NFQ0RFVl9TSVRFID0gaHR0cHM6Ly9naXQudGkuY29tL2NnaXQvc2Vj
dXJpdHktZGV2ZWxvcG1lbnQtdG9vbHMvY29yZS1zZWNkZXYtazMvc25hcHNob3QKPiArVElfSzNf
Q09SRV9TRUNERVZfU09VUkNFID0gY29yZS1zZWNkZXYtazMtJChUSV9LM19DT1JFX1NFQ0RFVl9W
RVJTSU9OKS50YXIueHoKPiArVElfSzNfQ09SRV9TRUNERVZfSU5TVEFMTF9JTUFHRVMgPSBZRVMK
PiArVElfSzNfQ09SRV9TRUNERVZfTElDRU5TRSA9IFRJIFRleHQgRmlsZSwgQXBhY2hlLTIuMAoK
V2hhdCdzIHRoZSBtZWFuaW5nIG9mICJUSSBUZXh0IEZpbGUiPwoKbWV0YS10aSdzIHRpLWszLXNl
Y2RldiBwYWNrYWdlIHVzZSBCU0QtMy1DbGF1c2UgYXMgbGljZW5zZToKCmh0dHBzOi8vZ2l0Lnlv
Y3RvcHJvamVjdC5vcmcvbWV0YS10aS90cmVlL21ldGEtdGktYnNwL3JlY2lwZXMtdGkvc2VjZGV2
L3RpLWszLXNlY2Rldl9naXQuYmI/aD1raXJrc3RvbmUjbjQKCkNhbiB5b3UgdmVyaWZ5IHRoZSBs
aWNlbnNlPwoKPiArVElfSzNfQ09SRV9TRUNERVZfTElDRU5TRV9GSUxFUyA9IGszLXNlY2Rldi0w
LjItbWFuaWZlc3QuaHRtbAoKbGVnYWwtaW5mbyBkb2Vzbid0IHdvcmsgc2luY2UgdGhpcyBmaWxl
IGlzIHVuZGVyICJtYW5pZmVzdCIgZGlyZWN0b3J5LgoKPiArCj4gK2RlZmluZSBUSV9LM19DT1JF
X1NFQ0RFVl9JTlNUQUxMX0lNQUdFU19DTURTCj4gKwljcCAtZHBmciAkKEBEKS9rZXlzICQoQklO
QVJJRVNfRElSKS8KPiArCWNwIC1kcGZyICQoQEQpL3NjcmlwdHMgJChCSU5BUklFU19ESVIpLwo+
ICtlbmRlZgoKSSB3b3VsZCBzdWdnZXN0IHRvIGNyZWF0ZSBhIHN1Yi1kaXJlY3RvcnkgdW5kZXIg
JChCSU5BUklFU19ESVIpIHRvIGF2b2lkIGFueQpmaWxlIGNvbmZsaWN0LgoKQmVzdCByZWdhcmRz
LApSb21haW4KCgo+ICsKPiArJChldmFsICQoZ2VuZXJpYy1wYWNrYWdlKSkKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
