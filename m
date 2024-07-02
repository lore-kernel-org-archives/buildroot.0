Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1B9C3065C
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 19:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FDE760BF0;
	Tue,  2 Jul 2024 19:07:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y3HYDtygOwBv; Tue,  2 Jul 2024 19:07:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 333EC60BE7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 333EC60BE7;
	Tue,  2 Jul 2024 19:07:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 831AE1BF303
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70F1483F0F
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:07:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cOArbM8b7o2V for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 19:07:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112d; helo=mail-yw1-x112d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ABD0F83F0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABD0F83F0E
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ABD0F83F0E
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 19:07:47 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-64b417e1511so41573887b3.3
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 12:07:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719947266; x=1720552066;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yOln+aQwC4ZWr/dLUZtneHF3y//nLCrmX44cQvODm58=;
 b=GTDen61FR5xhV+lIY9PFbCspHuvF5p8t1ASN/DJIXb4OgKmQNAYWAVLkUYQ7xghmeC
 KcEPiDwaGH6R0PBOY7usN2Y0p8aXRsmywCprwdZDZbO7ivQgUB2/wUzMiN+AEvafk63N
 yMVpQ1jHV0pPR8XGrTZB5UK/DdKjOPQQvM4unmqAf92byY1PzF81hEAw91TLr5EgayZw
 aFyHBgujKuD5sTqcx8XFkatflhcX/UpJvARz24FtkunHC7xkkf5/a8C/x/IsmLL4DMcA
 5UVibEzZW5EcjtGcdjdcqT0/GDGisZx+z+YFIsfGN4dg7OasdLOHgwpbufnGJ95iCzqu
 c1+A==
X-Gm-Message-State: AOJu0Yx6VL6349prcOjMbQ9r4E5hfHdEcbSTdWb71zxtwkQB8Ts1ouJW
 Ag6Y81ecLoHs52dbxsZhK5+DvsnT7dtFFeY3iv125ajbMrZdz+5DSL6yH8SxHqcWYtClnHfWTv/
 Dzi1ljN0AvgWGQgUi/seVWHcOh4GhjhEPAXzSrg==
X-Google-Smtp-Source: AGHT+IEFIvpy9IEmQv92s1tGyWU+H4rqAzkb5YDTdiXo/Ql2aoRL/ynpTuIOY6BO9Sny6R0uxWVY1vCRHKYQMPtdSRA=
X-Received: by 2002:a05:690c:ec6:b0:64a:5132:c90a with SMTP id
 00721157ae682-64c73bdce0cmr114927387b3.46.1719947266066; Tue, 02 Jul 2024
 12:07:46 -0700 (PDT)
MIME-Version: 1.0
References: <80bb1c09-3932-4e4b-b6b3-3a8bc54bcaed@mind.be>
In-Reply-To: <80bb1c09-3932-4e4b-b6b3-3a8bc54bcaed@mind.be>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 2 Jul 2024 21:07:34 +0200
Message-ID: <CABGWkvoesNPu1TJ+eRfQdL7U9NET_PQoJSw52SOboFsyhm_UCA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1719947266; x=1720552066;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yOln+aQwC4ZWr/dLUZtneHF3y//nLCrmX44cQvODm58=;
 b=mdYGfzHqhXyLDzhvM/G/AvO0UCc78jvI/ghFXIA1G23XfV+JA9U2ulnOK4VVAHgjJc
 EGS2FZM8fWTZvW2c9pudXCLeR30bTdvrs+B1PHnUeED961rfhk74k5rjIw35zhrVqQQG
 ZIQfDMvOPsP5hxvWfU4Ehy6lvD+15LSbUO26E=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=mdYGfzHq
Subject: Re: [Buildroot] Thank you for fixing the fuzz-0 fallout
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LAoKT24gVHVlLCBKdWwgMiwgMjAyNCBhdCAzOjUz4oCvUE0gQXJub3V0IFZhbmRl
Y2FwcGVsbGUgPGFybm91dEBtaW5kLmJlPiB3cm90ZToKPgo+ICAgSGkgRGFyaW8sCj4KPiAgIEkn
ZCBsaWtlIHRvIHRoYW5rIHlvdSBleHBsaWNpdGx5IGZvciBmaXhpbmcgdGhlIGZhbGxvdXQgb2Yg
dGhlIGZ1enotMCBjaGFuZ2UuCj4gVGhhdCB3YXMgYSBiaWcgY2hhbmdlIHRoYXQgdG91Y2hlcyBh
IGxvdCBvZiBwYWNrYWdlcyB0aGF0IHlvdSdyZSBwcm9iYWJseSBub3QKPiByZWFsbHkgaW50ZXJl
c3RlZCBpbiwgYW5kIGl0J3MgZ3JlYXQgdG8gc2VlIHlvdSB0YWtlIHNvIG11Y2ggcmVzcG9uc2li
aWxpdHkgZm9yIGl0LgoKQXMgSSBhbHNvIG1lbnRpb25lZCB0byBZYW5uIGluIGEgcHJldmlvdXMg
ZW1haWwsIEkgZGlkIG5vdCBleHBlY3QgdGhhdAp0aGUgdGVzdCBydW4KZm9yIHRoZSBzZXJpZXMg
eW91IG1lcmdlZCB3b3VsZCBkZXRlY3Qgb25seSBhIHNtYWxsIHBvcnRpb24gb2YgdGhlIHBhdGNo
ZXMgdGhhdApuZWVkZWQgdG8gYmUgY29ycmVjdGVkLiBTbyBJIHRoaW5rIGl0IGlzIG5lY2Vzc2Fy
eSB0byB0cnkgdG8gZml4IHRoaXMKcHJvYmxlbSBhcyBtdWNoCmFzIEkgY2FuLgoKSSBhbSB2ZXJ5
IHBsZWFzZWQgdGhhdCB5b3UgYXBwcmVjaWF0ZSB3aGF0IEkgYW0gZG9pbmcgZGVzcGl0ZSB0aGUg
ZmFjdAp0aGF0IHRoaW5ncwpoYXZlbid0IGdvbmUgc21vb3RobHkuCgpUaGFua3MgQXJub3V0IQoK
UmVnYXJkcywKRGFyaW8KCj4KPiAgIFRoYW5rIHlvdSB2ZXJ5IG11Y2ghCj4KPgo+ICAgUmVnYXJk
cywKPiAgIEFybm91dAo+CgoKLS0gCgpEYXJpbyBCaW5hY2NoaQoKU2VuaW9yIEVtYmVkZGVkIExp
bnV4IERldmVsb3BlcgoKZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KCgpBbWFydWxhIFNvbHV0aW9ucyBTUkwKClZp
YSBMZSBDYW5ldmFyZSAzMCwgMzExMDAgVHJldmlzbywgVmVuZXRvLCBJVAoKVC4gKzM5IDA0MiAy
NDMgNTMxMAppbmZvQGFtYXJ1bGFzb2x1dGlvbnMuY29tCgp3d3cuYW1hcnVsYXNvbHV0aW9ucy5j
b20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
