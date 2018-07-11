From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 11 Jul 2018 23:08:13 +0200
Subject: [Buildroot] [PATCH] package/squid: fix automake breakage
In-Reply-To: <20180711193452.19461-1-jean-francois.tetu@savoirfairelinux.com>
References: <20180711193452.19461-1-jean-francois.tetu@savoirfairelinux.com>
Message-ID: <e8dab288-fa61-b67f-a37a-d5f59023ad44@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-07-18 21:34, Jean-Fran?ois T?tu wrote:
> Much like e27ccbabc1, the recent bump in automake causes a build error.
> If the host automake is not the same version as the one used to generate
> the squid package, the build fails while building the copy of libltdl
> included in the package.
> 
> This happens regardless of the Buildroot automake version since the
> included library is not reconfigured properly. The previous fix set the
> ACLOCAL and AUTOMAKE variables to the Buildroot generated aclocal and
> automake thereby ensuring that the subpackage would build correctly.
> What is needed is to make sure that both the squid configure script and
> the libltdl configure script are reconfigured following a change to
> either configure.ac files.
> 
> This commit adds an option passed to autoreconf which ensures both
> configure scripts are regenerated with Buildroot's autotools.

 Nicely found!

 However, have you also looked into the option of using Buildroot's libtool
instead of the bundled libltdl? If that doesn't work for some reason, I'd like
to add it in the commit log so a future developer who wants to give it go can
see what has been tried already.

 Regards,
 Arnout

> 
> Fixes:
>  http://autobuild.buildroot.net/results/83d/83d8fb0fc25205d6fb8c96a9877e5901275c6766
>  http://autobuild.buildroot.net/results/948/948737590ba648f7dbade1661c0e2e8d9db6522b
> 
> CC: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Signed-off-by: Jean-Fran?ois T?tu <jean-francois.tetu@savoirfairelinux.com>
> ---
>  package/squid/squid.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/squid/squid.mk b/package/squid/squid.mk
> index 2d21ad8858..06442157d6 100644
> --- a/package/squid/squid.mk
> +++ b/package/squid/squid.mk
> @@ -12,6 +12,7 @@ SQUID_LICENSE = GPL-2.0+
>  SQUID_LICENSE_FILES = COPYING
>  # For 0001-assume-get-certificate-ok.patch
>  SQUID_AUTORECONF = YES
> +SQUID_AUTORECONF_OPTS = -fi configure.ac libltdl/configure.ac
>  SQUID_DEPENDENCIES = libcap host-libcap host-pkgconf \
>  	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
>  SQUID_CONF_ENV = \
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
