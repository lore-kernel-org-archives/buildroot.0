From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Dec 2014 23:50:10 +0100
Subject: [Buildroot] [PATCHv2 2/3] ncurses: better handling for
	shared/static library
In-Reply-To: <1418338211-1595-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1418338211-1595-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1418338211-1595-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we have clear options for the three cases of shared only,
static only and shared+static, let's use them in ncurses to pass the
appropriate --{with,without}-{shared,normal} options.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ncurses/ncurses.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 645c25c..f54f379 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -15,7 +15,6 @@ NCURSES_LICENSE_FILES = README
 NCURSES_CONFIG_SCRIPTS = ncurses$(NCURSES_LIB_SUFFIX)5-config
 
 NCURSES_CONF_OPTS = \
-	$(if $(BR2_STATIC_LIBS),--without-shared,--with-shared) \
 	--without-cxx \
 	--without-cxx-binding \
 	--without-ada \
@@ -36,6 +35,14 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 	NCURSES_DEPENDENCIES += busybox
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+NCURSES_CONF_OPTS += --without-shared --with-normal
+else ifeq ($(BR2_SHARED_LIBS),y)
+NCURSES_CONF_OPTS += --with-shared --without-normal
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+NCURSES_CONF_OPTS += --with-shared --with-normal
+endif
+
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
 NCURSES_CONF_OPTS += --enable-widec
 NCURSES_LIB_SUFFIX = w
-- 
2.1.0
