From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri, 2 Aug 2019 11:18:13 +0200
Subject: [Buildroot] [PATCH 1/1] qemu: fix host virtfs option
In-Reply-To: <20190801115720.11307-1-vincent.stehle@arm.com>
References: <20190801115720.11307-1-vincent.stehle@arm.com>
Message-ID: <CAN5uoS8o=fZECh1vRs1GqDfmp0ShRR-fd6Tu_MrcOe=9nszEow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 1 Aug 2019 at 13:57, Vincent Stehl? <vincent.stehle@arm.com> wrote:
>
> Fix the build of host-qemu with virtfs enabled: fix a typo in makefile
> conditional and add a dependency on host-libcap.
>
> The virtfs configuration option was added by commit e0f49e648401
> ("package/qemu: add option to enable virtual filesystem in host qemu").
>
> Signed-off-by: Vincent Stehle <vincent.stehle@arm.com>
> Cc: Etienne Carriere <etienne.carriere@linaro.org>
> ---
>
>
> (Re-sending in ascii)
>
> Hi,
>
> I build-tested this with a number of architectures[1], with VIRTFS=y/n and
> this looks fine.
>   During testing I remarked that VIRTFS=n is somewhat "weak", as it does
> not forcibly disable virtfs. This means qemu can still auto-detect libcap
> and libattr, and decide to auto-enable virtfs. I think this does not harm,
> but we could also add an explicit --disable-virtfs if preferred. Do not
> hesitate to let me know if I should respin with this change.
>
> ...et au passage un petit coucou a Etienne :)
>
> Vincent.
>
> [1]: aarch64, arm, i386, m68k, microblaze, microblazeel, mips, mips64,
> mips64el, mipsel, ppc, ppc64, riscv32, riscv64, sh4, sh4eb, sparc and
> x86_64.
>
>
>  package/qemu/qemu.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index 73e0778d73..eff4bb6213 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -271,8 +271,9 @@ HOST_QEMU_OPTS += --enable-vde
>  HOST_QEMU_DEPENDENCIES += host-vde2
>  endif
>
> -ifdef ($(BR2_PACKAGE_HOST_QEMU_VIRTFS),y)
> +ifeq ($(BR2_PACKAGE_HOST_QEMU_VIRTFS),y)

Hi Vince!
Apologies for the typo and thanks for the fixes.
etienne


>  HOST_QEMU_OPTS += --enable-virtfs
> +HOST_QEMU_DEPENDENCIES += host-libcap
>  endif
>
>  # Override CPP, as it expects to be able to call it like it'd
> --
> 2.20.1
>
