From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 24 Sep 2014 11:32:21 +0100
Subject: [Buildroot] [PATCH] freerdp: Disable when using a uClibc toolchain
Message-ID: <1411554741-18469-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

freerdp uses eventfd_read, eventfd_write and futimes. Those functions
are not implemented in uClibc, so it's causing failures like these ones:

../../libwinpr/synch/libwinpr-synch.so.0.1.0: undefined reference to
`eventfd_read'
../../libwinpr/synch/libwinpr-synch.so.0.1.0: undefined reference to
`eventfd_write'

../../common/libfreerdp-client.so.1.1.0: undefined reference to
`futimes'

Fixes:
  http://autobuild.buildroot.net/results/a66/a66e1ab18cd12904a64afcbf54116ceef889e966/

Issue reported upstream:
  https://github.com/FreeRDP/FreeRDP/issues/2120

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>
---
 package/freerdp/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
index c5ff769..7ce6cc7 100644
--- a/package/freerdp/Config.in
+++ b/package/freerdp/Config.in
@@ -7,8 +7,13 @@ config BR2_PACKAGE_FREERDP
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
 	select BR2_PACKAGE_ZLIB
 	depends on BR2_PACKAGE_XORG7
+	# eventfd_read, eventfd_write and futimes not implemented
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	help
 	  FreeRDP is a free implementation of the Remote Desktop
 	  Protocol (RDP), released under the Apache license
 
 	  http://www.freerdp.com/
+
+comment "freerdp is not supported when using a uClibc toolchain"
+	depends on BR2_TOOLCHAIN_USES_UCLIBC
-- 
1.7.1
