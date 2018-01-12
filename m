From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jan 2018 22:07:59 +0100
Subject: [Buildroot] [git commit] system: only expose getty options for
 busybox and sysvinit
Message-ID: <20180112210924.2C66382BCA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e23eb5da7b3848cc6b317af9d8c23aac3a13260
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Only busybox and sysvinit handle the BR2_TARGET_GENERIC_GETTY_TERM and
BR2_TARGET_GENERIC_GETTY_OPTIONS options; the other init systems do
not.

So, protect those options behind appropriate dependencies on busybox
or sysvinit.

Fixes #10301.

Reported-by: Michael Heinemann <posted@heine.so>
Suggested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 system/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/system/Config.in b/system/Config.in
index b971492..d48cf8d 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -355,12 +355,16 @@ config BR2_TARGET_GENERIC_GETTY_BAUDRATE
 config BR2_TARGET_GENERIC_GETTY_TERM
 	string "TERM environment variable"
 	default "vt100"
+	# currently observed only by busybox and sysvinit
+	depends on BR2_INIT_BUSYBOX || BR2_INIT_SYSV
 	help
 	  Specify a TERM type.
 
 config BR2_TARGET_GENERIC_GETTY_OPTIONS
 	string "other options to pass to getty"
 	default ""
+	# currently observed only by busybox and sysvinit
+	depends on BR2_INIT_BUSYBOX || BR2_INIT_SYSV
 	help
 	  Any other flags you want to pass to getty,
 	  Refer to getty --help for details.
