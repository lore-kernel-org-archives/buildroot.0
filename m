From: Pedro Aguilar <paguilar@paguilar.org>
Date: Tue, 04 Nov 2014 01:04:19 +0100
Subject: [Buildroot] [PATCH v2 4/4] guile: new package
In-Reply-To: <20141103082958.2cf6cffe@free-electrons.com>
References: <1414974851-4819-1-git-send-email-paguilar@paguilar.org>	<1414974851-4819-5-git-send-email-paguilar@paguilar.org>
 <20141103082958.2cf6cffe@free-electrons.com>
Message-ID: <54581803.7060705@paguilar.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for your comments and support.

I've already fixed Config.in and guile.mk.

Regarding the guile patches:


On 03/11/2014 08:29, Thomas Petazzoni wrote:
> Dear Pedro Aguilar,
>
> On Mon,  3 Nov 2014 01:34:11 +0100, Pedro Aguilar wrote:
>> diff --git a/package/guile/guile-01-fix_arm_endianness.patch b/package/guile/guile-01-fix_arm_endianness.patch
>> new file mode 100644
>> index 0000000..f3a2092
>> --- /dev/null
>> +++ b/package/guile/guile-01-fix_arm_endianness.patch
>> @@ -0,0 +1,19 @@
>> +Fix support for ARM endianness, otherwise it gives the error
>> +"unknown CPU endianness"
>> +
>> +Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
>
> Can you submit this patch upstream to the guile developers? Please Cc
> me when sending the patch upstream, as I know the Guile maintainer, so
> seeing my name in Cc will probably make him look at the patch :)

I just noticed that this is already fixed in their git repo, so I 
changed the patch that reflects their fix.

>> diff --git a/package/guile/guile-02-calculate-csqrt_manually.patch b/package/guile/guile-02-calculate-csqrt_manually.patch
>> new file mode 100644
>> index 0000000..c56963b
>> --- /dev/null
>> +++ b/package/guile/guile-02-calculate-csqrt_manually.patch
>> @@ -0,0 +1,17 @@
>> +Calculate manually the sqrt() since scm_from_complex_double() gives an error
>> +on ARM using uclibc.
>> +
>> +Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
>> +
>> +diff -Nau guile-2.0.11.orig/libguile/i18n.c guile-2.0.11/libguile/i18n.c
>> +--- guile-2.0.11.orig/libguile/numbers.c	2014-03-12 14:24:54.000000000 +0100
>> ++++ guile-2.0.11/libguile/numbers.c	2014-11-01 21:07:20.301263587 +0100
>> +@@ -10260,8 +10260,6 @@
>> +     {
>> + #if defined HAVE_COMPLEX_DOUBLE && defined HAVE_USABLE_CSQRT	\
>> +       && defined SCM_COMPLEX_VALUE
>> +-      return scm_from_complex_double (csqrt (SCM_COMPLEX_VALUE (z)));
>> +-#else
>> +       double re = SCM_COMPLEX_REAL (z);
>> +       double im = SCM_COMPLEX_IMAG (z);
>> +       return scm_c_make_polar (sqrt (hypot (re, im)),
>
> It would be good to have an upstreamable version of this. Since uClibc
> doesn't implement C99 complex math, I believe HAVE_USABLE_CSQRT should
> be false. Can you check why it isn't the case?

They only use HAVE_USABLE_CSQRT because of a bug in old glibc versions 
and they set it to 1 if this bug is not present. Since uclibc doesn't 
have this bug, HAVE_USABLE_CSQRT is always 1.
I modified configure.ac and if we're cross-compiling, it sets 
HAVE_USABLE_CSQRT to 0. This would be a safe default since disabling 
this define doesn't break anything:

diff -Nau guile-2.0.11.orig/configure.ac guile-2.0.11/configure.ac
--- guile-2.0.11.orig/configure.ac  2014-03-12 14:36:02.000000000 +0100
+++ guile-2.0.11/configure.ac   2014-11-03 23:59:51.897267207 +0100
@@ -862,7 +862,7 @@
  }]])],
      [guile_cv_use_csqrt=yes],
      [guile_cv_use_csqrt="no, glibc 2.3 bug"],
-    [guile_cv_use_csqrt="yes, hopefully (cross-compiling)"])])
+    [guile_cv_use_csqrt="no (cross-compiling)"])])
    case $guile_cv_use_csqrt in
      yes*)
        AC_DEFINE([HAVE_USABLE_CSQRT], 1, [Define to 1 if csqrt is 
bug-free])

>> diff --git a/package/guile/guile-03-undef_use_gnu_local_locale_api.patch b/package/guile/guile-03-undef_use_gnu_local_locale_api.patch
>> new file mode 100644
>> index 0000000..b8ac7c3
>> --- /dev/null
>> +++ b/package/guile/guile-03-undef_use_gnu_local_locale_api.patch
>> @@ -0,0 +1,16 @@
>> +Undef USE_GNU_LOCALE_API since it's not mandatory.
>> +
>> +Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
>> +
>> +diff -Nau guile-2.0.11.orig/libguile/i18n.c guile-2.0.11/libguile/i18n.c
>> +--- guile-2.0.11.orig/libguile/i18n.c	2014-01-21 22:25:11.000000000 +0100
>> ++++ guile-2.0.11/libguile/i18n.c	2014-11-01 21:59:29.001195319 +0100
>> +@@ -54,7 +54,7 @@
>> +    Specifications Issue 7'' (aka. "POSIX 2008"):
>> +
>> +      http://www.opengroup.org/onlinepubs/9699919799/basedefs/locale.h.html  */
>> +-# define USE_GNU_LOCALE_API
>> ++# undef USE_GNU_LOCALE_API
>
> Can you explain a bit more? Again, our goal is to have patches that can
> potentially be accepted by the upstream project.

With this patch I avoid the compilation error 'dereferencing pointer to 
incomplete type' caused by an alias for glibc's locale type.
Since guile works fine without this define, may be the proper patch 
would be to enable/disable it according to the used library (glib, 
uclibc, ...) although I'm not sure how to do this at 'configure' time.

Do you have any suggestion or different ideas?

Thanks!

-- 
Pedro Aguilar
http://paguilar.org
