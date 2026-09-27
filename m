Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D71C9832F
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 20:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4E2780E31;
	Sun, 27 Sep 2026 20:48:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YXW54gfmBfTJ; Sun, 27 Sep 2026 20:48:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0518D80DCC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790542135;
	b=Rc2GEr0Nxvek7cPne6PrcjWv0pbTrKit/0PD8bfVW5iH5cwAfAn3wmSHJI1dr1ZMAxu0
	 GDdBZ6dSGMoDeV6XRnCmhWML0qZKkt3qlPeHBUxoJXRHIPKWUkFYaqLiv2w07TwcobZak
	 KlT7qX3TJXOYu8xwk37kws6Fjm0fOhpVBV0HJ1uFzAi/dLijktZaIMBGqe/IydNnOXeIx
	 3FGiag97nQl9YHwlSV0eCsdUTEFVCXqRsREWVbsADZpkI3Bteef1K5V5oXha9KR5pckpG
	 KmKp9rZUl0NXvYeZ17DOgeUkIKhJE8T3lMkamoTAwuMs8BFi2OCD7jzLpjlPv4ZqS+w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790542135;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=yGc3YOldGX/F3A20VcqhImW05Vvxs1tbEiZkbw5JExI=;
	b=ZcbINxmKHFDOlkr1LIWroou7e87WNuDeAQnvk4Rd5nHFKF3W667J89cwBfNB0R+yDQb0
	 izn3L42bO8LdyV5y/9cq+Jm024uvdP/pXy0u0DJz7Owwj84pDzbmbHVfmIwmroGjiBWx+
	 alRicdhpWxjLK//jN3WaRVJKi9U4lNKWydv7SJryFZg+2Uyns0RE7KulnppbZ7cfXo3IQ
	 0ggbzTC91vDvbtTWKQuCWCK+otU6x1V3SXURPU6xEt/nMZqhpW3jrmIkMmNDhbCFqPhrZ
	 kd9GU5Q/9tKpUMaqKDkpDvWFcJKdrUL813PJqL7fGbNG4UZi16LVH+BkSGmKbf0h2HA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=none header.from=j-ernberg.se;
	dkim=pass header.d=j-ernberg-se.20251104.gappssmtp.com header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=gADa7pzr;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790542135;
	bh=yGc3YOldGX/F3A20VcqhImW05Vvxs1tbEiZkbw5JExI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eGe+TEsON/NoMOlACPD7xjt09x3qyljAOuOqAeAX576YKNDx7It+ve7ExTIRIfK/r
	 0cJERKX6IX3/Ksf8ezxetsm/I4vt0NTDdVubVkf5URpcgl1+4mmH2lJLmALptEMVlX
	 aJINut5gZRPNYeIeG6yHKUr80BjIG0D0hyJgBvYUB3WlzdP2GeoTlPnXz3L2T1iU22
	 vANMbAQtMWOqHPNKr6av81uI+8iA/VdjFdUcjMZh/0g18o2DyHLmEkDhhc3skhfEiP
	 U59JUEi9ViErFusx9je77vYrNj2r0cKchWSq40b+O45iQ9BIpXdBaYqE11epJJKFM/
	 OAkfDn+BT0SLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0518D80DCC;
	Sun, 27 Sep 2026 20:48:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CEEF63D8
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 20:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7D7A80E2E
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 20:48:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id piYAbEOr2Waj for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 20:48:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A101680DC5
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:36::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790542132;
 b=c/cFXI6SCyWXgv/JXK0AaBbtflWEQDAUxi9lzjF0MvCJXgT7XQDmmoIrPiphDR7NOx7D
 dnFBtVvt0uDwqlTD0adXRjbHLXTS4jN4w4cwa9igdxxFY02mevmna5Mo/ZBYpzPLmA3ja
 UjjZjxp8k85Irf3uBwMZcHZZguVrb6eTcp9XcHJ1E3cml8dnV4+4vmi+OuzF7M8WSdZL7
 KDmr7hUKTpW0JIctu7h8owkxzwAtGRAoqyNJKafLKEg62+zn0kdVhJtGglJ4o4JAfbxPH
 nCrBfydSd2wKqgucl5obFnp9PZgAjYeWdQ19R7b8VXdEDwYlgRvbalrieWKAjxX07pw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790542132;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=0bAh3MHey2NnSFfjnQye5mfkYSKcrm9A9XyzhmX+tBY=;
 b=qyHJW09G6AW+LSDfVDEWWOkXCvnItirgd9AYAP0pbIsbOGQy19kT1pZ0HIxAWsmqNz9I
 pv9RQYnvY6PsELXiYQpTdgeleAlxzNV1kynMjrA/A3MzioEecCsE2vJUOKLrwEMPzyeaq
 wUBdNUOqDq7YRq7Nkmn3Ok1OuD5a2lQdGAmMbXjZlr2hSFu9ZHcN3In108Na+vbAls/Al
 bFOaH1BWD6ZxteonYlAb5LrkRf/YKz2764ZyWZik5Ox4/SwMyNlmdIf8M0xvU+csi+JEq
 1vSh1JPOmrEox137uqC3EsE8VBwzch5hcb2UFhitHOwCwj0zFM9XpO2xweJRrQV48Wg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=none header.from=j-ernberg.se; 
 dkim=pass header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=gADa7pzr; 
 arc=none smtp.remote-ip="2a00:1450:4864:36::10"
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:36::10; helo=mail-lf2-x10.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=j-ernberg.se
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=gADa7pzr
Received: from mail-lf2-x10.google.com (mail-lf2-x10.google.com
 [IPv6:2a00:1450:4864:36::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A101680DC5
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 20:48:49 +0000 (UTC)
Received: by mail-lf2-x10.google.com with SMTP id
 2adb3069b0e04-5b5e4f15b78so2055905e87.2
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 13:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1790542127; x=1791146927;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=0bAh3MHey2NnSFfjnQye5mfkYSKcrm9A9XyzhmX+tBY=;
 b=gADa7pzrXxXmDURuILrzrhsH9KVWG5w3LdFFaXHnlC1CZjut0AMxZBcoQXIjzI7XY5
 jEAlZ2RIn3H8GTFD/OxYzyPnQUgmw7E+Y52/TaThIOno8Exn15ycTrqajQjtuC23aDUk
 lMA1JJX0R+T/AeuiD3Hhdk4QX4QsLPGnl08iVak5yRq65NTeUJjSvdvAdC0MX1kEJkvE
 ZS8DbYwMMJ1qlCT+SgCig/0wJW+5V1iGrERMYda4NpweMopQ5pldtSPWYT/W9DkAeuhG
 cylCtL/rUxQVa8tOwf5NpyYa16zs02+PZY6hxRQeKGQ7jWQYglQbRJE9LeRR4wfiBbyM
 aybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790542127; x=1791146927;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0bAh3MHey2NnSFfjnQye5mfkYSKcrm9A9XyzhmX+tBY=;
 b=JZnHP44dOrsp5bE8+4X11ocLwgGNxQNlccittUeh8z7JsMkiskWNycbpg2+JbHOXmb
 vFWslDdJU/EHZosqHJk1kS/uFW/yMSf+KxMMOcUfSh4ZhmXy+EBvRcvi7m3FAOVMDyRe
 /uP/sPPpOJCDi13Bx+XQGMsdNSCp2AzXs9I5lSnmKk8jSadwUC0oL1nJ/HowLAfkeZOV
 AHMiDhc5F7/ImA6eneJyAUPdcLULJulNPLnt/97I4L4b3/pX5i814fc2b/6L3iTsSkpu
 nvbc7Zn1fwl/odednk3qPXZKGEmBDbnGRWCOSaE/l4xSDbR7K9mJSdBdj9Fue7NUP4il
 wu5A==
X-Gm-Message-State: AFq9FYJ6zPXeOuWMG/6p4vGGiQuMwD9W0r0J76Hynl6tMA+ybzrxIosu
 qSDSE2iVuA0j0up0N+X18nlYKUixULWlhKh6RWu/k5idP96hV3e/2oBWFcyDOLA5U33SFD9VGG4
 pwkfL1Bk=
X-Gm-Gg: AYBFou1Qao3CyKs/NfwmcQslBWrVkb9zpTBYGrf7ECnbvQ1EPMozt0Rjtf8oKqbPN+Z
 bakQ1PbcwHFfvqy3DIfMEIuIFAsPqWZcdb4YdaD4S0aQVFEKlKBpXh9HckhuuxPPBlax5QKgPQe
 e2ZiDXWhH3D7S7WFZUCUYLKlh5TtY3BfWn5TwdFS/gEd50xhQpaeD9pCyj4Q7flwEZQ1xZ5F5Of
 u9reWyC8+eOhF0fXhwdNBQIQ9ffhs1BrA+i32XxatRxzl+2kvuyriiya8Y610esJoljQZRlVDPi
 JHHbb4valqCly0hjc/GQm4mLQVDSfbXi9ks4KXQaHHugs8t0AzqkxYLJ9IjFtMzdyN5egZfqzNI
 gm82a6Z0bprOvaG53JR/XsoF6xs/Ml6sDvWogbKJZYiTd65HOxSSYIia4OEcVqkslWIAtCHH8mF
 5kCMCV+mkjwqCTCDWS+Si9QWM+mVMBOR+qXgWZsc9xNUalETZyqs3uef8K9mxj4Q552c0nwY2Sk
 8ReaErdHe5UHOZSybbf3s8nabIUyGJkxH9Em02OLWorVBYGTwNxUHr5MOMt4RpF6xzzi9qKUtlT
 9MNe1q4ngF9u
X-Received: by 2002:a05:6512:4408:b0:5b8:f379:eab5 with SMTP id
 2adb3069b0e04-5b8f379ee01mr972291e87.52.1790542126623; 
 Sun, 27 Sep 2026 13:48:46 -0700 (PDT)
Received: from localhost (78-68-185-168-no2360.tbcn.telia.com. [78.68.185.168])
 by smtp.gmail.com with UTF8SMTPSA id
 38308e7fff4ca-3a64c2ea25bsm23394961fa.16.2026.09.27.13.48.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Sep 2026 13:48:44 -0700 (PDT)
From: John Ernberg <j@j-ernberg.se>
To: buildroot@buildroot.org
Cc: John Ernberg <j@j-ernberg.se>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Adam Ford <aford173@gmail.com>
Date: Sun, 27 Sep 2026 22:48:40 +0200
Message-ID: <20260927204842.1113860-1-j@j-ernberg.se>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/2] xorg mesa3d dependency fixes
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

Adam Ford reported at [1] that xwayland randomly fails to build with a
missing dri dependency.

I had run into the same error on xorg-server earlier and didn't have a
solid solution for it at the time.

Fix the issue in both packages.

[1] https://lore.kernel.org/buildroot/20260803140815.617446-1-aford173@gmail.com/

Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Cc: Adam Ford <aford173@gmail.com>

John Ernberg (2):
  package/x11r7/xserver_xorg-server: glx depend on mesa3d{,-headers}
  package/x11r7/xwayland: glx depend on mesa3d{,-headers}

 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 5 ++++-
 package/x11r7/xwayland/xwayland.mk                       | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
