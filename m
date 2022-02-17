Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DADC433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 13:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C3DD6F6E5;
	Thu, 17 Feb 2022 13:46:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 47xHaWt_46W4; Thu, 17 Feb 2022 13:46:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 558B061B87;
	Thu, 17 Feb 2022 13:46:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A4ED1BF3C6
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 13:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 670C141E35
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 13:46:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B6hg2WsoJrrz for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 13:46:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D74D4027A
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 13:46:31 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id d27so9129004wrc.6
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 05:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UXBpy+cFNZIzaZdU3utEoXUPbCQr6eyZwu2udyLmGOI=;
 b=j2wk08EybOLhjf4L2h58S+yvgTw6hgEcufGTr4JrGujly2AV6TguMPmgyAV+dLVA22
 va3rsYYkjpA9qmI1udzoAD32Td5IQ+1/alXqqj38aENmEqQC7+9ObIFBF/GFK/hOnQHe
 4HSLbxZvIO5BRbb9QD0ve3DWTmjeL/dNXt+P1h5RqHZVdWcPGJ/+H8CUMsXd5MHxehMF
 0Jrw+KAnISYFyXpDU3Oacbd6xXnsF6/cK7NFhqH/v2RhJWP38xat8TgQuc2GImdpRPgy
 oEQjqjmAo1SZ7vaxfgL3V3qx+aYTaTZ/TXaf8AAF1+B8Z3i57HWYt1po2pN3oU5FutA1
 69hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UXBpy+cFNZIzaZdU3utEoXUPbCQr6eyZwu2udyLmGOI=;
 b=lXsL4OGEUKHfqPehS6/Q7PbT1xLjP57I7AJqebAzvI/rMQBgwXjp6nggzhRglwUIIm
 xj6zZZs2lWMloprcHwhQ0/SK9QSUAyXMfJ6dBjbvNYuhxipntRjqpboKXzZnAYY17U8K
 5HvsiOj4qoo97qPpgkpVy9tpPDaxynw+IoDHbTq+lkBbkL4w/35BCduxnxj7IVuSz0BC
 F+HGuB1ut/WdCL0vwTJIZ/q7xyEJieOKprlWih7VshS/MfRVCOfU8BJTHa/G0DMimsD2
 O0LKLECq3LdoP01xinS+fpd5kSuNEjqwNNEFjIXAmc0GNiO3qw14d5W4aSIUmRTkhTSp
 Dmkg==
X-Gm-Message-State: AOAM530xFE9FfjWC/nsjiSL9Xns6kOUNvKu9yk6V6hAzq7Y9ydrQ3tH1
 OoITLAebifywfE9ylLY5fNhEcTrMl6E=
X-Google-Smtp-Source: ABdhPJzepM0ImUXSDhbyLMpuu+zLDvky/Lb1M9XlLhjIp1MpS/0XrRQs1E0O2UheJcREDg5Ju2dRFA==
X-Received: by 2002:a05:6000:1847:b0:1e6:2783:b3e6 with SMTP id
 c7-20020a056000184700b001e62783b3e6mr2363103wri.163.1645105588895; 
 Thu, 17 Feb 2022 05:46:28 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id f13sm18006695wri.82.2022.02.17.05.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 05:46:28 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 14:46:37 +0100
Message-Id: <20220217134637.3728619-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5base: put back riscv32 patch
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
Cc: Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 5770a645a3a49a3f0f02972131a4ff5283b4c11e wrongly removed riscv32
patch resulting in the following build failure:

In file included from thread/qmutex_linux.cpp:45,
                 from thread/qmutex.cpp:806:
thread/qfutex_p.h: In function 'int QtLinuxFutex::_q_futex(int*, int, int, quintptr, int*, int)':
thread/qfutex_p.h:116:30: error: '__NR_futex' was not declared in this scope; did you mean '_q_futex'?
  116 |         int result = syscall(__NR_futex, addr, op | FUTEX_PRIVATE_FLAG, val, val2, addr2, val3);
      |                              ^~~~~~~~~~
      |                              _q_futex

Fixes:
 - http://autobuild.buildroot.org/results/ff90bc7680acf1487ed58e5e25cf1a5f13dfaedb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../qt5base/0007-Fix-build-on-riscv32.patch   | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/qt5/qt5base/0007-Fix-build-on-riscv32.patch

diff --git a/package/qt5/qt5base/0007-Fix-build-on-riscv32.patch b/package/qt5/qt5base/0007-Fix-build-on-riscv32.patch
new file mode 100644
index 0000000000..5561acb9ae
--- /dev/null
+++ b/package/qt5/qt5base/0007-Fix-build-on-riscv32.patch
@@ -0,0 +1,46 @@
+From 035dc537bee26e3b63a211b2835d8560439e161f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 27 Aug 2021 16:28:32 +0200
+Subject: Fix build on riscv32
+
+riscv32 fails to build because __NR_futex is not defined on this
+architecture:
+
+In file included from thread/qmutex_linux.cpp:45,
+                 from thread/qmutex.cpp:804:
+thread/qfutex_p.h: In function 'int QtLinuxFutex::_q_futex(int*, int, int, quintptr, int*, int)':
+thread/qfutex_p.h:116:30: error: '__NR_futex' was not declared in this scope; did you mean '_q_futex'?
+  116 |         int result = syscall(__NR_futex, addr, op | FUTEX_PRIVATE_FLAG, val, val2, addr2, val3);
+      |                              ^~~~~~~~~~
+      |                              _q_futex
+
+Pick-to: 6.1 6.2
+Fixes: QTBUG-96067
+Change-Id: Ib6a9bcc496f37e69ac39362cb0a021fccaf311f5
+Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
+[Retrieved from:
+https://code.qt.io/cgit/qt/qtbase.git/commit/?id=035dc537bee26e3b63a211b2835d8560439e161f]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/corelib/thread/qfutex_p.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/corelib/thread/qfutex_p.h b/src/corelib/thread/qfutex_p.h
+index 40482b6fc1..037207a5c0 100644
+--- a/src/corelib/thread/qfutex_p.h
++++ b/src/corelib/thread/qfutex_p.h
+@@ -103,6 +103,11 @@ QT_END_NAMESPACE
+ // if not defined in linux/futex.h
+ #  define FUTEX_PRIVATE_FLAG        128         // added in v2.6.22
+ 
++// RISC-V does not supply __NR_futex
++#  ifndef __NR_futex
++#    define __NR_futex __NR_futex_time64
++#  endif
++
+ QT_BEGIN_NAMESPACE
+ namespace QtLinuxFutex {
+     constexpr inline bool futexAvailable() { return true; }
+-- 
+cgit v1.2.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
