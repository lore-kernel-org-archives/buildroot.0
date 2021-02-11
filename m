From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 11 Feb 2021 21:58:18 +0100
Subject: [Buildroot] [PATCH 1/2] package/netopeer2: set
 SYSREPO_SHM_PREFIX and cleanup shm files after installation
In-Reply-To: <e3a208c6-a577-4057-8c42-fbdf9f0c2196@cesnet.cz>
References: <20210206105736.29429-1-heiko.thiery@gmail.com>
 <20210207123946.14105766@gmx.net>
 <e3a208c6-a577-4057-8c42-fbdf9f0c2196@cesnet.cz>
Message-ID: <CAEyMn7YdqqLuKLggm-zOZjpCL_usodVXR8583e6EQctxF6kySQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jan,

Am Do., 11. Feb. 2021 um 14:56 Uhr schrieb Jan Kundr?t <jan.kundrat@cesnet.cz>:
>
> On ned?le 7. ?nora 2021 12:39:46 CET, Peter Seiderer wrote:
> > Still the question, are the shm files needed at runtime? If so they should
> > belong in the target directory (or created by a startup script), of not why
> > create them at first (why not skip the setup.sh/sysrepoctl step)? Are there
> > any other products/output of the setup.sh/sysrepoctl step?
> >
> > The setup.sh is called with the following environment variables:
> >
> >       NP2_MODULE_DIR /usr/share/yang/modules/netopeer2
> >       NP2_MODULE_PERMS 600
> >       NP2_MODULE_OWNER seiderer
> >       NP2_MODULE_GROUP users
> >
> > A (quick) strace check of setup.sh run shows no other output
> > than the shm files...
>
> Disclaimer: While I work for the same company as the sysrepo+netopeer2
> maintainers, I'm not upstream. On the other hand, we've been using
> sysrepo+netopeer2 on ARM via Buildroot for a few years. Here's what we're
> doing. Our use case is having a common buildroot build image for several
> appliances that each use a slightly different set of YANG modules. We also
> have a read-only rootfs, with a separate partitions for stateful data, and
> we're using the A/B boot slots via RAUC.
>
> Our first attempt was persisting the /etc/sysrepo directory across system
> updates. That did not work well because of some version bumps of internal
> modules. Also, the current build scripts upstream can cope with partial
> state in /etc/sysrepo, but that does not help for buildroot because the
> state at the build time is very different from the state at the boot time.
> In my experience the errors were not intuitive, and the fact that
> /etc/sysrepo contains binary LYB files does not help here.
>
> In our current approach, we do not install any YANG modules at build time
> -- not even for Netopeer2-server. Instead, we're using a series of systemd
> units:
>
> - The first one prepares a tmpfs for /run/sysrepo that we're using instead
> of /dev/shm. This is important for us because the SHM code in sysrpeo has
> been (so far) showing rather serious bugs, and it occasionally helps to
> just start from scratch without a reboot. We're using also addiing a few
> stanzas to any service which uses sysrepo: BindsTo=run-sysrepo.mount,
> After=run-sysrepo.mount, PartOf=run-sysrepo.mount, and a PartOf=$${UNIT}
> for each of this unit in a drop-in file for the run-sysrepo.mount unit
> file.
>
> - Then we call netopeer2's shell script for installing the required YANG
> modules. That's the same shell script which upstream would regularly use at
> the install time. This only installs some models, there's no configuration.
>
> - Then we call our internal shell script which decides what
> application-specififc YANG modules should be installed, and installs them.
> Some of these modules require initial "factory" data (and they would not
> pass validation if they were left empty), so these are installed as well.
> It is critical that nothing runs in parallel to these.
>
> - The we restore configuration from the previous reboot, if any. That's a
> simple `sysrepocfg -d startup -f json --import=/cfg/sysrepo/startup.json`
> followed by `sysrepocfg -C startup`.
>
> - Then we apply the NACM rule set -- we have some systemwide YANG modules
> and an app that processes them for authentication, FW updates, etc, which
> have to be ACL-limited.
>
> - The we check if the Netopeer2 server already has a listening endpoint
> configured via the sysrepo database content. There are essentially three
> possible scenarios:
>
>   1) There's been no persistent configuration to restore from the last
> boot. In that case, a new configuration should be provisioned.
>
>   2) There's been some configuration that we restored earlier, and it
> contains a <listen> endpoint or a <call-home> endpoint. If that's the case,
> good, we're done here.
>
>   3) Otherwise, there's been some config, but the NETCONF service has no
> listening endpoints configured. In that case, run the configuration scripts
> from upstream.
>
>   In options 1) and 3), we run upstream's merge_hostkey.sh and
> merge_config.sh scripts. These actually generate an SSH server host key, so
> they cannot possibly run during buildroot build time.
>
> - Everything is configured, so we can start launching various services
> which use sysrepo.
>
> - Finally, there's a horribly inotify script which snapshots the
> configuration for the next boot: `while true; do inotifywait -e CLOSE_WRITE
> /etc/sysrepo/data/*.startup && mkdir -p /cfg/sysrepo/ && sysrepocfg -d
> startup -f json -X > /cfg/sysrepo/startup.json; done`
>
> Our buildroot config for Netopeer2 is available here:
> https://gerrit.cesnet.cz/plugins/gitiles/github/buildroot/buildroot/+/refs/heads/cesnet/2021-01-11/package/netopeer2/
> . The scaffolding around that is, unfortunately, not public at this point,
> but I'll see if I can contribute the key parts over the next months
> (realistically, April is the soonest one).

Sounds great!

> Now, to the question asked in this thread about what "installing a YANG
> file" actually performs in sysrepo, and what the SHM files are. The SHM
> files serve two purposes, hte first one is synchronizing access when
> multiple processes are accessing sysrepo. In the past sysrpeo versions,
> this would be the `sysrepod` process which is long gone. The second purpose
> of the SHM files are keeping track of data in the "running datastore".
> That's a term from the YANG/NETCONF/RESTCONF/NMDA series of RFCs, the TL;DR
> version is that when the system boots, the content of the persistent
> configuration is copied to the "running configuration". Often, the system
> would react to changes in "running" imemdiately, while changes to "startup"
> are only applied later, but it can be more complex, see RFC 8342 and enjoy
> the list of optional features and conditional behavior if you're bored.
>
> Based on our experience, we've decided that installing YANG modules at
> build time is *not* a feasible path forward. If you insist on getting this
> working, then I strongly suggest using a single location outside of build/
> and per-package/ directories -- introduce a new one, build host-sysrepo
> with the repo path pointing there, and in the rootfs-finalize hook, copy
> its content to target/etc/sysrepo. There will still be races, and having
> per-package SHM directories would open a whole new can of worms.
>
> The drawbacks of our current approach is that we're matinaining a single
> shell script that contains a list of modules to install, and these modules
> often belong to different packages, so it's inelegant. I can imagine
> improving this via agreeing on a single location where packages would drop
> their installation scripts in. Still, to support the R/O rootfs +
> perisstent-config-somewhere-else scenario, one will need at least two
> directories. It might work like this:
>
> - /usr/share/sysrepo/install-yang/*.sh , these files provided by packages
> invoke `sysrepoctl` and `sysrepocfg` to install various YANG files, enable
> YANG-level features in them, and provide the initial "factory" data
>
> - /usr/share/sysrepo/configure-yang/*.sh, these hooks are once again
> provided by packages, and they perorm some sanity checks to make sure
> there's a viable configuration. This is where the netopeer2-server would
> create its SSH key. Another candidate are NACM rules from extra packages.
>
> In between these two hooks that's the time where the configuration could be
> restored for those users like me who have a r/o rootfs.
>
> Hope this helps at least a bit.

Thank you for this detailed explanation. I have to admit that I use
the packages for sysrepo/netopeer2 in a not that mature fashion like
you.

I understand your concerns not to do the installation at build time.
But without that currently it is not that easy to get a working
installation and it would be hard for users of this package to get it
up and running. So my idea is to have the module installation optional
in the first step. With that we can switch between having an out of
the box working netopeer2 installation and the possibility to do the
configuration/installation at startup like you explained above.

Thank you very much.

-- 
Heiko
