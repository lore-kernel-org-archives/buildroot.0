Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E33C3DA7F
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 21:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B360140096;
	Mon,  5 Aug 2024 21:29:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TtNQGTbrW581; Mon,  5 Aug 2024 21:29:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8040B4026A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8040B4026A;
	Mon,  5 Aug 2024 21:29:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB1C51BF2E4
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 21:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4E9D80BF3
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 21:29:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QT9T958dBSiO for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 21:29:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com;
 envelope-from=markus.mayer@broadcom.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A7F5A80B6A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7F5A80B6A
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A7F5A80B6A
 for <buildroot@busybox.net>; Mon,  5 Aug 2024 21:29:18 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1fc4b03fca0so130525ad.3
 for <buildroot@busybox.net>; Mon, 05 Aug 2024 14:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722893357; x=1723498157;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lAycfR9fZYu8fDCXkB18EMqJ2x3OnuPQt4L41WZcNms=;
 b=rY5r7ICDB7yWPzkYyr1zEYCa1zrGKe61ikfjihKbs8u4n1zM9EX+gviiygvBCGiVU4
 N3wgHfr72BPI+x5Hx8NV3TmiOUVTzK/4nyYcP1FwgxC44vv8wShupyT4/kHSAJIUT/Wz
 kufQ0nkdBSHHoY85D+GpwZeslFGrdRreh7I30wabQ+TXjS+86qedwzKIJm+1+RNoNbDa
 Vhl0lbxMS3sal+cBfgJSPpOH9IJxghuleyiX7Wbxp++7ri13/qciWuS6ZooemxLehz/S
 M3a6m4lYwtzN2jd9b0hc0CsBnlbzbIrqYuK/6gui9jfpW+o5WajjI9pXmJIIA4syRck/
 ImYg==
X-Gm-Message-State: AOJu0YwxQ+ThnleT9r2pdeFAGlNZu8UZgCrPPC+GrT7bVMczkN2i2Etu
 aXts6Rp8qvww6JO3QYddTc8nlf+nk6z+Z0Oeunn76DI9smCkpctIwgv8EdPXa8AoqjMCEQNiUkK
 uv+OeBNoG5sUeI0alwWrfihv1gAc7oDB6PJsLQrB6ZwHgD6CUqZ/R
X-Google-Smtp-Source: AGHT+IFm1yC3I8CJjUShXtkFoIB4obmnQWwQDHsJ0DvJ5qeeKaV/NzQXSuzu/ph42oslzOdavki+C/pae9GQ+BQwhHI=
X-Received: by 2002:a17:902:e74e:b0:1fa:ab25:f634 with SMTP id
 d9443c01a7336-1ff5727280bmr105620715ad.3.1722893356869; Mon, 05 Aug 2024
 14:29:16 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 5 Aug 2024 14:29:05 -0700
Message-ID: <CAGt4E5vg3nF-T3vbbhCmu6Qd+EXjH3fOB63KaB1LpSdb9nw0cA@mail.gmail.com>
To: Buildroot Mailing List <buildroot@busybox.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1722893357; x=1723498157; darn=busybox.net;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=lAycfR9fZYu8fDCXkB18EMqJ2x3OnuPQt4L41WZcNms=;
 b=YKUZ90vXpqMPlVhW3hElCjgp+d79RAcJMY+oj4Fyquse5XyrdBZyPronqzSCV13Noi
 nONJxYfnVIsnv2F5mWafvJGbtunnVSMv4hkXPoONN6E+5HUekfzj8kWi3wZWjGZScPaF
 1WbwJAk9vI4RhnxZXVBD7PborHK+ISUEvQcII=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=broadcom.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=YKUZ90vX
Subject: [Buildroot] BR2_FORCE_HOST_BUILD broken
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

The following commit[1] seems to be breaking BR2_FORCE_HOST_BUILD:

4703a7ae9176 package/xz: fix musl static build

Here is a one-liner to reproduce the problem:

$ make O=/tmp/dummy raspberrypi5_defconfig && \
    sed -i 's/# BR2_FORCE_HOST_BUILD.*/BR2_FORCE_HOST_BUILD=y/' \
    /tmp/dummy/.config  && make O=/tmp/dummy
  GEN     /tmp/dummy/Makefile
#
# configuration written to /tmp/dummy/.config
#
package/xz/xz.mk:72: *** Recursive variable
'HOST_XZ_FINAL_RECURSIVE_DEPENDENCIES' references itself (eventually).
Stop.
make: *** [Makefile:83: _all] Error 2

That means:
    1. Configure for Raspberry Pi 5 (but any target would work)
    2. Turn on BR2_FORCE_HOST_BUILD
    3. Try to build
    4. Observe circular dependency for host-xz

I haven't determined the actual circular dependency yet. Are there any
tips for narrowing this down? These circular dependencies don't seem
to be easy to track down.

Thanks,
-Markus

[1] https://github.com/buildroot/buildroot/commit/4703a7ae9176b3a9d824880ef095b1b80c123df4
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
