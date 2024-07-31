Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5A6C3DA64
	for <buildroot@archiver.kernel.org>; Wed, 31 Jul 2024 19:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5799400FC;
	Wed, 31 Jul 2024 19:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OwS4TnITPJLS; Wed, 31 Jul 2024 19:56:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD35F40188
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD35F40188;
	Wed, 31 Jul 2024 19:56:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8C6DC1BF32B
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 19:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A76560776
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 19:56:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TfwlKxKO2k1o for <buildroot@lists.busybox.net>;
 Wed, 31 Jul 2024 19:56:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 943B66060C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 943B66060C
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 943B66060C
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 19:56:16 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-52efd91dd28so1154402e87.1
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 12:56:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722455774; x=1723060574;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aes06iSPIjlnxMT7i0uEc7oJiy0Ffhr79QkEeeuqZbI=;
 b=gyFJC9OeM4qoWnQVeZQTACZ5ZgzXSJvXP/bT3EXqX3cwsHdHAldDtEPz9fEwUrKhof
 viumqPUFjogLSfrf1U08vxAxsrq8TrQm1+kTD5tJHLJRvxgSjZzDuTMXlMEfgFRc5apF
 5PhUrwF9nuK1Pr5+DOfxxyY8wvzGzS5WqSe17kbMK8e0CGfxCdYiLionwlCeTu+Hk1mX
 qs37edVlZlzK+9f/iEqDZqJixXey/nZasXZ4bMa1jPnzUmQema51Uc/J+UTl94/4k7OE
 9wZPD0gnnk2QdA83e1gmtDdRSsf+4nrDs0a2tyyAxwWWtQNoNknGrUul8A7YfM7k1o83
 XM3g==
X-Gm-Message-State: AOJu0YzVIdiAEw78BCRNx9CHKQfvll9OO0E2b4T16LjZt4Ot8tPDL6RN
 rs5RjLIeSlqdyVMIJb9FnbnX1ZQnmyG4fkRpO3KFXuHLNNkBL7+evTiqylIQrW+usJ1qARHZVdd
 7PdDM1Y92ypPaNRMG1wsAVMQGt8IWrh41
X-Google-Smtp-Source: AGHT+IElUnySKUtgwJND6DW43Yi702El/HW2Kk9NtO5uJw7VBhAY2vy9Ob7vEFPnORt0l/82BdH6NaBtJT9hczqgvGo=
X-Received: by 2002:a05:6512:3d0a:b0:52f:10b:667f with SMTP id
 2adb3069b0e04-530b61ece14mr28156e87.5.1722455773749; Wed, 31 Jul 2024
 12:56:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240731144421.363494-1-philip-dylan@gleonec.bzh>
 <CAOMZO5BO_07mXQTiyLWBMV8CXd3-6N_sYHcT_O1yY+aRcFFiOA@mail.gmail.com>
 <c5c8be7c-d718-40aa-9ff0-922d6e880ccc@gleonec.bzh>
In-Reply-To: <c5c8be7c-d718-40aa-9ff0-922d6e880ccc@gleonec.bzh>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 31 Jul 2024 16:56:02 -0300
Message-ID: <CAOMZO5AkXpJZ4cgd3584TDGVPj89xuhFoBp37dbhyQvAazR28Q@mail.gmail.com>
To: Philip-Dylan Gleonec <philip-dylan@gleonec.bzh>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722455774; x=1723060574; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aes06iSPIjlnxMT7i0uEc7oJiy0Ffhr79QkEeeuqZbI=;
 b=MHA/qbCSL6W99k4B7biwESGLja/k9Oyk4wZVWcxHR41mYkRr+jjiM2HXe4KId637oA
 kSROyXQFXMDFYWOV+ZwvtS606ND7p3LhP3YwS1vAz8YzjLCDIYJC9ehSk5FSPs0e7jGg
 QM5ovB3oMv9b4ILxcNLfGtKfJmGDKCIvKR5voZNV7zhhN4OPRy+8VBtb+axwf2ZO5w7c
 R2sHABNxKkK+tuSI8FYtjNlMuu52cBCoh0rtfyv7BOWKtnJro8UXLgFwikCuwKd/hTVi
 Uu/tuPB/uolek2jZSVOCpwCfWMCWhCb8MzaYwm3ShYxjUROs7NmwUT+XEMYZn9yA15aV
 Y85w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MHA/qbCS
Subject: Re: [Buildroot] [PATCH 0/2] Udoo Neo kernel update
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGhpbGlwLUR5bGFuLAoKT24gV2VkLCBKdWwgMzEsIDIwMjQgYXQgNDo1MOKAr1BNIFBoaWxp
cC1EeWxhbiBHbGVvbmVjCjxwaGlsaXAtZHlsYW5AZ2xlb25lYy5iemg+IHdyb3RlOgoKPiBIaSBG
YWJpbywKPgo+IFRoYW5rcyBmb3IgdGhlIHJldmlldy4gUmVnYXJkaW5nIHRoZSB0cmFjZSB5b3Ug
YXNrZWQsIEkgZ2V0Ogo+Cj4gIyBkbWVzZyB8IGdyZXAgU0RJTwo+IFsgICAgMy44NDkyNzRdIG1t
YzI6IG5ldyBoaWdoIHNwZWVkIFNESU8gY2FyZCBhdCBhZGRyZXNzIDAwMDEKClRoYW5rcyBmb3Ig
dGhlIHRlc3QuCgpPbiBteSBpbXg2c3gtdWRvbyBib2FyZCB0aGUgU0RJTyBXaWZpIGNoaXAgaXMg
bm90IGRldGVjdGVkIGF0IGFsbCwgc28KaXQgbG9va3MgbGlrZSBhbiBpc3N1ZSB3aXRoIG15IGJv
YXJkLgoKPiBJIGNoZWNrZWQgb24gNS4xNS4xNjIgYW5kIGhhdmUgdGhlIHNhbWUgcmVzdWx0LiBJ
biBib3RoIHZlcnNpb25zIEkgaGF2ZQo+IHRyYWNlcyBzaG93aW5nIGlzc3VlcyB3aXRoIHRoZSBX
aUZpL0JsdWV0b290aCBmaXJtd2FyZSBsb2FkOgo+Cj4gWyAgIDY0LjY1NzI5OV0gaGNpLXRpIHNl
cmlhbDAtMDogRGlyZWN0IGZpcm13YXJlIGxvYWQgZm9yCj4gdGktY29ubmVjdGl2aXR5L1RJSW5p
dF8xMS44LjMyLmJ0cyBmYWlsZWQgd2l0aCBlcnJvciAtMgo+IFsgICA2NC42Njc0NDVdIGhjaS10
aSBzZXJpYWwwLTA6IEZhbGxpbmcgYmFjayB0byBzeXNmcyBmYWxsYmFjayBmb3I6Cj4gdGktY29u
bmVjdGl2aXR5L1RJSW5pdF8xMS44LjMyLmJ0cwo+IFsgICA2OS42MTQ0OTZdIGNmZzgwMjExOiBm
YWlsZWQgdG8gbG9hZCByZWd1bGF0b3J5LmRiCj4KPiBJIGFzc3VtZWQgdGhpcyB3YXMgbm90IGEg
cmVncmVzc2lvbiBhcyB0aGUgYmVoYXZpb3Igd2FzIHRoZSBzYW1lIGJldHdlZW4KPiB2Ni42IGFu
ZCB2NS4xNS4gV2FzIGl0IHByZXZpb3VzbHkgcnVubmluZyBieSBkZWZhdWx0ID8gSWYgc28sIEkg
Y2FuIGxvb2sKPiBpbnRvIGZpeGluZyB0aGlzLgoKVGhpcyBpcyB0aGUgZXhwZWN0ZWQgYmVoYXZp
b3IgYXMgdGhlIGRlZmF1bHQgbXg2c3hfdWRvb19uZW9fZGVmY29uZmlnCmRvZXMgbm90IHNlbGVj
dCB0aGUgcmVxdWlyZWQgV2lmaSBmaXJtd2FyZS4KClRoYW5rcyBmb3IgeW91ciBoZWxwLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
