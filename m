From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Mon, 31 Oct 2016 03:46:17 -0400
Subject: [Buildroot] [PATCH v3 2/9] lttng-libust: enable Python agent when
	Python is available
In-Reply-To: <20161031074624.7576-1-eeppeliteloop@gmail.com>
References: <20161031074624.7576-1-eeppeliteloop@gmail.com>
Message-ID: <20161031074624.7576-3-eeppeliteloop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the --enable-python-agent configure option to build the LTTng-UST
Python agent when Python 2 or Python 3 is also part of the BR image. The
LTTng-UST Python agent is a Python package which adds LTTng tracing to
Python's standard logging when imported.

Disable the Python agent otherwise.

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
---
This is a new patch in v3.

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
--
2.9.3
