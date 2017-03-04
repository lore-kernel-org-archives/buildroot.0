From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Mar 2017 15:48:24 +0100
Subject: [Buildroot] [PATCH 1/1] boinc: new package
In-Reply-To: <1488638270-20784-1-git-send-email-fontaine.fabrice@gmail.com>
References: <1488638270-20784-1-git-send-email-fontaine.fabrice@gmail.com>
Message-ID: <20170304154824.54623667@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  4 Mar 2017 15:37:50 +0100, Fabrice Fontaine wrote:

> + lib_LTLIBRARIES = libboinc_api.la
> + libboinc_api_la_SOURCES = $(api_files)
> +-libboinc_api_la_LDFLAGS = -L$(libdir) -rpath $(libdir) -version-number $(LIBBOINC_VERSION)
> ++libboinc_api_la_LDFLAGS = -rpath $(libdir) -version-number $(LIBBOINC_VERSION)

You should also remove the -rpath $(libdir) variable, because the
-rpath option also causes the linker to look into $(libdir) during the
build process:

'-rpath=DIR'
     Add a directory to the runtime library search path.  This is used
     when linking an ELF executable with shared objects.  All '-rpath'
     arguments are concatenated and passed to the runtime linker, which
     uses them to locate shared objects at runtime.  The '-rpath' option
     is also used when locating shared objects which are needed by
     shared objects explicitly included in the link; see the description
     of the '-rpath-link' option.  If '-rpath' is not used when linking
     an ELF executable, the contents of the environment variable
     'LD_RUN_PATH' will be used if it is defined.

> +BOINC_VERSION = 26198
> +BOINC_SITE = $(call github,BOINC,boinc,vboxwrapper/$(BOINC_VERSION))

What is this vboxwrapper/<xyz> version?

> +BOINC_LICENSE = LGPLv3
> +BOINC_LICENSE_FILES = COPYING COPYING.LESSER 

COPYING contains the text of the GPLv3, so are you sure the entire project is under LGPLv3 ?

> +ifeq ($(BR2_PACKAGE_LIBCURL)$(BR2_PACKAGE_OPENSSL),yy)
> +BOINC_DEPENDENCIES += \
> +	libcurl \
> +	openssl

One line is enough for this assignment.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
