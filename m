From: MOHAMMAD RASIM <mohammad.rasim96@gmail.com>
Date: Sat, 23 Jun 2018 03:25:43 +0300
Subject: [Buildroot] Run getty on multiple ttys and Box-drawing character
In-Reply-To: <87po0ik8re.fsf@dell.be.48ers.dk>
References: <CACq04CEcu6tiE-P7-xJUtHVYz4ouYrhq1Q2awjhg=i9W+THAvA@mail.gmail.com>
 <87po0ik8re.fsf@dell.be.48ers.dk>
Message-ID: <CACq04CEoHtQ0+K5eMjVz=RqjU6SHzR5oNkW5bP32t=kTBVrMLg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yes, I've already set up a post-build script that modifies the inittab,
didn't know about the raspberrypi script, could have saved me some time :(

I have two Ideas that can be used for tty:
1- make a startup script in /etc/init.d/ that parses the /proc/cmdline and
start gettys accordingly, I've tried it and it works but obviously, It's
not the right way to do these things(no respawning).

2- in the /init script after mounting devtmpfs and before running (exec
/sbin/init "$@") we add the same code from the post-build script that
parses /proc/cmdline and adds ttys to /etc/inittab (Didn't try this but
seems like the right way to do it).

As for the TERM settings I've set up my TERM to 'xterm-256color' which is
the most capable terminal I know and the characters don't show.
I don't think the problem is related to the terminal, instead, I think It
has something to do with charset and character encoding .

PS: sorry if the message is duplicated, this is the first time I deal with
mailing lists.

On Fri, Jun 22, 2018 at 8:53 PM, Peter Korsgaard <peter@korsgaard.com>
wrote:

> >>>>> "MOHAMMAD" == MOHAMMAD RASIM <mohammad.rasim96@gmail.com> writes:
>
>  > Hi
>  > I'm running buildroot-2018.02.3  on an arm64 board from initrd  and
> have a
>  > couple of questions:
>
>  > 1- How can I set buildroot to run getty on multiple ttys. the standard
>  > BR2_TARGET_GENERIC_GETTY doesn't accept multiple ttys to be set, I
> normally
>  > edit output/target/etc/inittab and add the other tty. So is this the
>  > standard way of adding a tty or is there some setting I'm missing?
>
> Yes, either that or do the inittab modification in a post-build
> script. Have a look at board/raspberrypi/post-build.sh for an example.
>
> These options are really just convenience options to cover the common
> use cases, they will not fit for all use cases.
>
> > also, there is an official kernel parameter called console that can be
> used
>  > to set up gettys, so for example, if I run Ubuntu initramfs I can pass
> the
>  > following arguments to the kernel:
>
>  > console=ttyS0,115200n8 console=tty0
>
>  > and so the initramfs run a getty on each tty I passed, so why doesn't
>  > buildroot use these values to run gettys?
>
> How would you implement this in the busybox inittab?
>
>
>  > 2- I'm running a python script that uses curses library to display a
> box on
>  > the framebuffer, the problem is that the box doesn't show with the box
>  > drawing characters <https://en.wikipedia.org/wiki/Box-drawing_character
> >
>  > instead the borders are shown as letters. so what do I need to enable?
>  > I've already added en_US.UTF-8 to BR2_GENERATE_LOCALE but still I don't
> get
>  > the box characters.
>
> Maybe play with your TERM settings? The default value is vt100, which
> may not support the specific box drawing characters.
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180623/8825d9ef/attachment.html>
