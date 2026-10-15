Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62716CCA464
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 19:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB416607E4;
	Thu, 15 Oct 2026 19:02:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WGKPsGKrprWB; Thu, 15 Oct 2026 19:02:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 425EE607EE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792090959;
	b=jxDr5SrM2kH76ZMzr6mKvepkrQMWJH/Ee6ohUgTo93/ghWHKfyVfjsTNtsuURDpZ+/jl
	 uv7SGzyCPglvviqvXGsEDM2WOUZP21SsJJCHNiXaTs2vuVWQaKYgHw5SmcCPaLswaOIJC
	 TtLDWJ/FWm47LpzOl2Jnpdr2dEd15Xw6Nnu0FihGPehJ5klrjKTE12Em5U0HS81KV90Ma
	 ZkYaxVTh3i89UYiuauxvvFM5kztuZ22ySWWTLxe87M0Lw8CUIFtp1WOi1fo+1qUTnE7dF
	 LBspPBWI2wXhkCR73DZgUO6jaa6luxlycxm0P5pmAyJOHDqifm01tbeFWrWrRQg4xyg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792090959;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Date:Message-ID:X-Mailer:MIME-Version:X-MIME-Autoconverted:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=gwawkacU+fk0bduiS592kmk5Fnem+xxurHOYY9xbmY4=;
	b=s0JnUetYnohwszWydC25Q0c06GFQmuFS52mxDsHID3sNvItAFKzWxBKHlyU6Rjj2PhaC
	 HFzlRiFtrQApQJ0+WUMAyfPiqCB0nMM2cVvtzNvbAPqKrIv5SDzkLBNMzvHTpYRKstAqr
	 D6OZZ4wR9Lut39G8wvvLtwknYVQmZk7E56st4gbirpiUYLCHUQSUDfpNwOQBLHWQIuy1V
	 aDP9xaMvPM3Zl1V81zih0iCUVlxH1QWloyxGoq3FFP1iYGSuo/LAKWByymLQF8djjTXtB
	 LNo85l456rHK2Op6KG98hru29nhNPUjuK6IIhzCjYRQkD7saXd/fRkDW0pr+DVH4fTA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792090959;
	bh=gwawkacU+fk0bduiS592kmk5Fnem+xxurHOYY9xbmY4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=N0ShznbYhB5XYBnlSMO61dhcE9F7TKNyk+2E/UQbojLtNHUQlZzLNM2DJKpQXuGRo
	 914huh4dhTlslyJHNSMyAF1T91BUOWMx3MXtqrdZferUn36m4Hh1VEaqp8XNkok5aI
	 lqbQ3l1JHN7vA82xo45PfP8Pg17FistnmmeQ+4zpUbbsdTj2V83TYOm4eEcwpCHUBm
	 D0zF7sEj35/FDNs7Wo94Qp6AxLVeWTTDdkbb1nl4Fs/4Roj38uo01GxyY1slk8Wfhh
	 VlofykE+ekAaq3/mbuNSZ5RgBKEMYVGbVsIQLELDVyeAhUkkuRLcqNEpyuUUU1IBhe
	 S/BUO3vH5dplw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 425EE607EE;
	Thu, 15 Oct 2026 19:02:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AE85920
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 19:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D0B840433
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 19:02:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UCDu2BGKDFlZ for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 19:02:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0F0E64005E
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792090957;
 b=ca0SbOcWLEsCmQjv/QbudJJ/k1XwWoexNwSgOEe50VakwCYcjcmrA6C2gSV/mQCuHMzN
 /3P/cBhmKwXe6t2DMwWI0miIS+5uZhvpWt33N44WrR+IeLs0WFfv1La3Bh7VEzvKmVVUs
 sa6s0Mb/RYknpujklb3OxeUqlz/1FF3W3FaFoV1DOj6LznYIbs/C3gkOfLkBIJmsXyVeq
 xDqZkOxV9gRc0+YEDrufg48hms8Wa/15hMIeFL/NbFRCPn/TIXEPvjt+L6xzADYJ1vidp
 O/gZk4pWmg8l0QjSoXVLjD8SFSJrIWO2lKRXBN8Hkz4UvQhpMwSFaDuadYdjArgT3lA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792090957;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-MIME-Autoconverted:Content-Type;
 bh=6zNNXw4bFm4qdd30af7gbss/YGH66OG1UHvV7b5onDA=;
 b=l4f1ZlMw+W5Nr1u5rMYbltkVUT4LXt8LCy056dckZvwaKWM6jn5PErhJOvchojW0YqOi
 1ldIHBLiwuB8gawYAGGykQGdtS1xFSPbyYZ4o83O5cdWqhv9i4jDLOKYMyGpQZ5IowdO0
 ir/8yB/lzDmc4ilCbscX9U/Bew8f1oWmuDF2qJUD+rYoSvB6G+RKOVz3ek85MMyp0OyRW
 F8Ogll0Qpy9EBjHlqgAJQh9wp3zgPgXSsCrl/cXhq9Xd/sDz173r0OhzeFqtMilcem/rl
 0MAeewxJYLDMtBkj0KM2CzSH6iKjayTrjKrGyMt+lBw17oOBlHPp4sHaxTolxjdUOmA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail3 header.b=bC0zJjO5; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=bC0zJjO5
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F0E64005E
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 19:02:35 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=bC0zJjO5iYB/3B9AbdeiT+fzNceDO/tU2RiRg2jD4jsV8N3x7otp/P/9RuFlkpBkfg/VZ/iVeYPA2LJ/s2XU3ntOrTxXXn78NoLgPe2Nuy7ZFebg4dnGwSNs4HQY1QEJnu9uwXlQ3oRJ0GJqpIzCXHJ6YRaLDRptHHjIiz1mPExskzDtnAx9K5fsT9RL0+rm5O1RNx8QXXWotGXj7kovkgloZZBbT+EXMuqLnnp2WJalopEcLWCxnSfIaII6bL3mXkRLzKdbobyOM30+LSG0vG7/p8SPci/dyAoORaCoDlyGURxQtBEwfkLR6iwC4fQKOocg6nvEehSl9NdOCM2Ztg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=jxlSb7gUusz9L30i5fVbDD1q5VGVHxtDQmN4AbL4/5g=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1988082358; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 15 Oct 2026 19:02:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1xHQib-000000011SN-1pAM;
 Thu, 15 Oct 2026 21:02:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 21:02:18 +0200
Message-ID: <20261015190219.243913-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH] package/libglib2: backport upstream security
 fix for CVE-2026-58016
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following vulnerability:

CVE-2026-58016: A flaw was found in GLib.  A state confusion issue exists in
g_dbus_node_info_new_for_xml() in the gio/gdbusintrospection.c file when
processing malformed D-Bus introspection XML, specifically with a `node`
element nested within other elements like `method`, `signal`, `property` or
`arg`.  This issue can cause an unsigned integer overflow and lead to an
out-of-bounds read, resulting in a denial of service.

https://gitlab.gnome.org/GNOME/glib/-/merge_requests/5156

Backport the upstream patch (included in 2.89.0), but drop the test addition
for easier backport:

https://gitlab.gnome.org/GNOME/glib/-/commit/c9da977c178fbfc0e4caf99f9fdf5dc433d6fcc2

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...on-Fix-XML-parser-state-handling-for.patch | 42 +++++++++++++++++++
 package/libglib2/libglib2.mk                  |  3 ++
 2 files changed, 45 insertions(+)
 create mode 100644 package/libglib2/0001-gdbusintrospection-Fix-XML-parser-state-handling-for.patch

diff --git a/package/libglib2/0001-gdbusintrospection-Fix-XML-parser-state-handling-for.patch b/package/libglib2/0001-gdbusintrospection-Fix-XML-parser-state-handling-for.patch
new file mode 100644
index 0000000000..4582382f80
--- /dev/null
+++ b/package/libglib2/0001-gdbusintrospection-Fix-XML-parser-state-handling-for.patch
@@ -0,0 +1,42 @@
+From c9da977c178fbfc0e4caf99f9fdf5dc433d6fcc2 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Thu, 16 Apr 2026 15:27:37 +0100
+Subject: [PATCH] gdbusintrospection: Fix XML parser state handling for <node>
+ element nesting
+
+The check for whether a `<node>` element in D-Bus introspection XML was
+nested correctly was broken. `<node>` elements can only be at the top
+level, or nested immediately within another `<node>` element.
+
+Fix the check and add some unit tests for it.
+
+Spotted by linhlhq as #YWH-PGM9867-204. The fix is mine, and the unit test
+uses example XML strings adapted from their report.
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+
+Fixes: #3932
+CVE: CVE-2026-58016
+Upstream: https://gitlab.gnome.org/GNOME/glib/-/commit/c9da977c178fbfc0e4caf99f9fdf5dc433d6fcc2
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+[Peter: drop tests]
+---
+ gio/gdbusintrospection.c        |  2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gio/gdbusintrospection.c b/gio/gdbusintrospection.c
+index 1138ba9d7..4df8e87db 100644
+--- a/gio/gdbusintrospection.c
++++ b/gio/gdbusintrospection.c
+@@ -1266,7 +1266,7 @@ parser_start_element (GMarkupParseContext  *context,
+   /* ---------------------------------------------------------------------------------------------------- */
+   if (strcmp (element_name, "node") == 0)
+     {
+-      if (!(g_slist_length (stack) >= 1 || strcmp (stack->next->data, "node") != 0))
++      if (stack->next != NULL && strcmp (stack->next->data, "node") != 0)
+         {
+           g_set_error_literal (error,
+                                G_MARKUP_ERROR,
+-- 
+2.47.3
+
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 45aa894b81..3770e8671a 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -17,6 +17,9 @@ LIBGLIB2_INSTALL_STAGING = YES
 LIBGLIB2_CFLAGS = $(TARGET_CFLAGS)
 LIBGLIB2_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
+# 0001-gdbusintrospection-Fix-XML-parser-state-handling-for.patch
+LIBGLIB2_IGNORE_CVES += CVE-2026-58016
+
 # glib/valgrind.h contains inline asm not compatible with thumb1
 ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 LIBGLIB2_CFLAGS += -marm
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
