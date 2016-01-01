From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 Jan 2016 23:49:14 +0100
Subject: [Buildroot] [PATCH] python-can: bump to 1.4.1
In-Reply-To: <20160101222835.GD2182@free.fr>
References: <1451686709-25501-1-git-send-email-yegorslists@googlemail.com>
 <20160101222835.GD2182@free.fr>
Message-ID: <20160101224914.GE2182@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor, All,

On 2016-01-01 23:28 +0100, Yann E. MORIN spake thusly:
> On 2016-01-01 23:18 +0100, Yegor Yefremov spake thusly:
> > Add hash file and change download location to PyPi.
> 
> Why did you change the location?
> 
> I think we want to use upstream locations as much as possible, and only
> fallback to alternative locations when there is no upstream, or upstream
> is flaky.

OK, I think I know why you wanted to download from PyPi: the current
package we have will download an archive named ae5b6cf.tar.gz without
the name of the package.

That's because Bitbucket provides snapshots as such.

Also, there is not 'tag' per-se in the repository; upstream only
updates the version in the setup.py script.

I don't think it is bad to use a hash when there is no human-readable
version tagged. But we are currently using the short hash, when we
require the full hash.

So, I'd suggest we fix it by using the Hg download method:

    PYTHON_CAN_VERSION = 4085cffd2519f0ce21779e26b5c43ce8c007e9aa
    PYHTON_CAN_SITE = https://bitbucket.org/hardbyte/python-can
    PYHTON_CAN_SITE_METHOD = hg

Then we have tarballs properly named with the package name and the full
hash.

Care to update and respin, please? Thanks!

Regards,
Yann E. MORIN.

> Regards,
> Yann E. MORIN.
> 
> > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> > ---
> >  package/python-can/python-can.hash | 3 +++
> >  package/python-can/python-can.mk   | 5 ++---
> >  2 files changed, 5 insertions(+), 3 deletions(-)
> >  create mode 100644 package/python-can/python-can.hash
> > 
> > diff --git a/package/python-can/python-can.hash b/package/python-can/python-can.hash
> > new file mode 100644
> > index 0000000..fc9fc2a
> > --- /dev/null
> > +++ b/package/python-can/python-can.hash
> > @@ -0,0 +1,3 @@
> > +# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=63e922ae913bb0db1dd54e9189810130, sha256 locally computed
> > +md5     63e922ae913bb0db1dd54e9189810130  python-can-1.4.1.tar.gz
> > +sha256  ab60195d112504fc4d38b74fb4a6874cd509066472b9d6d3516a8ce1485cec6f  python-can-1.4.1.tar.gz
> > diff --git a/package/python-can/python-can.mk b/package/python-can/python-can.mk
> > index c7b06a5..9a9d9df 100644
> > --- a/package/python-can/python-can.mk
> > +++ b/package/python-can/python-can.mk
> > @@ -4,9 +4,8 @@
> >  #
> >  ################################################################################
> >  
> > -PYTHON_CAN_VERSION = ae5b6cf
> > -PYTHON_CAN_SITE = https://bitbucket.org/hardbyte/python-can/get
> > -PYTHON_CAN_SOURCE = $(PYTHON_CAN_VERSION).tar.bz2
> > +PYTHON_CAN_VERSION = 1.4.1
> > +PYTHON_CAN_SITE = https://pypi.python.org/packages/source/p/python-can
> >  PYTHON_CAN_LICENSE = LGPLv3
> >  PYTHON_CAN_LICENSE_FILES = LICENSE.txt
> >  PYTHON_CAN_SETUP_TYPE = setuptools
> > -- 
> > 2.1.4
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
