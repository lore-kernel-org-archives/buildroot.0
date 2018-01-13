From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Jan 2018 23:37:09 +0100
Subject: [Buildroot] [PATCH] iputils: fix ping and traceroute6
 executable permissions
In-Reply-To: <CANQCQpYOku9_1AZtk9Qw=j=wMw2PKb=8hS0=dCvsZfbeR29e7Q@mail.gmail.com>
References: <1515874782-14986-1-git-send-email-tolvupostur@gmail.com>
 <CANQCQpYOku9_1AZtk9Qw=j=wMw2PKb=8hS0=dCvsZfbeR29e7Q@mail.gmail.com>
Message-ID: <20180113223709.GJ3226@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matt, Einar, All,

On 2018-01-13 15:54 -0600, Matthew Weber spake thusly:
> On Sat, Jan 13, 2018 at 2:19 PM,  <tolvupostur@gmail.com> wrote:
> > From: Einar Jon Gunnarsson <tolvupostur@gmail.com>
> > The iputils executables are installed without the setuid bit set,
> > which prevents some programs from working.
> >
> 
> Does your use case involve a system with non-root users?
> 
> Could you describe what you mean by "some programs"?
> 
> The landscape of how ping gets elevated privileges for raw socket
> access has a number of options (setuid / cap_net_raw capability / new
> socket type).   The backwards compatible fix would be to use setuid
> but from a security hardening aspect, I wish we could set capabilities
> for this instead.  The issue I see is the filesystem type dependency
> so we can pre-set the capabilities in xattribs.   I'll have to ask
> around if setuid vs capabilities has come up before but as most
> buildroot systems run as root, I'm guessing it hasn't been a hot
> topic.
> 
> Some backstory on Ubuntu's situation, I believe as of 16.04 they still
> did setuid but have selectively transitioned to not.
> https://bugs.launchpad.net/ubuntu/+source/iputils/+bug/534341

Still the case in 17.10, and if I remove the setuid bit, it fails:

    $ ping some-host
    ping: socket: Operation not permitted

Regards,
Yann E. MORIN.

> > +define IPUTILS_PERMISSIONS
> > +       /bin/ping        f 4755 0 0 - - - - -
> > +       /bin/traceroute6 f 4755 0 0 - - - - -
> > +endef
> 
> The package installs other binaries when IPUTILS_INSTALL_TARGET_CMDS
> executes, did you confirm that none of the others also require it?
> 
> Matt
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
