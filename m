From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Sep 2014 18:27:35 +0200
Subject: [Buildroot] [PATCH v2 2/5] package/pkg-cmake.mk: set the {C, CXX,
 LD}FLAGS for host packages
In-Reply-To: <1408653920-18954-3-git-send-email-s.martin49@gmail.com>
References: <1408653920-18954-1-git-send-email-s.martin49@gmail.com>
 <1408653920-18954-3-git-send-email-s.martin49@gmail.com>
Message-ID: <20140914162735.GA21222@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-08-21 22:45 +0200, Samuel Martin spake thusly:
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

As I am not a cmake expert, I'd like a bit more explanations in the
commit log.

What puzzles me is that, for the target case, these flags are passed via
support/misc/toolchainfile.cmake.in, while for the host, we pass them on
the command line. This is not consistent.

Why don't we also use a host.cmake.in file like we have for the target?

Note that us having support/misc/toolchainfile.cmake.in does not even
help for building a cmake package outside of Buildroot (but still using
our toolchain), since the user may forget to define CMAKE_TOOLCHAIN_FILE
when calling cmake on his own.

Note: I know you have a good answer, but I'm a bit lost as to all those
special-casing in cmake, which makes reviewing a bit difficult, and a
bit of comments in the commit log (a pointer to the cmake doc would be
enough!) would make it easier.

Regards,
Yann E. MORIN.

> ---
> changes v1 -> v2:
> - no change
> ---
>  package/pkg-cmake.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index f5aefae..3655751 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -86,6 +86,9 @@ define $(2)_CONFIGURE_CMDS
>  		-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY="BOTH" \
>  		-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE="BOTH" \
>  		-DCMAKE_INSTALL_PREFIX="$$(HOST_DIR)/usr" \
> +		-DCMAKE_C_FLAGS="$$(HOST_CFLAGS)" \
> +		-DCMAKE_CXX_FLAGS="$$(HOST_CXXFLAGS)" \
> +		-DCMAKE_EXE_LINKER_FLAGS="$$(HOST_LDFLAGS)" \
>  		-DBUILD_TESTING=OFF \
>  		$$($$(PKG)_CONF_OPT) \
>  	)
> -- 
> 2.1.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
