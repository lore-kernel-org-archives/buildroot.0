Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27BCCCF2D6
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 09:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EC49406A2;
	Mon, 19 Oct 2026 09:01:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OLWErbL88OdZ; Mon, 19 Oct 2026 09:01:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3E36F406AB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792400469;
	b=qVHQEFccRnwlI/5ax2fO8t88yEDcnDt5Zur9gq4u8ddUKWweIkDx+ztH0L4aYrX2nQJG
	 PFB6px0D4DortVLz1bf2ng4QANpsOas6pSogktWnk06IpS7ZmwB3n8D1ybkks0/c3/Z6Y
	 vpA7cOlQwLmCnTUFbWcVwlUcWq6ZSgUIQcxU8TNz5rYQFFlz9pEqAHr4fNQjDPjo4u+4N
	 ub9WDz/zddhNPJYnNSibfbnIAaK3q88SoGks3QwxmY3+XsI2cqDUqhbnV/IKIou87CHqM
	 xdMEZGxfjS2nYpD4sh9Bv5P8LzWvfCnc3JU1vquEZHIapxIBtB4INCD4afe9RihGwxQ==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792400469;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:Date:X-Gm-Features:Message-ID:To:
	 Cc:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=aacwTnbPHUeXb8WQHiBwerjRaeOIZcMCq6lbch+UMsg=;
	b=nPe7mqyNKg24ArQ58chwa2DzOahutqBy0wyPxuGJ5JMXO5wCUXdFCP87piBmxmqjy3aJ
	 Pa9J7mngX0yBvsYpVaICOCctlQeNonCCGLjH9Djh7qXJRbpLWLNiX7eHDmT42PSPPhzHd
	 BSJi25rBXWH9uFsA1LrT64HuRxWSWGE6CnqtI1vlOgfilzfACzBGghWloPjXM+FjU+m6c
	 RJ0JK1pvqO79SMbCDlImG/fUhgSjKU5tqr2hSWMpqR8xVk9NnLQvpOFS0vs+R4II08RQZ
	 rESodo0Umbre+ktCD+c9ZNVzhLWb20B20uVgFhLJEbU+SvSRTM8U2/VBnN9Tl4w488g==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792400469;
	bh=aacwTnbPHUeXb8WQHiBwerjRaeOIZcMCq6lbch+UMsg=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QPZirvmDRwxshMTXjw+XhkPFn6Th4Uqlm7ZJ1ifu3bG/tm0Knj/zaYUn50QQM90jM
	 pnr7eoP6QpZcGel/8vZUHslAq0bkSYaZ0oaZGED2gzPn3U4/T3XBOA8T0dSK48rUqG
	 ZQluQX0qzgiXyMiate/m4+WuURzx/YI85m0zuRjQEgAGemweAcWpetAvCiS35Qfxwz
	 le762umzage9HD5J3w2Hk/nUuc+VKvNKHJP7IWjON1+2OkmgNkNYNcxUYmkN4XCTUu
	 Kb5bR3Yj9s396ifuX5EkY81db/Pi3iT22i+yPSK2HmiZBNPdDWs4vq7RC05wrzL8z+
	 AG7HdowXu60Bw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E36F406AB;
	Mon, 19 Oct 2026 09:01:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F4BF1E9
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 09:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 056904018B
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 09:01:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VE0W7qFfdTHO for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 09:01:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 72F0340062
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1792400466;
 b=G+eaymeJBHC0iulpvPf+DOQwtz3dy0YXLXEAg6fj5XaQg9YVBOSM0Ru19flvzCQY7Ag4
 vGmXLkMfFnwnp5ytIugIxSXucjPvjmzj/ya862TcT6zRJtNNCqTZ3ICTXqQq5osjhpeMv
 E8d/sbp21mP8YvZZpv5znnfXL9M9N6k3YllNCJKL+hQIBAmHcwjVxyI3wUOs2e8vKuwqC
 If7p1vX/yeZ0xNsCWJ5+qUqCiNBdhyR6fJxKL8tmktzcUrwSxZeW+aPXBVGbWpFcNBGrH
 M8UHhV93PgYlLFil0EOs7Wcy8KZFEb5yUodhCERnYcsp24egLU0n/dZQ1soyohSwx6Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792400466;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=IsMHPlmdcoRzrm1NEQQ0lDBwJw93ugrrDqIJnwuGaNs=;
 b=A0Bi6+8p070tCtrBXb15sSeyr7XB+ob5ZBCe2sHwLSc+zvNrH/3s2iuxVVX2CxOXKDY1
 NlpPD7/oyIcvhujNBGIhHF+dlD7Y/zo/vf5KgSaWIrqBfg7c7yPxBVAj3hTRBxXdITpyB
 Ty9K1SoWn5Dh4qaE7oBCmLH4ZMV3IlZx8ickmhOzL2ViilJCY+9hfLjEQIefxG1Veh3E+
 Aoi/4w6tPgmIAVmFPS1xKIAFaYEtr4ZjofhLIHellMWoxsx9PxcBUUMyBbbjnE/2rv+8q
 qVRZSvxSw2ck7TkqZDpEuulBknTWq/ARtcWoCki3/iROp7jnh++3KZiYePaV9mPp5DA==
ARC-Authentication-Results: i=2; smtp2.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=FegMFTN+; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a00:1450:4864:20::536"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 72F0340062
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 09:01:05 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-6aa9164072cso2388055a12.2
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 02:01:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792400464; cv=none;
 d=google.com; s=arc-20260327;
 b=Upav45zQlCeErTBKDPUNTUpTJyXQ78G8bLajv8heWUrKOp9pCKd0Ce2e5YQe5Xe6w5
 xO1fuAQcIDuO/gmknLi0CjtPcJv6wABVQSlQQadtpnH6YsHREv67WPSsG3artMa5gU1f
 bxjMMS7XGypdT4+NJLFhCWyrIw4E0H2xx7n1rG1exPl4AV6SCiBk5FZP+BSJjzvtfS1k
 4Zwq4BQC0p9CuL8kgqiKZVQUR7ySay/m4rcOQ7Nirsh4ZcPNFvQt5C8RBpHDClIByfrm
 b2tPozMr6+GneLIP861uT5Fh65evtzggCpduv4/+TpkgUVevGJQmZWvQviHTZbMdZpbU
 fBPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=IsMHPlmdcoRzrm1NEQQ0lDBwJw93ugrrDqIJnwuGaNs=;
 fh=uz1GogHIGStckHDZ+Yggyh8cAlhI5P3TQlThSbQW9sI=;
 b=T8NybjIcNRbKOr+40pz6yju53lBNJEpS6Jtgq3hOhP35y1NAL2RfiYzPPHG+A5B9Zk
 DV7NgpjNs3/5Lj8Y6sEJY/1p0Yd/TwWkAEXRjmtE/l2bMccAO1Km+tTJ/7D+xa2S28XG
 jdh+EOL+or/2biZ12C+U284QxSCuU3vP9VOlQWojWT0Zgm0yGji8nojhncF7SQCojAR2
 mqcPFPpr5HkwSCiXG5Cy0JUHJKnRDrHzDpdX1qbqJVo3ylx3tAXZb67h5Zjww5hZCz4V
 ZWPtSzTQ7qGhOGPEjFZphcNlp4ppI6Gl1tPdbBqYrOnmldOC58MuLvun7GtKiHifLj70
 7ORQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792400464; x=1793005264;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=IsMHPlmdcoRzrm1NEQQ0lDBwJw93ugrrDqIJnwuGaNs=;
 b=Rj/FIgDNEJDwcyVJQYAXmlN9DNtjWQrm7HsRZ6ePaCOf1Wi+ssNcy7tarOmWI1Fo3m
 wMJb4WdT0jx/mhZMT/E6DA88NbxwG6weI59lSYgh4Gd4N+lj+4vLHi8ggZX437zTtuoE
 hGVSuTxpsJ8JwXqXbzz7chxbWf2sN9aT0TrSd9VHaLFzPBNtthDde2lky5VuLChLOYuC
 milTr33lOwdfLyn7ohs2dfrOrTGCa4zyDQuKKKbSpeHKmRbLZTW6ZvIX8QghhBpsP1RU
 UBEqLDwBGT5/eOWqv6SiKAH/5F6Y7xmmNtTRV2/n40FRfQ05CPvyIq+C0KUfE7XxE8yl
 aifQ==
X-Gm-Message-State: AFq9FYJi36K1G8mcYtSUxsaHUmP5VE81dLcCpb5GnUHIa/2+3R+YZVrL
 4P20Re0DEJux2vyXHUl64lnuFQAXgXx9YtCuSk8rCgwjo7afTO/aa59+N/UMhIoZpTysH5dNyiD
 XRNsfjrbrRV+fvYeaBLnLgQjv2cOfLOI0r2w4
X-Gm-Gg: AYBFou3zk1Id/+4kl8TxUFffJkH7YZzH7A32BSMK/AQlFp4FIwAJFkdv2zWR7Egvm+k
 7CWTX2rgrkWq8GqvC9YsSBZXzhvI9eThPW594uJImCff75LhaVsYxGwFhdFh5RRsimAF/73MKO8
 xI4cfZjL5fNfXY56LvQV/pQzn9IRnFZ1OlEZKNnmYd/Zw8cBf8bg0X/pAB9YEdtY/e/jUHQzvA4
 q88UO1ncf0Zt4KabjZfkgEqXY/u82TkgnmyHmi0UaDnZM7l/5TrWxBOq68Ge8ytNY4enoyG6AXQ
 jssfPdtoDOROmluV7tFoRBrKTaiIBn6G4RzJcKW4lDM48oHX/Ybx4DKn
X-Received: by 2002:a05:6402:910:b0:6ac:73f8:2e4f with SMTP id
 4fb4d7f45d1cf-6b3a818813bmr4324076a12.29.1792400463573; Mon, 19 Oct 2026
 02:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <20261011130058.3443432-1-bernd@kuhls.net>
 <20261011130058.3443432-3-bernd@kuhls.net>
In-Reply-To: <20261011130058.3443432-3-bernd@kuhls.net>
Date: Mon, 19 Oct 2026 11:01:30 +0200
X-Gm-Features: AclHuK9Dy8ji3VcvZIfBrODG8dQfFPJWZXBXM67bPMcXaqiyL_IM68S2vSm022A
Message-ID: <CAGm1_kt5ExaGSQe4AcyDnX8EzQwPX4ZCXYdAX3Rrs=s2Sfjspg@mail.gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH v9 02/52] package/qt5/qt5opcua: remove
 package
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQmVybmQsIEFsbCwKCk9uIFN1biwgT2N0IDExLCAyMDI2IGF0IDM6MDHigK9QTSBCZXJuZCBL
dWhscyA8YmVybmRAa3VobHMubmV0PiB3cm90ZToKPgo+IEJ1aWxkIGlzIGJyb2tlbiB3aXRoIHRo
ZSB1cGNvbWluZyBidW1wIG9mIE9wZW5TU0wgdG8gNC4wLjM6Cj4KPiB4NTA5L29wZW5zc2xfc3lt
Ym9scy5jcHA6IEluIGZ1bmN0aW9uICdRRGF0ZVRpbWUgcV9nZXRUaW1lRnJvbUFTTjEoY29uc3Qg
QVNOMV9USU1FKiknOgo+IHg1MDkvb3BlbnNzbF9zeW1ib2xzLmNwcDoxMjQ0OjMxOiBlcnJvcjog
aW52YWxpZCB1c2Ugb2YgaW5jb21wbGV0ZSB0eXBlICdjb25zdCBBU04xX1RJTUUnIHtha2EgJ2Nv
bnN0IHN0cnVjdCBhc24xX3N0cmluZ19zdCd9Cj4gIDEyNDQgfCAgICAgc2l6ZV90IGxUaW1lTGVu
Z3RoID0gYVRpbWUtPmxlbmd0aDsKPgo+IHg1MDkvb3BlbnNzbF9zeW1ib2xzLmNwcDoxMjQ1OjM1
OiBlcnJvcjogaW52YWxpZCB1c2Ugb2YgaW5jb21wbGV0ZSB0eXBlICdjb25zdCBBU04xX1RJTUUn
IHtha2EgJ2NvbnN0IHN0cnVjdCBhc24xX3N0cmluZ19zdCd9Cj4gIDEyNDUgfCAgICAgY2hhciAq
cFN0cmluZyA9IChjaGFyICopIGFUaW1lLT5kYXRhOwo+Cj4geDUwOS9vcGVuc3NsX3N5bWJvbHMu
Y3BwOjEyNDc6MTQ6IGVycm9yOiBpbnZhbGlkIHVzZSBvZiBpbmNvbXBsZXRlIHR5cGUgJ2NvbnN0
IEFTTjFfVElNRScge2FrYSAnY29uc3Qgc3RydWN0IGFzbjFfc3RyaW5nX3N0J30KPiAgMTI0NyB8
ICAgICBpZiAoYVRpbWUtPnR5cGUgPT0gVl9BU04xX1VUQ1RJTUUpIHsKPgo+IHg1MDkvb3BlbnNz
bF9zeW1ib2xzLmNwcDoxMzA3OjIxOiBlcnJvcjogaW52YWxpZCB1c2Ugb2YgaW5jb21wbGV0ZSB0
eXBlICdjb25zdCBBU04xX1RJTUUnIHtha2EgJ2NvbnN0IHN0cnVjdCBhc24xX3N0cmluZ19zdCd9
Cj4gIDEzMDcgfCAgICAgfSBlbHNlIGlmIChhVGltZS0+dHlwZSA9PSBWX0FTTjFfR0VORVJBTEla
RURUSU1FKSB7Cj4KPiBhbmQgbWJlZCBUTFMgc2luY2UgaXQgd2FzIGJ1bXBlZCBmcm9tIDIuMjgu
MTAgdG8gMy42LjMuMSB3aXRoIGJ1aWxkcm9vdAo+IGNvbW1pdCAzNDgxYTk2NDNmYzcyMjNlNDAw
ZWQ4NzdmMDhhZGUzNGQ0NGU2Yjc4IGFzIHNlZW4gYnkgdGhlCj4gYXV0b2J1aWxkZXJzLgo+Cj4g
VGhlIGxhc3QgcmVsZWFzZSBvZiB0aGUgNS54IHNlcmllcyBkYXRlcyBiYWNrIHRvIDIwMjA6Cj4g
aHR0cHM6Ly9naXRodWIuY29tL3F0L3F0b3BjdWEvcmVsZWFzZXMvdGFnL3Y1LjE1LjIKPgo+IEZp
eGVzOgo+IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy8xZjAvMWYwNmIx
ZWZkZGU2NWZjZDk5ZmY3OWE2M2VkMDFiNzQ5Nzg4ZGVjOC8KPgo+IFNpZ25lZC1vZmYtYnk6IEJl
cm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+Cj4gQ2M6IEFuZHJlYXMgTmF1bWFubiA8ZGV2QGFu
ZGluLmRlPgoKUmV2aWV3ZWQtYnk6IFllZ29yIFllZnJlbW92IDx5ZWdvcnNsaXN0c0Bnb29nbGVt
YWlsLmNvbT4KCj4gLS0tCj4gIENvbmZpZy5pbi5sZWdhY3kgICAgICAgICAgICAgICAgICAgfCAg
NyArKysrKysrCj4gIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSAtCj4g
IHBhY2thZ2UvcXQ1L0NvbmZpZy5pbiAgICAgICAgICAgICAgfCAgMSAtCj4gIHBhY2thZ2UvcXQ1
L3F0NW9wY3VhL0NvbmZpZy5pbiAgICAgfCAgOSAtLS0tLS0tLS0KPiAgcGFja2FnZS9xdDUvcXQ1
b3BjdWEvcXQ1b3BjdWEuaGFzaCB8IDEwIC0tLS0tLS0tLS0KPiAgcGFja2FnZS9xdDUvcXQ1b3Bj
dWEvcXQ1b3BjdWEubWsgICB8IDE5IC0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgNiBmaWxlcyBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKyksIDQwIGRlbGV0aW9ucygtKQo+ICBkZWxldGUgbW9kZSAxMDA2
NDQgcGFja2FnZS9xdDUvcXQ1b3BjdWEvQ29uZmlnLmluCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBw
YWNrYWdlL3F0NS9xdDVvcGN1YS9xdDVvcGN1YS5oYXNoCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBw
YWNrYWdlL3F0NS9xdDVvcGN1YS9xdDVvcGN1YS5tawo+Cj4gZGlmZiAtLWdpdCBhL0NvbmZpZy5p
bi5sZWdhY3kgYi9Db25maWcuaW4ubGVnYWN5Cj4gaW5kZXggODQ2ZTNjOGYwNC4uYzE1YTM5NzA0
MyAxMDA2NDQKPiAtLS0gYS9Db25maWcuaW4ubGVnYWN5Cj4gKysrIGIvQ29uZmlnLmluLmxlZ2Fj
eQo+IEBAIC0xNDYsNiArMTQ2LDEzIEBAIGVuZGlmCj4KPiAgY29tbWVudCAiTGVnYWN5IG9wdGlv
bnMgcmVtb3ZlZCBpbiAyMDI2LjExIgo+Cj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9RVDVPUENVQQo+
ICsgICAgICAgYm9vbCAicXQ1b3BjdWEgaGFzIGJlZW4gcmVtb3ZlZCIKPiArICAgICAgIHNlbGVj
dCBCUjJfTEVHQUNZCj4gKyAgICAgICBoZWxwCj4gKyAgICAgICAgIFRoZSBxdDVvcGN1YSBwYWNr
YWdlIGhhcyBiZWVuIHJlbW92ZWQgYmVjYXVzZSBpdCBpcwo+ICsgICAgICAgICBpbmNvbXBhdGli
bGUgd2l0aCBPcGVuU1NMID49IDQueCBhbmQgbWJlZCBUTFMgMy54Cj4gKwo+ICBjb25maWcgQlIy
X1BBQ0tBR0VfUVQ1S05YCj4gICAgICAgICBib29sICJxdDVrbnggaGFzIGJlZW4gcmVtb3ZlZCIK
PiAgICAgICAgIHNlbGVjdCBCUjJfTEVHQUNZCj4gZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9E
RVZFTE9QRVJTCj4gaW5kZXggNjRlMDM3MWNkNC4uMGQ1MmQzNGQ0ZSAxMDA2NDQKPiAtLS0gYS9E
RVZFTE9QRVJTCj4gKysrIGIvREVWRUxPUEVSUwo+IEBAIC0yMDMsNyArMjAzLDYgQEAgTjogIEFu
ZHJlYXMgTmF1bWFubiA8ZGV2QGFuZGluLmRlPgo+ICBGOiAgICAgcGFja2FnZS9ldmVtdS8KPiAg
RjogICAgIHBhY2thZ2UvbGliZXZkZXYvCj4gIEY6ICAgICBwYWNrYWdlL3BrZy1xbWFrZS5tawo+
IC1GOiAgICAgcGFja2FnZS9xdDUvcXQ1b3BjdWEvCj4gIEY6ICAgICBwYWNrYWdlL3F0Ni9xdDZv
cGN1YS8KPgo+ICBOOiAgICAgQW5kcmVhcyBaaWVnbGVyIDxicjAyNUB1bWJpa28ubmV0Pgo+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL3F0NS9Db25maWcuaW4gYi9wYWNrYWdlL3F0NS9Db25maWcuaW4K
PiBpbmRleCBiODM3NjAxZGM2Li44YjQ5MDNhNWFiIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcXQ1
L0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvcXQ1L0NvbmZpZy5pbgo+IEBAIC00OCw3ICs0OCw2
IEBAIHNvdXJjZSAicGFja2FnZS9xdDUvcXQ1bG9jYXRpb24vQ29uZmlnLmluIgo+ICBzb3VyY2Ug
InBhY2thZ2UvcXQ1L3F0NWxvdHRpZS9Db25maWcuaW4iCj4gIHNvdXJjZSAicGFja2FnZS9xdDUv
cXQ1bXF0dC9Db25maWcuaW4iCj4gIHNvdXJjZSAicGFja2FnZS9xdDUvcXQ1bXVsdGltZWRpYS9D
b25maWcuaW4iCj4gLXNvdXJjZSAicGFja2FnZS9xdDUvcXQ1b3BjdWEvQ29uZmlnLmluIgo+ICBz
b3VyY2UgInBhY2thZ2UvcXQ1L3F0NXF1aWNrY29udHJvbHMvQ29uZmlnLmluIgo+ICBzb3VyY2Ug
InBhY2thZ2UvcXQ1L3F0NXF1aWNrY29udHJvbHMyL0NvbmZpZy5pbiIKPiAgc291cmNlICJwYWNr
YWdlL3F0NS9xdDVxdWlja3RpbWVsaW5lL0NvbmZpZy5pbiIKPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9xdDUvcXQ1b3BjdWEvQ29uZmlnLmluIGIvcGFja2FnZS9xdDUvcXQ1b3BjdWEvQ29uZmlnLmlu
Cj4gZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMmIwYmEzN2FmMy4uMDAwMDAwMDAw
MAo+IC0tLSBhL3BhY2thZ2UvcXQ1L3F0NW9wY3VhL0NvbmZpZy5pbgo+ICsrKyAvZGV2L251bGwK
PiBAQCAtMSw5ICswLDAgQEAKPiAtY29uZmlnIEJSMl9QQUNLQUdFX1FUNU9QQ1VBCj4gLSAgICAg
ICBib29sICJxdDVvcGN1YSIKPiAtICAgICAgIGRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfUVQ1Cj4g
LSAgICAgICBoZWxwCj4gLSAgICAgICAgIFF0IGlzIGEgY3Jvc3MtcGxhdGZvcm0gYXBwbGljYXRp
b24gYW5kIFVJIGZyYW1ld29yayBmb3IKPiAtICAgICAgICAgZGV2ZWxvcGVycyB1c2luZyBDKysu
Cj4gLQo+IC0gICAgICAgICBUaGUgUXQgT1BDIFVBIG1vZHVsZSBpbXBsZW1lbnRzIGEgUXQgQVBJ
IHRvIGludGVyYWN0IHdpdGgKPiAtICAgICAgICAgT1BDIFVBIG9uIHRvcCBvZiBhIDNyZCBwYXJ0
eSBPUEMgVUEgc3RhY2suCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcXQ1L3F0NW9wY3VhL3F0NW9w
Y3VhLmhhc2ggYi9wYWNrYWdlL3F0NS9xdDVvcGN1YS9xdDVvcGN1YS5oYXNoCj4gZGVsZXRlZCBm
aWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggYTMyNTY1M2Y4MC4uMDAwMDAwMDAwMAo+IC0tLSBhL3Bh
Y2thZ2UvcXQ1L3F0NW9wY3VhL3F0NW9wY3VhLmhhc2gKPiArKysgL2Rldi9udWxsCj4gQEAgLTEs
MTAgKzAsMCBAQAo+IC0jIEhhc2ggbG9jYWxseSBjYWxjdWxhdGVkCj4gLXNoYTI1NiAgZmE4ZTBl
ODdhYWU2ZjMyMWFlY2FjMjYwNWU2YWMxYjg1OGJhMWVkNGRiM2M0YTc4YTE5M2ViN2I1NDdhYjIy
NCAgcXQ1b3BjdWEtNS4xNS4yLWdpdDQudGFyLmd6Cj4gLQo+IC0jIEhhc2hlcyBmb3IgbGljZW5z
ZSBmaWxlczoKPiAtc2hhMjU2ICBkOTNjYzQxNTM4MmYwMDEzMDg4ZmEyNzZkOWNmODIzNzNiYWRm
MjQ0Yzc4MjIwYTkyNmYxNWVlNDZmMGZlM2M0ICBMSUNFTlNFLUNDMAo+IC1zaGEyNTYgIGY4Mjdh
ZDA3OTY4NmJhOTJjYzk0ODExZTM1NDkyZDBlODk2NmY3MDQwMDhiNmRhOWVlZGEwYjY1OWZiNThh
OGQgIExJQ0VOU0UuRkRMCj4gLXNoYTI1NiAgOGNlYjRiOWVlNWFkZWRkZTQ3YjMxZTk3NWMxZDkw
YzczYWQyN2I2YjE2NWExZGNkODBjN2M1NDVlYjY1YjkwMyAgTElDRU5TRS5HUEwzCj4gLXNoYTI1
NiAgMGRiZTAyNDk2MWY2YWI1YzUyNjg5Y2JkMDM2Yzk3Nzk3NWQwZDBmNmE2N2ZmOTc3NjJkOTZj
YjgxOWRkNTY1MiAgTElDRU5TRS5HUEwzLUVYQ0VQVAo+IC1zaGEyNTYgIDZjM2YzYzMxYjkzOTg1
ZjFiOTNiZmJiMzVmYjYwOWQzNzI4MTY5N2QwZWZjMjIwYzlmOTFjZjRiNTllYWFiZGUgIExJQ0VO
U0UuR1BMdjIKPiAtc2hhMjU2ICA3NWQ4MDBlNjBjOGQ1OGMyZTdmMDMzOGU4NTUyZWE2MTIzYTlj
ZTdlNWRkOGUxY2RmMjA5NWUwMTNiNzM3NDg4ICBMSUNFTlNFLkxHUEx2Mwo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL3F0NS9xdDVvcGN1YS9xdDVvcGN1YS5tayBiL3BhY2thZ2UvcXQ1L3F0NW9wY3Vh
L3F0NW9wY3VhLm1rCj4gZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggZWY1MWFiZGRm
OC4uMDAwMDAwMDAwMAo+IC0tLSBhL3BhY2thZ2UvcXQ1L3F0NW9wY3VhL3F0NW9wY3VhLm1rCj4g
KysrIC9kZXYvbnVsbAo+IEBAIC0xLDE5ICswLDAgQEAKPiAtIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKPiAtIwo+IC0jIHF0NW9wY3VhCj4gLSMKPiAtIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAt
Cj4gLVFUNU9QQ1VBX1ZFUlNJT04gPSA1LjE1LjIKPiAtUVQ1T1BDVUFfU0lURSA9IGh0dHBzOi8v
Y29kZS5xdC5pby9xdC9xdG9wY3VhLmdpdAo+IC1RVDVPUENVQV9TSVRFX01FVEhPRCA9IGdpdAo+
IC1RVDVPUENVQV9JTlNUQUxMX1NUQUdJTkcgPSBZRVMKPiAtUVQ1T1BDVUFfTElDRU5TRSA9IEdQ
TC0yLjArIG9yIExHUEwtMy4wLCBHUEwtMy4wIHdpdGggZXhjZXB0aW9uKHRvb2xzKSwgR0ZETC0x
LjMgKGRvY3MpIENDMC0xLjAKPiAtUVQ1T1BDVUFfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UuR1BM
djIgTElDRU5TRS5HUEwzIExJQ0VOU0UuR1BMMy1FWENFUFQgTElDRU5TRS5MR1BMdjMgTElDRU5T
RS5GREwgTElDRU5TRS1DQzAKPiAtUVQ1T1BDVUFfU1lOQ19RVF9IRUFERVJTID0gWUVTCj4gLQo+
IC1pZmVxICgkKEJSMl9QQUNLQUdFX01CRURUTFMpLHkpCj4gLVFUNU9QQ1VBX0RFUEVOREVOQ0lF
UyArPSBtYmVkdGxzCj4gLWVuZGlmCj4gLQo+IC0kKGV2YWwgJChxbWFrZS1wYWNrYWdlKSkKPiAt
LQo+IDIuNDcuMwo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
