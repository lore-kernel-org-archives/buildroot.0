From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 4 Jun 2018 07:30:37 +0200
Subject: [Buildroot] [PATCH 1/1] php-amqp: selects openssl
In-Reply-To: <20180604023205.3lnutkenz44k5hv4@tarshish>
References: <20180603193126.7582-1-fontaine.fabrice@gmail.com>
 <20180604023205.3lnutkenz44k5hv4@tarshish>
Message-ID: <CAPi7W805OOA9thXKA6-o9u-wLDBLAdVkDu_nJ_eX6ps7N=qE7A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch,

2018-06-04 4:32 GMT+02:00 Baruch Siach <baruch@tkos.co.il>:

> Hi Fabrice,
>
> On Sun, Jun 03, 2018 at 09:31:26PM +0200, Fabrice Fontaine wrote:
> > php-amqp needs a rabbitmq-c with openssl support:
> > https://github.com/pdezwart/php-amqp/issues/310
> >
> > Fixes:
> >  - http://autobuild.buildroot.net/results/b7c89bbbd0ca1df08dd7cbfc90c7b4
> 5dcf1fad05
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/php-amqp/Config.in | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/php-amqp/Config.in b/package/php-amqp/Config.in
> > index 0aa2021f5a..cf32ec10b2 100644
> > --- a/package/php-amqp/Config.in
> > +++ b/package/php-amqp/Config.in
> > @@ -1,12 +1,14 @@
> >  config BR2_PACKAGE_PHP_AMQP
> >       bool "php-amqp"
> >       depends on BR2_PACKAGE_PHP
> > +     depends on !BR2_STATIC_LIBS # rabbitmq-c: amqp_ssl_socket.h
>
> Why is this needed? rabbitmq-c does not depend on !BR2_STATIC_LIBS.
>
This is needed because openssl supports in rabbitmq-c has been disabled in
static mode since May 2017: http://patchwork.ozlabs.org/patch/762183.
But perhaps it would be better to make all rabbitmq-c depends on
!BR2_STATIC_LIBS as suggested by Peter back in May 2017.

>
> >       depends on BR2_TOOLCHAIN_HAS_THREADS # rabbitmq-c
> > +     select BR2_PACKAGE_OPENSSL # rabbitmq-c: amqp_ssl_socket.h
> >       select BR2_PACKAGE_RABBITMQ_C
> >       help
> >         Communicate with any AMQP compliant server.
> >
> >         http://pecl.php.net/package/amqp
> >
> > -comment "php-amqp needs a toolchain w/ threads"
> > -     depends on !BR2_TOOLCHAIN_HAS_THREADS
> > +comment "php-amqp needs a toolchain w/ dynamic library, threads"
> > +     depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--
> Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180604/29baad23/attachment.html>
