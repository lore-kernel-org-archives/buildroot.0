From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 8 Sep 2015 17:02:00 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/host-gdb: host-texinfo
 needed for full gdb
In-Reply-To: <1441727849-4997-1-git-send-email-brendanheading@gmail.com>
References: <1441727849-4997-1-git-send-email-brendanheading@gmail.com>
Message-ID: <55EF0678.4060807@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Brendan Heading,

On 09/08/2015 04:57 PM, Brendan Heading wrote:
> Fixes :
> http://autobuild.buildroot.net/results/dd5/dd50ed99abb2c8495def826866b184030953f90e/
> 
> .. and many others.
> 
> when building the full gdb (ie not just gdbserver) on the host or target

then don't use "package/host-gdb" in the subject since both of them are
affected.

Regards,

Vincent.

> the "make install" phase seems to expect makeinfo (from texinfo) to be
> present.
> 
> Added a dependency so that the host always depends on host-texinfo, and
> the target depends on it if the full GDB is being built. No need to set
> ac_cv_prog_MAKEINFO anymore as it doesn't seem to achieve the desired
> effect.
> 
> Signed-off-by: Brendan Heading <brendanheading@gmail.com>
> ---
> v1 -> v2: fixed for target, removed duplication in gdb.mk. Used better
> subject suggested by Vicente.
> ---
>  package/gdb/gdb.mk | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index 338de20..d144d6b 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -33,7 +33,8 @@ ifeq ($(BR2_PACKAGE_GDB_DEBUGGER),)
>  GDB_SUBDIR = gdb/gdbserver
>  HOST_GDB_SUBDIR = .
>  else
> -GDB_DEPENDENCIES = ncurses \
> +# need makeinfo if building the full debugger
> +GDB_DEPENDENCIES = ncurses host-texinfo \
>  	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
>  endif
>  
> @@ -165,14 +166,8 @@ else
>  HOST_GDB_CONF_OPTS += --without-python
>  endif
>  
> -ifeq ($(GDB_FROM_GIT),y)
> -GDB_DEPENDENCIES += host-texinfo
> +#since we always build the full GDB on the host, texinfo/makeinfo is required
>  HOST_GDB_DEPENDENCIES += host-texinfo
> -else
> -# don't generate documentation
> -GDB_CONF_ENV += ac_cv_prog_MAKEINFO=missing
> -HOST_GDB_CONF_ENV += ac_cv_prog_MAKEINFO=missing
> -endif
>  
>  # legacy $arch-linux-gdb symlink
>  define HOST_GDB_ADD_SYMLINK
> 
