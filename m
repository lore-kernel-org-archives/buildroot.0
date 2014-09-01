From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 1 Sep 2014 20:07:57 +0200
Subject: [Buildroot] rsync issue during compilation on a VM
In-Reply-To: <CAK9TtU39N6G9smB0iZKO83b3LLk1qiw5B2Rps7BJ=dQfXzX16Q@mail.gmail.com>
References: <CAK9TtU39N6G9smB0iZKO83b3LLk1qiw5B2Rps7BJ=dQfXzX16Q@mail.gmail.com>
Message-ID: <20140901180757.GA32588@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sylvain, All,

On 2014-09-01 19:39 +0200, Sylvain LG spake thusly:
> I try to compile my system with buildroot running on a virtualized Debian
> (VirtualBox).
> Host is MacOs.
> 
> I cloned Buildroot on a shared folder: files are not stored directly on the
> VM.
> 
> Here comes the error log:
> 
> BR2_DEFCONFIG=''
> > KCONFIG_AUTOCONFIG=/home/username/sharedfolder/buildroot/output/build/buildroot-config/auto.conf
> > KCONFIG_AUTOHEADER=/home/username/sharedfolder/buildroot/output/build/buildroot-config/autoconf.h
> > KCONFIG_TRISTATE=/home/username/sharedfolder/buildroot/output/build/buildroot-config/tristate.config
> > BR2_CONFIG=/home/username/sharedfolder/buildroot/.config
> > BR2_EXTERNAL=support/dummy-external
> > /home/username/sharedfolder/buildroot/output/build/buildroot-config/conf
> > --silentoldconfig Config.in
> > make[1]: Leaving directory
> > `/home/username/sharedfolder/buildroot/buildroot-haba'
> > mkdir -p /home/username/sharedfolder/buildroot/output/target
> > rsync -a --ignore-times --exclude .svn --exclude .git --exclude .hg
> > --exclude .bzr --exclude CVS \
> > --chmod=Du+w --exclude .empty --exclude '*~' \
> > /home/username/sharedfolder/buildroot/system/skeleton/
> > /home/username/sharedfolder/buildroot/output/target/
> > rsync: failed to set times on
> > "/home/username/sharedfolder/buildroot/output/target/run": Operation not
> > permitted (1)
[--SNIP--]
> How can I fix this issue?
> 
> It seems that rsync option -O / --omit-dir-times can help,

The issue I can see is with OVERRIDE_SRCDIR. The first rsync would be OK,
since it would be the first time, but a second (and third...) would miss
setting the times on the updated files, and thus would probably mean
make would get confused on the re-build of a package for which an
OVERRIDE_SRCDIR was set.

OTOH, it seems only directories are affected by the issue, not actual
files.

We should be very carefull to test --omit-dir-times does not break with
an OVERRIDE_SRCDIR.

> but I don't know where to set it.

That would at three different places;

Makefile, lines 473 and 615:

  471 $(BUILD_DIR)/.root:
  472     mkdir -p $(TARGET_DIR)
  473     rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
  474         --chmod=Du+w --exclude .empty --exclude '*~' \
  475         $(TARGET_SKELETON)/ $(TARGET_DIR)/
  476     $(INSTALL) -m 0644 support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
  477     @ln -snf lib $(TARGET_DIR)/$(LIB_SYMLINK)
  478     @mkdir -p $(TARGET_DIR)/usr
  479     @ln -snf lib $(TARGET_DIR)/usr/$(LIB_SYMLINK)
  480     touch $@
  ...
  613     @$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
  614         $(call MESSAGE,"Copying overlay $(d)"); \
  615         rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
  616             --chmod=Du+w --exclude .empty --exclude '*~' \
  617             $(d)/ $(TARGET_DIR)$(sep))

package/pkg-generic.mk, line 120:

  116 $(BUILD_DIR)/%/.stamp_rsynced:
  117     @$(call MESSAGE,"Syncing from source dir $(SRCDIR)")
  118     @test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ; exit 1)
  119     $(foreach hook,$($(PKG)_PRE_RSYNC_HOOKS),$(call $(hook))$(sep))
  120     rsync -au $(RSYNC_VCS_EXCLUSIONS) $(SRCDIR)/ $(@D)
  121     $(foreach hook,$($(PKG)_POST_RSYNC_HOOKS),$(call $(hook))$(sep))
  122     $(Q)touch $@
 
Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
