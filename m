From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Mon, 15 Feb 2021 19:26:07 +0100
Subject: [Buildroot] Handling delays in network interface visibility in
 Raspberry Pi 3
In-Reply-To: <0A92E09A-3361-429E-AE65-E12223E0E62B@grondman.net>
References: <0A92E09A-3361-429E-AE65-E12223E0E62B@grondman.net>
Message-ID: <65c31b84-5e66-f1a9-ac20-d22fafe062e8@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/02/2021 17:34, Ivo Grondman wrote:
> Hi all,
> 
> Today I?ve been trying to debug the following issue. Using Buildroot 2020.11.2 and the Vagrantfile that comes with it, I tried to build a ?vanilla? Buildroot image in the vagrant VM for my Raspberry Pi 3 Model B+ in the following way:
> 
> $ make raspberrypi3_defconfig
> $ make
> 
> i.e. without any customisation. The image builds fine and the Pi boots without errors or warnings, but the network interface eth0 (configured with DHCP) will not have an IPv4 address and I manually have to perform an `ifup -a` or `ifup eth0` to get it going. So I went through all the initialisation files that have a part in bringing up the network interface and soon came to conclude that the script in /etc/network/if-pre-up.d/wait_iface has the right intentions, but still doesn?t solve the slow-to-appear interface issue.
> 
> It looks as if that particular script still needs to wait just that bit longer when it sees that /sys/class/net/eth0 exists before actually exiting. Using the file as is will not make eth0 retrieve an address from the DHCP server, but if I add a bit of extra sleep in the if-statement where it detects the presence of /sys/class/net/eth0 then it *will* work.
> 
> Now my problem with this approach is that it feels like a hack. Moreover, I?d like to know if something else could be the issue here.

I'm curious.

Could you try to:
- Enable the iproute2 package (BR2_PACKAGE_IPROUTE2) and compile it.
- Modify wait_iface to add "ip -t monitor > /tmp/ip_monitor.log &" 
before the loop. And disable your hack.
- Let it boot, then kill the "ip" process.
- Report the content of /tmp/ip_monitor.log ? It will contain a log of 
everything that happened to network interfaces.
