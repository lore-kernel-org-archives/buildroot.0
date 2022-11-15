Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9567CC4332F
	for <buildroot@archiver.kernel.org>; Tue, 15 Nov 2022 23:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3C0D4024A;
	Tue, 15 Nov 2022 23:48:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3C0D4024A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FZetFpmZlufD; Tue, 15 Nov 2022 23:48:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B590541736;
	Tue, 15 Nov 2022 23:48:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B590541736
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8D8451BF421
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 23:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67F6241736
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 23:48:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67F6241736
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q-bk_MDm_F65 for <buildroot@lists.busybox.net>;
 Tue, 15 Nov 2022 23:48:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 646BB41734
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 646BB41734
 for <buildroot@buildroot.org>; Tue, 15 Nov 2022 23:48:07 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id io19so14866674plb.8
 for <buildroot@buildroot.org>; Tue, 15 Nov 2022 15:48:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MulrlUCY1lQgKuhKCGm7VfRXnEMP2ic+r8vDEkMejP0=;
 b=NDAQwQMGLeYFYpbkEgSQktY7eEjCZEjRBNHKNK6n90rlYviSXysVjxt9o/69nFUf6+
 wkK9FNFWSdcOy2xnt3gyAPeVZEImAVqQpsF36mzJCrx2/uTAN7CPyupihurgchL/mG6R
 lpIIa36QBEbMLVEQoXbGk00ZwqrIknb53eJqAWEDm42RT/N0k1vo7rjJuBkKdmtPhHG6
 d1UnsJE8In6u6ALUu9DP2kMP3A/D6/erCsy40GdObj1pDuyqF0OgugAR3gee2AEe4EjY
 2/yrtOxM7WaTuu887P6i6XLLleKTlABBPC5ms0N4pu4A9xXjlnrIsZ6IOHPulsswMW1Y
 +05g==
X-Gm-Message-State: ANoB5pn6aOW21/NAoSmLHt+bI1fElrlq1/4nGmtItiDt3S+f6vTG0iTt
 Kb8C1LE3Byso2HazgW+BAFw=
X-Google-Smtp-Source: AA0mqf7ZNGyHJSTjlz5laUk86z27o1IGIhQQ8Rh4w0SNH9i0PGeN7AzTM2Px2xHHsbXSs3a8OQ+nJA==
X-Received: by 2002:a17:902:7201:b0:186:9c2b:3a39 with SMTP id
 ba1-20020a170902720100b001869c2b3a39mr6390167plb.115.1668556086670; 
 Tue, 15 Nov 2022 15:48:06 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 n13-20020a170902e54d00b0017f73dc1549sm10597735plf.263.2022.11.15.15.48.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 15:48:06 -0800 (PST)
Message-ID: <76b0ac3b-7bd4-f9f5-8191-7c39380dda64@gmail.com>
Date: Tue, 15 Nov 2022 15:48:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org,
 Markus Mayer <markus.mayer@broadcom.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220917211719.251791-1-fontaine.fabrice@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220917211719.251791-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MulrlUCY1lQgKuhKCGm7VfRXnEMP2ic+r8vDEkMejP0=;
 b=KIvcDqof0lSsdp/1KNm0U7Lf14eBIlBnA/ZrZ2jqQTFKcvAl4GqqWhKVrh5a3RmIjF
 JgX5YpVDMIPcXDb/+06HXz1gy6uXtN4hMhrwZrIHvqV5KXUqf9uFByea0OsHRSOzmdxB
 kxZX6hQGe9rGIxRJqDuuLrKe+Ctr6pSO7phiVM5DkCbgJh6VjDFgIh0LuFbVR+yHlFes
 YG16k2+2OFBxkYWjgn7ilmMt7/fXscm84EFY/TpDkka21Wotfqk1mU6YwCKZgDSi6SKZ
 aT0BIX4OhFGYvtAv9lDF9kue9sR873aeR2wG5d1evp0cxHcp7S2TmsyRlyibzDJFDBQc
 67ug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KIvcDqof
Subject: Re: [Buildroot] [PATCH 1/1] package/popt: bump to version 1.19
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

On 9/17/22 14:17, Fabrice Fontaine wrote:
> - Drop patches (already in version) and so autoreconf
> - Update hash of COPYING (license adjusted to use the original, straight
>    MIT variant:
>    https://github.com/rpm-software-management/popt/commit/dcec86df3cfc96d3dd3a3e9f7f1086b768d2d88f)
> 
> https://github.com/rpm-software-management/popt/compare/popt-1.18-release...popt-1.19-release
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

We recently upgraded from buildroot 2022.08 to 2022.11-rc1 which 
contains this change of yours and this causes gptfdisk's sgdisk to not 
be able to open the devices passed as argument, steps to reproduce would 
be as simple as:

# sgdisk -p /dev/sda
Problem opening  for reading! Error is 2.
The specified file does not exist!

Markus looked at the strace output and found the following:

strace -f sgdisk -p /dev/sda
[...]
brk(NULL)                               = 0x5581f4d000
brk(0x5581f6e000)                       = 0x5581f6e000
brk(0x5581f8f000)                       = 0x5581f8f000
openat(AT_FDCWD, "", O_RDONLY)          = -1 ENOENT (No such file or 
directory)
write(2, "Problem opening ", 16Problem opening )        = 16
write(2, " for reading! Error is ", 23 for reading! Error is ) = 23
write(2, "2", 12)                        = 1
write(2, ".\n", 2.
)                      = 2
write(2, "The specified file does not exis"..., 35The specified file 
does not exist!
) = 35
exit_group(2)                           = ?
+++ exited with 2 +++

the openat() system call is passed an empty string which is the reason 
for sgdisk to fail opening the specified device. Reverting libpopt back 
to 1.18 but keeping everything else the same resolves the issue.

Is this is a known problem? Thanks!
-- 
Florian

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
