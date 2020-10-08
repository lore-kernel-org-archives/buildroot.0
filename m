From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Oct 2020 13:56:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/cukinia: fix dependency
In-Reply-To: <20201008101519.7463-1-fontaine.fabrice@gmail.com>
References: <20201008101519.7463-1-fontaine.fabrice@gmail.com>
Message-ID: <20201008135657.1e1167ab@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  8 Oct 2020 12:15:19 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> gawk can't be selected when busybox is not available as gawk needs
> wchar:
> 
> WARNING: unmet direct dependencies detected for BR2_PACKAGE_GAWK
>   Depends on [n]: BR2_USE_WCHAR [=n] && BR2_USE_MMU [=y] && BR2_PACKAGE_BUSYBOX_SHOW_OTHERS [=y]
>   Selected by [y]:
>   - BR2_PACKAGE_CUKINIA [=y] && !BR2_PACKAGE_BUSYBOX [=n]
> 
> So replace this "select" by a "depends on", as already done by
> BR2_PACKAGE_APPARMOR_UTILS_EXTRA

Sorry, I missed this.

> -	select BR2_PACKAGE_GAWK if !BR2_PACKAGE_BUSYBOX
> +	depends on BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_GAWK

It's not really nice that users have to know that either busybox or
gawk have to be enabled. Perhaps something like this would work:

	depends on BR2_USE_MMU || BR2_PACKAGE_BUSYBOX
	depends on BR2_USE_WCHAR || BR2_PACKAGE_BUSYBOX
	select BR2_PACKAGE_GAWK if !BR2_PACKAGE_BUSYBOX

But I agree it's a bit crappy/complex.

Or maybe do what you propose, but like apparmor, also add a comment:

comment "utils (extras) need bash and perl, and busybox or gawk"
        depends on !BR2_PACKAGE_BASH || !BR2_PACKAGE_PERL \
                || !(BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_GAWK)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
