From: Michael S. Zick <minimod@morethan.org>
Date: Fri, 18 Dec 2009 08:19:16 -0600
Subject: [Buildroot] Strange behavior with shell redirection
In-Reply-To: <4B2B85A9.8010806@free.fr>
References: <4B2B7141.90804@free.fr> <200912180630.54828.minimod@morethan.org>
	<4B2B85A9.8010806@free.fr>
Message-ID: <200912180819.18914.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri December 18 2009, Cyril HAENEL wrote:
> 
> > What is the implementation of that "reboot"?
> > Yours?  Something else?
> >   
> ls -l /sbin/reboot
> lrwxrwxrwx    1 root     root           14 Jul 14 12:12 /sbin/reboot -> 
> ../bin/busybox
> 
> It's the busybox's reboot implementation
> > It is very common that "reboot" does just exactly that, reboots.
> > No file sync, no file closing, nothing but reboot.
> >
> > Try syncing the filesystem and unmounting it before rebooting.
> > mount -o remount <no options> <device name>
> > will flush the VFS buffers to disk if you don't have a "sync" available.
> > umount <device name> 
> > often does not flush/sync the file system, it depends on the FS.
> > So use both of the above commands - 
> >   
> In /etc/inittab, I have :
>                                     
> # Stuff to do before rebooting                                  
> null::shutdown:/usr/bin/killall klogd    
> null::shutdown:/usr/bin/killall syslogd                        
> null::shutdown:/bin/umount -a -r
> null::shutdown:/sbin/swapoff -a     
> 
> The umount -a -r seem's to umount all mounted FS. But maybe for my jffs2 
> FS I also need to do a mount -o remount, I look at this, thank for the 
> idea !
> But I am not convinced that is the problem, because the board can stay 
> alive for very long periodsof time, the log can reach several megabytes, 
> thus I can't believe there is not at least a small part of the previous 
> log at the next startup. 
>

Well, at least one or more erase blocks worth anyway.
jffs2 does a lot of buffering, it could be that the journal is just
rolling back the file to when it was created.

Also, writing erase blocks is relatively slow (on a cpu time scale) -
could be that the system is shutting down before jffs2 has time to
get all of the work done. I.E: its only valid checkpoint is when
the file was first created.

What about the other log files? The ones created by syslogd?
Are they complete up to the time of reboot?

Did you include logger in the Busybox build?
Can you log your application output with logger so it can be
handled by syslogd?

Are you running with the syslogd circular buffer in RAM?

> I use jffs2 for that, if the FS is not  
> correctly unmounted because a power failure for example, files are safe 
> and contain at least the last version of the file before the power failure.
> 
> > As to your first question -
> > Correct, wrong list; try a linux newbee forum.
> >   
> I fact I am not a newbee at all in linux, if I asked my question here, 
> it's really because I now that the problem I have doesn't exist on my 
> laptop for example !!

I bet your laptop doesn't use flash for its secondary storage.
More likely it uses a disk drive of some sort; for example.  ;)

So unless your laptop is running embedded Linux with flash as
its only storage - - -
You are trying to compare grapes with watermelons.

Mike
> 
> Regards,
> Cyril
> 
> 
