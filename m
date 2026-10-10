Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F95CA9EC0
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 08:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9C0360658;
	Sat, 10 Oct 2026 08:25:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r1BFlAW5jKOr; Sat, 10 Oct 2026 08:25:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6528460662
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791620746;
	b=J29eDSQzYrgka7E6/jkXUJboadhyZqSN/BFAWRnKl3R2wwXbB7I0OKbzLFLrYW33Kmyx
	 kVFvNED5B3ViayAPuiNOXkHmQkaUVgVqdUYrxRmU9nl7lXut9qafuviCvQKn0XCsMeqwv
	 sCfGWmARBtgOb1hxs3GfFonlVHuDGN0nJYmJpUKad6TKl/5fVuTHnvvtrGPdERNpXad7X
	 I7sOi6CX8z3sAJpIE4rVfivnxrQMZshEsGnyqROvE81zt08XsO5Hu7/01jFPQgue4EHOA
	 PDykx4u7yYaErNWfbdeGXek1PvAVuQ2qXZXxvqfCjmmmgBBIScWkbJyJAA7Kmka2uRw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791620746;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WCeZToskDbA4xE+k0N0DbFDgS5ERHv0gBQrjnNdn1vk=;
	b=XP4rVswQzvnE+gpZ07Gr9U1YF1ONAVFcrwWTWE+9SQla3ZjpJeOdK4Qu3FXQtFZmqtQ4
	 1vFg93FFvc8hgtGI5Wn115OXE3l1Ayoihy7NL84w0NL1/lg1KfffIauO6lRqNepfwAO6u
	 ingl9Tb2bH8ajFa0LJBtvbF1gkRcVJ9jC7VzZTyvSuUgkGCP9P1hXM/5MgQoHAILfHg4A
	 2g1sYAUMy2sQ02pfrNNcFRET38BOCBZtgJnh04A7XtrcsIMyE817ZRZCO+IKEtVrK5Fea
	 rC0HkoLCQRWRP836DVZbamcSOU4OGh/ZU1lCZbDo05yrDT78saxLPR7sxpO0J1y3n1A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791620746;
	bh=WCeZToskDbA4xE+k0N0DbFDgS5ERHv0gBQrjnNdn1vk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RS2rilEwxaxyCDGgOOiUUmTH3CpmkHTEKV8nnM30MFMYKbia+lKyt627US5KPJl0r
	 UNXKqRnBAftoLwdyuuFCW4b/7daZqCbzksDOq1zr9iukiT3L4osIQFCHH+gkz5WDZI
	 Lmk4MYzUw7k7vPlM37Tifzi8t9yJT8XP7MxPtEKNBQz5ZZtHoPCib4sn3btN1/8lKW
	 chzaPnvTTOjxvExxKdx/5QmdvF4LSJWnRhPAAdIIkuAGHWDA27Hxe34vfKMvuCXycK
	 cSRCndpMrwloX1icS55EEJgUebWdOHyHDHG/AeDiY8uvNLZcJzMORH9DfepQUUNZsG
	 2c3aSRwSTMc5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6528460662;
	Sat, 10 Oct 2026 08:25:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F218380
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65A1340004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:25:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dEwPw5WGCAP9 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 08:25:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 839F94006F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791620742;
 b=dGx5J0AbfFjIr6J5t3bpuArA/fMJJSTFNvJExKIJodQZpBys1shhrvkq7f46dnA5iok5
 urnuuT0riRna8KlfiOts7LzC6imfi/REpJGm9RlxzoAoxWtPPcN50NCWQhNReOYaTmZh/
 g6NRg2ZLdzrGF1Hh7m1vTRriWd8xv73x2rWwp8JPDuXMSP80UxCJSRVN9zfgmdc0as4wr
 lvKASkpBTz/ciswb5HSn45TjHyfudoiMttvvuQvsqftf5mhADgRrtzAUyNvdI9gBPv8Pr
 YdBW4Aln4TEQKAlvigzvgXvYo13zBCGfdyyAvJhfF33chHbZ9uBYKo5ldhXLz9ku3/w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791620742;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=/f6XpzHkCDgCiGwv/ZbAPtGb/xQx2XgZF4IOem3ZgCA=;
 b=UKoJZtI1wA9ARbkFgTzmWzYe0oF1LjDFdv303ndturqvE31mX7EpxYdShD9vZ0KDOQZ+
 747VMHOYK7UNc38RXetd+5w1cMvXgxZZxjEZ9ROYUP1HVrlykLdpsdKBfVDVGeBgpVfaF
 qAhAx8oYmGTd0HCLN08IlinEXPPHxQsinyU9WispgC/H4Mi2iNXvmIN3ZCyBV3rohWyvI
 x7b09iLuvuIHECd8+orjGjGpxwyfQOwTGCYmsc1dUjnJ2+6Fc4rM1fc9svUfE9wIXD6u+
 F0lJXKRgG6wunIh15Sd5HuXmgKLzrKZ/HtUXIRPni/xrJORUjhWlfh4RaPzX9UnMcJg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 839F94006F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:25:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4962C8EF19; Sat, 10 Oct 2026 08:24:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 10:16:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 74e263769831e7e7b68c16980292c0261c518155
X-Git-Newrev: 237f432e3a02e6da95242a7409f60f7d7660e321
X-Patchwork-Hint: ignore
Message-Id: <20261010082424.4962C8EF19@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyqt5: fix build with
 python-3.15
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/237f432e3a02e6da95242a7409f60f7d7660e321
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Please note that the upstream repo is private so we used the Debian
mirror as source for patch 0003 which is marked as a cherry-pick by
upstream.

Other mirrors are not updated: https://github.com/baoboa/pyqt5/issues/76

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0003-Support-for-Python-v3.15.patch            | 185 +++++++++++++++++++++
 .../0004-configure.py-remove-Py_LIMITED_API.patch  |  37 +++++
 2 files changed, 222 insertions(+)

diff --git a/package/python-pyqt5/0003-Support-for-Python-v3.15.patch b/package/python-pyqt5/0003-Support-for-Python-v3.15.patch
new file mode 100644
index 0000000000..ec39817b6d
--- /dev/null
+++ b/package/python-pyqt5/0003-Support-for-Python-v3.15.patch
@@ -0,0 +1,185 @@
+From: Phil Thompson <phil@riverbankcomputing.com>
+Date: Mon, 13 Jul 2026 16:38:52 +0100
+Subject: Support for Python v3.15
+
+The project can now be built with Python v3.15 (where the limited ABI
+version targeted will be v3.13).
+
+(cherry picked from commit 3aa6092c44cd17a3afcd9f8ca879c4e40d2662d1)
+
+Upstream: https://salsa.debian.org/python-team/packages/pyqt5/-/blob/1c7499d1d4d79737ae367ec263a9be71ce2b76ee/debian/patches/Support-for-Python-v3.15.patch
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ project.py                             |  8 +++++++
+ qpy/QtCore/qpycore_pyqtproperty.cpp    |  2 +-
+ qpy/QtCore/qpycore_pyqtslot.cpp        | 44 ++++++++++++++++++++++++++--------
+ qpy/QtCore/qpycore_qobject_helpers.cpp | 11 +++++----
+ 4 files changed, 49 insertions(+), 16 deletions(-)
+
+diff --git a/project.py b/project.py
+index 9a3721f..f2143ac 100644
+--- a/project.py
++++ b/project.py
+@@ -111,6 +111,14 @@ del find_qt
+ 
+         return dunder_init
+ 
++    def get_limited_abi_version(self):
++        """ Return the version number of the limited ABI to use. """
++
++        # We use PyWeakref_GetObject() which was removed from the limited API
++        # in Python v3.15.  It's replacement, PyWeakref_GetRef() was added to
++        # the limited ABI in Python v3.13.
++        return (3, 13, 0) if sys.hexversion >= 0x030f0000 else None
++
+     def get_options(self):
+         """ Return the sequence of configurable options. """
+ 
+diff --git a/qpy/QtCore/qpycore_pyqtproperty.cpp b/qpy/QtCore/qpycore_pyqtproperty.cpp
+index d173d51..0245134 100644
+--- a/qpy/QtCore/qpycore_pyqtproperty.cpp
++++ b/qpy/QtCore/qpycore_pyqtproperty.cpp
+@@ -575,7 +575,7 @@ static PyObject *pyqtProperty_reset(PyObject *self, PyObject *reset)
+ static qpycore_pyqtProperty *clone(qpycore_pyqtProperty *orig)
+ {
+     qpycore_pyqtProperty *pp = (qpycore_pyqtProperty *)PyType_GenericNew(
+-            Py_TYPE(orig), 0, 0);
++            Py_TYPE((PyObject *)orig), 0, 0);
+ 
+     if (pp)
+     {
+diff --git a/qpy/QtCore/qpycore_pyqtslot.cpp b/qpy/QtCore/qpycore_pyqtslot.cpp
+index 26f4022..22a7d0c 100644
+--- a/qpy/QtCore/qpycore_pyqtslot.cpp
++++ b/qpy/QtCore/qpycore_pyqtslot.cpp
+@@ -101,7 +101,9 @@ PyQtSlot::Result PyQtSlot::invoke(void **qargs, PyObject *self, void *result,
+     else
+     {
+         // Use the value we have if one wasn't supplied.
+-        if (!self)
++        if (self)
++            Py_INCREF(self);
++        else
+             self = instance();
+ 
+         // If self is NULL then we didn't have a method in the first place.
+@@ -112,12 +114,18 @@ PyQtSlot::Result PyQtSlot::invoke(void **qargs, PyObject *self, void *result,
+ 
+         // See if the instance has gone (which isn't an error).
+         if (self == Py_None)
++        {
++            Py_DECREF(self);
+             return PyQtSlot::Ignored;
++        }
+ 
+         // If the receiver wraps a C++ object then ignore the call if it no
+         // longer exists.
+         if (!no_receiver_check && PyObject_TypeCheck(self, sipSimpleWrapper_Type) && !sipGetAddress((sipSimpleWrapper *)self))
++        {
++            Py_DECREF(self);
+             return PyQtSlot::Ignored;
++        }
+ 
+         sipMethodDef callable_m;
+ 
+@@ -128,6 +136,7 @@ PyQtSlot::Result PyQtSlot::invoke(void **qargs, PyObject *self, void *result,
+ #endif
+ 
+         callable = sipFromMethod(&callable_m);
++        Py_DECREF(self);
+     }
+ 
+     // Convert the C++ arguments to Python objects.
+@@ -188,12 +197,11 @@ bool PyQtSlot::operator==(PyObject *callable) const
+         if (other)
+             return false;
+ 
+-        return (mfunc == callable_m.pm_function
+-                && instance() == callable_m.pm_self
+-#if PY_MAJOR_VERSION < 3
+-                && mclass == callable_m.pm_class
+-#endif
+-                );
++        PyObject *instance_obj = instance();
++        bool res = (mfunc == callable_m.pm_function && instance_obj == callable_m.pm_self);
++        Py_XDECREF(instance_obj);
++
++        return res;
+     }
+ 
+     if (!other)
+@@ -214,14 +222,30 @@ bool PyQtSlot::operator==(PyObject *callable) const
+ }
+ 
+ 
+-// Get the instance object.
++// Get a strong reference to the instance object, otherwise return NULL or a
++// strong reference to Py_None.
+ PyObject *PyQtSlot::instance() const
+ {
++    PyObject *instance_obj;
++
+     // Use the weak reference if possible.
+     if (mself_wr)
+-        return PyWeakref_GetObject(mself_wr);
++    {
++#if PY_VERSION_HEX >= 0x030f0000
++        if (PyWeakref_GetRef(mself_wr, &instance_obj) < 0)
++            instance_obj = NULL;
++#else
++        instance_obj = PyWeakref_GetObject(mself_wr);
++        Py_XINCREF(instance_obj);
++#endif
++    }
++    else
++    {
++        instance_obj = mself;
++        Py_XINCREF(instance_obj);
++    }
+ 
+-    return mself;
++    return instance_obj;
+ }
+ 
+ 
+diff --git a/qpy/QtCore/qpycore_qobject_helpers.cpp b/qpy/QtCore/qpycore_qobject_helpers.cpp
+index f72105c..7b756ec 100644
+--- a/qpy/QtCore/qpycore_qobject_helpers.cpp
++++ b/qpy/QtCore/qpycore_qobject_helpers.cpp
+@@ -50,7 +50,7 @@ static int qt_metacall_worker(sipSimpleWrapper *pySelf, PyTypeObject *pytype,
+ const QMetaObject *qpycore_qobject_metaobject(sipSimpleWrapper *pySelf,
+         sipTypeDef *base)
+ {
+-    sipWrapperType *wt = (pySelf ? (sipWrapperType *)Py_TYPE(pySelf) : 0);
++    sipWrapperType *wt = (pySelf ? (sipWrapperType *)Py_TYPE((PyObject *)pySelf) : 0);
+ 
+     return qpycore_get_qmetaobject(wt, base);
+ }
+@@ -64,7 +64,8 @@ int qpycore_qobject_qt_metacall(sipSimpleWrapper *pySelf, sipTypeDef *base,
+     if (!pySelf)
+         return -1;
+ 
+-    return qt_metacall_worker(pySelf, Py_TYPE(pySelf), base, _c, _id, _a);
++    return qt_metacall_worker(pySelf, Py_TYPE((PyObject *)pySelf), base, _c,
++            _id, _a);
+ }
+ 
+ 
+@@ -236,13 +237,13 @@ bool qpycore_qobject_qt_metacast(sipSimpleWrapper *pySelf,
+ 
+     // We only need to look at the MRO if the object is a wrapped type (rather
+     // than a user sub-class).
+-    if (base_pytype != Py_TYPE(pySelf))
++    if (base_pytype != Py_TYPE((PyObject *)pySelf))
+     {
+         PyObject *mro;
+ 
+ #if PY_VERSION_HEX >= 0x03040000
+-        mro = PyObject_GetAttr((PyObject *)Py_TYPE(pySelf),
+-                qpycore_dunder_mro);
++        mro = PyObject_GetAttr(
++                (PyObject *)Py_TYPE((PyObject *)pySelf), qpycore_dunder_mro);
+         Q_ASSERT(mro);
+ #else
+         mro = Py_TYPE(pySelf)->tp_mro;
diff --git a/package/python-pyqt5/0004-configure.py-remove-Py_LIMITED_API.patch b/package/python-pyqt5/0004-configure.py-remove-Py_LIMITED_API.patch
new file mode 100644
index 0000000000..f3af7b7fa5
--- /dev/null
+++ b/package/python-pyqt5/0004-configure.py-remove-Py_LIMITED_API.patch
@@ -0,0 +1,37 @@
+From 2fbf73d6678e956a6240a6518371ea4bde158bb6 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 4 Oct 2026 14:34:24 +0200
+Subject: [PATCH] configure.py: remove Py_LIMITED_API
+
+PyWeakref_GetRef is needed since python 3.15 and used by patch 0003 to
+fix build errors, but PyWeakref_GetRef is only available when
+Py_LIMITED_API+0 >= 0x030D0000:
+https://github.com/python/cpython/blob/v3.15.0rc3/Include/weakrefobject.h#L32
+
+To fix the build error we remove the define set by configure.py.
+
+Upstream: not applicable, file was removed upstream:
+https://salsa.debian.org/python-team/packages/pyqt5/-/blob/debian/5.15.11+dfsg-7/ChangeLog#L33
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ configure.py | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/configure.py b/configure.py
+index a3450ca3..14e4e925 100644
+--- a/configure.py
++++ b/configure.py
+@@ -2673,9 +2673,6 @@ target.files = $$PY_MODULE
+ 
+     if metadata.qpy_lib:
+         # This is the easiest way to make sure it is set for handwritten code.
+-        if not target_config.py_debug:
+-            pro_lines.append('DEFINES += Py_LIMITED_API=0x03040000')
+-
+         pro_lines.append('INCLUDEPATH += %s' %
+                 qmake_quote(os.path.relpath(source_path('qpy', mname), mname)))
+ 
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
