From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 15 Mar 2016 23:06:44 +0100
Subject: [Buildroot] Another lame user question.
In-Reply-To: <CAJJ6jxs-aPoTBv6OMoKkKN64OAscmG41dTCqrqsB6xkVSnAD+w@mail.gmail.com>
References: <CAJJ6jxvqALyD4=1wPUdh7JKpv1fKkfoYcj-m4FZLe+1P2wnnFQ@mail.gmail.com>
 <20160314053654.GF7678@tarshish>
 <CAJJ6jxs-aPoTBv6OMoKkKN64OAscmG41dTCqrqsB6xkVSnAD+w@mail.gmail.com>
Message-ID: <20160315220644.GK5053@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Steve, All,

On 2016-03-14 10:45 -0700, Steve Calfee spake thusly:
> On Sun, Mar 13, 2016 at 10:36 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> > On Sun, Mar 13, 2016 at 10:14:57PM -0700, Steve Calfee wrote:
> >> Hi, as the title says, I have another user question. I did explore
> >> google and the buildroot docs.
> >>
> >> I am trying to move the mysql directories to my writeable ubi
> >> partition. Somewhere someone create the mysql user. Where did it get
> >> created? However, there is no mysql group. I cannot get mysql to start
> >> from a ubi partition mounted at /data/mysql. Who and where is the
> >> mysql user created (some files have that as a user)
> >>
> >> The buildroot manual documents the makeusers syntax, but what file do
> >> I create where? Will that work for mysql?
> >
> > Quoting package/mysql/mysql.mk:
> >
> > define MYSQL_USERS
> >         mysql -1 nogroup -1 * /var/mysql - - MySQL daemon
> > endef
> 
> So somewhere in the infra a script goes through all *_USERS variables
> and builds the password file etc for users?

See fs/common.mk at 82:

   81 ifneq ($$(ROOTFS_USERS_TABLES),)
   82     cat $$(ROOTFS_USERS_TABLES) >> $$(USERS_TABLE)
   83 endif

This is then used by support/scripts/mkusers to fill in /etc/passwd,
/etc/groups and their shadow counterparts.

> What if I want to move /var/mysql? Who uses /var/mysql as the "home"
> directory? And how does that relate to datadir that is defined in
> my.cnf?

I don;t know mysql, but I get that my.cnf is the configuration file for
mysql. If that;s the case, then you should set some variable(s) in
my.cnf to point to /var/mysql; I guess you probably want something like
datadir=/var/mysql .

> Anyway finding out that the user is created in the make file will
> really help me research this problem of setting up mysql and moving
> its datadir to another ubi partition.

Well, you can always have that ubi partition mounted as /var/mysql no?

Regards,
Yann E. MORIN.

> Thanks, Steve
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
