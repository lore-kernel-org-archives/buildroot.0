From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 14 Jan 2018 07:50:46 +0200
Subject: [Buildroot] [PATCH] iputils: fix ping and traceroute6
 executable permissions
In-Reply-To: <20180113223709.GJ3226@scaer>
References: <1515874782-14986-1-git-send-email-tolvupostur@gmail.com>
 <CANQCQpYOku9_1AZtk9Qw=j=wMw2PKb=8hS0=dCvsZfbeR29e7Q@mail.gmail.com>
 <20180113223709.GJ3226@scaer>
Message-ID: <20180114055046.ky6qtwae7rfsu5oz@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sat, Jan 13, 2018 at 11:37:09PM +0100, Yann E. MORIN wrote:
> Matt, Einar, All,
> 
> On 2018-01-13 15:54 -0600, Matthew Weber spake thusly:
> > On Sat, Jan 13, 2018 at 2:19 PM,  <tolvupostur@gmail.com> wrote:
> > > From: Einar Jon Gunnarsson <tolvupostur@gmail.com>
> > > The iputils executables are installed without the setuid bit set,
> > > which prevents some programs from working.
> > >
> > 
> > Does your use case involve a system with non-root users?
> > 
> > Could you describe what you mean by "some programs"?
> > 
> > The landscape of how ping gets elevated privileges for raw socket
> > access has a number of options (setuid / cap_net_raw capability / new
> > socket type).   The backwards compatible fix would be to use setuid
> > but from a security hardening aspect, I wish we could set capabilities
> > for this instead.  The issue I see is the filesystem type dependency
> > so we can pre-set the capabilities in xattribs.   I'll have to ask
> > around if setuid vs capabilities has come up before but as most
> > buildroot systems run as root, I'm guessing it hasn't been a hot
> > topic.
> > 
> > Some backstory on Ubuntu's situation, I believe as of 16.04 they still
> > did setuid but have selectively transitioned to not.
> > https://bugs.launchpad.net/ubuntu/+source/iputils/+bug/534341
> 
> Still the case in 17.10, and if I remove the setuid bit, it fails:
> 
>     $ ping some-host
>     ping: socket: Operation not permitted

The Debian iputils changelog[1] reads:

iputils (3:20121221-6) UNRELEASED; urgency=medium

  * Remove setuid bits on binaries if setcap succeeds during 
    reconfigure. (Closes: 778500)

setuid seems not to be set on my Debian testing machine:

$ ls -l /bin/ping
-rwxr-xr-x 1 root root 61240 Nov 10  2016 /bin/ping

The Ubuntu changelog[2] says this:

iputils (3:20150815-2ubuntu1) yakkety; urgency=low

  * Merge from Debian unstable (LP: #1592425).  Remaining changes:
    - Support cross-building
    - Mark ping and ping6 setuid again as there's currently no good ways
      to have capabilities be kept in all our images.

[1] https://tracker.debian.org/media/packages/i/iputils/changelog-3%3A20161105-1

[2] https://launchpad.net/ubuntu/+source/iputils/+changelog

> > > +define IPUTILS_PERMISSIONS
> > > +       /bin/ping        f 4755 0 0 - - - - -
> > > +       /bin/traceroute6 f 4755 0 0 - - - - -
> > > +endef
> > 
> > The package installs other binaries when IPUTILS_INSTALL_TARGET_CMDS
> > executes, did you confirm that none of the others also require it?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
