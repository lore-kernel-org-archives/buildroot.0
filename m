From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Jan 2018 23:14:02 +0100
Subject: [Buildroot] [PATCH] system/Config.in: hide
 BR2_TARGET_GENERIC_GETTY_{TERM, OPTIONS} with systemd
Message-ID: <20180110221402.19743-1-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When systemd is used as the init system, the
BR2_TARGET_GENERIC_GETTY_TERM and BR2_TARGET_GENERIC_GETTY_OPTIONS are
completely ignored, which might confuse the user, as reported in bug

For now, let's simply make those options visible only with busybox
init and sysv init, as suggested by Yann E. Morin in the discussion of
bug #10301.

Fixes #10301.

Reported-by: Michael Heinemann <posted@heine.so>
Suggested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 system/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/system/Config.in b/system/Config.in
index b9714923c4..0fe0fb60b4 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -355,12 +355,16 @@ config BR2_TARGET_GENERIC_GETTY_BAUDRATE
 config BR2_TARGET_GENERIC_GETTY_TERM
 	string "TERM environment variable"
 	default "vt100"
+	# currently not observed by systemd
+	depends on BR2_INIT_BUSYBOX || BR2_INIT_SYSV
 	help
 	  Specify a TERM type.
 
 config BR2_TARGET_GENERIC_GETTY_OPTIONS
 	string "other options to pass to getty"
 	default ""
+	# currently not observed by systemd
+	depends on BR2_INIT_BUSYBOX || BR2_INIT_SYSV
 	help
 	  Any other flags you want to pass to getty,
 	  Refer to getty --help for details.
-- 
2.14.3
