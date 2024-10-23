Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F21CFA474
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 21:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A4CE40149;
	Wed, 23 Oct 2024 21:00:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LmhOFeNWOvrB; Wed, 23 Oct 2024 21:00:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56DD440157
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56DD440157;
	Wed, 23 Oct 2024 21:00:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 04956972
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E63EC60841
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:00:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lEuL5J1eyOYt for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 21:00:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B220C60623
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B220C60623
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B220C60623
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:00:05 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c9850ae22eso254464a12.3
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 14:00:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729717203; x=1730322003;
 h=date:message-id:subject:mime-version:references:to:auto-submitted
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D2B8x0gWyuOkOEkkZ7vC5LF6t8Z8j0HaOqL6QqH8ks0=;
 b=h7zFrGsQqczgAMj6tQfnPVSw3jTmWz2+BbWSKvQ8xmEFBCpwKFHStIC4btDhENHRhS
 j1K2BJ89tY/xRtY02xNa0JSlFz3I68rBPX7GRSPNQK1KWwTXXQ5n0nkalPzGJPx7nh+u
 7ZoekUFs45xwPbuwHPBQ/mif8RD5cTS9/UAy+LvQxZTbF8llopHXLTugjFdEiW0MDu3h
 Ymn+aLUscneArAx7GbtanaGcjZBAQUP0hHI75iUqchlnsOLJ17ro12LfXBfUyQoalBzN
 dZqhUHtWmdwexpFqPJAE6v9ST4LSzti4GbDjosMwkCejiGCn7u5OmoU5VC5N3wqMqMb5
 hFxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/YC77oguYc/EJSMwikhXhWyg+o9t/bY8QUL7CrChKnfdmf+xQE5XutiUENue1oWopRkYgoc8Wc4o=@buildroot.org
X-Gm-Message-State: AOJu0Yz5yoH9uKXFo85H7ZMi/U/tCrFQDNh9ec9PvCH2IIJ0QIpS2CSQ
 wmFY87HfQ4BYxi754JSXSy9+PC0UXr2Hw0erG/klnVxFKrzDMy3wSia7vQ==
X-Google-Smtp-Source: AGHT+IFgB7NBNMPDHZ0c/AlXWXvWmtnEL6E6L8z3vi/pbdVFU9O79SMcsGPrIijunN+2wwX4JkGGgQ==
X-Received: by 2002:a05:6402:84e:b0:5c8:8416:cda7 with SMTP id
 4fb4d7f45d1cf-5cb8ace98e5mr2624597a12.15.1729717203190; 
 Wed, 23 Oct 2024 14:00:03 -0700 (PDT)
Received: from buildroot ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cb66c6b1d8sm4865553a12.72.2024.10.23.14.00.02
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 14:00:02 -0700 (PDT)
From: Mail Delivery System <buildroot.notifications@gmail.com>
X-Google-Original-From: Mail Delivery System <Mailer-Daemon@buildroot.org>
Received: from Debian-exim by buildroot with local (Exim 4.96)
 id 1t3iSY-002u5r-1m for buildroot@buildroot;
 Wed, 23 Oct 2024 23:00:02 +0200
X-Failed-Recipients: buildroot-association@buildroot.org
Auto-Submitted: auto-replied
To: buildroot@buildroot
References: <E1t3iSY-002u5n-1h@buildroot>
MIME-Version: 1.0
Message-Id: <E1t3iSY-002u5r-1m@buildroot>
Date: Wed, 23 Oct 2024 23:00:02 +0200
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729717203; x=1730322003; darn=buildroot.org;
 h=date:message-id:subject:mime-version:references:to:auto-submitted
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=D2B8x0gWyuOkOEkkZ7vC5LF6t8Z8j0HaOqL6QqH8ks0=;
 b=BksU+cB47fw7rlInVxibPfS+IB7+ryMmCcP2a55LQfFJbqfycbZVcz7gjSDPmtH1fa
 yfpfTtlZLScyizRBQkjY9nlmovBBTCDEm5nZubP0hKSq4pS/xnFoxndKnZzWpL6Ogsy5
 YNuQPYUhZAPLTQLKxlbfF4q5IxLgsrzgMzpbo2sxuzYniUyYLzMhUrFSGtBAfO2Hfxqr
 LVcz/FsN1h91Ca9PLvXwt18ltfkbsB83k2BFNvW+Z3KQz7V1Vbd2LwLmvKm8hnuK7kmE
 J/VLEiGYvxUmvv8WZrvCkN08aIAHME96id5OZVnjDfPnVwmm4VpQTbXdOO57fmvmYX/2
 UJdw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BksU+cB4
Subject: [Buildroot] Mail delivery failed: returning message to sender
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
Content-Type: multipart/mixed; boundary="===============6103779445941870118=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6103779445941870118==
Content-Type: multipart/report; report-type=delivery-status; boundary=1729717202-eximdsn-1726555086

--1729717202-eximdsn-1726555086
Content-type: text/plain; charset=us-ascii

This message was created automatically by mail delivery software.

A message that you sent could not be delivered to one or more of its
recipients. This is a permanent error. The following address(es) failed:

  buildroot-association@buildroot.org
    message has lines too long for transport

--1729717202-eximdsn-1726555086
Content-type: message/delivery-status

Reporting-MTA: dns; buildroot

Action: failed
Final-Recipient: rfc822;buildroot-association@buildroot.org
Status: 5.0.0

--1729717202-eximdsn-1726555086
Content-type: text/rfc822-headers

Return-path: <buildroot@buildroot>
Received: from buildroot by buildroot with local (Exim 4.96)
	(envelope-from <buildroot@buildroot>)
	id 1t3iSY-002u5n-1h
	for buildroot-association@buildroot.org;
	Wed, 23 Oct 2024 23:00:02 +0200
From: root@buildroot (Cron Daemon)
To: buildroot-association@buildroot.org
Subject: Cron <buildroot@buildroot> curl -X POST -F token=a9bd42a2fda71467e36be83d511b4a -F ref=master -F "variables[BR_SCHEDULE_JOBS]=defconfig" https://gitlab.com/api/v4/projects/2648174/trigger/pipeline
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Cron-Env: <MAILTO=buildroot-association@buildroot.org>
X-Cron-Env: <SHELL=/bin/sh>
X-Cron-Env: <HOME=/home/buildroot>
X-Cron-Env: <PATH=/usr/bin:/bin>
X-Cron-Env: <LOGNAME=buildroot>
Message-Id: <E1t3iSY-002u5n-1h@buildroot>
Date: Wed, 23 Oct 2024 23:00:02 +0200
X-Exim-DSN-Information: Due to administrative limits only headers are returned


--1729717202-eximdsn-1726555086--

--===============6103779445941870118==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6103779445941870118==--
