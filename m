From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 16 Feb 2021 21:30:22 +0100
Subject: [Buildroot] Handling delays in network interface visibility in
 Raspberry Pi 3
In-Reply-To: <CALURroSp5ujNLUWY7PdggHv4bsA+gEkC6LHi-xYD59OrpGaFGw@mail.gmail.com>
References: <0A92E09A-3361-429E-AE65-E12223E0E62B@grondman.net>
 <CALURroSp5ujNLUWY7PdggHv4bsA+gEkC6LHi-xYD59OrpGaFGw@mail.gmail.com>
Message-ID: <20210216213022.7f3c7df1@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello *,

On Mon, 15 Feb 2021 15:33:57 -0800, Christopher McCrory <chrismcc@gmail.com> wrote:

> On phone so please excuse typos and brevity.
> 
> This is probably due to spanning tree (stp) on your switch. STP will delay
> forwarding traffic from 30 to 55 ish seconds. In this case the pi is just
> booting too fast. PCs have enough delays that you probably wouldn't notice
> this happening.  Add a sleep 56 before the ifup bit, if that solves
> the problem, stp it is.  If so, solved and done. Or if possible enable
> portfast on the swichport, this will speed up the stp convergence.
> 
> For buildroot, on my raspberry pi builds, I only did wifi. But IIRC, the
> dhcp client should have some options to adjust the number of requests
> and/or the time between requests. If so the time it waits to receive a
> response should be over 55 ish seconds in total to account for stp.
> Preferably, the last request should happen after stp has converged.

Reminds me of patch already lingering around some time in my private
repo to adjust the udhcpc start with the '-b' ('background if lease is not
obtained') option, see [1]...

Fixed dhcp lease for me in case the RPi is connected to a switch at startup
with no dhcp server available but connected later...

Regards,
Peter

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20210216202022.27264-1-ps.report at gmx.net/

> 
> 
> 
> On Mon, Feb 15, 2021, 9:08 AM Ivo Grondman <buildroot@grondman.net> wrote:
> 
> > Hi all,
> >
> > Today I?ve been trying to debug the following issue. Using Buildroot
> > 2020.11.2 and the Vagrantfile that comes with it, I tried to build a
> > ?vanilla? Buildroot image in the vagrant VM for my Raspberry Pi 3 Model B+
> > in the following way:
> >
> > $ make raspberrypi3_defconfig
> > $ make
> >
> > i.e. without any customisation. The image builds fine and the Pi boots
> > without errors or warnings, but the network interface eth0 (configured with
> > DHCP) will not have an IPv4 address and I manually have to perform an `ifup
> > -a` or `ifup eth0` to get it going. So I went through all the
> > initialisation files that have a part in bringing up the network interface
> > and soon came to conclude that the script in
> > /etc/network/if-pre-up.d/wait_iface has the right intentions, but still
> > doesn?t solve the slow-to-appear interface issue.
> >
> > It looks as if that particular script still needs to wait just that bit
> > longer when it sees that /sys/class/net/eth0 exists before actually
> > exiting. Using the file as is will not make eth0 retrieve an address from
> > the DHCP server, but if I add a bit of extra sleep in the if-statement
> > where it detects the presence of /sys/class/net/eth0 then it *will* work.
> >
> > Now my problem with this approach is that it feels like a hack. Moreover,
> > I?d like to know if something else could be the issue here. So:
> >
> > 1) Did anyone of you experience similar issues with a Raspberry Pi?
> > 2) Are there any alternative, better solutions to this problem?
> > 3) If the answer to 2) is a ?no?, should I submit a patch for this
> > particular script? I?m a bit hesitant to put in a patch with an extra delay
> > on detection of the interface, as this is obviously not something you want
> > to do for *all* possible platforms?
> >
> > Any help is greatly appreciated.
> >
> > Best regards,
> >
> > Ivo Grondman
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> >  
