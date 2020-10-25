From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Oct 2020 15:51:02 +0100
Subject: [Buildroot] [PATCH v2,1/1] package/zeek: new package
In-Reply-To: <20200906131635.2872307-1-fontaine.fabrice@gmail.com>
References: <20200906131635.2872307-1-fontaine.fabrice@gmail.com>
Message-ID: <20201025155102.1973e902@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Sun,  6 Sep 2020 15:16:35 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> The Zeek Network Security Monitor
> 
> Zeek is a powerful network analysis framework that is much different
> from the typical IDS you may know. (Zeek is the new name for the
> long-established Bro system.)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

This doesn't build: building host-zeex requires host-libpcap:

-- Found ZLIB: /home/thomas/projets/buildroot/output/host/usr/lib/libz.so (found version "1.2.11") 
CMake Error at auxil/binpac/CMakeLists.txt:35 (message):
   Could not find prerequisite package 'PCAP'

In fact, you don't express any dependency for host-zeex, which seems
suspicious. Make sure to try building zeex in a minimal Docker
container that contains just the minimal set of Buildroot dependencies.
This is the only way to ensure that you have really expressed all
host-zeex dependencies.

Also, another comment below.

> +ZEEK_CONF_OPTS = \
> +	-DBIFCL_EXE_PATH=$(HOST_ZEEK_BUILDDIR)/auxil/bifcl/bifcl \
> +	-DBINPAC_EXE_PATH=$(HOST_ZEEK_BUILDDIR)/auxil/binpac/src/binpac \
> +	-DBROKER_DISABLE_DOCS=ON \
> +	-DBROKER_DISABLE_TESTS=ON \
> +	-DINSTALL_AUX_TOOLS=ON \
> +	-DZEEK_ETC_INSTALL_DIR=/etc
> +
> +HOST_ZEEK_MAKE_OPTS = binpac bifcl
> +# Don't install host-zeek. We just need to build binpac and bifcl.
> +# Therefore only run 'true' and do nothing, not even the default action.
> +HOST_ZEEK_INSTALL_CMDS = true

Could you instead install just binpac and bifcl to $(HOST_DIR)/bin, and
make the target zeex package use them ?

When possible, we try to avoid having one package reference the build
directory of another package.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
