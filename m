From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Thu, 24 Oct 2019 16:01:46 -0700
Subject: [Buildroot] [PATCH 1/3] package/lld: create
 $(HOST_DIR)/$(GNU_TARGET_NAME)/bin before create symlinks
In-Reply-To: <20191024202211.15619-1-romain.naour@smile.fr>
References: <20191024202211.15619-1-romain.naour@smile.fr>
Message-ID: <CAMWSM7jEMA3F_otYxArASZ0ROFx5qObsAcRn40xTkzFUcUZHXQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Thu, Oct 24, 2019 at 1:22 PM Romain Naour <romain.naour@smile.fr> wrote:
>
> $(HOST_DIR)/$(GNU_TARGET_NAME)/bin directory may not exist before creating
> lld symlinks.
>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Joseph Kogut <joseph.kogut@gmail.com>
> ---
>  package/lld/lld.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/lld/lld.mk b/package/lld/lld.mk
> index a6933e2961..bda5a56ab5 100644
> --- a/package/lld/lld.mk
> +++ b/package/lld/lld.mk
> @@ -14,6 +14,7 @@ HOST_LLD_DEPENDENCIES = host-llvm
>
>  # GCC looks for tools in a different path from LLD's default installation path
>  define HOST_LLD_CREATE_SYMLINKS
> +       mkdir -p $(HOST_DIR)/$(GNU_TARGET_NAME)/bin
>         ln -sf $(HOST_DIR)/bin/lld $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/lld
>         ln -sf $(HOST_DIR)/bin/lld $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/ld.lld
>  endef
> --
> 2.21.0
>

These changes look good. However, the build does still require a
modification to llvm's makefile to disable the bindings for host-llvm.
I'll send a revised version of my earlier patch to address this.

With that patch, this series has my
Tested-By: Joseph Kogut <joseph.kogut@gmail.com>

Tested building on x86-64 w/ GCC 9.2.0, as well as building a sample
program as follows:

$ echo "int main(){ return 0; }" > test.c
$ output/host/bin/x86_64-buildroot-linux-gnu-gcc -fuse-ld=lld test.c -o test
$ readelf --string-dump .comment test

String dump of section '.comment':
  [     0]  GCC: (Buildroot 2019.11-git-01165-g027e1e1410) 9.2.0
  [    35]  Linker: LLD 9.0.0 (https://github.com/buildroot/buildroot
a2f0a106dd6eb62b52c815d299add5a07fd66e98)

$ ./test && echo $?
0
