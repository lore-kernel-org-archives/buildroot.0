From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Mar 2018 11:59:03 +0100
Subject: [Buildroot] [git commit] core: find a host UTF-8 locale
Message-ID: <20180304110028.3C5E08138C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2a9358b6e7d1432856b05bddcab66723f9ea847
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some packages really want to use an UTF-8 locale, or they break.

However, there is no guarantee that any given locale is available on a
system. For example,, while most mainstream distros (Debian and
derivatives, Fedora...) do have the generic, language-agnostic C.UTF-8
locale, Gentoo does not provide it.

So, find the first UTF-8 locale available on the system, and take any
that is available. We however do favour using the user-set current
locale, then using the language-agnostic C.UTF-8, and eventually any
random UTF-8 locale.

Note: we only need to enforce LC_ALL, because setting it implies
everything else:
    http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap08.html#tag_08_02

    """
    1. If the LC_ALL environment variable is defined and is not null,
    the value of LC_ALL shall be used.
    """

[Peter: use same regexp as in dependencies.sh]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Makefile b/Makefile
index 5fe3a34c47..49c03b7008 100644
--- a/Makefile
+++ b/Makefile
@@ -363,6 +363,22 @@ ifneq ($(firstword $(HOSTCC_VERSION)),4)
 HOSTCC_VERSION := $(firstword $(HOSTCC_VERSION))
 endif
 
+ifeq ($(BR2_NEEDS_HOST_UTF8_LOCALE),y)
+# First, we try to use the user's configured locale (as that's the
+# language they'd expect messages to be displayed), then we favour
+# a non language-specific locale like C.UTF-8 if one is available,
+# so we sort with the C locale to get it at the top.
+# This is guaranteed to not be empty, because of the check in
+# support/dependencies/dependencies.sh
+HOST_UTF8_LOCALE := $(shell \
+			( echo $${LC_ALL:-$${LC_MESSAGES:-$${LANG}}}; \
+			  locale -a 2>/dev/null | LC_ALL=C sort \
+			) \
+			| grep -i -E 'utf-?8$$' \
+			| head -n 1)
+HOST_UTF8_LOCALE_ENV := LC_ALL=$(HOST_UTF8_LOCALE)
+endif
+
 # Make sure pkg-config doesn't look outside the buildroot tree
 HOST_PKG_CONFIG_PATH := $(PKG_CONFIG_PATH)
 unexport PKG_CONFIG_PATH
