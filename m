From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed, 15 May 2019 12:27:18 +0300
Subject: [Buildroot] [PATCH 1/1] package/brotli: fix build on microblaze
 with -02
In-Reply-To: <20190514211526.26467-1-fontaine.fabrice@gmail.com>
References: <20190514211526.26467-1-fontaine.fabrice@gmail.com>
Message-ID: <20190515122718.GB6334@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, 14 May 2019 23:15:26 +0200, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> Fixes:
>  - http://autobuild.buildroot.org/results/4790c30b75cdec18f67cda9c6afcb6971ee27608
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>

> ---
>  package/brotli/brotli.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/brotli/brotli.mk b/package/brotli/brotli.mk
> index 2c1ad48753..4afd3628a8 100644
> --- a/package/brotli/brotli.mk
> +++ b/package/brotli/brotli.mk
> @@ -14,4 +14,11 @@ BROTLI_CONF_OPTS = \
>  	-DBROTLI_DISABLE_TESTS=ON \
>  	-DBROTLI_BUNDLED_MODE=OFF
>  
> +# prevents from triggering GCC ICE
> +# A bug was reported to the gcc bug tracker:
> +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485
> +ifeq ($(BR2_microblaze),y)
> +BROTLI_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -O0"
> +endif

This is not a great fix, but still better than not being able to build the
package at all, so I think it's okay to merge it. ?\_(?)_/? 

>  $(eval $(cmake-package))
> -- 
> 2.20.1
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190515/b4477b85/attachment.asc>
