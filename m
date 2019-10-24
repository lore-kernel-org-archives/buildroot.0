From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 24 Oct 2019 09:11:29 +0200
Subject: [Buildroot] [PATCH 1/1] support/scripts: added support for
 system and normal uid/gid.
In-Reply-To: <CAH0Z9Q+zNbuN31Kbw77PQrq7FukmMmJLkvCYD+_4=poYB5D34Q@mail.gmail.com>
References: <20191023211313.6758-1-stephan+buildroot@asklandd.dk>
 <6d916570-a766-3dc5-94c2-acc438b622d7@mind.be>
 <CAH0Z9Q+zNbuN31Kbw77PQrq7FukmMmJLkvCYD+_4=poYB5D34Q@mail.gmail.com>
Message-ID: <20191024071129.GA32716@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stephan, All,

Please, don't top-post, that's bad etiquette; instead, intersperse your
replies in the text you are replying to (like I do below). Also, do not
post HTML mails, try to send only plain-text mails (html is ugly to read
in a terminal, even if there's a plain0text alternative).

On 2019-10-24 01:03 +0200, Stephan Henningsen spake thusly:
> There's no technical difference between the two. It's purely
> organizational. Also, it's standard on all the Linux dists I've used; all
> except Buildroot.

Buildroot is not a distribution; it is a buildsystem to generate
firmware images for embedded devices.

> Yet I made this change because I was annoyed with how my /etc/passwd and
> /etc/group looked; my normal, real, login users were mixed up with system
> uids and gids (sshd, sudo, kvm, etc).
> At first glance user 'sshd' looks like a normal user; it has a uid of 1001
> right above the normal login user at 1000 which I'd intentionally added.

As I already explained twice on IRC (to which you did not answer), if
you have specific requirements about uids/gids, you can already provide
your own /etc/passwd and /etc/group files, with the uids and gids you
need.

Also beware about automatic uid/gid assignent: they are not guaranteed
to be stable between two versions of Buildroot and/or two different
configurations.

For example, consider that you do a first build with sshd (or whatever
else, just an example) enabled, and it gets uid 27. You deploy this
build in production, and sshd created files on a remanent filesystem.
Then you decide to add new features to your device, and enable httpd
(another example). httpd sorts before sshd, so will be first to get
assigned a uid, and thus gets 27, while sshd now gets 42. Then you
deploy your new build in production.

Boom. The new sshd user can't read/write the files created by the
previous sshd user, because it is no longer the same uid.

To fix that, you really want to provide your own /etc/paswd and
/etc/group files when you have requirements on the uid and gid
assignemnts.

The auto-assignment by Buildroot is a best-effort, and exists just as a
starting point, but mostly as a check that no two-or-more usernames use
the same uid (ditto gid).

> I'm sorry, but I think it's messy, and I'd like to clean it up. I like that
> uid/gid are within their usual system/normal regions; it makes it easier to
> see what's going on, specifically which users and groups belong to the
> system, and which groups that are main user groups.

And again, as I said on IRC, the "usual system/normal regions" don't
mean anything. For my use-case, I have to generate all users in the
range 10000..10999. So your patches do not cover this use-case either.

An alternate solution I've been working on sometime ago, was to have two
new config entries:

    config BR2_UID_AUTO_MIN
        bool "lowest uid"
        int
        default 1000
        help
          The lowest UID assigned automatically by Buildroot.

    config BR2_UID_AUTO_MAX
        bool "highest uid"
        int
        default 1999
        help
          The gighest UID assigned automatically by Buildroot.

Which would be much more interesting to have (ditto gid).

Maybe I'll have time to finish it in the coming days...

> Just because it's an embedded system, doesn't mean we have to be sloppy
> about this ;)  I know it may sound subjective and based on personal

Sorry, but we're not beig sloppy. What are a "system user" or a
"non-system user"? The definition is not clear at all. On an embedded
device, I would argue that all users are system users, because there is
no human interacting with the device like they would interact with a
traditional distro.

> opinion, but it is actually conforming to standard, and I'm inclined to
> think it's for a reason.

What standard are you refering to?

> Also note, this change doesn't require any of the current packages to take
> any action; they'll simply have their users and groups moved into the
> normal system region from now on.  My guess is that this will fit perfectly
> for the majority of packages. Of course, if any packages provide normal,
> login users, these ought to be changed to -2 instead.  But nothing will
> break.

Still, I don't think that "system" vs. "non-system" users make sense,
and moreover, the stability of uids/gids is much more important, and
requires that packages either provide an explixit uid/gid, or that the
/etc/passwd and /etc/group be provided.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
