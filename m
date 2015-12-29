From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 20:42:13 +0100
Subject: [Buildroot] [PATCH] Added uwsgi to packages
In-Reply-To: <CAKR0bvuMyYv62qcYExnPrX9Vjtkx8D+gLmrSodRMDkXvn4-uWg@mail.gmail.com>
References: <CAKR0bvtdwebq-VkZ9+pcVb2KwHZvJ_AVb4sydQYvjgPndQRTJQ@mail.gmail.com>
 <20151229183218.23fac6c1@free-electrons.com>
 <CAKR0bvuMyYv62qcYExnPrX9Vjtkx8D+gLmrSodRMDkXvn4-uWg@mail.gmail.com>
Message-ID: <20151229204213.69aae4fc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrea,

On Tue, 29 Dec 2015 19:20:02 +0100, Andrea Cappelli wrote:

> > Thanks. However, you posted your patch as an attachment, which is quite
> > impractical to review. Could you send it inline, by using the "git
> > send-email" tool, as explained in the Buildroot documentation at
> > https://buildroot.org/downloads/manual/manual.html#submitting-patches ?
> 
> Ok, i'll configure git with my smtp account

Great, thanks!

> > This patch and the second patch should be merged, they really are the
> > same thing.
> 
> I split in 2 separate patch because I read somewhere that each patch should
> refer only to a single source file (but maybe this was a rule chosen in a
> specific project, I assumed that was a common practice)

I don't know which project has this rule, but it seems like a silly
rule. Instead, modifications should be separated into different patches
by "logical changes". See
http://lxr.free-electrons.com/source/Documentation/SubmittingPatches#L201.

> > You run on the build machine a command installed in STAGING_DIR.
> > Doesn't look good. Can you explain what you're trying to do here?
> >
> >
> uwsgi was available on PyPi (pypi.python.org) as package, you can download
> and recompile it. The build system is created with a setup.py which in turn
> invoke some function inside uwsgiconfig.py

Right. But you can also use the Makefile, which also invokes
uwsgiconfig.py.

> One of the function use the os.system command to invoke external tools,
> among which are pcre-config and xml2-config, which are used to get path to
> be passed to the compiler
> 
> The problem is that instead of using the buildroot ones (which I found on
> STAGING_DIR/usr/bin) the ones from PATH are chosen, which leads to cross
> compilation error (/urs/lib of host was not good for the purpose)
> 
> I asked in the ML of the project if someone has built for buildroot and
> found an old thread in which a guy had success with a dirty hack: he
> changed each call pcre-config using an absolute path to buildroot ones
> 
> The project maintainer said that the right way was to add an ENV var which
> tells to build system a cross compiling is in place and so adjust path
> accordingly
> 
> I can't simply add STAGING_DIR to path because if I do so other tools get
> chosen from buildroot instead of host, so having the opposite problem

Absolutely. In this case, what I'd prefer to see if to have two
environment variables called PCRE_CONFIG and XML2_CONFIG, which allow
to override the path to the pcre-config and xml2-config binaries.

Note that there is an on-going discussion in the Buildroot project to
find a better mechanism to handle such *-config scripts, and make sure
they are naturally available in the PATH when building target packages.
However, this discussion has not matured yet, so we cannot count on
that right now.

> > Also, why do you depend on python here?
> 
> 
> Because python is required for building and I read in manual to do so

As you say: "python is required for building". So you need host-python,
i.e python installed on the build machine. But most likely not python
on the target, *except* if you intend to use uwsgi for Python
applications. Apparently, uwsgi is mainly a C library, no ?

> "In their Config.in file, they should depend on BR2_PACKAGE_PYTHON so that
> when Buildroot will enable Python 3 usage
> for modules, we will be able to enable Python modules progressively on
> Python 3."

Right, for packages that need Python on the target.

> > You could also use the Makefile, to not use the python-package
> > infrastructure, and therefore not make this package depend on python
> > being available for the target.
> 
> I usually install it using pip in a virtualenv (which i can't do on
> buildoroot due to lack of gcc on target), I didn't compile it directly, so
> using python-package seems to me the simplest way to accomplish the same
> task
> 
> I can try to change this if it's problem

I don't really like the fact that it's a python-package if really it
isn't one. Can you try making it a generic-package, with
<pkg>_BUILD_CMDS calling $(MAKE) -C $(@D), and adding host-python to
the <pkg>_DEPENDENCIES variable ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
