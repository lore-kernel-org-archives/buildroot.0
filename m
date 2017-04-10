From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Apr 2017 23:57:00 +0200
Subject: [Buildroot] Building multi-part rootfs images
In-Reply-To: <CA+h8R2ofinZ+3yGzNOCtfM5KDSrxeizyEVAKTYv2v24DbEPzkw@mail.gmail.com>
References: <CA+h8R2ofinZ+3yGzNOCtfM5KDSrxeizyEVAKTYv2v24DbEPzkw@mail.gmail.com>
Message-ID: <c764d6cf-eaf1-154f-2ece-cd9bdff881fd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-04-17 23:45, Christian Stewart wrote:
> Hi Thomas, all:
> 
> I'm building OS images with Buildroot using the "rootfs cpio" approach, where
> the entire OS is loaded into RAM as an initramfs. 
> 
> I like this approach a lot, especially when it comes to reliability, but I'm
> running into issues with the size of the image impacting the boot time, since
> obviously the entire boot is stalled until the image is loaded into memory.
> 
> I'm now interested in doing something like:
> 
>  - Load minimal initramfs
>  - Loop-mount /lib/modules from a second image, deferring the "copy-to-memory"
> for kernel modules until they are actually probed on demand.

 Loop-mount? It should be a normal mount, no?

> 
> What do you think the best way to do this would be? Turn off all of Buildroot's
> rootfs build steps and make my own post-build step? Is this possible, fitting
> within the Buildroot rootfs mechanisms? Is this approach worth integrating into
> Buildroot in some way?
> 
> Any suggestions you may have would be greatly appreciated.

 OK, we clearly need to make a FAQ entry about this :-)

 There are several options:

- overlayfs (or unionfs or aufs) and mount two filesystems really on top of each
other. Needs a kind of complicated switch-root script in /init.

- mounting specific subdirs. Quite easy to implement:

  - in post-build, move away the subdirs you want to mount from somewhere else
to a temporary directory. E.g., mv $TARGET_DIR/lib/modules $BINARIES_DIR/modules;

  - add a genimage.cfg that makes some filesystem out of $BINARIES_DIR/modules;
the same genimage.cfg can also put the rootfs.cpio and zImage somewhere where
the bootloader can find it;

  - call genimage.sh as a post-build script;

  - in your rootfs overlay, add /etc/fstab that mounts the filesystem.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
