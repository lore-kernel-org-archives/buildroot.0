Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A31C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 21:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60AF360690;
	Wed,  5 Feb 2025 21:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CkudxlASonGp; Wed,  5 Feb 2025 21:54:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54B54606CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54B54606CE;
	Wed,  5 Feb 2025 21:54:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 96F96E1
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 21:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 869424122C
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 21:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N-wUXkwy2X1d for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 21:54:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 53CC5404C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53CC5404C1
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 53CC5404C1
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 21:54:05 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-436a03197b2so1466655e9.2
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 13:54:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738792444; x=1739397244;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zT2k322/U7753oNU/Ud8vZTn9eKdEL6qXslQ/BqHqms=;
 b=iPdqT3np7K4Ig83pILtAcB534X+TVb7UeblYNaLPDFbBe9rKJy+JE95PmWatd7aY0L
 ogYlJYVwDFkUZuwdIqjj2p04PBSrr0h/6r9n5/NFgZoGTNDg1Ht03NhJ/c3OQpoktxTm
 zrGWFpf+UWWmtd1MrNSJvmqdeyLI/tjVhLsfGul2/RaaO7VUee5txpOA3GJt+5mJIygn
 2fIIJPY2Fuvs5ojwLjMb1CE57FBxYlI/6ykouIcyXcy5bm4XAZ7gawe97lALJgYAFiD+
 zi4ydGlcwrf2DeqfnXRgqBTW3yHyM1POAVKjQT9gSBz7g4WK3V8eLJjrDjYFgrKVuzgv
 5M2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCULwbt98xcH3SmsJ2OW5gGiuuLzGTrRjCxAV3DJ5WyGIDiuVE5lmOPpP1ctU1T135k4BpxWb2X3M=@buildroot.org
X-Gm-Message-State: AOJu0YxNgjOnZd+b4xzu9L1VPPlrH26vomOq4ocrWNIxFhr4E4uCb8gL
 4R82mw2r9NB9zc3/iapZkOsv4g/F9ZtW50pZCjCu3H6tuT74MMhQt+V6pcwK7C8=
X-Gm-Gg: ASbGncvbyiQW5umC217P2shnB04roi12naaYGg3kGlI6STag4OApVxiiXFkhpwho31r
 rf8WOuLAO7gV5D5HyHY22q9MjYBRIhNZvxfsAscnOF8bCVAV6Z0x8QfiBU4KDDnD8/3OQFtb7qM
 x7stNOYUWfkD84I/gg1t5vpSWpbXMCjAwVNt43eXM3bDjAW93KJ2QBQjHnOojmzwFs6quLlDEsF
 bYWuHm1hHr8Dj2Ze/7OZe7nORmRvVg+MRIbWeOEIBnH4qEnoryzrunQfDrAt7UC99HLUFOKfaUy
 IMquQoj3X+nmwXl/WN6ndCSGFo4JUPgljVnKLcI/Oc5CdmQohIyMlhqEoX5pcgZw9X7KR/NGOR+
 2R84TGIX14Y95kXwLumlN7haZJBaWh3+NGysg5FBAG6EvyA==
X-Google-Smtp-Source: AGHT+IGP0lDy/k+B++OuiB4A7/ylMUHbwG9hQwUvAFRepXBp5KCrmyDzp47hdjIdp3zJTN3Z1gGVuA==
X-Received: by 2002:a5d:64e5:0:b0:385:f062:c2df with SMTP id
 ffacd0b85a97d-38db4886ad0mr3310291f8f.11.1738792442980; 
 Wed, 05 Feb 2025 13:54:02 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1cf53asm19497881f8f.87.2025.02.05.13.54.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 13:54:02 -0800 (PST)
Message-ID: <664652f9-b64b-4e56-ab9e-a65f42b08b5e@mind.be>
Date: Wed, 5 Feb 2025 22:53:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christian Stewart <christian@aperture.us>,
 James Hilliard <james.hilliard1@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart via buildroot <buildroot@buildroot.org>,
 Anisse Astier <anisse@astier.eu>
References: <20240805163133.4126564-1-james.hilliard1@gmail.com>
 <CA+h8R2oQGKFFH-vMX27WUO1uEAGyt4cz9MCwn9Cofwyujx1xDA@mail.gmail.com>
 <20240805223152.09ed915b@windsurf>
 <CADvTj4o_CnzCth+QqoxhVovBRinvYfbMf7r+SWnnY0tfVbKgbw@mail.gmail.com>
 <CA+h8R2obsR-CzMhWDpQ-A0oeEPaG-P=aCwF7BS4J-3eShmHJgg@mail.gmail.com>
 <20240806165050.234235b4@windsurf>
 <CADvTj4pOK8-2YXy0POUg1qOKa1MrjsxbnS-r1F7YMk_YXFmEAQ@mail.gmail.com>
 <CA+h8R2reErtSWPO1hGpX7tT5Xejb_SNqiuSCnXvJZKHwhzdcZg@mail.gmail.com>
 <CA+h8R2oJWZw_S08XXhjE--_So0UJohVLWSoj30PpR9z66x8U1A@mail.gmail.com>
 <CADvTj4r5ZAFkyqMctj4fV=vnkqDn2g+oG3g2PjTHJKSkVLQNVQ@mail.gmail.com>
 <edd5e025-798f-4e5b-9d31-baed883a65bf@mind.be>
 <CADvTj4rQsmOq_+AcZU8yQNfod_=kyKtO3HP+F4VZ_PMuYXmd6w@mail.gmail.com>
 <CA+h8R2oU_CHcTw6aCdyTXGH9F-eEd+nxwzjfcZPhb99ZJvHe0Q@mail.gmail.com>
 <CADvTj4onhc2rTzFa7F5bDFXSNQJ2CKuyU-TD-fwhpQUXNHZTcw@mail.gmail.com>
 <CA+h8R2ofCEUxWBVU5S9_vx5YtsE-Mjq95WL6DzTM5YF38A-izA@mail.gmail.com>
Content-Language: en-GB
In-Reply-To: <CA+h8R2ofCEUxWBVU5S9_vx5YtsE-Mjq95WL6DzTM5YF38A-izA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738792444; x=1739397244; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zT2k322/U7753oNU/Ud8vZTn9eKdEL6qXslQ/BqHqms=;
 b=fv4FfgWTtEHx52196E759saZOKyJby+EH9WLbgOlk5mEdBbOtK1LXkTn7n42FeW32l
 Yd6pXXPSbHnd7WzX9BzS0H4kf6bSh1ukBGCaRkyuH9v0bagSFjZM48VQ3nPv2owLv0yO
 Wa/a60cpLr+5/qA5mJOR+X0TvRpfoJy7YAfyhzeE3gcq69xD+8s3LVUUeNMOtcqNrSI7
 5fianUedpCBUhvnHQgxeyXMo5v04dQPXBx+rcbKxg4KJ1bfBZN7nCjc6NvUkZp/sMa9i
 oF7R1ta1ZvXdKlRgBDc6PtSv/b2xamU5nibySSf5KgWOCxBkl8X5OD/IdkQ+JpdlAUEQ
 kLMg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fv4FfgWT
Subject: Re: [Buildroot] [PATCH v4 1/2] package/pkg-golang.mk: allow
 packages to override download GOPROXY
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Christian,

  Thank you for summarizing the upsides and downsides of GOPROXY=direct!

  I have a few additions though.

On 05/02/2025 22:22, Christian Stewart wrote:
[snip]
> Upsides:
> 
> - No dependency on a third-party proxy service
> - Ability to build with GOPROXY=direct for those that require it
> (otherwise Buildroot breaks for them on default)

  Do we actually have examples of packages that break with the default proxy?

> - If go.mod says "foo/bar at version v1.0.0" then we can be sure the
> Git tag v1.0.0 matches the go.sum.

  Additional upside:

- No risk of failures due to GOPROXY setting in user's environment.

  And final upside (but I don't think it's really relevant for Buildroot):

- We detect issues with upstream go.mod.


> Downsides:
> 
> - Slower fetch (git pull instead of proxy.golang.org)
> - We need to mirror packages if their dependencies go away (most are
> on GitHub, though)

  It's not actually that simple though. It should rather be:

- If any upstream disappears, they will need to fall back on sources.buildroot.net.
- If an upstream is already gone when a package is submitted, we need to do 
pre-vendoring patching to fix it, and we don't currently have infrastructure for 
pre-vendoring patching.
- There is a (small?) chance that it's impossible to find back an upstream that 
corresponds to (is identical to) the original version that disappeared.


  I'm still on the fence on what the best approach is... What I do think based 
on the discussion is that we should use the same GOPROXY for everything - there 
really should be no reason to do it differently for different packages.

  Right now, I'm actually leaning towards removing the GOPROXY=direct - but then 
we should still set it explicitly. We should probably even allow the proxy to be 
configured. We should definitely not rely on whatever the user set in their 
environment.

  The problem with doing it the right way (i.e. keeping GOPROXY=direct) is that 
it adds a lot of work for us:
- when adding a package that has a broken go.mod, we have to fix it;
- we currently can't even fix it until the fix is merged upstream because we 
don't have the pre-vendoring patchng infrastructure.

  A lot will depend on how often and why packages break with the default GOPROXY.


  Regards,
  Arnout


> When requesting that upstream projects fix the build with
> GOPROXY=direct it helps to mention why in the PR description.


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
