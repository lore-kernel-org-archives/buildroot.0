Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 529CCC433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 14:52:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AAC8603E5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 14:52:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5AAC8603E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3F5D60A44;
	Tue, 26 Oct 2021 14:52:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id il02IoTIwznv; Tue, 26 Oct 2021 14:52:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CAEC608F5;
	Tue, 26 Oct 2021 14:52:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BBBE31BF2B3
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 14:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7D5981763
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 14:52:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bS1tINBTAxh6 for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 14:52:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F70C81551
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 14:52:50 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id 5so14670520edw.7
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 07:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Wu0HabTYtv6w91Q5BnE4H2Z/WBzrw1FQhqtM0XPwTWc=;
 b=ORU2x0Lg6D39+LhQHQNu+fuSq4O6qNksAv+fEfL1iWRAgI3F2odtTdlmIVA8Et3RNL
 Og8qTzZ+7VnZH7YrZ3BmZhndEKQTt3tBfpQkkl4hSUaDdlDu2PiFaa1HRlzvbg0JIHfF
 E7nQFv5P3EM6y0RIV1J9AtKg/YoKr17e/snZn4GyDxkLP/boStOee7xqHlGNNEOPkqkh
 fexNYpPYwFnUXkj+53cHboZbQvc0VuHpxbCBqdnR+jcYS3gZF/J3bTH0hIgkodnLCw7T
 tqQwiBsc7bKM3DXsIo9Lh5XrqKq4JQPMcxqfwbbPipGIwuJzHmhQ8DyISGj4EeX1Xhc3
 H/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Wu0HabTYtv6w91Q5BnE4H2Z/WBzrw1FQhqtM0XPwTWc=;
 b=QYpZ0NQo14OmOeAimqUTCfVUMH0lIYrIll7wKOxnFluB69k7yQyZLva2hITfk7vSHn
 H3DZ/WYqxYGBs84XTrZBRAGC3i2+NEFA4z9EqahRO6akw1waa/ZST94Iw6mUJApzZ5E9
 E2R8COU60iPVTFPrGxlORVkBT2Q5EZ6SXnlZn1dhTIxxFO9A88ESEUomP/rUnAYk4w5k
 9om8fXpiCenWwGidzCtxq2Cg0rk6V7hyL0G3KCn3gw8USKjoBCBamQN5IxC/hCXLHFMe
 tcI7NhRNsNshlxSLWBYws92fkGILsE9CXQQ6l8pASsDD6b6HwXvwiIb2rPMAM85tSeqc
 733w==
X-Gm-Message-State: AOAM532LqPvZWQV69kupjPhoqjchqzudLMT5+PYTyd7T1hs1phzMKbd6
 D4xR5q2iilqNfrZcw7hs+0jTwGYSaSVQVZdHdFhV4FxvQbM=
X-Google-Smtp-Source: ABdhPJzYLoAyzW7CTLqsBSlFERXq4VU1tlmUOPHFxY8DexjgZC0QEhJx7zxUucBhYqoMJ454xKVZYFC5yt6fmN+q5PI=
X-Received: by 2002:a05:6402:26c5:: with SMTP id
 x5mr36139319edd.297.1635259822796; 
 Tue, 26 Oct 2021 07:50:22 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 26 Oct 2021 16:50:12 +0200
Message-ID: <CAGm1_kskfYMOL39tnF-WsTiFF=dTVSVCnV7MNX72c+ZMN=4_Fg@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
Subject: [Buildroot] python-gobject: wrong module folder
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While trying to build the master brunch, I have encountered the
following runtime error:

# python sample_python_gobject.py
Traceback (most recent call last):
  File "/root/sample_python_gobject.py", line 3, in <module>
    from gi.repository import GLib
ModuleNotFoundError: No module named 'gi'

This output comes from the runtime-test:

support/testing/run-tests -d dl -o ci_tests -k
tests.package.test_python_gobject.TestPythonPy3Gobject

During the configuration stage there is the following meson warning:

Program python3 found: YES (/home/user/br/output/host/bin/python3)
WARNING: Broken python installation detected. Python files installed
by Meson might not be found by python interpreter.
Found pkg-config: /home/user/br/output/host/bin/pkgconf (1.6.3)
Dependency python found: YES (pkgconfig-fallback)

The problem is that the gobject modules will be installed to
/usr/lib/python3/dist-packages instead of
/usr/lib/python3.9/site-package and hence cannot be found by the
python during the runtime.

Any idea what's going wrong?

Best regards,
Yegor
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
