From: Cyril HAENEL <chaenel@free.fr>
Date: Fri, 18 Dec 2009 14:37:45 +0100
Subject: [Buildroot] Strange behavior with shell redirection
In-Reply-To: <200912180630.54828.minimod@morethan.org>
References: <4B2B7141.90804@free.fr> <200912180630.54828.minimod@morethan.org>
Message-ID: <4B2B85A9.8010806@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> What is the implementation of that "reboot"?
> Yours?  Something else?
>   
ls -l /sbin/reboot
lrwxrwxrwx    1 root     root           14 Jul 14 12:12 /sbin/reboot -> 
../bin/busybox

It's the busybox's reboot implementation
> It is very common that "reboot" does just exactly that, reboots.
> No file sync, no file closing, nothing but reboot.
>
> Try syncing the filesystem and unmounting it before rebooting.
> mount -o remount <no options> <device name>
> will flush the VFS buffers to disk if you don't have a "sync" available.
> umount <device name> 
> often does not flush/sync the file system, it depends on the FS.
> So use both of the above commands - 
>   
In /etc/inittab, I have :
                                    
# Stuff to do before rebooting                                  
null::shutdown:/usr/bin/killall klogd    
null::shutdown:/usr/bin/killall syslogd                        
null::shutdown:/bin/umount -a -r
null::shutdown:/sbin/swapoff -a     

The umount -a -r seem's to umount all mounted FS. But maybe for my jffs2 
FS I also need to do a mount -o remount, I look at this, thank for the 
idea !
But I am not convinced that is the problem, because the board can stay 
alive for very long periodsof time, the log can reach several megabytes, 
thus I can't believe there is not at least a small part of the previous 
log at the next startup. I use jffs2 for that, if the FS is not 
correctly unmounted because a power failure for example, files are safe 
and contain at least the last version of the file before the power failure.

> As to your first question -
> Correct, wrong list; try a linux newbee forum.
>   
I fact I am not a newbee at all in linux, if I asked my question here, 
it's really because I now that the problem I have doesn't exist on my 
laptop for example !!

Regards,
Cyril


-- 

Cyril Haenel
Registered Linux User #332632
