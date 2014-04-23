From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Apr 2014 00:19:56 +0200
Subject: [Buildroot] [PATCH v3] wget: fix host-gettext build dependency
 race
In-Reply-To: <241760c83c2b11674de4aa22c1f84786ac0a5fdf.1398275469.git.baruch@tkos.co.il>
References: <241760c83c2b11674de4aa22c1f84786ac0a5fdf.1398275469.git.baruch@tkos.co.il>
Message-ID: <20140424001956.11021ebe@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Wed, 23 Apr 2014 20:51:09 +0300, Baruch Siach wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Currently, the gettextization of wget works by chance:
>   - host-gettext is added as a dependency to wget;
>   - gettextize is run as a post-patch hook.
> 
> But the dependencies are only guaranteed to be built and installed
> for the configure step, not the patch step. Because post-patch hooks
> are part of the patch step, we have no guarantee that the dependency
> to host-gettext is done by the time we gettextize wget.
> 
> This happens to work by chance, since wget sorts alphabetically after
> gettext, so we indeed have host-gettext built and installed by the
> time we need to gettextize wget.
> 
> This is prone to fail in the parallel build case, since we can no
> longer rely on alphabetical order in that case.
> 
> Instead, run gettextize in PRE_CONFIGURE_HOOKS to avoid the race.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> [baruch: make the fix independent from the gettextize infra]
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v3:
> 	s/_HOOK/_HOOKS/
> 
> v2:
> 	Use PRE_CONFIGURE_HOOKS to make the fix independent from the rejected
> 	gettextize infrastructure; update the commit log accordingly
> ---
>  package/wget/wget.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
