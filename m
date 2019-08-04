From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Aug 2019 17:52:02 +0200
Subject: [Buildroot] [PATCH 1/1] support/scripts: add node modules to
 check-bin-arch's IGNORES list
In-Reply-To: <20190531075800.7064-1-vcrini@gmail.com>
References: <20190531075800.7064-1-vcrini@gmail.com>
Message-ID: <20190804175202.5161324c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Valerio,

+Martin Bark in Cc.

On Fri, 31 May 2019 09:58:00 +0200
Valerio Crini <vcrini@gmail.com> wrote:

> From: Valerio Crini <valerio.crini@docomodigital.com>
> 
> Some node modules as stf ship compiled binaries causing check-bin-arch script
> to return errors.
> 
> Signed-off-by: Valerio Crini <valerio.crini@docomodigital.com>
> ---
>  support/scripts/check-bin-arch | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/support/scripts/check-bin-arch b/support/scripts/check-bin-arch
> index 3449bd1aeb..a276b75b92 100755
> --- a/support/scripts/check-bin-arch
> +++ b/support/scripts/check-bin-arch
> @@ -25,6 +25,11 @@ declare -a IGNORES=(
>  	# it for a different architecture (e.g. i386 grub on x86_64).
>  	"/lib/grub"
>  	"/usr/lib/grub"
> +
> +	# Skip files in /usr/lib/node_modules, since it is possible to have it
> +	# for a different architecture (e.g. stf module has some packages already
> +	# compiled for several architectures).
> +	"/usr/lib/node_modules"

Thanks for providing this patch. Could you give a bit more details
about which libraries get installed, what is their name, etc. ?

Indeed, rather than ignoring files from /usr/lib/node_modules, it would
be a lot better to remove the libraries that are anyway not useful
because they don't match the CPU architecture of the target. This would
both reduce the filesystem size *and* solve the check-bin-arch issue.

If really this isn't possible, then we could define
NODEJS_BIN_ARCH_EXCLUDE in nodejs.mk, to exclude /usr/lib/node_modules/
from the check-bin-arch verification. It's not as good as preventing
the problem, but it's better than a global exclusion.

In order to investigate this, I tried to do a build with the stf NPM
package, but it failed on bufferutil. I tried the following Buildroot
defconfig:

BR2_arm=y
BR2_cortex_a8=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_NODEJS=y
BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL="stf"
# BR2_TARGET_ROOTFS_TAR is not set

And it resulted in this:

[...]
.../home/thomas/projets/buildroot/output/host/bin/npm install -g stf
[...]
> node-gyp rebuild || node suppress-error.js

  TOUCH Release/obj.target/DTraceProviderStub.stamp

> bufferutil at 1.3.0 install /home/thomas/projets/buildroot/output/target/usr/lib/node_modules/stf/node_modules/bufferutil
> node-gyp rebuild

  CXX(target) Release/obj.target/bufferutil/src/bufferutil.o
In file included from ../../nan/nan.h:190:0,
                 from ../src/bufferutil.cc:16:
../../nan/nan_maybe_43_inl.h: In function ?Nan::Maybe<bool> Nan::ForceSet(v8::Local<v8::Object>, v8::Local<v8::Value>, v8::Local<v8::Value>, v8::PropertyAttribute)?:
../../nan/nan_maybe_43_inl.h:88:15: error: ?class v8::Object? has no member named ?ForceSet?
   return obj->ForceSet(GetCurrentContext(), key, value, attribs);
               ^~~~~~~~

Do you know what is going on ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
