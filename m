From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 May 2013 15:06:45 +0200
Subject: [Buildroot] How to include Buildroot defines?
In-Reply-To: <0855BDD4CF82174A8BE362DE9F27C3BF01E3FEC82D23@pche-exchange>
References: <0855BDD4CF82174A8BE362DE9F27C3BF01E3FEC82D23@pche-exchange>
Message-ID: <20130523150645.6efe2e15@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Morten Kvistgaard,

On Thu, 23 May 2013 14:53:15 +0200, Morten Kvistgaard wrote:

> I'm currently converting my uClinux to Buildroot.

Nice. Which hardware platform are you working with?

> In my uClinux I could include the "KConfig result" in my programs.
> That way I could customize a program in the menuconfig. Eg. with
> extra options or by including apps etc. This could look something
> like:
> 
> #include <config/autoconf.h>
> 
> #ifdef CONFIG_USER_MYAPP_OPTION
>    //Menuconfig tells me to build featureX
> #endif
> 
> 
> This was an easy way to handle static options.
> I can see that Buildroot also has a autoconf.h. It's located in
> output/build/buildroot-config/.
> 
> How do I include this in a correct way? Or is this a bad way to do it?

Yes, I would say it's not how things should be done. Instead, your
package recipe maybe be passing different options to your program
configure or build process, depending on Buildroot Kconfig options.
That's what we do for all the packages.

For example in package/yourprog/Config.in:

config BR2_PACKAGE_YOURPROG
	bool "yourprog"
	help
	  This option enables the build of your program.

config BR2_PACKAGE_YOURPROG_OPTIONA
	bool "feature A"
	depends on BR2_PACKAGE_YOURPROG
	help
	  This option enables some feature A in your program

and then, in package/yourprog/yourprog.mk:

ifeq ($(BR2_PACKAGE_YOURPROG_OPTIONA),y)
YOURPROG_CONF_OPT += --enable-featurea
endif

if your package is autotools based. Or, if it's just a simple Makefile
that takes some environment variables:

ifeq ($(BR2_PACKAGE_YOURPROG_OPTIONA),y)
YOURPROG_MAKE_ENV += FEATUREA=YES
endif

define YOURPROG_BUILD_CMDS
	$(YOURPROG_MAKE_ENV) $(MAKE) -C $(@D)
endef

And that's it.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
