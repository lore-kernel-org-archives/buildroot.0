From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Jul 2017 23:54:22 +0200
Subject: [Buildroot] [PATCH 05/13] packages: use new $($PKG)_DL_DIR)
 variable
In-Reply-To: <20170722233936.1172006e@windsurf>
References: <20170704162211.13238-1-maxime.hadjinlian@gmail.com>
 <20170704162211.13238-6-maxime.hadjinlian@gmail.com>
 <20170722233936.1172006e@windsurf>
Message-ID: <20170722215422.GH9929@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Maxime, All,

On 2017-07-22 23:39 +0200, Thomas Petazzoni spake thusly:
> Hello,
> 
> On Tue,  4 Jul 2017 18:22:03 +0200, Maxime Hadjinlian wrote:
> > Instead of DL_DIR, the package should now use $(PKG)_DL_DIR to ease the
> > transition into a new directory structure for DL_DIR.
> > 
> > This commit has been generated with the following scripts:
> > 
> > for i in package/*/*.mk; do
> > 	if ! grep -q "\$(DL_DIR)" ${i}; then
> > 		continue
> > 	fi
> > 	pkg_name="$(basename $(dirname ${i}))"
> > 	raw_pkg_name=$(echo ${pkg_name} | tr [a-z] [A-Z] | tr '-' '_')
> > 	pkg_dl_dir="${raw_pkg_name}_DL_DIR"
> > 	sed -i "s/\$(DL_DIR)/\$($pkg_dl_dir)/" ${i}
> > done
> > 
> > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> 
> I wanted to apply this one, but I believe there is a problem, see below:
> 
> > diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> > index b52f9456b3..64fcfc70e7 100644
> > --- a/package/gcc/gcc.mk
> > +++ b/package/gcc/gcc.mk
> > @@ -289,7 +289,7 @@ HOST_GCC_COMMON_MAKE_OPTS = \
> >  	gcc_cv_libc_provides_ssp=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
> >  
> >  ifeq ($(BR2_CCACHE),y)
> > -HOST_GCC_COMMON_CCACHE_HASH_FILES += $(DL_DIR)/$(GCC_SOURCE)
> > +HOST_GCC_COMMON_CCACHE_HASH_FILES += $(GCC_DL_DIR)/$(GCC_SOURCE)
> 
> I'm not sure this one works. Indeed, there is no package named just
> "gcc". There are two packages named gcc-initial and gcc-final, but no
> package named "gcc", so GCC_DL_DIR doesn't exist. Only
> GCC_INITIAL_DL_DIR and GCC_FINAL_DL_DIR exist.

Indeed, it does not exist;

    $ make -s printvars VARS=GCC_DL_DIR
    [nothing]

Regards,
Yann E. MORIN.

> Am I missing something here ?
> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
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
