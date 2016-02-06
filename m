From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Feb 2016 10:45:15 +0100
Subject: [Buildroot] [git commit] bind: fix intermittent build issues with
	high BR2_JLEVEL
Message-ID: <20160206094549.718D080762@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e4749b826c04cda213768332f67ffb82f06105b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build sometimes breaks with:

libtool: link: `unix/os.lo' is not a valid libtool object
make[3]: *** [rndc-confgen] Error 1
make[3]: *** Waiting for unfinished jobs....
make[4]: Leaving directory `/scratch/peko/build/bind-9.6-ESV-R4/bin/rndc/unix'

So disable parallel builds.

This patch was removed with commit
c36b5d89c5616f7ca0a7295cbb5c231606beb71e by Gustavo Zacarias
<gustavo@zacarias.com.ar> but the problem still occurs, so disabling
parallel builds again.

Fixes:
http://autobuild.buildroot.org/results/220/2201f04170ea8ef0961e907efce07c041a57c229/

Signed-off-by: Jan Heylen <heyleke@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bind/bind.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 9d8d16c..12dd52e 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -6,6 +6,8 @@
 
 BIND_VERSION = 9.10.3-P3
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
+# bind does not support parallel builds.
+BIND_MAKE = $(MAKE1)
 BIND_INSTALL_STAGING = YES
 BIND_CONFIG_SCRIPTS = bind9-config isc-config.sh
 BIND_LICENSE = ISC
