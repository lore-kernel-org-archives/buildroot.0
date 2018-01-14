From: =?UTF-8?Q?Einar_J=C3=B3n?= <tolvupostur@gmail.com>
Date: Sun, 14 Jan 2018 11:28:23 +0100
Subject: [Buildroot] [PATCH] iputils: fix ping and traceroute6
 executable permissions
In-Reply-To: <20180114055046.ky6qtwae7rfsu5oz@sapphire.tkos.co.il>
References: <1515874782-14986-1-git-send-email-tolvupostur@gmail.com>
 <CANQCQpYOku9_1AZtk9Qw=j=wMw2PKb=8hS0=dCvsZfbeR29e7Q@mail.gmail.com>
 <20180113223709.GJ3226@scaer>
 <20180114055046.ky6qtwae7rfsu5oz@sapphire.tkos.co.il>
Message-ID: <CABhNV20OSkq84bRR77p1nid+0+=7txKDny2PzBPxAxMAiSLQ8g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi guys,

On 14 January 2018 at 06:50, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Yann,
>
> On Sat, Jan 13, 2018 at 11:37:09PM +0100, Yann E. MORIN wrote:
>> Matt, Einar, All,
>>
>> On 2018-01-13 15:54 -0600, Matthew Weber spake thusly:
>> > On Sat, Jan 13, 2018 at 2:19 PM,  <tolvupostur@gmail.com> wrote:
>> > > From: Einar Jon Gunnarsson <tolvupostur@gmail.com>
>> > > The iputils executables are installed without the setuid bit set,
>> > > which prevents some programs from working.
>> > >
>> >
>> > Does your use case involve a system with non-root users?
>> >

Yes, we have no root login, and most access is done with LDAP users.

>> > Could you describe what you mean by "some programs"?

I mean some of the iputils programs, i.e. the ones I'm fixing.
That's just plagiarism from the sudo commit fixing a similar issue
0e8dafc - sudo: fix main executable permissions (5 years ago)<Simon Dawson>|

>> >
>> > The landscape of how ping gets elevated privileges for raw socket
>> > access has a number of options (setuid / cap_net_raw capability / new
>> > socket type).   The backwards compatible fix would be to use setuid
>> > but from a security hardening aspect, I wish we could set capabilities
>> > for this instead.  The issue I see is the filesystem type dependency
>> > so we can pre-set the capabilities in xattribs.   I'll have to ask
>> > around if setuid vs capabilities has come up before but as most
>> > buildroot systems run as root, I'm guessing it hasn't been a hot
>> > topic.
>> >
>> > Some backstory on Ubuntu's situation, I believe as of 16.04 they still
>> > did setuid but have selectively transitioned to not.
>> > https://bugs.launchpad.net/ubuntu/+source/iputils/+bug/534341
>>
>> Still the case in 17.10, and if I remove the setuid bit, it fails:
>>
>>     $ ping some-host
>>     ping: socket: Operation not permitted
>
> The Debian iputils changelog[1] reads:
>
> iputils (3:20121221-6) UNRELEASED; urgency=medium
>
>   * Remove setuid bits on binaries if setcap succeeds during
>     reconfigure. (Closes: 778500)
>

I'm running iputils-s20160308 (current master), and I can confirm that
ping does need
sudo (or similar superuser privileges).

> setuid seems not to be set on my Debian testing machine:
>
> $ ls -l /bin/ping
> -rwxr-xr-x 1 root root 61240 Nov 10  2016 /bin/ping
>
> The Ubuntu changelog[2] says this:
>
> iputils (3:20150815-2ubuntu1) yakkety; urgency=low
>
>   * Merge from Debian unstable (LP: #1592425).  Remaining changes:
>     - Support cross-building
>     - Mark ping and ping6 setuid again as there's currently no good ways
>       to have capabilities be kept in all our images.
>
> [1] https://tracker.debian.org/media/packages/i/iputils/changelog-3%3A20161105-1
>
> [2] https://launchpad.net/ubuntu/+source/iputils/+changelog
>
>> > > +define IPUTILS_PERMISSIONS
>> > > +       /bin/ping        f 4755 0 0 - - - - -
>> > > +       /bin/traceroute6 f 4755 0 0 - - - - -
>> > > +endef
>> >
>> > The package installs other binaries when IPUTILS_INSTALL_TARGET_CMDS
>> > executes, did you confirm that none of the others also require it?

I actually just checked the suid bits set in Ubuntu and used those.
There it is only traceroute6 and ping.

The full list is
/sbin/arping  - needs root on my machine
/sbin/rarpd  - daemon
/bin/clockdiff  - needs root on my machine
/bin/ping  - needs root on my machine
/sbin/rdisc  - daemon
/usr/sbin/in.tftpd - daemon
/bin/tracepath  - works without root
/bin/traceroute6  - Dunno. Needs IPv6 on my machine.

The daemons do require superuser privileges, of course, so I don't
mess with those.
arping is in sbin, so I left that alone.
I forgot about clockdiff, to be honest.
I don't have IPv6 support, so traceroute6 gives me an error, but the
man page of tracepath says this:
 - It is *similar to traceroute, only does not require superuser
privileges* and has no fancy options.

From the man pages:
 - ping requires CAP_NET_RAW capability to be executed 1) if the
program is used for non-echo queries (See -N option), or 2) if kernel
does  not
       support non-raw ICMP sockets, or 3) if the user is not allowed
to create an ICMP echo socket.  The program may be used as set-uid
root.
 - tracepath6 requires CAP_NET_RAW capability to be executed. It is
safe to be used as set-uid root.
 - clockdiff requires CAP_NET_RAW capability to be executed. It is
safe to be used as set-uid root.
 - arping  requires CAP_NET_RAW capability to be executed. It is not
recommended to be used as set-uid root, because it allows user to
modify ARP
       caches of neighbour hosts.

traceroute6 also has suid bit set in ubuntu, and claims to need it in
the man pages, so I added it in.
I should test if it is really needed.

So the question is if clockdiff should also get suid bits, or if we
solve this a different way.

>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

-- 
Regards
Einar J?n
