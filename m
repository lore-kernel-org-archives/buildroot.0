From: mlweber1 at rockwellcollins.com <mlweber1@rockwellcollins.com>
Date: Fri, 6 Sep 2013 09:08:35 -0500
Subject: [Buildroot] [PATCH 1/1] omniorb: new package
In-Reply-To: <OF9C2B3BB5.42526667-ON86257BDE.00063112-86257BDE.004AF018@LocalDomain>
References: <1378418584-21899-1-git-send-email-mlweber1@rockwellcollins.com>
 <20130906001706.0c59d0ff@skate>
 <OF9C2B3BB5.42526667-ON86257BDE.00063112-86257BDE.004AF018@LocalDomain>
Message-ID: <OF2000AD28.53AF8D18-ON86257BDE.004D8E89-86257BDE.004DB0A9@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

Thank you for the feedback, I've included some comments below.  Let me 
know what you think.

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 09/05/2013 
05:17:06 PM:

> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> To: Matt Weber <mlweber1@rockwellcollins.com>
> Cc: buildroot at busybox.net
> Date: 09/05/2013 05:17 PM
> Subject: Re: [Buildroot] [PATCH 1/1] omniorb: new package
> 
> Dear Matt Weber,
> 
> On Thu, 5 Sep 2013 17:03:04 -0500, Matt Weber wrote:
> 
> > +config BR2_PACKAGE_OMNIORB
> > +   bool "omniorb"
> > +   help
> > +          omniORB is a robust high performance CORBA ORB for C++ 
> and Python. 
> 
> Indentation of those lines should be one tab + two spaces, not two tabs.
> 
> > +          omniORB is largely CORBA 2.6 compliant. omniORB is one 
> of only three ORBs 
> > +          to have been awarded the Open Group's Open Brand for 
> CORBA. This means that 
> > +          omniORB has been tested and certified CORBA compliant, 
> to version 2.1 of the 
> > +          CORBA specification. You can find out more about the 
> branding program at 
> > +          the Open Group.
> 
> These lines looks slightly too long. They should fit in 72 columns if I
> remember correctly.
Agree

> 
> > +config BR2_OMNIORB_EXTRA_CONFIG_OPTIONS
> > +   string "Additional omniorb configuration options"
> > +   depends on BR2_PACKAGE_OMNIORB
> > +   default ""
> > +   help
> > +     Any additional configure options you may want to include.
> 
> We generally don't offer such 'free' options for packages, so I'd
> prefer not having it, unless there are good reasons for it.
At this time there is not, so I'll remove.

> 
> > diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
> > new file mode 100644
> > index 0000000..ed2a7e7
> > --- /dev/null
> > +++ b/package/omniorb/omniorb.mk
> > @@ -0,0 +1,68 @@
> > 
> 
+################################################################################
> > +#
> > +# omniorb 
> > +#
> > 
> 
+################################################################################
> > +
> > +OMNIORB_VERSION = 4.1.6
> > +OMNIORB_SITE = http://downloads.sourceforge.net/project/omniorb/
> omniORB/omniORB-${OMNIORB_VERSION}
> 
> Please use $(...) instead of ${...} everywhere.
Agree

> 
> > +OMNIORB_SOURCE = omniORB-${OMNIORB_VERSION}.tar.bz2
> > +OMNIORB_INSTALL_STAGING = YES
> > +OMNIORB_INSTALL_TARGET = YES
> 
> This last line is not needed, that's the default.
Agree

> 
> > +OMNIORB_DEPENDENCIES = python 
> 
> Then this package either needs a depends on BR2_PACKAGE_PYTHON or a
> select BR2_PACKAGE_PYTHON. What is omniORB exactly? Is it just a set of
> Python modules? Something more than that?
>
I'll add a select of python to the Config.in.  omniORB is a inter-process 
transport abstraction, similar to DBUS.  We use both the C/C++ and python 
bindings to the object broker server it provides.
 
> > +OMNIORB_LICENSE = GPL2 LGPLv2.1
> 
> Can you check it's not GPLv2+ and LGPLv2.1+ by looking at the copyright
> headers in the source code.
>
I checked the headers and they are 2+ and 2.1+.  I'll update.
 
> > +OMNIORB_LICENSE_FILES = COPYING COPYING.LIB
> > +
> > +OMNIORB_EXTRA_CONFIG_OPTIONS = $(call qstrip,$
> (BR2_OMNIORB_EXTRA_CONFIG_OPTIONS))
> > +
> > +OMNIORB_CONF_OPT = $(OMNIORB_EXTRA_CONFIG_OPTIONS)
> 
> As per the above comment, these two lines should probably be removed.
>
Removed.
 
> > +
> > +# The following is a space-separated list of files that need to 
> have directory fixups
> > +OMNIORB_FIXUP_FILES = ${STAGING_DIR}/usr/bin/omniidl
> > +
> > +define OMNIORB_INSTALL_STAGING_CMDS
> > +   echo "Installing to staging dir: $(STAGING_DIR)"
> > +   $(TARGET_MAKE_ENV) $($(PKG)_MAKE_ENV) $($(PKG)_MAKE) $($(PKG)
> _INSTALL_STAGING_OPT) -C $($(PKG)_SRCDIR)
> > +   for i in $(OMNIORB_FIXUP_FILES); do \
> > +   $(SED) "s:$(HOST_DIR)/usr:/usr:g" $$i; \
> > +   done
> > +endef
> > +
> > +define OMNIORB_INSTALL_TARGET_CMDS
> > +   $(TARGET_MAKE_ENV) $($(PKG)_MAKE_ENV) $($(PKG)_MAKE) $($(PKG)
> _INSTALL_TARGET_OPT) -C $($(PKG)_SRCDIR)
> > +endef
> 
> For autotools packages, please don't overload the
> <pkg>_INSTALL_STAGING_CMDS and <pkg>_INSTALL_TARGET_COMMANDS.
> 
> If you need to do some tweaking after the staging installation, use a
> POST_INSTALL_STAGING_HOOKS (see the Buildroot manual for details).
>
It doesn't look like I can use POST install hooks for a autotools package 
(I double checked in the pkg-autotools.mk).  However I think I can remove 
the overload of the INSTALL_TARGET_COMMANDS as that's just duplicated of 
what the build already does.
 
> > +# OMNIORB has some host tools integrated into it's build.  We 
> first build those, then use
> > +# the host IDL2CPP/depend tools to generate code for the target 
compilation
> 
> Hum... I believe a post configure hook might be more appropriate here.
> Something like:
> 
> define OMNIORB_BUILD_HOST_TOOLS
>    $(HOST_MAKE_ENV) $(HOST) $(HOST_CONFIGURE_OPTS) -C 
$(@D)/src/tool/omkdepend
>    cp $(@D)/src/tool/omkdepend/omkdepend $(@D)/bin/
>    $(HOST_MAKE_ENV) $(HOST) $(HOST_CONFIGURE_OPTS) -C $(@D)/src/
> tool/omniidl/cxx/cccp
>    $(HOST_MAKE_ENV) $(HOST) $(HOST_CONFIGURE_OPTS) -C $(@D)/src/
> tool/omniidl/cxx
> endef
>
It doesn't look like there are POST conf hooks available for autotools 
package. 

I should have added a better comment about this build step.  The package 
has some complicated dependencies that require the tools folders to be 
built with the host(within the target build) and then when the complete 
target package build occurs it ignores the tool folder (since it's already 
built) and builds the rest of the source.  However as part of that source 
build it uses the applications in the tools folder to generate C code from 
IDL (interface definition language) for the build. 
I think I had two options to make this work...
1)Patch the source to allow a host build of the complete package to place 
the right executable(s) into the sysroot.  Then patch the source 
differently for the target build to look in the sysroot instead of it's 
tool's folder for those applications.
2)Overload the build command and insert a host build step manually for 
just those tools applications before the overall target cross compile.
I went with the option that didn't create additional patches to complicate 
if/when the version bumps.
 
> Or, the alternative is to build a complete host variant of omniorb.
> 
> > +define OMNIORB_BUILD_CMDS
> > +   ${HOST_MAKE_ENV} ${MAKE} CXX=${HOSTCXX} CC=${HOSTCC} -C $($
> (PKG)_SRCDIR)src/tool/omkdepend
> > +   cp $($(PKG)_SRCDIR)src/tool/omkdepend/omkdepend 
$($(PKG)_SRCDIR)/bin
> > +   ${HOST_MAKE_ENV} ${MAKE} CXX=${HOSTCXX} CC=${HOSTCC} -C $($
> (PKG)_SRCDIR)src/tool/omniidl/cxx/cccp
> > +   ${HOST_MAKE_ENV} ${MAKE} CXX=${HOSTCXX} CC=${HOSTCC} -C $($
> (PKG)_SRCDIR)src/tool/omniidl/cxx
> > +   ${TARGET_MAKE_ENV} ${MAKE} -C $($(PKG)_SRCDIR)
> > +endef
> > +
> > +define OMNIORB_CLEAN_CMDS
> > +   ${HOST_MAKE_ENV} ${MAKE} CXX=${HOSTCXX} CC=${HOSTCC} -C $($
> (PKG)_SRCDIR)src/tool/omkdepend clean
> > +   $(RM) $($(PKG)_SRCDIR)/bin/omkdepend
> > +   ${HOST_MAKE_ENV} ${MAKE} CXX=${HOSTCXX} CC=${HOSTCC} -C $($
> (PKG)_SRCDIR)src/tool/omniidl/cxx/cccp clean
> > +   ${HOST_MAKE_ENV} ${MAKE} CXX=${HOSTCXX} CC=${HOSTCC} -C $($
> (PKG)_SRCDIR)src/tool/omniidl/cxx clean
> > +   ${TARGET_MAKE_ENV} ${MAKE} -C $($(PKG)_SRCDIR) clean
> > +endef
> > +
> > +define OMNIORB_UNINSTALL_STAGING_CMDS
> > +   $(RM) -r ${STAGING_DIR}/usr/include/omniORB4 ${STAGING_DIR}/
> usr/include/omnithread
> > +   $(RM) ${STAGING_DIR}/usr/include/omniconfig.h ${STAGING_DIR}/
> usr/include/omnithread.h
> > +   $(RM) ${STAGING_DIR}/usr/lib/libomni*
> > +   $(RM) ${STAGING_DIR}/usr/bin/omni* 
${STAGING_DIR}/usr/bin/omkdepend
> > +endef
> > +
> > +define OMNIORB_UNINSTALL_TARGET_CMDS
> > +   $(RM) -r ${TARGET_DIR}/usr/include/omniORB4 ${TARGET_DIR}/usr/
> include/omnithread
> > +   $(RM) ${TARGET_DIR}/usr/include/omniconfig.h ${TARGET_DIR}/
> usr/include/omnithread.h
> > +   $(RM) ${TARGET_DIR}/usr/lib/libomni*
> > +   $(RM) ${TARGET_DIR}/usr/bin/omni* ${TARGET_DIR}/usr/bin/omkdepend
> > +endef
> 
> We generally don't bother implementing uninstall and clean commands.
I'll go ahead and remove these.

> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com


Thanks!



Matthew L Weber / Sr Software Engineer / Platform SW 
MS 137-157, 855 35th Street NE, Cedar Rapids, IA, 52498, USA
Phone: 319-295-7349 / VPN: 295-7349 
mlweber1 at rockwellcollins.com
www.rockwellcollins.com 

CONFIDENTIALITY NOTICE:  This email message is intended only for the 
person or entity to which it is addressed and may contain confidential 
and/or privileged material.  Any unauthorized review, use, disclosure or 
distribution is prohibited.  If you are not  the intended recipient, 
please contact the sender by email and destroy all copies of the original 
message.

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130906/61d721a3/attachment.html>
