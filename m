From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 25 Jul 2017 18:07:26 +0200
Subject: [Buildroot] [PATCH 19/20] system: make systemd work on a
 read-only rootfs
In-Reply-To: <a5838b47-f369-1f47-f74d-5741284fde51@mind.be>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <c74e8ad5fca764a23b9392af5cb83ecefb4a5817.1500398733.git.yann.morin.1998@free.fr>
 <f137feaf-3cb1-4a9a-0331-d51bca014f50@mind.be>
 <20170724154552.GC2918@scaer>
 <a5838b47-f369-1f47-f74d-5741284fde51@mind.be>
Message-ID: <20170725160726.GA2773@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-07-25 00:44 +0200, Arnout Vandecappelle spake thusly:
> On 24-07-17 17:45, Yann E. MORIN wrote:
> > On 2017-07-24 00:18 +0200, Arnout Vandecappelle spake thusly:
> >> On 18-07-17 19:25, Yann E. MORIN wrote:
[--SNIP--]
>  Thinking out of the box: can we make /var a symlink to /tmp/var, and avoid
> creating a tmpfs on /var at all? Since /tmp/var doesn't exist, "C! /tmp/var"
> should work, no? Or did that cause journald to bail out?

Worth a try, of course. But still we'd need hoks of some kind to allow
package to install in /var at build time, and move that to factory at
the end of the build, while still preserving the ability to be able to
rebuild stuff without requiring a 'make clean'.

[--SNIP symlinks in /var--]
>  There is unfortunately no way to fix this. If the package is smart, it does
> calculates the relative path based on the real path of the source and
> destination. If the package is stupid, it just assumes ../something. Whatever we
> do, one of them will break... The only safe approach would be to put stuff in
> /factory instead of /usr/share/factory.

But that is not where systemd-tmpfiles will look at...

Unless you meant we have /factory during the build, then move it at the
moment we aggregaate the images, and move it back (moving the problem
from handling /var to handling /factory instead) ?

[--SNIP--]
> > Not really, because systemd-tmpfile will look in exactly the factory
> > path to find the source of the copy/link. See the exerpt I pasted above.
> > 
> > So, given this entry, for example:
> > 
> >     C /var/foo - - - -
> > 
> > systemd-tmpfiles will see if it can find /usr/share/factory/foo not
> > /usr/share/factory/var/foo
> 
>  Weird, the way I read both the man page and the source code seem to suggest
> that "C /var/something" will copy from /usr/share/factory/var/something... But I
> guess you tested that so I must be misreading the source code.

And of course you are right.

It just happened that my testing was borked because systemd (or one of
its minions like journald) would create the required directory structure
and files they need, so I did not see mine were not copied over. Now I
have another test that does not use those "standard" files, and I'll add
it to the testing infra.

So yes, it should be /usr/share/factory/var/foo to populate /var/foo.

Which led to another bug, which is that tmpfiles should be in
/etc/tmpfiles.d/ and not in /etc/systemd/tmpfiles.d/

I've now fixed that.

However (thinking aloud now), I have another tentative to do, which
instead of creating a symlink for /var at runtime, would just creat it
as a direcotry as expected.

Then the hooks would simply "mv /var /usr/share/factory/var; mkdir /var",
create the tmpfiles entries, aggregate the image(s), the rm -rf /var; mv
/usr/share/factory/var /var".

This is probably much simpler than moving the entries one by one.

The only drawback in this case would be a package that already creates a
factory/var/foo entry. It would end up in /var/foo afterwards... :-/
So I think the /var symlink is better, in fact, so I'll keep that.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
