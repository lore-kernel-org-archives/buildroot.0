Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BADC4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 20:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8609061098;
	Wed, 21 Dec 2022 20:03:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8609061098
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nVtLKZ1X8SGM; Wed, 21 Dec 2022 20:03:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D07BD60BC8;
	Wed, 21 Dec 2022 20:03:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D07BD60BC8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 831061BF420
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 20:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CF86409B1
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 20:03:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CF86409B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ucyVMrrTeSYB for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 20:03:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FDC4415EB
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1FDC4415EB
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 20:03:31 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id h10so16023410wrx.3
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 12:03:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YBx1/Ck2f7QDZOLdufE0hbhlqVQpiw87HR5S63X8gyo=;
 b=heBjYOrPEtYal1LQd3pa99lZQTUojnD1fwhqDZNFs9+Oa3WysQx/vs4kpPOArIlbG7
 5cjRANuXhiOzmxJz2BXB3X7I6RnbMmlle3d6wA9/r1suPj79vz7/OTwxDXydcl2muGN7
 HIvq2ifCJbgsBWnVxEVZsRdmx65Z4u8yFnXms17hBcLKEFZ77jmxtS37GGxduZP9A+7+
 FW+xYw/pGV7sHgz4Yp6YnOdDhAT/wC8ZxDacBxmyIffyarwl5xq45K98oNy3LadEVPzo
 jRIbJCJTw5LDSyRxpIn19EW+Z/lkHbSuBCgt/+sId1dAKYPkv05wnK0S0DCqJ+6DajsC
 ntxA==
X-Gm-Message-State: AFqh2krZ8sCbQG5tstjg1277yAyC+k6WZREFgCah8EZCBrJ+LhcYSHXb
 1H2zzAbtvD/NyToygO6MzZSrgU1lDxAGLQ==
X-Google-Smtp-Source: AMrXdXux2g+pJSCDVeig392Z9jIJh8cukFan3ffaO++mmJJIR3PUBlBqIrriUQHU7WyjSH1X/wuNkA==
X-Received: by 2002:a5d:5101:0:b0:269:13c5:d588 with SMTP id
 s1-20020a5d5101000000b0026913c5d588mr3937266wrt.27.1671653009867; 
 Wed, 21 Dec 2022 12:03:29 -0800 (PST)
Received: from gleb-linux..
 (cpc76906-dals22-2-0-cust400.20-2.cable.virginm.net. [81.106.81.145])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a5d6149000000b0023662d97130sm15885165wrt.20.2022.12.21.12.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 12:03:29 -0800 (PST)
From: Gleb Mazovetskiy <glex.spb@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Dec 2022 20:03:25 +0000
Message-Id: <20221221200326.2420013-1-glex.spb@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YBx1/Ck2f7QDZOLdufE0hbhlqVQpiw87HR5S63X8gyo=;
 b=FEwk1hwmj/eyimbke+BJIy9V7gF0Y+YYuBVSTq0NRr+q8ETszCkULys39GcKiCHEv+
 tm2pj3tHPQH85oRreAvsfZROXJIcKzUoU464K+VEtX7vc4Ks3L6WiNNtpQFHDnfbz/3N
 UT4dvf4+kaShZBkaWDWDjS7QB9PheobRa26l88Ox6Z8qYBU1XIz3Md/w5jd1kEY3GMSE
 9O6tPYx1LnxIGELTCPl7hbjBDkNT+Rrsmy7N1r11J7TJ1y958JfehZPeysZZM5zzWH6N
 hoLGqXHJcITnm3yD0YDDQD93+zyC1SBYgUTT6h8ziHXKpVjH1OkMG2c0FXzkadTotGG5
 UpIQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FEwk1hwm
Subject: [Buildroot] [PATCH] package/gcc: fix gcc12 with uClibc
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
Cc: Gleb Mazovetskiy <glex.spb@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

GCC 12 produces broken binaries when used with uClibc.
E.g. `gdb` crashes on startup.

This adds a patch to address the issue.
The patch is from:

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=105730#c8

Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
---
 .../gcc/12.2.0/0002-fix-condvar-compat.patch  | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/gcc/12.2.0/0002-fix-condvar-compat.patch

diff --git a/package/gcc/12.2.0/0002-fix-condvar-compat.patch b/package/gcc/12.2.0/0002-fix-condvar-compat.patch
new file mode 100644
index 0000000000..9bbd481dbe
--- /dev/null
+++ b/package/gcc/12.2.0/0002-fix-condvar-compat.patch
@@ -0,0 +1,33 @@
+--- a/libstdc++-v3/src/c++11/compatibility-condvar.cc
++++ b/libstdc++-v3/src/c++11/compatibility-condvar.cc
+@@ -67,6 +67,22 @@ _GLIBCXX_END_NAMESPACE_VERSION
+     && defined(_GLIBCXX_HAVE_SYMVER_SYMBOL_RENAMING_RUNTIME_SUPPORT)
+ namespace __gnu_cxx _GLIBCXX_VISIBILITY(default)
+ {
++namespace
++{
++  std::__condvar std::condition_variable::* __base_member;
++
++  template<std::__condvar std::condition_variable::*X>
++    struct cracker
++    {
++      static std::__condvar std::condition_variable::* value;
++    };
++  template<std::__condvar std::condition_variable::*X>
++    std::__condvar std::condition_variable::*
++      cracker<X>::value = __base_member = X;
++
++  template class cracker<&std::condition_variable::_M_cond>;
++}
++
+ struct __nothrow_wait_cv : std::condition_variable
+ {
+   void wait(std::unique_lock<std::mutex>&) noexcept;
+@@ -76,7 +92,7 @@ __attribute__((used))
+ void
+ __nothrow_wait_cv::wait(std::unique_lock<std::mutex>& lock) noexcept
+ {
+-  this->condition_variable::wait(lock);
++  (this->*__base_member).wait(*lock.mutex());
+ }
+ } // namespace __gnu_cxx
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
