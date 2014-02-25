From: =?iso-8859-1?Q?Ra=FAl_S=E1nchez?= Siles <rasasi78@gmail.com>
Date: Tue, 25 Feb 2014 11:23:01 +0100
Subject: [Buildroot] In Buildroot, how to compile kernel modules
In-Reply-To: <530C6AB2020000460004B173@gwia2.rz.hs-offenburg.de>
References: <530C6AB2020000460004B173@gwia2.rz.hs-offenburg.de>
Message-ID: <20140225102301.GA6130@trismegisto.universo>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 25, 2014 at 10:04:34AM +0100, Frank Ihle wrote:
> Hi everyone,
> 
[...]
> 
> I actually just want to make changes on the Buildroot or Linux configuration
> and if Image is generated I'd still like to have a runnable kernel module.
> 
> Can somebody tell me a hint about the steps, a manual or a tutorial ?
> 
> Kind Regards
> 
> Frank Ihle

  Hello:

  Consider this example for aufs, which I'll someday manage to submit. You'll
need to created an aufs package, in this case Config.in and aufs.mk

  The interesting part is aufs.mk:

------8<--------
AUFS_SITE_METHOD = git
AUFS_SITE = http://git.code.sf.net/p/aufs/aufs3-standalone

AUFS_DEPENDENCIES = linux
AUFS_INSTALL_STAGING = YES

define AUFS_BUILD_CMDS
        $(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KDIR=$(LINUX_DIR) aufs.ko
endef

define AUFS_INSTALL_TARGET_CMDS
        $(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KDIR=$(LINUX_DIR) install
endef

define AUFS_INSTALL_STAGING_CMDS
        $(MAKE) -C $(LINUX_DIR) $(LINUX_MAKE_FLAGS) -f scripts/Makefile.host \
                scripts/unifdef
        $(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KDIR=$(LINUX_DIR) usr/include/linux/aufs_type.h
        $(INSTALL) -p -m 0644 $(@D)/usr/include/linux/aufs_type.h $(STAGING_DIR)/usr/include/linux
endef

$(eval $(generic-package))
------>8--------

  Mind that this is targetted for 2013.11 so it may not work that straight
forward on a more recent (or older) version.

  Notes:

  - STAGING may not be needed in your case
  - You may need to add/remove some stuff to get your case working.
  - Consider following [0] guideliness

[0] http://buildroot.net/downloads/manual/manual.html#adding-packages

  Disclaimer: This snippet is not an aufs fully working example.

  Regards,

-- 
Ra?l S?nchez Siles
