From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Jul 2017 22:42:51 +0200
Subject: [Buildroot] [git commit] package/cc-tool: link with libatomic when
	needed
Message-ID: <20170729203845.22B8D81E43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d6371f51265ac6d460e7b1cfc987c9fd2f0785d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Detecting the boost program_options library is broken:

checking for the Boost program_options library... no
configure: error: cannot find the flags to link with Boost program_options

config.log shows the reason, libatomic is missing:

conftest.o: In function `boost::detail::sp_counted_base::release()':
conftest.cpp:(.text._ZN5boost6detail15sp_counted_base7releaseEv[_ZN5boost6detail15sp_counted_base7releaseEv]+0xc):
 undefined reference to `__atomic_fetch_sub_4'
conftest.cpp:(.text._ZN5boost6detail15sp_counted_base7releaseEv[_ZN5boost6detail15sp_counted_base7releaseEv]+0x38):
 undefined reference to `__atomic_fetch_sub_4'
/home/buildroot/br4/output/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libboost_program_options.so:
 undefined reference to `__atomic_fetch_add_4'

Please note that using LIBS=-latomic is not enough, although it fixes
the configure check the bug reoccurs when linking cc-tool:

  CXXLD    cc-tool
src/application/cc_flasher.o: In function `boost::detail::sp_counted_base::weak_release()':
cc_flasher.cpp:(.text._ZN5boost6detail15sp_counted_base12weak_releaseEv[_ZN5boost6detail15sp_counted_base12weak_releaseEv]+0xc):
 undefined reference to `__atomic_fetch_sub_4'

We need to add -latomic to CXXFLAGS to both fix configure and linking.

Fixes
http://autobuild.buildroot.net/results/596/596f97364bb2c7598b0646da8160939356f0d2c6/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cc-tool/cc-tool.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/cc-tool/cc-tool.mk b/package/cc-tool/cc-tool.mk
index b9209ce..37ac57e 100644
--- a/package/cc-tool/cc-tool.mk
+++ b/package/cc-tool/cc-tool.mk
@@ -23,4 +23,8 @@ ifeq ($(BR2_STATIC_LIBS),y)
 CC_TOOL_CONF_ENV += LIBS="-lpthread"
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+CC_TOOL_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -latomic"
+endif
+
 $(eval $(autotools-package))
