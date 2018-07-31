From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 Jul 2018 22:02:32 +0200
Subject: [Buildroot] [PATCH] gcc: Fix building on ppc64le GCC 8 host
In-Reply-To: <20180730103630.21804-1-joel@jms.id.au>
References: <20180730103630.21804-1-joel@jms.id.au>
Message-ID: <20180731220232.3d3b4f4d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 30 Jul 2018 20:06:30 +0930, Joel Stanley wrote:
> When building on a ppc64le host we see this error:
> 
>     build/genmatch --gimple ../../gcc/match.pd \
>         > tmp-gimple-match.c  
>     ../../gcc/match.pd:120:1 error: expected (, got NAME
>        negative value by 0 gives -0, not +0.  */
> 
> This was reported upstream[1] and fixed on the GCC 6 [2] and GCC 7 [3]
> branches:
> 
>     Backport from mainline
>     2018-01-10  Kelvin Nilsen  <kelvin@gcc.gnu.org>
> 
>     * lex.c (search_line_fast): Remove illegal coercion of an
>     unaligned pointer value to vector pointer type and replace with
>     use of __builtin_vec_vsx_ld () built-in function, which operates
>     on unaligned pointer values.
> 
> The patches included in Buildroot contain just the code changes, and not
> the changelog, to make it easer to manage backporting.
> 
> Tested on Ubuntu Cosmic ppc64le.
> 
> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=86162
> [2] https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=261621
> [3] https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=262243
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  .../6.4.0/0002-fix-building-on-ppc64.patch    | 38 ++++++++++++++++++
>  .../7.3.0/0002-fix-building-on-ppc64.patch    | 40 +++++++++++++++++++
>  2 files changed, 78 insertions(+)
>  create mode 100644 package/gcc/6.4.0/0002-fix-building-on-ppc64.patch
>  create mode 100644 package/gcc/7.3.0/0002-fix-building-on-ppc64.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
