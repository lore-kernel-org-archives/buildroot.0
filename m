Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E77C5AC7C
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 11:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDBA960A50;
	Fri,  7 Aug 2026 11:15:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gD9QOU_r95PA; Fri,  7 Aug 2026 11:15:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 060BF60A3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786101341;
	bh=sgBFVApBqLkFWmKAkC8yt1+vMmaHrxZ13WY3JpHDGsQ=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=MWc5lcANBiKIlN0+BPPOCiNxpCbX1MErhfhdd4YiqdG1QVqnl/kwr9CwUoeRnLADe
	 ztgE8DMlZeB0B3ZB0hEyCt9tauYO82u0pvzhAgeG3WAcBSZ3zxXt7suoGHvYEffLWk
	 KN205wja3PlzY8BzP6elZz+RTkib/lKsEawhiq4zJWVkaDfJRlRqX5HS5sksdTCyPd
	 RDLvG/2+W0z21+Mx1zfE/CoHQZk712/CoG4rrVTicnR8M4jQ3yYfdXTnz1PW3OZmbL
	 JZ7QaKh/8YDBgKQIRT+kfpr2GVfShA7jBR9eTgVw748yy/H9CWgeecyi145LhYhKVF
	 DvifPtSeFL2vQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 060BF60A3C;
	Fri,  7 Aug 2026 11:15:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 740FB10E
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A64340A58
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:15:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7hF0h59c9jHE for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 11:15:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6E67B40A56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E67B40A56
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E67B40A56
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:15:38 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-49800c6a846so26574195e9.3
 for <buildroot@buildroot.org>; Fri, 07 Aug 2026 04:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786101336; x=1786706136;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NWn11Hou26u2aNIx4mu/uZn2ttvnvR2jqAQ0SdP7mmo=;
 b=ek0sUFO9VPK8xiWf4iQWsm7ZsgdhYb5zuDp324hRQjdykbcWgfZnDE2j0E7inQilYZ
 So4T2TUDLNzgaqIYgHW/n5lpLzcYRxo3ST8ALq+f6yb3YkJJnaxIdXcYbG2ZqL5Ons4r
 CQZjxnfU9GsFnRIEgzHTJrFpQPDBQUBziw7D3TfvABRsEb1T9ao34V0+sX7vu6nwE49L
 QZE1gRWuNGlFV3jqtCABwCx9Y+O5/1ADxBq5/9Tqs6wgyeH3rrG/B4PT30JFuqnFC9mv
 4QS2zmKHiN4daYqUOfftpLYuEY9w6tOCL+3G9tn7HO4yWVyAZRbqDnfGWcIDbiHtiBeJ
 cZTw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpJ+S9l9c3dv/UBksWvUjLg8+cuqeDSsS/cY1ND5xjpqDWbBZnBj702kKov9P66/CpOjTdtN1w9AfA=@buildroot.org
X-Gm-Message-State: AOJu0YyOI/X6MpE1nR//xNPZkHFePRs08TyDvqxHe4q1FQrBEbzrfpjl
 F7YHVxBhGoYEevEmOxvB7e0HOAFDYyvIMCnTylNo6yMJ8izjF5Tiu2ctzy75GvhCK1OCuhiIOH+
 5d7+5
X-Gm-Gg: AR+sD10SnNkCmUWMMtCV+1cHgPzyTs9HeZoRTwz7l5BakKLAmfXg2fQDqDUBrYqDcWS
 +OWHq6xbxKrC8B/xMn9R7lg5wpk+oMfZeT7o1guedsM++xtpIXrmnNhOpU9j6sI9QBlcoYnWf12
 GvUSKqKYuHKqgw7SKvgRcx+GiGKwbtRfaGkq47rXRVBZZE0WhZdqVOz7vagcU2XNnHlHO2ws+Ww
 ChnBhPnlHFw8zrLwn3/yQF68r32DWwRm+CBf0nlt7y8s8wOEic87ljZDr7nGSmce0Ie3x7h12Pw
 X1aYfFpoVZfE6jurd/8ScuHofjmAndsgSWlVF875QYZy9gymq1XiCesBZ1z5k3b8B9q3yBprTLZ
 OmvajlAWfCUqfeSl5NKY0e4aIyLTQD7LmXs7dWIpjrY2IJhCCdx7qyn2c58eOVw37UZUOv0emcF
 NqcN26Hr2ZGTPc3bp0K+wh0B21HqAVklz0lHi/gsUDDHtlFdD0ZG+oW5nRHaqh+o8Xj2KPPF9Eo
 7SQ9Iyl9siTmj3mZIaG2mUZ2+iHIGWQ+//k+1Q2DiqC0C4AUCJI2XtveuyKLqMF2yeGmMQ=
X-Received: by 2002:a05:600c:4f82:b0:499:518d:ebd6 with SMTP id
 5b1f17b1804b1-49959e3c714mr104704535e9.17.1786101336466; 
 Fri, 07 Aug 2026 04:15:36 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4995ea27ef0sm34748315e9.9.2026.08.07.04.15.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2026 04:15:36 -0700 (PDT)
Message-ID: <fc6c7bfe-f334-47e0-9236-26e2bdcd3925@mind.be>
Date: Fri, 7 Aug 2026 13:15:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260728173642.3515075-1-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20260728173642.3515075-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786101336; x=1786706136; darn=buildroot.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=NWn11Hou26u2aNIx4mu/uZn2ttvnvR2jqAQ0SdP7mmo=;
 b=hlE8o34lP+cKWwsT+MvCEeP/O7bBXvpMQEGoQJwh/cue/34NcYmkIYvNXKpKQoUkil
 rSSAjcO9KXqUUzYM3XTHXJXvIUftiNteZ8kVEdFireYuoXvDcdEesd6o6isbZ17Wf6uz
 7vY4PJegnyslO5jnYxKWLtgkMPlWOiIGN/vrqShx0sNVlEc53f4qhweJAQz5HniKFSrm
 9OdtePMj9ZqwOcACDDpwloPLBj94TIYLBKhEyp/BXYEmgvU5BFd7Kr9SAU5Iln59jINL
 tIpHt+cKp1whW7lRCVWHNFpbMtv5+r4U9v4eSc+KxMWG/0QSt593/CMikeZjRayMn226
 SccQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=hlE8o34l
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: security bump version
 to 4.24.5
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 28/07/26 19:36, Bernd Kuhls wrote:
> https://www.samba.org/samba/history/samba-4.24.5.html
>
> This is a security release in order to address the following defects:
>
> o CVE-2026-6949:
>    TSIG packet with name compression can crash DNS
>
>     Incorrect size calculations when a TSIG record contains
>     compressed names can lead to a large out-of-bounds write
>     causing the server to crash.
>
>     https://www.samba.org/samba/security/CVE-2026-6949.html
>
> o CVE-2026-58216:
>    An authenticated user could possibly crash a KDC process
>
>     A kpasswd packet that contains malformed ASN.1 might cause
>     the server to access 6 bytes of unallocated memory. This
>     memory is not exposed to the user, but in some
>     circumstances the server could crash.
>
>     https://www.samba.org/samba/security/CVE-2026-58216.html
>
> o CVE-2026-58218:
>    DNS signing DoS via TKEY name cache exhaustion
>
>     An unauthenticated user can repeatedly register names TKEY
>     names, which floods a cache causing legitimate TKEYs to be
>     expunged. This can practically block the use DNS TSIG
>     signing.
>
>     https://www.samba.org/samba/security/CVE-2026-58218.html
>
> o CVE-2026-58221:
>    Samba AD authenticated LDAP access domain takeover
>
>     Samba AD low-privilege authenticated LDAP access allows
>     modifications to internal LDB special DNs, which permits a
>     domain takeover.
>
>     https://www.samba.org/samba/security/CVE-2026-58221.html
>
> o CVE-2026-58222:
>    Samba AD LDAP Compare filter injection and trusted-request
>     confusion disclose protected attributes
>
>     An ordinary authenticated domain user can bypass access
>     checks and query confidential Active Directory attributes
>     (such as KDS root keys) via LDAP Compare requests. Due to a
>     filter injection flaw and trusted execution context, the
>     LDAP Compare operation can be turned into a
>     protected-attribute disclosure oracle.
>
>     https://www.samba.org/samba/security/CVE-2026-58222.html
>
> o CVE-2026-58224:
>    The CTDB protocol has bounds checking issues
>
>     CTDB fails to do integrity checking of received packets.
>     This includes failure to check field lengths against packet
>     lengths when unmarshalling packets.
>
>     https://www.samba.org/samba/security/CVE-2026-58224.html
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.05.x, thanks

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
