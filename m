From: Rohan Fletcher <rohfledev@gmail.com>
Date: Mon, 15 Jul 2013 13:29:40 +1200
Subject: [Buildroot] [PATCH 1/2] python-pip: new package,
 update python-setuptools, enable openssl for host python
In-Reply-To: <20130713162401.118bf121@skate>
References: <1373707158-31756-1-git-send-email-rohfledev@gmail.com>
 <20130713162401.118bf121@skate>
Message-ID: <CABa1b9RhJ2_xeystPgRZxYyVYc9vOKwUbk+oyaiVCH5kmVtUtA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Thanks for your contribution! A few comments below, to help improve
> your patches and make them ready for merging in Buildroot.


You are welcome. Ok, I will make changes to the patches based upon your
comments and submit again. This is the first time I have submitted anything
to an open source project.


Don't certain pip modules have native dependencies, that should be
> handled? Like a Python module that uses a separate native library?
>

Yes some python modules have native dependencies - pip does not
automatically select and compile the dependencies in buildroot - they need
to be preselected.

For instance, the python-lxml module requires the libxml2 and libxslt
libraries. When these libraries have been preselected in buildroot, the
python-lxml module will successfully compile and install to the target.

So far I have installed gevent, gevent-socketio, flask, jinja2, psutil,
daemon, passlib, requests, werkzeug, pillow, and feedparser successfully on
the target using this method.

I have conducted basic tests of the installed modules on the target python
interpreter, with mostly success.

There are tiny issues I am coming across installing modules that require
libraries with pip:
 - Pillow (a fork of Python Image Library) won't compile with jpeg support
because it expects libjpeg headers to be located at /usr/include instead of
$BASE_DIR/output/staging/usr/include.
 - The python-magic package can't find libmagic because it relies on
ldconfig cache output to find the library.
 - The requests package gives an error
SSL3_GET_SERVER_CERTIFICATE:certificate verify failed, even though I can
connect fine to the same website using httplib. Still investigating this
one.
 - The lxml package must be able to find xslt-config on $PATH.

Some of these python modules that compile against libraries might need to
be made into a buildroot package with patches to work 100%. However, pip
will cover the rest.


Generally, we don't really like this kind of package that builds other
> packages, because it completely breaks the download and license
> infrastructure of Buildroot. But maybe for languages like Python, Perl
> and Ruby, it makes sense to have support for those things, even if it's
> not perfect.
>

I can understand that. Its definitely a package addition that will bend the
rules of the game.

My inspiration for this package is found under nodejs -> module selection
in menuconfig. There is an option to provide a list of additional modules
that will be automatically installed by npm, the nodejs package manager.

The reasoning for adding pip to my setup was:
1. Quick and easy - If I want to add another python module, I can just add
a name to a list in menuconfig and it will be included.
2. Dependency resolution - By using pip, the (python) dependencies of each
python module are automatically retrieved and installed during the build
process.

What are your main concerns about breaking the download infrastructure?

In regards to licensing infrastructure, is it possible to create a script
that downloads the license metadata from https://pypi.python.org/ and makes
it available to "make legal-info"?


> +     # Explanation of environment variables
> > +     # PATH: the staging dir is required here so that xslt-config can
> be found
> > +     #       when trying to install the python lxml package
>


Putting STAGING_DIR in the PATH is really bad. Isn't there a way to
> specifically pass the path to xslt-config?


Yes, I was wrong. The staging bin directory has binaries for the target
platform in it. Oops.

The path modification is now removed. I have tried giving pip an argument
which contained --with-xslt-config (supported by lxml), but other modules I
install at the same time trigger errors because they don't recognise this
option.

Maybe I can create a directory which contains symlinks to only the
"-config" scripts from staging, and then stick that directory of symlinks
on PATH temporarily. I'm not sure where you stand on such a strategy.


> +comment "custom python modules"
> Not sure why we need this comment here. Could you explain?


I'm not sure why either. Comment deleted.


> @@ -31,8 +31,7 @@ HOST_PYTHON_CONF_OPT +=     \
> >       --disable-gdbm          \
> >       --disable-bsddb         \
> >       --disable-test-modules  \
> > -     --disable-bz2           \
> > -     --disable-ssl
> > +     --disable-bz2
> >
> [...]
> >
> > -HOST_PYTHON_DEPENDENCIES = host-expat host-zlib
> > +HOST_PYTHON_DEPENDENCIES = host-expat host-zlib host-openssl
>
> The annoying thing here is that host-python will now *always* trigger
> the build of openssl, which is quite huge, even though in many cases,
> SSL support will not be needed in host-python.


> I guess the only solution is an hidden
> BR2_HOST_PYTHON_NEEDS_SSL_SUPPORT option, which is selected by
> python-pip.
>

I will add a patch for this.


Isn't there a way of installing pip only on the host, use it during the
> build to install other Python modules to the target, but keep pip out
> of the target, since it's generally not used at runtime?
>

From your suggestion, I have removed the installation of pip to the target
with no resulting errors.


 >  define PYTHON_SETUPTOOLS_BUILD_CMDS
> >       (cd $(@D); \
> > -     PYTHONPATH="/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
> > +
> PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"
> \
>
> Gustavo will tell here, but isn't the PYTHONPATH going to leak into the
> target, and therefore contain invalid paths?
>

Ok I have tested this again, and I have found I no longer need to change
the PYTHONPATH in order to get setuptools to work. So these changes have
been reverted as well.


Thanks for the feedback. I will send updated patches through shortly.

Regards,
Rohan Fletcher
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130715/445db96f/attachment-0001.html>
