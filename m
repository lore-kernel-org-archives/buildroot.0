Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BB7C04E69
	for <buildroot@archiver.kernel.org>; Wed,  2 Aug 2023 14:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A551441486;
	Wed,  2 Aug 2023 14:29:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A551441486
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 06Wg2gcheZbM; Wed,  2 Aug 2023 14:29:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7DDD40AFC;
	Wed,  2 Aug 2023 14:29:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7DDD40AFC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 15F781BF372
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 14:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D39041B70
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 14:29:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D39041B70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PK7GwUwTdmNV for <buildroot@lists.busybox.net>;
 Wed,  2 Aug 2023 14:29:26 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5BB90418E3
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 14:29:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BB90418E3
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3fe2048c910so32213185e9.1
 for <buildroot@buildroot.org>; Wed, 02 Aug 2023 07:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690986564; x=1691591364;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PyZ0A3JHIGsfDzrGlnVtOslLGD5YPgt7XphzXeBUCIU=;
 b=dgOAuzy3epbuaDsMEM/tgSJQsCVRKCi5sjsl/N9dg3ePfDmwiGYWqSFl6t/xmp5Uau
 qJwkwhw1TfKjzQKILhbiE+R9DExR6YemeYOf+R/UQfYsoyXX25uRAJH87xXYfg9HB2WU
 nstaDxm1pHGZseB1Rvo8wQB7aA8AC0vp1TkvYAGtoY2lkPDGg+jJc9HkD9cYT3A+WeM5
 3T9Neu+6Zh+ag3emQS1/NsRQxtD3/BY/xwaafzJbIFftZi9IXwq+nLH3DswBcJmgjPXh
 8a28Bj8/ayO08glToWxbwopcjeoVOhnAgNA3n5b3MSs8tj53q48oEOcRyk4DH+TGSF06
 hJUQ==
X-Gm-Message-State: ABy/qLZuoD2NbK390wBP2VKwpfsOvmG/NSpvM2QHlO7cGcKLvkVOtUxz
 5WbI29OKSPdxp6Vc1amauN+VZFhf0A8=
X-Google-Smtp-Source: APBJJlH1vOzmZkgN13wCOMWqInva0FdPEW52LApQWI0r8FxnMpwdjEPu2SPoQG76JrIOt0eijBzHsw==
X-Received: by 2002:a1c:f202:0:b0:3f9:b430:199b with SMTP id
 s2-20020a1cf202000000b003f9b430199bmr5152401wmc.15.1690986564306; 
 Wed, 02 Aug 2023 07:29:24 -0700 (PDT)
Received: from [10.0.0.120] (static-90-255-244-241.vodafonexdsl.co.uk.
 [90.255.244.241]) by smtp.gmail.com with ESMTPSA id
 n20-20020a05600c3b9400b003fd2e898aa3sm4428311wms.0.2023.08.02.07.29.23
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Aug 2023 07:29:23 -0700 (PDT)
Message-ID: <38cce51d-40e8-1e28-ed5a-0d2c9f8a710a@gmail.com>
Date: Wed, 2 Aug 2023 15:29:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: buildroot@buildroot.org
From: Nick Betteridge <lists.nick.betteridge@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690986564; x=1691591364;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PyZ0A3JHIGsfDzrGlnVtOslLGD5YPgt7XphzXeBUCIU=;
 b=CU03ywzZGrsJ7WM7oC/Z4nlwZ2CQGUmBdeG+fzRFZ51rxuGabprTuoy1+YhYuhDytt
 p0KYG+SsOOa6LBDhna97sJOfVM3WgjGkK8W+GCeIMh7ljrlHA2KDvzDDjMQJUmbvmsSd
 8UJ1vD7GZe2MNaUhf0s5edtvwEgqCN18SbX82G6uXHC3kq85J7R8ZwYvIp1KJMaqPptL
 Xjv16yKMEWCDVPr1xYFdQHGORZs+0Q+brv7knboSOzVETBNjsZMstQc2JkdTg+IauYEu
 zIenm0sE4alLJk6Cxiu/doDPWBUaNHYQrkQlz4K8lcgBfRMcrlug5e3hdk8yFnJz3FbS
 eyDA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=CU03ywzZ
Subject: [Buildroot] Arm cortex-a55 problem when building busybox
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpJJ3ZlIGp1c3QgcHVsbGVkIGJ1aWxkcm9vdCBoZWFkIGFuZCBkZWZpbmVkIHRoZSBm
b2xsb3dpbmcgdGFyZ2V0IC0KClRhcmdldCBBcmNoaXRlY3R1cmUgKEFBcmNoNjQgKGxpdHRsZSBl
bmRpYW4pKQoKVGFyZ2V0IEFyY2hpdGVjdHVyZSBWYXJpYW50IChjb3J0ZXgtQTU1KQoKRmxvYXRp
bmcgcG9pbnQgc3RyYXRlZ3kgKEZQLUFSTXY4KQoKCldoZW4gSSBkbyBhIG1ha2UsIEkgZ2V0IHRo
ZSBmb2xsb3dpbmcgZXJyb3Igc3RhdGluZyB0aGF0IGNvcnRleC1hNTUgCmRvZXNuJ3QgZXhpc3Qs
IGV2ZW4gdGhvdWdoIGl0J3MgZGVmaW5lZCBpbiBtZW51Y29uZmlnOgoKLi4uCgoyMDIzLTA4LTAy
VDE1OjEwOjQxIExpbnV4IGtlcm5lbCBwcmludGsgYnVmZmVyIHN1cHBvcnQgCihGRUFUVVJFX0tN
U0dfU1lTTE9HKSBbTi95Lz9dIG4KMjAyMy0wOC0wMlQxNToxMDo0MiBeW1swMW1eW1tLY2MxOl5b
W21eW1tLIF5bWzAxOzMxbV5bW0tlcnJvcjogCl5bW21eW1tLdW5rbm93biB2YWx1ZSDigJheW1sw
MW1eW1tLY29ydGV4LWE1NV5bW21eW1tL4oCZIGZvciAtbWNwdQoyMDIzLTA4LTAyVDE1OjEwOjQy
IF5bWzAxbV5bW0tjYzE6XltbbV5bW0sgXltbMDE7MzZtXltbS25vdGU6IApeW1ttXltbS3ZhbGlk
IGFyZ3VtZW50cyBhcmU6IGNvcnRleC1hMzUgY29ydGV4LWE1MyBjb3J0ZXgtYTU3IGNvcnRleC1h
NzIgCmNvcnRleC1hNzMgdGh1bmRlcnggdGh1bmRlcnh0ODhwMSB0aHVuZGVyeHQ4OCB0aHVuZGVy
eHQ4MSB0aHVuZGVyeHQ4MyAKeGdlbmUxIGZhbGtvciBxZGYyNHh4IGV4eW5vcy1tMSB0aHVuZGVy
eDJ0OTlwMSB2dWxjYW4gdGh1bmRlcngydDk5IApjb3J0ZXgtYTU3LmNvcnRleC1hNTMgY29ydGV4
LWE3Mi5jb3J0ZXgtYTUzIGNvcnRleC1hNzMuY29ydGV4LWEzNSAKY29ydGV4LWE3My5jb3J0ZXgt
YTUzIGdlbmVyaWM7IGRpZCB5b3UgbWVhbiDigJheW1swMW1eW1tLY29ydGV4LWEzNV5bW21eW1tL
4oCZPwoyMDIzLTA4LTAyVDE1OjEwOjQyIAovaG9tZS9uaWNrL2ltYWdlL2UyNS9idWlsZHJvb3Qv
b3V0cHV0L2J1aWxkL2J1c3lib3gtMS4zNi4xL3NjcmlwdHMvZ2NjLXZlcnNpb24uc2g6IApsaW5l
IDEyOiBwcmludGY6ICM6IGludmFsaWQgbnVtYmVyCjIwMjMtMDgtMDJUMTU6MTA6NDIgL2Jpbi9z
aDogMTogWzogMDAwMTogdW5leHBlY3RlZCBvcGVyYXRvcgoyMDIzLTA4LTAyVDE1OjEwOjQyIF5b
WzdtPj4+IGJ1c3lib3ggMS4zNi4xIENvbmZpZ3VyaW5nXltbMjdtCjIwMjMtMDgtMDJUMTU6MTA6
NDIgXltbN20+Pj4gYnVzeWJveCAxLjM2LjEgQnVpbGRpbmdeW1syN20KMjAyMy0wOC0wMlQxNTox
MDo0MiAKUEFUSD0iL2hvbWUvbmljay9pbWFnZS9lMjUvYnVpbGRyb290L291dHB1dC9ob3N0L2Jp
bjovaG9tZS9uaWNrL2ltYWdlL2UyNS9idWlsZHJvb3Qvb3V0cHV0L2hvc3Qvc2JpbjovaG9tZS9u
aWNrLy5vcGFtLzUuMC4wK29wdGlvbnMvYmluOi9ob21lL25pY2svYmluOi91c3IvbG9jYWwvc2Jp
bjovdXNyL2xvY2FsL2JpbjovdXNyL3NiaW46L3Vzci9iaW46L3NiaW46L2JpbjovdXNyL2dhbWVz
Oi91c3IvbG9jYWwvZ2FtZXM6L3NuYXAvYmluOi9zbmFwL2JpbiIgCkNGTEFHUz0iLURfTEFSR0VG
SUxFX1NPVVJDRSAtRF9MQVJHRUZJTEU2NF9TT1VSQ0UgCi1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjTC
oCAtT3MgLWcwIC1EX0ZPUlRJRllfU09VUkNFPTEiIENGTEFHU19idXN5Ym94PSIiIAovdXNyL2Jp
bi9tYWtlIC1qMzMgCkFSPSIvaG9tZS9uaWNrL2ltYWdlL2UyNS9idWlsZHJvb3Qvb3V0cHV0L2hv
c3QvYmluL2FhcmNoNjQtbGludXgtZ251LWdjYy1hciIgCk5NPSIvaG9tZS9uaWNrL2ltYWdlL2Uy
NS9idWlsZHJvb3Qvb3V0cHV0L2hvc3QvYmluL2FhcmNoNjQtbGludXgtZ251LWdjYy1ubSIgClJB
TkxJQj0iL2hvbWUvbmljay9pbWFnZS9lMjUvYnVpbGRyb290L291dHB1dC9ob3N0L2Jpbi9hYXJj
aDY0LWxpbnV4LWdudS1nY2MtcmFubGliIiAKQ0M9Ii9ob21lL25pY2svaW1hZ2UvZTI1L2J1aWxk
cm9vdC9vdXRwdXQvaG9zdC9iaW4vYWFyY2g2NC1saW51eC1nbnUtZ2NjIiAKQVJDSD1hcm02NCBQ
UkVGSVg9Ii9ob21lL25pY2svaW1hZ2UvZTI1L2J1aWxkcm9vdC9vdXRwdXQvdGFyZ2V0IiAKRVhU
UkFfTERGTEFHUz0iIiAKQ1JPU1NfQ09NUElMRT0iL2hvbWUvbmljay9pbWFnZS9lMjUvYnVpbGRy
b290L291dHB1dC9ob3N0L2Jpbi9hYXJjaDY0LWxpbnV4LWdudS0iIApDT05GSUdfUFJFRklYPSIv
aG9tZS9uaWNrL2ltYWdlL2UyNS9idWlsZHJvb3Qvb3V0cHV0L3RhcmdldCIgClNLSVBfU1RSSVA9
eSAtQyAvaG9tZS9uaWNrL2ltYWdlL2UyNS9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL2J1c3lib3gt
MS4zNi4xCjIwMjMtMDgtMDJUMTU6MTA6NDIgXltbMDFtXltbS2NjMTpeW1ttXltbSyBeW1swMTsz
MW1eW1tLZXJyb3I6IApeW1ttXltbS3Vua25vd24gdmFsdWUg4oCYXltbMDFtXltbS2NvcnRleC1h
NTVeW1ttXltbS+KAmSBmb3IgLW1jcHUKMjAyMy0wOC0wMlQxNToxMDo0MiBeW1swMW1eW1tLY2Mx
Ol5bW21eW1tLIF5bWzAxOzM2bV5bW0tub3RlOiAKXltbbV5bW0t2YWxpZCBhcmd1bWVudHMgYXJl
OiBjb3J0ZXgtYTM1IGNvcnRleC1hNTMgY29ydGV4LWE1NyBjb3J0ZXgtYTcyIApjb3J0ZXgtYTcz
IHRodW5kZXJ4IHRodW5kZXJ4dDg4cDEgdGh1bmRlcnh0ODggdGh1bmRlcnh0ODEgdGh1bmRlcnh0
ODMgCnhnZW5lMSBmYWxrb3IgcWRmMjR4eCBleHlub3MtbTEgdGh1bmRlcngydDk5cDEgdnVsY2Fu
IHRodW5kZXJ4MnQ5OSAKY29ydGV4LWE1Ny5jb3J0ZXgtYTUzIGNvcnRleC1hNzIuY29ydGV4LWE1
MyBjb3J0ZXgtYTczLmNvcnRleC1hMzUgCmNvcnRleC1hNzMuY29ydGV4LWE1MyBnZW5lcmljOyBk
aWQgeW91IG1lYW4g4oCYXltbMDFtXltbS2NvcnRleC1hMzVeW1ttXltbS+KAmT8KMjAyMy0wOC0w
MlQxNToxMDo0MiAKL2hvbWUvbmljay9pbWFnZS9lMjUvYnVpbGRyb290L291dHB1dC9idWlsZC9i
dXN5Ym94LTEuMzYuMS9zY3JpcHRzL2djYy12ZXJzaW9uLnNoOiAKbGluZSAxMjogcHJpbnRmOiAj
OiBpbnZhbGlkIG51bWJlcgoyMDIzLTA4LTAyVDE1OjEwOjQyIC9iaW4vc2g6IDE6IFs6IDAwMDE6
IHVuZXhwZWN0ZWQgb3BlcmF0b3IKMjAyMy0wOC0wMlQxNToxMDo0MiBIT1NUQ0PCoCBzY3JpcHRz
L2Jhc2ljL2ZpeGRlcAoyMDIzLTA4LTAyVDE1OjEwOjQyIEhPU1RDQ8KgIHNjcmlwdHMvYmFzaWMv
c3BsaXQtaW5jbHVkZQoyMDIzLTA4LTAyVDE1OjEwOjQyIEhPU1RDQ8KgIHNjcmlwdHMvYmFzaWMv
ZG9jcHJvYwoKLi4uCgpJcyB0aGVyZSBhIHNpbXBsZSB3YXkgZm9yIG1lIHRvIGZpeCB0aGlzPwoK
VGhhbmtzIGluIGFkdmFuY2UsCgpOaWNrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
