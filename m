Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D47C04FFE
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 09:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF6614170C;
	Tue, 14 May 2024 09:33:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MEoBcTbOEsHz; Tue, 14 May 2024 09:33:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90D3641707
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90D3641707;
	Tue, 14 May 2024 09:33:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C9F831BF293
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 09:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C313F41707
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 09:33:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5UfYTFmsxiQO for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 09:33:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com;
 envelope-from=gnijieb@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 68C7741700
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68C7741700
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 68C7741700
 for <buildroot@buildroot.org>; Tue, 14 May 2024 09:33:19 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-61be599ab77so2417903a12.1
 for <buildroot@buildroot.org>; Tue, 14 May 2024 02:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715679198; x=1716283998;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eqOcLpU7uQ5l7StcNtZMBcCeJNZNqaGRih1+kS6KpyE=;
 b=CjTI+L3mjsgDJbnpdX0O0Etj6PZVWrHIbBBTtXiKnzkWmv/uaqeZmG+AFIQWCsnhq5
 vSlD+AXutPKblSiPJcS5d6h5matUPUOwCHTMbTBwxZtcCf75PWWoDswgnfNQn1IdOr+m
 34RFqyBrVWbzEC8N+fbmfn6fCgZMOrqC0M6F8g+BbjkpFp7AzweOCICzBATsRoykkUYp
 QER7hQJCTBPXH6GLXIUHty/8kOMnxYitenHjCRp0U/rTCWzQK76RMT0qSf9osGoGOVph
 A4O16KLwXqSSSu91bbOKf4zqZJGSQWVfYOludrJPF42KpF5uFfsay3PXZnKvvztFiXTC
 tIdg==
X-Gm-Message-State: AOJu0YxrAdHw4yVPCBwRn7giSA+X3dDt5wZOOqe+zN1Zrt43DfClgx+f
 2wcwQ35vHkGt0JOYV6+q0rGNXppFfhMkbdOHsQgLhdPC1mPCYk5ZekIWWw6UYAw7zPfrOuLI43P
 LLTRydNa03q4mIimkVfEVdE3CBOk=
X-Google-Smtp-Source: AGHT+IFHnD3tmKDff6z5mzYfkkrxRwIkKM3NMSby6D5tiuD2KjjqJFgHKe+cLKqFKWX0rUjKp2e7p4nljqqUYpyoDmc=
X-Received: by 2002:a17:90a:f30a:b0:2b6:ab87:6c74 with SMTP id
 98e67ed59e1d1-2b6cc7803admr10270584a91.24.1715679198525; Tue, 14 May 2024
 02:33:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240327140125.154985-1-andreas.hilse@gmail.com>
 <20240513231942.2dd93919@windsurf>
In-Reply-To: <20240513231942.2dd93919@windsurf>
Date: Tue, 14 May 2024 11:33:07 +0200
Message-ID: <CANabuZd8jPu9hGAcTFKOcCoC1w_uA3gZAXvfb=CqeUgRy7d+VA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1715679198; x=1716283998; darn=buildroot.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eqOcLpU7uQ5l7StcNtZMBcCeJNZNqaGRih1+kS6KpyE=;
 b=Ti9TE9WdTQP5EOQEiGtXPJ6tKX5dMloMjmLRN9JozX/eSiMjrTvFXe7CD9eUymToNW
 ePXvV3XDlcl6mwiRq+af/eo8pgG2NekGWiIkMei+wLmqBQAs5aQwowtfJeCbF2E3M01R
 iZtNvwD2zeyUrKE2us0Xah54o2hCiv5Ij5BnpMFBSxn796UG2Gt24198s3mpbeDPfQ7I
 NVHc1l2PgLVL9jkvlteV1jqq/MFgWjiAJzFj97mHdod2a8KP5tQFWd8uPnpfwAxKNEb8
 gikK1uGIcdRDsRn95V9U58Ijffv9OjPtdg2QRmKqHMVtFPhB3d01mjgK0VP6jiLhcnjA
 kTAg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ti9TE9Wd
Subject: Re: [Buildroot] [PATCH] linux-pam: add patch for spurious password
 expires in 0 days warning
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
From: Andreas Hilse via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Hilse <andreas.hilse@googlemail.com>
Cc: Andreas Hilse via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

There is already a new version 1.6.1 released by linux-pam that
contains the bugfix. I guess updating directly would be better.
What do you think?

Thanks!
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
