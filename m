From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Nov 2019 17:38:30 +0100
Subject: [Buildroot] [PATCH v7 3/8] core: implement per-package SDK and
 target
In-Reply-To: <b92540ca-37ad-42ad-9bf3-eee8f6f6ed26@cesnet.cz>
References: <20181228104335.22379-1-thomas.petazzoni@bootlin.com>
 <20181228104335.22379-4-thomas.petazzoni@bootlin.com>
 <b92540ca-37ad-42ad-9bf3-eee8f6f6ed26@cesnet.cz>
Message-ID: <20191105173830.6c8fc5d1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jan,

Yes, some feedback on an almost year old comment!

On Tue, 08 Jan 2019 19:02:56 +0100
Jan Kundr?t <jan.kundrat@cesnet.cz> wrote:

> I gave this series (the ppsh-v7-work merged into master, actually, with a 
> revert of 51395b14ed1a23858eef5d7f2bcf3a03cca6dfb3). The only immediate 
> breakage I see so far on my config (ARM, systemd, glibc, linaro toolchain) 
> is related to systemd-networkd and its /etc/resolv.conf symlink handling, 
> but I am afraid that I see a bigger problem.
> 
> The basic skeleton defines a symlink (it's in 
> system/skeleton/etc/resolv.conf) pointing to ../tmp/resolv.conf . This is 
> overwritten in package/systemd/systemd.mk through 
> SYSTEMD_INSTALL_RESOLVCONF_HOOK, and indeed it results in a correct symlink 
> in the systemd's per-package target dir:
> 
>   per-package/systemd/target/etc/resolv.conf -> 
> ../run/systemd/resolve/resolv.conf
> 
> The problem is that at the rsync time, packages are processed in 
> alphabetical order. If the very last package to be rsynced (in my case, 
> this is zlib) does not transitively depend on systemd, then rsync will 
> update the /etc/resolv.conf symlink back to one obtained from the default 
> skeleton.

Indeed. Clearly, we have identified since quite a while that the
per-package directory mechanism only works if all packages install
distinct set of files, unless they have a dependency relationship.

> I think that this is -- potentially -- also a problem for any package "P2" 
> which calls `ln -sf` from its *_INSTALL_TARGET_HOOKS to overwrite stuff 
> which belongs to another package "P1". If any other package "P3" depends on 
> "P1" and not on "P2", *and* if P3's name sorts after P2, then the P1's 
> symlink gets preserved via P3.
> 
> This will not necessary be fixed by changing to do the rsync in a 
> dependency order because "P3" can still be rsynced after "P2".
> 
> What is the cleanest fix here? Should this symlink overriding go to 
> *_TARGET_FINALIZE_HOOKS? If the `ln -sf` was just in TARGET_FINALIZE_HOOKS, 
> that would mean that the corresponding per-package/*/target would *not* 
> contain these fixes which would be quite confusing, IMHO... OTOH, two hooks 
> for overwriting would be ugly.

For the case of resolv.conf, I think solving it through a
TARGET_FINALIZE_HOOKS is probably the most appropriate option for now.
We'll have to see later on if we have other cases like this, and if
there is a pattern that allows us to invent some useful bit of
additional infrastructure.

Or we could:

 (1) Move the /etc/resolv.conf symlink from system/skeleton/ to
     package/skeleton-init-sysv/skeleton/etc.

 (2) Tweak the systemd.mk so that it always creates resolv.conf, either
     pointing to ../run/systemd/resolve/resolv.conf when resolved is
     enabled, or to /tmp/resolv.conf otherwise.

This would avoid the overwriting entirely.

What do you think ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
