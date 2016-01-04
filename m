From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 4 Jan 2016 23:35:44 +0100
Subject: [Buildroot] [PATCH 2/2] python3: bump to 3.5.1
In-Reply-To: <1451931809-24511-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1451931809-24511-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1451931809-24511-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <568AF3C0.2070602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04-01-16 19:23, Thomas Petazzoni wrote:
> The major changes in terms of Buildroot packaging are:
> 
>  - Due to PEP488, Python no longer generates .pyc (unoptimized) and
>    .pyo (optimized) byte-code files. Instead, it generates <foo>.pyc,
>    <foo>.opt-1.pyc and <foo>.opt-2.pyc. Therefore, we removed the
>    --disable-pyo-build option and kept only the --disable-pyc-build
>    option, which completely disables building all .pyc files.

 You forgot to remove the --disable-pyo-build from python3.mk.

 However, I don't understand why it is necessary to do this. It is still
relevant to disable at least some of the compiled versions, otherwise you end up
with three copies on the target... We currently always disable the pyo files so
we should preserve that behaviour (could be improved in a later patch). IMHO of
course :-)

> 
>  - The PEP3147 disabling patch had to be significantly reworked due to
>    the code having changed heavily. The code was moved into a
>    _bootstrap_external.py, which is a "frozen" Python module, i.e a
>    module generated into a .h file at compile time using the
>    _freeze_importlib program.

 Ideally, we should work with upstream to try and find a better solution for
this. The PEP3147 handling is really hacky.

 Actually, are none of our 30 patches upstreamable?

> 
>  - Due to the above, we now need to regenerate importlib.h at build
>    time. Unfortunately, for the target Python _freeze_importlib is
>    built for the target, so we can't run it on the build machine. To
>    fix this, we copy the _freeze_importlib program from the
>    host-python in $(HOST_DIR), and then patch the target python to use
>    it. Since the same solution can be used for 'pgen', we do it, and
>    avoid having to touch the graminit.{c,h} files.

 Elegant solution.

> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> Ultimately, we will want to only keep a certain subset of the .pyc
> files. Ideally, keeping only the <foo>.opt-2.pyc file would be the
> ideal option (to save space). However, you can't remove the <foo>.pyc,
> otherwise the <foo>.opt-2.pyc are not usable anymore. For now, we keep
> all .pyc files.

 -name '*.pyc' -not -name '*.opt-2.pyc'

but as I mentioned the current behaviour is to keep only the non-optimized pyc
so we should keep that.

 I think long term we should have an additional config option to select opt-1 or
opt-2. opt-2 removes the doc strings, and I think there can be use cases where
you really want to keep the doc strings on the target (e.g. they could be used
as help text in an interactive shell).

 The non-optimized pyc is not so relevant IMO, but if you add an option for
opt-1 or opt-2 it's easy to add one for non-optimized as well.

> 
> Note: I'd like to have the review from Christophe Vu-Brugier on this
> patch, especially on the PEP3147 handling, which was changed quite a
> bit in Python 3.5. I did test Christophe use-case of kmod's python
> module, and it does import properly, but double checking would be
> good.
> ---
[snip]
> diff --git a/package/python3/0003-Make-the-build-of-pyc-and-pyo-files-conditional.patch b/package/python3/0003-Make-the-build-of-pyc-and-pyo-files-conditional.patch
> deleted file mode 100644
[snip]
> diff --git a/package/python3/0003-Make-the-build-of-pyc-files-conditional.patch b/package/python3/0003-Make-the-build-of-pyc-files-conditional.patch
> new file mode 100644

 If you post a v2, perhaps add -M40.

[snip]
> diff --git a/package/python3/0005-Add-infrastructure-to-disable-the-build-of-certain-e.patch b/package/python3/0005-Add-infrastructure-to-disable-the-build-of-certain-e.patch
> index 4a32bb1..76a553b 100644
> --- a/package/python3/0005-Add-infrastructure-to-disable-the-build-of-certain-e.patch
> +++ b/package/python3/0005-Add-infrastructure-to-disable-the-build-of-certain-e.patch
> @@ -1,4 +1,4 @@
> -From 9eb1076b61e83647028a2f6b665b6f9afcb793b0 Mon Sep 17 00:00:00 2001
> +From 3a9f4aa255909ed152883eee787313efd20dbc58 Mon Sep 17 00:00:00 2001
>  From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Date: Wed, 23 Dec 2015 11:31:08 +0100
>  Subject: [PATCH] Add infrastructure to disable the build of certain extensions
> @@ -42,10 +42,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>   3 files changed, 11 insertions(+), 2 deletions(-)
>  
>  diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index f1bdd99..e0f9e0f 100644
> +index 272f312..9420860 100644

 It's a pity that git-formatted patches have so much useless churn. Perhaps we
should make a script that uses git log --pretty=format:... and/or greps away the
uninteresting parts to generate a less churny patch.


 Regards,
 Arnout

>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -177,6 +177,8 @@ FILEMODE=	644
> +@@ -182,6 +182,8 @@ FILEMODE=	644
>   # configure script arguments
>   CONFIG_ARGS=	@CONFIG_ARGS@
>   
> @@ -54,7 +54,7 @@ index f1bdd99..e0f9e0f 100644
>   
>   # Subdirectories with code
>   SRCDIRS= 	@SRCDIRS@
> -@@ -574,6 +576,7 @@ sharedmods: $(BUILDPYTHON) pybuilddir.txt
> +@@ -600,6 +602,7 @@ sharedmods: $(BUILDPYTHON) pybuilddir.txt
>   	esac; \
>   	$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
>   		_TCLTK_INCLUDES='$(TCLTK_INCLUDES)' _TCLTK_LIBS='$(TCLTK_LIBS)' \
> @@ -62,7 +62,7 @@ index f1bdd99..e0f9e0f 100644
>   		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build
>   
>   # Build static library
> -@@ -1384,7 +1387,8 @@ libainstall:	all python-config
> +@@ -1425,7 +1428,8 @@ libainstall:	all python-config
>   # Install the dynamically loadable modules
>   # This goes into $(exec_prefix)
>   sharedinstall: sharedmods
> @@ -73,10 +73,10 @@ index f1bdd99..e0f9e0f 100644
>   		--install-scripts=$(BINDIR) \
>   		--install-platlib=$(DESTSHARED) \
>  diff --git a/configure.ac b/configure.ac
> -index 6342b81..a3026b8 100644
> +index c492594..bfb599e 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -2352,6 +2352,8 @@ LIBS="$withval $LIBS"
> +@@ -2588,6 +2588,8 @@ LIBS="$withval $LIBS"
>   
>   PKG_PROG_PKG_CONFIG
>   
> @@ -86,10 +86,10 @@ index 6342b81..a3026b8 100644
>   AC_MSG_CHECKING(for --with-system-expat)
>   AC_ARG_WITH(system_expat,
>  diff --git a/setup.py b/setup.py
> -index d3bf8e5..2a504d2 100644
> +index dbd2a3c..1ebfa50 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -39,7 +39,10 @@ host_platform = get_platform()
> +@@ -44,7 +44,10 @@ host_platform = get_platform()
>   COMPILED_WITH_PYDEBUG = ('--with-pydebug' in sysconfig.get_config_var("CONFIG_ARGS"))
>   
>   # This global variable is used to hold the list of modules to be disabled.
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
