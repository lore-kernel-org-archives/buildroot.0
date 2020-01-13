From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 13 Jan 2020 21:58:35 +0100
Subject: [Buildroot] [PATCH] package/meson: fix shabang in deep build
 trees
In-Reply-To: <20200113180322.5618-1-yann.morin.1998@free.fr>
References: <20200113180322.5618-1-yann.morin.1998@free.fr>
Message-ID: <3d675a20-7663-c884-70c2-0880176346de@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13/01/2020 19:03, Yann E. MORIN wrote:
> The meson script includes the full path to the python interpreter. In
> deep build trees, this path can be more than 128 characters long, which
> is the limit a shabang might be.
> 
> In older kernels, that was silently ignored, leading to potential bugs,
> but newer kernels enforce that limit, and refuse to execve() the script,
> returning with NOEXEC. Since the script is +x, the shell (any bourne
> shell, as well as the C shell) will conclude from that situation that
> they should interpret it as a shell script, which it obviously is not.
> 
> Fix the problem bu replacing the shabang with a call to /usr/bin/env
> which will redirect to the correct pytohn3 interpreter found in the
> PATH.
> 
> Note however that this means our meson installation can no longer be
> called from outside of the meson-package infrastructure anymore (not
> that we ever supported it before, but who knows what people may have
> done in their br2-external), unless one does set the PATH to include
> $(HOST_DIR)/bin/ earlier than a system-provided python3 would be found.

Actually, since meson doesn't depend on any non-standard python package, using
the system-provided python3 is fine. In fact, IIRC the idea was to use the
system-provided python3 if available, but nobody ever implemented that.

 Regards,
 Arnout

> 
> Fixes: #12331 #12461
> 
> Reported-by: Jean-pierre Cartal <jpcartal@free.fr>
> Reported-by: Matthias Wei?er <m.weisser.m@gmail.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/meson/meson.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/meson/meson.mk b/package/meson/meson.mk
> index d409ae7b52..179daaa38a 100644
> --- a/package/meson/meson.mk
> +++ b/package/meson/meson.mk
> @@ -49,4 +49,10 @@ HOST_MESON_SED_CFLAGS = $(if $(strip $(TARGET_CFLAGS)),`printf '"%s"$(comma) ' $
>  HOST_MESON_SED_LDFLAGS = $(if $(strip $(TARGET_LDFLAGS)),`printf '"%s"$(comma) ' $(TARGET_LDFLAGS)`)
>  HOST_MESON_SED_CXXFLAGS = $(if $(strip $(TARGET_CXXFLAGS)),`printf '"%s"$(comma) ' $(TARGET_CXXFLAGS)`)
>  
> +# Avoid interpreter shabang longer than 127 chars
> +define HOST_MESON_SET_INTERPRETER
> +	$(SED) '1s:.*:#!/usr/bin/env python3:' $(HOST_DIR)/bin/meson
> +endef
> +HOST_MESON_POST_INSTALL_HOOKS += HOST_MESON_SET_INTERPRETER
> +
>  $(eval $(host-python-package))
> 
