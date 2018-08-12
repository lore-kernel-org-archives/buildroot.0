From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 12 Aug 2018 10:04:30 +0200
Subject: [Buildroot] [PATCH 12/17] perl-template-toolkit: new package
In-Reply-To: <20180811182749.20924-13-chrismcc@gmail.com>
References: <20180811182749.20924-1-chrismcc@gmail.com>
 <20180811182749.20924-13-chrismcc@gmail.com>
Message-ID: <CAB0FRsuTNsRPaBAUB26k10y6Ubuzg9bpFRz3i2E2kkX9vOFqSg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2018-08-11 20:27 GMT+02:00 Christopher McCrory <chrismcc@gmail.com>:

> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
> ---
>  DEVELOPERS                                               |  1 +
>  package/Config.in                                        |  1 +
>  package/perl-template-toolkit/Config.in                  | 11 +++++++++++
>  package/perl-template-toolkit/perl-template-toolkit.hash |  6 ++++++
>  package/perl-template-toolkit/perl-template-toolkit.mk   | 14
> ++++++++++++++
>  5 files changed, 33 insertions(+)
>  create mode 100644 package/perl-template-toolkit/Config.in
>  create mode 100644 package/perl-template-toolkit/
> perl-template-toolkit.hash
>  create mode 100644 package/perl-template-toolkit/perl-template-toolkit.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index ce2e31461a..e23ad8a879 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -504,6 +504,7 @@ F:  package/perl-params-util
>  F:     package/perl-sub-install
>  F:     package/perl-sys-meminfo
>  F:     package/perl-sys-mmap
> +F:     package/perl-template-toolkit
>
>  N:     Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
>  F:     package/audit/
> diff --git a/package/Config.in b/package/Config.in
> index 57b22af90e..58c75b0d8f 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -732,6 +732,7 @@ menu "Perl libraries/modules"
>         source "package/perl-sub-install/Config.in"
>         source "package/perl-sys-meminfo/Config.in"
>         source "package/perl-sys-mmap/Config.in"
> +       source "package/perl-template-toolkit/Config.in"
>         source "package/perl-time-hires/Config.in"
>         source "package/perl-timedate/Config.in"
>         source "package/perl-try-tiny/Config.in"
> diff --git a/package/perl-template-toolkit/Config.in
> b/package/perl-template-toolkit/Config.in
> new file mode 100644
> index 0000000000..1caca074aa
> --- /dev/null
> +++ b/package/perl-template-toolkit/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_PERL_TEMPLATE_TOOLKIT
> +       bool "perl-template-toolkit"
> +       depends on !BR2_STATIC_LIBS
> +       select BR2_PACKAGE_PERL_APPCONFIG
> +       help
> +         comprehensive template processing system
> +
> +         https://metacpan.org/release/Template-Toolkit
> +
> +comment "perl-template-toolkit needs a toolchain w/ dynamic library"
> +       depends on BR2_STATIC_LIBS
> diff --git a/package/perl-template-toolkit/perl-template-toolkit.hash
> b/package/perl-template-toolkit/perl-template-toolkit.hash
> new file mode 100644
> index 0000000000..54d4553695
> --- /dev/null
> +++ b/package/perl-template-toolkit/perl-template-toolkit.hash
> @@ -0,0 +1,6 @@
> +# retrieved by scancpan from http://cpan.metacpan.org/
> +md5    a7fae5d4fe5918f33105d92a62134067 Template-Toolkit-2.27.tar.gz
> +sha256 1311a403264d0134c585af0309ff2a9d5074b8ece23ece5660d31ec96bf2c6dc
> Template-Toolkit-2.27.tar.gz
> +
> +# computed by scancpan
> +sha256 d897b2d98affd4f0489340e54ceb542383101e3d21408dfad025df71d770d842
> README
> diff --git a/package/perl-template-toolkit/perl-template-toolkit.mk
> b/package/perl-template-toolkit/perl-template-toolkit.mk
> new file mode 100644
> index 0000000000..820fb5bd8d
> --- /dev/null
> +++ b/package/perl-template-toolkit/perl-template-toolkit.mk
> @@ -0,0 +1,14 @@
> +###########################################################
> #####################
> +#
> +# perl-template-toolkit
> +#
> +###########################################################
> #####################
> +
> +PERL_TEMPLATE_TOOLKIT_VERSION = 2.27
> +PERL_TEMPLATE_TOOLKIT_SOURCE = Template-Toolkit-$(PERL_
> TEMPLATE_TOOLKIT_VERSION).tar.gz
> +PERL_TEMPLATE_TOOLKIT_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AB/ABW
> +PERL_TEMPLATE_TOOLKIT_DEPENDENCIES = host-perl-cgi perl-appconfig
>

In fact, host-perl-cgi could be removed, and the patches 01-02-03/17 become
useless.


> +PERL_TEMPLATE_TOOLKIT_LICENSE = Artistic or GPL-1.0+
> +PERL_TEMPLATE_TOOLKIT_LICENSE_FILES = README
>

With adding :
PERL_TEMPLATE_TOOLKIT_CONF_OPTS += TT_XS_ENABLE=n

The module becomes pure perl, so you could remove the BR2_STATIC_LIBS stuff
in the Config.in

Fran?ois

+
> +$(eval $(perl-package))
> --
> 2.14.4
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180812/6a6b0b09/attachment.html>
