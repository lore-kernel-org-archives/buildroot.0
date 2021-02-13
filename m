From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Feb 2021 16:24:57 +0100
Subject: [Buildroot] [PATCH-NEXT 4/4] linux: build after linux-firmware
 if enabled for early loading support
In-Reply-To: <20210213132650.GT1679218@scaer> (Yann E. MORIN's message of
 "Sat, 13 Feb 2021 14:26:50 +0100")
References: <20210212184049.13202-1-peter@korsgaard.com>
 <20210212184049.13202-5-peter@korsgaard.com>
 <20210213101326.GR1679218@scaer> <87sg60cl73.fsf@dell.be.48ers.dk>
 <20210213132650.GT1679218@scaer>
Message-ID: <87o8goc7na.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> Yes, but that you can take care of in linux config file/fragment. We
 >> already expose BR2_BINARIES_DIR in the environment for this, E.G. you
 >> can do:
 >> 
 >> CONFIG_EXTRA_FIRMWARE_DIR="${BR_BINARIES_DIR}"
 >> CONFIG_EXTRA_FIRMWARE="intel-ucode/06-5e-03 i915/kbl_dmc_ver1_04.bin"
 >> 
 >> (or whatever files you want to include).

 > But don't we want to make that seamless for the user? If they don't have
 > CONFIG_EXTRA_FIRMWARE=y, then setting CONFIG_EXTRA_FIRMWARE_DIR is a
 > no-op.

I would argue not. There is a cost to every kernel config override we
make (E.G. maintenance but also the confusion it leads to when you have
a config saying A but you end up with B because Buildroot tries to be
clever). It is not because you have linux-firmware enabled that there
couldn't be a use case for wanting to point CONFIG_EXTRA_FIRMWARE_DIR to
other firmware files (E.G. some custom firmwares in your board directory
or similar).


 > I think it is not obvious for a user to know that they can use
 > ${BR_BINARIES_DIR} in their kernel defconfig/fragment: this is
 > documented nowhere. Also, with the BR_ (not BR2_) prefix, it is in
 > that namespace which we intedned to be reserved (but that we never
 > enforced) for internal, non-public variables...

True. It dates back to 2015:

Author: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Date:   Tue Feb 3 15:21:48 2015 +0100

    linux: avoid unnecessary changes in defconfig for INITRAMFS_SOURCE

 >> NIT: Only ${BR_BINARIES_DIR}, not a linux-firmware subdir, otherwise you
 >> cannot include both microcode and linux-firmware files.

 > Meh.. That's not nice, because then it means BINARIES_DIR is clutterred
 > by all those firmware files.

True, but BINARIES_DIR is already like that today, only a few packages
use a subdir.

 > Also, intel-microcode is in a sub-directory, and will make it less easy
 > for users to find the file(s) they will actually have to flash on their
 > devices...

Yes and no. intel-microcode indeed installs its (flat tree of) files
under intel-ucode, but that directly matches what the kernel looks for
(intel-ucode/<file>). Likewise, the kernel looks for the i915 firmware
under i915/<file>, so to match the expectations of the kernel we will
need to install the linux-firmware files (E.G. the i915 directory)
directly in BINARIES_DIR.

Or alternatively move the intel-microcode AND linux-firmware files into
a sub directory like $BINARIES_DIR/firmware/intel-ucode/<file>), but I
am not sure if that is any nicer and it is perhaps not clear exactly
what belongs under firmware/ and what doesn't.

-- 
Bye, Peter Korsgaard
