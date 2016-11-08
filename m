From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 9 Nov 2016 00:04:37 +0100
Subject: [Buildroot] [RFC 1/3] toolchain: workaround musl/kernel headers
 conflict
In-Reply-To: <0cb3afed06c399b9e7d721aa3dafe6ba0eb7e5e5.1478457789.git.baruch@tkos.co.il>
References: <0cb3afed06c399b9e7d721aa3dafe6ba0eb7e5e5.1478457789.git.baruch@tkos.co.il>
Message-ID: <e321884b-e3ff-bfc2-ceb8-71cbbd2524d3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-11-16 19:43, Baruch Siach wrote:
> Rick Felker suggested[1] this hack as a workaround to musl libc conflict with
> kernel headers. Upstream musl still evaluates[2] a permanent solution.

 Add an explanation of what the hack does. Actually, quoting Rick's fully
explanation is probably the best thing to do.

> 
> With this in place we can revert (at least) commits a167081c5d (bridge-utils:
> fix build with musl) and e74d4fc4932 (norm: add patch to fix musl build).
> 
> [1] http://www.openwall.com/lists/musl/2015/10/08/2
> [2] http://www.openwall.com/lists/musl/2016/10/18/1
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  toolchain/toolchain/toolchain.mk | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/toolchain/toolchain/toolchain.mk b/toolchain/toolchain/toolchain.mk
> index c22713bfe349..d317e917d032 100644
> --- a/toolchain/toolchain/toolchain.mk
> +++ b/toolchain/toolchain/toolchain.mk
> @@ -12,6 +12,20 @@ endif
>  
>  TOOLCHAIN_ADD_TOOLCHAIN_DEPENDENCY = NO
>  
> +# Apply a hack that Rick Felker suggested[1] to avoid conflicts between libc
> +# headers and kernel headers. This is a temporary measure until musl finds a
> +# better solution.
> +#
> +# [1] http://www.openwall.com/lists/musl/2015/10/08/2
> +ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> +define TOOLCHAIN_MUSL_KERNEL_HEADERS_COMPATIBILITY_HACK
> +	$(SED) 's/^#if defined(__GLIBC__)$$/#if 1/' \
> +		$(STAGING_DIR)/usr/include/linux/libc-compat.h
> +endef
> +TOOLCHAIN_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_MUSL_KERNEL_HEADERS_COMPATIBILITY_HACK
> +TOOLCHAIN_INSTALL_STAGING = YES

 TOOLCHAIN_POST_INSTALL_STAGING is not ideal because it normally doesn't install
to staging. Can it be moved to musl-compat-headers? It's a bit of work, because
it requires first to move the musl-compat-headers dependency from musl and
toolchain-external to toolchain itself, and then to add dependencies in
musl-compat-headers on linux-headers resp. toolchain-external depending on which
of the two is selected. But I think it's cleaner in the end.

 OTOH this is a hack which can hopefully removed at some point so maybe it
doesn't have to be so clean.

 Regards,
 Arnout

> +endif
> +
>  $(eval $(virtual-package))
>  
>  toolchain: $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
