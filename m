Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04F5C433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 14:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4147360A94;
	Sat,  1 Jan 2022 14:27:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hWtYaidr2m8p; Sat,  1 Jan 2022 14:27:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90E3C60B4A;
	Sat,  1 Jan 2022 14:27:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2BC561BF59D
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 14:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DF1360B4A
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 14:27:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cAMFq4xbFxaP for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 14:27:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C18660A94
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 14:27:01 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id k27so48749598ljc.4
 for <buildroot@buildroot.org>; Sat, 01 Jan 2022 06:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qr6gLEOxzfAXFZu+IMABnbMepsO/kteoxkWFyBaM53w=;
 b=hFd9SrMX5ocZC6WWci5KMxYgaynVWYJc9nQ78xpLIKNgFWCwneH8l0Q+rbnPEM9c8T
 Eee34em5++Wed62A/xxxxoaM2Tt8UEbcr/Ufs7cPL793CNLN3Uan4iTJONjTEJsnj1cR
 mGOXVwZnO1Z1/tRS9vMqjN2Pyn1XYGTMBvLnHFUyCv9OIvEjZKzjwRdpmk9GvQOA4sjJ
 BOLqzZbrVcCMHrcX4HJ+/67aytOohT2Hv8Oe1ZHvBXX1F6p6IS2vMemFtKDaNXM+njaG
 JzK7PKCQl9uf5NWFn2hc3eJE6aC4uaP+/yxCAJY7u+L9id3PinWHrPTp5ZS2xsWEY0g4
 RDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qr6gLEOxzfAXFZu+IMABnbMepsO/kteoxkWFyBaM53w=;
 b=XqnXzzihrtG2la6NBE9a5AgnmbIJP5xGoYN3gEJjWwmYpoL5vVhoQzAtIZhsZ+Eil/
 DltwRGCjcGLVW7PztmM5hCRtoRAPuJlJK3MxMR6mUQMe6YCdnBsshJJqgVnhNOA0zVjl
 tjs2lFGMXcnWSrfK8iuQvUz6uA7zYJtB9kGfo2BfjqACOoo4c35eTKZ7aY0z/jWbIqce
 iVSxiBGZSFgtNSBYetPNsfhgKNn5Ik2hHpQQqE9seEg1/4PtQmnSSRljKaGbO29vpRIn
 EVbPdDESpbJMLAbuUWkys/r49y9XhuQSdA1/SmshPgSbycdTG0/8ZCdxLFhcmiRw3H0c
 JLDQ==
X-Gm-Message-State: AOAM533UAmXRsgGOWX/nO+u3bQtkIUyDXDPKOeCrBwWOQgboCwEj1RGb
 VguFXurOmRRU39FaSwB/wlCV8NJ7nt3h6Q==
X-Google-Smtp-Source: ABdhPJwGACxjODvIA4cVISzSCE0vygBTyoTCds9c5vPNsKw96e4ZTVIXvH3JUrQUSYc1wUokxDuOuA==
X-Received: by 2002:a2e:b44f:: with SMTP id o15mr29363159ljm.324.1641047219135; 
 Sat, 01 Jan 2022 06:26:59 -0800 (PST)
Received: from [10.0.196.136] ([176.10.248.201])
 by smtp.googlemail.com with ESMTPSA id f27sm2364165lfk.266.2022.01.01.06.26.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Jan 2022 06:26:58 -0800 (PST)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20211223090800.1716321-1-troglobit@gmail.com>
 <20211223090800.1716321-4-troglobit@gmail.com> <20220101141315.GB2777@scaer>
From: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <07d1d003-f2fd-a682-d496-d733c2e974ce@gmail.com>
Date: Sat, 1 Jan 2022 15:26:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220101141315.GB2777@scaer>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH v3 3/3] package/makedevs: coding style and
 whitespace cleanup
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 1/1/22 3:13 PM, Yann E. MORIN wrote:
> Joachim, All,
> On 2021-12-23 10:08 +0100, Joachim Wiberg spake thusly:
>> This program is cobbled up with parts from all over the place, mostly
>> BusyBox, so the style has not been kept consistent.  This patch is a
>> modest attempt to clean it up a bit.  Some changes, e.g., comments are
>> for consistency with the rest of the program.
>>
>>  - The (new) top level .clang-format file has been used as an aid
>>  - Overly long lines have been kept to keep the diff small and any
>>    discussions on max line length in the project to a minimum
>>  - Comment indentation has been kept, again to keep the diff small
> While I appreciate the rasoning, I think that, if we have a code style
> and a linter/reformatter, then we should just mechanically apply it and
> not manually apply parts of the rules.
> Otherwise, it does not help the maintenance/review anymore than the
> current state.
> So, I would be of the opinion that we should just blindly apply
> clang-format and be done with that.

Agreed.

> However, I'm also afraid that there might be different reformatting
> rules based on the clang-format version... Maybe the version we use
> should be documented somewhere?

Possibly, but in that case this would be a problem also in other
projects, e.g. the kernel.  I'd lean more towards syncing with kernel
.clang-format if that should turn out to be a regular problem.

Best regards
 /Joachim
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
