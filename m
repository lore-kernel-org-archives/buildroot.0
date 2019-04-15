From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Apr 2019 22:10:11 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/ngircd: fix static build with openssl and atomic
In-Reply-To: <20190414155153.4317-1-fontaine.fabrice@gmail.com>
References: <20190414155153.4317-1-fontaine.fabrice@gmail.com>
Message-ID: <20190415221011.55b0ea91@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 14 Apr 2019 17:51:53 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/72345ebd144bed824329618e66721a98eba3be22
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

This was still causing the AC_CHECK_LIB error here, which was in fact
due to the use of PKG_CHECK_MODULES without having host-pkgconf in the
dependencies. With this, ngircd built fine, but unfortunately, there is
still an issue.

> +# We're patching configure.ng, but package cannot autoreconf with
> +# automake >= 1.12 because de-ANSI-fication has been removed so apply the same
> +# tweaks that are done by upstream in autogen.sh
> +define NGIRCD_REMOVE_DE_ANSI_FICATION
> +	sed -e "s|^__ng_PROTOTYPES__|AC_C_PROTOTYPES|g" \
> +		$(@D)/configure.ng > $(@D)/configure.ac
> +
> +	sed -e "s|^__ng_Makefile_am_template__|AUTOMAKE_OPTIONS = ${SERIAL_TESTS} #ansi2knr|g" \

This ${SERIAL_TESTS}

> +		$(@D)/src/portab/Makefile.ng > $(@D)/src/portab/Makefile.am
> +	for i in ipaddr/Makefile ngircd/Makefile testsuite/Makefile tool/Makefile; do \
> +		sed -e "s|^__ng_Makefile_am_template__|AUTOMAKE_OPTIONS = ${SERIAL_TESTS} #../portab/ansi2knr|g" \

and here, cause check-package to complain:

package/ngircd/ngircd.mk:23: use $() to delimit variables, not ${}
package/ngircd/ngircd.mk:26: use $() to delimit variables, not ${}

so we need to find a way to either silence those warnings, or work
around them. Perhaps we could simply include a patch ?

The tarball already has the configure.ac and Makefile.am generated,
they only need to be tweaked for de-ansi-fication, and a patch may be a
good alternative.

What do you think ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
