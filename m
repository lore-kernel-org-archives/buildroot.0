From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Jun 2014 15:33:26 +0200
Subject: [Buildroot] [PATCH] dhcpcd: fix build with ccache
In-Reply-To: <d3257052bc958700588f.1403443612@localhost>
References: <d3257052bc958700588f.1403443612@localhost>
Message-ID: <20140622133326.GA3509@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-06-22 15:26 +0200, Thomas De Schampheleire spake thusly:
> After the bump to dhcpcd 6.4.0, building dhcpcd with ccache fails at the
> configure step:
> 
> Using compiler .. <buildroot>/output/host/usr/bin/ccache <buildroot>/output/host/usr/bin/i686-pc-linux-gnu-gcc
> <buildroot>/output/host/usr/bin/ccache <buildroot>/output/host/usr/bin/i686-pc-linux-gnu-gcc is not an executable
> make: *** [<buildroot>/output/build/dhcpcd-6.4.0/.stamp_configured] Error 1
> 
> This patch backports an upstream patch to fix this issue.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/dhcpcd/dhcpcd-0001-fix-build-with-ccache.patch |  32 ++++++++++++++
>  1 files changed, 32 insertions(+), 0 deletions(-)
> 
> diff -r a59338f65a46 -r d3257052bc95 package/dhcpcd/dhcpcd-0001-fix-build-with-ccache.patch
> --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
> +++ b/package/dhcpcd/dhcpcd-0001-fix-build-with-ccache.patch	Sun Jun 22 15:22:35 2014 +0200
> @@ -0,0 +1,32 @@
> +configure: support builds using ccache
> +
> +The configure script checks whether CC is executable by means of a check
> +'type $CC'. However, when using ccache, CC is normally set to "ccache gcc"
> +(using the appropriate paths). Such a compound string is not recognized by
> +type, however, and thus configure bails out.
> +
> +This patch changes the check 'type $CC' with a compile test.
> +
> +Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> +
> +Upstream status: another implementation was submitted, modified by
> +maintainer Roy, then simplified based on my suggestion. This patch is a fold
> +of the two upstream patches:
> +http://roy.marples.name/projects/dhcpcd/info/5f4bf91142fceac502c478886aeb5079a184bb43
> +http://roy.marples.name/projects/dhcpcd/info/26bc10be2405659bdf31d690a72d377d6b67ebd4
> +
> +diff -r 66c8bdc88858 configure
> +--- a/configure	Sat Jun 21 16:54:30 2014 +0200
> ++++ b/configure	Sun Jun 22 15:20:25 2014 +0200
> +@@ -272,8 +272,9 @@
> + fi
> + 
> + echo "Using compiler .. $CC"
> +-if ! type "$CC" >/dev/null 2>&1; then
> +-	echo "$CC is not an executable"
> ++if ! echo "int main(void) { return 0; }" | $CC -x c -o /dev/null - 2>/dev/null
> ++then
> ++	echo "$CC does not create executables"
> + 	exit 1
> + fi
> + [ "$CC" != cc ] && echo "CC=	$CC" >>$CONFIG_MK
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
