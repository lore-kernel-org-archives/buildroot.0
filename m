From: Stephan Henningsen <stephan@asklandd.dk>
Date: Fri, 25 Oct 2019 01:30:53 +0200
Subject: [Buildroot] [PATCH 1/1] support/scripts: added support for
 system and normal uid/gid.
In-Reply-To: <20191024071129.GA32716@scaer>
References: <20191023211313.6758-1-stephan+buildroot@asklandd.dk>
 <6d916570-a766-3dc5-94c2-acc438b622d7@mind.be>
 <CAH0Z9Q+zNbuN31Kbw77PQrq7FukmMmJLkvCYD+_4=poYB5D34Q@mail.gmail.com>
 <20191024071129.GA32716@scaer>
Message-ID: <CAH0Z9QKcFaBjN6ZWuPd2TOVKmP7JkDvV_iah6Kr=_TLryB3yog@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Long mail, lots of reluctancy and personal feelings about my patch.  I
try to reply as good as I can.


On Thu, Oct 24, 2019 at 9:11 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Please, don't top-post, that's bad etiquette; instead, intersperse your
> replies in the text you are replying to (like I do below).

Sorry, it was not my intention.


> Also, do not
> post HTML mails, try to send only plain-text mails (html is ugly to read
> in a terminal, even if there's a plain0text alternative).

I'll try.


> On 2019-10-24 01:03 +0200, Stephan Henningsen spake thusly:
> > There's no technical difference between the two. It's purely
> > organizational. Also, it's standard on all the Linux dists I've used; all
> > except Buildroot.
>
> Buildroot is not a distribution; it is a buildsystem to generate
> firmware images for embedded devices.

It does build a Linux system, and there are best practices, conventions,
and even standard for Linux systems.  This is what I meant when I said
"standards".
I'll use the term "well-known convention", from now on; it sounds less
bossy, and gives you more room for doubt =).

It's far from everyday I study uid/gids. But when I do, it's typically
because I need to fix some permission issue,
And then a well-known convention is gold!  I know exactly who uid 1000
is, I have a good idea of who uid 100 is,
and an even better feeling of who 3 is.


> > Yet I made this change because I was annoyed with how my /etc/passwd and
> > /etc/group looked; my normal, real, login users were mixed up with system
> > uids and gids (sshd, sudo, kvm, etc).
> > At first glance user 'sshd' looks like a normal user; it has a uid of 1001
> > right above the normal login user at 1000 which I'd intentionally added.
>
> As I already explained twice on IRC (to which you did not answer),

I must have overlooked it, don't take it personal.


> if you have specific requirements about uids/gids, you can already provide
> your own /etc/passwd and /etc/group files, with the uids and gids you
> need.

Oh, that. I'm not discussing special requirements. I simply argue that
well-known conventions should apply to Buildroot too.

Why shouldn't it?

It's quite simple to correct too. And believe my patch just did that.
I still hope we can discuss it at some point.


> Also beware about automatic uid/gid assignent: they are not guaranteed
> to be stable between two versions of Buildroot and/or two different
> configurations.
>
> For example, consider that you do a first build with sshd (or whatever
> else, just an example) enabled, and it gets uid 27. You deploy this
> build in production, and sshd created files on a remanent filesystem.
> Then you decide to add new features to your device, and enable httpd
> (another example). httpd sorts before sshd, so will be first to get
> assigned a uid, and thus gets 27, while sshd now gets 42. Then you
> deploy your new build in production.
>
> Boom. The new sshd user can't read/write the files created by the
> previous sshd user, because it is no longer the same uid.
>
> To fix that, you really want to provide your own /etc/paswd and
> /etc/group files when you have requirements on the uid and gid
> assignemnts.
>
> The auto-assignment by Buildroot is a best-effort, and exists just as a
> starting point, but mostly as a check that no two-or-more usernames use
> the same uid (ditto gid).

How does offsetting the uid/gids from 1000 to 100 in Buildroot's mkusers script
change any of this?


> > I'm sorry, but I think it's messy, and I'd like to clean it up. I like that
> > uid/gid are within their usual system/normal regions; it makes it easier to
> > see what's going on, specifically which users and groups belong to the
> > system, and which groups that are main user groups.
>
> And again, as I said on IRC, the "usual system/normal regions" don't
> mean anything.

But that's where you're wrong; they do mean something. I already
explained it. I gave examples. Both here and on IRC.

I'm aware that from the system's perspective, their numerical region
is of no importance, only their value is. However, don't care about
the system's perspective; I'm speaking from the user's perspective.
That's why we both keep referring to /etc/passwd and /etc/group; their
purpose is to map system's ids to names meaningful to the user (the
admin).  And here regions make sense.  And if there are users that
don't care about regions, I don't see there should a problem with my
patch.

> For my use-case, I have to generate all users in the
> range 10000..10999. So your patches do not cover this use-case either.

So the regions do have meaning for you too!  I'm guessing that the
reason you blow your user region off-chart like that, is because
Buildroot has already occupied the standard user region with its
system users. And you want that numerical space so you can clearly
differ system users from your normal users.

And you're right, my patch doesn't support your special requirements.
But it doesn't interfere with them either.  I could argue that it
actually helps you, as you would no longer have to add fixed uids but
could use -2 to have them auto generated into user region (if that's
an option).


> An alternate solution I've been working on sometime ago, was to have two
> new config entries:
>
>     config BR2_UID_AUTO_MIN
>         bool "lowest uid"
>         int
>         default 1000
>         help
>           The lowest UID assigned automatically by Buildroot.
>
>     config BR2_UID_AUTO_MAX
>         bool "highest uid"
>         int
>         default 1999
>         help
>           The gighest UID assigned automatically by Buildroot.
>
> Which would be much more interesting to have (ditto gid).

So not 2 but 4 new configuration entries.


> Maybe I'll have time to finish it in the coming days...

I'd advise you correct your defaults to standard.  Still I think it's
a lot of configuration options just to allow someone to break the
standard and configure for special requirements.  This should be fixed
by adding custom /etc/passwd and /etc/group files.  You said so
yourself.


> > Just because it's an embedded system, doesn't mean we have to be sloppy
> > about this ;)  I know it may sound subjective and based on personal
>
> Sorry, but we're not beig sloppy. What are a "system user" or a
> "non-system user"? The definition is not clear at all.

Oh yes you do, mr. +10000 uid.


> On an embedded
> device, I would argue that all users are system users, because there is
> no human interacting with the device like they would interact with a
> traditional distro.

Then it would be sane to move the default users into the system uid/gid region.

On a side note: I'm currently working on creating a light-weight Linux
that boots of a USB,
and it will require a normal user login.  And guessing by your
10000..10999 uid range I suspect you're
familiar with user interaction.  In any case, people use Buildroot to
create all sorts of systems.


> > opinion, but it is actually conforming to standard, and I'm inclined to
> > think it's for a reason.
>
> What standard are you refering to?

Yes, well I was mostly referring to my observations of a "best
practice" or "common approach" on
various Linux dists I've come across.  But it appears Debian has a standard:

https://www.debian.org/doc/debian-policy/ch-opersys.html#uid-and-gid-classes

There's a nice write-up here: https://unix.stackexchange.com/a/319751/61306


> > Also note, this change doesn't require any of the current packages to take
> > any action; they'll simply have their users and groups moved into the
> > normal system region from now on.  My guess is that this will fit perfectly
> > for the majority of packages. Of course, if any packages provide normal,
> > login users, these ought to be changed to -2 instead.  But nothing will
> > break.
>
> Still, I don't think that "system" vs. "non-system" users make sense,

Still?

Another option could also be to just offset the autogenerated uid/gids
from 1000 into 100,
and don't add that -2 fix.  I still think it would be a nice addition
to help users create normal users.
I even updated the documentation about it.

Oh this reminds me, that I or we should probably have a look that
/etc/adduser.conf or its equivalent on Buildroot.
It should match the mkusers script I think, but I don't have a running
system, so I'm just speculating.


> and moreover, the stability of uids/gids is much more important, and
> requires that packages either provide an explixit uid/gid, or that the
> /etc/passwd and /etc/group be provided.

Sorry I'm misunderstanding you here and not answering within context:
But all my script does, it offset the autogenerated uid/gid into the
right region;
I'm not touching packages' explicit uid/gid.  I haven't touched any
packages at all.

I'm aware that you don't agree to the well-known notion - or even the
Debian standard
- of system and normal user id ranges.

But how is it you find that my patch *breaks* anything?


--
Yours,
Stephan
