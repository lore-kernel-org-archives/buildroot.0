From: Stephan Henningsen <stephan@asklandd.dk>
Date: Thu, 24 Oct 2019 01:03:29 +0200
Subject: [Buildroot] [PATCH 1/1] support/scripts: added support for
 system and normal uid/gid.
In-Reply-To: <6d916570-a766-3dc5-94c2-acc438b622d7@mind.be>
References: <20191023211313.6758-1-stephan+buildroot@asklandd.dk>
 <6d916570-a766-3dc5-94c2-acc438b622d7@mind.be>
Message-ID: <CAH0Z9Q+zNbuN31Kbw77PQrq7FukmMmJLkvCYD+_4=poYB5D34Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi.

First of all: Sorry for the spam!  I'm...new here.

There's no technical difference between the two. It's purely
organizational. Also, it's standard on all the Linux dists I've used; all
except Buildroot.

Yet I made this change because I was annoyed with how my /etc/passwd and
/etc/group looked; my normal, real, login users were mixed up with system
uids and gids (sshd, sudo, kvm, etc).
At first glance user 'sshd' looks like a normal user; it has a uid of 1001
right above the normal login user at 1000 which I'd intentionally added.

I'm sorry, but I think it's messy, and I'd like to clean it up. I like that
uid/gid are within their usual system/normal regions; it makes it easier to
see what's going on, specifically which users and groups belong to the
system, and which groups that are main user groups.

Just because it's an embedded system, doesn't mean we have to be sloppy
about this ;)  I know it may sound subjective and based on personal
opinion, but it is actually conforming to standard, and I'm inclined to
think it's for a reason.

Also note, this change doesn't require any of the current packages to take
any action; they'll simply have their users and groups moved into the
normal system region from now on.  My guess is that this will fit perfectly
for the majority of packages. Of course, if any packages provide normal,
login users, these ought to be changed to -2 instead.  But nothing will
break.

So, that's it.

Some quick links on the topic to move you in the right direction ;)
- https://unix.stackexchange.com/a/80279/61306
-
https://geek-university.com/linux/uid-user-identifier-gid-group-identifier/

Yours,
Stephan

On Thu, Oct 24, 2019 at 12:27 AM Arnout Vandecappelle <arnout@mind.be>
wrote:

>  Hi Stephan,
>
> On 23/10/2019 23:13, Stephan Henningsen wrote:
> > Signed-off-by: Stephan Henningsen <stephan+buildroot@asklandd.dk>
>
>  What exactly is the difference between a system uid and a normal uid?
>
>  I remember back in the days before dynamic uid assignment, it was
> customary to
> make sure that the uids created by the sysadmin were in a high range,
> distinct
> from the uids created by the package manager. I guess this was because the
> package manager's uids are always local, while the sysadmin's uids could
> be used
> over NFS. But I'm not a sysadmin :-)
>
>  However, I don't see how this could ever be relevant in a Buildroot
> context.
> Can you give an example of how this is supposed to be used?
>
>  Regards,
>  Arnout
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191024/ee871f2c/attachment.html>
