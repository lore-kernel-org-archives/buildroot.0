From: gwenhael.goavec <gwenj@trabucayre.com>
Date: Wed, 15 Apr 2015 20:22:12 +0200
Subject: [Buildroot] [PATCH 1/2] python-sip: new package
In-Reply-To: <552C37EB.3000401@mind.be>
References: <1428937908-17280-1-git-send-email-gwenj@trabucayre.com>
 <20150413225448.3024e28b@free-electrons.com>
 <552C37EB.3000401@mind.be>
Message-ID: <20150415202212.7852e83f@x230.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Apr 2015 23:40:59 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> On 13/04/15 22:54, Thomas Petazzoni wrote:
> > Dear Gwenhael Goavec-Merou,
> > 
> > On Mon, 13 Apr 2015 17:11:47 +0200, Gwenhael Goavec-Merou wrote:
> >> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> >>
> >> Based on http://lists.busybox.net/pipermail/buildroot/2013-October/080830.html
> >>
> >> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
>  You should keep the original author somewhere around, either as author (if your
> changes are just cosmetic), or in Cc (if you completely turned it around).
> 
Ok
>  If you keep the original author, the easist is to fetch the patch from
> patchwork with pwclient:
> 
> pwclient git-am 284873
> 
>  Also don't forget to add v3 and changelog.
> 
Ok
> 
> > 
> > Thanks a lot for refusing the work on this package and python-pyqt!
> 
>  Refusing? I hope reusing :-)
> 
> > Some comments below.
> > 
> >> diff --git a/package/python-sip/0001-configure.patch b/package/python-sip/0001-configure.patch
> >> new file mode 100644
> >> index 0000000..4353bd1
> >> --- /dev/null
> >> +++ b/package/python-sip/0001-configure.patch
> >> @@ -0,0 +1,43 @@
> >> +Add cross compilation options for using satged python
> >> +config, libraries and includes
> >> +
> >> +Signed-off-by Sergey Kostanbaev <sergey.kostanbaev@gamil.com>
> > 
> > The formatting of this patch is a bit weird, with no empty line between
> > SoB and the patch. Also, the SoB e-mail is strange, and is it really
> > gamil.com and not gmail.com ?
> 
>  I guess the at is from cut&paste from the pipermail archive. The gamil was
> wrong in the original patch.
yes
> 
> > 
> > Is there any chance of submitting this patch upstream?
> > 
> >> +====================================================================
> >> +--- a/configure.py	2013-04-24 12:41:35.382000017 +0400
> >> ++++ b/configure.py	2013-04-24 13:09:30.000000000 +0400
> >> +@@ -273,9 +273,9 @@
> >> +         "default_mod_dir":  plat_py_site_dir,
> >> +         "default_sip_dir":  opts.sipsipdir,
> >> +         "py_version":       py_version,
> >> +-        "py_inc_dir":       plat_py_inc_dir,
> >> +-        "py_conf_inc_dir":  plat_py_conf_inc_dir,
> >> +-        "py_lib_dir":       plat_py_lib_dir,
> >> ++        "py_inc_dir":       opts.py_inc_dir,
> >> ++        "py_conf_inc_dir":  opts.py_conf_inc_dir,
> >> ++        "py_lib_dir":       opts.py_lib_dir,
> >> +         "universal":        opts.universal,
> >> +         "arch":             opts.arch,
> >> +         "deployment_target":    opts.deployment_target
> >> +@@ -399,6 +399,22 @@
> >> +             "macros")
> >> +     p.add_option_group(g)
> >> + 
> >> ++    # Python configuration
> >> ++    g = optparse.OptionGroup(p, title="Python include path")
> >> ++    g.add_option("-i", "--py_inc_dir", action="callback",
> >> ++	    default=plat_py_inc_dir, type="string", metavar="DIR",
> >> ++	    dest="py_inc_dir", callback=store_abspath, help="where the Python "
> >> ++	    "include directory located [default: %s]" % plat_py_inc_dir)
> 
>  missing verb in help text, probably should be "where the Python include
> directory is located"
> 
> >> ++    g.add_option("-c", "--py_conf_inc_dir", action="callback",
> >> ++	    default=plat_py_conf_inc_dir, type="string", metavar="DIR",
> >> ++	    dest="py_conf_inc_dir", callback=store_abspath, help="where the Python "
> >> ++	    "Configuration include directory located [default: %s]" % plat_py_conf_inc_dir)
> 
>  Same here.
> 
> >> ++    g.add_option("-l", "--py_lib_dir", action="callback",
> >> ++	    default=plat_py_conf_inc_dir, type="string", metavar="DIR",
> >> ++	    dest="py_lib_dir", callback=store_abspath, help="where the Python "
> >> ++	    "library located [default: %s]" % plat_py_lib_dir)
> 
>  Same here.
> 
> >> ++
> >> ++
> >> +     # Installation.
> >> +     g = optparse.OptionGroup(p, title="Installation")
> >> +     g.add_option("-b", "--bindir", action="callback",
> >> \ No newline at end of file
> 
>  That's weird... the original patch didn't have this missing newline.
> 
This patch is no more needed.
> >> diff --git a/package/python-sip/Config.in b/package/python-sip/Config.in
> >> new file mode 100644
> >> index 0000000..fdbf7c2
> >> --- /dev/null
> >> +++ b/package/python-sip/Config.in
> >> @@ -0,0 +1,11 @@
> >> +comment "python-sip needs a toolchain w/ C++"
> >> +	depends on !BR2_INSTALL_LIBSTDCPP
> >> +
> >> +config BR2_PACKAGE_PYTHON_SIP
> >> +	bool "python-sip"
> >> +	depends on BR2_INSTALL_LIBSTDCPP
> > 
> > Is it Python 2 *and* Python 3 compatible?
> > 
> >> +	help
> >> +	  SIP is a tool for C/C++ libraries binding. It was developed
> >> +	  to create PyQt
> >> +
> >> +	  http://www.riverbankcomputing.com/software/sip/intro
> >> diff --git a/package/python-sip/python-sip.hash b/package/python-sip/python-sip.hash
> >> new file mode 100644
> >> index 0000000..c0b2db3
> >> --- /dev/null
> >> +++ b/package/python-sip/python-sip.hash
> >> @@ -0,0 +1,4 @@
> >> +# Locally calculated:
> >> +md5 a63172f744370698a27a3a1cc902ce65 sip-4.16.tar.gz
> >> +
> >> +sha256 d769ce2486bab4cb0b3bea8868153c7e5c27b50ee74fec3329e35ed50a346398 sip-4.16.tar.gz
> > 
> > If both are locally calculated, then only the sha256 is needed, you can
> > remove the md5.
> > 
> >> diff --git a/package/python-sip/python-sip.mk b/package/python-sip/python-sip.mk
> >> new file mode 100644
> >> index 0000000..a8051a8
> >> --- /dev/null
> >> +++ b/package/python-sip/python-sip.mk
> >> @@ -0,0 +1,64 @@
> >> +################################################################################
> >> +#
> >> +# python-sip
> >> +#
> >> +################################################################################
> >> +
> >> +PYTHON_SIP_VERSION = 4.16
> 
>  4.16 is almost a year old, 4.16.7 has been released a couple of weeks ago...
> 
Yes. Done for the next version
> >> +PYTHON_SIP_SOURCE = sip-$(PYTHON_SIP_VERSION).tar.gz
> 
>  This is the default so not needed.
> 
Without this buildroot try to download python-sip-xxx.tar.gz instead of
sip-xxx.tar.gz
> >> +PYTHON_SIP_SITE = http://downloads.sourceforge.net/project/pyqt/sip/sip-$(PYTHON_SIP_VERSION)
> >> +PYTHON_SIP_LICENSE = SIP, GPLv2, GPLv3
> 
>  We use an explicit 'or' if the user has the choice (otherwise it may look like
> it's an 'and', which is the case for some packages).
> 
Ok
>  Also, SIP is not really a standard license, so it should be the full title:
> "Riverbank Computing Limited License agreement for SIP" (without the quotes).
> But that's a bit too long, so let's say "Riverbank license for SIP".
> 
Ok
[SNIP]
> >> +
> >> +
> >> +ifeq ($(BR2_arm)$(BR2_armeb),y)
> >> +PYTHON_SIP_PLATFORM = arm
> >> +else
> >> +PYTHON_SIP_PLATFORM =
> >> +endif
> > 
> > So for everything except ARM, the specs file is:
> > 
> > 	linux--g++
> 
>  To avoid that issue, you could just patch all the specs files by putting a *
> instead of PYTHON_SIP_PLATFORM.
> 
I have simplified this by using qmake. All configurations are now provided by
this tool.
> > 
> >  ?
> > 
> >> +
> >> +define PYTHON_SIP_SET
> >> +  $(SED) '/$(1)[[:space:]]/c\$(1) = $(2)' $(3)/specs/linux-$(PYTHON_SIP_PLATFORM)-g++
> > 
> > Use one tab for indentation here.
> 
>  Also, drop the $(3) and use $(@D) directly.
> 
> > 
[SNIP]
> > 
> >> +	$(HOST_DIR)/usr/bin/python configure.py \
> >> +		-b $(TARGET_DIR)/usr/bin \
> 
>  Please use long option names, so --bindir.
> 
>  However, doesn't the same approach that we use in python-package work:
> 
> PKG_PYTHON_DISTUTILS_ENV = \
>         PATH=$(BR_PATH) \
> ...
>         _python_sysroot=$(STAGING_DIR) \
>         _python_prefix=/usr \
>         _python_exec_prefix=/usr
> 
Done
> 
> 
>  Regards,
>  Arnout
> 
> 
[SNIP]

Regards,
Gwen
