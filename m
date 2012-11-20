From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Nov 2012 09:59:04 +0100
Subject: [Buildroot] Who calls to the defined function/s
In-Reply-To: <CACUGKYMDKMSvqrUgRhiKyaVm6S5z7a+RMa+3oyCXspU8OVVbYQ@mail.gmail.com>
References: <CACUGKYMDKMSvqrUgRhiKyaVm6S5z7a+RMa+3oyCXspU8OVVbYQ@mail.gmail.com>
Message-ID: <20121120095904.20264654@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear John Tobias,

On Mon, 19 Nov 2012 18:21:03 -0800, John Tobias wrote:

> I was trying to (fully) understand the dataflow of the buildroot's
> Makefile. How/who parse/calls to the functions like:
> 
> HELLO_INSTALL_TARGET_CMDS
> HELLO_BUILD_CMDS
> 
> $(eval $(generic-package))

The generic-package macro will find in which directory your Makefile
is, for example package/hello/. It will take this "hello" convert it to
uppercase, and use it as the prefix for all variables. So basically, a
package in package/hello/hello.mk will have to define HELLO_SITE,
HELLO_SOURCE, HELLO_VERSION, and possibly HELLO_BUILD_CMDS,
HELLO_INSTALL_TARGET_CMDS, etc.

> So, How I can tell to the generic-package to call HELLO_TEST_CMDS too?
> 
> example:
> define HELLO_TEST_CMDS
> ...
> endef

That would require a modification of the package infrastructure, which
you probably don't want to do. What are you trying to achieve with a
new command exactly?

New commands are normally not needed:

 *) For autotools-package and cmake-package, you have hooks so that you
    can do something after extraction, after patching, after
    configuration, after installation, etc.

 *) For generic-package, you can do something like:

ifeq ($(BR2_PACKAGE_HELLO_SOMETHING),y)
define HELLO_DO_THIS_CMDS
	$(MAKE) -C $(@D) do-this
endef
endif

ifeq ($(BR2_PACKAGE_HELLO_SOMETHING_ELSE),y)
define HELLO_DO_THAT_CMDS
	$(MAKE) -C $(@D) do-that
endef
endif

define HELLO_BUILD_CMDS
	$(HELLO_DO_THIS_CMDS)
	$(HELLO_DO_THAT_CMDS)
endef

Please make sure to read our documentation at
http://buildroot.org/downloads/manual/manual.html#_adding_new_packages_to_buildroot
which explains all of this with quite some details and examples.

Do not hesitate to get back to the list if you need further details,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
