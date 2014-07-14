From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 15 Jul 2014 01:48:04 +0200
Subject: [Buildroot] [PATCH] perl-net-ssleay: fix configure
Message-ID: <1405381684-3844-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Francois Perrad <fperrad@gmail.com>

When TARGET_LDFLAGS contains more than one option, the generated
Makefile contains this definition of LDDLFLAGS:
        LDDLFLAGS = '--option-1 --option-2'

Which when passed to gcc is interpreted as a single option, and gcc
(rightfully) barfs on it, like with:
        arm-linux-gnueabihf-gcc: error: unrecognized command line
        option ?-shared -g?

This is because perl-net-ssleay's buildsystem is really completely
brain-damaged. Other perl extensions do not behave like that, and
instead are doing the only same thing to do: not add single quotes
around the definition, and just use what they were provided for
lddlflags.

So, just do the same for perl-net-ssleay. Since tweaking (yet once
more) their buildsystem is too complex, we just use a post-configure
hook to fix up the mess, by removing single quotes around the definition
of LDDLFLAGS.

Note: if only one option is specified, no single quotes are added,
but out hook is a no-op in this case.

See also:
    http://lists.busybox.net/pipermail/buildroot/2014-July/101782.html
and the previous message for even more entertainment. ;-)

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[me: find the real cause of the issue, tweak the sed expression to not
 force -shared and instead just trim the single quotes, enhance commit
 log]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/perl-net-ssleay/perl-net-ssleay.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/perl-net-ssleay/perl-net-ssleay.mk b/package/perl-net-ssleay/perl-net-ssleay.mk
index 4a362fb..6b21eb2 100644
--- a/package/perl-net-ssleay/perl-net-ssleay.mk
+++ b/package/perl-net-ssleay/perl-net-ssleay.mk
@@ -15,4 +15,9 @@ PERL_NET_SSLEAY_LICENSE_FILES = LICENSE
 # suffers from: don't search for openssl, they pick the host-system one.
 PERL_NET_SSLEAY_CONF_ENV = OPENSSL_PREFIX=$(STAGING_DIR)/usr
 
+define PERL_NET_SSLEAY_FIX_MAKEFILE
+	$(SED) "s/^LDDLFLAGS = '\(.*\)'/LDDLFLAGS = \1/" $(@D)/Makefile
+endef
+PERL_NET_SSLEAY_POST_CONFIGURE_HOOKS += PERL_NET_SSLEAY_FIX_MAKEFILE
+
 $(eval $(perl-package))
-- 
1.9.1
