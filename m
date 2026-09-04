Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB67C624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 20:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 451A360BA6;
	Fri,  4 Sep 2026 20:37:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 68ZETFnLjwH0; Fri,  4 Sep 2026 20:37:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3374A60B89
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788554270;
	b=nXtM6I5ZzM/6Vus/O8l/eIF6X4gbm/eZt3U3LqD7msTM4fkKsvYJesjDAeAS/E58ZmPJ
	 xMaFJTPruVQJ+N1t5yRBbSY83ejm92oNqaoqjepqjUMJJsFYJ4VUMSELDmA/5s+PxB7ku
	 oXE5rH31Zzs9j2B31mk1JLXD0yOkXcGbQZSgXHBXc+6V8l3KabULCvaQrQcA+e6rx0Z5R
	 e3qHXDiCUYCVKwqfbh5GHGb4hrAzBpXA1lZLHJhvQOx29rOvuWntJ3UFAkTaD+azc3CU1
	 EFKCuhlTmPcKeUpZQudsPfRgGv4Iu5SxFjrusF1fU8gUfVz6OMVBLoTt39npT6HG+hg==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788554270;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=4gIBkHyk62iZV9S8b5qSwYZg/neAzh1189rkckA13Uc=;
	b=fHeZnGSxunofa7iDnyArQ+XegwQ7huI6q7EMiJYQo91Kz13yAa7kzxBOCGrxyWVGBSfe
	 OJJLeEuEDCQQEhlsjHGyCPkxzktA2GjDNRfVmgGeRR/I5Wd6VjVtM1x5eZttMfqpn15a1
	 Z85fHwtGTBoybqqtYsyBOgGzNX2oGfD8iMFsNn/IJsyaPSfjXXNX803JmA012M+XBPr3C
	 uUrYgcFk7O56v5NBtKj8A9inosd11UkZqG2RqmYF8fIxtO4UdtaO53n7VNd3q/W4rB14y
	 0PtsEo1fMmDvhXCfOLb4bI9EWi5b1HSP2Min85oYjnhgPFe3ajA3NfOW/prrajcM7+w==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788554270;
	bh=4gIBkHyk62iZV9S8b5qSwYZg/neAzh1189rkckA13Uc=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=db9PAdVVv7u4FFL5GwU9zxypUr40e/Sm/eg5tP9kYi9sR8Rq9lla23GmdzD/MQsdl
	 JxX8HiwEAYdIVIEeF/dVTgzPxAhJzuce8fc4xBd7bVCIpU01CqKMiFUSyLI8qJXJ0d
	 CLua88jRiNS9TcXpN7euNL5a71E27FizT1Si+F1IvzN/GjUNkPLbV+FALMHUF14odE
	 sWzNLdQY65Ce6jQItGj2P2IsHIEJOzmGHi6n2Fa4AbQBTwHmV7tXRzZYbq9lUXePHR
	 n1bcPJ1rw2MpwN2+uxKFrMVvpKFNPIejKjCix4ny61QuSOHCrSy6YR9ipGZNkByvVh
	 j7CaGil82brjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3374A60B89;
	Fri,  4 Sep 2026 20:37:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DFC5A970
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 20:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD88140B8E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 20:37:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3JY-gYjOYdNb for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 20:37:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B702D40B8D
Authentication-Results: smtp4.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::535"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1788554266;
 b=FfT7bn/9gOuO44O7XPZmD73lyOfrtdT5+cDHhnkTMZAxHmJV0lURgcfW/TikPxvlNPC0
 cE3uNQTw8j5ICeN+x7LChPoKly0eKgf5uo1TatQNeByICgQ7OkwBdp+DZlLlXt/vRKzWo
 VzCSrQNMlqDNTJXzm+zKRkZHU9OVaJGgAPkJ2A+Lz2FuGL+88d9xINRaP/xNNe7few/10
 UgzAGByTSV/3JuyE7sV+7YtzzyKwPOoPHODz6oIcPenJJZWERgSbJUgKmYfuXl+vdufBM
 j0XBKL5hSGhwRYVko2QBXVPInHfLECMdvhxzqBbFUGK+EkXrsYXP/4kZIKVVlOGlQkw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788554266;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=0a1L8jyMiALR1IDhC6eL/FJKv+Q10/1hcQTNGzkpUcg=;
 b=fYEmjk+qXBwWJxNbG3yfvJIp4E9/U6Kbzdjsr1irZLglyiDZfh3Sr8KqjeCS9a4iNK7B
 GAUxsXCar/WR+CoyldTeFegnFIaQwo9JHrWUlGm6Shqx5Ma3U9ktTN1A0Bl1dAYeVmcyD
 5JZBbL+Lb7psI90KR6DUkgT6uQGcsbDkokaBAUn8S+KjK3m44yDQxB9yECz1hVU4BWKJV
 hF5mFrtyjICL1PhK+9bw6jd4ZQxVsD8dO5iP7O8TfEuvvaB4DU7BWQYBbF8psMYaLKbNJ
 xmSIuSHHjCmn36unfUyu7avv94PKSUp0S+B3+N2/dmmUDQEvge0ZyV5DI5UmLTHn2nw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org;
 dmarc=none header.from=j-ernberg.se; 
 dkim=pass header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=NtMYw31U; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:20::535"
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=j-ernberg.se
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=NtMYw31U
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B702D40B8D
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 20:37:44 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-ca7c1176317so1233755a12.1
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 13:37:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788554263; cv=none;
 d=google.com; s=arc-20260327;
 b=d7Or+5Y7B1YsNOBpVU0gkPZ5IgB0Qrwy0fYA1ulYTOMtalxEUvNsNDo743kz8UZuZW
 ZxROy93Psh1oMJBkA6lSf5PNE4Tw3DEUInuC3squxUDRrAbK7fIKS17eHfE6J7dN2+5J
 /xjv7l3+LSWDoTj+s5CyBz4q36qbM+gRPFl6Y1baFc4CCjG/n9RESYcGyxdAAMB8P47T
 B9ZdUY9OmKbnh96qE+5oJrTj269r8gZFIJymE8g7b1uNG/HKq7gP0n8LBizfXSDJ+KN4
 OHY8alXdjmWhJSaLG/TB2zsKKoqHBBSloifKbtKyXFipIiFK2mvCm+7bev/n6GZQKzB8
 lgAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=0a1L8jyMiALR1IDhC6eL/FJKv+Q10/1hcQTNGzkpUcg=;
 fh=wfIqN3g79reBEwzhF1UVquW7NrVq12rAr2Dpt7PVsNo=;
 b=XQHeoDy0n+roDU8s5EwtogOgw9VAQ88wNEExpSL9jwtJ+jggQ/7pLlZNPUh7yz28T8
 14AUdCFJJkNIUk+PoLbTFlw6iujt1p4QR8U/fd9UZg6ippPZLG10LKsgMF4MYLFHDIp1
 PQacno/pc6Nw6bH9gcnHx8hTicf0jfxzQ/TtWHy5P5ihbU5/+XiQvYvmo/l5+cw5O9vL
 6zcsuEMp5gs397psVnmlm49arEoTQbaokEIOt67xuts+Z+92xvcD3OfqDHOLhx9OsUWh
 PrpBA26U8DWocIQCxiZR2owC1+2zSmhn762kJ44JE2DHO4gYTLl3YEb3+S0vrqUZjJTq
 KmzQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1788554263; x=1789159063;
 darn=buildroot.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=0a1L8jyMiALR1IDhC6eL/FJKv+Q10/1hcQTNGzkpUcg=;
 b=NtMYw31UnYHvZf30NJrA4qiPrOl3oCRvlEQ9zhX29mQq7xo+DdsLuaO3Ano+FkkJP8
 KlYX2bswsOn92BknB0jPY52+2+WRCAZIYS/EjR/OR1V9zQNrlkaVvwboJTeg2N68W+Lv
 PSziS27D9c0DDSV/bKamDWcSVPaCxR7fFTrctNU9x7wiGsK52cYcH/9r9mGgH7OP3U97
 BdYm/yxEW/ApVY1X94U2QtlIAUyqSOopLuwZeP96egLOuLq17D5JoI/MF5zl+oMCW0zg
 kBS68kc0wmzgMIi4WBM82CVtjRdHYRdoLJEGr9ucONEVFKroa98LpS+FTF5oLKVwqXe/
 5Zzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788554263; x=1789159063;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=0a1L8jyMiALR1IDhC6eL/FJKv+Q10/1hcQTNGzkpUcg=;
 b=WkPYLKYBYd8iejugRoX2qvC+WSaFl2I3ec3scEoG2o9YAlKE2Qe7sMyCpH9KDKE0HW
 DhERHY9SEMAdvFc+tZZDEsSb27xaK9mA77bxdmWxw0OY4vXosVNQ8NRs8xhl3euAUIa8
 +NvCyZmCnPMsentGO7Y27FRHG0ZsIgmpE/Ig1YobFsu31ZBU4s8lwDa3gSFSoAqqS8Ze
 0htQiKMVZcXbWefcRhxJcNGT01S//DvCXdubFzLkfjnuOm6iSeN3UezomnMj9W4TdHoM
 NU+tYfRxrIgsH6lbUm3olAxazYb6FELvT3967aCTv4AyVUOFukdqX/CbvctNtO+p2ZGb
 kDwQ==
X-Gm-Message-State: AFuF++nmDpDPnrsUvRajpn7kWnrM/vOL1JQxvHCniR4RTEfqKdg8opqL
 xfPoO27YkIG72qZSJnVmXDdsu1PnxA97lPLg2V5EDguCDcNq/k9/GZuV5xo7yNi8yVPcQQo5KWB
 0Di75nV3bpApAgMqUw07DFySIkR11CDwaxhy274NVFY26U0wDJnwWFHA=
X-Gm-Gg: AYBFou2uGVDHLf5I68nNC9p+U2qJ831647NndXTqX7rjViY5Pm5yE3ZRAhg6amx6LsT
 s/i1sK7O37r1Y5wu6iXGFIpgZ+8OfUY4R5sr5TBaD3H4vjnjX17SQCBLhzd8uZ3HNwN612SjJBv
 ecczZScOMqBqmc6nCc2o+/i9ZhSeAnAWhqIWBU3opsBasAa5iacKfEXR7K9We0vr1o1MSxUqhNN
 EQGVNqTyamI8b/8dwf7HnCr6YybCXKTntWv3zp/AV28+jGbQRA0sjAxcpC3Y0efVhsUaQRpQSv9
 sqFF0PyMYCG6sn6hQVcn7KSkPXvbJOycqYD4IQO12ohJg0ZYxvD6ZY4ukSnwMUpn0vwE6oohFLZ
 guDBREGmhRGoPojkXH9IBekbfjteI0A==
X-Received: by 2002:a17:90b:50cc:b0:396:65dd:4093 with SMTP id
 98e67ed59e1d1-39b26202ebamr13123279a91.14.1788554263440; Fri, 04 Sep 2026
 13:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <FfB4hHudSTlCrinyaiQWX0uqh2zlb_Fvqiegzc40Se7JoDDmmXXNpHJlJZvW89FZNi2ymPJRnsaHWAv6IJhOnHqfEfRNfPPvso_7mMTOi9Y=@protonmail.com>
In-Reply-To: <FfB4hHudSTlCrinyaiQWX0uqh2zlb_Fvqiegzc40Se7JoDDmmXXNpHJlJZvW89FZNi2ymPJRnsaHWAv6IJhOnHqfEfRNfPPvso_7mMTOi9Y=@protonmail.com>
From: John Ernberg <j@j-ernberg.se>
Date: Fri, 4 Sep 2026 22:37:32 +0200
X-Gm-Features: AcwNN1VozZxWUl2sweprWgxBk7jetYQiBWlTQl4hVJfzgwhiT_MKy1rVIiadJ6Y
Message-ID: <CAAHg4ZiXTMa0+QeA0EpiZQsZ8DHgqPMmg+X46asS9wtFLt1SZA@mail.gmail.com>
To: Benjamin DeCamp <benjamin8532@protonmail.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Subject: Re: [Buildroot] [PATCH 1/1] package/usbip: use kernel source when
 available
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQmVuamFtaW4sCgpPbiBUdWUsIFNlcCAxLCAyMDI2IGF0IDExOjEx4oCvUE0gQmVuamFtaW4g
RGVDYW1wIHZpYSBidWlsZHJvb3QKPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKPgo+
IGFkZGluZyBhIGNvbmRpdGlvbmFsIHRoYXQgZGV0ZWN0cyBpZiBhIGtlcm5lbCBpcyBiZWluZyBi
dWlsdCwgYW5kIGlmIHNvLCB1c2UgdGhhdCBrZXJuZWxzIHVzYmlwIHNvdXJjZXMKPgo+IHdoZW4g
YSBrZXJuZWwgaXMgbm90IGJlaW5nIGJ1aWx0LCB1c2UgYSBwaW5uZWQga2VybmVsIHZlcnNpb24K
CkNhbiB5b3UgZWxhYm9yYXRlIG9uIHdoYXQgdGhpcyBoZWxwcyB3aXRoPwoKPgo+IFNpZ25lZC1v
ZmYtYnk6IEJlbmphbWluIERlQ2FtcCA8YmVuamFtaW44NTMyQHByb3Rvbm1haWwuY29tPgo+IC0t
LQo+ICBwYWNrYWdlL3VzYmlwL3VzYmlwLm1rIHwgMTggKysrKysrKysrKysrKystLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvdXNiaXAvdXNiaXAubWsgYi9wYWNrYWdlL3VzYmlwL3VzYmlwLm1rCj4g
aW5kZXggYjQ0NzVjOGQ4OS4uNGRmZDE2MDYwNSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3VzYmlw
L3VzYmlwLm1rCj4gKysrIGIvcGFja2FnZS91c2JpcC91c2JpcC5tawo+IEBAIC0xNCwxOCArMTQs
MjcgQEAKPiAgIwo+ICAjIHVzYmlwIGlzIG5vdCB2ZXJ5IHRpZWQgdG8gdGhlIGtlcm5lbCwgaW4g
ZmFjdC4gSXQgaXMgcHJldHR5IHN0YWJsZSwgQVBJLXdpc2UsCj4gICMgc28gd2UgY2FuIGp1c3Qg
dXNlIGEgcmVjZW50IGtlcm5lbCB2ZXJzaW9uLgoKQmVjYXVzZSB0aGlzIGNvbW1lbnQgaGVyZSBz
dWdnZXN0cyB0aGF0IHRoaXMgaXMgbm90IG5lY2Vzc2FyeS4KCkJlc3QgcmVnYXJkcyAvLyBKb2hu
IEVybmJlcmcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
