From: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
Date: Mon, 27 Jan 2014 21:17:05 -0200
Subject: [Buildroot] [PATCH] fs/ubi: add option to use custom volume
 config file
In-Reply-To: <20130915211647.6354ea34@skate>
References: <1379215295-1805-1-git-send-email-danomimanchego123@gmail.com>
 <20130915200014.5543b2a1@skate>
 <CANxTyt4GZNTtACwf4W8OCKUBZLf7YfZ=pBM-6KGmgeaf8UCPLg@mail.gmail.com>
 <20130915205310.06f8af50@skate>
 <CANxTyt6uuGy0aYis_SG49KjXjoC=sMWMgTEytTMrhGXifimjYw@mail.gmail.com>
 <20130915211647.6354ea34@skate>
Message-ID: <CAAEAJfCF=36ET_QAO9fVZdcYRKcFUC96KChKbBO9W=KewL5cXA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas and Danomi,

On 15 September 2013 16:16, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
[...]
> On Sun, 15 Sep 2013 15:08:28 -0400, Danomi Manchego wrote:
>
>> That does appeal to me; I think that we can combine the cp and the sed
>> lines as well ...
>>
>>          $(SED) 's/BR2_ROOTFS_UBIFS_PATH/$@fs/'
>> $(UBINIZE_CONFIG_FILE_PATH)  >  $(BUILD_DIR)/ubinize.cfg
>
> That won't work. $(SED) expands to sed -e -i, i.e it does the sed
> in-place.
>

What's the status of this? It would be interesting to pick it up.

I'm currently using a post-image script to create UBI images (using ubinize).
On the other side, I'm not using ubifs but rather squashfs on top of
ubiblock [1].

I was thinking about keeping the post-image script approach, which
means I need host mtd/ubi tools.

Thomas: Do you think adding mtd/ubi host tools is a sane approach?
Something like what Yann recently did for squashfs [2].

Speaking of Yann's, I've also considered an extension of his fs/custom work.
Yann: How do you think that would fit? Ideas?

Just for reference, here's how my post-image script looks like:

# Create UBI rootfs stuff
#
mkdir -p board/ppst/linux/user
fallocate -l 10M board/ppst/linux/user/vfat.img
mkfs.vfat board/ppst/linux/user/vfat.img
mkfs.ubifs -r board/ppst/linux/user/ -m 2048 -o user.ubifs -e 126976 -c 100
mkfs.ubifs -r board/ppst/linux/config/ -m 2048 -o config.ubifs -e 126976 -c 100
ubinize -o output/images/rootfs.ubi.img -p 128KiB -m 2048 -O 2048
board/ppst/linux/ubinize-rootfs.cfg
rm user.ubifs config.ubifs

# Create UBI kernel
#
ubinize -o output/images/linux.ubi.img -p 128KiB -m 2048 -O 2048
board/ppst/linux/ubinize-linux.cfg

[1] http://git.free-electrons.com/users/ezequiel-garcia/linux/log/?h=ubiblock-v4-cache-optional
[2] http://patchwork.ozlabs.org/patch/306629/
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
