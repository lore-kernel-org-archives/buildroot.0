Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B88C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 18:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1CB981D4F;
	Sun,  5 Nov 2023 18:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1CB981D4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QoEIPm6ty5zD; Sun,  5 Nov 2023 18:31:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3FE981CAD;
	Sun,  5 Nov 2023 18:31:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3FE981CAD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E98CE1BF4D6
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 18:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1CE561013
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 18:31:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1CE561013
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nPqtBWZZGZFi for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 18:31:08 +0000 (UTC)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CAB2061010
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 18:31:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAB2061010
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9d242846194so539700866b.1
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 10:31:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699209066; x=1699813866;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x60GJ8Lsa7lWP7kSRQED1IPXiwowN23gGsxzYgjuiKM=;
 b=C1zsA5Sco9UJmb/uIkp5yXrSw7XhkwcqqcUhY95nM6lAa4myhDJnn8b/OrpQznR7z6
 w8veYXzXroqlEmoD32qj5EFnIxu+MVFp7peWDb8BoFQcObYQQVP5hgzvPVe5L55zJdq5
 0fY8DKu2V5XNohwkGxprWarv5fXiBzk25ZUhiBmJ3/tts3q5HhfSe792IA4vEj+Ev63d
 Iy/o6HefwNWOyxqfzM7oaU+1nvW1N3NlBqehyEjyyZGcoeLbCFVIFNwfFSht1ruRQ2MM
 4tRUTM2j0F4f7F5G4R7ndtFhb5iFhcy/tqT4jbel5dgyH1V2JeD4qtjD5cFtHQ1eEnUS
 kj3Q==
X-Gm-Message-State: AOJu0YzNsYiJiogwpollC46y+C2johRwzXVsQlAn67uwLTFTn+l7afGv
 HIX8caQPXnVChcyHZbihFN0upw==
X-Google-Smtp-Source: AGHT+IFeYvDsXuU7PFZaVnw9bcbfJfgvSLMjsDnPlQXFG5/oB+W2QSkZWJCt5LQf4DWGtEswRmD6kA==
X-Received: by 2002:a17:907:a44:b0:9e0:8782:fb98 with SMTP id
 be4-20020a1709070a4400b009e08782fb98mr405650ejc.32.1699209065845; 
 Sun, 05 Nov 2023 10:31:05 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 jw24-20020a17090776b800b0098e78ff1a87sm3260231ejc.120.2023.11.05.10.31.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Nov 2023 10:31:05 -0800 (PST)
Message-ID: <a73225eb-c2d6-4dbe-844e-145d8c58dce8@mind.be>
Date: Sun, 5 Nov 2023 19:31:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Reza Arbab <arbab@linux.ibm.com>, buildroot@buildroot.org
References: <20231009151729.2223963-1-arbab@linux.ibm.com>
In-Reply-To: <20231009151729.2223963-1-arbab@linux.ibm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699209066; x=1699813866; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x60GJ8Lsa7lWP7kSRQED1IPXiwowN23gGsxzYgjuiKM=;
 b=Krry8eD3QsfTcyqIyJMiKQeUo34NzxQfXYI4RgXvqmR52f6nFuEQMmt2/jsf3OLZ5k
 +b/F0zrPW1/sF+t+lAcWTj/DmA8SS+pdH0F7/Zb3mxS2hV4TrKr8AWntsahUy0zSnwbt
 N+zSsQMlUvaCTN1g63IF+cZx6N0jDqxFMs6f/V3ZN0d8RCDekZKGBDrIZjj6AW1RbvVA
 SucdYPpsQGXvBcP4wQ0aPRskBDO47kxNA1RzQXxTGsAyJTqzWp6UdJDBRM+H4W/zQEKU
 o5w1MoSeL6Hvi2pUXiUYBhy0UNTYDzN7s5A+nCGNGw3dP4ZUb4pfbTKNxE25KoX2euaI
 +wdg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Krry8eD3
Subject: Re: [Buildroot] [PATCH v3 0/8] package/petitboot: misc
 fixes/enhancement
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Laurent Vivier <laurent@vivier.eu>, Joel Stanley <joel@jms.id.au>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/10/2023 17:17, Reza Arbab wrote:
> The br2-external tree used to build OpenPOWER firmware has long carried
> petitboot as a custom package[1]. Now that petitboot has been added to
> buildroot proper, it would be nice to leverage the base package instead.
> 
> To make that transition easier, here is a set of patches which port over
> some of the enhancements made to that external package.
> 
> [1] https://github.com/open-power/op-build/tree/master/openpower/package/petitboot
> ---
> v3:
> * Add a number of small fixes.
> 
> * Add user separation, so the UI runs as non-root.
> 
> * Remove udev rules that enabled some additional types of boot devices.
>    These should more appropriately live outside of buildroot.
> 
> * Remove a sysctl.d file to silence kernel output. I think there's a
>    bug upstream; see https://github.com/open-power/petitboot/pull/103
> 
> v2:
> * Use Laurent's suggested additions to "run pb-console at boot" patch.
> 
> Reza Arbab (8):
>    package/petitboot: fix menu comment
>    package/petitboot: fix pb-discover pidfile creation
>    package/petitboot: use default logfile dir
>    package/petitboot: prefer kexec-lite on powerpc
>    package/petitboot: fix shutdown
>    package/petitboot: run petitboot UI on consoles
>    package/petitboot: enable user separation
>    package/petitboot: prefer UTF-8 support

  Series applied to master, thanks, except for the ones where I wrote that 
they're Changes Requested.

  Regards,
  Arnout

> 
>   package/petitboot/Config.in      | 26 +++++++++++++++------
>   package/petitboot/S15pb-discover | 13 +++++++----
>   package/petitboot/kexec-restart  |  8 +++++++
>   package/petitboot/pb-console     | 39 ++++++++++++++++++++++++++++++++
>   package/petitboot/petitboot.mk   | 38 +++++++++++++++++++++++++++++--
>   package/petitboot/shell_config   | 24 ++++++++++++++++++++
>   package/petitboot/shell_profile  |  5 ++++
>   system/Config.in                 |  2 +-
>   8 files changed, 140 insertions(+), 15 deletions(-)
>   create mode 100755 package/petitboot/kexec-restart
>   create mode 100644 package/petitboot/pb-console
>   create mode 100644 package/petitboot/shell_config
>   create mode 100644 package/petitboot/shell_profile
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
