From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Wed, 21 Feb 2018 09:28:01 -0500
Subject: [Buildroot] [PATCH-FOR-NEXT v1 6/6] qt5webengine: set ninja host
 pkg-config tool
In-Reply-To: <20180221142801.28997-1-gael.portay@savoirfairelinux.com>
References: <20180221142801.28997-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180221142801.28997-7-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The WebEngine build system uses pkg-config to get package data for both
host and target architectures.

Using the same call to pkg-config for both target and host leads to
build mismatches.

In this situation, it tries to link a host-tool using target libraries.

Qt is able to set host pkg-config for Ninja, using environment variable
$GN_PKG_CONFIG_HOST[1].

Fixes:

	FAILED: host/transport_security_state_generator
	/home/gportay/src/buildroot/output-qt5.10/host/bin/python2 "../../3rdparty/chromium/build/toolchain/gcc_link_wrapper.py" --output="host/transport_security_state_generator" -- /usr/bin/g++ -Wl,--fatal-warnings -fPIC -Wl,-z,noexecstack -Wl,-z,now -Wl,-z,relro -Wl,-z,defs -Wl,--no-as-needed -lpthread -Wl,--as-needed -m64 -Wl,-O1 -Wl,--gc-sections -Wl,-rpath-link=host -Wl,--disable-new-dtags -L/home/gportay/src/buildroot/output-qt5.10/host/x86_64-buildroot-linux-gnu/sysroot/usr/lib -o "host/transport_security_state_generator" -Wl,--start-group @"host/transport_security_state_generator.rsp"  -Wl,--end-group   -ldl -lpthread -lrt -lnss3 -lnssutil3 -lsmime3 -lplds4 -lplc4 -lnspr4
	/usr/bin/ld: cannot find /lib64/libpthread.so.0
	/usr/bin/ld: cannot find /usr/lib64/libpthread_nonshared.a
	collect2: error: ld returned 1 exit status
	ninja: build stopped: subcommand failed.
	Makefile.gn_run:449: recipe for target 'run_ninja' failed

[1]: https://github.com/qt/qtwebengine/blob/v5.10.1/src/core/config/linux.pri#L111-L125

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 package/qt5/qt5webengine/qt5webengine.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index 47084c1af4..c0cc6b263c 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -42,6 +42,8 @@ define QT5WEBENGINE_PYTHON2_SYMLINK
 endef
 QT5WEBENGINE_PRE_CONFIGURE_HOOKS += QT5WEBENGINE_PYTHON2_SYMLINK
 
+QT5WEBENGINE_ENV += GN_PKG_CONFIG_HOST=host-pkg-config
+
 define QT5WEBENGINE_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBENGINE_ENV) $(HOST_DIR)/usr/bin/qmake $(QT5WEBENGINE_QMAKEFLAGS))
 endef
-- 
2.16.1
