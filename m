From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Wed, 5 Nov 2008 10:39:43 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <20081104201732.54f83c0c@surf>
References: <20081030140206.411543C2BE@busybox.net>
	<20081104201732.54f83c0c@surf>
Message-ID: <20081105103943.7725b98b@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 4 Nov 2008 20:17:32 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

Hi Thomas,

> Le Thu, 30 Oct 2008 07:02:06 -0700 (PDT),
> egtvedt at uclibc.org a ?crit :
> 
> > Author: egtvedt
> > Date: 2008-10-30 07:02:05 -0700 (Thu, 30 Oct 2008)
> > New Revision: 23858
> 
> This commit breaks the build for me. See inline comments below.
> 

Sorry about that.

<snipp>

> > -$(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep:
> > $(LINUX26_DIR)/.configured
> > -	rm -rf $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)
> > +$(PROJECT_BUILD_DIR)/autotools-stamps/linux_modules_target_installed:
> > $(LINUX26_DIR)/.configured
> 
> This change breaks with the following:
> 
> make[1]: Leaving directory
> `/home/thomas/local/buildroot2/project_build_arm/uclibc/linux-2.6.27'
> touch /home/thomas/local/buildroot2/project_build_arm/uclibc/autotools-stamps/linux_modules_target_installed
> touch: cannot touch
> `/home/thomas/local/buildroot2/project_build_arm/uclibc/autotools-stamps/linux_modules_target_installed':
> No such file or directory make: ***
> [/home/thomas/local/buildroot2/project_build_arm/uclibc/autotools-stamps/linux_modules_target_installed]
> Error 1
> 

I am thinking about adding
"mkdir -p $(PROJECT_BUILD_DIR)/autotools-stamps" to the top level
Makefile. That way we are sure the stamps directory exists, and each
package/Makefile.autotools.in does not need to run an additional mkdir.

> > +	rm -rf $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)
> 
> And this one (which evaluates LINUX26_VERSION_PROVED) breaks with:
> 
> Makefile:1561: *** kernelrelease not valid - run 'make prepare' to
> update it.  Stop.
> 

Hmmm, weird, the Makefile should not install the modules before after
the kernel is prepared.

I see you are using external toolchain, might that be the cause? The
kernel is prepared/compiled before the modules are compiled?

> (But this one is not fatal, the compilation process continues.)
> 
> My .config is below.
> 

<snipp BR .config>

-- 
Best regards,
Hans-Christian Egtvedt
