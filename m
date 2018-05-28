From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 May 2018 22:33:14 +0200
Subject: [Buildroot] [PATCH v7 1/3] package/libclc: new package
In-Reply-To: <20180504114603.10135-2-valentin.korenblit@smile.fr>
References: <20180504114603.10135-1-valentin.korenblit@smile.fr>
 <20180504114603.10135-2-valentin.korenblit@smile.fr>
Message-ID: <20180528223314.7e634387@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Valentin,

On Fri,  4 May 2018 13:46:01 +0200, Valentin Korenblit wrote:

> Given that clc headers are being installed to a non-standard location, it is
> necessary to specify this path in Mesa's configure.ac. Otherwise, pkg-config
> will output the absolute path to these headers located in STAGING_DIR, which
> will cause a runtime error when calling clBuildProgram.

It's not clear to me why the mesa3d patch needs to be within this
commit. Why isn't it introduced as part of PATCH 2/3, when you enable
libclc support in mesa3d ?

If mesa3d has a build issue because it misdetects libclc as soon as it
is available, then perhaps an explicit --disable-opencl in mesa3d.mk
added as a preliminary patch would avoid the problem.

> diff --git a/package/libclc/libclc.hash b/package/libclc/libclc.hash
> new file mode 100644
> index 0000000000..c5bf5a668c
> --- /dev/null
> +++ b/package/libclc/libclc.hash
> @@ -0,0 +1,3 @@
> +# locally calculated
> +sha256 e2f1f294f93695f2d1f87ccb9760231b435702dd0c27abeb38baa97186674d9e  libclc-00236279a293b3737dee08c14f25923a889d2795.tar.gz

Are you sure about this hash ? I don't get the same hash here:

ERROR: libclc-00236279a293b3737dee08c14f25923a889d2795.tar.gz has wrong sha256 hash:
ERROR: expected: e2f1f294f93695f2d1f87ccb9760231b435702dd0c27abeb38baa97186674d9e
ERROR: got     : 00a8de040b33e68ab7eb9cc94cb7f8a16aa56ce2ae0dadd03decc7f51eb4f674

> +# C++ compiler is used to build a small tool (prepare-builtins) for the host.
> +# It must be built with the C++ compiler from the host
> +LIBCLC_CONF_OPTS = --with-llvm-config=$(HOST_DIR)/usr/bin/llvm-config \
> +	--prefix="/usr" \
> +	--includedir="/usr/share" \
> +	--pkgconfigdir="/usr/lib/pkgconfig" \

Nit: double quotes are probably not needed around those arguments.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
