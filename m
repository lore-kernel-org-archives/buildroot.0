From: Andrea Cappelli <a.cappelli@gmail.com>
Date: Tue, 29 Dec 2015 19:20:02 +0100
Subject: [Buildroot] [PATCH] Added uwsgi to packages
In-Reply-To: <20151229183218.23fac6c1@free-electrons.com>
References: <CAKR0bvtdwebq-VkZ9+pcVb2KwHZvJ_AVb4sydQYvjgPndQRTJQ@mail.gmail.com>
 <20151229183218.23fac6c1@free-electrons.com>
Message-ID: <CAKR0bvuMyYv62qcYExnPrX9Vjtkx8D+gLmrSodRMDkXvn4-uWg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-12-29 18:32 GMT+01:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Dear Andrea Cappelli,
>
>
Hi Thomas



> Thanks. However, you posted your patch as an attachment, which is quite
> impractical to review. Could you send it inline, by using the "git
> send-email" tool, as explained in the Buildroot documentation at
> https://buildroot.org/downloads/manual/manual.html#submitting-patches ?
>

Ok, i'll configure git with my smtp account



>
> [...]
>
> This patch and the second patch should be merged, they really are the
> same thing.
>

I split in 2 separate patch because I read somewhere that each patch should
refer only to a single source file (but maybe this was a rule chosen in a
specific project, I assumed that was a common practice)



>
> [...]
> You run on the build machine a command installed in STAGING_DIR.
> Doesn't look good. Can you explain what you're trying to do here?
>
>
uwsgi was available on PyPi (pypi.python.org) as package, you can download
and recompile it. The build system is created with a setup.py which in turn
invoke some function inside uwsgiconfig.py

One of the function use the os.system command to invoke external tools,
among which are pcre-config and xml2-config, which are used to get path to
be passed to the compiler

The problem is that instead of using the buildroot ones (which I found on
STAGING_DIR/usr/bin) the ones from PATH are chosen, which leads to cross
compilation error (/urs/lib of host was not good for the purpose)

I asked in the ML of the project if someone has built for buildroot and
found an old thread in which a guy had success with a dirty hack: he
changed each call pcre-config using an absolute path to buildroot ones

The project maintainer said that the right way was to add an ENV var which
tells to build system a cross compiling is in place and so adjust path
accordingly

I can't simply add STAGING_DIR to path because if I do so other tools get
chosen from buildroot instead of host, so having the opposite problem



> > +
> > +     if p.wait() == 0:
> > +
> > diff --git
> a/package/uwsgi/0002-Added-environment-variable-to-support-cross-compilation.patch
> b/package/uwsgi/0002-Added-environment-variable-to-support-cross-compilation.patch
> > new file mode 100644
> > index 0000000..6230132
> > --- /dev/null
> > +++
> b/package/uwsgi/0002-Added-environment-variable-to-support-cross-compilation.patch
> > @@ -0,0 +1,33 @@
> > +Added environment variable to support cross-compilation (2)
> > +
> > +diff --git a/plugins/python/uwsgiplugin.py
> b/plugins/python/uwsgiplugin.py
> > +index f9b4ddb..c5d3e2b 100644
> > +--- a/plugins/python/uwsgiplugin.py
> > ++++ b/plugins/python/uwsgiplugin.py
> > +@@ -51,11 +51,21 @@ if not 'UWSGI_PYTHON_NOLIB' in os.environ:
> > +             LIBS.append('-lutil')
> > +     else:
> > +         try:
> > +-            LDFLAGS.append("-L%s" % sysconfig.get_config_var('LIBDIR'))
> > +-            os.environ['LD_RUN_PATH'] = "%s" %
> (sysconfig.get_config_var('LIBDIR'))
>
> Hum, I don't remember if our sysconfig is not supposed to return
> correct values, provided the appropriate _python_sysroot environment
> variable is defined. But I'm not sure anymore, this it would be worth
> checking.
>


Before sending the patch I created an image for a project I'm working on,
building from scratch (a fresh clone of 2015.11.1), in my environment this
setup is working well




> I think UWSGI_CROSS_COMPILE is not the best choice. Something like
> 'SYSROOT' would be better for example. CROSS_COMPILE variables
> typically point to the cross-compilation tools, which is not what
> you're doing here.
>

Uhm, ok



>
> > ++            LDFLAGS.append("-L%s" % path_)
> > ++            os.environ['LD_RUN_PATH'] = path_
> > +         except:
> > +-            LDFLAGS.append("-L%s/lib" % sysconfig.PREFIX)
> > +-            os.environ['LD_RUN_PATH'] = "%s/lib" % sysconfig.PREFIX
> > ++            if not 'UWSGI_CROSS_COMPILE' in os.environ:
> > ++                path_ = "%s/lib" % sysconfig.PREFIX
> > ++            else:
> > ++                path_ = os.path.join(os.environ['UWSGI_CROSS_COMPILE'],
> > ++                                            'usr', 'lib')
> > ++            LDFLAGS.append("-L%s" % path_)
> > ++            os.environ['LD_RUN_PATH'] = path_
>
> Adding directories pointing to cross-compiled libraries in LD_RUN_PATH
> seems wrong. LD_RUN_PATH will be used by the dynamic linker on your
> build machine... so it will not do anything good if pointed to
> cross-compiled libraries.
>
> > +
> > +         LIBS.append('-lpython%s' % get_python_version())
> > + else:
> > +
> > diff --git a/package/uwsgi/Config.in b/package/uwsgi/Config.in
> > new file mode 100644
> > index 0000000..bdeb60b
> > --- /dev/null
> > +++ b/package/uwsgi/Config.in
> > @@ -0,0 +1,8 @@
> > +config BR2_PACKAGE_UWSGI
> > +     bool "uwsgi"
> > +        depends on BR2_PACKAGE_PYTHON
>
> Indentation should be done via a tab.
>
> Also, why do you depend on python here?


Because python is required for building and I read in manual to do so

"In their Config.in file, they should depend on BR2_PACKAGE_PYTHON so that
when Buildroot will enable Python 3 usage
for modules, we will be able to enable Python modules progressively on
Python 3."

17.8.2

But maybe I didn't understand well



> You could also use the Makefile, to not use the python-package
> infrastructure, and therefore not make this package depend on python
> being available for the target.
>

I usually install it using pip in a virtualenv (which i can't do on
buildoroot due to lack of gcc on target), I didn't compile it directly, so
using python-package seems to me the simplest way to accomplish the same
task

I can try to change this if it's problem

Best regards

-- 
Andrea Cappelli
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151229/6d4f61d7/attachment.html>
