Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7C7CC6B2F
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 21:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58D9240352;
	Wed, 14 Oct 2026 21:10:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s6Ms_FKmyXNb; Wed, 14 Oct 2026 21:10:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4F2DB407E7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792012257;
	b=SQUrXJIjUK1MoCxqqOsLgmw8cURGFb4N3oxP9jHlhjvL0HS/Pd9Mqm84W2Eg39YFyB8R
	 oqYYK3F0xBSQYReUDwdIpQRej8oWd1pHfSme2qGlR37m4Zlz5Uaj61XAFfqK4zA3z9D3e
	 WOguVKkZGl28gGJCCshTVb8uLqKJx3qFwKam6e/IqIZ72neL/hHjm0/BnbA7ZhfnHpaM4
	 cu5cJzrqho5+msbW1rf+C54vIIJpo43nrZYOId31KmdAbL3FMTd0FmWt1PHFa21m+LFlu
	 GHJFo0LzJR83sWbXuBjC+1Itmw7GFz7UYfPShuQItEB0J3/lB8SbZiHsAeD7GAkSCWA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792012257;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:X-Google-Original-From:To:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=MlBwb+/cizoZ+By6wpPDWoOUJ5KdN4V3RkX1WXVFIq0=;
	b=W7Hlam6IQWQbzaR5rYlvxXWsd2PGzaEqqx3+6BFJwWj1MXr1dQ/xzvKVfUTHbXraPTMQ
	 IuHpWfyk/S466lj671675uF79dhWBP65NZ6abdVz0t3O/DQXgonC7feKTlit6GEChKaoO
	 jrcS5XydQUXmEivAAHYCgZmnmRVdGGJPHJMrtZZ+HKYtp+IPc/QZpUiC3SIQI+GbrRcn8
	 izC8AC72z7neRPN75KSlTXlU+OSbpr1R4lkmJ5hjUlMjYw6BcsbQqXgJ3vSDLsnwBOywO
	 wX3Yhe9wfwX1pt7sM0/V2XaLSKh2pgr4W0WR7+8Jmt9cqzX7Y5+9HAwak580pJj2VBA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792012257;
	bh=MlBwb+/cizoZ+By6wpPDWoOUJ5KdN4V3RkX1WXVFIq0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kU9xGSkRebiDgXW61zCahTywBhM0PMqBlDuMuIQvTTBGqHyk1Q5RnIDev1AceviHI
	 59vojCXQNfEZN2dmsEH51tUxwPz0TAyP/JX0wxCW9yrB62MLwegHS6KB5LQ/fNUEiK
	 qSG9kornWqWjMF/qNm4+MLiz+IBFpRMAySGobaYWYMLLc5x4Cot40ztjuvKSyncNCC
	 ivyZi6VwhufUsDIl/9V0phwIo7z+PR3CzEUUD52pGEXv/Qrfv46AimA8NKYoSiEOtp
	 rRMXoxmH+QLRq9muA2nl2awIqhEbLEyQY4gUlPw+rDhVqU737VA6kqIQpsawk5MLqN
	 CyLUnfiIcRVGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F2DB407E7;
	Wed, 14 Oct 2026 21:10:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 417F51DE
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 21:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F83A80772
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 21:10:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1wF8MBVkyX_J for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 21:10:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 146BD80741
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::62d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792012255;
 b=KulwHCEaNtcAy2d5psfgMeBBp6R8EeGvbJ60vT8dE0P9WvrbOnO0Xe7L6pzYcvw16jfl
 cSIh8t0xgJf+wOvEpAO5APJiK21qbs6bxypQGsPGlgNjVPYhDDmtdRsl8YcNox5oFUq/k
 8+ZRzSQRd6PqbXM8VSrmGAZsxnOJVAX4hW/O2eE16zNIhWb7psYDJyW57Bw1zuL9PP9+/
 JIvMp4yWFQyIScdtyC8WZoQ3OtFJNPLderotmBF5bMfItEiE7ls1F/reFSzlD6XA8LEYC
 gjzAxQpCxedFcw1wXJv+l6a/Iaf6Pn5YkxNgl0mQparM8s/BpRRDO4j3Zh3h2ZdofwA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792012255;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
 bh=fYFdePi3cDHimbadWu23kprj7h5iLXt/l8A6vkoEkIs=;
 b=hBllfTzY6S8Zd5vRiHw8CaqT9P86lwiLBKCKRXDZ6S/K+G35FO260zz+F297RiOt7wP9
 u2cJ9AUFkgLRWO6DkuIkbec/ffaonMggzNKYRsoEBXMX8koTuGAmJkfQGm/fd+4uyoHQQ
 60kbd/WRaz/Ygpz8EI+j1doW0bPTrIOZzHjzPXqC29i08Ot31iag1pVS1rUlaehm/gYrG
 IG5obhiFnPaLa3A2PvpOUzA0TVIbY+7R+tQIKLMNdIWEN88fL2XIUWPitez2qBLpinzz3
 50/aPPwNS42oj3sOfTZRc+YAU7BO8YqPZ6nEbp4DTwIPfVwo6LLpNMnhU70e0a7/nuA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=pJ87FV+I; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=pJ87FV+I
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 146BD80741
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 21:10:54 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-c247f6687dcso702504466b.2
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 14:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1792012252; x=1792617052; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=fYFdePi3cDHimbadWu23kprj7h5iLXt/l8A6vkoEkIs=;
 b=pJ87FV+IofkXM8LH86H6fr3f4rvMD4aIG7Z+jOdczelXrmJZRvqNLDZVIOAXewfDgo
 1MVojE+VmGPbQ9GCIC5KOZnvp1LNstHsw1OyxA+T9P7B3E4J/QrulJYm5xBznlZDC6SE
 j5ayY8/c047lLz9JRjYoKCkkeKRGBiSaJ5ao38lSzzw1HcjyAG9laQ2COWBU8C8aplu6
 8wb8Bws2aAEu7m5e/OFGb/S6ZjnmKsynDFwPDddz17dzvkdx+cZgUKRbu5vXmBxyFfLE
 ps9LxaBRJiX0MF5Rt4LHDB+MZCCiBfHNoxapVewHyyF0kp9wk4+RH43jyEWp+XHH5Vvs
 bpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792012252; x=1792617052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=fYFdePi3cDHimbadWu23kprj7h5iLXt/l8A6vkoEkIs=;
 b=VuEebHdyzmRrZTlt24Pf+5qe5Uoo8Kqt0VbGh7JmdnV+Ay9dLhEzXUorCc1PWH+HR6
 ok1x/NMZ91xxIEYNOCIPZ2ZSMwncwN0Oyp17IpzDvPf5OizX2KsAzxvCeM/IA09vA5GD
 YLAVWCHvCurBB4CQjolY/whtFiQsOMchg23q192Wm4WfBVgwqqJqBsM5xB+hAnUoFXCw
 lxIHfkUVieFp2n7QzQsWieYvqjryxMKJ+RfmXlLBjZzkUX4uwQRatRBo5GAMQf8WJpmO
 mJzBhJ4TCr1yfNBoYGvmiap5l/Zg5z2oXZbFZBncMOQv5AyLKxhSIoAB2OPEs8KTjJof
 /NYQ==
X-Gm-Message-State: AFq9FYLzAgRVPb5ZRqgmE1uFMepVEUDtsSmeIoyvyEPZ4J/znLt513xG
 +jiGOFl8KVHa3T0IFFcma9Oe4vvk0LL7i6no9wb8n1mp5RhemdW0PhkHkxRq+g==
X-Gm-Gg: AYBFou3Jjc6Kw6BWUkf5Eug5TflbVLv1Tef4nuC0sfT/aBeWLkXaSXUEat3BArN1H8F
 j2hlyJuQQ5c3/bWupBEPvtb9iMwBloVDDG0bFvoQW16hZdwgFWvjsas6AR5HQjOw1M9lofED+nH
 WypOQH0/Xg+ff6bSclqjTCZAe3fXksAcfwXvUlfkhXP/PhqO141znPc9BXoHrAVs6zBQpfFGgOc
 5zpy9MO9oRTVTBfe73M93CeXkLlXDV/9D4K8kIyzd27qNIWufg9JKBjBseY3z5MQDK0gio5jHIl
 x8L5Msy6zkdrNNWagR5hdp06j1aBmQochp5JGKPqzY91hRMNiQjEWIlBGbao4VgW1oZjV5KOWrh
 NQjGqjrcJyZzKqukM8ufAvhhDZZQpP/Xr4aSr8selY7KpJ1R+6nXt4qS6RgdiTvLUyJUS3d8pHX
 Mf0muEHNQfgeeAaakNjWD8jsMV5l50lHXZSPrzwmUCDmCxRe8+5R6HT0tPjenTZCnqPuF16FH6o
 PNujmR3GKZ2kK3NlG2kcdSNPoCsiVuOMV+nha6m69K4plSa
X-Received: by 2002:a17:907:9686:b0:c1f:983f:d8a with SMTP id
 a640c23a62f3a-c31aa017261mr1735866866b.24.1792012252308; 
 Wed, 14 Oct 2026 14:10:52 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c3ed9f479b7sm31857166b.46.2026.10.14.14.10.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2026 14:10:51 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 14 Oct 2026 23:10:48 +0200
Message-Id: <20261014211049.490297-2-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261014211049.490297-1-yegorslists@gmail.com>
References: <20261014211049.490297-1-yegorslists@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/3] package/python-zlmdb: don't install the
 vendored flatbuffers package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

zlmdb installs a copy of the flatbuffers runtime as a top-level
"flatbuffers" package, which conflicts with python-flatbuffers that
python-zlmdb selects:

  FileExistsError: File already exists: .../target/usr/lib/python3.14/site-packages/flatbuffers/__init__.py

The overlap has been there since the package was added, but it became
fatal when setuptools packages were migrated to the pep517 installer,
which refuses to overwrite files.

Add a patch so that zlmdb doesn't install its copy and uses
python-flatbuffers instead.

Fixes: https://autobuild.buildroot.org/results/e3b026cb48f41ec531e5bdae9e07b8e581f1a06b
Fixes: 8937db8dd595 ("package/pkg-python.mk: migrate setuptools to pep517")

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5-5
---
Changes v1 -> v2:
  - new patch: minimal fix for the flatbuffers conflict that can be
    backported to the LTS branches instead of the version bump
    (suggested by Thomas). Tested on master and 2025.02.x.

 ...all-the-vendored-flatbuffers-package.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/python-zlmdb/0001-setup.py-don-t-install-the-vendored-flatbuffers-package.patch

diff --git a/package/python-zlmdb/0001-setup.py-don-t-install-the-vendored-flatbuffers-package.patch b/package/python-zlmdb/0001-setup.py-don-t-install-the-vendored-flatbuffers-package.patch
new file mode 100644
index 0000000000..608074ea51
--- /dev/null
+++ b/package/python-zlmdb/0001-setup.py-don-t-install-the-vendored-flatbuffers-package.patch
@@ -0,0 +1,37 @@
+From 18c4d2d3c7c0c3104e9280ea717c68a5d8f1368d Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Wed, 14 Oct 2026 17:52:45 +0200
+Subject: [PATCH] setup.py: don't install the vendored flatbuffers package
+
+zlmdb installs a copy of the flatbuffers runtime as a top-level
+"flatbuffers" package, although it also depends on the flatbuffers
+package (install_requires). Both install
+site-packages/flatbuffers/__init__.py, so installing zlmdb on top of
+flatbuffers fails with a pep517 installer:
+
+  FileExistsError: File already exists: .../site-packages/flatbuffers/__init__.py
+
+Don't install the vendored copy and use the flatbuffers package
+instead. zlmdb.flatbuffers (the reflection code) is not affected.
+
+Upstream: N/A, since version 25.12.1 upstream no longer installs a
+top-level flatbuffers package (the runtime is vendored as
+zlmdb.flatbuffers).
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ setup.py | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 16ed0cb..571615a 100644
+--- a/setup.py
++++ b/setup.py
+@@ -67,7 +67,6 @@ with open('requirements-dev.txt') as f:
+ test_requirements = ['pytest', 'pytest-runner']
+ 
+ packages = [
+-    'flatbuffers',
+     'zlmdb',
+     'zlmdb.flatbuffers',
+     'zlmdb.flatbuffers.reflection',
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
