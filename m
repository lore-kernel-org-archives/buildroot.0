Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBD0C021A0
	for <buildroot@archiver.kernel.org>; Sat, 15 Feb 2025 22:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46CAB80FAF;
	Sat, 15 Feb 2025 22:12:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lxqzs3aHNYkO; Sat, 15 Feb 2025 22:12:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 651B6810E2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 651B6810E2;
	Sat, 15 Feb 2025 22:12:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C23D372
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 22:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD9F981FC6
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 22:12:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m2OOF-BHdMKN for <buildroot@buildroot.org>;
 Sat, 15 Feb 2025 22:12:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CBD3880FAF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBD3880FAF
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CBD3880FAF
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 22:12:33 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5dbe706f94fso542914a12.2
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 14:12:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739657552; x=1740262352;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9KmsPYItrCyt+qJvdVQct9XYcsFxOTzwD1u5VTgGTDo=;
 b=UGk2w1yj4P2IphYO1x0dQHKodaw+1wpiRLFG+UWNImx3kCuqypRBmMJ2XYGCTxo/4B
 G1O09B6wN3OfEziydCJp28Xr52uNPPkZfqRsIGjgHQDpglboWYb9ReRNwGl1Ws+E8nQn
 UDesZL6oYDiiNNr3HSz+AjFGZKb3G/ks7JJCYRbWX5cxx6fhyO7VpV9k8BglRdAniui1
 mCnJ0gG2+yLKKIWaAUav6D4Z9JEf00E4hAv8ROaeu6+YIcZBJYXjaF6cYVR6sAqP1O41
 R8Rwyb2QI9AbvVSdTV6npFuZkKqOUwZ7LD8i4f87bTPxJs5s3hUO4pWQ+B405q+phCYW
 JIPg==
X-Gm-Message-State: AOJu0Yydg9v3FAujPMMWTC24aAFyXPG82JkgyStBGL11gSvGDj8Sqd3s
 jgmcb9ThI1c25FW7AXdMvyxEW+y0hPoxcrH3CPYfd6skBxf9u04K
X-Gm-Gg: ASbGncuu2p2cqkhOe+TM01T1N4iE0R3+nT7xc7XXo7RWThcQkLE91kszYCvc48zHljf
 lPs3XUu7CWIBKyCHgs85/TyGWLnI7bS+CeYnZL4f917uTsSMlNiCJpQsvJoQddwrQujB8s5MJmc
 D9fQTQ/V5+rjC3c8V31r96ED0cB80MoZNAhFXvd970U68Irfsm1L5qLQb4hLCowPsjKe+UiRRqp
 1ff/b+uYWuRtd73fC0NCKhFVvOt6+DsDZHjGEqSLm1mWHFLeVh3WE3dTBRzwfU1f57Dmj68hjLp
 Cok=
X-Google-Smtp-Source: AGHT+IG4vUNKBDzoali/hOzI4PdDSG6TJhzzymhkWfhhLgTI6IcnKY8LXtBBfdTRIEdoRs2AxYNfCg==
X-Received: by 2002:a05:6402:280a:b0:5dc:c277:f787 with SMTP id
 4fb4d7f45d1cf-5e036066f45mr1402442a12.4.1739657551346; 
 Sat, 15 Feb 2025 14:12:31 -0800 (PST)
Received: from skbuf ([86.127.124.81]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece287c54sm4999562a12.69.2025.02.15.14.12.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Feb 2025 14:12:29 -0800 (PST)
Date: Sun, 16 Feb 2025 00:12:26 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, Brandon Maier <Brandon.Maier@collins.com>,
 Rabeeh Khoury <rabeeh@solid-run.com>, Josua Mayer <josua@solid-run.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>, Vincent Jardin <vjardin@free.fr>
Message-ID: <20250215221226.ltbblifkvf5wbmal@skbuf>
References: <20241208143802.1048266-1-olteanv@gmail.com>
 <20241208143802.1048266-4-olteanv@gmail.com>
 <20241208143802.1048266-1-olteanv@gmail.com>
 <20241208143802.1048266-4-olteanv@gmail.com>
 <6c30c95e-e76d-45a3-959c-02c9873d5660@smile.fr>
 <6c30c95e-e76d-45a3-959c-02c9873d5660@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6c30c95e-e76d-45a3-959c-02c9873d5660@smile.fr>
 <6c30c95e-e76d-45a3-959c-02c9873d5660@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739657552; x=1740262352; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9KmsPYItrCyt+qJvdVQct9XYcsFxOTzwD1u5VTgGTDo=;
 b=Ni5IzbPYz4rr8gEc3yqDdqqsn8VPxL1WUHjUCsKMHRb8r0/XxUvoUKcdOesyAY/s6k
 uqxwO0Wew1IYjT74jHpR6Vu4eZBcQf+lvTW/k33SvZjAF/xW/fhPJesDZLHnO9hFCNo9
 a+UCvpCu0ZhVCZCfbiXNPWjU7I47/tZ3g1qduuLOQk/Mraak56syBLmAtBiSzLkiwNXu
 6F6M7thY57fy/5vxb7N7J1/sC0Q43cadS1WgF+7ibuLb4KRi19GtYt6abdjqtjVUbRTO
 68BNPq6GsqyovVLUP24Lmdj+0C7G3VSlKVix4BsNgmq6DnacZ1kYJbRwZynqv+0+D4F4
 aRmg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Ni5IzbPY
Subject: Re: [Buildroot] [PATCH v2 03/11] package/qoriq-mc-binary: new
 package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Feb 05, 2025 at 03:45:22PM +0100, Romain Naour wrote:
> There are some style issue reported by check-package:

Thanks for the review, I didn't know about check-package.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
