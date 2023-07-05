Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD191EB64DA
	for <buildroot@archiver.kernel.org>; Wed,  5 Jul 2023 10:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A77A408F2;
	Wed,  5 Jul 2023 10:09:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A77A408F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J559QiVGBhtv; Wed,  5 Jul 2023 10:09:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DA5F408E6;
	Wed,  5 Jul 2023 10:09:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DA5F408E6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9E50F1BF82D
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 10:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 853D9813DD
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 10:09:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 853D9813DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IPK81632OQQo for <buildroot@lists.busybox.net>;
 Wed,  5 Jul 2023 10:09:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEF12813CD
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AEF12813CD
 for <buildroot@buildroot.org>; Wed,  5 Jul 2023 10:09:10 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fbc59de009so68366645e9.3
 for <buildroot@buildroot.org>; Wed, 05 Jul 2023 03:09:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688551748; x=1691143748;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fUwsSY658LKK1It63wCmQ+KR6YS4r31thqugB8d/4bo=;
 b=fNIR+hOD1zYKqFNvsCbBhwriUzONtiijtWNGNPdPOoOy8aM5/jT4GXGLjdMA8mPQV9
 ZkQInJAD3S7jNvvR4c3jR+yirCXXyRqgB+2E7cL17esyG9MBEJnqyvxv4UCcmoOfXJHG
 dw5u5vAQNn9KdfwkEHHOA3965D8O1cPT2aed9sqA5BZ/j5Nmp/Vp4WcwC78savQR8KR4
 Z+07x04LWmuVglVrbPWmEux3FVIKwAajQyJYdKCDw7OVTLDQ3NqaIw8kpcRXLYiTkTGv
 R1DLiGeiHGk+QwPLBqNMT/61o1HQX4QUM+DgTLQXH85cx/ljnQDeoEB2xtNE0IKUh+Gf
 nf7g==
X-Gm-Message-State: AC+VfDwI2Y/fo99cPZ4tsoMBdj6oYlb/8pqQ2XOszETR8SZwSu8s8Ghp
 9K2hIHypM8kYgFDzkMhULET2ZMag2FjbP4cK4VTA9pFf+qcI97PoqMnFsw==
X-Google-Smtp-Source: ACHHUZ5zkJBYfpvKgmp2PpnxEORzmbaFc4gfkQKghdc82nR6/oiZ0cEY6qALQSnUOtFZZXHRdt6PsZwnl2rQJg8KDJU=
X-Received: by 2002:a7b:c847:0:b0:3fb:be07:5343 with SMTP id
 c7-20020a7bc847000000b003fbbe075343mr13046579wml.27.1688551747840; Wed, 05
 Jul 2023 03:09:07 -0700 (PDT)
MIME-Version: 1.0
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Wed, 5 Jul 2023 12:08:56 +0200
Message-ID: <CAOf5uwmYNk+28CEYS-_tcGWVsw7-pWYCY2YCJXQzuijep5A5eg@mail.gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1688551748; x=1691143748;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=fUwsSY658LKK1It63wCmQ+KR6YS4r31thqugB8d/4bo=;
 b=D9B1WZiDfaBrYk2Z2lYcbO6R7eNtFu26fX0xzKhyZdguvp0UU3CEaqsIfrt3LhfFgj
 8IV3k0JYOTLmsj0MqBe33lWABu549znNcxDnqD6V9ZdqtWXRsu5i/sgud4USgBN4x+0J
 rjXJiORGvZvKlQScQe1ayqDN8V24pNK6zTQzs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=D9B1WZiD
Subject: [Buildroot] external toolchain license collection
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

Hi all

Is there a way to collect the license of an external toolchain and put
it in the buildroot bundle?
For instance we have some packages like libuclic and other libraries
that are put in the target but even those licenses should appear. Is
something I miss?

Michael
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
