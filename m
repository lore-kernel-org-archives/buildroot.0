From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Feb 2017 11:46:52 +0100
Subject: [Buildroot] [git commit] ruby: assume we always have finite,
	isinf and isnan for uClibc
Message-ID: <20170207104720.41DB081909@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=99e01a35f9e6cf9d17ef65cc9c983f3b364723b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On uClibc, finite, isinf and isnan are not directly implemented as
functions.  Instead math.h #define's these to __finite, __isinf and __isnan,
which are real functions.

This confuses the Ruby configure script which use AC_REPLACE_FUNCS to
detect these, as it really checks for a function without including math.h.

Because of the naming difference the checks fail, therefore the symbols
HAVE_FINITE, HAVE_ISINF and HAVE_ISNAN are not defined.
Ruby code relies on those symbols in order to define its own version of
the finite, isinf and isnan functions. Since the symbols haven't been
defined, those definitions cause conflicts with the already-existing
functions.

Fixes:
  http://autobuild.buildroot.net/results/f34/f34dc20749c6f6d12c51eddf3ee6c2ef41d7c13d/

[Peter: extend description, add comment in .mk]
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ruby/ruby.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 4c6459b..f0dc63b 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -29,6 +29,17 @@ RUBY_CFLAGS += -O2
 endif
 RUBY_CONF_ENV = CFLAGS="$(RUBY_CFLAGS)"
 
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+# On uClibc, finite, isinf and isnan are not directly implemented as
+# functions.  Instead math.h #define's these to __finite, __isinf and
+# __isnan, confusing the Ruby configure script. Tell it that they
+# really are available.
+RUBY_CONF_ENV += \
+	ac_cv_func_finite=yes \
+	ac_cv_func_isinf=yes \
+	ac_cv_func_isnan=yes
+endif
+
 ifeq ($(BR2_bfin),y)
 RUBY_CONF_ENV += ac_cv_func_dl_iterate_phdr=no
 # Blackfin doesn't have FFI closure support, needed by the fiddle
