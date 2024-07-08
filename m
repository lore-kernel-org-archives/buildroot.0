Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353D6C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 17:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05BC5400BA;
	Mon,  8 Jul 2024 17:30:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3oJJP76xOOXh; Mon,  8 Jul 2024 17:30:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF08F40148
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF08F40148;
	Mon,  8 Jul 2024 17:30:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 689631BF23B
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 17:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55686607CF
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 17:30:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cIY3u2bkNPGL for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 17:30:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 28D0660739
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28D0660739
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 28D0660739
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 17:30:36 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-36794da7c96so2597258f8f.0
 for <buildroot@buildroot.org>; Mon, 08 Jul 2024 10:30:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720459835; x=1721064635;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4OL8EPZFbR7jv0m/ILolPG4i89cz3//0Jf/+9Qiknp0=;
 b=kSAjlKhKOMy6u6fUsDLpiu9hyRgYnCZATXzRDolxzmcjhPZESVkruOuBORjOVYZDXf
 pHmztbuNILLWcM/lC81UsYepK+DBiJCcgc4iop/YbRnIDnv3YMXs59mSwypKVH88Oqfx
 GuFLaUXlZSsRvRxWgBm1RoGU1CmTRJJAFDq/i3MfNJxCAdIiwhsqXb4oHN2E2zzebiI1
 kbxEN1RYFEeuitrJsbCenCgLB9CBqio/lWcFS9bbj9AtWo4VFwiF8jP/13AlMikINmDs
 GD4yc6Sgc6ozBUVNolLeu2Ov9PxvOovmyy8mB9hMJppvPmSCs1wIE7AsFV3ySMG2v27G
 JfDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXblHLjSf8U11T7nIFOzvG8voxVGGDMHfag+BkgSGa0UJh/88ub9aqa5gT/ZAioyRhJPOXOyKD7u4aK4cKWIaiBA4YoZS0qdg==
X-Gm-Message-State: AOJu0YxxASo+co1zfuC+brvt6ziU6mV+EgNY/w4nknk5wP6sF3NXNL4O
 p0XkqxofvK7vzR0UEM1YzsadF5wDng4znNvXz89Zuj7tGungyQC3HzEuhG3Zjqw=
X-Google-Smtp-Source: AGHT+IEYW+1W7HreSGK1dTG553y/XSnBdBRCWYw/nV6C941qlYFQtshroNHzc4xVfpac8G9+0OR6hw==
X-Received: by 2002:adf:ae59:0:b0:367:9854:791d with SMTP id
 ffacd0b85a97d-367ceaca9a2mr195720f8f.43.1720459834959; 
 Mon, 08 Jul 2024 10:30:34 -0700 (PDT)
Received: from [192.168.6.174] (213.211.177.222.static.edpnet.net.
 [213.211.177.222]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cdfa0650sm317530f8f.69.2024.07.08.10.30.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 10:30:34 -0700 (PDT)
Message-ID: <1f2b0154-8fd6-4f28-8d22-54382681e7bc@mind.be>
Date: Mon, 8 Jul 2024 19:30:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Harvey <hw234@gmx.de>, Buildroot Mailing List <buildroot@buildroot.org>
References: <21792856-4631-4b18-9dbc-9f161dd9c4a1@gmx.de>
Content-Language: en-GB
In-Reply-To: <21792856-4631-4b18-9dbc-9f161dd9c4a1@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720459835; x=1721064635; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4OL8EPZFbR7jv0m/ILolPG4i89cz3//0Jf/+9Qiknp0=;
 b=gtjKVdglvmAhiLJex4Mzdj1fwyYYnk8QBnZAclBHVKCdzNWW8KAefwNG/KO57kQjOU
 kceblYbVNNcajHr+0skfcTTyp9M5CDES6Z+ZsYvH8O7tniI218I9aCfbT5PI5unDUddX
 LDH7FnfkPDKQgRswocm78642N56yiFs9uoAzMc+xfElqgFjOVappGCwrSfPfn5VWLEp4
 5jdmQOWpRqgzxyMJDVw2WyMmIjdykXvBVdAu8oYNK2dc3Fhjt7SgRdxtexHG8bGAcIFG
 YRk3kZAh2cqJGpmdpo3juqArUlKCFhOLeUr+ithmrdffsfNmY0wWZErn3LyYYNYX6YYK
 TPwA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gtjKVdgl
Subject: Re: [Buildroot] Dropbear trying to write to /var/log/wtmp
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/07/2024 12:38, Harvey via buildroot wrote:
> Hello,
> 
> although in our .config we state
> # BR2_PACKAGE_DROPBEAR_WTMP is not set
> 
> dropbear tries to write to /var/log/wtmp
> 
> resulting in the following syslog entries:
> 
> authpriv.warn dropbear[27939]: wtmpx_write: problem opening
> /var/log/wtmp: No such file or directory
> 
> Is this a bug in dropbear?

  It's a bug in Buildroot. Dropbear has a separate option for wtmp and wtmpx, 
but Buildroot only passes --disable-wtmp, not --disable-wtmpx.

  Please write a patch that adds --disable-wtmpx, test it, and send it to the 
mailing list! [1]

  Regards,
  Arnout

[1] https://buildroot.org/downloads/manual/manual.html#submitting-patches



> 
> Greetings
> Harvey
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
