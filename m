From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Nov 2014 23:23:19 +0100
Subject: [Buildroot] [PATCH next] python-certifi: add new package
In-Reply-To: <20141118230733.3bc8209f@free-electrons.com>
References: <1416255614-4876-1-git-send-email-yegorslists@googlemail.com>
 <20141118230733.3bc8209f@free-electrons.com>
Message-ID: <546BC6D7.5060909@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/11/14 23:07, Thomas Petazzoni wrote:
> Dear Yegor Yefremov,
>
> I was going to commit this one, but...
>
> On Mon, 17 Nov 2014 21:20:14 +0100, Yegor Yefremov wrote:
> > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> > ---
> >  package/Config.in                        |  1 +
> >  package/python-certifi/Config.in         |  6 ++++++
> >  package/python-certifi/python-certifi.mk | 14 ++++++++++++++
> >  3 files changed, 21 insertions(+)
> >  create mode 100644 package/python-certifi/Config.in
> >  create mode 100644 package/python-certifi/python-certifi.mk
> >
> > diff --git a/package/Config.in b/package/Config.in
> > index d59876f..fb46623 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -482,6 +482,7 @@ endif
> >  if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
> >  menu "external python modules"
> >      source "package/python-bottle/Config.in"
> > +    source "package/python-certifi/Config.in"
> >      source "package/python-cffi/Config.in"
> >      source "package/python-configobj/Config.in"
> >      source "package/python-configshell-fb/Config.in"
> > diff --git a/package/python-certifi/Config.in b/package/python-certifi/Config.in
> > new file mode 100644
> > index 0000000..9390b4f
> > --- /dev/null
> > +++ b/package/python-certifi/Config.in
> > @@ -0,0 +1,6 @@
> > +config BR2_PACKAGE_PYTHON_CERTIFI
> > +    bool "python-certifi"
>
> We need a depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3 here. I
> know it's not very useful since Python packages can anyway only be
> selected when either Python or Python 3 are enabled, but we have this
> conditional for all Python packages, so we should remain consistent and
> have it there as well.

 Well, a quick grep in next shows that we have 8 packages without this depends,
and 14 packages with the depends.

 However, since the python packages that have recently been added by Peter do
not have the depends, and since he told Yegor to remove the depends in
python-webpy, I think the rule now is _not_ to have the depends.

>
> Maybe one day we'll remove this conditional on packages that support
> both Python 2 and Python 3.
>
> But that's not the biggest problem (I added the conditional myself).
>
> > +PYTHON_CERTIFI_VERSION = 14.05.14
> > +PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
> > +PYTHON_CERTIFI_SITE = https://pypi.python.org/packages/source/c/certifi
> > +PYTHON_CERTIFI_SETUP_TYPE = setuptools
> > +PYTHON_CERTIFI_LICENSE = ISC
> > +PYTHON_CERTIFI_LICENSE_FILES = LICENSE
>
> The biggest problem is the licensing information. Indeed PKG-INFO
> indicates that it's licensed under the ISC, but the LICENSE file is
> pretty unclear about, it doesn't mention the ISC at all, and instead
> talks about the Mozilla Public License.
>
> So the licensing details of this package are pretty unclear. Can you
> dig a little bit, and see what is the actual license for this package?

 It's pretty clear to me: the certificate database itself is MPL, the python
code around it is ISC.
Actually, since it's only about 5 lines of code, I doubt the python code is even
copyrightable, but let's ignore that :-)


 Regards,
 Arnout

>
> I've Cc'ed a bunch of licensing aware folks, in case they have an
> opinion.
>
> Thanks a lot!
>
> Thomas
>


-- 
Arnout Vandecappelle arnout at mind be
Senior Embedded Software Architect +32-16-286500
Essensium/Mind http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint: 7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
