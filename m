Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346C5C001E0
	for <buildroot@archiver.kernel.org>; Wed,  2 Aug 2023 18:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9FDD41508;
	Wed,  2 Aug 2023 18:34:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9FDD41508
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id STs7q2tmdo9y; Wed,  2 Aug 2023 18:34:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4CA540CA8;
	Wed,  2 Aug 2023 18:34:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4CA540CA8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4E66E1BF84C
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 18:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6823418A0
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 18:33:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6823418A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tNJEHjwEytKJ for <buildroot@lists.busybox.net>;
 Wed,  2 Aug 2023 18:33:17 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 67860402E0
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 18:33:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67860402E0
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 876C5A4C0D76
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 20:33:15 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59974)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qRGeo-0005K5-3B
 for buildroot@buildroot.org; Wed, 02 Aug 2023 20:33:15 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  2 Aug 2023 20:33:14 +0200
Message-Id: <20230802183314.1240578-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691001195;
 bh=o+7ExV6f4815zVkHhXS5IEB/Daswwsgmhf2JOke+mv4=;
 h=From:To:Subject:Date:From;
 b=p+YnAoTxSDVcJbMz7ReRjhYClSiykiRHAxNXetmOW/xA6AdknE7V2kXvewej83+yM
 MVAkdUyRYxf7ZCea63JtDdQnvOtBftssCgEeBe2u79cpye8bWwVXrO/7m6omqUg0Qs
 l+9C9jCQKqAxUMxD11uaPUv8U/cBjzWgQxT0mi6FutIVObqSXjPloQ3evbTvAJeryP
 v8rrI82DyWmbVvZASmiBd4W1JgjEId4zFOTSBxAw+oFP7h4K4b0CDsI92Zoe1KcGmL
 TeJ3s540cbESpkl23A8SlxUj9GqFTqyoYMyuE36sK63/jYIA0zcPqyx5PL/ysr4i0V
 HK7n18uZdY03Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=p+YnAoTx
Subject: [Buildroot] [PATCH 1/1] package/gdb: fix build error for version
 arc-2020.09
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

Fixes:
http://autobuild.buildroot.net/results/e60/e60c9bba5395970f99e9f889bba4675ac6f004c4/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...t-define-basic_string_view-to_string.patch | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 package/gdb/arc-2020.09-release-gdb/0001-Do-not-define-basic_string_view-to_string.patch

diff --git a/package/gdb/arc-2020.09-release-gdb/0001-Do-not-define-basic_string_view-to_string.patch b/package/gdb/arc-2020.09-release-gdb/0001-Do-not-define-basic_string_view-to_string.patch
new file mode 100644
index 0000000000..210ba6d609
--- /dev/null
+++ b/package/gdb/arc-2020.09-release-gdb/0001-Do-not-define-basic_string_view-to_string.patch
@@ -0,0 +1,114 @@
+From 5ac588997c3c2d032d5d5145d9245eb37354c23b Mon Sep 17 00:00:00 2001
+From: Tom Tromey <tromey@adacore.com>
+Date: Tue, 30 Jun 2020 07:53:03 -0600
+Subject: [PATCH] Do not define basic_string_view::to_string
+
+gdb's copy of basic_string_view includes a to_string method.  However,
+according to cppreference, this is not a method on the real
+std::basic_string_view:
+
+https://en.cppreference.com/w/cpp/string/basic_string_view
+
+This difference matters because gdb_string_view.h will use the
+standard implementation when built with a C++17 or later.  This caused
+PR build/26183.
+
+This patch fixes the problem by changing the method to be a standalone
+helper function, and then rewriting the uses.  Tested by rebuilding
+with a version of GCC that defaults to C++17.
+
+(Note that the build still is not clean; and also I noticed that the
+libstdc++ string_view forbids the use of nullptr ... I wonder if gdb
+violates that.)
+
+gdb/ChangeLog
+2020-06-30  Tom Tromey  <tromey@adacore.com>
+
+	PR build/26183:
+	* ada-lang.c (ada_lookup_name_info::ada_lookup_name_info): Use
+	gdb::to_string.
+
+gdbsupport/ChangeLog
+2020-06-30  Tom Tromey  <tromey@adacore.com>
+
+	PR build/26183:
+	* gdb_string_view.h (basic_string_view::to_string): Remove.
+	(gdb::to_string): New function.
+
+Upstream: https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=5ac588997c3c2d032d5d5145d9245eb37354c23b
+Bug report: https://sourceware.org/bugzilla/show_bug.cgi?id=26183
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ gdb/ChangeLog                |  6 ++++++
+ gdb/ada-lang.c               |  8 ++++----
+ gdbsupport/ChangeLog         |  6 ++++++
+ gdbsupport/gdb_string_view.h | 17 ++++++++++-------
+ 4 files changed, 26 insertions(+), 11 deletions(-)
+
+diff --git a/gdb/ada-lang.c b/gdb/ada-lang.c
+index 9b0c2efbfe2..98508c168bc 100644
+--- a/gdb/ada-lang.c
++++ b/gdb/ada-lang.c
+@@ -13553,10 +13553,10 @@ ada_lookup_name_info::ada_lookup_name_info (const lookup_name_info &lookup_name)
+     {
+       if (user_name.back () == '>')
+ 	m_encoded_name
+-	  = user_name.substr (1, user_name.size () - 2).to_string ();
++	  = gdb::to_string (user_name.substr (1, user_name.size () - 2));
+       else
+ 	m_encoded_name
+-	  = user_name.substr (1, user_name.size () - 1).to_string ();
++	  = gdb::to_string (user_name.substr (1, user_name.size () - 1));
+       m_encoded_p = true;
+       m_verbatim_p = true;
+       m_wild_match_p = false;
+@@ -13575,10 +13575,10 @@ ada_lookup_name_info::ada_lookup_name_info (const lookup_name_info &lookup_name)
+ 	  if (encoded != NULL)
+ 	    m_encoded_name = encoded;
+ 	  else
+-	    m_encoded_name = user_name.to_string ();
++	    m_encoded_name = gdb::to_string (user_name);
+ 	}
+       else
+-	m_encoded_name = user_name.to_string ();
++	m_encoded_name = gdb::to_string (user_name);
+ 
+       /* Handle the 'package Standard' special case.  See description
+ 	 of m_standard_p.  */
+diff --git a/gdbsupport/gdb_string_view.h b/gdbsupport/gdb_string_view.h
+index c0ae7a8a2d9..65124e67e54 100644
+--- a/gdbsupport/gdb_string_view.h
++++ b/gdbsupport/gdb_string_view.h
+@@ -245,13 +245,6 @@ namespace gdb {
+ 	  return { this->_M_str, this->_M_len };
+ 	}
+ 
+-      template<typename _Allocator = std::allocator<_CharT>>
+-	std::basic_string<_CharT, _Traits, _Allocator>
+-	to_string(const _Allocator& __alloc = _Allocator()) const
+-	{
+-	  return { this->_M_str, this->_M_len, __alloc };
+-	}
+-
+       size_type
+       copy(_CharT* __str, size_type __n, size_type __pos = 0) const
+       {
+@@ -560,4 +553,14 @@ namespace gdb {
+ 
+ #endif // __cplusplus < 201703L
+ 
++namespace gdb {
++
++static inline std::string
++to_string(const gdb::string_view &view)
++{
++  return { view.data (), view.size () };
++}
++
++}
++
+ #endif /* COMMON_GDB_STRING_VIEW_H */
+-- 
+2.39.3
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
