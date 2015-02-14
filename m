From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 10:09:23 +0100
Subject: [Buildroot] [PATCH 03/10 v7] package/mesa3d-headers: new package
In-Reply-To: <f37c4782a8b2fb8e9e41b92bf1f321a9a154c843.1423597914.git.yann.morin.1998@free.fr>
References: <cover.1423597914.git.yann.morin.1998@free.fr>
 <f37c4782a8b2fb8e9e41b92bf1f321a9a154c843.1423597914.git.yann.morin.1998@free.fr>
Message-ID: <20150214100923.0e47af4f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 10 Feb 2015 21:01:10 +0100, Yann E. MORIN wrote:
> Some OpenGL/EGL/GLES/VG providers do not provide the corresponding
> headers, and rely on using "the headers provided by the distribution".
> 
> In our case, we can not rely on such headers, because we are not a
> distribution, and we have no way to provide those headers (not even
> speaking about relying on the headers provided by hte host distribution,
> because they might well not be installed at all).
> 
> Also, we can not rely on another package to provide those headers,
> because we can only have one provider enabled in any configuration.
> 
> The Khronos group provides such headers, and they are the reference
> headers, but we can not realy use them:

really

> 
>   - most of them are not packaged: they are not versioned and not
>     provided in a tarball, but as separately downloadable files;
> 
>   - those headers are anyway incomplete: there are headers not provided
>     by Khronos, like GL.h
> 
> Instead, we rely on mesa3d to provide those headers: mesa3d has all the
> headers we need.
> 
> Modifying the existing mesa3d package would not be easy; we'd have to
> differentiate whther we need only the headers or the full package. The

whether

> meas3d Config.in and .mk are already quite non-trivial that adding such
> a feature would render them even more illegible.
> 
> So, we introduce mea3d-headers as a new package, that is in fact just
> mesa3d with a much simplified Config.in and .mk, that other OpenXXX
> providers may select if they do not provide the OpenXXX headers.
> 
> Note: we're not installing GLES3 headers, because what Buildroot
> currently calls libgles is in fact libgles2; we have no way to specify
> that we have libgles3. So, we just install headers for GLES and GLES2.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ---
> Notes:
> 
> It should not be possible to select both mesa3d *and* mesa3d-headers at
> the same time, but it is difficult to foresee the multiple combinations
> we may have, due to poor understanding on how binary drivers may behave
> and what they may require, as well as my own poor understanding of the
> GL stack(s).
> 
> So I decided to just print a warning in that case, and just depend on
> mesa3d, which would ultimately provide the headers we are interested in
> anyway. This can be turned into an error if preferred.

Yes, I believe this should rather be an error. The expected users of
mesa3d-headers are proprietary OpenGL implementations, which have
normally no reason to co-exist with Mesa3D on a given system. So I'd
prefer this to be considered an error, and to not have mesa3d-headers
depend on mesa3d when both are enabled.

> +# Only installs header files
> +MESA3D_HEADERS_INSTALL_STAGING = YES
> +MESA3D_HEADERS_INSTALL_TARGET = NO
> +
> +MESA3D_HEADERS_DIRS = KHR
> +
> +ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
> +MESA3D_HEADERS_DIRS += GL
> +endif
> +
> +ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
> +MESA3D_HEADERS_DIRS += EGL
> +endif
> +
> +ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
> +MESA3D_HEADERS_DIRS += GLES GLES2
> +endif
> +
> +ifeq ($(BR2_PACKAGE_HAS_LIBOPENVG),y)
> +MESA3D_HEADERS_DIRS += VG
> +endif
> +
> +define MESA3D_HEADERS_INSTALL_STAGING_CMDS
> +	$(foreach d,$(MESA3D_HEADERS_DIRS),\
> +		for h in $(@D)/include/$(d)/*.h; do \
> +			$(INSTALL) -D -m 0644 $${h} $(STAGING_DIR)/usr/include/$(d)/$$(basename $${h}) || exit 1; \

Instead of doing a for for each header, what about using a plain cp
-dpfr like we do in many other packages?

Let me know if you agree with the proposed changes, I can quickly make
them while applying if you don't want to respin the entire patch series.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
