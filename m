From: bruce bushby <bruce.bushby@gmail.com>
Date: Wed, 23 Mar 2011 01:17:33 +0000
Subject: [Buildroot] Python: can't resolve symbol
In-Reply-To: <AANLkTim9AZ2Q8PZ9SOsBDPEL3Yqn7euZ4hmkKzQ1Dxai@mail.gmail.com>
References: <AANLkTim9AZ2Q8PZ9SOsBDPEL3Yqn7euZ4hmkKzQ1Dxai@mail.gmail.com>
Message-ID: <AANLkTi=pMpvbttGOBL1seD=CqSPdXRcLGpzBZu4CPmpR@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

UPDATE: Python "readline" issue:

I've determined the errors are related to "ncurses" &
"readline".....readline will compile against ncurses when it finds them. The
definitions at the top of this man page are exactly the ones I'm having a
problem with:
http://linux.die.net/man/3/tgetflag



I've confirmed that when I compile "readline" it locates "ncurses"

I then checked on my embedded system and "libreadline.so" is present AND it
contains the missing symbols:
[root at vx-200 ~]# find / -name "*libreadline*"
/usr/lib/libreadline.so.6.1
/usr/lib/libreadline.so
/usr/lib/libreadline.so.6
[root at vx-200 ~]# strings /usr/lib/libreadline.so.6.1 | grep "tgetflag"
tgetflag
[root at vx-200 ~]# strings /usr/lib/libreadline.so.6.1 | grep "tgetent"
tgetent
[root at vx-200 ~]#


However, the resulting "readline" python module does NOT contain the
symbols:
/usr/lib/python2.7/lib-dynload/readline.so
[root at vx-200 ~]# strings /usr/lib/python2.7/lib-dynload/readline.so | grep
"tgetent"
[root at vx-200 ~]#

My linux desktop also DOES NOT contain the symbols  (However python readline
works on my linux desktop)
[bruce at core ~]$ strings /usr/lib64/python2.6/lib-dynload/readline.so | grep
tgetent
[bruce at core ~]$




I then ran an strace to compare between my pc (Fedora 12) and my embedded OS
that has the python readline issues. The results are similar
and I can see that Python opens the "libncurses" and "libreadline"
libraries....which have been shown to contain the symbols.....however the
embedded
OS still throws errors and can't "import readline"


Linux PC
[bruce at core ~]$ cat X | grep -v "No such file"
open("/usr/lib64/python2.6/lib-dynload/readline.so", O_RDONLY) = 3
open("/usr/lib64/python2.6/lib-dynload/readline.so", O_RDONLY) = 4
open("/etc/ld.so.cache", O_RDONLY)      = 4
open("/lib64/libreadline.so.6", O_RDONLY) = 4
open("/lib64/libtinfo.so.5", O_RDONLY)  = 4
open("/usr/share/terminfo/r/rxvt", O_RDONLY) = 4
open("/etc/inputrc", O_RDONLY)          = 4
open("/usr/lib64/gconv/gconv-modules.cache", O_RDONLY) = 3


Embedded:
[root at vx-200 ~]# cat Y | grep -v "No such file"
open("/usr/lib/python2.7/lib-dynload/readline.so", O_RDONLY|O_LARGEFILE) = 3
open("/usr/lib/python2.7/lib-dynload/readline.so", O_RDONLY) = 4
open("/usr/lib/libreadline.so.6", O_RDONLY) = 4
open("/usr/lib/libncurses.so.5", O_RDONLY) = 4
open("/lib/libc.so.0", O_RDONLY)        = 4
open("/lib/libc.so.0", O_RDONLY)        = 4
open("/lib/libc.so.0", O_RDONLY)        = 4
open("/lib/ld-uClibc.so.0", O_RDONLY)   = 4

python: symbol 'BC': can't resolve symbol

python: symbol 'PC': can't resolve symbol

python: symbol 'UP': can't resolve symbol

python: symbol 'tgetnum': can't resolve symbol

python: symbol 'tgoto': can't resolve symbol

python: symbol 'tgetflag': can't resolve symbol

python: symbol 'tputs': can't resolve symbol

python: symbol 'tgetent': can't resolve symbol

python: symbol 'tgetstr': can't resolve symbol
>>>




>>> import readline

python: symbol 'BC': can't resolve symbol

python: symbol 'PC': can't resolve symbol

python: symbol 'UP': can't resolve symbol

python: symbol 'tgetnum': can't resolve symbol

python: symbol 'tgoto': can't resolve symbol

python: symbol 'tgetflag': can't resolve symbol

python: symbol 'tputs': can't resolve symbol

python: symbol 'tgetent': can't resolve symbol

python: symbol 'tgetstr': can't resolve symbol
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
ImportError: unknown dlopen() error
>>>


I've been stuck on this since 9th March so any pointers or hints would be
greatly appreciated!!! I'm wondering could it be:
1. That I'm using the buildroot-snapshot?
2. or I'm uClibc-0.9.32-rc2?
3. or that I'm using gcc 4.5.x?
4 or something wrong with Fedora 14?

I'm trying uClibc-0.9.31 now so will know in 40min....but I'm starting to
run out of ideas :(




Bruce




On Tue, Mar 8, 2011 at 8:20 AM, bruce bushby <bruce.bushby@gmail.com> wrote:

> Hi
>
> I'm not sure if this is the right list to post this issue to?
>
> From what I can tell, these "can't resolve" messages are caused when
> selecting "readline"
>
>
> # python
> Python 2.7.1 (r271:86832, Mar  7 2011, 22:37:34)
> [GCC 4.5.2] on linux2
> Type "help", "copyright", "credits" or "license" for more information.
>
> python: symbol 'BC': can't resolve symbol
>
> python: symbol 'PC': can't resolve symbol
>
> python: symbol 'UP': can't resolve symbol
>
> python: symbol 'tgetnum': can't resolve symbol
>
> python: symbol 'tgoto': can't resolve symbol
>
> python: symbol 'tgetflag': can't resolve symbol
>
> python: symbol 'tputs': can't resolve symbol
>
> python: symbol 'tgetent': can't resolve symbol
>
> python: symbol 'tgetstr': can't resolve symbol
> >>>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110323/1f17b799/attachment-0001.html>
