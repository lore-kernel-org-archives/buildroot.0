From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Feb 2015 17:43:41 +0100
Subject: [Buildroot] [PATCH 03/10 v7] package/mesa3d-headers: new package
In-Reply-To: <f37c4782a8b2fb8e9e41b92bf1f321a9a154c843.1423597914.git.yann.morin.1998@free.fr>
References: <cover.1423597914.git.yann.morin.1998@free.fr>
 <f37c4782a8b2fb8e9e41b92bf1f321a9a154c843.1423597914.git.yann.morin.1998@free.fr>
Message-ID: <20150221174341.4387d3ff@free-electrons.com>
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

Thanks, applied, after doing some minor changes:

    [Thomas:
      - Wrap Config.in help text to a reasonable length.
      - Don't rely on mesa3d to provide mesa3d-headers: they should be
        mutually exclusive. Instead, error out if both packages are
        selected.
      - Take into account the update of mesa3d to 10.4.5.
      - Don't copy each header file individually, use a cp -dpfr call to
        copy entires header files directories.]

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
