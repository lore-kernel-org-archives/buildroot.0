From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 7 Jan 2013 19:47:43 +0100
Subject: [Buildroot] [PATCH 1/2] system: set root password only for
	default skeleton
In-Reply-To: <CAJJ6jxsFL2Su1Jpxavk6zh7qw8b31gFbFEHyaKUvKLZ9Xtp1pQ@mail.gmail.com>
References: <cover.1357397453.git.yann.morin.1998@free.fr>
 <1f2432a8027f1e1c780a45b488be8be03f1b1b93.1357397453.git.yann.morin.1998@free.fr>
 <CAJJ6jxsFL2Su1Jpxavk6zh7qw8b31gFbFEHyaKUvKLZ9Xtp1pQ@mail.gmail.com>
Message-ID: <201301071947.43714.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Steve, All,

On Monday 07 January 2013 Steve Calfee wrote:
> On Sat, Jan 5, 2013 at 6:52 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > In case one is using a custom skeleton, the root pasword might already be
> > set in this case, and should not be overriden.
> >
> > Just ask for (and set) the root password only for the default skeleton.
> >
> > Reported-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> 
> Hi Yann, all,
> 
> This is another change that in my opinion goes against the philosophy
> of buildroot.

IIRC, there have been some complaints on the list by users that just
wondered what was the root password:
    https://bugs.busybox.net/show_bug.cgi?id=5366
    http://lists.busybox.net/pipermail/buildroot/2012-August/057017.html

Having this prompt in the menuconfig makes it clear to the user that
Buildroot does not use a hard-coded secret password.

> Why do we need yet another change to enable something easily done with
> the post build patch script? An easily built bsp skeleton with an
> etc/shadow file handles this beautifully. This kind of creeping
> feature requires maintenance, documentation etc. Why?

Well, that's basically where our view diverges:
  - first, it is not trivial for everybody. It is for me, and I understand
    it is for you. But many people come to buildroot with little previous
    knowledge of Linux in general, and often even less about embdded Linux
    in particular;
  - second, it makes it clear to the user what the root password is (see
    above).

> We need to separate people who build things using buildroot and end
> users that use those things. Is it real to think an end user will
> build from scratch with buildroot?

I am not sure what you mean by:
  - people who build things with Buildroot,
  - end users.

To me there are:
  A) Buildroot developpers, who change Buildroot code,
  B) Buildroot users, who build appliances,
  C) users of appliances built with Buildroot.

Where:
  - {A} ? {B}
  - {A} ? {C} ? {?}
  - {B} ? {C} ? {?}

IMHO, Buildroot should *not* take {C} into account, except for the list
of packages to include in Buildroot, which is fact of matter to {B}.

Buildroot, however, should catter for {B}, the users of Buildroot. And
this is achieved by having people in {A} implement some changes, and even
better, people moving from {B} to {A} to do the job. ;-)

What I mean is: some Buildroot users have complained that the root pasword
was not known (people in {B}). And the answer was to:
  - put it in the doc (IIRC), done by people in {A},
  - propose this change, also by people in {A},
so that people in {B} are no longer puzzled what to enter when prompted
for the root pasword.

Also, people in {A} may think of a whole new feature, and implement it,
without anything being asked for by people in {B} (but probably because
people in {A} are also in {B}, they have a need for that change).

In the end, if a change is deemed not fit for use by people in {B},
there is always the solution to revert that change (if enough of them
complain! ;-) )

> There are full featured
> distributions for most popular platforms that contain this kind of
> stuff. For true embedded developers, adding more things like this just
> complicate things, does not make it easier.

Well, true embedded developpers use their own skeleton, right? ;-)
(Just kidding).

Well, true embedded developpers (and I've been one for the ~14 past
years, now), know how to overcome what you see as a limitation. At least,
I (and it seems a few others as well) see it as an enhancement.

> I guess this is the sort of thing it would be good for the European
> Buildrooters to discuss at their next conference.

Yes. But this series has been floating for quite some time now:
    http://lists.busybox.net/pipermail/buildroot/2012-September/058583.html

But I'm afraid that it is in the end the role of the maintainer to decide
whether or not this feature is fit for inclusion or not. In this case,
it seems it was! ;-) (which does not mean it can't be reverted, either).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
