From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 16 Jan 2009 07:45:52 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/python
In-Reply-To: <20090115231004.GE12961@cloud.net.au>
References: <20090115062806.91B6E76850@busybox.osuosl.org>
	<877i4x9cai.fsf@macbook.be.48ers.dk>
	<20090115140106.GA8086@cloud.net.au>
	<1232050311.4757.17.camel@aeglos.sweden.atmel.com>
	<20090115231004.GE12961@cloud.net.au>
Message-ID: <1232088352.8094.8.camel@aeglos.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fre 2009-01-16 klockan 10:10 +1100 skrev Hamish Moffatt:
> On Thu, Jan 15, 2009 at 09:11:51PM +0100, Ulf Samuelsson wrote:
> > fre 2009-01-16 klockan 01:01 +1100 skrev Hamish Moffatt:
> > > On Thu, Jan 15, 2009 at 09:57:41AM +0100, Peter Korsgaard wrote:
> > > > >>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> > > > 
> > > >  ulf> Author: ulf
> > > >  ulf> Date: 2009-01-15 06:28:05 +0000 (Thu, 15 Jan 2009)
> > > >  ulf> New Revision: 24852
> > > > 
> > > >  ulf> Log:
> > > >  ulf> Always create shared python library, if python is created, needed by multiple packages
> > > > 
> > > >  ulf> +$(STAGING_DIR)/usr/lib/libpython$(PYTHON_VERSION_MAJOR).so: $(TARGET_DIR)/$(PYTHON_TARGET_BINARY)
> > > >  ulf> +		cp -dpr $(PYTHON_DIR)/libpython*.so.* $(STAGING_DIR)/usr/lib
> > > >  ulf> +		(\
> > > >  ulf> +		cd $(STAGING_DIR)/usr/lib ; \
> > > >  ulf> +		rm -f libpython$(PYTHON_VERSION_MAJOR).so ; \
> > > >  ulf> +		ln -s `basename  \`ls libpython*.so.*\`` libpython$(PYTHON_VERSION_MAJOR).so \
> > > >  ulf> +		)
> > > > 
> > > > What are you trying to do here?
> > 
> > Adding libpython, which is required by alsa-lib and all packages 
> > depending on alsa-lib.
> > There are some more, but guess it is OK to change it
> > so you can build python without libpython.
> > 
> > The alsa-lib has to depend on libpython  and libpython
> > has to depend on python.
> 
> Really? The Debian package of alsa-lib (libasound2) doesn't depend on
> libpython.
> 

If you configure alsa-lib to use python then it is linked
with -lpython2.4 in buildroot, so libpython seems neccessary.

If you configure alsa-lib without python support, then it is 
not neccessary.

If python is built by Buildroot, then alsa-lib configure will detect
this, and try to link with -lpythonX.X which would fail
since it would try -lpython2.5 and Buildroot uses python 2.4.5.

Maybe it is possible to build python but configure
alsa-lib to not use it. Have not tested that.

I have as mentioned before, added the fix to my tree, but
the PC halted early in the build last night, so it is not tested yet.
Will commit, as soon as it seems to work OK.


BR
Ulf Samuelsson.


> I can imagine ALSA producing a python module, but that won't require
> libpython at runtime.
> 
> Hamish
-- 
Ulf Samuelsson <ulf.samuelsson@atmel.com>
Atmel Nordic AB
