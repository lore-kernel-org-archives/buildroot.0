Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2766CC433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Jun 2022 20:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B62C740B6A;
	Mon, 20 Jun 2022 20:00:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B62C740B6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CPiS4kmqVubb; Mon, 20 Jun 2022 20:00:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A778D40B37;
	Mon, 20 Jun 2022 20:00:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A778D40B37
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 74D541BF362
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 20:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C8BE40B37
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 20:00:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C8BE40B37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OiMJlRxITYvJ for <buildroot@lists.busybox.net>;
 Mon, 20 Jun 2022 20:00:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39D1A40B36
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 39D1A40B36
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 20:00:16 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id c13so12097275eds.10
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 13:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1cVV3424ww1/2tMS7+s4RFclwV9XsIgpxtlUfpsuy+4=;
 b=mfAVOWGosxLCJGgY4OqQlJ5N58eG33Tn7vuQA/akooOvZ8hj7stIeVE/YCJmiMrXI/
 g0XtUtn6tZ2crAXB4RJPZZj6+w19DIEL3euCARLj22XGgpk8JbjYRT1ltRxGpB+nXBAM
 4jcBDpJIJaeomRyboCdste8WUS5PBu759GPWssYMdvEVl6wH9KktCSn4qD2/mEngsLdv
 a5R7Es3OLm/anaNR7dywJgq3Igo4i+MGMUAMIvA+ZVOnCdsB6D9xSggShb+TsKpd4IxB
 yP9etmQRk/x72q1CU1wWQUj1BzOkY0Gko225Dg0t+0hfEP5iazl4iHUIgng3+s7GLFBv
 p2YQ==
X-Gm-Message-State: AJIora80poTkGX62LzaqdTUMLY/QGL5cpqbN10xtra1eIFazFX8UGQNG
 YObtqUDLtciac8aeUxTiocfAUQ==
X-Google-Smtp-Source: AGRyM1u0EEyOrOJM+Ti4gg4Kz7021hNzeoYFdx6Ufsb2XOeT3TpD5WUfpy0goalahFXtk8t0toa+7w==
X-Received: by 2002:a05:6402:320f:b0:435:7236:e312 with SMTP id
 g15-20020a056402320f00b004357236e312mr15459613eda.115.1655755215274; 
 Mon, 20 Jun 2022 13:00:15 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a1709067fd100b0070f1b033de4sm6367571ejs.200.2022.06.20.13.00.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 13:00:14 -0700 (PDT)
Message-ID: <2cf39f4d-39ce-78e8-427e-17b48de387c0@mind.be>
Date: Mon, 20 Jun 2022 22:00:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, buildroot@buildroot.org
References: <20220606135756.2264709-1-clg@kaod.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220606135756.2264709-1-clg@kaod.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1cVV3424ww1/2tMS7+s4RFclwV9XsIgpxtlUfpsuy+4=;
 b=XJ5CILGzAAgK0DSJYz7KhAFQpFpqrJmXgPfoj/iMKHGvcai0Zolm6JSOvCAu8G+jef
 Tfq3yG6Yq4Fdq6iuqLtwxwZLL+WG5waWrRS836AJLetvxt/+tYxNkZ5R2oegwTyvxgsH
 2WykKvMKO+UNr59CsW0tAuDrEOk+Wm2UF7NAnjH9b19T2OPkX18fIFJtEtEAFI86W6Wz
 s0asIwLT2KGwdI8o14GnNGHCMk7lQ8mNWZJCVbonxp8STZ95xRlbobswkeml+mfHBD3v
 k5MFr9yj7G1RWJMxjAyb6aLYq5YQz4x/Mkl2o52hrPOQwsEwHUU4CWWOzXJjdON7RI7w
 ZEvQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XJ5CILGz
Subject: Re: [Buildroot] [PATCH v2 1/2] configs/aspeed_ast2600evb: new
 defconfig
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
Cc: chin-ting_kuo@aspeedtech.com, troy_lee@aspeedtech.com,
 Joel Stanley <joel@jms.id.au>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNi8wNi8yMDIyIDE1OjU3LCBDw6lkcmljIExlIEdvYXRlciB3cm90ZToKPiBUaGUga2Vy
bmVsIGlzIGZyb20gdXBzdHJlYW0gYW5kIFUtQm9vdCBpcyBmcm9tIHRoZSBPcGVuQk1DIGJyYW5j
aAo+IHdoZXJlIG1vc3Qgb2YgZGV2ZWxvcG1lbnQgaXMgZG9uZS4gTWFpbmxpbmUgZG9lc24ndCBo
YXZlIHRoZSByZXF1aXJlZAo+IHN1cHBvcnQgZm9yIEhXLgo+IAo+IFRoZSBtYWluIHJlc3VsdGlu
ZyBmaWxlIGZyb20gdGhlIGJ1aWxkIGlzIGEgZmxhc2ggaW1hZ2UuIFRoZSBwYXJ0aXRpb24KPiBs
YXlvdXQgbWF0Y2hlcyB0aGUgT3BlbkJNQyBvbmUgZm9yIDY0TSBjaGlwcy4gSXQgbWFrZXMgaXQg
ZWFzaWVyIHRvCj4gdXBkYXRlIHRoZSBkaWZmZXJlbnQgcGFydGl0aW9ucyBmcm9tIExpbnV4LiBJ
bnRlcm1lZGlhdGUgZmlsZXMgY2FuIGJlCj4gdXNlZCB0byBib290IGZyb20gVS1ib290IG92ZXIg
dGhlIG5ldHdvcmsgb3IgdG8gYm9vdCBRRU1VIHVzaW5nCj4gLWtlcm5lbC8taW5pdHJkLy1kdGIu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4KCltz
bmlwXQo+IGRpZmYgLS1naXQgYS9jb25maWdzL2FzcGVlZF9hc3QyNjAwZXZiX2RlZmNvbmZpZyBi
L2NvbmZpZ3MvYXNwZWVkX2FzdDI2MDBldmJfZGVmY29uZmlnCj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjE5ZTQ2YTc1MmYzYwo+IC0tLSAvZGV2L251bGwKPiAr
KysgYi9jb25maWdzL2FzcGVlZF9hc3QyNjAwZXZiX2RlZmNvbmZpZwo+IEBAIC0wLDAgKzEsNTYg
QEAKPiArIyBBcmNoaXRlY3R1cmUKPiArQlIyX2FybT15CgogIEkgd291bGQgaGF2ZSBleHBlY3Rl
ZAoKQlIyX2NvcnRleF9hNz15CgpOb3cgaXQncyBidWlsZGluZyBmb3IgYXJtOTI2dC4uLgoKPiAr
Cj4gKyMgU3lzdGVtCj4gK0JSMl9UQVJHRVRfR0VORVJJQ19IT1NUTkFNRT0iYXNwZWVkLWV2YiIK
PiArQlIyX1RBUkdFVF9HRU5FUklDX0lTU1VFPSJBc3BlZWQgRVZCIgo+ICtCUjJfVEFSR0VUX0dF
TkVSSUNfR0VUVFlfUE9SVD0idHR5UzQiCgogIERvZXNuJ3QgdGhlIGRlZmF1bHQgY29uc29sZSB3
b3JrPwoKPiArQlIyX1NZU1RFTV9ESENQPSJldGgwIgo+ICsKPiArIyBGaWxlc3lzdGVtCj4gK0JS
Ml9UQVJHRVRfUk9PVEZTX0NQSU89eQo+ICtCUjJfVEFSR0VUX1JPT1RGU19DUElPX1haPXkKPiAr
Cj4gKyMgSW1hZ2UKPiArQlIyX1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVD0iYm9hcmQvYXNwZWVk
L2NvbW1vbi9wb3N0LWltYWdlLnNoIgo+ICtCUjJfUk9PVEZTX1BPU1RfU0NSSVBUX0FSR1M9IiQo
QlIyX0RFRkNPTkZJRykiCgogIEkgdGhpbmsgdGhpcyBhcmd1bWVudCBpc24ndCB1c2VkLCBpcyBp
dD8KCj4gKwo+ICsjIExpbnV4IGhlYWRlcnMgc2FtZSBhcyBrZXJuZWwKPiArQlIyX1BBQ0tBR0Vf
SE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV81XzE3PXkKPiArCj4gKyMgS2VybmVsCj4gK0JSMl9M
SU5VWF9LRVJORUw9eQo+ICtCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKPiArQlIy
X0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNS4xNy43Igo+ICtCUjJfTElOVVhf
S0VSTkVMX0RFRkNPTkZJRz0iYXNwZWVkX2c1Igo+ICtCUjJfTElOVVhfS0VSTkVMX0NPTkZJR19G
UkFHTUVOVF9GSUxFUz0iYm9hcmQvYXNwZWVkL2FzdDI2MDAtZXZiL2xpbnV4LmZyYWdtZW50Igo+
ICtCUjJfTElOVVhfS0VSTkVMX0RUU19TVVBQT1JUPXkKPiArQlIyX0xJTlVYX0tFUk5FTF9JTlRS
RUVfRFRTX05BTUU9ImFzcGVlZC1hc3QyNjAwLWV2YiIKPiArCj4gKyMgQm9vdAo+ICtCUjJfVEFS
R0VUX1VCT09UPXkKPiArQlIyX1RBUkdFVF9VQk9PVF9CVUlMRF9TWVNURU1fS0NPTkZJRz15Cj4g
K0JSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX0dJVD15Cj4gK0JSMl9UQVJHRVRfVUJPT1RfQ1VTVE9N
X1JFUE9fVVJMPSJodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy91LWJvb3QuZ2l0Igo+ICtCUjJf
VEFSR0VUX1VCT09UX0NVU1RPTV9SRVBPX1ZFUlNJT049ImYyYjgyZmE0YmExN2VkODA5MWZlNzZj
Mjg0MjIwMDA2NjQ1YTI5M2IiCj4gK0JSMl9UQVJHRVRfVUJPT1RfQk9BUkRfREVGQ09ORklHPSJl
dmItYXN0MjYwMCIKPiArQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19EVEM9eQo+ICtCUjJfVEFSR0VU
X1VCT09UX0NVU1RPTV9NQUtFT1BUUz0iREVWSUNFX1RSRUU9YXN0MjYwMGExLWV2YiIKPiArCj4g
K0JSMl9QQUNLQUdFX0hPU1RfVUJPT1RfVE9PTFM9eQo+ICtCUjJfUEFDS0FHRV9IT1NUX1VCT09U
X1RPT0xTX0ZJVF9TVVBQT1JUPXkKPiArQlIyX1BBQ0tBR0VfSE9TVF9HRU5JTUFHRT15Cj4gKwo+
ICsjIFRhcmdldCB0b29scwo+ICtCUjJfUEFDS0FHRV9NVEQ9eQoKICBPSywgZmFpciBlbm91Z2gs
IHNpbmNlIGZsYXNoY3AgaXMgbWVudGlvbmVkIGluIHRoZSByZWFkbWUuCgo+ICtCUjJfUEFDS0FH
RV9VQk9PVF9UT09MUz15Cj4gK0JSMl9QQUNLQUdFX0xJQkdQSU9EPXkKPiArQlIyX1BBQ0tBR0Vf
TElCR1BJT0RfVE9PTFM9eQo+ICtCUjJfUEFDS0FHRV9MSUJDVVJMPXkKPiArQlIyX1BBQ0tBR0Vf
TElCQ1VSTF9DVVJMPXkKPiArQlIyX1BBQ0tBR0VfTElCQ1VSTF9WRVJCT1NFPXkKPiArQlIyX1BB
Q0tBR0VfTElCRkZJPXkKPiArQlIyX1BBQ0tBR0VfRFJPUEJFQVI9eQo+ICtCUjJfUEFDS0FHRV9E
Uk9QQkVBUl9ESVNBQkxFX1JFVkVSU0VETlM9eQo+ICtCUjJfUEFDS0FHRV9MUlpTWj15CgogIEJ1
dCB3aHkgYXJlIGFsbCB0aGVzZSBuZWVkZWQ/IERlZmNvbmZpZ3Mgc2hvdWxkIGJlIG1pbmltYWwg
LSB0aGUgb25seSB0aGluZyB0byAKYWRkIGlzIHN0dWZmIHRoYXQgeW91IG5lZWQgdG8gbWFrZSB0
aGUgaGFyZHdhcmUgd29yazsgdHlwaWNhbGx5IGxpbnV4LWZpcm13YXJlLCAKZm9yIGV4YW1wbGUs
IG9yIHdwYV9zdXBwbGljYW50IGZvciBib2FyZHMgdGhhdCBoYXZlIG9ubHkgd2lmaS4gSSBkb24n
dCB0aGluayAKdGhhdCB0aGF0J3MgdGhlIGNhc2UgaGVyZS4KCj4gK0JSMl9QQUNLQUdFX0hPU1Rf
TUtQQVNTV0Q9eQoKICBUaGlzIG9uZSBpcyBkZWZpbml0ZWx5IG5vdCBuZWVkZWQsIGl0J3Mgbm90
IHVzZWQgYW55d2hlcmUgZHVyaW5nIHRoZSBidWlsZC4KCiAgUmVnYXJkcywKICBBcm5vdXQKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
