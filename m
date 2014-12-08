From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Dec 2014 23:38:09 +0100
Subject: [Buildroot] [PATCH 6/6] [RFC] package/pkg-cmake.mk: add ccache
 support for host packages
In-Reply-To: <1408113551-29932-7-git-send-email-s.martin49@gmail.com>
References: <1408113551-29932-1-git-send-email-s.martin49@gmail.com>
 <1408113551-29932-7-git-send-email-s.martin49@gmail.com>
Message-ID: <20141208233809.6e7f9042@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Fri, 15 Aug 2014 16:39:11 +0200, Samuel Martin wrote:
> This ccache support for host-cmake-package uses the same logic as the
> one done for the target packages in the toolchainfile.cmake file.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/pkg-cmake.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)

In principle this looks good, but could you resend an updated version
on top of the latest master? And why is this RFC ?

> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index 2006b76..3a6b7e6 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -89,6 +89,16 @@ define $(2)_CONFIGURE_CMDS
>  		-DCMAKE_C_FLAGS="$$(HOST_CFLAGS)" \
>  		-DCMAKE_CXX_FLAGS="$$(HOST_CXXFLAGS)" \
>  		-DCMAKE_EXE_LINKER_FLAGS="$$(HOST_LDFLAGS)" \
> +		-DCMAKE_ASM_COMPILER="$$(HOSTAS)" \
> +		$$(if $$(BR2_CCACHE),\
> +			-DCMAKE_C_COMPILER="$$(HOST_DIR)/usr/bin/ccache" \
> +			-DCMAKE_CXX_COMPILER="$$(HOST_DIR)/usr/bin/ccache" \
> +			-DCMAKE_C_COMPILER_ARG1="$$(HOSTCC)" \
> +			-DCMAKE_CXX_COMPILER_ARG1="$$(HOSTCXX)" \
> +		, \
> +			-DCMAKE_C_COMPILER="$$(HOSTCC)" \
> +			-DCMAKE_CXX_COMPILER="$$(HOSTCXX)" \
> +		) \

Can we make this more readable by having some variables defined before?
Maybe something like:

ifeq ($(BR2_CCACHE),y)
CMAKE_C_COMPILER = $(HOST_DIR)/usr/bin/ccache
CMAKE_CXX_COMPILER = $(HOST_DIR)/usr/bin/ccache
CMAKE_C_COMPILER_ARG1 = $(HOSTCC)
CMAKE_CXX_COMPILER_ARG1 = $(HOSTCXX)
else
CMAKE_C_COMPILER = $(HOSTCC)
CMAKE_CXX_COMPILER = $(HOSTCXX)
endif

And then simply:

		-DCMAKE_C_COMPILER="$(CMAKE_C_COMPILER)"

In the mean time, I'll mark your patch as "Changes Requested" in
patchwork, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
