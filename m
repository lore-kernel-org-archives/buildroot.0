Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B15C982DD
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 19:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73F8481327;
	Fri, 18 Sep 2026 19:54:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VoukrukweeXR; Fri, 18 Sep 2026 19:54:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4E035812FF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789761293;
	b=GI22BN43WqytiwiqnVnTMdG9YXpZqRZlKkRZuVaTrQNnR7JlFXBPOTzR6aOR0BSdahSl
	 c4xdJIWf6o5TWglNc2NVay5DJr3bApvvi4oED5kVZKyjQtTwozLHspaTPVJ5fg7r6UyDz
	 fqmcQfzZpZq91nDV1jbX8lctZeobrmvUOfFkfRW2kzmTa/sci9UdvSSuStNjQFahXRWGQ
	 hPIiaMNGEOfuaOS6tDR8LcY3LxDAatgpfPD/14kwYalvpaPB8KKfrONKc0+m/Jp+Klc3N
	 8CDfRbdymDvFfha1F+tBBk2gEC/3BYl+2w30Gjp56bFQ+XgR1+c0pULv9ErHSqpGFww==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789761293;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=neu/Fomv4F7rtQFUQE3H23mD9VqU7Ycw+IyBOwk4aQA=;
	b=oZQLWjKmyPFB7oBfA8ZhT75lBlGfphju/aM5d6R8PQW5WGzjQE21Ur4Q3AVz1j37pjmH
	 EkEyJAdGczxEmQo0/b70ifpol7DknZ1KROUApF08n+Zxpl+bV//gtR1n4GrCdm8tidlw1
	 Wc6Qn2g7SJlucg0bFGda8kuSIcKtLD8lHOfrgQ6O9MbexfUeN4JxxJCF+SWPFCSe2XSZD
	 pmVgRL9zWKF+wNlrvydH/8fSxjN2iy7d9j2KL3pK8xhwwNMDZoYVELujl/4J7KnnU7J2V
	 NasQP2LGm2Loz9sXug05Da83+3UVH3GP5Y90b+21vAYSz7KRtQYmDDevQ9d5pbq7hdQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789761293;
	bh=neu/Fomv4F7rtQFUQE3H23mD9VqU7Ycw+IyBOwk4aQA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Rdtu5WOtN7NpzwntC4vZgutsQumBiyR2DFz5OniE9XmH7GKn4lt824rdkkiyOODKJ
	 vmyeQM5JbSR3PYy/qsVKQ3LTG/qBv/2QEflqmi8iDt06YJNFj7OvGZUbESU2W2jVpw
	 leS40tI/I8baJb0gLMS1JNKaf/TBf8DTPYIXsSwZZivkt6zVNbplbLnzJdqWBF30vI
	 Z/plD8/EQXUveIA169aBWT+5xnzJehq7M/SttrU7PCLIzG/AFgWZN9noGsNCMAezVn
	 XZSJjzJcYoCIgXwQp/kPBua9NuaZnPdaE4nrBzba5EHDt7aRvedNA7Q/WrwqrnPlpL
	 XVe6rUIY7kt/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E035812FF;
	Fri, 18 Sep 2026 19:54:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8175B42D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6740081301
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 70z1EiT6xYyf for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 19:54:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 796BE812FF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789761281;
 b=W7e0FwQ81DTWXuIUfOWjWadrF9SkJQekd0PttxjRJmpLvg8nQLyC9qtacVT+CVN0s80M
 gwooiJN7Es8xEjByBlESdGCitdPCkR2xbYqw5q+SMM3GKp+VHzUziZvSZrFNPBI/dLrE7
 9f8WTtgnFQSLOkMRe6n+oDToVUmSoV1rALmOXa3SNf/usKRNsiKgpgQmWzvL52TIKYG1x
 DKP+nhZUQa1HYstV/sRDg7IXLgYUC3I1YSek9+N8ThzsXTOu7IIGqy96d7RYEttwZgETA
 +n4ikKjo9zChpkEPVUDBh96c1ZDBiMwMzS1zdp5qNi8lJlz0YcbFolbEcvaR1ccnIcA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789761281;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=swue6lko2THnucN455G94NgQb/W3GXDx4crRX6x0aMQ=;
 b=kPTazG1aItvmCijybIwzIW/QxmmY85eCcqRMuDhnrGd7vabf6FHfXYo/XZiE4yEteS9H
 F+bOGLNy0DPAwK6sG27ahNFhUHhu7cwPEsorrfJVuj/n5jcfSWJTH15sFToFa+POdvna9
 FLU7sUGQr+Qa5wLfj3IBAbMI8Ousa7WaFY9aUFZPVJ6ohwB7dtdJKa8QROLGWfNB6XLfN
 CGz/30VdsJJHXqR2Par8zlX1ZFKnhg9YZbgj8ZZMkrCbIspJRMpXFwWHjcLMLZUnChppb
 G3IkBAqfxkyBhCFwjyazp3AnofoaQt2uURCCKNiBiufpGqEZHm8h5+uPRr5rEn6vKFw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 796BE812FF
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:54:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 01ED295C6E; Fri, 18 Sep 2026 19:53:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 21:52:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9aeb5f6f5c50baf7e02248b58c98efc562554b6b
X-Git-Newrev: 46d379207dd2132f00f89f689284e6e18592bd33
X-Patchwork-Hint: ignore
Message-Id: <20260918195334.01ED295C6E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcec: fix build with swig >=
 4.5.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/46d379207dd2132f00f89f689284e6e18592bd33
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Patch 0002 fixes the build with swig >= 4.5.0.
Patch 0001 is needed to cleanly apply patch 0002.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...n-strDeviceLanguage-accepts-3-char-ISO-co.patch | 66 ++++++++++++++++++
 ...-the-Python-wrapper-against-SWIG-4.5-whic.patch | 78 ++++++++++++++++++++++
 2 files changed, 144 insertions(+)

diff --git a/package/libcec/0001-fixed-Python-strDeviceLanguage-accepts-3-char-ISO-co.patch b/package/libcec/0001-fixed-Python-strDeviceLanguage-accepts-3-char-ISO-co.patch
new file mode 100644
index 0000000000..e2a86e1f7e
--- /dev/null
+++ b/package/libcec/0001-fixed-Python-strDeviceLanguage-accepts-3-char-ISO-co.patch
@@ -0,0 +1,66 @@
+From f53490e23037f17b68043f5e1ff2f4378d227d56 Mon Sep 17 00:00:00 2001
+From: Lars Op den Kamp <lars@opdenkamp.eu>
+Date: Mon, 13 Jul 2026 15:24:27 +0200
+Subject: [PATCH] fixed: Python strDeviceLanguage accepts 3-char ISO codes
+ (SWIG char[3] typemap)
+
+The SWIG default char[ANY] setter uses SWIG_AsCharArray, which reserves a
+byte for a NUL terminator. strDeviceLanguage is a raw, non-terminated
+char[3] holding a 3-character ISO 639-2 code, so a valid 3-char value needs
+4 bytes and overflowed the buffer, raising a TypeError; only 2-char codes
+fit. Add member-name-scoped in/memberin typemaps that copy the raw bytes
+(str or bytes) so 3-char codes assign correctly. Scoped by name so the
+NUL-terminated strDeviceName keeps the default behaviour.
+
+Upstream: https://github.com/Pulse-Eight/libcec/commit/f53490e23037f17b68043f5e1ff2f4378d227d56
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/libcec/libcec.i | 31 +++++++++++++++++++++++++++++++
+ 1 file changed, 31 insertions(+)
+
+diff --git a/src/libcec/libcec.i b/src/libcec/libcec.i
+index a01f9afc..520ff7af 100644
+--- a/src/libcec/libcec.i
++++ b/src/libcec/libcec.i
+@@ -15,6 +15,37 @@
+   $result = PyString_FromString($1.name);
+ }
+ 
++/////// libcec_configuration::strDeviceLanguage ///////
++// strDeviceLanguage is a raw, fixed-size char[3] that is NOT NUL-terminated (a
++// 3-character ISO 639-2 code). SWIG's default char[ANY] setter reserves a byte
++// for a terminator, so a valid 3-char code needs 4 bytes and overflows the
++// buffer, raising a TypeError; only 2-char codes fit. Copy the raw bytes
++// instead (accepting str or bytes), scoped to this member by name so the
++// NUL-terminated strDeviceName keeps the default behaviour.
++%typemap(in) char strDeviceLanguage[ANY] (char temp[$1_dim0]) {
++  char *cptr = 0; size_t csize = 0; int alloc = SWIG_OLDOBJ;
++  int res = SWIG_AsCharPtrAndSize($input, &cptr, &csize, &alloc);
++  if (!SWIG_IsOK(res)) {
++    %argument_fail(res, "char [$1_dim0]", $symname, $argnum);
++  }
++  {
++    /* csize counts the trailing NUL; strDeviceLanguage stores no terminator */
++    size_t slen = (csize > 0) ? csize - 1 : 0;
++    if (slen > (size_t)($1_dim0)) {
++      if (alloc == SWIG_NEWOBJ) %delete_array(cptr);
++      %argument_fail(SWIG_ValueError, "char [$1_dim0]", $symname, $argnum);
++    }
++    memset(temp, 0, $1_dim0);
++    if (slen) memcpy(temp, cptr, slen);
++  }
++  $1 = temp;
++  if (alloc == SWIG_NEWOBJ) %delete_array(cptr);
++}
++
++%typemap(memberin) char strDeviceLanguage[ANY] {
++  memcpy($1, $input, $1_dim0 * sizeof(char));
++}
++
+ /////// replace operator[]() ///////
+ 
+ // CEC::cec_datapacket::operator[]()
+-- 
+2.47.3
+
diff --git a/package/libcec/0002-fixed-build-the-Python-wrapper-against-SWIG-4.5-whic.patch b/package/libcec/0002-fixed-build-the-Python-wrapper-against-SWIG-4.5-whic.patch
new file mode 100644
index 0000000000..351091e17d
--- /dev/null
+++ b/package/libcec/0002-fixed-build-the-Python-wrapper-against-SWIG-4.5-whic.patch
@@ -0,0 +1,78 @@
+From 55f3443559b0b32a1d7194e424727575faf6f7d4 Mon Sep 17 00:00:00 2001
+From: Lars Op den Kamp <lars@opdenkamp.eu>
+Date: Fri, 31 Jul 2026 14:46:27 +0200
+Subject: [PATCH] fixed: build the Python wrapper against SWIG 4.5, which
+ removed the Python 2 compatibility macros
+
+SWIG 4.5 dropped the PyInt_*/PyString_* macros that pyhead.swg used to define
+for user typemaps. Two places here relied on them.
+
+The callback return handling keeps a PY_MAJOR_VERSION guard rather than moving
+to the Python 3 API outright, because the x86 Windows build still targets
+Python 2 for the EventGhost plugin. A Python 2 int is a PyIntObject, not a
+PyLongObject, so an unguarded PyLong_Check would compile there and then
+silently read every commandHandler and menuStateChanged return value as 0 - the
+one thing those callbacks exist to report. SWIG never reads SwigHelper.h, so
+the C preprocessor makes the choice and the file is SWIG-version independent.
+
+The cec_osd_name out-typemap is deleted rather than fixed, because it is dead:
+GetDeviceOSDName returns std::string, and cec_osd_name only survives as an out
+parameter in the C API, which is not wrapped. It could not have compiled if it
+ever did fire - cec_osd_name is a typedef for char[14], so the $1.name it
+dereferences has no member to name. Removing it leaves the generated wrapper
+byte-for-byte identical.
+
+Verified by preprocessing SwigHelper.h against both Python 3.10 and Python 2.7:
+Python 3 resolves to PyObject_CallObject/PyLong_AsLong with no removed macro
+surviving anywhere, Python 2 to PyEval_CallObject/PyInt_AsLong.
+
+closes #726
+
+Upstream: https://github.com/Pulse-Eight/libcec/commit/55f3443559b0b32a1d7194e424727575faf6f7d4
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/libcec/SwigHelper.h | 9 +++++++++
+ src/libcec/libcec.i     | 4 ----
+ 2 files changed, 9 insertions(+), 4 deletions(-)
+
+diff --git a/src/libcec/SwigHelper.h b/src/libcec/SwigHelper.h
+index 3c40fc87..0752acb2 100644
+--- a/src/libcec/SwigHelper.h
++++ b/src/libcec/SwigHelper.h
+@@ -137,8 +137,17 @@ namespace CEC
+           Py_DECREF(arglist);
+         if (!!result)
+         {
++          /** SWIG 4.5 removed the PyInt_* compatibility macros it used to define
++              for Python 3, so call the version-appropriate API directly. Note that
++              a Python 2 int is a PyIntObject, not a PyLongObject, so PyLong_Check
++              would silently reject it there. */
++          #if (PY_MAJOR_VERSION < 3)
+           if (PyInt_Check(result))
+             retval = (int)PyInt_AsLong(result);
++          #else // (PY_MAJOR_VERSION >= 3)
++          if (PyLong_Check(result))
++            retval = (int)PyLong_AsLong(result);
++          #endif
+           Py_XDECREF(result);
+         }
+       }
+diff --git a/src/libcec/libcec.i b/src/libcec/libcec.i
+index 520ff7af..0d757aa1 100644
+--- a/src/libcec/libcec.i
++++ b/src/libcec/libcec.i
+@@ -11,10 +11,6 @@
+ 
+ %ignore *::operator=;
+ 
+-%typemap(out) CEC::cec_osd_name {
+-  $result = PyString_FromString($1.name);
+-}
+-
+ /////// libcec_configuration::strDeviceLanguage ///////
+ // strDeviceLanguage is a raw, fixed-size char[3] that is NOT NUL-terminated (a
+ // 3-character ISO 639-2 code). SWIG's default char[ANY] setter reserves a byte
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
