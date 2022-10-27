Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8053FA3740
	for <buildroot@archiver.kernel.org>; Thu, 27 Oct 2022 20:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 313B84029B;
	Thu, 27 Oct 2022 20:27:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 313B84029B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V9Z-pV7NYrhM; Thu, 27 Oct 2022 20:27:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6067F40141;
	Thu, 27 Oct 2022 20:27:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6067F40141
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 83E101BF343
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 20:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65C9A81428
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 20:27:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65C9A81428
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I4mQDEZMvHyI for <buildroot@lists.busybox.net>;
 Thu, 27 Oct 2022 20:27:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DF2581423
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6DF2581423
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 20:27:29 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id k19so5138917lji.2
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 13:27:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QnIkYz1I4yEOaW2xC08ybqQI5/KIhmSBoUobAzczfmc=;
 b=oT/4OolOzrVWtbyTUN7TLH88wG6Q7a3Nmh9g+lUJHQz7LUGvS7eYXbf0/aW1LrgCYH
 YSC6lITumfz7g5d0ya/DftunqilkyLltQ/wSgptpeOIFQoPdBojv0XKYa+RVRLozy9kI
 n78DDRMbuYcqLWgbEpPtiiLrJS+mWgLLkdw97mb6+1cokriwTaohZ69/pJz1XjOQB/yo
 cKvJkS+Ab6wIeOF7uNY78nfSaPCnpzHCLDNbG3Hi82OC+nbMFOXPrJFjQ0znVx76LwbJ
 Wj1XArf4NQesWR8BR0aAYs58UDKg3uK+GBvCW1Z4TyCEEji5wLz9AIqX/R8ql6PGUfUQ
 GX3Q==
X-Gm-Message-State: ACrzQf1UXvUTVgAwH9y9l81g14SBbZ0ubBKlJJwvfGCOfVCUiymLIhJ9
 Ui1X0QgVmeOlxICMXFjDw9UIwhB6aUKNmA==
X-Google-Smtp-Source: AMsMyM6FF7g/3IQFpJGcP8bFWFM5aGegixApcmo0malg4S7gHXQkL7cqyrnc25lKpO4iYkfryfVWpA==
X-Received: by 2002:a2e:7d14:0:b0:277:2fea:425f with SMTP id
 y20-20020a2e7d14000000b002772fea425fmr1090244ljc.438.1666902447047; 
 Thu, 27 Oct 2022 13:27:27 -0700 (PDT)
Received: from wkz-x13 (h-98-128-229-186.NA.cust.bahnhof.se. [98.128.229.186])
 by smtp.gmail.com with ESMTPSA id
 i19-20020a2ea233000000b0027711348b33sm347903ljm.139.2022.10.27.13.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 13:27:26 -0700 (PDT)
From: Tobias Waldekranz <tobias@waldekranz.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20221027084900.0844e13a@windsurf>
References: <20221020141412.346992-1-tobias@waldekranz.com>
 <20221020141412.346992-5-tobias@waldekranz.com>
 <20221027084900.0844e13a@windsurf>
Date: Thu, 27 Oct 2022 22:27:25 +0200
Message-ID: <871qqt9fma.fsf@waldekranz.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=waldekranz-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=QnIkYz1I4yEOaW2xC08ybqQI5/KIhmSBoUobAzczfmc=;
 b=Lu98xyTFXMPzVR9HHvymP7BGDXP02UKRgHPlO4a+YGQUXsnvV4r9dnAJUhGfQrUAbC
 QlG4D9bg7JuDQVnieMPXBYCs7lQbTHU3XSFCp1c7YL0KgcsG6bIp/tGu5EgokUCiX9b7
 tId50JzGME6b0uAbekl8afR0thIqmGi3lRbS9LB5Zfl0VI2J6HLOrGbzdUXNK4KGLaZm
 SUz50eH6quXLgFII3oY2bFrQ69TNyMz32SfXnXKKdK4fTdoUoR3IhW8J5VkK2mNBJEi5
 /UsggOirYPg+j5Mhv/ie0fxewaXxbEXVjusz92SNqCCKCwQu8RlmJLz+GjRGxcbjDKn+
 L75w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=waldekranz-com.20210112.gappssmtp.com
 header.i=@waldekranz-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=Lu98xyTF
Subject: Re: [Buildroot] [PATCH 4/4] package/kmemd: new package
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On tor, okt 27, 2022 at 08:49, Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:
...
> Applied with those changes, thanks!

Thanks for going the extra mile!

Hopefully the next series won't require as much work from your end.

--
Tobias
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
