From: Frank Vanbever <frank.vanbever@essensium.com>
Date: Tue, 11 Feb 2020 13:14:12 +0100
Subject: [Buildroot] [PATCH] package/erlang: patch the tarball
In-Reply-To: <20200210165824.22245-1-johan.oudinet@gmail.com>
References: <20200210165824.22245-1-johan.oudinet@gmail.com>
Message-ID: <15668311.KUIl6ZYJNq@wintermute>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Johan, 

> Remove the lib/ssl/src/deps directory before configuring the package.
> Otherwise, during the compilation of the ssl app, it may fails by
> looking for logger.hrl in the wrong location (bootstrap/lib/kernel
> instead of lib/kernel).
> 
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Tested-by: Frank Vanbever <frank.vanbever@essensium.com>

Thanks for getting to the bottom of this.
I was investigating this and had the following config which consistently 
failed with the logger.hrl file not being found.

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/
tarballs/br-arm-cortex-a9-glibc-2019.11.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_3=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_ERLANG=y

Applying this patch solves the issue.

Best regards,
Frank
