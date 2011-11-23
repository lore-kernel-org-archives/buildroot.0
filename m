From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 23 Nov 2011 08:19:33 +0100
Subject: [Buildroot] equivalent of a 'make modules'
In-Reply-To: <006101cca967$050bb240$0400a8c0@dspcgrnzks9p98>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <20111122230429.2bef52c2@skate>
 <005d01cca963$b9a61eb0$0400a8c0@dspcgrnzks9p98>
 <20111122232914.76a86e7d@skate>
 <006101cca967$050bb240$0400a8c0@dspcgrnzks9p98>
Message-ID: <CAAXf6LVFSZpPxtsu9DmiEtw9LjNtdEWGQ+zdBQhscRAZ67vu_Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 22, 2011 at 11:35 PM, Jeff Krasky <jeff.krasky@dspcg.com> wrote:
>> Ok. I guess the EtherCAT stuff is not open-source, unfortunately.
>
> This is what I am working with:
>
> http://www.etherlab.org/en/ethercat/index.php
>
>
>> What you should do is create a Buildroot package
>
> Ok, this is where it becomes new for me. ?Is this the "only way" or the
> "most convenient" way, or the "simplest way" for someone not that familiar
> with BuildRoot?

I would say it's both.

Below is an example package .mk file for a kernel module. It uses the
GENTARGETS infrastructure to explicitly specify the commands that
should be executed when building and installing.
Depending on the organization of EtherCAT, it may be a good idea to
create two packages: one for the application and one for the kernel
modules. It will probably make the .mk files a tad simpler.

FOOMODULE_VERSION = 0.1.2
FOOMODULE_SOURCE = foomodule-$(FOOMODULE_VERSION).tar.gz
FOOMODULE_SITE = http://yoursite

FOOMODULE_DEPENDENCIES = linux

FOOMODULE_INSTALL_MOD_DIR = foo

define FOOMODULE_BUILD_CMDS
       $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) modules
endef

define FOOMODULE_INSTALL_TARGET_CMDS
       $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) \
               INSTALL_MOD_STRIP=1 \
               INSTALL_MOD_DIR=$(FOOMODULE_INSTALL_MOD_DIR) \
               modules_install
endef

define FOOMODULE_UNINSTALL_TARGET_CMDS
       rm -rf $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/$(FOOMODULE_INSTALL_MOD_DIR)
endef

$(eval $(call GENTARGETS))


Documentation on adding packages is available here:
http://buildroot.uclibc.org/buildroot.html#add_packages
If the EtherCAT application uses autotools (i.e. when it has files
like configure.in, configure.ac, Makefile.in, Makefile.am) then you
can use the AUTOTOOLS infrastructure for that part. The modules should
be done with GENTARGETS.

Best regards,
Thomas
