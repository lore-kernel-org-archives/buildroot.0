Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C44CE87839
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 14:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 619BA6059F;
	Tue,  3 Feb 2026 14:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g1uhjRaqDa3n; Tue,  3 Feb 2026 14:28:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D1D2605AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770128882;
	bh=cA4nFlOtK67UmRJKRdRWmmDCQdbDzWlsfJkRUK1JPcM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=P0Zh6SF1/PFj6thavDOQuInjP2Yn5i/IB3ThaPiwJLyEqXcceCDQG6O9MdGE2o9iN
	 tGJEirMzb0nJefbeAfwxyyB/3rTAVgIWqV7bwRrMWa9+zdjrpRpOc/+g4csPmHYfln
	 h7czCaKgtw27wtTwNQT5Qsp93p5tJ0IF0BNW1ds1FifUFGjt5MPV8CEv8k1dlD2ZZK
	 3gz+x6pvk1P6TGLfvWPZC8nDA4UD3r4579o6XdlUej5UgN+wngzlUDwmLi+zHGhulG
	 KcyiZtQ2Q4neaqxwNIdiv97SBy6Uk0QCdjzjXScsjExV+dZSfY5f3As6JN+oiQwEHb
	 x7jr2m8GEICKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D1D2605AD;
	Tue,  3 Feb 2026 14:28:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DE5B3F5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C87FD406C2
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z7XtisNQqs9C for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 14:28:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E2114406C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2114406C1
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E2114406C1
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:27:59 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47ff94b46afso9073745e9.1
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 06:27:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770128878; x=1770733678;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rrKddTkwzXqsMRTeFRCWHvJ5HM5LL39gjLfH5xzcP7s=;
 b=JPdlIzhKBKxZ0zpZTZimX1rJ1a3L1dYun4u8F31NpXrrFpS9BSAMRg+JHR6RQVm3hq
 yBzVY4NdcjZFaXGGMnhIONVn2OQyGteJlL+4sAtjEhvwqnBRKU/jc/fwzdg5jaB01pYp
 GnqNoAPGb+I2dQCdiGtmN7i4krJT9suca/X3hYUfn5ymvFwh8WRjE2nt2gEmZWoo5pb1
 OPKF3bL/f+s7ZtjkDAlEfJN/BzoE+3E0uTmC71BX5b4W7OlRrJuzvaZPUnFw37YTAb3W
 q29grmqsH4zqcF3vtDdR6DZgj+bFl53oLiwVm7PXr/q+UNo2786fWoVO8NTQIkQ745SC
 e7Kg==
X-Gm-Message-State: AOJu0Yyseq1dXI1bXSpXFmiIKlLR2B15MuYVconHRxJi3mibuMPGyaI6
 z5E6FA3iv4VdlwFvwIVQgsYicaMYCuj5R8P7POBks3IEWT7LuPJdO2qiaVx2FpHLgrRYkPAczgP
 sycqS
X-Gm-Gg: AZuq6aIqYPUC+NLXpwWAowmiy3+R98srexcqvlMUY4SuVpsQnwf0jzsGi8LhEpKVf0Z
 rb2AnFj2y84yyNAuSQzkHFebNpN/3IwdQLJZRUdR+jiY+a83hLJWZnUJaMtfjYF7Aa2SQi3Xspq
 t3A2WrSgDAqGlZ5f2vLoKmKsgKCMKgjoteMaGyRKF5gqoFUw+x1OGOeoogjT7G4lmzeAdF/1Wt+
 GTopZsHFm3GeskJFy5TU0rFgorQLgvZxcKfS1Ba/xwev6pJE06acLgRuwL5uo7b0eaiTqjdnere
 89Mt1DORpZXuFNbgfjiZz8BlxCpjEH5r2uxNe69e391UDBj+LJ6c42XsXsBuhhZZ6HycFx/nPl7
 22DlnlMz7IUBRFJK1J4rsWGky+YxZi8S1B1PLOxzoUU4NRd/LKmisz+CfaSeFxTI7UtGEnTS2M3
 zgdATTj/TGXE9zv1Mwd0PqA+V1CgoPu7h5QTGIIyXvIH49otx8iTclMYz7iCikZMn7CRUEHm3ug
 Kam
X-Received: by 2002:a05:600d:6402:10b0:47a:8383:f2b2 with SMTP id
 5b1f17b1804b1-4830517e9a9mr35688815e9.17.1770128877760; 
 Tue, 03 Feb 2026 06:27:57 -0800 (PST)
Received: from [10.5.90.75]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4830512e0edsm71908475e9.7.2026.02.03.06.27.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 06:27:57 -0800 (PST)
Message-ID: <fbdbfee9-e167-45e4-afb7-a88b896877be@smile.fr>
Date: Tue, 3 Feb 2026 15:27:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
References: <20250808133112.3212687-1-elmehdi.younes@smile.fr>
 <20250808133112.3212687-4-elmehdi.younes@smile.fr>
 <aYH5jtksU7J7Z7sE@windsurf>
Content-Language: en-US
In-Reply-To: <aYH5jtksU7J7Z7sE@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1770128878; x=1770733678; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rrKddTkwzXqsMRTeFRCWHvJ5HM5LL39gjLfH5xzcP7s=;
 b=b2ddL8lEAXCRhTso/mwRecAqWKuDEXrwW/csFtDxvNHefRD8xE2YD65cfnLeOa5+YN
 JEDEHBGtIdOMqCXR0nSkgqQiuS5wA3yt/uHNJ/kkPjXjlb0tKPwexSFg0OICTlVzY+4k
 uuCZFpDegfcIWWxK8EHYMCWuNqOEkoXT+45ns=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=b2ddL8lE
Subject: Re: [Buildroot] [RFC PATCH 3/5] package/rust-bin: install rustfmt
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


On 2/3/26 14:35, Thomas Petazzoni wrote:
> Hello Mehdi,
>
> On Fri, Aug 08, 2025 at 03:31:10PM +0200, El Mehdi YOUNES via buildroot wrote:
>> Rust-for-Linux expects rustfmt to be available; otherwise the kernel
>> emits a "rustfmt not found" warning and the generated bindings are not
>> correct. Provide rustfmt from rust-bin by adding it to the installed
>> components.
>>
>> Note: the dist tarball exposes the component as "rustfmt-preview"
>> (as listed in 'components' file), so we use that name.
>>
>> Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
> Thanks for the patch. Here as well, you not only have to adjust
> package/rust-bin, but also package/rust, so that package/rust also
> installs rustfmt.
>
> Could you have a look into this, and send an updated version?
Thanks, It will be added on the v2
>
> Thanks a lot!
>
> Thomas

Best regards,

El Mehdi

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
