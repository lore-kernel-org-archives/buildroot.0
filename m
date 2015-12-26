From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 26 Dec 2015 22:35:34 +0100
Subject: [Buildroot] [PATCH] package/gettext: host variant needs host-libxml2
Message-ID: <1451165734-15534-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>

Of host-gettext, we only build the tools. however some of those tools
have a --color option, which needs libxml2.

If the libxml2 development files are missing on the host, a bundled
subset of libxml2 is used, and all seems OK. But if they ar epresent,
then the host libxml2 is used. On some distros, lbxml2 is linked with
liblzma. And if we happend to _then_ build our host-liblzma, we may have
a conflict later when trying to run any of the host-gettext tools.

Always build host-gettext with our own host-libxml2 which is not linked
with liblzma.

Fixes https://bugs.busybox.net/show_bug.cgi?id=7886

Signed-off-by: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>
[nicolas: added extended commit message]
Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
[yann.morin.1998 at free.fr: rebase; add comment; enhance commit log]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/gettext/gettext.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index cb509f2..11e105a 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -12,7 +12,9 @@ GETTEXT_LICENSE = LGPLv2.1+ (libintl), GPLv3+ (the rest)
 GETTEXT_LICENSE_FILES = COPYING gettext-runtime/intl/COPYING.LIB
 
 GETTEXT_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
-HOST_GETTEXT_DEPENDENCIES = # we don't want the libiconv dependency
+
+# Avoid using the bundled subset of libxml2
+HOST_GETTEXT_DEPENDENCIES = host-libxml2
 
 GETTEXT_CONF_OPTS += \
 	--disable-libasprintf \
-- 
1.9.1
