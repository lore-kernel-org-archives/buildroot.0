From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Aug 2020 00:11:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/efl: fix build without NLS
In-Reply-To: <20200819214808.2979319-1-fontaine.fabrice@gmail.com>
References: <20200819214808.2979319-1-fontaine.fabrice@gmail.com>
Message-ID: <20200821001103.0caf1312@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 19 Aug 2020 23:48:08 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> nls is enabled by default in meson_options.txt (which is available since
> version 1.22.0). NLS was explicitly disabled for host-efl in commit
> 6deaa3d50de166ce187e8b15c70394a8eb844c03 but nothing was done for the
> target resulting in the following build failure:
> 
> ../src/lib/elementary/elm_priv.h:189:25: warning: implicit declaration of function '_elm_dgettext'; did you mean 'dgettext'? [-Wimplicit-function-declaration]
>  #  define E_(string)    _elm_dgettext(string)
>                          ^~~~~~~~~~~~~
> 
> /nvme/rc-buildroot-test/scripts/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/8.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: src/lib/elementary/libelementary.so.1.24.3.p/elc_hoversel.c.o: in function `_access_state_cb':
> elc_hoversel.c:(.text+0x1210): undefined reference to `_elm_dgettext'
> 
> So enable nls dependening on BR2_SYSTEM_ENABLE_NLS and add
> TARGET_NLS_DEPENDENCIES to EFL_DEPENDENCIES
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/5985b39b87c5c392b4f9b65c12008ec7b3a143fe
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/efl/efl.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
