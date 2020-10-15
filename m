From: Michael Nosthoff <buildroot@heine.tech>
Date: Thu, 15 Oct 2020 15:46:46 +0200
Subject: [Buildroot] [PATCH] package/uboot-tools: create /var/lock
 directory for fw_printenv
In-Reply-To: <CADYdroNTfe-CMVv+vvSqdq5WuAMU4LUP4pFktgR3YUAOpxDcFg@mail.gmail.com>
References: <20201004125538.15161-1-aleontiev@elvees.com>
 <20201014235531.301aa821@windsurf>
 <CADYdroNTfe-CMVv+vvSqdq5WuAMU4LUP4pFktgR3YUAOpxDcFg@mail.gmail.com>
Message-ID: <93189d9e-1e71-f9e6-da52-664e3357dd53@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 15.10.2020 14:42, Norbert Lange wrote:
> systemd init will not create /run/lock and the /var/lock symlink anymore,
> this was caused by one of my changes. Still need some feedback for the
> correct solution
>
> 1) copy over the old legacy.conf. Patch is at [1]
> ? ? (would be a quick temporary solution)
> 2) create a own buildroot.conf in the systemd-skeleton, adding those
> dirs there (and in the future potentially other stuff)
> 3) Add some variable BR_SKELETON_LOCKDIR that uboot-tools selects
> (aswell as sysv and busybox init)
> ? ? Only do 1 or2 if that variable is set.
>
> At any rate, systemd-tmpfiles tool should be mandatory for systemd.
>
I strongly agree with that. I don't see any good use case for systemd
without it.

> And if there's the will to drop the legacy /var/lock directory, then
> packages like?uboot-tools should?be configured or
> patched to use /run/lock, and that directory should exist for all init
> systems [2].

I also stumbled into this issue when switching to 2020.08. And for now I
have an additional tmpfiles directive.
Nevertheless I'm strongly in favor of patching u-boot. But I'm not sure
how upstream sees it.

As "quickfix" I would tend to option 1. I saw it done elsewhere. But
this would require tmpfiles...


Regards,
Michael
