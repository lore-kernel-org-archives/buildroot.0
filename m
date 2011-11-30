From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 30 Nov 2011 20:44:22 +0100
Subject: [Buildroot] LIBFOO_SITE in .mk file
In-Reply-To: <000f01ccaf8b$7279ed90$0400a8c0@dspcgrnzks9p98>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <201111281139.37028.minimod@morethan.org>
 <002701ccadfe$961b9430$0400a8c0@dspcgrnzks9p98>
 <201111281324.38619.minimod@morethan.org>
 <003601ccae04$ada02e80$0400a8c0@dspcgrnzks9p98>
 <003801ccae12$a7781190$0400a8c0@dspcgrnzks9p98>
 <003901ccae1b$2d82f950$0400a8c0@dspcgrnzks9p98>
 <20111129083710.1a83fad6@skate>
 <001201ccaea3$3ad7df70$0400a8c0@dspcgrnzks9p98>
 <20111129153619.4f080721@skate>
 <001301ccaea5$37ec1f40$0400a8c0@dspcgrnzks9p98>
 <001401ccaedf$e5751f60$0400a8c0@dspcgrnzks9p98>
 <001501ccaee8$34c408d0$0400a8c0@dspcgrnzks9p98>
 <000b01ccaf79$085d0800$0400a8c0@dspcgrnzks9p98>
 <20111130170450.2f33e6c2@skate>
 <000c01ccaf7c$01f3c460$0400a8c0@dspcgrnzks9p98>
 <20111130173327.069f46fb@skate>
 <000d01ccaf7e$78243280$0400a8c0@dspcgrnzks9p98>
 <CAAXf6LV8ArEeuQ=w3r7745AK00t2XqtSoLqv+tBc9rnpjS8sCQ@mail.gmail.com>
 <000f01ccaf8b$7279ed90$0400a8c0@dspcgrnzks9p98>
Message-ID: <CAAXf6LWSPgAR6C_+eqq5DZ5CCJkzJ22zpfyTzr7bNEGj-mOKYw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Nov 30, 2011 at 7:11 PM, Jeff Krasky <jeff.krasky@dspcg.com> wrote:
>> * create one .mk file, with one set of build rules, that combine the
>> build steps for the application and for the kernel.
>
> I'll try this one first. ?Here is the latest EtherCAT.mk:
>
> #############################################################
> #
> # EtherCAT
> #
> #############################################################
> ETHERCAT_VERSION = 1.0
> ETHERCAT_SOURCE = etherlabmaster-1.0.tar.bz2
> ###ETHERCAT_SITE = file:///home/user1/Desktop/EtherCAT4Atmel/
> ETHERCAT_SITE = http://127.0.0.1/home/user1/Desktop/EtherCAT4Atmel/
> ETHERCAT_INSTALL_STAGING = YES
> ETHERCAT_INSTALL_TARGET = YES
> ETHERCAT_CONF_OPT = --enable-generic
> ETHERCAT_DEPENDENCIES = linux
> ETHERCAT_INSTALL_MOD_DIR = ethercat
> #####ETHERCAT_INSTALL_MOD_PATH
>
> define ETHERCAT_BUILD_CMDS
> ? ? ? $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) M=$(@D) modules
> endef
>
> define ETHERCAT_INSTALL_TARGET_CMDS
> ? ? ? $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) M=$(@D) \
> ? ? ? ? ? ? ? INSTALL_MOD_STRIP=1 \
> ? ? ? ? ? ? ? INSTALL_MOD_DIR=$(ETHERCAT_INSTALL_MOD_DIR) \
> ? ? ? ? ? ? ? modules_install
> endef
>
> define ETHERCAT_UNINSTALL_TARGET_CMDS
> ? ? ? rm -rf
> $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)/$(ETHERCAT_INSTALL_MOD_D
> IR)
> endef
>
> $(eval $(call GENTARGETS))
>
> #####$(eval $(call AUTOTARGETS,package,ethercat))

You do realize that these rules are purely intended for the module, right.

Based on what ThomasP says, things may be a little more complicated
than I originally thought.

>
>
>> Do keep in mind that in previous
>> versions of buildroot, the LINUX_ prefix was called LINUX26_, so for
>> example LINUX_MAKE_FLAGS needs to be renamed to LINUX26_MAKE_FLAGS,
>> likewise with LINUX_DIR.
>
> Thanks. ?I changed them, but I left
>
> ETHERCAT_DEPENDENCIES = linux
>
> as just "linux". ?Should it be "linux26"? ?The build is going on now, but it
> takes a while, so if it should be "linux26" can you tell me (or if anything
> else is wrong in .mk) so I can stop the build and fix it?

In buildroot 2010.05, it was possible to use both linux as linux26, so
you should be fine.

>
>> If you still have questions, I suggest you provide us with your
>> current.mk file and the problems (e.g. build errors) you still
>> experience with it.
>
> I'll see how this latest build goes, but I think the result needs to be that
>
>
> /lib/modules/2.6.33
>
> needs to have an 'ethercat' subdirectory containing ec_master.ko, among
> other files. ?So far, no build has done this.

Just checking: you are looking into output/target/lib/modules or
/lib/modules on the target right, not /lib/modules on the host?
If the modules_install step in your .mk file goes well, this should
put the file there.
Seeing the build log of that part should hint you what is wrong, if anything.

>
> Thanks so much, time is short and this is really helping.
>
