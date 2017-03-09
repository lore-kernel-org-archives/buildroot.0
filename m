From: Krzysztof Konopko <kris@youview.com>
Date: Thu, 9 Mar 2017 09:01:36 +0100
Subject: [Buildroot] [PATCH] toolchain/external: use -dumpversion to check
	gcc version
Message-ID: <20170309080136.4799-1-kris@youview.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, `--version` option is used and later matched with a regex to get
the actual gcc version.  There's a dedicated gcc option to do exactly that:
`-dumpversion`.

Also `--version` may return a string customised by a vendor that provides
the toolchain, which makes the current regex approach error prone.  In
fact, this situation has been seen with a real customised toolchain.

Signed-off-by: Krzysztof Konopko <kris@youview.com>
Signed-off-by: Tomasz Szkutkowski <tomasz.szkutkowski@youview.com>
---
 toolchain/helpers.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 6f8723079..6044b7e5f 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -148,7 +148,7 @@ check_gcc_version = \
        if [ -z "$${expected_version}" ]; then \
                exit 0 ; \
        fi; \
-       real_version=`$(1) --version | sed -r -e '1!d; s/^[^)]+\) ([^[:space:]]+).*/\1/;'` ; \
+       real_version=`$(1) -dumpversion` ; \
        if [[ ! "$${real_version}" =~ ^$${expected_version}\. ]] ; then \
                printf "Incorrect selection of gcc version: expected %s.x, got %s\n" \
                        "$${expected_version}" "$${real_version}" ; \
--
2.11.0

This transmission contains information that may be confidential and contain personal views which are not necessarily those of YouView TV Ltd. YouView TV Ltd (Co No:7308805) is a limited liability company registered in England and Wales with its registered address at YouView TV Ltd, 3rd Floor, 10 Lower Thames Street, London, EC3R 6YT. For details see our web site at http://www.youview.com
