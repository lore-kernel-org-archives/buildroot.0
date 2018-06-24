From: Carlos Santos <casantos@datacom.com.br>
Date: Sun, 24 Jun 2018 10:56:42 -0300 (BRT)
Subject: [Buildroot] Run getty on multiple ttys and Box-drawing character
In-Reply-To: <CACq04CEoHtQ0+K5eMjVz=RqjU6SHzR5oNkW5bP32t=kTBVrMLg@mail.gmail.com>
References: <CACq04CEcu6tiE-P7-xJUtHVYz4ouYrhq1Q2awjhg=i9W+THAvA@mail.gmail.com>
 <87po0ik8re.fsf@dell.be.48ers.dk>
 <CACq04CEoHtQ0+K5eMjVz=RqjU6SHzR5oNkW5bP32t=kTBVrMLg@mail.gmail.com>
Message-ID: <740098169.350580.1529848602339.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "MOHAMMAD RASIM" <mohammad.rasim96@gmail.com>
> To: "Peter Korsgaard" <peter@korsgaard.com>
> Cc: "buildroot" <buildroot@busybox.net>
> Sent: Friday, June 22, 2018 9:25:43 PM
> Subject: Re: [Buildroot] Run getty on multiple ttys and Box-drawing character

> Yes, I've already set up a post-build script that modifies the inittab, didn't
> know about the raspberrypi script, could have saved me some time :(

> I have two Ideas that can be used for tty:
> 1- make a startup script in /etc/init.d/ that parses the /proc/cmdline and start
> gettys accordingly, I've tried it and it works but obviously, It's not the
> right way to do these things(no respawning).

> 2- in the /init script after mounting devtmpfs and before running (exec
> /sbin/init "$@") we add the same code from the post-build script that parses
> /proc/cmdline and adds ttys to /etc/inittab (Didn't try this but seems like the
> right way to do it).

This works but is a bit dangerous. If the script fails to parse cmdline
you may get system on which you can not log in. Ensure that you have an
inittab file with least a line containing something like this

    cons::respawn:/sbin/getty -L console 115200 vt100

(or the corresponding one for BusyBox init).

Notice also that /init is a script only when rootfs is in a cpio
archive, which is selected along with initrd, but not for other
rootfs configurations.

> As for the TERM settings I've set up my TERM to 'xterm-256color' which is the
> most capable terminal I know and the characters don't show.
> I don't think the problem is related to the terminal, instead, I think It has
> something to do with charset and character encoding .

Are you using a terminal emulator (e.g. PuTTY) to access the console?
If yes, check its character encoding configuration.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
