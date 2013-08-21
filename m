From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Aug 2013 23:09:08 +0200
Subject: [Buildroot] syslog output to serial console
In-Reply-To: <CAJpxd044gjJfXpwbMfC_3VAUU26-DgD+Sex4fACjWGszR2MjPg@mail.gmail.com>
References: <CAJpxd044gjJfXpwbMfC_3VAUU26-DgD+Sex4fACjWGszR2MjPg@mail.gmail.com>
Message-ID: <52152C74.4080904@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/08/13 22:22, Bryce Schober wrote:
> I realize that this is a bit off-topic...
>
> I've configured my target for boot-loader & linux boot serial console
> output, but now I'd really like to redirect the rest of what gets into
> syslog to the serial console as well. Is there a way to do that with
> busybox syslog?
>
> The primary use-case here is for seeing the output results / errors from
> my set of /etc/init.d scripts, so if it's not feasible to get this
> re-direction up and running early in the boot process, it wouldn't be
> worth it.

  Actually, the output of init scripts should already go to the console. 
When the kernel mounts the rootfs and calls init, it sends its stdout and 
stderr to /dev/console. If your rootfs is an initramfs, however, the 
kernel doesn't automount the devtmpfs so /dev/console doesn't exist when 
/init is executed. We solve this with the script in fs/cpio/init. If this 
is the problem, you'll see that the kernel reports something like "Unable 
to find initial console".

  The only thing captured by syslog are the messages going to /dev/log, 
which are sent out by some daemons. If you want this output to go to 
/dev/console as well, you can add something like

::respawn:/usr/bin/tail -50 -F /var/log/messages

to /etc/inittab.


  Regards,
  Arnout

>
> Thanks for any advice or pointers you can offer...
> <><  <><  <><
> Bryce Schober
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
