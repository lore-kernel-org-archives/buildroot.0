From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 15:15:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/gerbera: fix build with -Os and
 gcc 9 or 10
In-Reply-To: <20210513114633.1926431-1-fontaine.fabrice@gmail.com>
References: <20210513114633.1926431-1-fontaine.fabrice@gmail.com>
Message-ID: <20210518131532.GK2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-13 13:46 +0200, Fabrice Fontaine spake thusly:
> For an unknown reason, gerbera fails to build with -Os and gcc 9 or 10
> since bump to version 1.8.0 in commit 8974596836945eada8e162844fb87f88adec9100:
> 
> [100%] Linking CXX executable gerbera
> /home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/10.2.0/../../../../x86_64-buildroot-linux-gnu/bin/ld: liblibgerbera.a(content_manager.cc.o): in function `ContentManager::_rescanDirectory(std::shared_ptr<AutoscanDirectory>&, int, std::shared_ptr<GenericTask> const&)':
> content_manager.cc:(.text+0xb53b): undefined reference to `std::__shared_ptr<std::filesystem::__cxx11::_Dir, (__gnu_cxx::_Lock_policy)2>::swap(std::__shared_ptr<std::filesystem::__cxx11::_Dir, (__gnu_cxx::_Lock_policy)2>&)'
> collect2: error: ld returned 1 exit status
> 
> A similar build failure has been reported as gcc bug 91067:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=91067
> 
> But this bug has been fixed since gcc 9.3 and 10.1 and build failures
> are raised with gcc 10.2
> 
> To fix this build failure, set optimisation to -O2 if needed
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a4ee8ad7ff93939716673b611c7cc3f68dafa3d0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gerbera/gerbera.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/gerbera/gerbera.mk b/package/gerbera/gerbera.mk
> index 73917c7721..9627209d60 100644
> --- a/package/gerbera/gerbera.mk
> +++ b/package/gerbera/gerbera.mk
> @@ -18,6 +18,10 @@ GERBERA_DEPENDENCIES = \
>  	zlib
>  GERBERA_CONF_OPTS = -DWITH_DEBUG=OFF
>  
> +ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_9)$(BR2_OPTIMIZE_S),yy)
> +GERBERA_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -O2"
> +endif
> +
>  # Uses __atomic_fetch_add_4
>  ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
>  GERBERA_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
