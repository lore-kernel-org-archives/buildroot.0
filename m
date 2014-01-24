From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Jan 2014 01:08:13 +0100
Subject: [Buildroot] [PATCH 04/10] pkg-cmake.mk: build shared library
 when	!BR2_PREFER_STATIC_LIB
In-Reply-To: <1390073027-14239-5-git-send-email-s.martin49@gmail.com>
References: <1390073027-14239-1-git-send-email-s.martin49@gmail.com>
 <1390073027-14239-5-git-send-email-s.martin49@gmail.com>
Message-ID: <20140124000813.GC3446@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Smauel, All,

On 2014-01-18 20:23 +0100, Samuel Martin spake thusly:
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/pkg-cmake.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index 463cd63..aedd1fc 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -64,6 +64,7 @@ define $(2)_CONFIGURE_CMDS
>  	$$($$(PKG)_CONF_ENV) $(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
>  		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
>  		-DCMAKE_INSTALL_PREFIX="/usr" \
> +		-DBUILD_SHARED_LIBS=$(if $(BR2_PREFER_STATIC_LIB),OFF,ON) \
>  		$$($$(PKG)_CONF_OPT) \
>  	)
>  endef

This change breaks the rpi-userland build.

It is not obvious that the build is broken, since the rpi-userland
package itself still seems to build fine, but packages that use it (eg.
omxplayer that I'm integrating) now fail to build.

To reproduce (recipe untested, may need some tweaking, adjust
accordingly):

    git checkout master
    git pull git at gitorious.org:buildroot/buildroot.git yem/omxplayer
    make menuconfig
        -> arm, arm1176jzf-s, EABIhf, vfpv2
        -> Target packages -> Audio and video applications -> omxplayer
    make
    # Coffee/tea/beer/...
    # watch it fail
    make clean
    git revert 9fa7f2b  # pkg-cmake.mk: build shared library when !BR2_PREFER_STATIC_LIB
    make
    # Coffee/tea/beer/...
    # It builds. Yeah!

Thanks to Maxime for finding the culprit!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
