From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 12 Apr 2018 06:28:53 -0300
Subject: [Buildroot] [RFC PATCH 1/3] download/git: fix fetch all refs for
 old git
In-Reply-To: <20180412092855.30621-1-ricardo.martincoski@gmail.com>
References: <20180412092855.30621-1-ricardo.martincoski@gmail.com>
Message-ID: <20180412092855.30621-2-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With old versions of git, when the shallow fetch was not enough, the
download fails like this:
 Fetching all references
 Could not fetch special ref 'sha1'; assuming it is not special.
 fatal: reference is not a tree: sha1

At git version 1.9.0, the semantics of the option -t for git fetch
changed, see upstream commit [1]:
< 1.9.0: "fetch tags without also fetching other references";
>=1.9.0: "fetch tags *in addition to* other stuff".

Fall back to explicit refspec to support distros that use ancient
versions of git.

Fixes:
http://autobuild.buildroot.net/results/7a88d1aa9ea155f1527d2fa141207c676af85298

[1] https://github.com/git/git/commit/c5a84e92a2fe9e8748e32341c344d7a6c0f52a50

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
WARNING: please review carefully, especially related to the plus sign.

I created a special docker image replacing git 2.11.0 with 1.8.3 [2].
Using it together to a special .gitlab-ci.yml [3], I could test in
Gitlab CI the download, without previous git cache and without backup
site, of all packages in the tree that use site method git in these
combinations:
- [4] patch above master (20c1647f) using git 1.8.3;
- [5] patch above master (20c1647f) using git 2.11.0;
- [6] master (20c1647f) using git 1.8.3;
- [7] master (20c1647f) using git 2.11.0;
- [8] 2018.02.1 using git 1.8.3;
- [9] 2018.02.1 using git 2.11.0.

These packages fail with 'fatal: reference is not a tree' in the master
branch using git 1.8.3 but do not fail for the other 5 combinations above:
aer-inject
armbian-firmware
boot-wrapper-aarch64
dbus-triggerd
dropwatch
edid-decode
expedite
flashbench
gst1-interpipe
host-mxsldr
host-pseudo
host-squashfs
libbroadvoice
libg7221
libilbc
libsilk
libsoundtouch
libubox
libuci
libyuv
linux-firmware
linux at beaglebone_qt5_defconfig
ltrace
mmc-utils
net-tools
open-lldp
psplash
rtmpdump
slirp
squashfs
ti-sgx-demos
ti-sgx-km
ti-sgx-um
uboot at ci20_defconfig
uboot at roseapplepi_defconfig
ubus
uclibc-ng-test
uhttpd
ustream-ssl
x264
xdriver_xf86-video-intel
xdriver_xf86-video-voodoo
yavta

[2] https://gitlab.com/RicardoMartincoski/buildroot/commit/d293ba50fa8cd40eb5c396b2aa234c07e2118020
[3] http://patchwork.ozlabs.org/patch/896012/
[4] https://gitlab.com/RicardoMartincoski/buildroot/pipelines/20328681
[5] https://gitlab.com/RicardoMartincoski/buildroot/pipelines/20328707
[6] https://gitlab.com/RicardoMartincoski/buildroot/pipelines/20328727
[7] https://gitlab.com/RicardoMartincoski/buildroot/pipelines/20328745
[8] https://gitlab.com/RicardoMartincoski/buildroot/pipelines/20352543
[9] https://gitlab.com/RicardoMartincoski/buildroot/pipelines/20356539
---
 support/download/git | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/git b/support/download/git
index 381f3ceeb3..1b09e5c750 100755
--- a/support/download/git
+++ b/support/download/git
@@ -76,7 +76,7 @@ if [ -n "$(_git ls-remote origin "'${cset}'" 2>&1)" ]; then
 fi
 if [ ${git_done} -eq 0 ]; then
     printf "Fetching all references\n"
-    _git fetch origin -t
+    _git fetch origin -u "'+refs/tags/*:refs/tags/*'" "'+refs/heads/*:refs/remotes/origin/*'"
 fi
 
 # Try to get the special refs exposed by some forges (pull-requests for
-- 
2.14.1
