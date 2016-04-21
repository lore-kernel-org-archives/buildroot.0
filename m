From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 22 Apr 2016 00:09:43 +0200
Subject: [Buildroot] rootfs overlay best practices
In-Reply-To: <CAF_dkJDPv-Z6AW8u-AsTukovBhMNLR0q-1326qOxi7RfFtBL7A@mail.gmail.com>
References: <CAF_dkJDPv-Z6AW8u-AsTukovBhMNLR0q-1326qOxi7RfFtBL7A@mail.gmail.com>
Message-ID: <57194FA7.3020803@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/21/16 16:24, Patrick Doyle wrote:
> Rather than invent my own, I thought I would query the list first.
>
> NOTE: This post does not refer to the root file system overlay one can
> use to customize the build process.  I am looking for information
> regarding non-volatile storage of configuration data.
>
> So here is the situation.  I have compiled my (very tiny!) rootfs into
> my kernel and boot with that as my rootfs.  But I would like to allow
> myself the luxury of making changes to the rootfs by overlaying
> non-volatile storage over the rootfs, or, perhaps over selected
> portions of the rootfs.
>
> How do folks typically manage this?
>
> I could mount my overlay nonvolatile storage right at / (I think... I
> haven't actually tried this yet!) and I think that means that any
> change I make to the running system will be preserved.  But there are
> probably some weird issues with mount points and such.

  Well, no, that doesn't work actually. The underlying initramfs would be hidden 
completely, so your overlay would need to contain a full rootfs as well. And 
this is wasteful because the initramfs would still occupy memory while it can't 
be used anymore. So what usual systems do is to pivot_root from the initramfs to 
the final rootfs. But don't think that that's what you want to do.

>
> Or, I could mount my overlay storage someplace like /config, create
> symlinks from selected (or all?) files in /etc to /config/etc, and
> thus be able to modify e.g. /config/etc/hostname to change the name of
> my device.  It seems like it would be pretty straightforward to write
> a post-build script that duplicates /etc into /config/etc and replaces
> the files in /etc with symlinks.

  Yes, but this doesn't allow you to overwrite/add files at will, only the files 
that you decided at build time that can be overridden. Also, you still have to 
pre-populate your writable storage with the original version of those files.

>
> Or I could overthink this too much and perhaps I should just stop here
> and seek the wisdom of the community.  This is the option I have
> selected :-)

  The usual approach is an overlayfs. Given the subject of this mail, I thought 
you'd already know about it :-) It's been upstream since 3.10 [1]. You basically 
mount a layered filesystem, specifying the lower layer (= your initramfs) and an 
upper layer (= the writable overlay). Any file you write will be written to the 
upper layer, the lower layer stays unaffected. You can also delete files etc. as 
you like.

  The Arch wiki, as is often the case, has the best documentation. [2]

  Unfortunately, using this is a rootfs is not so trivial, because you can't use 
it as the boot-time rootfs. So you have to make an init script that builds the 
overlay and then pivot_roots it. Or limit it to a subdirectory (e.g. /etc). Or 
symlink the important bits into the overlayfs mountpoint.


  As an alternative to overlayfs, you can also use unionfs-fuse. It's a 
userspace (FUSE) implementation of the same concept. Useful for older kernels.


  Generally, I prefer your second approach: symlinking the relevant 
files/directories to a config partition, because that gives you tight control 
about what is writable. You can combine that with a script that formats the 
writable partition if it doesn't exist and prepopulates it with the initramfs 
version of the config partition. The only problem there is when you do an update 
of the initramfs and it has a new config entry which doesn't exist yet in the 
writable partition.


  Regards,
  Arnout


[1] https://lwn.net/Articles/542707/
[2] https://wiki.archlinux.org/index.php/Overlay_filesystem


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
