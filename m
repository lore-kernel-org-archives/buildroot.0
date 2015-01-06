From: Williams Jr., Ernest L. <ernesto@slac.stanford.edu>
Date: Tue, 6 Jan 2015 15:39:47 +0000
Subject: [Buildroot] Need iconv(): fatal error: iconv.h: No such file or
 directory
In-Reply-To: <20150106092836.134b13fb@free-electrons.com>
References: <3f160793d89243dd860bee8dd5e7acc4@exch13-mail05.win.slac.stanford.edu>,
 <20150106092836.134b13fb@free-electrons.com>
Message-ID: <a137651a680a46959923e90be1485e87@exch13-mail05.win.slac.stanford.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

In this case my package/application is external to buildroot.

I have set the following  in my  ".config"   using  make xconfig:
BR2_TOOLCHAIN_BUILDROOT_LOCALE

Like so,
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y

After typing make, I expect to see  "iconv.h"  in ${STAGING_DIR}/usr/include
But it is not, there.  :(

Must, I rebuild everything from scratch ?

Cheers,
Ernest
________________________________________
From: Thomas Petazzoni [thomas.petazzoni at free-electrons.com]
Sent: Tuesday, January 6, 2015 12:28 AM
To: Williams Jr., Ernest L.
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] Need iconv(): fatal error: iconv.h: No such file or directory

Dear Williams Jr., Ernest L.,

On Tue, 6 Jan 2015 06:17:26 +0000, Williams Jr., Ernest L. wrote:

> I am working with a package that needs  iconv()
>
> How can I get this in buildroot?
>
> Here is my error:
> fatal error: iconv.h: No such file or directory

iconv is either provided by your toolchain (if it has locale support),
or by libiconv. So, your package should do in its Config.in file:

        select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE

and in the .mk file:

ifeq ($(BR2_PACKAGE_LIBICONV),y)
<pkg>_DEPENDENCIES += libiconv
endif

Best regards,

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
