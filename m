Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554D9C7EE29
	for <buildroot@archiver.kernel.org>; Sat, 10 Jun 2023 18:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAE85835D9;
	Sat, 10 Jun 2023 18:50:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAE85835D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nUjNizL2QhpX; Sat, 10 Jun 2023 18:50:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D01F6835CF;
	Sat, 10 Jun 2023 18:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D01F6835CF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 80C401BF354
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 18:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A29660FD8
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 18:50:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A29660FD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YlAnj0xOsKad for <buildroot@lists.busybox.net>;
 Sat, 10 Jun 2023 18:50:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F370C60FD5
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F370C60FD5
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 18:50:19 +0000 (UTC)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout08.t-online.de (Postfix) with SMTP id EE00B1B493;
 Sat, 10 Jun 2023 20:50:16 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd86.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q83fE-1AQjhp0; Sat, 10 Jun 2023 20:50:16 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:37586)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q83fE-0006eq-1D;
 Sat, 10 Jun 2023 20:50:16 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 10 Jun 2023 20:50:15 +0200
Message-Id: <20230610185016.2227373-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686423016-0E7FCC77-54891083/0/0 CLEAN NORMAL
X-TOI-MSGID: de5ccdcf-7e64-4341-b370-6cf75236edb0
Subject: [Buildroot] [PATCH 1/2] package/spdlog: add upstream patch to fix
 build with newer fmt
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
Cc: Semyon Kolganov <semenak94@mail.ru>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...fix-build-for-master-fmt-non-bundled.patch | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/spdlog/0001-fix-build-for-master-fmt-non-bundled.patch

diff --git a/package/spdlog/0001-fix-build-for-master-fmt-non-bundled.patch b/package/spdlog/0001-fix-build-for-master-fmt-non-bundled.patch
new file mode 100644
index 0000000000..58bc6280c0
--- /dev/null
+++ b/package/spdlog/0001-fix-build-for-master-fmt-non-bundled.patch
@@ -0,0 +1,43 @@
+From 0ca574ae168820da0268b3ec7607ca7b33024d05 Mon Sep 17 00:00:00 2001
+From: H1X4 <10332146+H1X4Dev@users.noreply.github.com>
+Date: Fri, 31 Mar 2023 20:39:32 +0300
+Subject: [PATCH] fix build for master fmt (non-bundled) (#2694)
+
+* fix build for master fmt (non-bundled)
+
+* update fmt_runtime_string macro
+
+* fix build of updated macro
+
+Upstream: https://github.com/gabime/spdlog/commit/0ca574ae168820da0268b3ec7607ca7b33024d05
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ include/spdlog/common.h | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/include/spdlog/common.h b/include/spdlog/common.h
+index e69201a81..5f671c5c6 100644
+--- a/include/spdlog/common.h
++++ b/include/spdlog/common.h
+@@ -173,12 +173,19 @@ using format_string_t = fmt::format_string<Args...>;
+ template<class T>
+ using remove_cvref_t = typename std::remove_cv<typename std::remove_reference<T>::type>::type;
+ 
++template <typename Char>
++#if FMT_VERSION >= 90101
++using fmt_runtime_string = fmt::runtime_format_string<Char>;
++#else
++using fmt_runtime_string = fmt::basic_runtime<Char>;
++#endif
++
+ // clang doesn't like SFINAE disabled constructor in std::is_convertible<> so have to repeat the condition from basic_format_string here,
+ // in addition, fmt::basic_runtime<Char> is only convertible to basic_format_string<Char> but not basic_string_view<Char>
+ template<class T, class Char = char>
+ struct is_convertible_to_basic_format_string
+     : std::integral_constant<bool,
+-          std::is_convertible<T, fmt::basic_string_view<Char>>::value || std::is_same<remove_cvref_t<T>, fmt::basic_runtime<Char>>::value>
++          std::is_convertible<T, fmt::basic_string_view<Char>>::value || std::is_same<remove_cvref_t<T>, fmt_runtime_string<Char>>::value>
+ {};
+ 
+ #    if defined(SPDLOG_WCHAR_FILENAMES) || defined(SPDLOG_WCHAR_TO_UTF8_SUPPORT)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
