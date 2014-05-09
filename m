From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Fri, 9 May 2014 10:19:31 -0300
Subject: [Buildroot] [PATCH] iptraf-ng: new package
In-Reply-To: <8738gjb20g.fsf@dell.be.48ers.dk>
References: <1399493248-15443-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <8738gjb20g.fsf@dell.be.48ers.dk>
Message-ID: <20140509131931.GC764@arch.cereza>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09 May 01:54 PM, Peter Korsgaard wrote:
> >>>>> "Ezequiel" == Ezequiel Garcia <ezequiel.garcia@free-electrons.com> writes:
> 
>  > Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
>  > ---
>  > I'm not sure how robust is this usage of MAKE_ENV to force a proper
>  > LDFLAGS for ncurses. Without this, the link is attempted against
>  > the host /usr/lib/ path.
> 
>  > If someone can give a hint on how to call ncurses-config to set
>  > the LDFLAG, it would be much nicer.
> 
>  >  package/Config.in              |  1 +
>  >  package/iptraf-ng/Config.in    | 16 ++++++++++++++++
>  >  package/iptraf-ng/iptraf-ng.mk | 15 +++++++++++++++
>  >  3 files changed, 32 insertions(+)
>  >  create mode 100644 package/iptraf-ng/Config.in
>  >  create mode 100644 package/iptraf-ng/iptraf-ng.mk
> 
>  > diff --git a/package/Config.in b/package/Config.in
>  > index 7800f23..d7fe94c 100644
>  > --- a/package/Config.in
>  > +++ b/package/Config.in
>  > @@ -932,6 +932,7 @@ source "package/iproute2/Config.in"
>  >  source "package/ipsec-tools/Config.in"
>  >  source "package/ipset/Config.in"
>  >  source "package/iptables/Config.in"
>  > +source "package/iptraf-ng/Config.in"
>  >  source "package/iputils/Config.in"
>  >  source "package/iw/Config.in"
>  >  source "package/kismet/Config.in"
>  > diff --git a/package/iptraf-ng/Config.in b/package/iptraf-ng/Config.in
>  > new file mode 100644
>  > index 0000000..4302b95
>  > --- /dev/null
>  > +++ b/package/iptraf-ng/Config.in
>  > @@ -0,0 +1,16 @@
>  > +config BR2_PACKAGE_IPTRAF_NG
>  > +	bool "iptraf-ng"
>  > +	select BR2_PACKAGE_NCURSES
>  > +	select BR2_PACKAGE_NCURSES_TARGET_PANEL
>  > +	depends on BR2_TOOLCHAIN_HAS_THREADS
> 
> I don't see any pthread references anywwhere, but it does include
> netinet/ip6.h so it needs to depend on BR2_INET_IPV6.
> 

Arg! Searched for 'fork' instead of 'threads' and it seems I missed the ip6...

>  > +	help
>  > +	  IPTraf-ng is a ncurses-based network monitoring utility. It gathers
>  > +	  data like TCP connection packet and byte counts, interface statistics
>  > +	  and activity indicators.
>  > +
>  > +	  https://fedorahosted.org/iptraf-ng/
>  > +
>  > +	  IPTraf-ng is a fork of original IPTraf v3.0.0 (http://iptraf.seul.org).
>  > +
>  > +comment "iptraf-ng needs a toolchain w/ threads"
>  > +	depends on !BR2_TOOLCHAIN_HAS_THREADS
>  > diff --git a/package/iptraf-ng/iptraf-ng.mk b/package/iptraf-ng/iptraf-ng.mk
>  > new file mode 100644
>  > index 0000000..5821971
>  > --- /dev/null
>  > +++ b/package/iptraf-ng/iptraf-ng.mk
>  > @@ -0,0 +1,15 @@
>  > +################################################################################
>  > +#
>  > +# iptraf-ng
>  > +#
>  > +################################################################################
>  > +
>  > +IPTRAF_NG_VERSION = 1.1.4
>  > +IPTRAF_NG_SITE = https://fedorahosted.org/releases/i/p/iptraf-ng/
>  > +IPTRAF_NG_LICENSE = GPLv2+
>  > +IPTRAF_NG_LICENSE_FILES = LICENSE
>  > +IPTRAF_NG_DEPENDENCIES = ncurses
>  > +
>  > +IPTRAF_NG_MAKE_ENV = NCURSES_LDFLAGS="-L$(TARGET_DIR)/usr/lib -lncurses -lpanel"
> 
> The target directory will normally have the needed .a / .la files
> stripped, so it should use STAGING_DIR instead. None of them are needed
> though as the compiler is already configured to look there.
> 
> Finally -lpanel should go before -lncurses for static linking as it uses
> functions from there.
> 
> Committed with these fixes, thanks.
> 

OK, good. Just tested it builds fine.

Thanks,
-- 
Ezequiel Garc?a, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
