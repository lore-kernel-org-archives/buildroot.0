Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B703FC5CFCF
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 14:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84CD040F1F;
	Fri, 14 Aug 2026 14:25:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FKqMHLW9rs9v; Fri, 14 Aug 2026 14:25:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B74C440F15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786717504;
	bh=u5w3EWWa9zkLqNotRvlB8ejkn3iMU1gQW+zLhzMTzXw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GrUJDoaxMgl+oI5Wbm1xNZXh4xRa0lL8cAf+Iuufay1PyqMNBgfW01XMTN6dBAGhY
	 bes66fvm1lPzpvVVD8Qjyw9WDu2zm2UMOOo1H/mukOVJUP0H1PmBbmPuZwMUoj4lwC
	 MOgWV5PXkkUJiTcIeDU3C4pw3wH3NWgkns4Ms9IXopkmVOXFSi+4SOHXks+s0D9TgY
	 m1pio78n1+9Vwwk+i0UWI5USnpxn6ULiu0zgAjCJdCduVlNWoQTJsWcFEECH3EGH3v
	 Cx54u/YbnVAmzVOAKDsqcohdiprDrWWSK2A0Au/TzrblymrGL42wuwiz0ah2KFDMgM
	 xz3VZY4CBRMlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B74C440F15;
	Fri, 14 Aug 2026 14:25:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 716253A0
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F4FD400A2
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:25:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id crw6ygOnJPLF for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 14:25:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3D712400A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D712400A4
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3D712400A4
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:25:01 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4954a9e8490so13525275e9.1
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 07:25:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786717500; x=1787322300;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6DD1VQFE0j/qDEZn9wW7NikqZw9lJE9oamNYnzTqRx8=;
 b=k52WsFEte/T44uskLPB5fQYB91Jt6HwYKOmIBq/bNc0Mbd5lDIL6oZhSpHWnV3xgbJ
 fNOWafLb2sZnH7evhQFL+epg5LlHgbWufAlDF4SwsDtJWFPzdPLe9NWZ8fPUlQ8HpxLO
 me79z7HIjRux41V5nPjbouBGaZR3nRYuwrgDGy9mmOsU/KVDdvXzAiDa/JFpo/fKF/L1
 V15dHX1huD67O399L2xLA2BZvKHyta+UsE4m4afVrhnSsrR76IVNPvNBC9HjEGzaB5qD
 +bwPuoWrzO19jdBajYoLiH7YE2dPWbFo3cpNbfWHABRb7ekMnFZAL4zeufqbDSFCkiM3
 ABfQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrzg7VFCThSNrKdZp5l7K9WeU4TqoLK9RTdb62hVd5qkIgQH08oqFYW25a8OJuAUtPnHb7UDYJ7lpw=@buildroot.org
X-Gm-Message-State: AOJu0Ywz3KbpjzrVBiJ4LKIiByN5ZNaDS00hJP/IVoR1jQQNfuYkeYgO
 VFvKiF+bRzXDPawUP7xj3oV1CI7k7068osAsDUSpei1yCX7rS7vdQp4th+TX9NsF1uIF8ZALPAJ
 1nCwmaeU=
X-Gm-Gg: AR+sD119LRvFYtpAJq7QMHxcAEvvMtFEyOUwUJj3DtYnyHRbW2MBOjwa4W4LU1PwB4e
 BFufLq6Nusu86zrqRBKsGwUmN9bzMOIY86ZktI8CjEagxqSDtZet1xANorgNq4fXh9mvHy9SBhw
 8pgTWK6U5HexzmTWSjzdjXDYQTqEAFpxIcXTb+3mHOvFwTJHKdM9JvU9YBYyPeNrimgQBZTLOaQ
 II2XivgghAQ79znzLJMEiFnBXNjXrGrrNfXCXzp4TBRLNSFtF3tQ5BfnXD0EumIIVIGwelLuvq/
 Eqc+aFpjcAw6JQKyfhh9IUJAJAV0I4ABQgOLJJRREcSxHVkDsMWC+3p8ZG8I+4YpP+deiPc1pG+
 usm18eDk4RYUL4kEFNxawEXamo79Txccp/1WRnYWJPDjJN2FSD1sLNf2mHKmtKKQ3cO7EEMmzcm
 KMUc5Kdzzmyf3SN2R0ZYb+VSpWPRPddUVZPeMcMcU3XUd+fp1CwFX6amIpQypTeaAONmmcxL4nQ
 aa+fPnnCpD7+9CPb9xuU+Rqcu9gRBz2gPlSMinJxOyHRNiuSpEawKPlJvo=
X-Received: by 2002:a05:600c:c051:b0:499:84fc:4548 with SMTP id
 5b1f17b1804b1-49987aa632emr57786895e9.5.1786717500122; 
 Fri, 14 Aug 2026 07:25:00 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49989ae1ef2sm29480595e9.9.2026.08.14.07.24.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 07:24:59 -0700 (PDT)
Message-ID: <ed9d842c-3684-43fc-9073-a2071c51e7f7@mind.be>
Date: Fri, 14 Aug 2026 16:24:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Chris Packham <judge.packham@gmail.com>
References: <20260809103605.907605-1-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20260809103605.907605-1-bernd@kuhls.net>
Subject: Re: [Buildroot] [PATCH 1/2] package/syslog-ng: needs libopenssl,
 not libressl
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

On 9/08/26 12:36, Bernd Kuhls wrote:
> Buildroot commit 51ab6d2290f169f4bb96b8dbbab2d8fb4656766d bumped the
> package from version 4.8.3 to 4.11.0. Upstream commit
> https://github.com/syslog-ng/syslog-ng/commit/dbe9fb306929168172062a6bc985eb7e38201dab
> added the usage of OpenSSL BIO_ functions in version 4.9.0 causing
> build errors with LibreSSL:
>
> lib/transport/transport-tls.c: In function 'BIO_s_transport':
> lib/transport/transport-tls.c:125:3: error: implicit declaration of
>   function 'BIO_meth_set_write_ex'; did you mean 'BIO_meth_set_write'?
>   [-Wimplicit-function-declaration]
>    125 |   BIO_meth_set_write_ex(meth, _BIO_transport_write);
>
> lib/transport/transport-tls.c:126:3: error: implicit declaration of
>   function 'BIO_meth_set_read_ex'; did you mean 'BIO_meth_set_read'?
>   [-Wimplicit-function-declaration]
>    126 |   BIO_meth_set_read_ex(meth, _BIO_transport_read);
>
> because LibreSSL does not provide these functions.
>
> Fixes:
> https://autobuild.buildroot.net/results/117/117b3b38098df075d96167863d9f6b933a97eb64/
> https://autobuild.buildroot.net/results/a39/a39ecc88a9342005b75660ee0ac60a1025fa6fc2/
> https://autobuild.buildroot.net/results/6b3/6b3eb910ccdb67827f0c12cea0e3a63c5e6b68af/
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Applied to 2025.02.x and 2026.05.x, thanks !
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
