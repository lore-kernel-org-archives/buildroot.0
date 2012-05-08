From: Samuel Martin <s.martin49@gmail.com>
Date: Tue,  8 May 2012 22:45:48 +0200
Subject: [Buildroot] [PATCH 1/2] Makefile.in: add host python2 binary
	detection
In-Reply-To: <1336509949-19630-1-git-send-email-s.martin49@gmail.com>
References: <1336509949-19630-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1336509949-19630-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>

diff --git a/package/Makefile.in b/package/Makefile.in
index df7042c..84968da 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -151,6 +151,18 @@ FLEX:=$(shell which flex || type -p flex)
 BISON:=$(shell which bison || type -p bison)
 SED:=$(shell which sed || type -p sed) -i -e
 
+PYTHON2:=$(shell \
+	which python &>/dev/null && \
+		python --version 2>&1 | grep -qE 'Python 2\.[6-7]*' && \
+		which python || \
+	which python2 &>/dev/null && \
+		python2 --version 2>&1 | grep -qE 'Python 2\.[6-7]*' && \
+		which python2 || \
+	echo $(HOST_DIR)/usr/bin/python)
+HOST_PYTHON2:=$(shell \
+	test $(PYTHON2) != $(HOST_DIR)/usr/bin/python || \
+	echo host-python)
+
 HOST_CFLAGS   ?= -O2
 HOST_CFLAGS   += -I$(HOST_DIR)/include -I$(HOST_DIR)/usr/include
 HOST_CXXFLAGS += -I$(HOST_DIR)/include -I$(HOST_DIR)/usr/include
-- 
1.7.10.1
