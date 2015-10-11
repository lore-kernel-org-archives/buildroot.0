From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Oct 2015 12:08:59 +0200
Subject: [Buildroot] Issues with the toolchain wrapper applied to the
	internal toolchain
Message-ID: <20151011120859.7e786a73@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Since the toolchain wrapper support for the internal toolchain has been
merged, using pre-built Buildroot toolchains as external toolchains no
longer work since the path logic in the wrapper doesn't cope with a
toolchain installed in host/opt/ext-toolchain/. When executing the
cross-compiler:

thomas at skate:~/projets/buildroot3 (master)$ ./output/host/opt/ext-toolchain/bin/arm-linux-gcc 
/home/thomas/projets/buildroot3/output/host/opt/usr/bin/arm-linux-gcc.real: No such file or directory

As you can see, it looks for the "real" compiler in the wrong location.
I believe it should instead re-use some of the logic of
BR_CROSS_PATH_REL.

You can reproduce this issue by using the following defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2015.08-532-ga237b40.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_7=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y

Also, another concern I have is what going to happen with the double
wrapper? A Buildroot toolchain has a wrapper, and then when it's
re-used as an external toolchain, another wrapper is created. Will this
work OK, especially in terms of ccache behavior?

Thanks, 

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
