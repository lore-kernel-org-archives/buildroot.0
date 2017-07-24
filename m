From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Jul 2017 00:23:48 +0200
Subject: [Buildroot] [PATCH 18/20] fs: add pre- and post-command hooks
In-Reply-To: <20170724160123.GE2918@scaer>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <9ad47b5d1b91f4c74c62b01fb37b75d85c23a9ca.1500398733.git.yann.morin.1998@free.fr>
 <1a767f33-47a3-5ab6-ed40-00e2bfa31da8@mind.be> <20170723141744.GI26998@scaer>
 <d549596f-af21-640b-4196-fcc96557c14c@mind.be> <20170724160123.GE2918@scaer>
Message-ID: <69f1e791-65e9-2e22-59f1-d5959e569d88@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-07-17 18:01, Yann E. MORIN wrote:
> On 2017-07-23 23:51 +0200, Arnout Vandecappelle spake thusly:

[snip]
> So Thomas suggested that we apply the factory feature to all init
> systems. With systemd, it would be built-in (by mean of tmpfiles),
> while for the others we'd need some extra startup scripts to mount a
> tmpfs on /var and populate it.

 Hum-hum, I thought that the Buildroot rule was: we don't add features. If
someone needs the factory feature, they should use systemd (or s6 I believe also
has some kind of factory feature).

[snip]
>>  Can we create the symlink early in the build process, every time? I.e. run
>> SKELETON_SYSTEMD_POST_ROOTFS_VAR somehwere at the start of the build as well?
>> Only, I'm not sure where we could put it.
> 
> Hmm... Good point. I'll try to find a place. But I'm not sure that would
> be possible.

 "dependencies" is an option, but that's *really* dirty.

 Perhaps we can add a stamp file to TARGET_DIR/usr/share/factory, and then add
TARGET_DIR/var/stampfile as a dependency of dirs. If TARGET_DIR/var is an
(empty) directory, then TARGET_DIR/var/stampfile will not exist so the rule will
trigger.

 But there are a few problems with that:

- dirs is also "called" for legal-info, but legal-info doesn't otherwise create
a target directory;

- it would be natural for this stampfile to depend on skeleton-systemd (which
can then create the stampfile), but that would give a circular dependency.


> Maybe with the step-hooks, that are called very early for all steps, and
> then we'd use that to create the symlink if missing. But I do not like
> that too much...

 Meh, no, that would repeat the check for *every* package...


> I'll investigate.
> 
> In the meantime, I'll drop the read-only patches from the series, to
> avoid too much noise for now, and so we concentrate on the skeleton
> stuff for this release.

 I think it's better if you still include them:

- it doesn't hurt if they are part of the series but don't get applied;
- it gives some context about the direction in which we are going;
- it gives an opportunity to continue discussion on these patches.

 Even if you re-post with some changes NOT applied, just say so in the commit
message. Perhaps remove your Sob to make sure it doesn't get applied by
accident. Or remove it from patchwork.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
