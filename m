From: Markos Chandras <markos.chandras@gmail.com>
Date: Thu, 20 Jun 2013 15:28:21 +0100
Subject: [Buildroot] [PATCH v2] wvstreams: Pass -fPIC to CFLAGS when
 building PIC objects
In-Reply-To: <1371737650-12310-1-git-send-email-markos.chandras@gmail.com>
References: <1371737650-12310-1-git-send-email-markos.chandras@gmail.com>
Message-ID: <CAG2jQ8iKfzfaCVfyHgKs7sq2w0frw-2690Jjm=4qPR+ANpsd5g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20 June 2013 15:14, Markos Chandras <markos.chandras@gmail.com> wrote:
> From: Markos Chandras <markos.chandras@imgtec.com>
>
> The argp bundled dependency which is linked to the libwvutils.so
> shared library, wasn't built with -fPIC.
> MIPS will refuce to link a non-PIC library with a shared one.
>
> We fix this problem by appending -fPIC to CFLAGS and build all the
> shared objects with -fPIC.
>
> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
> ---
>  package/wvstreams/wvstreams.mk | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/package/wvstreams/wvstreams.mk b/package/wvstreams/wvstreams.mk
> index 65f48d4..fddaad7 100644
> --- a/package/wvstreams/wvstreams.mk
> +++ b/package/wvstreams/wvstreams.mk
> @@ -27,6 +27,10 @@ WVSTREAMS_CONF_OPT += \
>  # needed for openssl detection when statically linking (as ssl needs lz)
>  WVSTREAMS_CONF_ENV += LIBS=-lz
>
> +ifneq ($(BR2_PREFER_STATIC_LIB),y)
> +       WVSTREAMS_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -fPIC"
> +endif

I just noticed this is a mistake. It should be "+=" instead of "=" for
the WVSTREAMS_CONF_ENV.

I can send a new patch if needed.

--
Regards,
Markos Chandras
