Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F556C27C6E
	for <buildroot@archiver.kernel.org>; Fri, 14 Jun 2024 18:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0ACD384414;
	Fri, 14 Jun 2024 18:35:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZM3gzlBeFAG2; Fri, 14 Jun 2024 18:35:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AC6184437
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AC6184437;
	Fri, 14 Jun 2024 18:35:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B7C31BF321
 for <buildroot@lists.busybox.net>; Fri, 14 Jun 2024 18:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8D47400F8
 for <buildroot@lists.busybox.net>; Fri, 14 Jun 2024 18:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b87GBMNRzzi1 for <buildroot@lists.busybox.net>;
 Fri, 14 Jun 2024 18:35:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.54;
 helo=mail-ed1-f54.google.com; envelope-from=jdknight@jdknight.me;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B760240065
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B760240065
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B760240065
 for <buildroot@buildroot.org>; Fri, 14 Jun 2024 18:35:28 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-57c6011d75dso3016987a12.3
 for <buildroot@buildroot.org>; Fri, 14 Jun 2024 11:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718390127; x=1718994927;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TMoDblfeZFVJeeh81A+SIbbzaSqscZOXVL4rVfOlLw8=;
 b=PG0P8138wEJEer2NsczYcPwMl4UiTi3gWyufPTk3Jr3quTYMdPcBqsTv1LSvwubYjf
 gW2uArjdh0JAHMEFnSzs+uYhQmLLhhKTWHM4msmo/ggR4tHPrjT8z9zJDnPNyB58UB9S
 9jHRvMRYCyzITJvILIXKxau4y2JdBAk3L6JexaNTA1uKTmBAJcCcjMg/qZxOg6oTI8k6
 LN0L7y3C+6xDZyIHqV0kZWXhaYnd5LqaoO9PckXhnFlUezlM6rB1A6hEGWpPu8z9fJSP
 RyndIPigx83Xz9dKs1XNVVC0Nvwnsw/AWuaGjysVUZTAYS1uYXzWs76DyVSwdFLG+Ojo
 QLKQ==
X-Gm-Message-State: AOJu0YzqxcUsIbqVxuds5jAugE91InkP3WJiM0hK9HvMiIzv2qew9IvW
 SlYet59cg3q8mKRgbUgGZIRA47INS7Elv8LTAyfnQ8aefcq1lwQE0p3zsSWw07PoGKzh8j3Rzf3
 W+DAyB8xT+6YUNFg3rqeM1zUnm/U0AGswhBS76rTyOfYDVj9iEqo=
X-Google-Smtp-Source: AGHT+IETgZ4uvUx/l3B1vprfPfK5Oyos8gG1L+2BoPS3GBnj2rrjvLg/ELpwvGY7CwIFmiw59H5wxFpv5h0bEjljoZc=
X-Received: by 2002:a50:9e43:0:b0:57c:60e8:c519 with SMTP id
 4fb4d7f45d1cf-57cbd682d07mr2604650a12.16.1718390126480; Fri, 14 Jun 2024
 11:35:26 -0700 (PDT)
MIME-Version: 1.0
From: James Knight <james.d.knight@live.com>
Date: Fri, 14 Jun 2024 14:35:16 -0400
Message-ID: <CALAjcgXZKYjpsFV1E7Ry-0N5NEGV01hebSb8tEgoAtHvkfvCOA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=live.com
Subject: [Buildroot] inquiry | configuring for a specific linux lts
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

Trying to figure out the best way with Buildroot to target a specific
Linux LTS branch for images. At this time, using a setup that has an
external toolchain build (v6.6.x Linux headers) and inside each
project configurations a `BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE`
option is specified to a value of (for example) `6.6.32`. As Buildroot
evolves, it may update its own configuration and Linux hashes to a
more recent version (e.g. v6.6.33). In turn, when updating the
Buildroot version to use, there is a need to update all configurations
to use the most recent LTS version.

I am looking for a capability somewhat provided by the existing
`BR2_LINUX_KERNEL_LATEST_VERSION` option, but targeting a specific LTS
version. For example:

    BR2_LINUX_KERNEL_LATEST_VERSION
    BR2_LINUX_KERNEL_LATEST_LTS_0606_VERSION
    BR2_LINUX_KERNEL_LATEST_LTS_0601_VERSION
    BR2_LINUX_KERNEL_LATEST_LTS_0516_VERSION
    ...

Then these configurations can use whatever the latest LTS version of a
configured major-minor without updating.

I imagine this may not be implemented since these additional
configuration options may be a bit too much to maintain. Assuming such
an approach is not desired, I wonder if it may be possible to support
a `BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE` option where users can
define a value such as `6.6.` (or `6.6.x` or whatever) and have
Buildroot use whatever the most recent version it "supports" (e.g. has
a hash reference).

For now, it seems the tasks needed to handle an updated Buildroot
framework with a custom Linux version is to first have projects
track/patch the hash version of Linux any time a custom version is
set; and update both the version and patch-hash in a board
configuration when wanting to update.

If I am overlooking another way to approach this, please let me know.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
