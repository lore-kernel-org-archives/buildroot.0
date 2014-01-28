From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 28 Jan 2014 19:22:47 +0100
Subject: [Buildroot] [PATCH] fs/ubi: add option to use custom volume
 config file
In-Reply-To: <CAAEAJfCF=36ET_QAO9fVZdcYRKcFUC96KChKbBO9W=KewL5cXA@mail.gmail.com>
References: <1379215295-1805-1-git-send-email-danomimanchego123@gmail.com>
 <20130915200014.5543b2a1@skate>
 <CANxTyt4GZNTtACwf4W8OCKUBZLf7YfZ=pBM-6KGmgeaf8UCPLg@mail.gmail.com>
 <20130915205310.06f8af50@skate>
 <CANxTyt6uuGy0aYis_SG49KjXjoC=sMWMgTEytTMrhGXifimjYw@mail.gmail.com>
 <20130915211647.6354ea34@skate>
 <CAAEAJfCF=36ET_QAO9fVZdcYRKcFUC96KChKbBO9W=KewL5cXA@mail.gmail.com>
Message-ID: <20140128182246.GA3466@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2014-01-27 21:17 -0200, Ezequiel Garc?a spake thusly:
> Hi Thomas and Danomi,
> 
> On 15 September 2013 16:16, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> [...]
> > On Sun, 15 Sep 2013 15:08:28 -0400, Danomi Manchego wrote:
> >
> >> That does appeal to me; I think that we can combine the cp and the sed
> >> lines as well ...
> >>
> >>          $(SED) 's/BR2_ROOTFS_UBIFS_PATH/$@fs/'
> >> $(UBINIZE_CONFIG_FILE_PATH)  >  $(BUILD_DIR)/ubinize.cfg
> >
> > That won't work. $(SED) expands to sed -e -i, i.e it does the sed
> > in-place.
> >
> 
> What's the status of this? It would be interesting to pick it up.

IIRC, I have it in my tree somewhere...
I'll update and re-submit...

[--SNIP--]
> Thomas: Do you think adding mtd/ubi host tools is a sane approach?
> Something like what Yann recently did for squashfs [2].

I think it would be a good idea, since it is perfectly valid that a
post-build script wants to call the UBI tools.

> Speaking of Yann's, I've also considered an extension of his fs/custom work.
> Yann: How do you think that would fit? Ideas?

I don't know much about UBI, but I don't see why we could not add it to
the genimages infra.

> Just for reference, here's how my post-image script looks like:
> 
> # Create UBI rootfs stuff
> #
> mkdir -p board/ppst/linux/user
> fallocate -l 10M board/ppst/linux/user/vfat.img
> mkfs.vfat board/ppst/linux/user/vfat.img
> mkfs.ubifs -r board/ppst/linux/user/ -m 2048 -o user.ubifs -e 126976 -c 100
> mkfs.ubifs -r board/ppst/linux/config/ -m 2048 -o config.ubifs -e 126976 -c 100
> ubinize -o output/images/rootfs.ubi.img -p 128KiB -m 2048 -O 2048
> board/ppst/linux/ubinize-rootfs.cfg
> rm user.ubifs config.ubifs
> 
> # Create UBI kernel
> #
> ubinize -o output/images/linux.ubi.img -p 128KiB -m 2048 -O 2048
> board/ppst/linux/ubinize-linux.cfg

All you do above could probably be added easily to genimages, it seems.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
