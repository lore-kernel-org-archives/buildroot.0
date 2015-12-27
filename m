From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 27 Dec 2015 11:54:37 +0100
Subject: [Buildroot] [PATCH] package/gettext: host variant needs
 host-libxml2
In-Reply-To: <20151227114427.554e436b@free-electrons.com>
References: <1451165734-15534-1-git-send-email-yann.morin.1998@free.fr>
 <20151227114427.554e436b@free-electrons.com>
Message-ID: <20151227105437.GC3483@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-12-27 11:44 +0100, Thomas Petazzoni spake thusly:
> On Sat, 26 Dec 2015 22:35:34 +0100, Yann E. MORIN wrote:
> > From: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>
> > 
> > Of host-gettext, we only build the tools. however some of those tools
> > have a --color option, which needs libxml2.
> > 
> > If the libxml2 development files are missing on the host, a bundled
> > subset of libxml2 is used, and all seems OK. But if they ar epresent,
> > then the host libxml2 is used. On some distros, lbxml2 is linked with
> > liblzma. And if we happend to _then_ build our host-liblzma, we may have
> > a conflict later when trying to run any of the host-gettext tools.
> > 
> > Always build host-gettext with our own host-libxml2 which is not linked
> > with liblzma.
> > 
> > Fixes https://bugs.busybox.net/show_bug.cgi?id=7886
> > 
> > Signed-off-by: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>
> > [nicolas: added extended commit message]
> > Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> > [yann.morin.1998 at free.fr: rebase; add comment; enhance commit log]
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Thanks for reviving this old patch. I do remember it, and I believe
> back then I raised the concern that unconditionally building
> host-libxml2 as a dependency of host-gettext would add quite a bit of
> build time (to a package that already takes an awful lot of time to
> build for what it does, but that's another story).
> 
> So I did a measurement:
> 
>  * If we force the usage of the included libxml2, then the time needed
>    to do "make host-gettext" from an empty build is:
> 
> 	real	1m40.892s
> 	user	2m38.664s
> 	sys	0m13.132s
> 
>  * If we use your patch, which unconditionally adds the dependency on
>    host-libxml2, the time needed to do a "make host-gettext" from an
>    empty build is:
> 
> 	real    2m21.035s
> 	user    3m51.956s
> 	sys     0m16.020s
> 
> So about a 40 seconds build time difference. I'm not sure what to
> decide from that. 40 seconds is not that long, but host-gettext is
> already quite long to build...
> 
> Thoughts ? Opinions ?

Well, we also have to consider why we have to build host-gettext: it is
a dependency of quite a few packages. I did not try to time-build all of
them, but we have to really compare the extra time to the time it takes
to build the real packages that need host-gettext. Surely, we're already
adding 2m21s to the build time of those packages; adding 40s more is not
transparent, but still better than the situation we currently have with
library mismatch.

Also, as Vicente replied, we already need to build host-libxml2 in some
cases, so we may end up building it twice if we were to use the bundled
one.

A solution would have been to use host-libxml2 if something else depends
on it, and fallback to the bundled one otherwsie, but we have no way to
know if a host-libxml2 is to be built or not (no Kconfig variable for it).

I would prefer to spend more build time for a reproducible build, at
least.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
