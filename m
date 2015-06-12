From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jun 2015 23:13:07 +0200
Subject: [Buildroot] [PATCH] libxmlrpc: fix static build
In-Reply-To: <5425b32256128e928f8ad22c596f91ab7ac5f9e8.1433859609.git.baruch@tkos.co.il>
References: <5425b32256128e928f8ad22c596f91ab7ac5f9e8.1433859609.git.baruch@tkos.co.il>
Message-ID: <20150612231307.690e22d0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Tue,  9 Jun 2015 17:20:09 +0300, Baruch Siach wrote:
> Fixes:
> http://autobuild.buildroot.net/results/16d/16de14ace7b4e089f56b9cb173542e487cae3a9d/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/libxmlrpc/libxmlrpc.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/package/libxmlrpc/libxmlrpc.mk b/package/libxmlrpc/libxmlrpc.mk
> index c3788d6c3f36..a6137e07b828 100644
> --- a/package/libxmlrpc/libxmlrpc.mk
> +++ b/package/libxmlrpc/libxmlrpc.mk
> @@ -35,4 +35,14 @@ LIBXMLRPC_MAKE_ENV = \
>  	CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
>  	LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)"
>  
> +ifeq ($(BR2_STATIC_LIBS),y)
> +LIBXMLRPC_STATIC_OPTS = SHARED_LIB_TYPE=NONE MUST_BUILD_SHLIB=N
> +endif
> +
> +LIBXMLRPC_MAKE_OPTS = $(LIBXMLRPC_STATIC_OPTS)
> +LIBXMLRPC_INSTALL_STAGING_OPTS = $(LIBXMLRPC_STATIC_OPTS) \
> +	DESTDIR=$(STAGING_DIR) install
> +LIBXMLRPC_INSTALL_TARGET_OPTS = $(LIBXMLRPC_STATIC_OPTS) \
> +	DESTDIR=$(TARGET_DIR) install
> +
>  $(eval $(autotools-package))

Can you try instead something like:

ifeq ($(BR2_STATIC_LIBS),y)
LIBXMLRPC_MAKE_ENV += SHARED_LIB_TYPE=NONE MUST_BUILD_SHLIB=N
endif

The advantage is that LIBXMLRPC_MAKE_ENV is passed to the build,
install staging and install target steps.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
