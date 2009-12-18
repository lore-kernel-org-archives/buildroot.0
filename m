From: Michael S. Zick <minimod@morethan.org>
Date: Fri, 18 Dec 2009 06:30:52 -0600
Subject: [Buildroot] Strange behavior with shell redirection
In-Reply-To: <4B2B7141.90804@free.fr>
References: <4B2B7141.90804@free.fr>
Message-ID: <200912180630.54828.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri December 18 2009, Cyril HAENEL wrote:
> Hello all, sorry I don't know if I am in the good place to ask my 
> question...
> On an custom board based on the AT91SAM9260 processor, 
> buildroot-2009.05, and jffs2 as root file system, I have an "autostart" 
> script launched at board startup.
> In this script (I use the true bash and not the busybox shell) I launch 
> my application, and I redirect the output to a log file :
> 
> #!/bin/bash
> cd /home/potentiostat
> [...]
> echo "Launching application"
> ./potentiostatApplication >> /var/log/potentiostat
> # Reboot if application error
> if [ $? -ne 0 ]
> then
> reboot
> fi
> 
> I use ">>" for the redirection, thus normally each time this script is 
> launched it should concatenate the new log after the older one.
> But it's not the case, each time I startup the board I have a new log !!
> 
> I really don't understand this beahavior, any idea ?
> 

What is the implementation of that "reboot"?
Yours?  Something else?

It is very common that "reboot" does just exactly that, reboots.
No file sync, no file closing, nothing but reboot.

Try syncing the filesystem and unmounting it before rebooting.
mount -o remount <no options> <device name>
will flush the VFS buffers to disk if you don't have a "sync" available.
umount <device name> 
often does not flush/sync the file system, it depends on the FS.
So use both of the above commands - 

As to your first question -
Correct, wrong list; try a linux newbee forum.

Mike

> Best Regards,
> Cyril HAENEL
> 
