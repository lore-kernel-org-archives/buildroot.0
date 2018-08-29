From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Aug 2018 21:39:41 +0200
Subject: [Buildroot] [PATCH 1/1] domoticz: do not use static version of
 openssl
In-Reply-To: <20180829165312.22948-1-fontaine.fabrice@gmail.com>
References: <20180829165312.22948-1-fontaine.fabrice@gmail.com>
Message-ID: <20180829213941.2953f99a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Aug 2018 18:53:12 +0200, Fabrice Fontaine wrote:
> Due to the dependency on mosquitto, domoticz depends on !BR2_STATIC_LIBS
> so set USE_OPENSSL_STATIC to OFF (default value is ON)
> 
> This could fix this non reproducible failure:
>  - http://autobuild.buildroot.net/results/b1b84b8c12d31b9242b5732fcdd1eb76b1217366
> 
> Indeed, domoticz finds the static version of openssl:
> 
> -- Found OpenSSL:
> /home/test/autobuild/run/instance-0/output/host/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a (found version "1.0.2p")
> -- OPENSSL_LIBRARIES:
> /home/test/autobuild/run/instance-0/output/host/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libssl.a;/home/test/autobuild/run/instance-0/output/host/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a
> 
> But fails to link with the shared version:
> 
> /home/test/autobuild/run/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/6.4.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld:
> CMakeFiles/domoticz.dir/hardware/plugins/PluginTransports.cpp.o: undefined reference to symbol 'SSL_get_error'
> /home/test/autobuild/run/instance-0/output/host/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libssl.so.1.0.0: error adding symbols: DSO missing from command line
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Hum. So I guess reading the wording of your commit message that you
didn't manage to reproduce the problem, nor verify that the patch was
fixing it ?

Looking at http://autobuild.buildroot.net/?reason=domoticz%, the
problem clearly started suddenly appearing on July 4th.

The previous failure of domoticz was on March 1st, then no failures for
several months, and then suddenly on July 4th, we start to see this
failure, which was not seen before it seems.

The "bump to version 4.9700" was committed on June 27. Is it possible
that it is the reason for the new build failure ? So it means this case
would not have been tested between June 27 and July 4 ? Possible.

I'm running right now a build of one specific build failure to see if I
can reproduce and get more details about what's going.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
