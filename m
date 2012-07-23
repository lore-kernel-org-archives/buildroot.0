From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 23 Jul 2012 05:44:28 +0200
Subject: [Buildroot] [PATCH 5/5] gettext: convert to autotools-package
In-Reply-To: <CAHXCMMK6B_qmuTS0z9agEWY05zz+GqgvsJuw0qF0Gf=mFx32XQ@mail.gmail.com>
References: <cover.1342732829.git.thomas.petazzoni@free-electrons.com>
 <66a7689f733357af7bb277467bc2198817fc9b69.1342732829.git.thomas.petazzoni@free-electrons.com>
 <CAHXCMMK6B_qmuTS0z9agEWY05zz+GqgvsJuw0qF0Gf=mFx32XQ@mail.gmail.com>
Message-ID: <CAHXCMMLsfSjtf2Cfx=kQHqEgKR8h5Yc_QHRUcy9+bdVnKLVwaA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2012/7/22 Samuel Martin <s.martin49@gmail.com>:
[...]
> ifeq ($(BR2_PACKAGE_GETTEXT_TOOLS),)

> ifeq ($(BR2_ENABLE_LOCALE)\
> $(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_CTNG_uClibc)\
> $(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC),yy)
Just realize that this statement can be simplify like that:
ifeq ($(BR2_ENABLE_LOCALE)$(BR2_NEEDS_GETTEXT),yy)

In this case, maybe BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC should
trigger BR2_NEEDS_GETTEXT too?

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index cc7b4de..4f1c8fb 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -86,6 +86,7 @@ config BR2_NEEDS_GETTEXT
 	bool
 	default y if BR2_TOOLCHAIN_BUILDROOT
 	default y if BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	default y if BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
 	default y if BR2_TOOLCHAIN_CTNG_uClibc

 config BR2_NEEDS_GETTEXT_IF_LOCALE


Tell me if you need I post a proper patch.

Cheers,

-- 
Sam
