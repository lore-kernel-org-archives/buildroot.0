From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 May 2021 22:47:44 +0200
Subject: [Buildroot] [PATCHv6 3/5] package/libbpf: new package
In-Reply-To: <20201220151203.2206747-3-romain.naour@gmail.com>
References: <20201220151203.2206747-1-romain.naour@gmail.com>
 <20201220151203.2206747-3-romain.naour@gmail.com>
Message-ID: <cac33d8a-4c18-994f-aef6-2b9b44cd84ed@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/12/2020 16:12, Romain Naour wrote:
> A mirror of bpf-next linux tree bpf-next/tools/lib/bpf
> directory plus its supporting header files. The version
> of the package reflects the version of ABI.
> 
> Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Qais Yousef <qais.yousef@arm.com>
> ---
> I'm not sure if updating the bpf.h provided by the toolchain linux-headers
> is the right things to do.
> 
> v6: Update DEVELOPERS file
> ---
>  DEVELOPERS               |  1 +
>  package/Config.in        |  1 +
>  package/libbpf/Config.in | 20 ++++++++++++++++++++
>  package/libbpf/libbpf.mk | 40 ++++++++++++++++++++++++++++++++++++++++

 hash file is missing.

>  4 files changed, 62 insertions(+)
>  create mode 100644 package/libbpf/Config.in
>  create mode 100644 package/libbpf/libbpf.mk
> 

[snip]
> +# bpf/bpf.h installed by libbpf use enm bpf_iter_link_info that was added since

 I don't know what you meant with "enm", so I just removed it.

 Applied to next with those two fixes, thanks.

 Regards,
 Arnout

> +# kernel 5.9, so we need to update some uapi headers in STAGING_DIR if the
> +# toolchain is build with linux-headers < 5.9.
> +# Otherwise bpf/bpf.h is broken due to out of date linux/bpf.h installed by the
> +# toolchain.
> +# https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=a5cbe05a6673b85bed2a63ffcfea6a96c6410cff
> +ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9),)
> +LIBBPF_UPDATE_UAPI_HEADERS = install_uapi_headers
> +endif
> +
> +define LIBBPF_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
> +		-C $(@D)/src install $(LIBBPF_UPDATE_UAPI_HEADERS) \
> +		DESTDIR=$(STAGING_DIR)
> +endef
> +
> +define LIBBPF_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
> +		-C $(@D)/src install DESTDIR=$(TARGET_DIR)
> +endef
> +
> +$(eval $(generic-package))
> 
