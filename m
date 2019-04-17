From: Vadim Kochan <vadim4j@gmail.com>
Date: Thu, 18 Apr 2019 00:48:58 +0300
Subject: [Buildroot] [RFC 1/1] docs/adding-packages-generic.txt: Add
 note if package does not use source
In-Reply-To: <7ae95e75-4a5a-006a-db84-bc6b327849e4@mind.be>
References: <20190417071712.7238-1-vadim4j@gmail.com>
 <7ae95e75-4a5a-006a-db84-bc6b327849e4@mind.be>
Message-ID: <20190417214858.ede4xzogjreibkes@vkochan-ThinkPad-T470p>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, All,

On Wed, Apr 17, 2019 at 11:30:56PM +0200, Arnout Vandecappelle wrote:
> 
> 
> On 17/04/2019 09:17, Vadim Kochan wrote:
> > Add some description how to allow to add package which does not need
> > any source code.
> > 
> > Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> > ---
> >  docs/manual/adding-packages-generic.txt | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
> > index 7be1754f54..96a57a519a 100644
> > --- a/docs/manual/adding-packages-generic.txt
> > +++ b/docs/manual/adding-packages-generic.txt
> > @@ -223,8 +223,13 @@ not and can not work as people would expect it should:
> >    which Buildroot will use to download the tarball from
> >    +LIBFOO_SITE+. If +HOST_LIBFOO_SOURCE+ is not specified, it defaults
> >    to +LIBFOO_SOURCE+. If none are specified, then the value is assumed
> > -  to be +libfoo-$(LIBFOO_VERSION).tar.gz+. +
> > -  Example: +LIBFOO_SOURCE = foobar-$(LIBFOO_VERSION).tar.bz2+
> > +  to be +libfoo-$(LIBFOO_VERSION).tar.gz+.
> > +  In case when the package does not use any source code (e.g. only performs
> > +  some target/host altering), then +LIBFOO_SOURCE+ should be specified
> > +  with empty value. +
> > +  Examples:
> > +    +LIBFOO_SOURCE = foobar-$(LIBFOO_VERSION).tar.bz2+
> > +    +LIBFOO_SOURCE =
> 
>  I'm probably stupid, but when is this needed? E.g. skeleton-init-sysv doesn't
> have any code, and it doesn't set _SOURCE to empty...
> 
>  Regards,
>  Arnout

Ohhh, So now I realize what was wrong ... looks like I got issue when I
use _VERSION in my custom package but it failed to "build" w/o _SOURCE
because _SOURCE automatically was set including this _VERSION value, and
only after I set "*_SOURCE=" then it fixed my problem. OK, this patch is
wrong, I will drop it. Thanks for point it!

Regards,
Vadim Kochan
> 
> >  
> >  * +LIBFOO_PATCH+ may contain a space-separated list of patch file
> >    names, that Buildroot will download and apply to the package source
> > 
