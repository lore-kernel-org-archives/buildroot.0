From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Jun 2014 11:38:17 +0200
Subject: [Buildroot] [git commit] avahi: fixup init scripts after default
	user removal
Message-ID: <20140623093923.923249D053@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0576f4cd5b7c681f274a63e4f9559a5ae61aa4d7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit d3ccfa362b (avahi: run as avahi user/group instead of default)
changed avahi-autoipd to run as the avahi user, but forgot to update the
init script/systemd config to match.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/avahi/S05avahi-setup.sh   |    2 +-
 package/avahi/avahi_tmpfiles.conf |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/avahi/S05avahi-setup.sh b/package/avahi/S05avahi-setup.sh
index f42a4d3..90ccbce 100755
--- a/package/avahi/S05avahi-setup.sh
+++ b/package/avahi/S05avahi-setup.sh
@@ -5,7 +5,7 @@ case "$1" in
 	if [ ! -d /tmp/avahi-autoipd ]; then
 	    rm -rf /tmp/avahi-autoipd
 	    mkdir /tmp/avahi-autoipd
-	    chown default.default /tmp/avahi-autoipd
+	    chown avahi.avahi /tmp/avahi-autoipd
 	fi
 	;;
     stop) ;;
diff --git a/package/avahi/avahi_tmpfiles.conf b/package/avahi/avahi_tmpfiles.conf
index 41eb3c6..f9aebdf 100644
--- a/package/avahi/avahi_tmpfiles.conf
+++ b/package/avahi/avahi_tmpfiles.conf
@@ -1 +1 @@
-d /tmp/avahi-autopid 0755 default default
+d /tmp/avahi-autopid 0755 avahi avahi
