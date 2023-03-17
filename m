Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB40C74A5B
	for <buildroot@archiver.kernel.org>; Fri, 17 Mar 2023 02:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88D1660C06;
	Fri, 17 Mar 2023 02:06:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88D1660C06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AA2fiXKnBN25; Fri, 17 Mar 2023 02:06:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C479860BED;
	Fri, 17 Mar 2023 02:06:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C479860BED
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 62AA01BF2E5
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 02:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3838A60BED
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 02:06:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3838A60BED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tDNDcG3xg7Lq for <buildroot@lists.busybox.net>;
 Fri, 17 Mar 2023 02:06:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C413F60B12
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C413F60B12
 for <buildroot@buildroot.org>; Fri, 17 Mar 2023 02:06:42 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 u3-20020a17090a450300b00239db6d7d47so3491301pjg.4
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 19:06:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679018802;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2jYT8SfNkgJbydDf6Z+5r4CW0Kwt3eV2z+5c1NbsSao=;
 b=rwxjptC8WfvlvLZ41igMIwLcu9xslcL3tUFdwTH+SAKPx6mugSzqgzkkWNbH4bK6qO
 a+h0kRTOOmzxUM2IQFsFqn07FiRhDNrSqPBkGXLolp7tF6/1C4ttfqD3JWDWX0/xisMN
 +N/6OulCPMAiQYMA8Lyqaopa+u8f58kd0/vIQl1jVAwIZqqPbK4GrQuaH1yCtjEAwJqw
 7jtiFlB+gsZ8bl9x4J12rDcPjCWTBJMuEMjwCWMm+66JEz3LTfeWzT/uUUteKKyI0Wvy
 X1YN+3S+CTP26I1RL5PY6eU7/tarGi8/YvYoJny2SbbWHjnKLbzTjRa0faLoqU48JLB0
 XWCg==
X-Gm-Message-State: AO0yUKUjCI4Nmuvvhf0fqDxCSVsMhqRwmbUTuJ0C/5ckgNvIh9+IC5Jb
 WJZE6edN/T4LJkmGs2mLSAZ7Vv1KkpHoKWJ48C0S10JPKAAr5o16yA==
X-Google-Smtp-Source: AK7set87eZyz5hjztWWym3WxKqO7zoA3te6Lfwp5+HQCIHG26GW2iVHTlohF6e3gDt502eL0+Pj9HwBhvLkDVYxH+70=
X-Received: by 2002:a17:90a:ea89:b0:237:2516:f76a with SMTP id
 h9-20020a17090aea8900b002372516f76amr1682755pjz.2.1679018801683; Thu, 16 Mar
 2023 19:06:41 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 16 Mar 2023 20:06:30 -0600
Message-ID: <CAAKqzUTGAhx0XJ0hTjiHVKzKg6s3Jt0-mKVXa6bEuxATJZBwAg@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outrider.ai; s=google; t=1679018802;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=2jYT8SfNkgJbydDf6Z+5r4CW0Kwt3eV2z+5c1NbsSao=;
 b=vB966JcJT7VhcsoMWdUi52c/4eH6MOKJ8OhQeeI2caCDjhhM0Q8MGGOGlBmg5mrcYK
 hqpIUTH9hrOTL+lE8hhtYAnkrK+dMQUeC6aIzTKkrwLt1fm7bu9354aftqCJi+6W+/gw
 sQs0K3ALz2yrx7Mh8/GOyenut4ucsO2rbbijY0SNRdf1rNWJ3oevkGDF8T7JupN2JA7A
 OFSY1I2tjLWjWrSsgl3cNf/Rnv4wrqg4NKwtcWOAYR+S0uRj9CmUniFREbPr4ofFY+A+
 rAAC5BfrLToUPF6reJcYl+yoo0/hVC5vRYuEh46mujlatw/fT5d3h0ohuq4JMMYjBcA9
 4FFg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=outrider.ai header.i=@outrider.ai
 header.a=rsa-sha256 header.s=google header.b=vB966JcJ
Subject: [Buildroot] Missing select package/python-can
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
From: Dan Ambrosio via buildroot <buildroot@buildroot.org>
Reply-To: Dan Ambrosio <dambrosio@outrider.ai>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,
I just recently upgraded Buildroot from 2022.02 to 2023.02 and believe
there is a missing select on BR2_PACKAGE_PYTHON_SETUPTOOLS in the
python-can package.

The version of python-can for 2023.02 is 4.1.0 and the Config.in does
not have a select on BR2_PACKAGE_PYTHON_SETUPTOOLS even though the
setup.py on tag v4.1.0 contains a install_requires on setuptools. See
https://github.com/hardbyte/python-can/blob/v4.1.0/setup.py#L92.

------------
config BR2_PACKAGE_PYTHON_CAN
bool "python-can"
select BR2_PACKAGE_PYTHON3_SQLITE # runtime
select BR2_PACKAGE_PYTHON_AENUM # runtime
select BR2_PACKAGE_PYTHON_MSGPACK # runtime
select BR2_PACKAGE_PYTHON_PACKAGING # runtime
select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
select BR2_PACKAGE_PYTHON_WRAPT # runtime
select BR2_PACKAGE_PYTHON3_ZLIB
help
  This module provides controller area network support for
  Python.

  https://github.com/hardbyte/python-can
------------

The missing dependency presents itself at runtime as the following error:
------------
Mar 16 22:22:12 :     import can
Mar 16 22:22:12 :   File
"/usr/lib/python3.11/site-packages/can/__init__.py", line 38, in
<module>
Mar 16 22:22:12 :   File
"/usr/lib/python3.11/site-packages/can/io/__init__.py", line 7, in
<module>
Mar 16 22:22:12 :   File
"/usr/lib/python3.11/site-packages/can/io/logger.py", line 15, in
<module>
Mar 16 22:22:12 : ModuleNotFoundError: No module named 'pkg_resources'
------------

FWIW, Buildroot version 2022.02 has the expected
BR2_PACKAGE_PYTHON_SETUPTOOLS select in the python-can Config.in file.

Appreciate the help,
Dan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
