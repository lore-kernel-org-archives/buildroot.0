From: gwenhael.goavec <gwenj@trabucayre.com>
Date: Wed, 15 Apr 2015 20:17:30 +0200
Subject: [Buildroot] [PATCH 1/2] python-sip: new package
In-Reply-To: <20150413225448.3024e28b@free-electrons.com>
References: <1428937908-17280-1-git-send-email-gwenj@trabucayre.com>
 <20150413225448.3024e28b@free-electrons.com>
Message-ID: <20150415201730.58e9b21e@x230.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Apr 2015 22:54:48 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Dear Gwenhael Goavec-Merou,
> 
> On Mon, 13 Apr 2015 17:11:47 +0200, Gwenhael Goavec-Merou wrote:
> > From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> > 
> > Based on http://lists.busybox.net/pipermail/buildroot/2013-October/080830.html
> > 
> > Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Thanks a lot for refusing the work on this package and python-pyqt!
> Some comments below.
> 
> > diff --git a/package/python-sip/0001-configure.patch b/package/python-sip/0001-configure.patch
> > new file mode 100644
> > index 0000000..4353bd1
> > --- /dev/null
> > +++ b/package/python-sip/0001-configure.patch
> > @@ -0,0 +1,43 @@
> > +Add cross compilation options for using satged python
> > +config, libraries and includes
> > +
> > +Signed-off-by Sergey Kostanbaev <sergey.kostanbaev@gamil.com>
> 
> The formatting of this patch is a bit weird, with no empty line between
> SoB and the patch. Also, the SoB e-mail is strange, and is it really
> gamil.com and not gmail.com ?
> 
> Is there any chance of submitting this patch upstream?
> 
In fact with newer sip version this patch is no more needed.
> > +====================================================================
> > +--- a/configure.py	2013-04-24 12:41:35.382000017 +0400
> > ++++ b/configure.py	2013-04-24 13:09:30.000000000 +0400
> > +@@ -273,9 +273,9 @@
> > +         "default_mod_dir":  plat_py_site_dir,
> > +         "default_sip_dir":  opts.sipsipdir,
> > +         "py_version":       py_version,
> > +-        "py_inc_dir":       plat_py_inc_dir,
> > +-        "py_conf_inc_dir":  plat_py_conf_inc_dir,
> > +-        "py_lib_dir":       plat_py_lib_dir,
> > ++        "py_inc_dir":       opts.py_inc_dir,
> > ++        "py_conf_inc_dir":  opts.py_conf_inc_dir,
> > ++        "py_lib_dir":       opts.py_lib_dir,
> > +         "universal":        opts.universal,
> > +         "arch":             opts.arch,
> > +         "deployment_target":    opts.deployment_target
> > +@@ -399,6 +399,22 @@
> > +             "macros")
> > +     p.add_option_group(g)
> > + 
> > ++    # Python configuration
> > ++    g = optparse.OptionGroup(p, title="Python include path")
> > ++    g.add_option("-i", "--py_inc_dir", action="callback",
> > ++	    default=plat_py_inc_dir, type="string", metavar="DIR",
> > ++	    dest="py_inc_dir", callback=store_abspath, help="where the Python "
> > ++	    "include directory located [default: %s]" % plat_py_inc_dir)
> > ++    g.add_option("-c", "--py_conf_inc_dir", action="callback",
> > ++	    default=plat_py_conf_inc_dir, type="string", metavar="DIR",
> > ++	    dest="py_conf_inc_dir", callback=store_abspath, help="where the Python "
> > ++	    "Configuration include directory located [default: %s]" % plat_py_conf_inc_dir)
> > ++    g.add_option("-l", "--py_lib_dir", action="callback",
> > ++	    default=plat_py_conf_inc_dir, type="string", metavar="DIR",
> > ++	    dest="py_lib_dir", callback=store_abspath, help="where the Python "
> > ++	    "library located [default: %s]" % plat_py_lib_dir)
> > ++
> > ++
> > +     # Installation.
> > +     g = optparse.OptionGroup(p, title="Installation")
> > +     g.add_option("-b", "--bindir", action="callback",
> > \ No newline at end of file
> > diff --git a/package/python-sip/Config.in b/package/python-sip/Config.in
> > new file mode 100644
> > index 0000000..fdbf7c2
> > --- /dev/null
> > +++ b/package/python-sip/Config.in
> > @@ -0,0 +1,11 @@
> > +comment "python-sip needs a toolchain w/ C++"
> > +	depends on !BR2_INSTALL_LIBSTDCPP
> > +
> > +config BR2_PACKAGE_PYTHON_SIP
> > +	bool "python-sip"
> > +	depends on BR2_INSTALL_LIBSTDCPP
> 
> Is it Python 2 *and* Python 3 compatible?
> 
Yes
> > +	help
> > +	  SIP is a tool for C/C++ libraries binding. It was developed
> > +	  to create PyQt
> > +
> > +	  http://www.riverbankcomputing.com/software/sip/intro
[SNIP]

> 
> > +PYTHON_SIP_DEPENDENCIES = host-python-sip python
> 
> Can you clarify why both a host and a target package are needed?
> Preferably in the commit log.
> 
host-python-sip provides a tools used for configuration and python-sip provides
headers.
> > +HOST_PYTHON_SIP_DEPENDENCIES = host-python
> > +
> > +define HOST_PYTHON_SIP_CONFIGURE_CMDS
> > +    (cd $(@D); \
> > +	$(HOST_CONFIGURE_OPTS) $(HOST_DIR)/usr/bin/python configure.py;\
> > +    )
> > +endef
> 
> This is the only command for the host package. Is it really doing
> something?
> 
Yes with default configs
> > +
> > +
> > +ifeq ($(BR2_arm)$(BR2_armeb),y)
> > +PYTHON_SIP_PLATFORM = arm
> > +else
> > +PYTHON_SIP_PLATFORM =
> > +endif
> 
> So for everything except ARM, the specs file is:
> 
> 	linux--g++
> 
>  ?
> 
> > +
> > +define PYTHON_SIP_SET
> > +  $(SED) '/$(1)[[:space:]]/c\$(1) = $(2)' $(3)/specs/linux-$(PYTHON_SIP_PLATFORM)-g++
> 
> Use one tab for indentation here.
> 
> > +endef
> > +
> > +define PYTHON_SIP_CONFIGURE_CMDS
> > +# Fix compilers path and flags
> > +    $(call PYTHON_SIP_SET,QMAKE_CC,$(TARGET_CC),$(@D))
> > +    $(call PYTHON_SIP_SET,QMAKE_CXX,$(TARGET_CXX),$(@D))
> > +    $(call PYTHON_SIP_SET,QMAKE_LINK,$(TARGET_CXX),$(@D))
> > +    $(call PYTHON_SIP_SET,QMAKE_LINK_SHLIB,$(TARGET_CXX),$(@D))
> > +    $(call PYTHON_SIP_SET,QMAKE_AR,$(TARGET_AR) cqs,$(@D))
> > +    $(call PYTHON_SIP_SET,QMAKE_OBJCOPY,$(TARGET_OBJCOPY),$(@D))
> > +    $(call PYTHON_SIP_SET,QMAKE_RANLIB,$(TARGET_RANLIB),$(@D))
> > +    $(call PYTHON_SIP_SET,QMAKE_STRIP,$(TARGET_STRIP),$(@D))
> > +    $(call PYTHON_SIP_SET,QMAKE_CFLAGS,$(QT_CFLAGS),$(@D))
> > +    $(call PYTHON_SIP_SET,QMAKE_CXXFLAGS,$(QT_CXXFLAGS),$(@D))
> > +    $(call PYTHON_SIP_SET,QMAKE_LFLAGS,$(TARGET_LDFLAGS),$(@D))
> 
> Ditto one tab for indentation.
> 
This part is no more needed too
> > +
> > +    ( cd $(@D); \
> > +	cp specs/linux-$(PYTHON_SIP_PLATFORM)-g++ specs;  \
> 
> This doesn't really have to be in the cd $(@D), you can do:
> 
> 	cp $(@D)/specs/linux-.... $(@D)/specs
No because configure.py generates some files in a current directory (ie.
buildroot root dir)
> 
> > +	$(HOST_DIR)/usr/bin/python configure.py \
> > +		-b $(TARGET_DIR)/usr/bin \
> > +		-d $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
> > +		-e $(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)  \
> > +		-v $(TARGET_DIR)/usr/share/sip \
> > +		-i $(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR) \
> > +		-c $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/config \
> > +		-p linux-$(PYTHON_SIP_PLATFORM)-g++; \
> > +    )
> > +endef
> > +
> > +define PYTHON_SIP_INSTALL_TARGET_CMDS
> > +    $(TARGET_CONFIGURE_OPTS) $(MAKE) install -C $(@D)
> > +endef
> > +
> > +$(eval $(generic-package))
> > +$(eval $(host-generic-package))
> 
> So overall the main question is why do we need both a host and a target
> package? Is it a code generator that should be only on the host?
> Something else?
> 
> Thanks,
> 
> Thomas

Gwen
