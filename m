Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58ADC5B572
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 12:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA43A80F81;
	Sat, 22 Aug 2026 12:42:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gvKSlASkevEL; Sat, 22 Aug 2026 12:42:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787402540;
	bh=qYydytMowrwhZ99ZHuvhZ95lfcsN8clQdS0iDQ8oDmQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=r8izwM8I6FxEEfyraU+oYuIfMDopswyiw2inftl89knjP1PG8/35pKcBTB00UTWsg
	 SWYKsAr4Pk6DjLdAi1tSpwLMAkuHO+9hd2XuSMGqU0ZfoUSx/htGyett51FdGq1Ky5
	 Gqb9FheamF+bQbUGnLHrrY34xNW9EYDxE4Pe7LjImwKUeGZ9PNXMFWnuB4EyzXdgVI
	 U4MnB+GgKHWTdo2uXTtGklLNG7Vz1z0OFweWIM3sgc0dVCjYCy5p3aIQxaIhuLLmIn
	 hRr8qoNjt3alztQVrL62Ew2RWF82NPkuR9zHIJfdMz7gJ0SODlBotFE4PyQgkHVsIe
	 xA0leKaIHvW0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8303180EFC;
	Sat, 22 Aug 2026 12:42:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 863362B2
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CADD80EFC
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:42:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A2hRWMLubulG for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 12:42:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BE4A80ED7
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:42:17 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-6a41191c9a9so3949887a12.3
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 05:42:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787402536; x=1788007336;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vxFUhGqCEHmZBVVeiAQvGTfEqrWxFEJMb8Q6xOOek7A=;
 b=DXrD/I0szLtT+S/DHt/bafQksJH437GZpv0Vh6c5+yWsLbmS3RpOeFzeYVbwcQ17V0
 /MbVPRUR2VvR56WHKgT6rgYqBv1Tbx7aa/I1ZFk7Yh2hTrGB8BPrvpjtA+eIgT4VFjdB
 ftNpidYaviY6U+v/DbWL2suLx02cGzh098FRB2cBV21LLSLM0AdBwP3YKMuDj+2GtKwG
 rQzthjTkO8zSUbDZozNSy4rt25dz+BHYwWBeJvOhoWZ9f3QqokmKhux0xsSxvzdb4pGP
 nTA1PnvfTFmADdFJDc8yjRnhvA05Xcq4VCMwDHBlaP1MpnfyXSWUDYB5JeBa3fKcVLWH
 TO1A==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp9Azezu7UY0kLepPojrvme17ht8E/ivPkLxJWHSwMgP8iKOnAI/DhnBjzApkRPwBR17X6VBpvco/k=@buildroot.org
X-Gm-Message-State: AFuF++nWf/IKZosdG06SEtlV+7uK8PAf4/62jIHKqmNI6w0YVfZ/ghMi
 riHHrtvxeIe+jcPVf2Q4pGWZDFcMmVzX7rH05K2bJtGQRPgL4hXoxAWbVu92vALesyAZxU56YLk
 2sU/MBuY=
X-Gm-Gg: AR+sD11h+RWEuymbipAYWV6voNQC/e0LTwlYo22ZKbXdDWTpkE86gmv65iiAPFfQf3E
 PkAuOBCtzg9o8LaPI3MrA1Mk/CFbdtUn1wbaHsrxTARSJwGxXMSA4lDnCmo7MT6/PbePhzRcZYs
 pDDCqcSqHqt1Ldtjox+GOKxrOWEBXwN8ArXa4Ofiq39xE++xF2R4japCrqEyosFZqqlxEnY+6Zm
 bCrEIaTjnqOAXwivw6sdERQZZbx6MHxrmpKp7w3VBqPMXbk3Fid0bZ5pojWJec/xmgS5WZJMaqA
 zRWoT20G5EwMr6fr9RMZzPbuztUItislIWbjr3W9yaZEuLa1DuCWhDsHWMlwAlaDQycVq5MsVK5
 VhUdMPlC1nFik6DlupcEIpCNCSFTII6F9Hc3cUhtXaBPptBJhY7NqbbKo6i6pfw++Yto65vneYv
 UOw5JvUktpIsJ2mFU6eRut3Bf+S9ebzzlt2BvwuCdNpc8M3gJkGx5nmiynt94Q/hZJ4bV1yjs5h
 8ZUnWObd7/4m/o6cyYvLP3qvUu4BplufK2+ix/KzF33rG09
X-Received: by 2002:a05:6402:428e:b0:6a1:fd14:8835 with SMTP id
 4fb4d7f45d1cf-6a42eea5ed7mr10061880a12.0.1787402535768; 
 Sat, 22 Aug 2026 05:42:15 -0700 (PDT)
Received: from [192.168.129.33] (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a3ff156811sm11389978a12.19.2026.08.22.05.42.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Aug 2026 05:42:15 -0700 (PDT)
Message-ID: <30f0c2f5-6b70-41b1-a394-4030364b6211@mind.be>
Date: Sat, 22 Aug 2026 14:42:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>
References: <20260816203207.3980846-1-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20260816203207.3980846-1-bernd@kuhls.net>
Subject: Re: [Buildroot] [PATCH 1/5] package/containerd: security bump
 version to 2.0.11
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

On 16/08/26 22:32, Bernd Kuhls wrote:
> https://github.com/containerd/containerd/releases/tag/v2.0.11
>
> https://github.com/containerd/containerd/releases/tag/v2.0.10
> Fixes CVE-2026-47262 & CVE-2026-53488.
>
> https://github.com/containerd/containerd/releases/tag/v2.0.9
> Fixes CVE-2026-46680.
>
> https://github.com/containerd/containerd/releases/tag/v2.0.8
> Fixes CVE-2026-35469.
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2026.05.x, thanks !

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
