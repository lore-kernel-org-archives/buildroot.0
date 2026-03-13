Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18897107BCE6
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 23:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC2E040CB4;
	Fri, 13 Mar 2026 23:02:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fm8PfM4gDQiC; Fri, 13 Mar 2026 23:02:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E140240E4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773442939;
	bh=iBUf5o30W+QT53aLecRNMIETqLhvfIBWJB0BIqxBE74=;
	h=References:In-Reply-To:Date:To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=EPj57b3LEQH1LKBW/TjqlVHMzKBeRWoqp4d2BgYD8KXVHEBa9KSVmEKntGj/Cpz53
	 zQkAUnTUKZ1hql06546e6+XD77GynbnyYIuwcpKE8JYqS4gV4CPEM0dTsDgMqSqRLi
	 FFEmdwMRr2v9xP32lbbqlJx8yQgCpN/wsTvBD6fcP9n9ePViwoA0OFnF7QS42rNyo9
	 86xg4H/jZe8PtZQzEhRet/Ri3OdT70svjpOMnKtVunfVvHMBCHKpc7Gn0Fe9AwbR1w
	 EoBmNHobKxHQe6QfyRQWgUCYZZmSNEXNbyOvIIzAT+hz7fPZVXdwoLn+D0/FNeNK5i
	 VRbrhErBvDZ8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E140240E4B;
	Fri, 13 Mar 2026 23:02:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D74C6201
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 23:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8FB040658
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 23:02:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ek-wLlRkk1DE for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 23:02:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 987A240653
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 987A240653
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 987A240653
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 23:02:16 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5a13323ba85so3366523e87.3
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 16:02:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773442934; x=1774047734;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kK/II/t2p7LBLEa7ETbmWhqmZDX4AMf8lu58KmAEyIE=;
 b=YStw2DLBivJMPJbktLn40WvPkfiN6v48pZ5MhJ+HhRMmzUjMiry8fJe2DUXSBIiZbI
 XafEvQg7LSx/YhtkVsJ3o1HM+vApz3T77hRaXVImvr6H3NHoNRGmVAEbs94zoNYZSBTa
 +UE1t3epKhFmqzP5zDULBpWIAgrEr0T3BGDtP/pFwnYhPpWjmtWIUhVwpJoJ3pESDxa/
 VLY5aLLz6yaeEf2JS4+sUxmEBhWNWEsQjlfX/KPnDzWwEnQNW8XeHOarDz44IrA7JcBD
 kC1s+e2NXFz/REsWoof83XvHu8S3wsZNS0FTFDWttP3X/3hI4DHZakggXszcgrZQw5R1
 gN+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVpCvoePdLcnM/qOh5obmsgc+DobftqvQ1zMkXWNM8r9AdwqwURQlgR9jfj37JBlulcLD890JBVWw=@buildroot.org
X-Gm-Message-State: AOJu0Yyj6pTvKeZ5SmqZDXLUFQviAKeBN+nMEZ/1NY1kJXqQSDhtTY5G
 o2Ah5j2sUxDTPW1RnFYappJR+12wrE4RkQqClqsHum7MhUWVwBZYcxg7aeajf0VShIZ8arUzTcV
 7SxVPo/7YBg==
X-Gm-Gg: ATEYQzxnLa3UTaeW2juNhHQlY+bfgPgfnFltAm9CVWLkiuqDLU2MxW2NtbgW3QbJbIN
 2vrvOBEDvWS603KokkQM32Cd95Rwda3DZYzxtexiny+Wk0mCACz+QsBoXvXgGdpHz47+W7a/bTB
 MEkv36X/2cc9/gXOCtuLUgI3C11Almope+5Do5zdFStHeYL+kg9mRicGs0TZvYzkiNsDFJaHlly
 16Y8dCuWMnBNxNhS0yoTaUZA4WJQc8NHmhjJTcQpUU1yYRM3Fmml3WLRVAibZYZczRbe0I57Y2a
 fe8NsGAPGNJleXGF9EBYYAdWjIUlPt7MXgOXDFW/dYCENTmhD49q7Jmq2YzHNr75u3wwKggDbkD
 P8jFGqA0Kxg6cvBtbtJgCBZLIUNzxbXjLgnT5QMSdM0Z/yqObaOkiNxuvJbxprF3p60ie5viS7N
 lN5XrOzJhQX5gKbyEL93ROr48KhUj8OKIOfOTBjx949yY2dXbed2jijv5IzZDV0g==
X-Received: by 2002:ac2:4433:0:b0:5a1:3636:c770 with SMTP id
 2adb3069b0e04-5a162704929mr1224100e87.9.1773442933750; 
 Fri, 13 Mar 2026 16:02:13 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
 [209.85.167.52]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a15636227asm1824333e87.68.2026.03.13.16.02.12
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2026 16:02:13 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5a13323ba85so3366496e87.3
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 16:02:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWdhZFaWxZNMMzrnSpR5T69xLdCqRWxMxve6iSpvRQijoqspib256d5nPOtSf1pnxVcvrZfNvmhRd8=@buildroot.org
X-Received: by 2002:a05:6512:64c6:b0:5a1:572f:c45 with SMTP id
 2adb3069b0e04-5a16270ec89mr1278826e87.12.1773442932398; Fri, 13 Mar 2026
 16:02:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260312075722.86111-1-christian@aperture.us>
 <4529c7b6d321750cc0d99e8e02c4758f@free.fr>
 <875x6zirde.fsf@dell.be.48ers.dk> <11d74c7acb42b8608bae709315dd7468@free.fr>
In-Reply-To: <11d74c7acb42b8608bae709315dd7468@free.fr>
Date: Fri, 13 Mar 2026 16:02:00 -0700
X-Gmail-Original-Message-ID: <CA+h8R2pDgzU6i3P1aLR_uPdd3baK0Kc=hV1oRbnbrHoBFbU7uA@mail.gmail.com>
X-Gm-Features: AaiRm51VMWL9qBsecAWjmRWItAmmy9Zk7svFVDjzmCQJ9JW1H6uLqEPqIT4yg7I
Message-ID: <CA+h8R2pDgzU6i3P1aLR_uPdd3baK0Kc=hV1oRbnbrHoBFbU7uA@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1773442934; x=1774047734; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kK/II/t2p7LBLEa7ETbmWhqmZDX4AMf8lu58KmAEyIE=;
 b=OFwP3k2pF+uNjssYvHVKBkC3NrV+YW2xjLZzLCxqvCUF81ItnnE1UzRlKnL7M5UhV4
 8EJ7Qgg0C27L1djd2oAfoQtV8D7fuf7nPnYLWgTHCoSS3XUWzNJX2Gkd4IskXz6ePd6s
 YxU7jUm89/wiiE6B6kyfLq8C/sU9KjwbzJ6SOb/9NUmEbJW35tWQwiyp+uDYhqxzL9o8
 ymDcJCGh/pGXJvRxC2Ji2ajrchLXh/KHAu2OksjLg43y46uK9WNvCu9qTBw1dnwqYUMA
 5MPW4tdJID9ymttfAtoF2iKVQz2qWmi9WxdM/+y7sUiOcqXi0ylKO1xQJfD2XYYzhVGV
 7Q+w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=OFwP3k2p
Subject: Re: [Buildroot] [PATCH v2 1/1] package/go: security bump to version
 1.26.1
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Thomas Perale <thomas.perale@mind.be>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKT24gRnJpLCBNYXIgMTMsIDIwMjYgYXQgMTE6MjTigK9BTSBKdWxpZW4gT2xpdmFp
biA8anUub0BmcmVlLmZyPiB3cm90ZToKPiA+IE5JVDogSXQgd291bGQgaGF2ZSBiZWVuIGJldHRl
ciB0byBmaXJzdCBidW1wIHRvIDEuMjUuOCAod2hpY2ggaW5jbHVkZXMKPiA+IHRoZSBzYW1lIHNl
Y3VyaXR5IGZpeGVzKSBhbmQgdGhlbiBhZnRlcndhcmRzIGFkZCB0aGUgZmVhdHVyZSBidW1wIGZy
b20KPiA+IDEuMjUueCB0byAxLjI2Lnggc28gdGhlIHNlY3VyaXR5IGZpeCBjb3VsZCBiZSBiYWNr
cG9ydGVkLgoKSSB1bmRlcnN0YW5kLCB3aWxsIGRvIGluIGZ1dHVyZS4KCj4gSSB0aG91Z2h0IGFi
b3V0IHRoYXQuIFdlIHVzdWFsbHkgZG8gdGhhdCBmb3IgTFRTIG1haW50YWluZXJzIHRvCj4gY2hl
cnJ5IHBpY2sgdGhlIGJ1bXAuIEJ1dCB0aGUgTFRTIGJyYW5jaCBpcyBpbmNsdWRpbmcgZ28gMS4y
My4xMi4KPiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9ibG9i
LzIwMjUuMDIueC9wYWNrYWdlL2dvL2dvLm1rI0w3Cj4KPiBGb3Igd2hpY2ggYnJhbmNoIHlvdSB3
YW50ZWQgdGhpcyBwYXRjaCB0byBiZSBiYWNrcG9ydGVkIHRvPwoKSSBzaG91bGQgbWVudGlvbiB0
aGF0IHBlciB0aGUgR28gcmVsZWFzZSBwb2xpY3k6CgpodHRwczovL2dvLmRldi9kb2MvZGV2ZWwv
cmVsZWFzZSNwb2xpY3kKCkVhY2ggbWFqb3IgR28gcmVsZWFzZSBpcyBzdXBwb3J0ZWQgdW50aWwg
dGhlcmUgYXJlIHR3byBuZXdlciBtYWpvcgpyZWxlYXNlcy4gRm9yIGV4YW1wbGUsIEdvIDEuNSB3
YXMgc3VwcG9ydGVkIHVudGlsIHRoZSBHbyAxLjcgcmVsZWFzZSwKYW5kIEdvIDEuNiB3YXMgc3Vw
cG9ydGVkIHVudGlsIHRoZSBHbyAxLjggcmVsZWFzZS4KClNvLCByaWdodCBub3cgZ28xLjI2IGlz
IHRoZSBsYXRlc3QsIGdvMS4yNSBpcyBzdXBwb3J0ZWQsIGFuZCBnbzEuMjQgaXMKdGhlIG9sZGVz
dCBzdXBwb3J0ZWQuCgpHbzEuMjMgaXNuJ3QgZ2V0dGluZyBldmVuIHNlY3VyaXR5IGZpeGVzIGFu
eW1vcmUsIHNvIHdlIHNob3VsZCBhdApsZWFzdCB1cGRhdGUgdGhlIExUUyBicmFuY2ggdG8gZ28x
LjI0LgoKQmVzdCByZWdhcmRzLApDaHJpc3RpYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
