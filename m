From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 30 Aug 2020 09:57:52 +0200
Subject: [Buildroot] [PATCH v2 05/12] linux: override CC for the case CC
 is not GCC
In-Reply-To: <20190907094027.9537-6-romain.naour@smile.fr>
References: <20190907094027.9537-1-romain.naour@smile.fr>
 <20190907094027.9537-6-romain.naour@smile.fr>
Message-ID: <266c06e4-9067-7895-4fe2-739c09d93590@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/09/2019 11:40, Romain Naour wrote:
> Until now we provided only CROSS_COMPILE to the kernel
> buildsystem to use our GCC cross-compiler. Internally,
> the buildsystem defined CC=$(CROSS_COMPILE)gcc.

 I don't like that we have to patch every package that happens to refer to
gcc... Note that we have roughly 70 packages that use CROSS_COMPILE, so unless
you checked all of them, it is likely that some of them are still referring to
gcc as well (most of them probably not because we set CC=... in
TARGET_CONFIGURE_OPTS, which gets used by most packages (but not by linux.mk)).

 Therefore, maybe a better alternative is to lie to the packages :-) We can
symlink gcc etc. to clang instead of the toolchain wrapper. Then we just have to
find a way to convert g++ to clang++ etc, but note that clang behaves correctly
when called as aarch64-none-linux-gnu-g++ (i.e. it acts as if it was called
through clang-c++), so we can probably work with that.

 Regards,
 Arnout


> Since Clang can now be used as cross-compiler, Buildroot
> may define in the future TARGET_CC to use clang instead
> of GCC.
> 
> In order to build the kernel with the selected compiler,
> make sure to define CC=$(TARGET_CC) in LINUX_MAKE_FLAGS.
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
> ---
>  linux/linux.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 29d2f0ee69..d381c96d85 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -128,6 +128,7 @@ LINUX_MAKE_FLAGS = \
>  	ARCH=$(KERNEL_ARCH) \
>  	INSTALL_MOD_PATH=$(TARGET_DIR) \
>  	CROSS_COMPILE="$(TARGET_CROSS)" \
> +	CC="$(TARGET_CC)" \
>  	DEPMOD=$(HOST_DIR)/sbin/depmod
>  
>  ifeq ($(BR2_REPRODUCIBLE),y)
> 
