Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8198CA5FD2
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 14:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E27F40D07;
	Thu,  1 Oct 2026 14:23:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dh5Yz4FMuw4e; Thu,  1 Oct 2026 14:23:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A6E4C40D72
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790864626;
	b=hImOjuQY3YESPdVbMRwmkbdH4/O03woT70DjpY/9E+KvDFW8EK0J9y6TCeL5RJ/bY1nY
	 xMQC+/j6sLpRj41PLXQV5wJcg9SQezbWQH4uwuQGtVttw5pU3TZRVoqnCyhE3qNo2A19G
	 F9+U7ts7U4LjFjwfRf3oHfyZUvCSl3i49E8b+5P9ooSJ7+ZLWhWVT9y5xV+Tom1ti0fjQ
	 q7O6lhBMMCM3JANDmh3CBrz+pN2L8U0Wx7fBb7C/0Ey2mU9JLeG7ejRn6/mWOYuy0Ki8i
	 JXSMK6lCXV0v8dwbajKOBRE+UNazLKLCamQKyjh7trwYVEGfLYMFp+YFAlF/5pjaCZw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790864626;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=4p+xCXegOqcDqaG1VQiguk65/nZlpgsdTtJOVMHfPkg=;
	b=EUJTwvetpqzQ/ZEEgoqRPbPVbQe0Z8cgx2sIAtleESRfKVy3b+ULk7lovVBhugSsWmMc
	 IgwQSXmHXrXwKhcwQlU49QuV2GATVYdl9O3drDic7tnueEvTK2kfrS85qoXKOt4IEHs3a
	 qn7Cq5zZSoyLfXItiCZq/2qAiD2zl6aRp4q0UdmkMN7e1MTOc9vDXqNKT6BYa2pSKN/7K
	 lGCuepTOUtNl4KZ24c3in/fC+0FGg/B13RTm0cxruoRFyL1UUlHCjoQZyFi8l2IEKlTwF
	 URyze8WHVoryrjA5oLZbyqUYAQMsV46cAyufUpHBvYgzGePN8iFglcDQVEQwDNH40fw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790864626;
	bh=4p+xCXegOqcDqaG1VQiguk65/nZlpgsdTtJOVMHfPkg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fgbVcavPQB7vsHRV/G2A6rPxWF3xAprEl4Z68C56nw0QxcaHk+TDg2vgicpXd5q4A
	 QT/jLhuJkA+mtmfKsyuLgHwYjgiChr01vSF9Nnl7LhTt8XxrSxgn52+3urtxPCbFxM
	 fEcRTjNEnZbEYG47FJRPF/3XEFtaPHOi7F1ks3NGh4DAlkcITNALzcREnwQQQeGtzs
	 avZJiWVYdE+g0j7z5JiYvTVr73g1kuxv+V8efG8LiwF8cjto8MaaNXsWPBSCPSgbPY
	 R6Ty18u2JePkKGIrYp/Mizle+c9BxoObF5CCqqLuF+HTwdm0YsffmMw9+WvOSYtOG3
	 4HWCzif/aQjlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6E4C40D72;
	Thu,  1 Oct 2026 14:23:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 101131FEA
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1F874052A
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4yaaE4flQKIw for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 200E44052D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790864563;
 b=MTodUwWV84m/LSsKro/tBY8yKlQMQOkp+Dns8cHGc6uzQlLczORy75t9mkXV6oHKsjjh
 eL/B+2E5Vu9PLNOZ+UWMPX4pHz9QBTGugF+wLQaGCGAPDEEQvHniPWuRrTgSBOB9VYREd
 5s5fKcJvEU+pIdgr9uPWWpSpDGU9+aCBT6s7oo/6d4/Nqi3UuOzzlx2BHAy/HP38oaLEa
 AqV/jCIPhL1n9LoPrwoiEQ+frQs43kNlyetGAmRu/uJGMKtXcWMEE/HtLPW1enxNdXI7+
 hkftKfBh1P8cli+x6+bF3KQcn7S4nxCu7lHrWVzFeXAz8DXzfHoc3rN5fE2M4a9vFcw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790864563;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=kZD3+mupMSH4nwiVIYYQgagjmKCaBirPlgXrMuw3e08=;
 b=GQNg8Qp7gddNoY/OZ4IPYMZ8q9cdoQbB00rlC0PYii1gLBLPoDvqmhbbA3pDhZyL/bNt
 QAKKEHni5sl6ay3xZ5cbRgT9ixord4PbLS2EkXbpSOgPb6CU3DDKYAazvBVdniyIUJyWC
 L1KCzzPqvMBQ3gJffxN2rmkF0RwP9iMqwf1eq/O9UQOc1+yRRuUd1KMm5LJeYw/Yz1EXe
 Xanqu5TOmhLRLjj8VqzOTHS0+9v41mn3Sa/rEjIiODRQpYiSPuyG8RfD0+Q/32Yy9VsTy
 ip/niNv27Pk8FESSCX73Hm5ta/n74BJrbK7AFUBzcdTdElcjMcKlf+/IcEEoe+4tQtw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 200E44052D
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 684A49844E; Thu,  1 Oct 2026 14:21:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 16:08:22 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: cfdd030bfe27c53c6fc9b031fddf882b318e6905
X-Git-Newrev: ad6468b5434f022157bda002137ce918e30ce498
X-Patchwork-Hint: ignore
Message-Id: <20261001142129.684A49844E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/flutter-engine:
 fix build with pango >= 1.58.0
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4308764873004974549=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4308764873004974549==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ad6468b5434f022157bda002137ce918e30ce498
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Buildroot commit c3aa6774563d20901fd1370f51ef105180665b54 bumped pango
to 1.58.0 causing a build error with flutter-engine

../../flutter/shell/platform/linux/fl_accessible_text_field.cc:9:1:
 error: redefinition of 'glib_autoptr_clear_PangoContext'
    9 | G_DEFINE_AUTOPTR_CLEANUP_FUNC(PangoContext, g_object_unref)

../../flutter/shell/platform/linux/fl_accessible_text_field.cc:60:3:
 error: 'cleanup' argument is not a function
   60 |   g_autoptr(PangoContext) context = get_pango_context(self);

with this defconfig:

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_FLUTTER_ENGINE=y
BR2_PACKAGE_LIBGTK3=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 08b06173bd3c95f0fa532b38533e10e558eec602)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 .../0005-Fix-building-on-Pango-1.58.0.patch        | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/flutter-engine/0005-Fix-building-on-Pango-1.58.0.patch b/package/flutter-engine/0005-Fix-building-on-Pango-1.58.0.patch
new file mode 100644
index 0000000000..9bb475187b
--- /dev/null
+++ b/package/flutter-engine/0005-Fix-building-on-Pango-1.58.0.patch
@@ -0,0 +1,33 @@
+From f1c316430713ae7d526f8abc1621b09958aef281 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Mon, 21 Sep 2026 22:06:06 +0200
+Subject: [PATCH] Fix building on Pango 1.58.0
+
+This version added the autoptr macros which we no longer need to define.
+
+Upstream: https://github.com/flutter/flutter/pull/193119
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ .../flutter/shell/platform/linux/fl_accessible_text_field.cc  | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/engine/src/flutter/shell/platform/linux/fl_accessible_text_field.cc b/engine/src/flutter/shell/platform/linux/fl_accessible_text_field.cc
+index e99b123bbfd..f7955a32f07 100644
+--- a/engine/src/flutter/shell/platform/linux/fl_accessible_text_field.cc
++++ b/engine/src/flutter/shell/platform/linux/fl_accessible_text_field.cc
+@@ -6,7 +6,11 @@
+ #include "flutter/shell/platform/linux/public/flutter_linux/fl_standard_message_codec.h"
+ #include "flutter/shell/platform/linux/public/flutter_linux/fl_value.h"
+ 
++// PangoContext g_autoptr macro weren't added until 1.58.0. Add them manually.
++// https://gitlab.gnome.org/GNOME/pango/-/commit/223b147
++#if !PANGO_VERSION_CHECK(1, 58, 0)
+ G_DEFINE_AUTOPTR_CLEANUP_FUNC(PangoContext, g_object_unref)
++#endif
+ // PangoLayout g_autoptr macro weren't added until 1.49.4. Add them manually.
+ // https://gitlab.gnome.org/GNOME/pango/-/commit/0b84e14
+ #if !PANGO_VERSION_CHECK(1, 49, 4)
+-- 
+2.47.3
+

--===============4308764873004974549==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4308764873004974549==--
