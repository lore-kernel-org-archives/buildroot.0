From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 Mar 2016 23:43:42 +0200
Subject: [Buildroot] [PATCH 8/9 v2] fs/common: move actions common to
 all filesystems to their own rule
In-Reply-To: <56F99E23.8010702@gmail.com>
References: <cover.1457721607.git.yann.morin.1998@free.fr>
 <e7baa279dac14ca71696b310a3ba7814ffb44d54.1457721607.git.yann.morin.1998@free.fr>
 <56F99E23.8010702@gmail.com>
Message-ID: <20160328214342.GF3608@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-03-28 23:12 +0200, Romain Naour spake thusly:
> Le 11/03/2016 19:41, Yann E. MORIN a ?crit :
> > A lot of actions are common to generating the various images. Currently,
> > they are all done for each image being generated.
> > 
> > However, we can do them once and for all.
> > 
> > Also add a sha-bang to the fakeroot script, for completeness.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > 
> > ---
> > Note: when I wrote that patch, it was only a preparatory work for something
> > bigger and clever about how images are generated. However, I can't recall
> > what it was... :-(  Yet, I believe that patch to still be valid on its own.
> 
> Maybe this patch was done to remove some $$ in the code :p

Hehe! However, who would complain for having too many $ ? ;-]

[--SNIP--]
> > @@ -66,32 +89,16 @@ ROOTFS_$(2)_COMPRESS_EXT = .xz
> >  ROOTFS_$(2)_COMPRESS_CMD = xz -9 -C crc32 -c
> >  endif
> >  
> > -$$(BINARIES_DIR)/rootfs.$(1): target-finalize $$(ROOTFS_$(2)_DEPENDENCIES)
> > +ROOTFS_$(2)_FAKEROOT_SCRIPT = $$(FS_DIR)/fakeroot.$(1)
> > +
> > +$$(BINARIES_DIR)/rootfs.$(1): rootfs-common $$(ROOTFS_$(2)_DEPENDENCIES)
> >  	@$$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
> >  	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),$$(call $$(hook))$$(sep))
> > -	rm -f $$(FAKEROOT_SCRIPT)
> > +	$$(INSTALL) -D -m 0755 $$(FAKEROOT_SCRIPT) $$(ROOTFS_$(2)_FAKEROOT_SCRIPT)
> > +	echo "$$(ROOTFS_$(2)_CMD)" >> $$(ROOTFS_$(2)_FAKEROOT_SCRIPT)
> >  	rm -f $$(TARGET_DIR_WARNING_FILE)
> > -	rm -f $$(USERS_TABLE)
> > -	echo "set -e" >> $$(FAKEROOT_SCRIPT)
> > -	echo "chown -h -R 0:0 $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
> > -ifneq ($$(ROOTFS_USERS_TABLES),)
> > -	cat $$(ROOTFS_USERS_TABLES) >> $$(USERS_TABLE)
> > -endif
> > -	printf '$$(subst $$(sep),\n,$$(PACKAGES_USERS))' >> $$(USERS_TABLE)
> > -	PATH=$$(BR_PATH) $$(TOPDIR)/support/scripts/mkusers $$(USERS_TABLE) $$(TARGET_DIR) >> $$(FAKEROOT_SCRIPT)
> > -ifneq ($$(ROOTFS_DEVICE_TABLES),)
> > -	cat $$(ROOTFS_DEVICE_TABLES) > $$(FULL_DEVICE_TABLE)
> > -ifeq ($$(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
> > -	printf '$$(subst $$(sep),\n,$$(PACKAGES_DEVICES_TABLE))' >> $$(FULL_DEVICE_TABLE)
> > -endif
> > -	printf '$$(subst $$(sep),\n,$$(PACKAGES_PERMISSIONS_TABLE))' >> $$(FULL_DEVICE_TABLE)
> > -	echo "$$(HOST_DIR)/usr/bin/makedevs -d $$(FULL_DEVICE_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
> > -endif
> > -	echo "$$(ROOTFS_$(2)_CMD)" >> $$(FAKEROOT_SCRIPT)
> > -	chmod a+x $$(FAKEROOT_SCRIPT)
> > -	PATH=$$(BR_PATH) $$(HOST_DIR)/usr/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
> > +	PATH=$$(BR_PATH) $$(HOST_DIR)/usr/bin/fakeroot -- $$(ROOTFS_$(2)_FAKEROOT_SCRIPT)
> >  	$$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $$(TARGET_DIR_WARNING_FILE)
> > -	- at rm -f $$(FAKEROOT_SCRIPT) $$(FULL_DEVICE_TABLE)
> 
> I think it's a good idea to keep all fakeroot.* script used during rootfs images
> build.
> 
> Reviewed-by: Romain Naour <romain.naour@gmail.com>
> 
> It seems that there is no need to add PATH=$(BR_PATH) in ROOTFS_EXT2_CMD since
> it's already present in fakeroot environment ? (see
> 89e16118b45c1bb8d112e8829d34e0883a6450be)

Indeed, but that should be done in a separate patch (since it was not
added in my series). I'll add such a patch to the series.

Thanks! :-)

Regards,
Yann E. MORIN.

> Best regards,
> Romain
> 
> >  ifneq ($$(ROOTFS_$(2)_COMPRESS_CMD),)
> >  	PATH=$$(BR_PATH) $$(ROOTFS_$(2)_COMPRESS_CMD) $$@ > $$@$$(ROOTFS_$(2)_COMPRESS_EXT)
> >  endif
> > 
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
