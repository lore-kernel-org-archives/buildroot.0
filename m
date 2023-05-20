Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A2AC77B7C
	for <buildroot@archiver.kernel.org>; Sat, 20 May 2023 19:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BB5E83118;
	Sat, 20 May 2023 19:56:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BB5E83118
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cgqADJKeusIQ; Sat, 20 May 2023 19:56:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB4BE83104;
	Sat, 20 May 2023 19:56:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB4BE83104
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 903841BF2C8
 for <buildroot@lists.busybox.net>; Sat, 20 May 2023 19:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6505741E0D
 for <buildroot@lists.busybox.net>; Sat, 20 May 2023 19:56:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6505741E0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XjIRy9IdrKhg for <buildroot@lists.busybox.net>;
 Sat, 20 May 2023 19:56:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07AB441E09
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07AB441E09
 for <buildroot@buildroot.org>; Sat, 20 May 2023 19:56:32 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-96f850b32caso252555866b.3
 for <buildroot@buildroot.org>; Sat, 20 May 2023 12:56:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684612591; x=1687204591;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3lCOGJ/3KZGDRyNInoqy+WxTCgJG7tEtRm7OJ2QtFyw=;
 b=lcGUqwOPU+giFvGzyLza/80y6A8gWKI1Uv2rmr6dXfRTkFbEATrFYK2HRinNjKaST3
 FiO36pKWBAU3lTV41YxfGSg12elKEhI7bnpCIoPs7JumgHuViEwYexGfDbncXrmre3nt
 oe1dZ4qEn4Xme7SvOQKIDb2/9q9KyrJTGL7wAw3Q6BeBLDLIqgiPZ+7kzBt6n/IthJ/c
 f4fkezcx44BP6CACTNlA5rldOY61uXx5qUrhnzTdqX4B869QSYEb/+BbeT26Tz1W5ks7
 r2e4vx2HsCKQqnHxMZ3d69FQvULFkOePumaKO8NOCayaAtnaWr3ROu31N+1btjSsTs1n
 cM5A==
X-Gm-Message-State: AC+VfDx1wSTlgsIT0kg+6qXmy2tJE5uwMCmctSxfvB3UDd72o85h4442
 ZRun08HRCN8MFfpkFqvh/yO7tdEjA+eep9Zr4YAWLA==
X-Google-Smtp-Source: ACHHUZ5+mk8BV/h3UKI1ncGkBlav7JC2AZljlScZ4mFwSAI4wv5odX0KPV0T39yJ6joiRbTiuNxz/9f8dG/u9l4w3rs=
X-Received: by 2002:a17:907:6ea2:b0:96f:98f1:6512 with SMTP id
 sh34-20020a1709076ea200b0096f98f16512mr2890803ejc.41.1684612590812; Sat, 20
 May 2023 12:56:30 -0700 (PDT)
MIME-Version: 1.0
References: <20221007133912.2869000-1-james.hilliard1@gmail.com>
 <20221007133912.2869000-2-james.hilliard1@gmail.com>
 <20230513115918.GP2582048@scaer>
In-Reply-To: <20230513115918.GP2582048@scaer>
From: James Knight <james.d.knight@live.com>
Date: Sat, 20 May 2023 15:56:20 -0400
Message-ID: <CALAjcgX5HXHqpnHy__cGnxFG=Ff=OtdHP5rZ0EPFDGc8T--zzg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 2/2] package/gobject-introspection: bump to
 version 1.74.0
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
Cc: James Knight <james.d.knight@live.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwKCk9uIFNhdCwgTWF5IDEzLCAyMDIzIGF0IDc6NTnigK9BTSBZYW5uIEUuIE1PUklOIDx5
YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cj4KPiBEbyB3ZSBoYXZlIHRvIG1ha2Ugc3Vy
ZSB0aGF0IHRoZSAibWFqb3IiIHZlcnNpb24gb2YgdGhlIEdOT01FIHBhY2thZ2VzCj4gYmUgYWxp
Z25lZCwgb3IgaXMgaXQgcG9zc2libGUgdGl4LW4tbWF0Y2ggdmVyc2lvbnM/CgpJdCBpcyBteSB1
bmRlcnN0YW5kaW5nIChub3cpIHRoYXQga2VlcGluZyB0aGUgbWlub3IgdmVyc2lvbiBpbgpsb2Nr
c3RlcCBpcyBhbG1vc3QgYWx3YXlzIHByZWZlcnJlZCAoYXQgbGVhc3QsIHdoZW4gY29uc2lkZXJp
bmcgdGhlCnBhY2thZ2VzIGdsaWIyLCBnbGliLW5ldHdvcmtpbmcsIGdvYmplY3QtaW50cm9zcGVj
dGlvbiBhbmQgZ2xpYm1tOyBJJ2QKYmUgY3VyaW91cyB0byBrbm93IGlmIEkgbWlzc2VkIGFueSku
IE1pY3JvIHZlcnNpb25zIGZvciBzdXJlIGRvIG5vdApyZXF1aXJlIGEgbWF0Y2ggYW5kIG1heSBi
ZSBvbGRlciBvciBuZXdlciB0aGFuIGdsaWIyJ3MgbWljcm8gdmVyc2lvbi4KCldoZW4gSSBzdWJt
aXR0ZWQgdGhlIHBhdGNoIGZvciBsaWJnbGliMiB0byAxLjc2LngsIEkgc2hvdWxkIGhhdmUgdGFr
ZW4KdGhlIHRpbWUgdG8gaW5jbHVkZSB1cGRhdGVzIGZvciBnb2JqZWN0LWludHJvc3BlY3Rpb24g
YW5kIGdsaWJtbSBhcwp3ZWxsLiBNeSBmb2N1cyBhdCB0aGUgdGltZSB3YXMgdG8ganVzdCB1c2Ug
dGhlIG1vcmUgcmVjZW50IHZlcnNpb24gb2YKZ2xpYi1uZXR3b3JraW5nLCB3aGljaCB3YXMgdGhl
IHNvbGUgcmVhc29uIGZvciBsaWJnbGliMiBiZWluZyBidW1wZWQuCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
