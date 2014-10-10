From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 10 Oct 2014 10:37:33 +0100
Subject: [Buildroot] [PATCH] kmod: add host-automake dependency
In-Reply-To: <5437A3A0.2040600@imgtec.com>
References: <1412930455-40512-1-git-send-email-Vincent.Riera@imgtec.com>
 <20141010110634.2ef7a7a5@free-electrons.com> <5437A3A0.2040600@imgtec.com>
Message-ID: <5437A8DD.2050703@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 10/10/2014 10:15 AM, Vicente Olivert Riera wrote:
> Dear Thomas Petazzoni,
>
> On 10/10/2014 10:06 AM, Thomas Petazzoni wrote:
>> Dear Vicente Olivert Riera,
>>
>> On Fri, 10 Oct 2014 09:40:55 +0100, Vicente Olivert Riera wrote:
>>> kmod can fail to build in systems which have old automake versions like
>>> CentOS 6.5, for instance. It will cause an error like this one:
>>>
>>> /buildroot/output/build/kmod-18/build-aux/missing: line 81:
>>> aclocal-1.14: command not found
>>>
>>> Adding host-automake as a dependency fixes the problem.
>>>
>>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>>> Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>
>>> ---
>>>   package/kmod/kmod.mk |    4 ++--
>>>   1 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
>>> index 1f170dd..c0212bb 100644
>>> --- a/package/kmod/kmod.mk
>>> +++ b/package/kmod/kmod.mk
>>> @@ -8,8 +8,8 @@ KMOD_VERSION = 18
>>>   KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
>>>   KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod
>>>   KMOD_INSTALL_STAGING = YES
>>> -KMOD_DEPENDENCIES = host-pkgconf
>>> -HOST_KMOD_DEPENDENCIES = host-pkgconf
>>> +KMOD_DEPENDENCIES = host-automake host-pkgconf
>>> +HOST_KMOD_DEPENDENCIES = host-automake host-pkgconf
>>>
>>>   # license info for libkmod only, conditionally add more below
>>>   KMOD_LICENSE = LGPLv2.1+
>>
>> This seems wrong. Why not use KMOD_AUTORECONF = YES instead?
>
> I have tried it and it fails:
>
>  >>> kmod 18 Autoreconfiguring
> libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, `build-aux'.
> libtoolize: copying file `build-aux/ltmain.sh'
> libtoolize: putting macros in AC_CONFIG_MACRO_DIR, `m4'.
> libtoolize: copying file `m4/libtool.m4'
> libtoolize: copying file `m4/ltoptions.m4'
> libtoolize: copying file `m4/ltsugar.m4'
> libtoolize: copying file `m4/ltversion.m4'
> libtoolize: copying file `m4/lt~obsolete.m4'
> libkmod/docs/gtk-doc.make:270: error: HAVE_GTK_DOC does not appear in
> AM_CONDITIONAL
> libkmod/docs/Makefile.am:33:   'libkmod/docs/gtk-doc.make' included from
> here
>
> And also, if the kmod-0002-add-backup-implementation-of-be32toh.patch
> modifies the configure.ac file, and there is no KMOD_AUTORECONF = YES in
> the kmod.mk file, why don't we clean that patch by removing the
> configure.ac bit?
>
> Regards,
>

this patch also fixes the problem, and it doesn't have host-autoreconf 
the the dependencies. Do you think it's better?

===== BEGIN PATCH =====
 From 2ccaa31b38ce1da075e5fb59d4addbd9bb1db10b Mon Sep 17 00:00:00 2001
From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 10 Oct 2014 10:32:59 +0100
Subject: [PATCH] kmod: Disable documentation

And also add AUTORECONF = YES since the configure.ac script is modified.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
  package/kmod/kmod-0003-disable-documentation.patch |   22 
++++++++++++++++++++
  package/kmod/kmod.mk                               |    1 +
  2 files changed, 23 insertions(+), 0 deletions(-)
  create mode 100644 package/kmod/kmod-0003-disable-documentation.patch

diff --git a/package/kmod/kmod-0003-disable-documentation.patch 
b/package/kmod/kmod-0003-disable-documentation.patch
new file mode 100644
index 0000000..edbd131
--- /dev/null
+++ b/package/kmod/kmod-0003-disable-documentation.patch
@@ -0,0 +1,22 @@
+diff -rup a/configure.ac b/configure.ac
+--- a/configure.ac	2014-10-10 10:26:16.441334151 +0100
++++ b/configure.ac	2014-10-10 10:27:12.757298124 +0100
+@@ -220,9 +220,6 @@ AC_SUBST([GCLDFLAGS], $with_ldflags)
+ AC_CONFIG_HEADERS(config.h)
+ AC_CONFIG_FILES([
+ 	Makefile
+-	man/Makefile
+-	libkmod/docs/Makefile
+-	libkmod/docs/version.xml
+ ])
+
+
+diff -rup a/Makefile.am b/Makefile.am
+--- a/Makefile.am	2014-06-14 16:32:32.546850173 +0100
++++ b/Makefile.am	2014-10-10 10:29:32.405688866 +0100
+@@ -1,4 +1,4 @@
+-SUBDIRS = . libkmod/docs
++SUBDIRS = .
+
+ if BUILD_MANPAGES
+ SUBDIRS += man
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 1f170dd..fda7843 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -8,6 +8,7 @@ KMOD_VERSION = 18
  KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
  KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod
  KMOD_INSTALL_STAGING = YES
+KMOD_AUTORECONF = YES
  KMOD_DEPENDENCIES = host-pkgconf
  HOST_KMOD_DEPENDENCIES = host-pkgconf

-- 
1.7.1

===== END PATCH =====

-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
