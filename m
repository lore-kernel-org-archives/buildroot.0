From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 11 Sep 2016 00:32:40 +0200
Subject: [Buildroot] [PATCH v3,2/2] php: add apache support
In-Reply-To: <20160910220833.GI5740@free.fr>
References: <1473535035-130056-1-git-send-email-fabrice.fontaine@orange.com>
 <1473535035-130056-2-git-send-email-fabrice.fontaine@orange.com>
 <20160910220833.GI5740@free.fr>
Message-ID: <20160910223240.GJ5740@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2016-09-11 00:08 +0200, Yann E. MORIN spake thusly:
> On 2016-09-10 21:17 +0200, Fabrice Fontaine spake thusly:
> > Continue work started by Bernd Kuhls in
> > https://patchwork.ozlabs.org/patch/437544/
> > 
> > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> > Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
> > ---
> > Changes v2 -> v3 (after review of Thomas Petazzoni):
> >  - Remove unneeded php-04-apache.patch
> >  - Fix pthread detection if Apache MPM is event or worker
> >  - Update pthread detection mechanism (--enable-pthreads does not exist
> >    anymore)
> >  - Remove unneeded --oldincludedir
> >  - Fix php module path
> > 
> >  package/php/Config.in | 17 +++++++++++++++++
> >  package/php/php.mk    | 31 +++++++++++++++++++++++++++++++
> >  2 files changed, 48 insertions(+)
> > 
> > diff --git a/package/php/Config.in b/package/php/Config.in
> > index eee8d26..5f5a976 100644
> > --- a/package/php/Config.in
> > +++ b/package/php/Config.in
> > @@ -9,6 +9,9 @@ config BR2_PACKAGE_PHP
> >  
> >  if BR2_PACKAGE_PHP
> >  
> > +config BR2_PACKAGE_PHP_APACHE
> > +	bool
> > +
> >  config BR2_PACKAGE_PHP_CLI
> >  	bool
> >  
> > @@ -24,6 +27,20 @@ choice
> >  	help
> >  	  Select the PHP interface(s).
> >  
> > +config BR2_PACKAGE_PHP_SAPI_APACHE
> > +	bool "Apache"
> > +	select BR2_PACKAGE_APACHE
> > +	select BR2_PACKAGE_PHP_APACHE
> > +	depends on !BR2_STATIC_LIBS # apache
> > +	depends on BR2_TOOLCHAIN_HAS_THREADS # apache
> > +	depends on BR2_USE_MMU # apr
> 
> "depends on" go before "select", please. Also, I'd prefer the
> architecture dependencies come first (i.e. MMU before threads and
> static).

Furthermore, I think this should not select Apache, but depend on it.

Php is "just" a module for Apache, so I find it a bit excessive that php
would select Apache.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
