From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 15 Jan 2009 21:11:51 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/python
In-Reply-To: <20090115140106.GA8086@cloud.net.au>
References: <20090115062806.91B6E76850@busybox.osuosl.org>
	<877i4x9cai.fsf@macbook.be.48ers.dk>
	<20090115140106.GA8086@cloud.net.au>
Message-ID: <1232050311.4757.17.camel@aeglos.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fre 2009-01-16 klockan 01:01 +1100 skrev Hamish Moffatt:
> On Thu, Jan 15, 2009 at 09:57:41AM +0100, Peter Korsgaard wrote:
> > >>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> > 
> >  ulf> Author: ulf
> >  ulf> Date: 2009-01-15 06:28:05 +0000 (Thu, 15 Jan 2009)
> >  ulf> New Revision: 24852
> > 
> >  ulf> Log:
> >  ulf> Always create shared python library, if python is created, needed by multiple packages
> > 
> >  ulf> +$(STAGING_DIR)/usr/lib/libpython$(PYTHON_VERSION_MAJOR).so: $(TARGET_DIR)/$(PYTHON_TARGET_BINARY)
> >  ulf> +		cp -dpr $(PYTHON_DIR)/libpython*.so.* $(STAGING_DIR)/usr/lib
> >  ulf> +		(\
> >  ulf> +		cd $(STAGING_DIR)/usr/lib ; \
> >  ulf> +		rm -f libpython$(PYTHON_VERSION_MAJOR).so ; \
> >  ulf> +		ln -s `basename  \`ls libpython*.so.*\`` libpython$(PYTHON_VERSION_MAJOR).so \
> >  ulf> +		)
> > 
> > What are you trying to do here?

Adding libpython, which is required by alsa-lib and all packages 
depending on alsa-lib.
There are some more, but guess it is OK to change it
so you can build python without libpython.

The alsa-lib has to depend on libpython  and libpython
has to depend on python.

I think there were a few other packages that depended on -lpython2.4 as
well so they will rebreak, but I guess that can be fixed
within a week.

BR
Ulf Samuelsson

> I'd like to know why libpython is needed, or at least why it's not a
> separate configuration option. 
> 
> It's not needed to run python, only to embed it in other applications -
> the main python binary (/usr/bin/python2.x) doesn't even link to it.


> I use Python extensively in my buildroot-based embedded system, and I
> don't need libpython bloating my image.
> 
> Hamish
