From: Markus Mayer <mmayer@broadcom.com>
Date: Wed, 12 Jun 2019 16:39:33 -0700
Subject: [Buildroot] [PATCH 1/2] lmbench: mark scripts/build as bash script
In-Reply-To: <20190612233934.14805-1-mmayer@broadcom.com>
References: <20190612233934.14805-1-mmayer@broadcom.com>
Message-ID: <20190612233934.14805-2-mmayer@broadcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While bash supports the "+=" operator for environment variables,
/bin/sh does not. scripts/build is making use of "+=" but declares
itself to be a /bin/sh script. This leads to errors of the form
    ../scripts/build: 21: ../scripts/build: LDLIBS+= -lm: not found
and doesn't change the contents of LDLIBS as was the intention.

Therefore, we change the interpreter to /bin/bash, which makes things
work as intended.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 package/lmbench/0001-build_use_bash.patch | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 package/lmbench/0001-build_use_bash.patch

diff --git a/package/lmbench/0001-build_use_bash.patch b/package/lmbench/0001-build_use_bash.patch
new file mode 100644
index 000000000000..c68ed2ef7ac4
--- /dev/null
+++ b/package/lmbench/0001-build_use_bash.patch
@@ -0,0 +1,8 @@
+--- lmbench-3.0-a9/scripts/build.orig	2006-06-27 09:25:18.000000000 -0700
++++ lmbench-3.0-a9/scripts/build	2019-06-12 16:08:26.078093924 -0700
+@@ -1,4 +1,4 @@
+-#!/bin/sh
++#!/bin/bash
+ 
+ CC=${CC-`../scripts/compiler`}
+ MAKE=${MAKE-`../scripts/make`}
-- 
2.17.1
