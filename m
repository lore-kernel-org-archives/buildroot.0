Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CF8C3DA5D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 04:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CF954009B;
	Fri, 19 Jul 2024 04:44:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vuqd8jL9ke3A; Fri, 19 Jul 2024 04:44:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66545408C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66545408C3;
	Fri, 19 Jul 2024 04:44:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 068B61BF841
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 04:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0155D60707
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 04:44:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XcOEDXNYQ5RO for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 04:44:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D517D606FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D517D606FA
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D517D606FA
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 04:44:24 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52ea79e6979so1427843e87.2
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 21:44:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721364262; x=1721969062;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TWacEYb9GHsnodfGwD3hwqU8NvuiMo7PCd6hSkgojd8=;
 b=fRcAFOntVcE9wQ3PpLxcFx2LVJ44nrsQJJeTKo6KKQ4fXVeVgEzpV4j4kAqLAkLXx9
 b8gNZGpypWYqVsyZZ8XBV0tkffW/4YUKu5VhoMlT2vLmm1wu5Q5IWa8W2PDGJqnQIoEo
 tAlPIEBwDX9SpIbISBSqC712D1U0tedlPKTxI367davX7tfl3CUWZDJxsyeCgn39E0oA
 xYQuqjszkeV8T9nnOVkGKpbbZ0/dDBz5nezrbA13vikxo8vL8WYotf4a43cSKA/HvhOZ
 SiIH7iNwnwEyJQ0Fwvu3ftDeA1hjftrW499gj0XzpP3elOv8Mc4PucnX7vFLrpXffXzO
 u6Xg==
X-Gm-Message-State: AOJu0YwCBFUmc7lYGl9WmXlS0FfX37d4ulAxQYZOmQHBDSmEy1zhVjXl
 DGUl93X9YaCZR5ejypH4bt3rddTafRCDE12E+F6kEgQcIOUAh/ibv+QKj7TvXC2VMyBUpCaFNP3
 U7gnI3g==
X-Google-Smtp-Source: AGHT+IGMhSbrHE/ew/r7htzHNKgGrj07ozQ8tJsMXa9b7qoDBb5wCpfz1y9Io68EWYtfEeHwKhkthQ==
X-Received: by 2002:a05:6512:280e:b0:52e:999b:7c01 with SMTP id
 2adb3069b0e04-52ee5428836mr5258341e87.48.1721364262143; 
 Thu, 18 Jul 2024 21:44:22 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com.
 [209.85.167.51]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ef553ca47sm74971e87.93.2024.07.18.21.44.19
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 21:44:20 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-52e99060b0dso1277958e87.1
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 21:44:19 -0700 (PDT)
X-Received: by 2002:a05:6512:3a87:b0:52e:7ef1:7c6e with SMTP id
 2adb3069b0e04-52ee5429389mr4733702e87.51.1721364259355; Thu, 18 Jul 2024
 21:44:19 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 18 Jul 2024 21:44:08 -0700
X-Gmail-Original-Message-ID: <CA+h8R2osC5ok1g3UYL_2iuSJwF0wKNQiHexsEUaCjLHWuzF6Rw@mail.gmail.com>
Message-ID: <CA+h8R2osC5ok1g3UYL_2iuSJwF0wKNQiHexsEUaCjLHWuzF6Rw@mail.gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1721364262; x=1721969062; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=TWacEYb9GHsnodfGwD3hwqU8NvuiMo7PCd6hSkgojd8=;
 b=pPMolT5m8RkWulZsrgeyc8CyxtesrcyKZc8HTUV4GKBEFto0ZGX1zJonTZO4DL76d0
 Dm78lqxx1984mxkRMYuPW7dnFRVotOBQQevPJBsME7+Zn1LkEPC1cOqniY9ZvasOARx/
 WKQPKDMHTSBMgoiD8euAmZkv7CP993MCieamVL6Gi3J8aiU7IroKZ7A4kRQCIvX5JxQz
 foCZGd9J4HKnuuaxGP8G6Z0GRo4flPN+++0zignqqQWEVbgl0CqbYlLZRsDpee/mgeN9
 e9CDXkf5u/SaTpfE0PJPoJB1gpWlILrUhRiSnVeph5YbtzRjl3FZ7fRn/Ou3PZn0787W
 lDzw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=pPMolT5m
Subject: [Buildroot] git send-email via. GMail API
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

As a Buildroot developer, I frequently send out patches via email:

  git format-patch -v1  -M -n -s -o outgoing upstream/master
  git send-email --to buildroot@buildroot.org ./outgoing

Using GMail, this has caused a lot of issues with SMTP:

- Leaking personal IP address in emails
- SPF validation failures
- Email marked as spam
- Needing to use an app password

I have written a program `sendgmailapi` which sends via the GMail API.

https://github.com/paralin/sendgmailapi?tab=readme-ov-file#setup

Hopefully this is helpful to others developing Buildroot with GMail.

Best regards,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
