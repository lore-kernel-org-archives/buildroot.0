From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Date: Tue, 08 Jan 2019 19:02:56 +0100
Subject: [Buildroot] 
 =?iso-8859-1?q?=5BPATCH_v7_3/8=5D_core=3A_implement_?=
 =?iso-8859-1?q?per-package_SDK_and_target?=
In-Reply-To: <20181228104335.22379-4-thomas.petazzoni@bootlin.com>
References: <20181228104335.22379-1-thomas.petazzoni@bootlin.com>
 <20181228104335.22379-4-thomas.petazzoni@bootlin.com>
Message-ID: <b92540ca-37ad-42ad-9bf3-eee8f6f6ed26@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On p?tek 28. prosince 2018 11:43:30 CET, Thomas Petazzoni wrote:
> +ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
> +# rsync the contents of per-package directories
> +# $1: space-separated list of packages to rsync from
> +# $2: 'host' or 'target'
> +# $3: destination directory
> +define per-package-rsync
> +	mkdir -p $(3)
> +	$(foreach pkg,$(1),\
> +		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
> +		$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
> +		$(3)$(sep))
> +endef

Hi Thomas,
I gave this series (the ppsh-v7-work merged into master, actually, with a 
revert of 51395b14ed1a23858eef5d7f2bcf3a03cca6dfb3). The only immediate 
breakage I see so far on my config (ARM, systemd, glibc, linaro toolchain) 
is related to systemd-networkd and its /etc/resolv.conf symlink handling, 
but I am afraid that I see a bigger problem.

The basic skeleton defines a symlink (it's in 
system/skeleton/etc/resolv.conf) pointing to ../tmp/resolv.conf . This is 
overwritten in package/systemd/systemd.mk through 
SYSTEMD_INSTALL_RESOLVCONF_HOOK, and indeed it results in a correct symlink 
in the systemd's per-package target dir:

  per-package/systemd/target/etc/resolv.conf -> 
../run/systemd/resolve/resolv.conf

The problem is that at the rsync time, packages are processed in 
alphabetical order. If the very last package to be rsynced (in my case, 
this is zlib) does not transitively depend on systemd, then rsync will 
update the /etc/resolv.conf symlink back to one obtained from the default 
skeleton.

I think that this is -- potentially -- also a problem for any package "P2" 
which calls `ln -sf` from its *_INSTALL_TARGET_HOOKS to overwrite stuff 
which belongs to another package "P1". If any other package "P3" depends on 
"P1" and not on "P2", *and* if P3's name sorts after P2, then the P1's 
symlink gets preserved via P3.

This will not necessary be fixed by changing to do the rsync in a 
dependency order because "P3" can still be rsynced after "P2".

What is the cleanest fix here? Should this symlink overriding go to 
*_TARGET_FINALIZE_HOOKS? If the `ln -sf` was just in TARGET_FINALIZE_HOOKS, 
that would mean that the corresponding per-package/*/target would *not* 
contain these fixes which would be quite confusing, IMHO... OTOH, two hooks 
for overwriting would be ugly.

With kind regards,
Jan
