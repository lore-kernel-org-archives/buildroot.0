From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 Apr 2020 22:27:26 +0200
Subject: [Buildroot] [PATCH 1/3] package/mbedtls: add
 BR2_PACKAGE_MBEDTLS_X509_UNSUPPORTED_CRITICAL_EXTENSION
In-Reply-To: <20200423220905.06d9dc59@windsurf.home>
References: <20200422192059.790299-1-fontaine.fabrice@gmail.com>
 <20200423220905.06d9dc59@windsurf.home>
Message-ID: <20200423202726.GR5035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-04-23 22:09 +0200, Thomas Petazzoni spake thusly:
> On Wed, 22 Apr 2020 21:20:57 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> 
> > Add an option to enable
> > MBEDTLS_X509_ALLOW_UNSUPPORTED_CRITICAL_EXTENSION
> > 
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/mbedtls/Config.in  | 10 ++++++++++
> >  package/mbedtls/mbedtls.mk |  8 ++++++++
> >  2 files changed, 18 insertions(+)
> > 
> > diff --git a/package/mbedtls/Config.in b/package/mbedtls/Config.in
> > index a39ba65d98..e48f0473b0 100644
> > --- a/package/mbedtls/Config.in
> > +++ b/package/mbedtls/Config.in
> > @@ -29,4 +29,14 @@ config BR2_PACKAGE_MBEDTLS_COMPRESSION
> >  	  sure CRIME and similar attacks are not applicable to your
> >  	  particular situation.
> >  
> > +config BR2_PACKAGE_MBEDTLS_X509_UNSUPPORTED_CRITICAL_EXTENSION
> > +	bool "allow X509 unsupported critical extension"
> > +	help
> > +	  If set, the X509 parser will not break-off when parsing an
> > +	  X509 certificate and encountering an unknown critical
> > +	  extension.
> > +
> > +	  Warning: Depending on your PKI use, enabling this can be a
> > +	  security risk!
> > +
> >  endif
> 
> This whole series is pretty awkward. Shouldn't we instead simply not
> allow the use of uacme mbedtls crypto backend ?
> 
> What is this X509_UNSUPPORTED_CRITICAL_EXTENSION functionality that is
> so weird that it requires patching the mbedtls config.h file ? Why is
> uacme absolutely requiring this functionality that no other user of
> mbedtls requires ?

Patching mbedtls is the way to configure it; we already do it to enable
threaads or use of zlib, or to disable asm.

That being said, I also have some concerns about this stuff.

For example, uacme is currently broken with mbedtls, so it was not
runtime tested.

Second, patch 2 does not fix the problem, which is only fixed with patch
3. Semantically, the last two patches should be reversed: first fix the
problem (use of X.509 extension), then add a feature (choice of
backend).

Third, uacme should not depend on the X.509 option, but should select
it.

Regards,
Yann E. MORIN.

> Until these questions are answered, I'd prefer to drop support for
> mbedtls as a crypto backend for uacme.
> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
