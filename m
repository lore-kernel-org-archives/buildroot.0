From: Norbert Lange <nolange79@gmail.com>
Date: Fri, 17 Jul 2020 22:53:15 +0200
Subject: [Buildroot] [PATCH 1/1] treewide: replace nogroup with nobody
In-Reply-To: <20200717202043.GI18825@scaer>
References: <20200717102048.346554-1-nolange79@gmail.com>
 <20200717202043.GI18825@scaer>
Message-ID: <CADYdroMgOyM+LzL5YB1Jff19Vgn3HYV1Ur8uciLCOTRhjLb7PQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fr., 17. Juli 2020 um 22:20 Uhr schrieb Yann E. MORIN
<yann.morin.1998@free.fr>:
>
> Norbert, All,
>
> On 2020-07-17 12:20 +0200, Norbert Lange spake thusly:
> > Use the recommended groupname for user nobody. One practical
> > issue is that systemd-sysusers will otherwise create a
> > nobody group with gid 999.
> >
> > Quote: "If the username exists on a system,then they should
> > be in the suggested corresponding group".
> >
> > https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/usernames.html
>
> Note the phrasing, which states 'should' and 'suggested', in that they
> are not mandatory. And indeed, I'm looking at Ubuntu 19.10 here. which
> has a 'nogroup' group, and no 'nobody' group.

Debian (and in effect its siblings) don't follow the LSB at all,
so you are correct, but using Ubuntu as example doesnt count.

>
> It is however to be noted that, initially, only the 'nobody' group did
> exist (commit 339f2f492e, 2001-12-22), and subsequently removed soon
> afterwards (commit 08782ae7d8, 2002-04-26). to be then reintroduced
> again a while later (commit 3ed6fb0af3, 2005-08-07).
>
> And them oh-so-shortly afterwards, the 'nogroup' group makes its grand
> appearance (commit 3c31be684d, 2005-08-09), on the excuse to make LTP
> happy.
>
> However, nowadays, LTP does check preferentially for 'nobody', and falls
> back on 'nogroup', with this comment (in IDcheck.sh):
>
>     # nobody is a standard group on all distros, apart from debian based ones;
>     # let's account for the fact that they use the nogroup group instead.
>
> So, indeed, switching to using 'nobody' makes sense, and would not make
> LTP less happy.

If necessary, a 'nogroup' could be added aswell (with a different gid),
let's hope that's not necessary.

>
> As for the numbering, I seemd to recall some specificities of 65534, and
> indeed I found commit 9c67af2c52, 2019-08-25, that switched 'nogroup'
> from 99 to 65534, so we're clean there too.

65534 seems to get special treatment in the kernel ("overflow uid").

>
> And for the records, I was the one to drop the 'nobody' group 7 years
> ago now, in commit 908198e756, stating "Anyway, the user 'nobody'
> belongs to the group 'nogroup' in any sane distribution." Damn. ;-]

I'll be cautious to add such a statement in the commit logs,
thanks for the warning ;)

>
> Nits, below...
>
> > Signed-off-by: Norbert Lange <nolange79@gmail.com>
> > ---
> >  package/boa/boa.conf                 | 18 +++++++++---------
> >  package/mosquitto/mosquitto.mk       |  2 +-
> >  package/oracle-mysql/oracle-mysql.mk |  2 +-
> >  package/systemd/systemd.mk           |  1 -
> >  system/skeleton/etc/group            |  2 +-
> >  5 files changed, 12 insertions(+), 13 deletions(-)
> >
> > diff --git a/package/boa/boa.conf b/package/boa/boa.conf
> > index e94029665f..03630c0f9a 100644
> > --- a/package/boa/boa.conf
> > +++ b/package/boa/boa.conf
> > @@ -7,7 +7,7 @@
> >  # generated parser.  If it reports an error, the line number will be
> >  # provided; it should be easy to spot.  The syntax of each of these
> >  # rules is very simple, and they can occur in any order.  Where possible
> > -# these directives mimic those of NCSA httpd 1.3; I saw no reason to
> > +# these directives mimic those of NCSA httpd 1.3; I saw no reason to
>
> Lots of spurious changes (removal of trailing spaces), should not be in
> that patch.
>
> Regards,
> Yann E. MORIN.

Dont want my name showing up everywhere with a 'git blame',
gonna do a V2 shortly.

Norbert
