Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C27CC6B38
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 21:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD5A740912;
	Thu, 15 Oct 2026 21:52:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CnzxjusgWlEl; Thu, 15 Oct 2026 21:52:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9DA5640866
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792101152;
	b=VTNP75FcdXV7fz4p3oJB+25LhOUeBKbfKuoY/ZaTf1yJQ7kIjWD0ohqSBezjIdZnFhrG
	 5slQVkezjeSvbX7sav/6xzcTJ4ME7QremHQnwXXIp6m3CAWwynclw/tRnkN0p96jmIclA
	 mrHzoTY35QfmZZYL6rKLjypBLcuxLKhiu9anWf3V37Wcow7Tz/8kWSYWXcTcYD/1fx6WQ
	 98mAn2VO6VXz2sIaXZDSXeLyqaGpMzTvGZ/bOUGRvqEcmlaGnWSGtD7af2dfb8t6hCBd0
	 AvhrYkRYCvHkMRcFoEeSRcr7HRMvupFxdfG6x8t8oiO5b1fTaOjn89rGQxrtEyTVicA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792101152;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=T+7WdWDgB2L7qiNUwiPGcDNRx171HgkFcKGqZIGMKJ4=;
	b=f//mPPm+Ty9l99J+5wt8NDFm1wc5vI0H1pZtsBKNvlNvZ5/VWPALiKD45MVHVFXloWTc
	 jRnYYqn9GmjJSVZkMU3nv9roWWcqfk9Oq3J8HpoN5m56SVB70HMvsSHKPgU+qj7m9f1An
	 Bvm+0STkZ4w2BMg5n2SNKW2bHJRWbN8bL53Tx3mw+GGowCtNflEuP5cat9HfZ4cJyUOaU
	 aDIushXCE377KKCFAvg2teGSGEL8+Kpcf48Q+B1w5IPDrH/sfgdFT8Swfe4/nT4IOGOeD
	 1omO8xgUDynx9EyOOR5RRjK096YfWteMFPhm2b7bGCUKEFsimQTnrZ4zprQNUrn4Nhw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZieixQ3m;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792101152;
	bh=T+7WdWDgB2L7qiNUwiPGcDNRx171HgkFcKGqZIGMKJ4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=AEB7ZlC0p4IE15LNoNtX+YARrQwMdIk+g5FkS/I16ORYwrJX1suYKqAPoEMt4bFLm
	 5rUHmwa9Kbgwqwe1s0mmqjSEvkh/o+P8fjnUwF2SRb2z5EiGnlAZxJBpUUtxn6+GGu
	 IXQWGyDY6wGOZRv33AgdUIYce/+RQOgAg9BkwdofU/0qQtovqi804kQpeV7NZyozvl
	 oO2M2bSmO73+HCPsxcRX/lI7E7Y1ygLDLXLmYvuOimOUICLdTPcqlmgmc2IHhfEfcV
	 3sOomIYsaGP86Vvvrba0sfyHOTeDrnYKPYtO/nem9tv6p3TiXrPVt/QxolUeFH//T3
	 TaGV/dYA8Q0Pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DA5640866;
	Thu, 15 Oct 2026 21:52:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A0E99332
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92E1F4092B
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PBECdYCq5UdZ for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 21:52:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9F98F4093B
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::331"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792101148;
 b=qP3aNnf2T/j/yd8bdVjt9CJSrrZoMdyj/nOzu23E+wBGvAwcc/tlTTIgHwtlJHwwuZDd
 bGOXLjFn84X8+a9RFVJTpBbEsGsd0NH2wap4rOyICv7POFExHpyLr6Vsnls995ZrpP66x
 otU25Zw9a8LwoRPEiJs+EoGlUj3BAXEYNPowi4H8wZ3/jkpJgzrdDY6o+/EaTnMYZeoEv
 cgZeNazYjup0gcZRdAbiu4piGnRlZPKNNdFzco2mNBS5TFUelfr9/NiYp5snFg7efICTq
 NS1/3HniJQJoUh1kzaHHN7IcTuklrBgq8o5QHf89v1eGx2v25pGYeR6xd8Ky3+Zd2Rw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792101148;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=HavnnPCC63mAwLUWPgA0PPywa/sA5gwyHoltIodaoA0=;
 b=n1njfa9xCS2HriaWsqyfr9tuIPvx1xZwmdYyEyI135amknuolkMasAKdjiJuhcGke8bs
 khIY9S50JqNqwPjVMVuk10F22TwAog+gsH31rWKUu+mlhgLnjV60Kqsltd7AicFdrI3pn
 F504Uw46+OG77wNHPT7OCt7NeWVabRFhtPJUNfOTClNBW1YmOIA7D4ugSsrIYUHYLo38q
 fvcORvElWOOOQohLSujnc6Fd4idYqgXkndVzJQ22hVV5/Pb/OeccKCoPwQAohGZ1WF22B
 YFlxCio7Z0S/1yMpCUjPvwpvB9Vc+lSJxl74b6eqTK2icgj3k0cuhvt/fbkVScsBmoA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ZieixQ3m; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::331; helo=mail-ot1-x331.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ZieixQ3m
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F98F4093B
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:28 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-822ddb835fbso4192080a34.0
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 14:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792101147; x=1792705947; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=HavnnPCC63mAwLUWPgA0PPywa/sA5gwyHoltIodaoA0=;
 b=ZieixQ3mwxX6KK3ucbHp3uYJr6WJ8K0rW8KWP+S2vUGjfTw/mQgEKgiyo9D3XqW9Jn
 +fu6vAMpMgGiMQCLS5TDtDoNS5rRjMrhmZzqDd1tAa/+xzn4uIoii2QFNf4FjT76+sAt
 Ss2bR3ozzHgv9IW0KnEDVmcg9F2nmhO/ORkmmkvYfIizZtE9oxTJdm03g9BFyedn9zrw
 4hhoIkvTykXi6WQ2OmxRqJaXbvOitBYaj++fJ4G0clETeLzlOmNeOjNeXx1ekLGkoQB8
 8Q/AyNbBT3eBHPHU72Z4bXV/FxzTlKntg8LOnycmZgqsl6S2uQ7twa0NoaJPBrfbAyXH
 iQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792101147; x=1792705947;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HavnnPCC63mAwLUWPgA0PPywa/sA5gwyHoltIodaoA0=;
 b=zTXxb0DWZX4+KL6fnfmjgwAiXmA7XMc68J6hv4L9oLlcjcs9RnFIjY/eUi4Gz3opkt
 g/71vAldfgCCuc2tpK16mCZPRjvtVgC5nX803ujS+AuRgij6iJyfNJHXjqA21VfHyDtD
 XFKboEmUX+aL7KPOWM7DhIXnai2R3nO3sl35uGUBNiGuGwvXyBH/Qe6hJtp/IJrZQPPJ
 fOQOeOBRX3rDaK7urUsn35PnG4brp6KxomPe9DcW68nNv93idFxf5Rm/YYpD+FGKdwzC
 RbIlXyN8BJd2eUSjijdehNZnvpYxnyCW0DIqmRraNiC/GQV1xQ+coM1EdQJlCfaQgYmL
 7VYw==
X-Gm-Message-State: AFq9FYLY5Nf//mNlefX1T2AtdVx05y6EdSCG2h7fwM99/G8HCwKk1hcp
 iraDVYiebqwJJ1dnEMfg/psNeaKC/6vhQ83edf5ep1pZJ9aBhhqK2mBVJ/JzYA==
X-Gm-Gg: AYBFou3wKv4u5XsB6P76wyc13cwSB5VZ+v3ch02/qWR2o3sNmt/EiN+F93wfbcPrhle
 r9uV7uo8m78GjioCK3TDeT26TH/kIwuxXE6sGCGLyg16pmHIJhjk4w2L3sZzrNv6OT7jiTgkJbJ
 C8Nua29K2NqIYsywZhT6EGNwV0RxzG23uoBCBs6GbjQT9D88D1yCX/PNt8JQLUkMr6iWlW8J/up
 xa8V0zcmC08RJaTuD/YTk6+dqWYaUa6jTu7Qau0FZbNSKCcVrMLN+cjBrLZMXzzZEUOGyOprPil
 xpbhCSj7w2XuDfkYsU2yi0CWjlT2P3ACD/6fEuc1HDHQnWoS0bsjTuvdNlxaSaktXTugIXJ80Zb
 MWf4MFOBT25fkzC98LLgxkn7oi/bDG7WZ2mckEHlUvNG1KIm14j5Lsqf8pUosLqsQQHTi11iJWy
 0CiWxCq3mNEQq/1b9iLWPYIdWULpCtffKubJ7iUHOgx5czWlPB5KQi+ClUxe8BDwIJ55/96IZG0
 cUJ/BLFZKGsaMYIm0mrw48NOR/jbMDG2WZ02rdfwl/69a+ERJKb7+kFBYG3O6tueim9lBTwWAkx
 NmI3x1cmV9n5luoZAlX612uz3SwoUCFtGPwBAww3z+INB1IbNl8G+k0mW65WUEJDQnTs1MSRwmW
 6zg+sCX0LrPJKnCvSF0hfZI+r7ELkWgo9KyBonHwsNak=
X-Received: by 2002:a05:6808:5093:b0:4f6:cda3:ec05 with SMTP id
 5614622812f47-50c56bf99damr19918412b6e.55.1792101147260; 
 Thu, 15 Oct 2026 14:52:27 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-53874e0e65bsm145114b6e.0.2026.10.15.14.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 14:52:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:51:45 -0600
Message-ID: <20261015215210.3426895-9-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-pluggy: bump to version 1.7.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pluggy/python-pluggy.hash | 4 ++--
 package/python-pluggy/python-pluggy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pluggy/python-pluggy.hash b/package/python-pluggy/python-pluggy.hash
index 94a20accf1..4a330a99b5 100644
--- a/package/python-pluggy/python-pluggy.hash
+++ b/package/python-pluggy/python-pluggy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pluggy/json
-md5  54391218af778acb006c2d915085d469  pluggy-1.6.0.tar.gz
-sha256  7dcc130b76258d33b90f61b658791dede3486c3e6bfb003ee5c9bfb396dd22f3  pluggy-1.6.0.tar.gz
+md5  857ff9374965f8d1cc422941608746c3  pluggy-1.7.0.tar.gz
+sha256  d1eaa46ebb595891b860ab086b4d09c8588af65ebd4361b8e8f4bb8920b90ba8  pluggy-1.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  d6b65e6c213a5d0b577911d34d6e5949b9f59d76c238c5071a2f3fc16cfb2606  LICENSE
diff --git a/package/python-pluggy/python-pluggy.mk b/package/python-pluggy/python-pluggy.mk
index a5d8f5e94b..798a407bfe 100644
--- a/package/python-pluggy/python-pluggy.mk
+++ b/package/python-pluggy/python-pluggy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PLUGGY_VERSION = 1.6.0
+PYTHON_PLUGGY_VERSION = 1.7.0
 PYTHON_PLUGGY_SOURCE = pluggy-$(PYTHON_PLUGGY_VERSION).tar.gz
-PYTHON_PLUGGY_SITE = https://files.pythonhosted.org/packages/f9/e2/3e91f31a7d2b083fe6ef3fa267035b518369d9511ffab804f839851d2779
+PYTHON_PLUGGY_SITE = https://files.pythonhosted.org/packages/bf/db/7fc19e6f2dc92a966727031389fc2e08b558f0f25eb7403c1119ad4713cd
 PYTHON_PLUGGY_SETUP_TYPE = setuptools
 PYTHON_PLUGGY_LICENSE = MIT
 PYTHON_PLUGGY_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
