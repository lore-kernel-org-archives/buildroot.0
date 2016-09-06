From: Allan Chandler <allan.chandler@dti.com.au>
Date: Tue, 6 Sep 2016 02:39:21 +0000
Subject: [Buildroot] Problem with qt5webkit on ARM?
Message-ID: <FD3EC9758442224FA81FA20FD6F1AE8C64833190@mx01.dti.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We are trying to get the qt5webkit (5.5.0 from BR 2015.11) package running on an iMX6 device and we're getting asserts from the code.

Originally, I thought it may be our application (a cut-down browser) but it appears the browser in the qt5webkit-examples package has exactly the same issue.

It manifests itself with the output (the last section is the important one):
=====
QEglFSVivIntegration will set environment variable FB_MULTI_BUFFER=2 to enable double buffering and vsync.
If this is not desired, you can override this via: export QT_EGLFS_IMX6_NO_FB_MULTI_BUFFER=1

Unable to query physical screen size, defaulting to 100 dpi.
To override, set QT_QPA_EGLFS_PHYSICAL_WIDTH and QT_QPA_EGLFS_PHYSICAL_HEIGHT (in millimeters).

ASSERTION FAILED: isPointerTypeAlignmentOkay(reinterpret_cast<TypePtr>(ptr))
../WTF/wtf/StdLibExtras.h(102) : TypePtr reinterpret_cast_ptr(const void*) [with TypePtr = const unsigned int*]
Segmentation fault (core dumped)
=====

The line doing the assert check is in the following code:
=====
template<typename TypePtr>
TypePtr reinterpret_cast_ptr(const void* ptr)
{
    ASSERT(isPointerTypeAlignmentOkay(reinterpret_cast<TypePtr>(ptr)));
    return reinterpret_cast<TypePtr>(ptr);
}
=====

Now I think I understand WHY this is being done. From (admittedly faded) memory, early ARM chips would fault with an unaligned access and even later ones that don't fault, still run slower.

What I DON'T understand is why standard code with the BR distribution is failing. The assert is clearly within a section that's only compiled for ARM/MIPS under GCC/CLANG so it's very specific to those platforms. And it's appears not to be an issue with my code (a risky assertion given how hard I normally ridicule those who also assert this) since the webkit example browser also asserts.

For now, I have added a local patch:
=====
diff --git a/Source/WTF/wtf/StdLibExtras.h b/Source/WTF/wtf/StdLibExtras.h
--- a/Source/WTF/wtf/StdLibExtras.h 2000-01-01 00:00:00.000000000 +0000
+++ b/Source/WTF/wtf/StdLibExtras.h 2000-01-01 00:00:00.000000000 +0000
@@ -86,5 +86,5 @@
template<typename Type>
bool isPointerTypeAlignmentOkay(Type* ptr)
{
-    return !(reinterpret_cast<intptr_t>(ptr) % __alignof__(Type));
+    return true;
}
=====
to get around this issue but I'm wondering if anyone else has run into this, or whether there are others out there running qt5webkit on ARM systems.

Regards,
Al.


Allan Chandler | Software Engineer

DTI Group Ltd | Transit Security & Surveillance

31 Affleck Road, Perth Airport, WA 6105, AU

P | F | allan.chandler at dti.com.au



Visit our website www.dti.com.au<http://www.dti.com.au>

The information contained in this email is confidential. If you receive this email in error, please inform DTI Group Ltd via the above contact details. If you are not the intended recipient, you may not use or disclose the information contained in this email or attachments.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160906/c4a5b012/attachment.html>
