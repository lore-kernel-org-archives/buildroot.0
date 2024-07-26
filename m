Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC42C3DA7F
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 12:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F330D6061E;
	Fri, 26 Jul 2024 12:53:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yCtoFq5u27rx; Fri, 26 Jul 2024 12:53:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15E4B60634
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15E4B60634;
	Fri, 26 Jul 2024 12:53:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4E6371BF863
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 12:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48FD660634
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 12:53:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gE05GaTO3FOt for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 12:53:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=vfazio@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1A6486061E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A6486061E
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1A6486061E
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 12:53:54 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5a10835480bso2484054a12.2
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 05:53:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721998433; x=1722603233;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iN+0pkM/VjadTmzO76iqIfSmQhkGrPe1TAP7tUfUzUA=;
 b=YJo5dGg4aj/DmcJQ2gJLF6aY5EhKF8KYJSs0Xu2D8CheTKWpdKE8TFtOQy6jq0g2uA
 t75wIa3+GCAV9VE73db4j3aysEVgS9HNjINRqRLk8mDJUJ/pGN8sdapIXlyISxihZHbb
 UeydyrLuCHssd46KQoDY5Ct+NjpYn8QgeGWk0TBvckhVX353EKyMuCoc4YZQERZmN8iO
 7zqUdNpocVkdHiHIhQbhHIeMTBaX+IOC+cGrUDES6B3nG3Tn/ktF9guFDUMKhzjhGfAZ
 K1QHJdnn8pWw32Z8UHYDS74HvhlhE+SD2qkqLHGNSbjpOntlWbzwHUgnv6BYf6pWSNIp
 maTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCViAgyaBd8vpuQE3p/StTshQBMWfI90E9CmpmTbekS6o3OSGxlCueP29wcOCRFFWI259jzYJO4m0o0SJ6ZLPzf3aAf0yiHIFA==
X-Gm-Message-State: AOJu0YxN/PxUd7B4jOe+kAFNePh9Qw0vsi3CwUUeOVvD+x8oWE2+LloU
 olEW7DMAm3D1164Qw+HQEw1kih18/oWdX6nghms7YyFyIyyMqbqutgITsQZnnwf1V5Z2XGZ9LGb
 FfaJrfZpnLeMZjfZeOf74ktoYjDwtTA==
X-Google-Smtp-Source: AGHT+IGPMrJDsUj74FLgv5p+Y3z6ZvGcQZ8Isn9hcxUR71LnPh5/Pi2gpiO6eKsYN6dgd0tXWcVU1ScbfZz8AhTygfs=
X-Received: by 2002:a05:6402:35ce:b0:59e:6b89:fdad with SMTP id
 4fb4d7f45d1cf-5ac6203b1d7mr4307467a12.3.1721998432790; Fri, 26 Jul 2024
 05:53:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240725080641.303312-1-dario.binacchi@amarulasolutions.com>
 <20240726094005.1fbcd4e9@windsurf>
In-Reply-To: <20240726094005.1fbcd4e9@windsurf>
From: Vincent Fazio <vfazio@gmail.com>
Date: Fri, 26 Jul 2024 07:53:41 -0500
Message-ID: <CAOrEah43M9sLraRBp1ApABU=mXv7RC+ar67uRxiTeY-ZBoYtpQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721998433; x=1722603233; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iN+0pkM/VjadTmzO76iqIfSmQhkGrPe1TAP7tUfUzUA=;
 b=J0M+wROg2x4Rq47GvAbG30yyLAwtF1cotVcJH++1yVZcu6lbnORxXkrtBsyuZIcvCM
 y+khUjzuxU0UVWeHjUvFledaYYybTwovvwYHTD/yorvpxteHfR5gGL25l5672t1UiHUf
 FiRP2QZz1ueiXb5av4b0jUozuMwbmkBwFo4EULkfQuYk1yz5sDoY/QnTE4+ZG7iG4U62
 +N6MsjtIYtzS9Ihm9ZZ8W+QNX06fQEYc104d0cDhtz9t2ZBTKARE1u5GcV7MD+3UAkL0
 4obBq+uTI1pt6EHyt2mpO0OSMf775zYn64OewEht6/hzAh6me0HqaKs7OKPJ5eMTiKrJ
 HRYQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=J0M+wROg
Subject: Re: [Buildroot] [PATCH 1/1] package/elfutils: fix build on
 microblaze
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWxsLAoKT24gRnJpLCBKdWwgMjYsIDIwMjQgYXQgMjo0MOKAr0FNIFRob21hcyBQZXRhenpvbmkK
PHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCAyNSBKdWwg
MjAyNCAxMDowNjo0MSArMDIwMAo+IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFy
dWxhc29sdXRpb25zLmNvbT4gd3JvdGU6Cj4KPiA+ICtpZmVxICgkKEJSMl9taWNyb2JsYXplYmUp
LHkpCj4KPiBJJ3ZlIGNoYW5nZWQgdG86Cj4KPiBpZmVxICgkKEJSMl9taWNyb2JsYXplKSx5KQo+
Cj4gYXMgdGhlIGlzc3VlIGFwcGxpZXMgdG8gYm90aCBMRSBhbmQgQkUgTWljcm9ibGF6ZSwgYW5k
IGFwcGxpZWQuCj4KPiBBbHRob3VnaCB3ZSBkbyBoYXZlIGEgcHJvcG9zYWwgZm9yIGEgbW9yZSBn
ZW5lcmFsIHNvbHV0aW9uIHRvIHRoaXMKPiBwcm9ibGVtOiBhZGQgc3ltYmVyIGF0dHJpYnV0ZSBz
dXBwb3J0IGZvciBNaWNyb2JsYXplLCBpbiBwYXRjaDoKPgo+ICAgaHR0cHM6Ly9wYXRjaHdvcmsu
b3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDI0MDIyODE2NTMwMC40MTU4NzUx
LTEtdmZhemlvQGdtYWlsLmNvbS8KPgo+IFByb2JsZW0gaXMgdGhhdCB0aGUgcGF0Y2ggcHJvcG9z
ZWQgYnkgVmluY2VudCBpcyBhcHBhcmVudGx5IG5vdCBnb2luZwo+IHRvIGJlIGFjY2VwdGVkIGJ5
IHVwc3RyZWFtIGdjYywgc28gd2Ugd291bGQgY2FycnkgaXQgZm9yZXZlciwgc28gSSdtCj4gbm90
IHN1cmUgd2hpY2ggZGVjaXNpb24gdG8gdGFrZSBhYm91dCBpdC4KCkknbSBub3Qgc3VyZSBpdCBf
d29uJ3RfIGJlIGFjY2VwdGVkLCBJIGp1c3Qga25vdyBvbmUgdXNlciB3YXMgdm9jYWwKYWJvdXQg
YSBtaWdyYXRpb24gdG8gZWxmb3MuaC4KClRoZSBtaWdyYXRpb24gaXMgbm9uLXRyaXZpYWwgKGZv
ciBtZSksIGhlbmNlIHRoZSBwYXRjaCB0byBwb3J0IHNlbXZlci4KSSBjb3VsZCBzdWJtaXQgdGhp
cyB1cHN0cmVhbQpidXQgSSBoYXZlbid0IGhhZCB0aW1lIHRvIGxvb2sgaW50byBwZXJmb3JtaW5n
IHJlZ3Jlc3Npb24gYnVpbGRzL3Rlc3RzCmZvciB0aGUgY2hhbmdlLgoKPgo+IFRoYW5rcyEKPgo+
IFRob21hcwo+IC0tCj4gVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxp
bgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCj4g
aHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
