From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 4 Apr 2018 10:59:01 +0300
Subject: [Buildroot] libkrb5: Add check for TCL
In-Reply-To: <1522774743-4670-1-git-send-email-nerv@dawncrow.de>
References: <1522774743-4670-1-git-send-email-nerv@dawncrow.de>
Message-ID: <20180404075901.e3nub2ebi7lcbzjj@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andr?,

On Tue, Apr 03, 2018 at 06:59:03PM +0200, Andr? Hentschel wrote:
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> ---
>  package/libkrb5/libkrb5.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
> index 88cfc61..70de82b 100644
> --- a/package/libkrb5/libkrb5.mk
> +++ b/package/libkrb5/libkrb5.mk
> @@ -48,6 +48,13 @@ else
>  LIBKRB5_CONF_OPTS += --without-readline
>  endif
>  
> +ifeq ($(BR2_PACKAGE_TCL),y)
> +LIBKRB5_CONF_OPTS += --with-tcl
> +LIBKRB5_DEPENDENCIES += tcl
> +else
> +LIBKRB5_CONF_OPTS += --without-tcltk
> +endif

Build fails for me here:

checking for tclConfig.sh... not found
configure: WARNING: trying old tcl search code
checking tcl.h usability... yes
checking tcl.h presence... yes
checking for tcl.h... yes
checking tcl/tcl.h usability... no
checking tcl/tcl.h presence... no
checking for tcl/tcl.h... no
checking for Tcl_CreateCommand in -ltcl8.0... no
checking for Tcl_CreateCommand in -ltcl7.6... no
checking for Tcl_CreateCommand in -ltcl7.5... no
checking for Tcl_CreateCommand in -ltcl... no
configure: WARNING: "tcl.h found but not library"
configure: error: Could not find Tcl

I'm using the defconfig for the failed build at

  http://autobuild.buildroot.net/results/d11/d118c3c09f6fc1de26491f2ed480ef28b091dba8/

I also tried --with-tcl="$(STAGING_DIR)/usr" but the result is the same:

checking for tclConfig.sh... .../output/host/i686-buildroot-linux-uclibc/sysroot/usr/lib/tclConfig.sh
checking Tcl info in .../output/host/i686-buildroot-linux-uclibc/sysroot/usr/lib/tclConfig.sh... 8.6 - compilation failed
configure: WARNING: trying old tcl search code
...

It turns out that tclConfig.sh causes '-L/usr/lib' to be added to LDFLAGS. 
This is incompatible with cross-compilation.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
