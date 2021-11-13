Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74267C433EF
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 17:50:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 023ED611AF
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 17:50:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 023ED611AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C18D540173;
	Sat, 13 Nov 2021 17:50:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hoe3NxLY7cJm; Sat, 13 Nov 2021 17:50:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A80F940150;
	Sat, 13 Nov 2021 17:50:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 99F9F1BF370
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 17:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8875840150
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 17:50:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DRIy4brxfl5c for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 17:50:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 522CD400A4
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 17:50:50 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id 207so25286583ljf.10
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 09:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language;
 bh=liSzx6p7Vp5Or/rTSqaynWmsFl032qwFrxfGJ3a/Lpw=;
 b=Zz81A/+8WlBKVfEuX+oDoWvxOjFgelTI4xSdykmRRmdi5fj5VVoMqZl/lA2zLGugrp
 Z0HbWOmSZpNGWJCfURrEy8t6jfRZ+NH/sRgj0r7jtGNRuEo27kHUFvRayVC9s3mOhyrF
 dkAN2oyhmH+zqbyWscwHYyvD8lZBvIWTfFwUZ7+PoZsJxu8l1DpE7GQ47eLVHK+lW22Q
 4SolDybvQhZ5SXclSQdR91RL9Y9QOLwC+RH2A38GBTPw685TRhO15F4kSQ0baLrc3TXB
 gcAUDYm1/lu2LPmy+tCfiB6N5Iu/fhNsR/4IBVLBPk5ApUlSJ2XZv9wPULuQA2MwAZdC
 wU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language;
 bh=liSzx6p7Vp5Or/rTSqaynWmsFl032qwFrxfGJ3a/Lpw=;
 b=TIOHeV0z+o+puCJWU/iqOp4nAk1E9YdenugOi7glxuzWaK/u0PGIBhQ+9zKv7WJUZh
 iJKOOkfrLr0HOqWyb/pL18yGEdcLKj2K0k+GhRIBbWQrg9Au8twMFs2FaPsy4AMvWjst
 475qSuc3bvvRCoIMWNTORO8Wwt/emzYrdsGQsYwujeNG8YYiu3M8NJkK4l9YYH2yB/xm
 AMvwnrDYe/ubboI0MIJYcpUN1f/2OT1LiHyTk3nhDfCSxFyR1xnn2qOKaW/f2eWBSUXN
 SLisNvPTj5NzE4A0dKJ0hNJsoXApsIhPDysVmQmazAxxqNtXTWpvGmukwQ+WGKNh5C/x
 UYNQ==
X-Gm-Message-State: AOAM533NOsh996LrbMQ3SEYypa6IDZIvKfqZXzsXff90EO1GouBFZwtK
 /ob5EIW8WnA9l/POj97eJmhYyH/F/4o=
X-Google-Smtp-Source: ABdhPJwUottZsW5uzXWGeewoGspwON8wvUoiNk1RKPERjVe441jFC4NCMLB9jX2NBRHPoPYMnUaZiw==
X-Received: by 2002:a2e:530b:: with SMTP id h11mr23757284ljb.95.1636825848846; 
 Sat, 13 Nov 2021 09:50:48 -0800 (PST)
Received: from [192.168.10.7] ([178.155.5.87])
 by smtp.gmail.com with ESMTPSA id w17sm916755lfu.251.2021.11.13.09.50.48
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Nov 2021 09:50:48 -0800 (PST)
To: buildroot@buildroot.org
From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Message-ID: <34f46376-70a2-e4b9-9dfa-4475c2bd5ca0@gmail.com>
Date: Sat, 13 Nov 2021 20:50:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------157031FE2E9195F2513E670C"
Content-Language: ru-RU
Subject: [Buildroot] Speed up the launch of Uboot on Orange Pi Zero
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
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--------------157031FE2E9195F2513E670C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Speed up the launch of Uboot on Orange Pi Zero.


--------------157031FE2E9195F2513E670C
Content-Type: application/gzip;
 name="Speed up the launch of Uboot on Orange Pi Zero.tar.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="Speed up the launch of Uboot on Orange Pi Zero.tar.gz"

H4sIAMb6j2EAA+1a63OiSBDfr5u/Ys79aEZnhleSq1wFARMqCBRgHvdliihGqoxaoJvs/fU3
PDQ+MMbs6u7e0WWJzDTd0/PraXqmHfuTTr/+aa+EEJIEAbArlgSUX3FynRPAPOY5SeIlhAHC
HCL8JyDsd1gZTeOJH7GhxEH0GHzbzLetP7djfv1NaJzi/7BXD9gFf17kE/yJwJX4H4Jm+HdG
w174GO/FD3bCH4kMf16UpBL/Q9Aq/qPIHz4G45D+E0Qj2g16Wcd36WDzIfL8Rvw5iXDL+BPM
S+IngH6QjW/S/xz/hkOoHz2dfztKfnVG0SR4ob6U38tOizbtNr1p2jd83nZpWA3ZoLbsKVdU
1Z3zysPIj7pzz5n/gIkL1VMHC+JK+qxjWV7Tpap2oysaVRxN9nTLpOq9Kbd0hbZYR67FlpVr
+VKjV5brUUM323f0SpNVzXGp0nY9q0UFiknO7MnOpebRS83UHCYmeYYJ1M4rVjoUO6R/s6FU
inh1120zxttg0Bk9BWAyAo1pOOhGo9EE9EYRmPQDkEkBdghexbj3rqe1qHql2OeVYNJHWXM2
0mvNMTUjH9xi02zsN8wOZvh2DnojG8n4hBomNbKug01lU7HMpn55Xomnw5ewiMVzqdu2bcvx
ihTqpudoWsqVTRqTcxLCPoHjwTSGS2gWSM+006YjX7Y006NN3dDcLT4xCIfTFxi8TCI/rmUB
pkCyqWmqmzmAZWum6xrLcOfOpN15ZGMHTbz2C1jvZHcgjMGQwRwHk8Wn2w3GsSwwbfqQpdMH
5khFli5JbrR1Q5251HWOZ9EIirznDY6Z9xAWUWuIL9JsyY666ERL8b/ggQwU1VOKtGed9r13
ZZncWwyG3miqhZPs2saG5tw7pzCd0tTZ4XM46cN4PKg9hMPKetzInvUsy3CLwspCN820KI5u
ezuwUtdqO4q2xQmSAdc6T92CEaqW23Q3DpAFKb3F7or6Wu8xK+/Ofd5OelOBM0vZWh+PWcyv
x50oHE/i+mMwDJ/8x6AW9ytrj+Y2M1yY28MOeNPouaROj7k8W4PPYRQMgjgG3Sj8GkTAH3ZB
L4yenv0oWDLizjnBp+xbVnVrxT72PmrossmWntO6lZ3ViVntzkQxpkX1uclLD+q3K5JudUdj
q9stdJ7lTha0GqsMtpxGXENXZHPVn5Y7qWmcsNWJ32ZSDD2zIh6HoDfw436hGS1PZWw7vf9n
+V+G5X5yjB3yf8KJKMn/Oa7c/x2ElvGfr+UfqmM3/AWGv4j58vznILQB/+VY/p06dtn/Y56t
f4IkLJb4H4LehX9BFruLji37f4QxfsUfJ/jzApHK/f8hKN/UJCmjqhny/Tk+ypvarkZtR8t3
Q3njrKHCNk3B8CsYR0HiG39Wdss6SvpVKFv/3bDXYyn/nnQk8R+hN9Y/R1bqPzwRhHL9H4K+
/FFne+f6A9tSHCVeAOAUwAhAE/h18FAHf4Fare6Og6ALp2M46Qdw4E+HnT4c9WA7fS2MhjA7
IIN2CJMDslrqU2VA+C0oW//+L1P/EwhJ63+8UOZ/h6AZ/r9K/Y8IUhL/JURK/A9Bq/j/jPqf
IGX5P5G45Dut/4ll/e8gVNb/yvpfWf97V/2vrNKVVbqySldW6X5ClW5/9JGt/a46tuR/WBQW
z384lv9xRCRl/ncIWj3z2bUOAHYvHRxBCD+g6TM+lRBEGCYnhNwZQuxTe91AVhGH0FG1Wv3A
iD4nr16I2YcDBJ1xp2cE1QQRI4IQz+WiLy4ARMdMET7mwMXFUbXg6LxaeHZe3Xp4vorClt0Y
2Pp/zXyOt3C92s024MIZls64kw1T+m5J6Qzy5IxjM4gxk8DzJwsziE+PRTaFp8dSMocFidk8
awPvSNtAQd5W3d8ft9bUbcoJ1xnXksJtLGtZ4c+OFCWVVNJ/jf4F/gM7rgA2AAA=
--------------157031FE2E9195F2513E670C
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--------------157031FE2E9195F2513E670C--
