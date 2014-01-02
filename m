From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 2 Jan 2014 14:33:16 +0200
Subject: [Buildroot] [PATCH] uclibc: snapshot: add BSD obsolete signal
 functions
In-Reply-To: <20140102132318.7315ddde@skate>
References: <1797e4d78b86649e8a9d5aa44cef8fd83b81825f.1388663583.git.baruch@tkos.co.il>
 <20140102132318.7315ddde@skate>
Message-ID: <20140102123316.GD6589@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Jan 02, 2014 at 01:23:18PM +0100, Thomas Petazzoni wrote:
> On Thu,  2 Jan 2014 13:53:03 +0200, Baruch Siach wrote:
> > Fixes
> > http://autobuild.buildroot.net/results/70b/70b79ca0aa97ed451a5679029955ed3709c84b67/.
> > 
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> >  package/uclibc/uClibc-snapshot.config | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/package/uclibc/uClibc-snapshot.config b/package/uclibc/uClibc-snapshot.config
> > index 9ca3f9ea983d..890aefd8ec59 100644
> > --- a/package/uclibc/uClibc-snapshot.config
> > +++ b/package/uclibc/uClibc-snapshot.config
> > @@ -152,7 +152,7 @@ UCLIBC_LINUX_SPECIFIC=y
> >  UCLIBC_HAS_GNU_ERROR=y
> >  UCLIBC_BSD_SPECIFIC=y
> >  UCLIBC_HAS_BSD_ERR=y
> > -# UCLIBC_HAS_OBSOLETE_BSD_SIGNAL is not set
> > +UCLIBC_HAS_OBSOLETE_BSD_SIGNAL=y
> 
> We don't have this option enabled in the uClibc-0.9.33.config. Is there
> a reason why it should be enabled for the uClibc-snapshot.config and
> not for uClibc-0.9.33.config ? Does netsnmp builds with uClibc 0.9.33
> on some other architecture?

The netsnmp configure scripts tests for sighold(). This test fails when 
UCLIBC_HAS_OBSOLETE_BSD_SIGNAL is disabled. In this case the code in 
apps/snmpnetstat/if.c uses the alternative sigblock() API. This has been 
removed completely from uClibc after 0.9.33 with commit 5aa7aa7fa7ec2a 
(signal: remove sigblock, siggetmask and sigsetmask). That's why we need 
UCLIBC_HAS_OBSOLETE_BSD_SIGNAL for netsnmp to build only when uClibc snapshot 
is selected.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
