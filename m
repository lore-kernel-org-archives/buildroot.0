From: Anisse Astier <anisse@astier.eu>
Date: Thu, 24 Jan 2019 10:08:56 +0100
Subject: [Buildroot] [PATCH 1/1] pkg-golang: add strip, asmflags,
 gcflags support
In-Reply-To: <20190124081834.17534-1-christian@paral.in>
References: <20190124081834.17534-1-christian@paral.in>
Message-ID: <20190124090856.4sab2733vepeera6@bifrost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 24, 2019 at 12:18:34AM -0800, Christian Stewart wrote:
> Adding package-level variables to set asmflags, gcflags.
> 
> Conditionally sets ldflags -s -w when buildroot is configured to strip binaries.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/pkg-golang.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
> index 4f2c7e77e1..79ebec94be 100644
> --- a/package/pkg-golang.mk
> +++ b/package/pkg-golang.mk
> @@ -55,7 +55,15 @@ ifeq ($(BR2_STATIC_LIBS),y)
>  $(2)_LDFLAGS += -extldflags '-static'
>  endif
>  
> +ifeq ($(BR2_STRIP_strip),y)
> +$(2)_LDFLAGS += -s -w
> +endif
> +
> +$(2)_ASMFLAGS += -trimpath=$(BUILD_DIR)
> +$(2)_GCFLAGS  += -trimpath=$(BUILD_DIR)

I see that you added trimpath here, which is useful for removing the
build path from the binaries, (and having reproducible builds), but it
isn't mentionned in the commit message.

As a sidenote, it seems that this option is broken when building a
package with go modules:
https://github.com/golang/go/issues/28008

Regards,

Anisse
