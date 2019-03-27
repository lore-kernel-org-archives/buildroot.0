From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Mar 2019 10:42:52 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] utils/test-pkg: generate
 package config if it is not specified
Message-ID: <20190327094331.87B7D81732@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6cfd314ed39e03e10d10b939ea54ecca3ddf9ce6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

It is possible to generate one-line config for the package just by
normalize it to the form:

    BR2_PACKAGE_${pkg_replaced-to_and_uppercase}

it simplifes a bit of testing package where no additional config options
are needed.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a946813dd581ac2e1aea6745edad2bc7ce44e6aa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/test-pkg | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/utils/test-pkg b/utils/test-pkg
index 1995fa8578..cce4679b04 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -2,12 +2,20 @@
 set -e
 
 TOOLCHAINS_CSV='support/config-fragments/autobuild/toolchain-configs.csv'
+TEMP_CONF=""
+
+do_clean() {
+    if [ ! -z "${TEMP_CONF}" ]; then
+        rm -f "${TEMP_CONF}"
+    fi
+}
 
 main() {
     local o O opts
     local cfg dir pkg random toolchains_dir toolchain all number mode
     local ret nb nb_skip nb_fail nb_legal nb_tc build_dir
     local -a toolchains
+    local pkg_br_name
 
     o='hac:d:n:p:r:t:'
     O='help,config-snippet:build-dir:package:,random:,toolchains-dir:'
@@ -50,8 +58,15 @@ main() {
             ;;
         esac
     done
+
+    trap do_clean INT TERM HUP EXIT
+
     if [ -z "${cfg}" ]; then
-        printf "error: no config snippet specified\n" >&2; exit 1
+        pkg_br_name="${pkg//-/_}"
+        pkg_br_name="BR2_PACKAGE_${pkg_br_name^^}"
+        TEMP_CONF=$(mktemp /tmp/test-${pkg}-config.XXXXXX)
+        echo "${pkg_br_name}=y" > ${TEMP_CONF}
+        cfg="${TEMP_CONF}"
     fi
     if [ ! -e "${cfg}" ]; then
         printf "error: %s: no such file\n" "${cfg}" >&2; exit 1
