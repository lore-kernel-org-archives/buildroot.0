From: rdkehn at yahoo.com <rdkehn@yahoo.com>
Date: Wed, 23 Dec 2015 06:59:29 -0600
Subject: [Buildroot] [PATCH v7 1/1] package/unscd: new package
In-Reply-To: <20151222205808.2d24281e@free-electrons.com>
References: <1449068177-24100-1-git-send-email-rdkehn@yahoo.com>
 <20151222205808.2d24281e@free-electrons.com>
Message-ID: <20151223125929.GA12722@dkarchlinux64.currentcomm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Dec 22, 2015 at 08:58:08PM +0100, Thomas Petazzoni wrote:
> Dear Doug Kehn,
> 
> On Wed,  2 Dec 2015 08:56:17 -0600, Doug Kehn wrote:
> > A daemon which handles passwd, group and host lookups for running
> > programs and caches the results for the next query. This package is
> > intended to replace glibc nscd. Presently, glibc nscd is not installed
> > by Buildroot.
> > 
> > unscd depends on glibc because it relies on glibc function
> > __nss_disable_nscd.
> > 
> > nscd.conf is taken from glibc with unused configurations removed.
> > 
> > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
> > ---
> > Changes v6 -> v7
> >   - Re-add package/Config.in (Arnout).
> >   - Reword config help test (Arnout).
> >   - Remove commented params in nscd.conf (Arnout).
> >   - Rework BUILD_CMDS (Arnout/Thomas).
> >   - Reword commit log (Arnout).
> > Changes v5 -> v6
> >   - Remove toolchain patch/BR2_GLIBC_NSCD (Thomas).
> >   - Change source site from Debian to upstream (Thomas).
> >   - Update to version 0.52 (Thomas).
> > Changes v4 -> v5
> >   - Reincorporate $(APPLY_PATCHES) suggestion after update by Arnout.
> > Changes v3 -> v4
> >   - Incorporate feedback/suggestions by Yann and Maxime.
> > Changes v2 -> v3
> >   - Remove trailing '/' from UNSCD_SITE.
> >   - Whitespace cleanup.
> > Changes v1 -> v2
> >   - Incorporate feedback/suggestions by Yann (from nss-pam-ldapd patch).
> > ---
> >  package/Config.in        |  1 +
> >  package/unscd/Config.in  | 25 +++++++++++++++++++++++++
> >  package/unscd/S46unscd   | 24 ++++++++++++++++++++++++
> >  package/unscd/nscd.conf  | 33 +++++++++++++++++++++++++++++++++
> >  package/unscd/unscd.hash |  2 ++
> >  package/unscd/unscd.mk   | 36 ++++++++++++++++++++++++++++++++++++
> >  6 files changed, 121 insertions(+)
> >  create mode 100644 package/unscd/Config.in
> >  create mode 100644 package/unscd/S46unscd
> >  create mode 100644 package/unscd/nscd.conf
> >  create mode 100644 package/unscd/unscd.hash
> >  create mode 100644 package/unscd/unscd.mk
> 
> I've applied your patch. However, I think a follow-up patch would be
> good to add the use of a PID file in the init script. See for example
> S50dropbear for an example where a PID file is used.
> 

A PID file is created by unscd in /var/run/nscd/ when it is started.
The PID file is deleted when unscd is stopped; however, the
/var/run/nscd/ directory remains.

unscd can be started in debug mode (a.k.a foreground, -d option). In
doing so, PID file creation could be done in the init script as
requested. The problem I see here is that unscd logs to stderr when
started in debug mode.

Do you still prefer a patch for PID file creation in the init
script?

Thanks,
...doug
