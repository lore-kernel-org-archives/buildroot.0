From: AAlex_ <earthquake.de@freenet.de>
Date: Thu, 1 Feb 2018 05:57:14 -0700 (MST)
Subject: [Buildroot] Further partition creation with genimage fails
In-Reply-To: <87inbh3tbr.fsf@dell.be.48ers.dk>
References: <1517473948652-0.post@n4.nabble.com>
 <87inbh3tbr.fsf@dell.be.48ers.dk>
Message-ID: <1517489834363-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
enabled loglevel 2 in genimage, 
the data.ext4 is given as a further argument to genext2fs
genext2fs -d
<DIR>/buildroot2017.11rc/pc_x86_64_efi_defconfig/output/build/genimage.tmp/root
--size-in-blocks=131072 -i 16384
<DIR>/buildroot2017.11rc/pc_x86_64_efi_defconfig/output/images/data.ext4

But as you mentioned i will not longer use the genext2fs tool, so what i
did:
Editing  board/pc/post-image.sh, added following:
/dd if=/dev/zero of=${BINARIES_DIR}/data.ext4 bs=124M count=1
mkfs.ext4 -F ${BINARIES_DIR}/data.ext4
echo "created: ${BINARIES_DIR}/data.ext4"
/

And keep just the partition data{} ]entry in the board/pc/genimage-efi.cfg:
/partition data {
    partition-type = 0x83
    image = "data.ext4"
  }/

This works fine...and no further dependency on genext2fs tool.

So i dont need BR2_PACKAGE_HOST_GENEXT2FS anymore.

Regards,
AAlex



--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
