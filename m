From: ren_guo <ren_guo@c-sky.com>
Date: Mon, 20 Feb 2017 16:14:28 +0800
Subject: [Buildroot] [PATCH 1/1] toolchain/helpers.mk: fixup gcc version
	check
Message-ID: <1487578468-8080-1-git-send-email-ren_guo@c-sky.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

some gcc --version ouput like this:

$ csky-linux-gcc --version
csky-linux-gcc (C-SKY Tools V2.8.08(Beta1)(Glibc,Linux 4.8.4), ABIV1,
B20161118) 4.5.1

current script just find first ')', but we need find last ')' to get
correct version number.

Signed-off-by: ren_guo <ren_guo@c-sky.com>
---
 toolchain/helpers.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 72e7292..60347ea 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -147,7 +147,7 @@ check_gcc_version = \
 	if [ -z "$${expected_version}" ]; then \
 		exit 0 ; \
 	fi; \
-	real_version=`$(1) --version | sed -r -e '1!d; s/^[^)]+\) ([^[:space:]]+).*/\1/;'` ; \
+	real_version=`$(1) --version | sed -r -e '1!d; s/^.+\) ([^[:space:]]+).*/\1/;'` ; \
 	if [[ ! "$${real_version}" =~ ^$${expected_version}\. ]] ; then \
 		printf "Incorrect selection of gcc version: expected %s.x, got %s\n" \
 			"$${expected_version}" "$${real_version}" ; \
-- 
1.9.1
