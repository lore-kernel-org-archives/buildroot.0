From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 15:05:58 +0100
Subject: [Buildroot] [git commit] lttng-libust: enable Python agent when
	Python is available
Message-ID: <20161101142532.12C298023B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15ce62bbf33f1527b5553695d4641fba134dcd6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the --enable-python-agent configure option to build the LTTng-UST
Python agent when Python 2 or Python 3 is also part of the BR image. The
LTTng-UST Python agent is a Python package which adds LTTng tracing to
Python's standard logging when imported.

Disable the Python agent otherwise.

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lttng-libust/lttng-libust.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index feeeb43..7a83f46 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -15,10 +15,13 @@ LTTNG_LIBUST_CONF_OPTS += --disable-man-pages
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 LTTNG_LIBUST_DEPENDENCIES += python
+LTTNG_LIBUST_CONF_OPTS += --enable-python-agent
 else ifeq ($(BR2_PACKAGE_PYTHON3),y)
 LTTNG_LIBUST_DEPENDENCIES += python3
+LTTNG_LIBUST_CONF_OPTS += --enable-python-agent
 else
 LTTNG_LIBUST_CONF_ENV = am_cv_pathless_PYTHON="none"
+LTTNG_LIBUST_CONF_OPTS += --disable-python-agent
 endif
 
 $(eval $(autotools-package))
