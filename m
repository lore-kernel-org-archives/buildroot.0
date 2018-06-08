From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 8 Jun 2018 23:06:41 +0200
Subject: [Buildroot] [PATCH] fs: allow extra arguments to common tarball
 extraction
In-Reply-To: <5f35f9b5-e308-3fff-138d-07f7b814fdd1@mind.be>
References: <20180603022145.14222-1-casantos@datacom.com.br>
 <20180605172345.GB29058@scaer>
 <625048322.1426556.1528289177741.JavaMail.zimbra@datacom.com.br>
 <20180606185136.GA2537@scaer>
 <81235112-f5f8-dbed-ac99-7942c003b898@mind.be>
 <20180608171941.GC2090@scaer>
 <5f35f9b5-e308-3fff-138d-07f7b814fdd1@mind.be>
Message-ID: <20180608210641.GF2090@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Carlos, All,

On 2018-06-08 21:59 +0200, Arnout Vandecappelle spake thusly:
> On 08-06-18 19:19, Yann E. MORIN wrote:
> > On 2018-06-07 23:03 +0200, Arnout Vandecappelle spake thusly:
> >> On 06-06-18 20:51, Yann E. MORIN wrote:
> >>> But my position has always been consistent on this topic: the images
> >>> that Buildroot generates only ever covers just "basic" situations, using
> >>> a single-filesystem layout. Anything that needs to do a multi-filesystem
> >>> layout should be done as a new filesystem. Doing it in a new filesystem
> >>> is much more flexible than whatever kconfig option we may ever add. And
> >>> since we already have this wonderful flexibility, I don't think it makes
> >>> sense to add a new option that duplicates only a very limited subset of
> >>> that flexibility. That duplication is not good, IMNSHO...
> >>
> >>  There is (in my even less humble opinion) one way that we can solve this
> >> generically: by adding a genimage filesystem. genimage is able to create
> >> separate filesystem images for subtrees. so it can cover many use cases in a
> >> generic way.
> >>
> >>  There are probably a few gotchas, but I still believe it should be possible.
> > 
> > Like tweaking the /etc/fstab accordingly, which genimage does not do on
> > its own?
> 
>  No, we don't want to tweak fstab. There is no way to know if you want things to
> be mounted in that particular way, and whether it should be mounted
> automatically, and if some flags are needed, and so on.

Right, fstab was just an example of site-specific tweaks to be done.
Others may want to use startup scripts or systemd units to do the
mounts, or to format a partition and rxtract a factory-defaults tarball
in that filesystem, or get that from The Cloud, or whatever.

Waht I mean is that splitting the filesystem is easy. What is not easy
is that each part thus split can be in different formats, located in so
different locations, retrieved and accessed in so many different ways,
that we can't possibly imagine, and much less cover in a generic way.

The only way we can allow people to do what they want, is by providing
them with a per-filesysem target/ directory already prepared that they
can arrange at will.

And as an example of a split-var filesytem, see the attached br2-external
tree. It ultimagtely creates $(BINARIES_DIR)/rootfs.meh, a squashfs
image of /) and $(BINARIES_DIR)/rootfs.meh-var.tar, a tarball of /var.
The only missing pieve is the runtime startup scripts that will format
the on-board partition, extact /var.tar in there, and mount it.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
-------------- next part --------------
A non-text attachment was scrubbed...
Name: br2-multi-fs.tar.gz
Type: application/x-tar-gz
Size: 834 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180608/fe0c1969/attachment.bin>
