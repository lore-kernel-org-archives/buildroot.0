From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 23 Oct 2017 22:23:10 +0200
Subject: [Buildroot] Multiple root filesystems for single
	kernel/toolchain
In-Reply-To: <f5e13782-3ec4-1b63-ef4f-df269bfe8e9f@lynx.com>
References: <f5e13782-3ec4-1b63-ef4f-df269bfe8e9f@lynx.com>
Message-ID: <43ed600f-f03b-da68-4f2d-8931b40bbe41@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-10-17 21:59, Seamus Connor wrote:
> I have a system with a few unique restrictions.? It has low memory, and its bulk
> storage device is not available until some bits have been flipped in the
> hardware.? What I would like to do is:
> 
> 1) Create a bzImage with a baked in minimal initramfs.
> 
> 2) Create a larger squashfs that is stored in MMC.
> 
> What is the best procedure to create multiple file systems w/ buildroot?? Would
> I just have two separate configs that specify different packages?

 Indeed, that's the way to go. This also allows you to specify completely
different build options. For example, you might want to go for a uClibc
statically linked toolchain in the initramfs and a glibc- or musl-based
toolchain in the full rootfs.

 However, if all you need is a to toggle a few bits and to wait until the device
is available, you might even get away with a simple C program that does that,
mounts the rootfs, does a pivot_root(), and exec()s /sbin/init. Then you make a
cpio archive with just that executable. Perhaps more work but you're very sure
that it's small :-)


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
