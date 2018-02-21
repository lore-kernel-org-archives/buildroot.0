From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Feb 2018 22:59:31 +0100
Subject: [Buildroot] [PATCH-FOR-NEXT v1 6/6] qt5webengine: set ninja
 host pkg-config tool
In-Reply-To: <20180221142801.28997-7-gael.portay@savoirfairelinux.com>
References: <20180221142801.28997-1-gael.portay@savoirfairelinux.com>
 <20180221142801.28997-7-gael.portay@savoirfairelinux.com>
Message-ID: <20180221225931.5996c857@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Feb 2018 09:28:01 -0500, Ga?l PORTAY wrote:
> The WebEngine build system uses pkg-config to get package data for both
> host and target architectures.
> 
> Using the same call to pkg-config for both target and host leads to
> build mismatches.
> 
> In this situation, it tries to link a host-tool using target libraries.
> 
> Qt is able to set host pkg-config for Ninja, using environment variable
> $GN_PKG_CONFIG_HOST[1].
> 
> Fixes:
> 
> 	FAILED: host/transport_security_state_generator
> 	/home/gportay/src/buildroot/output-qt5.10/host/bin/python2 "../../3rdparty/chromium/build/toolchain/gcc_link_wrapper.py" --output="host/transport_security_state_generator" -- /usr/bin/g++ -Wl,--fatal-warnings -fPIC -Wl,-z,noexecstack -Wl,-z,now -Wl,-z,relro -Wl,-z,defs -Wl,--no-as-needed -lpthread -Wl,--as-needed -m64 -Wl,-O1 -Wl,--gc-sections -Wl,-rpath-link=host -Wl,--disable-new-dtags -L/home/gportay/src/buildroot/output-qt5.10/host/x86_64-buildroot-linux-gnu/sysroot/usr/lib -o "host/transport_security_state_generator" -Wl,--start-group @"host/transport_security_state_generator.rsp"  -Wl,--end-group   -ldl -lpthread -lrt -lnss3 -lnssutil3 -lsmime3 -lplds4 -lplc4 -lnspr4
> 	/usr/bin/ld: cannot find /lib64/libpthread.so.0
> 	/usr/bin/ld: cannot find /usr/lib64/libpthread_nonshared.a
> 	collect2: error: ld returned 1 exit status
> 	ninja: build stopped: subcommand failed.
> 	Makefile.gn_run:449: recipe for target 'run_ninja' failed
> 
> [1]: https://github.com/qt/qtwebengine/blob/v5.10.1/src/core/config/linux.pri#L111-L125
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>

Same comment for this one as for PATCH 5/6: what happens if we apply
your series up to PATCH 5/6, but excluding PATCH 6/6 ? qt5webengine
will fail to build, while it was building before, which is a
regression. So I assume this should be in the 5.10 bump as well, or
kept separate during the review, and squashed when applying. But it
should be mentioned.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
