From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Apr 2014 22:35:33 +0200
Subject: [Buildroot] [git commit] acpid: unavailable for external uClibc
	toolchains
Message-ID: <20140424204218.2F6159C9B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ec6aaa4706d6826aca4e48ea65bbebbd893f76d6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

External non-patched uClibc toolchains lack the MSG_CMSG_CLOEXEC
definition, so does internal uClibc <0.9.33, so exclude it for those
scenarios. Fixes:
http://autobuild.buildroot.net/results/6d4/6d471942788fa05f324649ab15e6ca382e46df9c/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/acpid/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/acpid/Config.in b/package/acpid/Config.in
index 5aec7f1..205a6ae 100644
--- a/package/acpid/Config.in
+++ b/package/acpid/Config.in
@@ -1,6 +1,9 @@
 config BR2_PACKAGE_ACPID
 	bool "acpid"
 	depends on BR2_x86_64 || BR2_i386
+	# Usually lacks MSG_CMSG_CLOEXEC
+	depends on !BR2_TOOLCHAIN_EXTERNAL_UCLIBC && \
+		!BR2_UCLIBC_VERSION_0_9_32
 	help
 	  Advanced Configuration and Power Interface event daemon.
 
