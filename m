From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jul 2021 14:51:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/mtd: update lib{mtd, ubi}.h path
In-Reply-To: <20210718140058.47ac4d31@windsurf>
References: <20210718083412.1904311-1-fontaine.fabrice@gmail.com>
 <20210718140058.47ac4d31@windsurf>
Message-ID: <20210718125136.GG12203@scaer>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Thomas, All,

On 2021-07-18 14:00 +0200, Thomas Petazzoni spake thusly:
> On Sun, 18 Jul 2021 10:34:12 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> 
> > Update lib{mtd,ubi}.h path to fix the following build failure raised
> > since bump of swupdate to version 2021.04 in commit
> > 2c6b0359c3b819fadb4437b2d780e95c32fdab21:
> > 
> > In file included from corelib/mtd-interface.c:21:
> > include/flash.h:13:10: fatal error: libmtd.h: No such file or directory
> >    13 | #include <libmtd.h>
> >       |          ^~~~~~~~~~
> > 
> > This build failure is raised because of
> > https://github.com/sbabic/swupdate/commit/0c672866d4a9fe8f0808b5d8a0afb95c13c4c138
> > 
> > Fixes:
> >  - http://autobuild.buildroot.org/results/d475bdb341d2afecf12e404dfa093e58221b9882
> > 
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/mtd/mtd.mk | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Isn't there a chance for this to break other packages? Is it just
> swupdate that is using the MTD headers?

Currently, in Buildroot, we havea few packages that depend on the 'mtd'
package;

  - fs/kffs2/
  - fs/ubifs/
      both want the mtd tools

  - busybox
      installs mtd applets

  - swupdate
      needs the headers

There are a few other refrences to '\<mtd\>', but none are about a build
dependency.

So, for Buildroot, only swupsdate seems to be impacted, indeed.

Still, using headers internal to another package is not nice from
swupdate...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
