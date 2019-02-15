From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Feb 2019 22:00:00 +0100
Subject: [Buildroot] [PATCH 1/2] package/madplay: needs autoreconf
In-Reply-To: <20190214214321.31854-1-fontaine.fabrice@gmail.com>
References: <20190214214321.31854-1-fontaine.fabrice@gmail.com>
Message-ID: <20190215220000.70ba6c59@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 14 Feb 2019 22:43:20 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> madplay uses a very old configure script.
> 
> When the toolchain lacks C++ and the build machine lacks /lib/cpp, this
> old configure script fails because it can't find a C++ preprocessor that
> is valid:
> 
>     checking for arm-buildroot-linux-uclibcgnueabi-g++... no
>     checking whether we are using the GNU C++ compiler... no
>     checking whether no accepts -g... no
>     checking dependency style of no... none
>     checking how to run the C++ preprocessor... /lib/cpp
>     configure: error: C++ preprocessor "/lib/cpp" fails sanity check
>     See `config.log' for more details.
> 
> This is yet another case that was tentatively fixed by bd39d11d2e
> (core/infra: fix build on toolchain without C++), further amended by
> 4cd1ab15886 (core: alternate solution to disable C++).
> 
> However, this only works on libtool scripts that are recent enough, and
> thus we need to autoreconf to get it.
> 
> We also need to patch configure.ac so that it does not fail on the
> missing, GNU-specific files: NEWS, AUTHORS, and Changelog.
> 
> Finally, remove also patch on ltmain.sh and MADPLAY_LIBTOOL_PATCH=NO as
> autoreconf will create an up to date ltmain.sh
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/fc927de0e9a42095789fb0a631d5facf14076f6e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0002-buildroot-libtool-v1.5.patch.patch        | 109 ---------------------
>  .../0002-configure-ac-automake-foreign.patch       |  16 +++
>  package/madplay/madplay.mk                         |   5 +-
>  3 files changed, 20 insertions(+), 110 deletions(-)
>  delete mode 100644 package/madplay/0002-buildroot-libtool-v1.5.patch.patch
>  create mode 100644 package/madplay/0002-configure-ac-automake-foreign.patch

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
