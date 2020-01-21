From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 21 Jan 2020 18:49:36 +0100
Subject: [Buildroot] [PATCH 1/1] perl: Add option to enable threads
In-Reply-To: <20200121140951.180608-1-clayton.shotwell@rockwellcollins.com>
References: <20200121140951.180608-1-clayton.shotwell@rockwellcollins.com>
Message-ID: <CAB0FRstBsKSNsbZA=YYBGUxY1mUKai7bxDFcTqWWWPzni==wjA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mar. 21 janv. 2020 ? 15:31, Clayton Shotwell <
clayton.shotwell@rockwellcollins.com> a ?crit :

> From: Hector Kesari <hector.kesari@rockwellcollins.com>
>
> Add config option for PERL to enable threads usage.
>
> Signed-off-by: Hector Kesari <hector.kesari@rockwellcollins.com>
> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> ---
>  package/perl/Config.in | 9 +++++++++
>  package/perl/perl.mk   | 4 ++++
>  2 files changed, 13 insertions(+)
>
> diff --git a/package/perl/Config.in b/package/perl/Config.in
> index 32a3fd2ee9..7bd644a85d 100644
> --- a/package/perl/Config.in
> +++ b/package/perl/Config.in
> @@ -24,4 +24,13 @@ config BR2_PACKAGE_PERL_MODULES
>           Leave empty for all modules (as far as the external libraries
>           are available).
>
> +config BR2_PACKAGE_PERL_ENABLE_THREADS
> +       bool "Support for Threads in PERL"
>

The correct spelling is "Perl", not "PERL".


> +       depends on BR2_TOOLCHAIN_HAS_THREADS
> +       help
> +         Enable use of threads in PERL scripts
>

Same, the correct spelling is "Perl".


> +
> +comment "Perl threads need toolchain w/ threads"
> +       depends on !BR2_TOOLCHAIN_HAS_THREADS
> +
>

WARNING: The use of interpreter-based threads in perl is officially
discouraged <https://perldoc.perl.org/perlpolicy.html#discouraged>.
see https://perldoc.perl.org/threads.html#WARNING

So, I think that this warning must appear in the help of this new option.

Fran?ois


>  endif
> diff --git a/package/perl/perl.mk b/package/perl/perl.mk
> index 0ab81ddb34..e0bbf9cfd4 100644
> --- a/package/perl/perl.mk
> +++ b/package/perl/perl.mk
> @@ -62,6 +62,10 @@ ifeq ($(shell expr $(PERL_VERSION_MAJOR) % 2), 1)
>  PERL_CONF_OPTS += -Dusedevel
>  endif
>
> +ifeq ($(BR2_PACKAGE_PERL_ENABLE_THREADS),y)
> +PERL_CONF_OPTS += -Dusethreads
> +endif
> +
>  ifeq ($(BR2_STATIC_LIBS),y)
>  PERL_CONF_OPTS += --all-static --no-dynaloader
>  endif
> --
> 2.23.0
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200121/4638b7c7/attachment.html>
