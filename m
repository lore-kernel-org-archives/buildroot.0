From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 4 Jul 2018 18:39:28 +0200
Subject: [Buildroot] [PATCH 00/50] busybox: invert dependencies
In-Reply-To: <907b4fa8-f2c6-120d-4980-95b9a5e656a1@mind.be>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
 <907b4fa8-f2c6-120d-4980-95b9a5e656a1@mind.be>
Message-ID: <20180704163928.GB2595@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, all,

On 2018-07-04 00:56 +0200, Arnout Vandecappelle spake thusly:
> On 07/02/18 23:12, Yann E. MORIN wrote:
> > Hello All!
> > 
> > Currently, the issue that busybox may install the same executables as
> > those from other packages, is handled in all those packages. This is
> > not very practical.
> 
>  The reverse is also not very practical...

The reverse means that the dependencies are sprinkled in all those
packages, while now they are all nicely gathered in a single location.
At least, I believe this is a maintenance improvment; not an enormous
gain, but still.

> > Furthermore, this means that those packages all overwrite the
> > busybox-installed applets, which means that this triggers the
> > no-two-packages-touch-the-same-file rule. So far, this is only a
> > warning, but when we eventually go with TLPB, we'll have to enforce
> > that rule.
> 
>  Although we've already discussed this a couple of times in BR meetings, we
> never found a solution that is really satisfactory.

I'm not sure what you mean by "satisfactory". If speakign about busybox,
I think this solution is technically better than the alternative,
current situation, at least becasue we know that busybox will enforce a
noclobber install (heck, this was already the case with our hook), while
we can not easily audit all packages to be sure they properly install
their executalbes.

For example, the attr package we current have will forcibly overwrite
any destination file without unlinking it, thus effectively replacing
/usr/bin/setfattr withits own code, and if that fiel happens to be a
hardlink or a symlink to busybox, we lose busybox. See
    https://bugs.busybox.net/show_bug.cgi?id=10986

So, I think it is better to rely on a single package we know behaves
correctly.

>  However, I have a new idea now...
> 
>  IIUC, with PPS, there is no real problem with two packages touching the same
> file, as long as the dependency is explicitly tracked in Buildroot, right?
> Because when it is explicitly tracked, the file created by package A will always
> be present in package B's PPS when package B is built, so it's perfectly
> reproducible.

Yes.

>  For the case of two packages *writing* the same file (without looking at the
> previous contents, i.e. not appending or anything like that), the constraint is
> even lighter: there doesn't really need to be an explicit dependency, we just
> have to make sure that when the rsync is done, the order is predictable. That's
> just a matter of sorting. But also, we want it not just to be predictable, but
> also in the "correct" order, e.g. if busybox is a dependency, it should be
> rsync'd before another package that creates the same executable. The rsync will
> then overwrite it (because the rsyncs are not done in parallel).

Should be, yes.

>  For that particular ordering, I think there could be a simpler solution than
> enumerating all those dependencies in busybox.mk. We could give each package a
> priority, and use that priority to order the rsync's. The default priority would
> be e.g. 5, and busybox would get e.g. 3. That way, we only need BUSYBOX_PRIORITY
> = 3 in busybox.mk, and everything is solved.

Please, no, do not introduce a notion of 'priority'. That is ugly, and
it does not work in the long term, because it is hard to maintain. One
pain point of priorities is detecting how a change in A's priority will
play against the priorities of all other A-related packages, especially
since there will no longer be a mean to find those relations (as the
FOO_DEPENDENCIES would get dropped in all A-related packages).

If I go even further, we have ntp and openntp and busybox that can
provide an ntp implementation, so we'd have to have non-conflicting
priorities for all those three.  And then (just an example) what about
apache, lighttpd, nginx, and busybox, which may all install an httpd
executable?

So we'd have to also find a priority for that set, and now that new
priority for busybox may come conflicting with the priority we found for
the ntp implementations...

Then factor in all other busybox-related packages that will in turn need
a priority.

So, this is a pain...

So, priorities are just re-inventing a kind of dependencies, except it
is not a build dependency, but an install dependency... Let's call a cat
a cat. We may introduce a FOO_INSTALL_DEPENDENCIES variable, where foo
would list the packages that must be installed before it, but which may
be built in any order witho itself.

But this is still an explicit list, and this does not get us much
further than what we already have...

>  Obviously, it would make the infra more complicated :-)

Yes, and the gain is so minimal, without even considering the risk of
incorrectness, that I don't believe this is a good idea...

>  We would then also need to change the "two packages touching same file" check
> to be error out only if they have the same priority.
> 
>  For the other packages that install the same file (e.g ntp <> openntpd, the
> different nmaps, ...), we can then use the same simple resolution rather than
> explicitly encoding the dependency. We would still need to choose the priority
> (which is a bit arbitrary), we would still need to detect the conflict, and we
> would still need to verify that this conflict really is of the "overwrite" type
> and not the "append" type. So it's not a silver bullet, but it might make
> maintenance a little bit simpler.
> 
>  What do you think?

Besides the arguments I explained above, I'm afraid my gut-feeling is
really bad about that... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
