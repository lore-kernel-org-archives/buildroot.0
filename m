From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Aug 2018 23:17:58 +0200
Subject: [Buildroot] [PATCH 2/7 v4] support/dependencies: check for
 system-provided bison and flex
In-Reply-To: <d9d77c26d35f7ccfe57e53ce930189ec29980e92.1534522005.git.yann.morin.1998@free.fr>
References: <cover.1534522005.git.yann.morin.1998@free.fr>
 <d9d77c26d35f7ccfe57e53ce930189ec29980e92.1534522005.git.yann.morin.1998@free.fr>
Message-ID: <20180818231758.69bc7209@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 17 Aug 2018 18:06:48 +0200, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  support/dependencies/check-host-bison-flex.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>  create mode 100644 support/dependencies/check-host-bison-flex.mk
> 
> diff --git a/support/dependencies/check-host-bison-flex.mk b/support/dependencies/check-host-bison-flex.mk
> new file mode 100644
> index 0000000000..233b6c51cc
> --- /dev/null
> +++ b/support/dependencies/check-host-bison-flex.mk
> @@ -0,0 +1,10 @@
> +# If the system lacks bison or flex, add
> +# dependencies to suitable host packages
> +
> +ifeq ($(shell which bison 2>/dev/null),)
> +BR2_BISON_HOST_DEPENDENCY = host-bison
> +endif
> +
> +ifeq ($(shell which flex 2>/dev/null),)
> +BR2_FLEX_HOST_DEPENDENCY = host-flex
> +endif

This solution (which differs from what we do for other dependencies,
that are using suitable-host-package) has a drawback: it shows stderr
on the terminal, despite the 2>/dev/null:

$ make
which: no bison in (/usr/local/bin:/usr/bin:/bin:/home/thomas/.rvm/bin:/usr/local/sbin:/usr/sbin:/home/thomas/.rvm/bin:/home/thomas/sys/bin:/home/thomas/.gem/ruby/2.1.0/bin:/home/thomas/.rvm/bin)

I'm not sure why this happens.

Even though it's a bit verbose in code, perhaps we should stick to the
existing model, and introduce check-host-bison.sh check-host-bison.mk
check-host-flex.sh and check-host-flex.mk ?

Long term, maybe all those .mk files are a bit stupid, and we could
simply do the all make logic from dependencies.mk (but that's not for
master).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
