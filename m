From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Dec 2013 19:27:23 +0100
Subject: [Buildroot] [PATCH] package/python-pycrypto: fix legal-info
In-Reply-To: <20131223182115.GD4435@tarshish>
References: <1387820388-30587-1-git-send-email-yann.morin.1998@free.fr>
 <20131223182115.GD4435@tarshish>
Message-ID: <20131223182723.GB3663@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2013-12-23 20:21 +0200, Baruch Siach spake thusly:
> Hi Yann,
> 
> On Mon, Dec 23, 2013 at 06:39:48PM +0100, Yann E. MORIN wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > The pycrypto package contains a LICENSE.orig file, but apply-patches.sh
> > removes all .orig file, so we can't list a .orig file asa license file,
> 
> as a

Indeed! ;-)

> > as it would have disapeared by the time 'make legal-info' sould be called.
> > 
> > Add a post-extract hook that renames this license file, so it is renamed
> > just before we apply patches and remove .orig files.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Ryan Barnett <rjbarnet@rockwellcollins.com>
> > ---
> >  package/python-pycrypto/python-pycrypto.mk | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> > 
> > diff --git a/package/python-pycrypto/python-pycrypto.mk b/package/python-pycrypto/python-pycrypto.mk
> > index eda48bd..f872ccc 100644
> > --- a/package/python-pycrypto/python-pycrypto.mk
> > +++ b/package/python-pycrypto/python-pycrypto.mk
> > @@ -11,7 +11,17 @@ PYTHON_PYCRYPTO_SETUP_TYPE = distutils
> >  
> >  PYTHON_PYCRYPTO_LICENSE = Public Domain, Python 2.2 License (HMAC.py, setup.py)
> >  PYTHON_PYCRYPTO_LICENSE_FILES = COPYRIGHT LEGAL/copy/LICENSE.libtom \
> > -		LEGAL/copy/LICENSE.orig LEGAL/copy/LICENSE.python-2.2
> > +		LEGAL/copy/LICENSE.python-2.2
> 
> You remove LICENSE.orig from the list, but don't add LICENSE.original.

Yes I do. See below...

> > +
> > +# The pycrypto package contains a LICENSE.orig file, but our patching
> > +# infrastrucure removes all .orig file, so we must rename that license
> > +# file prior to patching, so it is still available to the legal-info
> > +# infrastructure
> > +define PYTHON_PYCRYPTO_RENAME_LICENSE
> > +	mv $(@D)/LEGAL/copy/LICENSE.orig $(@D)/LEGAL/copy/LICENSE.original
> > +endef
> > +PYTHON_PYCRYPTO_POST_EXTRACT_HOOKS += PYTHON_PYCRYPTO_RENAME_LICENSE
> > +PYTHON_PYCRYPTO_LICENSE_FILES += LEGAL/copy/LICENSE.original
                                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
... here.

I did explicitly moved it down so it is obvious the license file we
install is the one we renamed.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
