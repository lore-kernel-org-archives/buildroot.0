From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 18 Sep 2015 18:37:16 +0200
Subject: [Buildroot] [RFC 3/6] system: add mdev-only /dev management
 (without devtmpfs)
In-Reply-To: <87fv2fvp5m.fsf@dell.be.48ers.dk>
References: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
 <1441747734-18730-4-git-send-email-luca@lucaceresoli.net>
 <55EFF9FF.1020402@mind.be> <55F02630.5050500@lucaceresoli.net>
 <20150909155427.53f9c8b5@free-electrons.com>
 <87bnd43eph.fsf@dell.be.48ers.dk>
 <20150914233402.3575da80@free-electrons.com>
 <87zj0oznp2.fsf@dell.be.48ers.dk>
 <20150915093030.622d2366@free-electrons.com>
 <87zj0oumrg.fsf@dell.be.48ers.dk>
 <20150915114159.758baca9@free-electrons.com>
 <87k2rrvqlh.fsf@dell.be.48ers.dk> <55F80E9C.7070208@mind.be>
 <87fv2fvp5m.fsf@dell.be.48ers.dk>
Message-ID: <55FC3DBC.1080800@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter,

Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>
> Hi,
>
>   > On 15-09-15 14:01, Peter Korsgaard wrote:
>   >> Or alternatively, extend the S10mdev logic to detect that it need to
>   >> create a tmpfs on /dev (by looking for devtmpfs in /proc/filesystems or
>   >> detecting that /dev is RO) and have all the fixup there. That way it
>   >> atleast doesn't add any more complications to the rest of Buildroot /
>   >> users.
>
>   >  That's a great idea, because it actually simplifies the buildroot code (no
>   > longer needed to force devtmpfs in the kernel when mdev is selected).
>
>   >  To detect, it's as simple as:
>
>   > if [ "$(cut -d ' ' -f 2,3 /proc/mounts | sed -n '/^\/dev /s///p')" != devtmpfs ]
>
> Or simply 'grep -q devtmpfs /proc/filesystems'. It doesn't check if /dev
> is really a devtmpfs, but as we force DEVTMPFS_MOUNT=y (and the cpio
> init wrapper) that is probably good enough.
>
> For mdev, I think it makes more sense to check if /dev is writable, as
> that is the really what mdev requires (E.G. we could be in an initramfs
> on a <2.6.32 kernel or similar.
>

Theoretically correct, but having a dynamic /dev management on flash
storage seems a very bad idea.

In addition, i'm not sure I can write a good test to check whether it's
writable. [ -w /dev] does not consider if the filesystem is mounted
read-only. Checking if "/" has the "ro" option in /proc/mounts can be
done. But I'm not sure there are other possible configuration that make
/dev not writable for other reasons. SELinux maybe?

Mmh, overall I think the best idea is to base mdev either on devtmpfs
or on a generic tmpfs. It's more or less what Arnout's test does, except
it does not take into account the case where a tmpfs (but not devtmpfs)
is already mounted. But this should happen only if a user tweaks inittab
to do so.

-- 
Luca
