From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Aug 2017 09:23:46 +0200
Subject: [Buildroot] buildroot uClibc-ng build failure
In-Reply-To: <20170803054828.GB7682@waldemar-brodkorb.de>
References: <20170803054828.GB7682@waldemar-brodkorb.de>
Message-ID: <20170803092346.02d02371@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 3 Aug 2017 07:48:28 +0200, Waldemar Brodkorb wrote:

> we are seeing a build error on your machine when
> locales in uClibc-ng are enabled:
> http://autobuild.buildroot.net/results/d5b/d5ba81eea9223569ba5b363551c4a2f7044ff8ec/
> 
> Can you show us locale -a from your machine?
> 
> For a working tolower(), the uClibc-ng code needs to use setlocale
> on the host.
> 
> But it seems only these are tried to use:
> en_US en_US en_GB

It is worth mentioning that Buildroot is already checking that at least
one UTF-8 locale is available on the host machine, for the needs of
uClibc locale support. From support/dependencies/dependencies.sh:

if grep ^BR2_NEEDS_HOST_UTF8_LOCALE=y $BR2_CONFIG > /dev/null; then
        if ! which locale > /dev/null ; then
                echo
                echo "You need locale support on your build machine to build a toolchain supporting locales"
                exit 1 ;
        fi
        if ! locale -a | grep -q -i utf8$ ; then
                echo
                echo "You need at least one UTF8 locale to build a toolchain supporting locales"
                exit 1 ;
        fi
fi

And the only package selecting BR2_NEEDS_HOST_UTF8_LOCALE is:

package/uclibc/Config.in:       select BR2_NEEDS_HOST_UTF8_LOCALE

Is this check insufficient now ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
