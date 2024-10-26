Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA9ED10BE4
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 04:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13B48605FF;
	Sat, 26 Oct 2024 04:57:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EJ7y0LCoyK66; Sat, 26 Oct 2024 04:57:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FC0B606C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FC0B606C8;
	Sat, 26 Oct 2024 04:57:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BA0B62318
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 04:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A099E81457
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 04:57:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wFhc_WUym4QU for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 04:57:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BF56581496
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF56581496
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF56581496
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 04:57:22 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-71822fabf4fso1553937a34.2
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 21:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729918641; x=1730523441;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a7UgaqRvmPZpa6MyuykkU24I4u37K9PGitSrx8d31JY=;
 b=k2OsbEDFLXTbjfsrszX+gXuu5afRneXjN2TcFni5zFMwYV93L+62WWs05H4LmcvlOf
 UEc4o12b7jfcRH7vcKywAERx2Uv8TSg5nblhySkJhhzqgKMsjhBb6Kh78uxGndU8JE9A
 DF96nhTGvp8wFP+4V5e6qvdWbjAXQbJjr7UNp5/yp40SwhmkTE82q9RjnZQeFcWhIiiY
 KspGXUw/hj0I0ANaWP15XOJ+HaeLwkXPTO+YjOWX0n+/TeeO55D7vtFHzytGbN6m3nz9
 g7+i4Ue33/p3yuafi4PJ5CYENAlH34hyOGPJi+JbA2yXBHw/BPchyWH89TD8Gv9XlfY4
 Y5LQ==
X-Gm-Message-State: AOJu0YxVYHxo1Gd6QL22QCsaIX5I5zSrMGOmSKAsvWSItzKFkKJiRH6u
 y2Y9o+iUR91dPsF4fS6MDuvlHUGLSi5VZPJVhJYwtIFdh9emsMhWvmVxHNucCnkRWxab9h+qTl0
 8
X-Google-Smtp-Source: AGHT+IEoLyd6fx3I6WMaiMDoEWMK5E67isKXel4fJpQ/kYuPVyYdqgjOq9Mu0Ufv/A1IobGLWTuLyQ==
X-Received: by 2002:a05:6830:670b:b0:718:6cc:b5a2 with SMTP id
 46e09a7af769-7186828dd60mr1660305a34.20.1729918641378; 
 Fri, 25 Oct 2024 21:57:21 -0700 (PDT)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com.
 [209.85.161.44]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71861612eb3sm581279a34.26.2024.10.25.21.57.20
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Oct 2024 21:57:21 -0700 (PDT)
Received: by mail-oo1-f44.google.com with SMTP id
 006d021491bc7-5ebc1af9137so1449572eaf.2
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 21:57:20 -0700 (PDT)
X-Received: by 2002:a05:6870:c6a4:b0:277:e08a:23a0 with SMTP id
 586e51a60fabf-29051e209eemr1163366fac.41.1729918640566; Fri, 25 Oct 2024
 21:57:20 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 25 Oct 2024 21:57:09 -0700
X-Gmail-Original-Message-ID: <CA+h8R2rGCbcU0nma=N=fj7g=yfKYZgYKLA3cx271YNQcWq3-bQ@mail.gmail.com>
Message-ID: <CA+h8R2rGCbcU0nma=N=fj7g=yfKYZgYKLA3cx271YNQcWq3-bQ@mail.gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1729918641; x=1730523441; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=a7UgaqRvmPZpa6MyuykkU24I4u37K9PGitSrx8d31JY=;
 b=juBPYLRG/D1spahf8LsyADBSuGmVYm64uduAyJXUZpu/RarMte/3sbCP7Cm1J5oiVJ
 BdMOWhXtRtXYguJMUCx6DJztQzjdX4EQa/VHH5l7vWq7ZKqmX9vuXBvfcKV/bUws0Y5J
 fCKQjYt+77Ci8YsqIrvEDygb0ZEevPhzNr2VgS4TMDjbDmn9tSXdyu4iejSYxrrzRgzX
 BifxXZfnSencHFNDcEeAN3+Mr1aoSzbFkhX1Tk5DA7zB15bSu//3IiTuqcfSwxcZKqfr
 h6C3hXMVYGZydgaJhySRFBz40GDTe67RiAxHuT8cIJ32gxl0GVxlBx76D9L8PqlWhCLw
 TjOw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=juBPYLRG
Subject: [Buildroot] package/go: script to update the go package
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

Here is a script to update Go to the latest:

https://gist.github.com/paralin/41d8e7a26a286276e1e61ad29a1695ac#file-buildroot-update-go-py

This updates go-bin and go-src by reading metadata from golang.org/dl

Best regards,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
