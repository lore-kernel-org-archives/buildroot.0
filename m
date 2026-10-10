Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4768DCA9EC7
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 16:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 011D060632;
	Sat, 10 Oct 2026 16:20:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SiNwS2Fyk3J6; Sat, 10 Oct 2026 16:20:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C632360638
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791649244;
	b=PKC6I4wNcVXxR6scSTO5UJkAAJAfjufNophqCWS5EvpgnA+2euvsMPtBKfGb67f1ae61
	 iZRUSEm3qe/GTs+eAwo2pyer7E5gY5dGZREvRNx5tAIA8TdMiOIELdy2hlKVpgYTK7+IN
	 eFoPm1kyA3fIA4QPqZQMqD38VEs6zmrMVhHE9TYAuNQrAASjzVX4pTwyLx0St5yMp9uGb
	 1iFefcEA29RBNhmlYdt6CShP5XkzRDGK4AznKb77d3d2pvd2UzBakJJrjZv1zJBBCwzLS
	 cTBqTDaVr/9NTW4uruwgJQJRe3OOqj4tHPSoo/d8YVEGRkER76KomT8Z/jh7fnv194w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791649244;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=lEoZjAT9qEmZK+J4oZ8rAHASH9LoJF+kmSXR9eUQPUE=;
	b=cpsfLJbsMBWU/71ptbBO30ZppwMSDt3VUi0fCvcbZNdkFPtIm1UCbZ/NxzPt7Q8eVYBu
	 T6J8i6FHjndY55z8A7YJdZHcN0G/R99STHVW7vn00lu/qYuzgE3tVVHReSjWgJnG6YiWu
	 Qk2tA8DngxIFBD4K+BqCz5snk0u05vBiTcB37fAER9aLgdppYMyBFnaFZ3Hk3uG1NJkih
	 jpAAP8pc1DCnHFE2alrvqT10ZDwso8wFbBXAGHOLaAIAtct3q0qQt1+sYINofxqyNWvQp
	 QCssLv9rDsbH9f4xCEcDHY4fFa2FmkPB9I6L3crtCY6c0l3VzrZ47ZFavddXem1gtng==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791649244;
	bh=lEoZjAT9qEmZK+J4oZ8rAHASH9LoJF+kmSXR9eUQPUE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XtgrKF1YXz7JZdzvT6rLsnI9mrbWX81n3oWLk0N7O42OqKU0auKLbO1cdbFrx+UuQ
	 MKzvGPzY7sbbiw3umf20Q6f3sofpADebpsVPLr/x1SAxWVkRaFA8BWwIv+g8cqJ84W
	 RcUYcqNw1e4tCKUPaSfAxHMwQU9qhpNvk9rwn1AI3RHk6n7LiOE2Ol7UqWy94ukvlX
	 5qt65WpH42E0stfUedZQig5qVSBlmfpFIlvGbHelyC/xr7kiMuQ9nTb9fCJTn8Ya7E
	 QhjS+7Zl9glQDTszMSH7480EYG4/ze2bM55x/cMRMzws2qToqCQjswLLfrHhk2Nn5s
	 9mNHNAghW/cTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C632360638;
	Sat, 10 Oct 2026 16:20:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C5CFB9D1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C32C160632
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:20:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K4tlfa0fcKmm for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 16:20:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BDD0760638
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791649240;
 b=k1AGAe09CUI6F23dzsFCIH0NCuZxGTDO08SuB8kmqd0wcgKTUyOkYW/pueC0qgA6J9Ap
 07Cc1H3ny2/1zvSpGb+9FCHccLugXB6OFUQ3Cxok0XlXNN+y3UwPtsVQzCNWssnGFTsyh
 c8kE2fUOupDOu7OQQCg4AuIs0Fio8aHxAA0ItILPKl9oXFRvJEZx4laASPYW6m6a4kNpk
 P9kpokU0tOiVL5X54B6UoB2pW8jt+YXWJMI1WFCRpU971AuVzi2SLI1HZ1cWhWY2vkU2s
 wU+2NtmPtHO+U1FNq4EDvIabcKPdb5X/c9Vs1EmBVmRwmPvsj5IIDysjmYjl+dJQT1A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791649240;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=tikThcwLDLjgVugVc8r0tUSj84G7D9WeyX2a1Vxet0Q=;
 b=qPJKupY8UNcx6RhZDX7EheintAHcpYFH/OiMRt6ubLfhIt1PAz8Qxoq3iiv9nIZxAzxF
 PAvF2v52O1LUJHkcZ6q0HS6APLecI+95FuThRyO478c20eLPyidBR3QfmCDJmD34/a+qT
 us+cnvdlNKwuT9H2nUYq6GqCXOgJeF5ogoJbgvvOFGmZV4/4HHAuCe5J0NjQJYx19xTVB
 tz5vUIbEM/Ex58ozx3TrqrmhnAWDqtg1PPom3alFvSlZ8WsDzhiH5aYla1fq577ldN4M2
 W/VjDR9dA/hStaXJAPgRt02fpblGLjgsheJCXbcgLNf8Q9udHKMfPbk40jXAj+2nPtg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDD0760638
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:20:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7E50D92399; Sat, 10 Oct 2026 16:19:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 18:03:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea0f27d64f84894f53170bec827aeff4370104fe
X-Git-Newrev: c66fe59ddc32d5d1543fc3936d3ef36e23861b55
X-Patchwork-Hint: ignore
Message-Id: <20261010161922.7E50D92399@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcec: bump version to 8.1.7
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c66fe59ddc32d5d1543fc3936d3ef36e23861b55
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/Pulse-Eight/libcec/blob/libcec-8.1.7/debian/changelog.in

Removed patches which are included in this release.

Removed dependency to libplatform due to upstream commit:
https://github.com/Pulse-Eight/libcec/commit/332bca975a71d8e876b66dc6a7fca938b49b1831

Updated license hash due to upstream commits:
https://github.com/Pulse-Eight/libcec/commits/libcec-8.1.7/LICENSE.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...n-strDeviceLanguage-accepts-3-char-ISO-co.patch | 66 ------------------
 ...-the-Python-wrapper-against-SWIG-4.5-whic.patch | 78 ----------------------
 package/libcec/Config.in                           |  1 -
 package/libcec/libcec.hash                         |  4 +-
 package/libcec/libcec.mk                           |  4 +-
 5 files changed, 4 insertions(+), 149 deletions(-)

diff --git a/package/libcec/0001-fixed-Python-strDeviceLanguage-accepts-3-char-ISO-co.patch b/package/libcec/0001-fixed-Python-strDeviceLanguage-accepts-3-char-ISO-co.patch
deleted file mode 100644
index e2a86e1f7e..0000000000
--- a/package/libcec/0001-fixed-Python-strDeviceLanguage-accepts-3-char-ISO-co.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From f53490e23037f17b68043f5e1ff2f4378d227d56 Mon Sep 17 00:00:00 2001
-From: Lars Op den Kamp <lars@opdenkamp.eu>
-Date: Mon, 13 Jul 2026 15:24:27 +0200
-Subject: [PATCH] fixed: Python strDeviceLanguage accepts 3-char ISO codes
- (SWIG char[3] typemap)
-
-The SWIG default char[ANY] setter uses SWIG_AsCharArray, which reserves a
-byte for a NUL terminator. strDeviceLanguage is a raw, non-terminated
-char[3] holding a 3-character ISO 639-2 code, so a valid 3-char value needs
-4 bytes and overflowed the buffer, raising a TypeError; only 2-char codes
-fit. Add member-name-scoped in/memberin typemaps that copy the raw bytes
-(str or bytes) so 3-char codes assign correctly. Scoped by name so the
-NUL-terminated strDeviceName keeps the default behaviour.
-
-Upstream: https://github.com/Pulse-Eight/libcec/commit/f53490e23037f17b68043f5e1ff2f4378d227d56
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/libcec/libcec.i | 31 +++++++++++++++++++++++++++++++
- 1 file changed, 31 insertions(+)
-
-diff --git a/src/libcec/libcec.i b/src/libcec/libcec.i
-index a01f9afc..520ff7af 100644
---- a/src/libcec/libcec.i
-+++ b/src/libcec/libcec.i
-@@ -15,6 +15,37 @@
-   $result = PyString_FromString($1.name);
- }
- 
-+/////// libcec_configuration::strDeviceLanguage ///////
-+// strDeviceLanguage is a raw, fixed-size char[3] that is NOT NUL-terminated (a
-+// 3-character ISO 639-2 code). SWIG's default char[ANY] setter reserves a byte
-+// for a terminator, so a valid 3-char code needs 4 bytes and overflows the
-+// buffer, raising a TypeError; only 2-char codes fit. Copy the raw bytes
-+// instead (accepting str or bytes), scoped to this member by name so the
-+// NUL-terminated strDeviceName keeps the default behaviour.
-+%typemap(in) char strDeviceLanguage[ANY] (char temp[$1_dim0]) {
-+  char *cptr = 0; size_t csize = 0; int alloc = SWIG_OLDOBJ;
-+  int res = SWIG_AsCharPtrAndSize($input, &cptr, &csize, &alloc);
-+  if (!SWIG_IsOK(res)) {
-+    %argument_fail(res, "char [$1_dim0]", $symname, $argnum);
-+  }
-+  {
-+    /* csize counts the trailing NUL; strDeviceLanguage stores no terminator */
-+    size_t slen = (csize > 0) ? csize - 1 : 0;
-+    if (slen > (size_t)($1_dim0)) {
-+      if (alloc == SWIG_NEWOBJ) %delete_array(cptr);
-+      %argument_fail(SWIG_ValueError, "char [$1_dim0]", $symname, $argnum);
-+    }
-+    memset(temp, 0, $1_dim0);
-+    if (slen) memcpy(temp, cptr, slen);
-+  }
-+  $1 = temp;
-+  if (alloc == SWIG_NEWOBJ) %delete_array(cptr);
-+}
-+
-+%typemap(memberin) char strDeviceLanguage[ANY] {
-+  memcpy($1, $input, $1_dim0 * sizeof(char));
-+}
-+
- /////// replace operator[]() ///////
- 
- // CEC::cec_datapacket::operator[]()
--- 
-2.47.3
-
diff --git a/package/libcec/0002-fixed-build-the-Python-wrapper-against-SWIG-4.5-whic.patch b/package/libcec/0002-fixed-build-the-Python-wrapper-against-SWIG-4.5-whic.patch
deleted file mode 100644
index 351091e17d..0000000000
--- a/package/libcec/0002-fixed-build-the-Python-wrapper-against-SWIG-4.5-whic.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 55f3443559b0b32a1d7194e424727575faf6f7d4 Mon Sep 17 00:00:00 2001
-From: Lars Op den Kamp <lars@opdenkamp.eu>
-Date: Fri, 31 Jul 2026 14:46:27 +0200
-Subject: [PATCH] fixed: build the Python wrapper against SWIG 4.5, which
- removed the Python 2 compatibility macros
-
-SWIG 4.5 dropped the PyInt_*/PyString_* macros that pyhead.swg used to define
-for user typemaps. Two places here relied on them.
-
-The callback return handling keeps a PY_MAJOR_VERSION guard rather than moving
-to the Python 3 API outright, because the x86 Windows build still targets
-Python 2 for the EventGhost plugin. A Python 2 int is a PyIntObject, not a
-PyLongObject, so an unguarded PyLong_Check would compile there and then
-silently read every commandHandler and menuStateChanged return value as 0 - the
-one thing those callbacks exist to report. SWIG never reads SwigHelper.h, so
-the C preprocessor makes the choice and the file is SWIG-version independent.
-
-The cec_osd_name out-typemap is deleted rather than fixed, because it is dead:
-GetDeviceOSDName returns std::string, and cec_osd_name only survives as an out
-parameter in the C API, which is not wrapped. It could not have compiled if it
-ever did fire - cec_osd_name is a typedef for char[14], so the $1.name it
-dereferences has no member to name. Removing it leaves the generated wrapper
-byte-for-byte identical.
-
-Verified by preprocessing SwigHelper.h against both Python 3.10 and Python 2.7:
-Python 3 resolves to PyObject_CallObject/PyLong_AsLong with no removed macro
-surviving anywhere, Python 2 to PyEval_CallObject/PyInt_AsLong.
-
-closes #726
-
-Upstream: https://github.com/Pulse-Eight/libcec/commit/55f3443559b0b32a1d7194e424727575faf6f7d4
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/libcec/SwigHelper.h | 9 +++++++++
- src/libcec/libcec.i     | 4 ----
- 2 files changed, 9 insertions(+), 4 deletions(-)
-
-diff --git a/src/libcec/SwigHelper.h b/src/libcec/SwigHelper.h
-index 3c40fc87..0752acb2 100644
---- a/src/libcec/SwigHelper.h
-+++ b/src/libcec/SwigHelper.h
-@@ -137,8 +137,17 @@ namespace CEC
-           Py_DECREF(arglist);
-         if (!!result)
-         {
-+          /** SWIG 4.5 removed the PyInt_* compatibility macros it used to define
-+              for Python 3, so call the version-appropriate API directly. Note that
-+              a Python 2 int is a PyIntObject, not a PyLongObject, so PyLong_Check
-+              would silently reject it there. */
-+          #if (PY_MAJOR_VERSION < 3)
-           if (PyInt_Check(result))
-             retval = (int)PyInt_AsLong(result);
-+          #else // (PY_MAJOR_VERSION >= 3)
-+          if (PyLong_Check(result))
-+            retval = (int)PyLong_AsLong(result);
-+          #endif
-           Py_XDECREF(result);
-         }
-       }
-diff --git a/src/libcec/libcec.i b/src/libcec/libcec.i
-index 520ff7af..0d757aa1 100644
---- a/src/libcec/libcec.i
-+++ b/src/libcec/libcec.i
-@@ -11,10 +11,6 @@
- 
- %ignore *::operator=;
- 
--%typemap(out) CEC::cec_osd_name {
--  $result = PyString_FromString($1.name);
--}
--
- /////// libcec_configuration::strDeviceLanguage ///////
- // strDeviceLanguage is a raw, fixed-size char[3] that is NOT NUL-terminated (a
- // 3-character ISO 639-2 code). SWIG's default char[ANY] setter reserves a byte
--- 
-2.47.3
-
diff --git a/package/libcec/Config.in b/package/libcec/Config.in
index 2dddc53635..7eff540f38 100644
--- a/package/libcec/Config.in
+++ b/package/libcec/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_LIBCEC
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
-	select BR2_PACKAGE_LIBPLATFORM
 	help
 	  libcec allows you in combination with the right hardware to
 	  control your home theater devices with your TV remote
diff --git a/package/libcec/libcec.hash b/package/libcec/libcec.hash
index b04c724668..d5fa11cf04 100644
--- a/package/libcec/libcec.hash
+++ b/package/libcec/libcec.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7f7da95a4c1e7160d42ca37a3ac80cf6f389b317e14816949e0fa5e2edf4cc64  libcec-7.1.1.tar.gz
-sha256  0137261d24ce001fc5237aacddd267533e0f150ac23cf21acffea599f7358f7a  LICENSE.md
+sha256  e4ac4d1dd3559cf83189d29ab40fc5537b5a2beceb82916ef173dac7e50dbfa0  libcec-8.1.7.tar.gz
+sha256  088a32f3caf17e6e76a1a287af32abda65211049593127beb221769f4adfebca  LICENSE.md
diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index 0e730503da..380411e15d 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-LIBCEC_VERSION = 7.1.1
+LIBCEC_VERSION = 8.1.7
 LIBCEC_SITE = $(call github,Pulse-Eight,libcec,libcec-$(LIBCEC_VERSION))
 LIBCEC_LICENSE = GPL-2.0+
 LIBCEC_LICENSE_FILES = LICENSE.md
 
 LIBCEC_INSTALL_STAGING = YES
-LIBCEC_DEPENDENCIES = host-pkgconf libplatform
+LIBCEC_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_HAS_LIBUDEV),y)
 LIBCEC_DEPENDENCIES += libudev
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
