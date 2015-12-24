From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Dec 2015 14:48:28 +0100
Subject: [Buildroot] [git commit] dhcp: read /etc/default/dhcpd,
	not /etc/default/dhcpd.conf
Message-ID: <20151224135818.6F58C82703@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6f81baaf47e3f47b131ec2b1c6c5f7d062a48d84
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All daemons that read a file from /etc/default/ have it named just
after the name of daemon, without any extension. This commit fixes the
dhcp package to do the same.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dhcp/S80dhcp-server | 2 +-
 package/dhcp/dhcpd.service  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dhcp/S80dhcp-server b/package/dhcp/S80dhcp-server
index 356e735..06b7ab1 100755
--- a/package/dhcp/S80dhcp-server
+++ b/package/dhcp/S80dhcp-server
@@ -8,7 +8,7 @@
 INTERFACES=""
 
 # Allow a few customizations from a config file
-test -r /etc/default/dhcpd.conf && . /etc/default/dhcpd.conf
+test -r /etc/default/dhcpd && . /etc/default/dhcpd
 
 # Sanity checks
 test -f /usr/sbin/dhcpd || exit 0
diff --git a/package/dhcp/dhcpd.service b/package/dhcp/dhcpd.service
index d58fbd5..a05deb8 100644
--- a/package/dhcp/dhcpd.service
+++ b/package/dhcp/dhcpd.service
@@ -7,7 +7,7 @@ Type=forking
 PIDFile=/run/dhcpd.pid
 ExecStart=/usr/sbin/dhcpd -q -pf /run/dhcpd.pid $INTERFACES
 KillSignal=SIGINT
-EnvironmentFile=-/etc/default/dhcpd.conf
+EnvironmentFile=-/etc/default/dhcpd
 
 [Install]
 WantedBy=multi-user.target
