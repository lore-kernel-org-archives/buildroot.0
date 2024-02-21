Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED9EC48BC4
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 03:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94CE1402F6;
	Wed, 21 Feb 2024 03:05:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mIpN879OTaIx; Wed, 21 Feb 2024 03:05:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6494F403C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6494F403C7;
	Wed, 21 Feb 2024 03:05:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 154CB1BF3BA
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 03:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F53481E85
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 03:05:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tRq05IJ6gi0i for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 03:05:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=dave.mehler@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2637C81E6F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2637C81E6F
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2637C81E6F
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 03:05:36 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-7baa8da5692so333859439f.0
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 19:05:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708484735; x=1709089535;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9mlMOFpIeo+iwWbuFYzj8v4/rnlDTNeqQ/UpX5LK44Q=;
 b=l6eYQU492VNCwtd0MSXG7nVkMZUscXcPn0IH+BqM9Whmr67ixm5IwXIk85fFWRTWOd
 d2fd8QR+PuveFI+8zVw6Eb5auoQNT2hxyzq0Dn0WJDeavlkGVAFTEiJIkv8ta8MvkTIi
 4+LHnecyckUvlY5Ir9S+/8Zj4/6s6hFd5G0VpeRgZ2i+CroP7lvdcg554dz5YBXG4IHV
 lQXVdgZjdvjpNrint5q7pGdmO38Gn/NmPVFAJUtpGtpD28zrRPi5hginGD3+fQ/lGOwX
 shsS5kdhCIWOikiR1h2mO8nsMIxiKEQooDFG/+TYbIfCEELSSYTaq3s8dDVrVWufhHoS
 umwQ==
X-Gm-Message-State: AOJu0YzOLLL3c1BsyW8RDD5UiqIJW+rT6L2Ak+xo3NM+K80OmZr8Z3ib
 InAo56aepTkrBk71+64n0sWFoT9e/40dUzSD3driO4Njbkybf44QG2G0JnvbHWaf6XG0dgBXV8C
 ZlAWbfYy8G7Y99e5Y3ltsyBz2CRx2ez4EZ9w=
X-Google-Smtp-Source: AGHT+IFWBlS5H2n47sF92JLFAUAz6KN/QUKHFmOeYHTxNwJQuhYrlLQnQAi0XVJ82xXJSyZWYMiLjEmtqynBEj8aMiY=
X-Received: by 2002:a5e:980b:0:b0:7c7:4135:8198 with SMTP id
 s11-20020a5e980b000000b007c741358198mr10728505ioj.18.1708484735332; Tue, 20
 Feb 2024 19:05:35 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a02:ab98:0:b0:474:333e:ece4 with HTTP; Tue, 20 Feb 2024
 19:05:34 -0800 (PST)
From: David Mehler <dave.mehler@gmail.com>
Date: Tue, 20 Feb 2024 22:05:34 -0500
Message-ID: <CAPORhP6RZ-rOz=37yRd6nTDjpqZopjh6YqKdrZm3UxQB8cGOzw@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708484735; x=1709089535; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=9mlMOFpIeo+iwWbuFYzj8v4/rnlDTNeqQ/UpX5LK44Q=;
 b=lbtzLaLUlJjHh4qTFzzDpngMpzYfgfnOLFYTaGcDJ1H27fTCKQWdL13WVo0qO9FbDD
 BNRPSB9E9E5Ckc1b51sTejSNaNeNZHLnjOUEjoIhCvW6z1tBhLJ64Yo47uU385VWNRe7
 A92KHHqT1ZGB0/+MFGdGxz3ZARX/Z3Z24hZVhi5OqlhIaNsrKnyT8ljwaW8oZvceGfXI
 mK9iawXWKMf9rkTs8omRsihRlfvjIYF7BaY66s3iZL+gQB1uAf6VZCDn88DpV6pxdoYL
 lYMBHIxJIyGtLJw1h8+dkLm43VR71GbYUjbiATwYvRAibqM5BeGtVf4wNXoZywoBMycu
 QyPA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lbtzLaLU
Subject: [Buildroot] iwd, buildroot, sets Wi-Fi to AutoConnect disabled
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

I've created a file /var/lib/iwd/NetworkName.psk but it's AutoConnect
status keeps getting set to false, I manually edit the file on the
built-host and it reverts to a false setting, and a wireless
connection is not made.

Any ideas?
Thanks.
Dave.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
