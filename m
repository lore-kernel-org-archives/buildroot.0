From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  9 Nov 2015 21:25:10 +0100
Subject: [Buildroot] [PATCH 1/2] ruby: do not overwrite RUBY_CONF_ENV
Message-ID: <1447100711-16463-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In commit 53bf889cdca77979814bc6b74170e2f104fc3b70 ("ruby: should not
use dl_iterate_phdr() on Blackfin") we added
ac_cv_func_dl_iterate_phdr=no to RUBY_CONF_ENV when building on the
Blackfin architecture.

However, while doing so, we overwrote the previous value of
RUBY_CONF_ENV, which was defined to have custom CFLAGS:

RUBY_CONF_ENV = CFLAGS="$(RUBY_CFLAGS)"

This has no visible effect because the custom CFLAGS are only used on
SuperH/SuperH 64, while the overwrite of RUBY_CONF_ENV takes place on
Blackfin.

However, it doesn't look very pretty, and future additions to
RUBY_CONF_ENV may break this subtle behavior.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ruby/ruby.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 243cd0b..298493c 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -30,7 +30,7 @@ endif
 RUBY_CONF_ENV = CFLAGS="$(RUBY_CFLAGS)"
 
 ifeq ($(BR2_bfin),y)
-RUBY_CONF_ENV = ac_cv_func_dl_iterate_phdr=no
+RUBY_CONF_ENV += ac_cv_func_dl_iterate_phdr=no
 # Blackfin doesn't have FFI closure support, needed by the fiddle
 # extension.
 RUBY_CONF_OPTS += --with-out-ext=fiddle
-- 
2.6.3
