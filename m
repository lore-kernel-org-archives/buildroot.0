From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Nov 2014 16:29:36 +0100
Subject: [Buildroot] [PATCH v4 4/4] guile: new package
In-Reply-To: <546E72F4.5040103@paguilar.org>
References: <1415310486-25904-1-git-send-email-paguilar@paguilar.org>
 <1415310486-25904-5-git-send-email-paguilar@paguilar.org>
 <20141118211819.GL4333@free.fr> <546E72F4.5040103@paguilar.org>
Message-ID: <20141123152936.GB4210@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pedro, All,

On 2014-11-21 00:02 +0100, Pedro Aguilar spake thusly:
> On 18/11/2014 22:18, Yann E. MORIN wrote:
[--SNIP--]
> >>diff --git a/package/guile/guile-01-fix_arm_endianness.patch b/package/guile/guile-01-fix_arm_endianness.patch
> >>new file mode 100644
> >>index 0000000..a30a241
> >>--- /dev/null
> >>+++ b/package/guile/guile-01-fix_arm_endianness.patch
> >>@@ -0,0 +1,25 @@
> >>+Fix support for ARM endianness, otherwise it gives the error
> >>+"unknown CPU endianness"
> >>+
> >>+Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
> >
> >Did you try to send that patch upstream?
> 
> They already fixed it in git, but there isn't any stable release with this
> fix.

Ah, so this is a patch that you back-ported from upstream, then?

In this case, just add a pointer to the upstream patch.

> >>+diff -Nau guile-2.0.11.orig/configure.ac guile-2.0.11/configure.ac
> >>+--- guile-2.0.11.orig/configure.ac	2014-03-12 14:36:02.000000000 +0100
> >>++++ guile-2.0.11/configure.ac	2014-11-03 23:59:51.897267207 +0100
> >>+@@ -862,7 +862,7 @@
> >>+ }]])],
> >>+     [guile_cv_use_csqrt=yes],
> >>+     [guile_cv_use_csqrt="no, glibc 2.3 bug"],
> >>+-    [guile_cv_use_csqrt="yes, hopefully (cross-compiling)"])])
> >>++    [guile_cv_use_csqrt="no (cross-compiling)"])])
> >
> >Not OK: it is possible to be cross-compiling with glibc, in which
> >case the result should be 'yes'.
> 
> Using csqrt() is OK only for some versions of glib. If we use the fallback
> code, we're sure that it will work properly even with recent versions of
> glib.

/me gets confused...
glib or glibc?

But even if the fallback code works in all cases, I gues we still want
to use the normal code whenever possible. That is, we want to detect
that csqrt() is available before using it.

But OK, we can live with the fallback code in Buildroot.

Maybe you could try to push a patch upstream to add a check whether
csqrt() is present and useable in the C library? That would allow us to
drop one patch when we update guile when the next release is out.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
