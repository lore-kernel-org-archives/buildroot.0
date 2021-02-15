From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Feb 2021 23:01:24 +0100
Subject: [Buildroot] Handling delays in network interface visibility in
 Raspberry Pi 3
In-Reply-To: <0A92E09A-3361-429E-AE65-E12223E0E62B@grondman.net> (Ivo
 Grondman's message of "Mon, 15 Feb 2021 17:34:14 +0100")
References: <0A92E09A-3361-429E-AE65-E12223E0E62B@grondman.net>
Message-ID: <87r1lh9eiz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ivo" == Ivo Grondman <buildroot@grondman.net> writes:

 > Hi all,
 > Today I?ve been trying to debug the following issue. Using Buildroot
 > 2020.11.2 and the Vagrantfile that comes with it, I tried to build a
 > ?vanilla? Buildroot image in the vagrant VM for my Raspberry Pi 3
 > Model B+ in the following way:

 > $ make raspberrypi3_defconfig
 > $ make

 > i.e. without any customisation. The image builds fine and the Pi boots
 > without errors or warnings, but the network interface eth0 (configured
 > with DHCP) will not have an IPv4 address and I manually have to
 > perform an `ifup -a` or `ifup eth0` to get it going. So I went through
 > all the initialisation files that have a part in bringing up the
 > network interface and soon came to conclude that the script in
 > /etc/network/if-pre-up.d/wait_iface has the right intentions, but
 > still doesn?t solve the slow-to-appear interface issue.

 > It looks as if that particular script still needs to wait just that
 > bit longer when it sees that /sys/class/net/eth0 exists before
 > actually exiting. Using the file as is will not make eth0 retrieve an
 > address from the DHCP server, but if I add a bit of extra sleep in the
 > if-statement where it detects the presence of /sys/class/net/eth0 then
 > it *will* work.

The script simply waits for the interface to become available (E.G. for
the USB connected interface to be detected by the kernel).

I guess your problem is that the device (and/or whatever you have
connected at the other end of the cable) is too slow to negotiate a
link, so the DHCP client send the DHCP requests too soo and gives up
before the link comes up.

You should normally see output in the kernel log and the serial console
when a link is detected.


 > Now my problem with this approach is that it feels like a
 > hack. Moreover, I?d like to know if something else could be the issue
 > here. So:

 > 1) Did anyone of you experience similar issues with a Raspberry Pi?

I haven't personally.


 > 2) Are there any alternative, better solutions to this problem?

The classical way of waiting for the network link to come up is ifplugd:

http://0pointer.de/lennart/projects/ifplugd/

Notice: for a slow-to-be-detected-by-the-kernel interface like the USB
connected ethernet on the raspberrypi you will need to use the -M
option to be able to start ifplugd before the kernel has detected eth0:

http://0pointer.de/lennart/projects/ifplugd/ifplugd.8.xml

-- 
Bye, Peter Korsgaard
