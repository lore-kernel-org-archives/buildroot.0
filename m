From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 06 Feb 2017 22:55:45 +0100
Subject: [Buildroot] [PATCH] python-gunicorn: fix build issues
In-Reply-To: <20170206193631.12382-1-maxime.hadjinlian@gmail.com> (Maxime
 Hadjinlian's message of "Mon, 6 Feb 2017 20:36:31 +0100")
References: <20170206193631.12382-1-maxime.hadjinlian@gmail.com>
Message-ID: <87inonugpq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > Fix:
 >     http://autobuild.buildroot.org/results/b2d/b2d43dd3c52cc9f586009a10a40f97b07548322d/build-end.log

 > The issue arise from the fact that we compile all *.py files but the
 > _gaiohttp.py file is using Python3 ("yield from") syntax which causes an
 > error.

 > So we are using Python2, delete this file as it won't ever be imported

s/So we/So if we/


> anyway as it is checked by gunicorn in the __init__.py file of the worker
 > module.

 > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > ---
 >  package/python-gunicorn/python-gunicorn.mk | 12 ++++++++++++
 >  1 file changed, 12 insertions(+)

 > diff --git a/package/python-gunicorn/python-gunicorn.mk b/package/python-gunicorn/python-gunicorn.mk
 > index 426e809730..cfb7da110c 100644
 > --- a/package/python-gunicorn/python-gunicorn.mk
 > +++ b/package/python-gunicorn/python-gunicorn.mk
 > @@ -11,4 +11,16 @@ PYTHON_GUNICORN_SETUP_TYPE = setuptools
 >  PYTHON_GUNICORN_LICENSE = MIT
 >  PYTHON_GUNICORN_LICENSE_FILES = LICENSE
 
 > +# At the end of the build, we try to compile all py files using the host python
 > +# that has been built.
 > +# The GAIO HTTP Worker is only compatible with Python3.4.2 and up. So don't try
 > +# to compile it with python 2.x
 > +ifeq ($(BR2_PACKAGE_PYTHON),y)
 > +define PYTHON_GUNICORN_REMOVE_GAIO_WORKER
 > +	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/ \
 > +		-name "_gaiohttp.py" -exec rm -f {} \;
 > +endef

Do we expect this file to move around so we couldn't just use a normal:

   rm -f $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/gunicorn/workers/_gaiohttp.py

But ok, that is a detail. Committed with the commit text tweaked a bit,
thanks.

-- 
Bye, Peter Korsgaard
