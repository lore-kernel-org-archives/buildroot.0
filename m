Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F347EC4332F
	for <buildroot@archiver.kernel.org>; Fri, 23 Dec 2022 17:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A1D6600D4;
	Fri, 23 Dec 2022 17:49:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A1D6600D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z6xkoHrKT0BH; Fri, 23 Dec 2022 17:49:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72D92606C6;
	Fri, 23 Dec 2022 17:49:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72D92606C6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 544161BF3F7
 for <buildroot@lists.busybox.net>; Fri, 23 Dec 2022 17:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C750401CC
 for <buildroot@lists.busybox.net>; Fri, 23 Dec 2022 17:49:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C750401CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BldhgCjjIdw9 for <buildroot@lists.busybox.net>;
 Fri, 23 Dec 2022 17:49:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1EBE400F2
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F1EBE400F2
 for <buildroot@buildroot.org>; Fri, 23 Dec 2022 17:49:27 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id a17so5152326wrt.11
 for <buildroot@buildroot.org>; Fri, 23 Dec 2022 09:49:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8Uwe2oMPfwGip9MI8zzenFyPnXBpBfw31dgBzbai1gY=;
 b=wzN1SWZS2lMCh3eQxJMrMBHiM66KWOZjQgW9LZAywTa7rSg+mTSGUWDSh7AzoOiLF0
 Plq/RTJ6C26igMH1OxTzm7gv6/L69rQ6cbRgZGQAw5sE/D8Kb5ee82SERgS12fQb5R37
 nUgX/OnMTUX6/eplopBNPeUdEABeHLA6koybsSgJz1COsXtGU0I+bOSpK2a4IJ9XhhN7
 /h3l8+9M4KWvRgDGSCNwit6BSawD8SAl7vTHCLeODkfPJ8l811YnP0iuB62BjkyH5TBd
 RMzObztej6lbjtUKgt9DYcb5rdUz2hxr/uJNkRrgZf5U/QvD4aoYsDpXeUVhrvB60MDe
 xVng==
X-Gm-Message-State: AFqh2ko969m/AVvpmzNZOrRmVmhe4IQ6CQDbrnk82B6sEeW3xex7/xC4
 DRHZP9ncXiYVXiNW9XPkgonMzwjCleZxsw==
X-Google-Smtp-Source: AMrXdXt2L9Zr185tImpD8hbeSiBuGtfUgTWtENIZmjuP9BFfzQ7HMMVmcw6zhYw53H3dRgT82tK5tA==
X-Received: by 2002:adf:9dd1:0:b0:242:f3f:28df with SMTP id
 q17-20020adf9dd1000000b002420f3f28dfmr7226576wre.58.1671817765711; 
 Fri, 23 Dec 2022 09:49:25 -0800 (PST)
Received: from gleb-linux..
 (cpc76906-dals22-2-0-cust400.20-2.cable.virginm.net. [81.106.81.145])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a056000181100b002422202fa7fsm3480417wrh.39.2022.12.23.09.49.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 09:49:25 -0800 (PST)
From: Gleb Mazovetskiy <glex.spb@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Dec 2022 17:49:21 +0000
Message-Id: <20221223174922.12131-1-glex.spb@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8Uwe2oMPfwGip9MI8zzenFyPnXBpBfw31dgBzbai1gY=;
 b=aKLGeYi7z9irroCORKixorajc1728M0VaJ5B3jFy9pDyoS7he8kZrGDaWWbZJaM5im
 4AgTjd6m5Dy6eyUZjq7eE8S5qxkDtavEaakHlvYOchPNZCed2ZDk2qmnttxKA/Ic5gGL
 o26tDfxnAit0j8OiW9cNUY1+wmsqx8m/k+4crIYjIHWuDM6Tu8w1ly2bkHaECARxlEqW
 NZbvmKKNJDnAmxJ5O1DMySaem95slX3WipV3d6rjOjgbUQhfbIio1IVEJuhBwPxCdaso
 /kOF7IlJae+wzRoUQid34UPyLjX03CTSHVqOERWRPJluugbaYr3mojkwotD0dPTILeP6
 J20A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=aKLGeYi7
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
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

GCC 12 produces broken binaries when used with uClibc.
E.g. `gdb` crashes on startup.

GCC HEAD fixes this in:
https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=ee4af2ed0b7322884ec4ff537564683c3749b813

Adds the commit as patch for GCC 12.

Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
---
 package/gcc/12.2.0/0002-fix-condvar.patch | 80 +++++++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 package/gcc/12.2.0/0002-fix-condvar.patch

diff --git a/package/gcc/12.2.0/0002-fix-condvar.patch b/package/gcc/12.2.0/0002-fix-condvar.patch
new file mode 100644
index 0000000000..b5575e5df2
--- /dev/null
+++ b/package/gcc/12.2.0/0002-fix-condvar.patch
@@ -0,0 +1,80 @@
+From ee4af2ed0b7322884ec4ff537564683c3749b813 Mon Sep 17 00:00:00 2001
+From: Jonathan Wakely <jwakely@redhat.com>
+Date: Thu, 22 Dec 2022 09:56:47 +0000
+Subject: [PATCH] libstdc++: Avoid recursion in __nothrow_wait_cv::wait
+ [PR105730]
+
+The commit r12-5877-g9e18a25331fa25 removed the incorrect
+noexcept-specifier from std::condition_variable::wait and gave the new
+symbol version @@GLIBCXX_3.4.30. It also redefined the original symbol
+std::condition_variable::wait(unique_lock<mutex>&)@GLIBCXX_3.4.11 as an
+alias for a new symbol, __gnu_cxx::__nothrow_wait_cv::wait, which still
+has the incorrect noexcept guarantee. That __nothrow_wait_cv::wait is
+just a wrapper around the real condition_variable::wait which adds
+noexcept and so terminates on a __forced_unwind exception.
+
+This doesn't work on uclibc, possibly due to a dynamic linker bug. When
+__nothrow_wait_cv::wait calls the condition_variable::wait function it
+binds to the alias symbol, which means it just calls itself recursively
+until the stack overflows.
+
+This change avoids the possibility of a recursive call by changing the
+__nothrow_wait_cv::wait function so that instead of calling
+condition_variable::wait it re-implements it. This requires accessing
+the private _M_cond member of condition_variable, so we need to use the
+trick of instantiating a template with the member-pointer of the private
+member.
+
+libstdc++-v3/ChangeLog:
+
+	PR libstdc++/105730
+	* src/c++11/compatibility-condvar.cc (__nothrow_wait_cv::wait):
+	Access private data member of base class and call its wait
+	member.
+---
+ .../src/c++11/compatibility-condvar.cc        | 22 ++++++++++++++++++-
+ 1 file changed, 21 insertions(+), 1 deletion(-)
+
+diff --git a/libstdc++-v3/src/c++11/compatibility-condvar.cc b/libstdc++-v3/src/c++11/compatibility-condvar.cc
+index e3a8b8403ca..3cef3bc0714 100644
+--- a/libstdc++-v3/src/c++11/compatibility-condvar.cc
++++ b/libstdc++-v3/src/c++11/compatibility-condvar.cc
+@@ -67,6 +67,24 @@ _GLIBCXX_END_NAMESPACE_VERSION
+     && defined(_GLIBCXX_HAVE_SYMVER_SYMBOL_RENAMING_RUNTIME_SUPPORT)
+ namespace __gnu_cxx _GLIBCXX_VISIBILITY(default)
+ {
++namespace
++{
++  // Pointer-to-member for private std::condition_variable::_M_cond member.
++  std::__condvar std::condition_variable::* __base_member;
++
++  template<std::__condvar std::condition_variable::*X>
++    struct cracker
++    { static std::__condvar std::condition_variable::* value; };
++
++  // Initializer for this static member also initializes __base_member.
++  template<std::__condvar std::condition_variable::*X>
++    std::__condvar std::condition_variable::*
++      cracker<X>::value = __base_member = X;
++
++  // Explicit instantiation is allowed to access the private member.
++  template class cracker<&std::condition_variable::_M_cond>;
++}
++
+ struct __nothrow_wait_cv : std::condition_variable
+ {
+   void wait(std::unique_lock<std::mutex>&) noexcept;
+@@ -76,7 +94,9 @@ __attribute__((used))
+ void
+ __nothrow_wait_cv::wait(std::unique_lock<std::mutex>& lock) noexcept
+ {
+-  this->condition_variable::wait(lock);
++  // In theory this could be simply this->std::condition_variable::wait(lock)
++  // but with uclibc that binds to the @GLIBCXX_3.4.11 symbol, see PR 105730.
++  (this->*__base_member).wait(*lock.mutex());
+ }
+ } // namespace __gnu_cxx
+ 
+-- 
+2.31.1
+
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
