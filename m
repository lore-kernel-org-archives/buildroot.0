From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Feb 2021 00:37:32 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2021-02-04
In-Reply-To: <CAEyMn7YCuUkYKdd-6gaH85NQcSpg5EMWJKstGtFZTmu65kDbUQ@mail.gmail.com>
References: <601cff45.1c69fb81.945af.db28SMTPIN_ADDED_MISSING@mx.google.com>
 <CAEyMn7YCuUkYKdd-6gaH85NQcSpg5EMWJKstGtFZTmu65kDbUQ@mail.gmail.com>
Message-ID: <20210205233732.GC2384@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On 2021-02-05 15:42 +0100, Heiko Thiery spake thusly:
> Am Fr., 5. Feb. 2021 um 09:18 Uhr schrieb Thomas Petazzoni
> <thomas.petazzoni@bootlin.com>:
> >    xtensa    |        netopeer2-1.1.53        | http://autobuild.buildroot.net/results/e21834d4d2ee580f00f0fdcbd3728787148c0da9
> I checked the reason for the build failure on the netopeer2 package.
> It is caused by some files that are created in /dev/shm/sr_* during
> the installation process.

Turns out, the 'sr_' prefix can be customised at runtime:

    $ SYSREPO_SHM_PREFIX=GRRR make netopeer2-reinstall
    $ ls /dev/shm
    /dev/shm/GRRR_ext                                     /dev/shm/GRRR_ietf-ssh-server.operational
    /dev/shm/GRRR_ietf-crypto-types.operational           /dev/shm/GRRR_ietf-ssh-server.running
    [--SNIP--]
    /dev/shm/GRRR_ietf-netconf-nmda.running               /dev/shm/GRRR_main
    [--SNIP--]
    /dev/shm/GRRR_ietf-origin.operational                 /dev/shm/GRRR_yang.operational
    /dev/shm/GRRR_ietf-origin.running                     /dev/shm/GRRR_yang.running

Unfortunately, that can not be used be specify a sub-directory, or an
alternate location...

So, by carefully choosing a prefix, we can at least identify what files
we must remove after the fact, and we can ensure that two concurrent
builds will not use the same files.

For example, totally untested:

    diff --git a/package/netopeer2/netopeer2.mk b/package/netopeer2/netopeer2.mk
    index bc02e0dc93..dd10f76cba 100644
    --- a/package/netopeer2/netopeer2.mk
    +++ b/package/netopeer2/netopeer2.mk
    @@ -13,9 +13,20 @@ NETOPEER2_DEPENDENCIES = libnetconf2 libyang sysrepo
     
     NETOPEER2_CONF_OPTS = -DBUILD_CLI=$(if $(BR2_PACKAGE_NETOPEER2_CLI),ON,OFF)
     
    +NETOPEER2_SHM_PREFIX = sr_buildroot$(subst /,_,$(CONFIG_DIR))_
    +NETOPEER2_MAKE_ENV = SYSREPO_SHM_PREFIX=$(NETOPEER2_SHM_PREFIX)
    +
     define NETOPEER2_INSTALL_INIT_SYSV
     	$(INSTALL) -m 755 -D package/netopeer2/S52netopeer2 \
     		$(TARGET_DIR)/etc/init.d/S52netopeer2
     endef
     
    +# The host sysrepo used to install the netopeer2 modules will leave
    +# its shared memory files lingering about. Clean up in its stead...
    +define NETOPEER2_CLEANUP
    +	rm -f /dev/shm/$(NETOPEER2_SHM_PREFIX)*
    +endef
    +NETOPEER2_PRE_INSTALL_TARGET_HOOKS += NETOPEER2_CLEANUP
    +NETOPEER2_POST_INSTALL_TARGET_HOOKS += NETOPEER2_CLEANUP
    +
     $(eval $(cmake-package))

(note: I hand-edited the patch, so it may be completely unusable as-is
now, but you at least get the idea...)

Regards,
Yann E. MORIN.

> I tried to find a solution for that. My first intention was to do a
> PRE_INSTALL_HOOK that deletes these files before the installation. But
> YANN disclaimed that because we should never delete files in
> /dev/shm/. This could lead to failures when doing concurrent parallel
> builds.
> 
> To be more detailed what is going on:
> The netopeer2 package can install the required yang models for runtime
> during installation. Therefore an additional script (setup.sh) is
> invoked. There the sysrepocfg host tool is used to do the installation
> of these yang models. sysrepo will then create this /dev/shm files and
> leave them. But with the updated netopeer2 package the shm files are
> incompatible and the build errors appear.
> 
> So I see here 3 possible solutions:
> 1. do the PRE_INSTALL_HOOK to remove the files every time (disclaimed by Yann).
> 2. remove this files by hand (no long term solution).
> 3. disable the installation of the yang modules .. but then we have a
> non functional installation available and we leave the installation of
> the yang modules to the user.
> 
> What do you think?
> 
> -- 
> Heiko

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
