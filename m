From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Apr 2016 22:07:03 +0200
Subject: [Buildroot] Bluetooth BCM20702A1
In-Reply-To: <5724F1FF.7070408@gmail.com> (Marco Trapanese's message of "Sat, 
 30 Apr 2016 19:57:19 +0200")
References: <5724F1FF.7070408@gmail.com>
Message-ID: <87lh3usvx4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marco" == Marco Trapanese <marcotrapanese@gmail.com> writes:

 > Hi!
 > Does buildroot provide the firmware for this common USB/BT dongle?
 > I'm running the latest version on an RPi3.
 > Here the output of dmesg:

 >> [    3.126672] usb 1-1.2: Product: BCM20702A0
 >> [    4.435485] Bluetooth: hci0: BCM20702A
 >> [    4.442507] Bluetooth: hci0: BCM20702A1 (001.002.014) build 0000
 >> [    4.442572] bluetooth hci0: Direct firmware load for
 >> brcm/BCM20702A1-0a5c-21e8.hcd failed with error -2
 >> [    4.442579] Bluetooth: hci0: BCM: Patch
 >> brcm/BCM20702A1-0a5c-21e8.hcd not found

It seems it is not available in linux-firmware:

find build/linux-firmware-b0668886def608d352cd0263a7ef04e64e25574a \
     -name BCM20702A1-0a5c-21e8.hcd

According to this bugreport:

https://bugzilla.redhat.com/show_bug.cgi?id=1275122

It is indeed not available in linux-firmware. The bugreport does refer
to places where you can download the firmware, but it is not clear what
license it is available under and if we are allowed to redistribute it.

Judging from the kernel commits to this driver it sounds like it should
be usable without firmware though:

commit ad750fa142747f3f42b66ae051a0f275bd2035df
Author: Petri Gynther <pgynther@google.com>
Date:   Wed Feb 10 12:00:46 2016 -0800

    Bluetooth: btbcm: Fix handling of firmware not found

    If the call to request_firmware() fails in btbcm_setup_patchram(),
    the BCM chip will be operating with its default firmware.

    In this case, btbcm_setup_patchram() should not return immediately
    but instead should skip to btbcm_check_bdaddr() and quirk setup.

    Signed-off-by: Petri Gynther <pgynther@google.com>
    Signed-off-by: Marcel Holtmann <marcel@holtmann.org>

But that commit is probably not present in the rpi kernel yet.


 > The dongle works fine with Raspbian Jessie.
 > If you need other information, please feel free to ask!

It would be interesting to know where they get the firmware from. Can
you check what package provides the file?

-- 
Bye, Peter Korsgaard
