From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Mon, 12 Feb 2018 17:20:46 -0500
Subject: [Buildroot] [RFC 0/2] Qt5 bump latest version to 5.10.0
In-Reply-To: <20180211161320.8864-1-gael.portay@savoirfairelinux.com>
References: <20180211161320.8864-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180212222046.galqtm4hl5pnzr5t@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Sun, Feb 11, 2018 at 11:13:18AM -0500, Ga?l PORTAY wrote:
> But I met a link issue with an 64bit host tool with lpthread. If someone
> may help about this issue...
> 
> 	FAILED: host/transport_security_state_generator 
> 	/home/gportay/src/buildroot/output-qt5.10/host/bin/python2 "../../3rdparty/chromium/build/toolchain/gcc_link_wrapper.py" --output="host/transport_security_state_generator" -- /usr/bin/g++ -Wl,--fatal-warnings -fPIC -Wl,-z,noexecstack -Wl,-z,now -Wl,-z,relro -Wl,-z,defs -Wl,--no-as-needed -lpthread -Wl,--as-needed -m64 -Wl,-O1 -Wl,--gc-sections -Wl,-rpath-link=host -Wl,--disable-new-dtags -L/home/gportay/src/buildroot/output-qt5.10/host/x86_64-buildroot-linux-gnu/sysroot/usr/lib -o "host/transport_security_state_generator" -Wl,--start-group @"host/transport_security_state_generator.rsp"  -Wl,--end-group   -ldl -lpthread -lrt -lnss3 -lnssutil3 -lsmime3 -lplds4 -lplc4 -lnspr4 
> 	/usr/bin/ld: cannot find /lib64/libpthread.so.0
> 	/usr/bin/ld: cannot find /usr/lib64/libpthread_nonshared.a
> 	collect2: error: ld returned 1 exit status
> 	ninja: build stopped: subcommand failed.
> 	Makefile.gn_run:449: recipe for target 'run_ninja' failed
> 
> The libpthread.so present in host directory is a ld script:
> 
> 	$ cat host/x86_64-buildroot-linux-gnu/sysroot/usr/lib64/libpthread.so 
> 	/* GNU ld script
> 	   Use the shared library, but some functions are only in
> 	   the static library, so try that secondarily.  */
> 	OUTPUT_FORMAT(elf64-x86-64)
> 	GROUP ( /lib64/libpthread.so.0 /usr/lib64/libpthread_nonshared.a )
> 
> When the script is removed, I met another link issue with other
> libraries.
> 
> 	/usr/bin/ld: cannot find /lib64/libm.so.6
> 	/usr/bin/ld: cannot find /usr/lib64/libmvec_nonshared.a
> 	/usr/bin/ld: cannot find /lib64/libmvec.so.1
>

Build is also broken for rpi3...

	FAILED: host/transport_security_state_generator
	/home/gportay/src/buildroot/output-qt5.10-rpi3/host/bin/python2 "../../3rdparty/chromium/build/toolchain/gcc_link_wrapper.py" --output="host/transport_security_state_generator" -- /usr/bin/g++ -Wl,--fatal-warnings -fPIC -Wl,-z,noexecstack -Wl,-z,now -Wl,-z,relro -Wl,-z,defs -Wl,--no-as-needed -lpthread -Wl,--as-needed -m64 -Wl,-O1 -Wl,--gc-sections -Wl,-rpath-link=host -Wl,--disable-new-dtags -L/home/gportay/src/buildroot/output-qt5.10-rpi3/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib -o "host/transport_security_state_generator" -Wl,--start-group @"host/transport_security_state_generator.rsp"  -Wl,--end-group   -ldl -lpthread -lrt -lnss3 -lnssutil3 -lsmime3 -lplds4 -lplc4 -lnspr4
	/usr/bin/ld: skipping incompatible /home/gportay/src/buildroot/output-qt5.10-rpi3/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libpthread.so when searching for -lpthread
	/usr/bin/ld: skipping incompatible /home/gportay/src/buildroot/output-qt5.10-rpi3/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libpthread.a when searching for -lpthread
	/usr/bin/ld: skipping incompatible /home/gportay/src/buildroot/output-qt5.10-rpi3/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libdl.so when searching for -ldl
	/usr/bin/ld: skipping incompatible /home/gportay/src/buildroot/output-qt5.10-rpi3/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libdl.a when searching for -ldl
	/usr/bin/ld: skipping incompatible /home/gportay/src/buildroot/output-qt5.10-rpi3/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libpthread.so when searching for -lpthread
	/usr/bin/ld: skipping incompatible /home/gportay/src/buildroot/output-qt5.10-rpi3/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libpthread.a when searching for -lpthread
	/usr/bin/ld: skipping incompatible /home/gportay/src/buildroot/output-qt5.10-rpi3/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/librt.so when searching for -lrt
	/usr/bin/ld: skipping incompatible /home/gportay/src/buildroot/output-qt5.10-rpi3/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/librt.a when searching for -lrt
	/usr/bin/ld: skipping incompatible /home/gportay/src/buildroot/output-qt5.10-rpi3/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libnss3.so when searching for -lnss3
	/usr/bin/ld: skipping incompatible /home/gportay/src/buildroot/output-qt5.10-rpi3/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libnssutil3.so when searching for -lnssutil3
	/usr/bin/ld: skipping incompatible /home/gportay/src/buildroot/output-qt5.10-rpi3/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libsmime3.so when searching for -lsmime3
	/usr/bin/ld: skipping incompatible /home/gportay/src/buildroot/output-qt5.10-rpi3/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libplds4.so when searching for -lplds4
	/usr/bin/ld: skipping incompatible /home/gportay/src/buildroot/output-qt5.10-rpi3/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libplc4.so when searching for -lplc4
	/usr/bin/ld: skipping incompatible /home/gportay/src/buildroot/output-qt5.10-rpi3/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libnspr4.so when searching for -lnspr4
	/usr/bin/ld: skipping incompatible /home/gportay/src/buildroot/output-qt5.10-rpi3/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libstdc++.so when searching for -lstdc++
	/usr/bin/ld: skipping incompatible /home/gportay/src/buildroot/output-qt5.10-rpi3/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libstdc++.a when searching for -lstdc++
	/usr/bin/ld: skipping incompatible /home/gportay/src/buildroot/output-qt5.10-rpi3/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libm.so when searching for -lm
	/usr/bin/ld: skipping incompatible /home/gportay/src/buildroot/output-qt5.10-rpi3/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libm.a when searching for -lm
	/usr/bin/ld: skipping incompatible /home/gportay/src/buildroot/output-qt5.10-rpi3/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libc.so when searching for -lc
	/usr/bin/ld: skipping incompatible /home/gportay/src/buildroot/output-qt5.10-rpi3/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libc.a when searching for -lc
	collect2: error: ld returned 1 exit status

It seems the build-system (ninja?) is trying to link a host tool using
arm libraries...
