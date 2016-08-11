From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 11 Aug 2016 22:00:26 +0200
Subject: [Buildroot] Analysis of build results for 2016-08-09
In-Reply-To: <74004942B5DA03468B2B76399A14BF2E8CAA963D@XSJ-PSEXMBX01.xlnx.xilinx.com>
References: <20160810063029.6F291102D04@stock.ovh.net>
 <20160810161455.142a6a19@free-electrons.com>
 <74004942B5DA03468B2B76399A14BF2E8CAA963D@XSJ-PSEXMBX01.xlnx.xilinx.com>
Message-ID: <20160811200026.GA5812@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alistair, Thomas, All,

[please, trim the message to only quote the parts you are replying to,
next time. ;-) ]

On 2016-08-10 22:21 +0000, Alistair Francis spake thusly:
> From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
[--SNIP--]
> > >      aarch64 |                      xen-4.6.0 | NOK |
> > http://autobuild.buildroot.net/results/17641484cb1c2648fcc76e1d1733c71d4
> > 7025ed5/
> >
> > Python issue. Alistair, since you added the Xen package, could you have
> > a look?
> 
> Yep, looks like Xen doesn't support Python 3 yet. Is there a way to use Python 2 in build root?

Yes, just add (host-python is python2; host-python3 is, well, python3):

    XEN_DEPENDENCIES = host-python

Then it depends.

If Xen can be told what python to use, then that's easy (e.g.:
--with-python=python2 or whatever else...)

However, if you can't tell Xen what python to use, then this is a bit
more involved.

See how it was solved for example for qt5webkit:

    package/qt5webkit: needs host-python

    The Qt5Webkit build system hard-codes calls to 'python', but only really
    supports python2.

    We fix that similarly as we did in nodejs, by adding a python->python2
    symlink early in the PATH when configuring/building Qt5Webkit, and
    adding host-python in the dependency list.

    [--SNIP--]

This is commit ac16793eaaabfced0312420759e3a66cdaa1ea8e and you can get
some inspiration from it.

Thomas, we now have a few packages that need this hack. Should we try to
move those hacks into the pkg infra (obviously not for 2016.08)?

Cordialement,
Yann E. MORIN.

> Xen 4.7 has the same problem as well.
> 
> Thanks,
> 
> Alistair
> 
> >
> > >         i586 |                 xfsprogs-4.7.0 | NOK |
> > http://autobuild.buildroot.net/results/366ac68fff498576cc6bbc2ef396e9cb51
> > 37c01d/
> >
> > Musl issue.
> >
> > >      aarch64 |     xserver_xorg-server-1.18.4 | NOK |
> > http://autobuild.buildroot.net/results/26decc6b98fe35733dc6be95f6c6ba302
> > 8fddc1d/
> > >       x86_64 |     xserver_xorg-server-1.18.4 | NOK |
> > http://autobuild.buildroot.net/results/144e0be1a9aa7d2f00b535c8266052ee
> > db91bddb/
> >
> > Let's assume this might be fixed by
> > https://git.buildroot.org/buildroot/commit/?id=3686101a2ae9ec37b4d34a36
> > 8db03c325f7f92e3.
> >
> > Best regards,
> >
> > Thomas
> > --
> > Thomas Petazzoni, CTO, Free Electrons
> > Embedded Linux and Kernel engineering
> > http://free-electrons.com
> 
> 
> This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
