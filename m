From: Akshay Bhat <akshay.bhat@timesys.com>
Date: Fri, 24 Apr 2020 10:36:02 -0400
Subject: [Buildroot] [PATCH 1/1] package/rsync: annotate CVE-2017-16548
In-Reply-To: <20200423235315.24b6e0e6@windsurf.home>
References: <20200301192727.209357-1-fontaine.fabrice@gmail.com>
 <20200423235315.24b6e0e6@windsurf.home>
Message-ID: <CACrMeVBacEVkaA5_qu7z+WVeEGBbTHOVWm+EuaZVHHEu0Mwjdg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 23, 2020 at 5:53 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> I'm adding in Cc: Matthew Weber and Akshay Bhat for the interaction
> with NVD.
>
> Also adding Titouan Christophe for the discussion about our script that
> does the CVE checking.
>
> On Sun,  1 Mar 2020 20:27:27 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > CVE-2017-165484 is misclassified (by our CVE tracker) as affecting
> > version 3.1.3, while in fact it affects 3.1.2 and 3.1.3-development
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/rsync/rsync.mk | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
> > index 52875e428a..95d19a7f4c 100644
> > --- a/package/rsync/rsync.mk
> > +++ b/package/rsync/rsync.mk
> > @@ -13,6 +13,10 @@ RSYNC_CONF_OPTS = \
> >       --with-included-zlib=no \
> >       --with-included-popt=no
> >
> > +# CVE-2017-165484 is misclassified (by our CVE tracker) as affecting version 3.1.3,
> > +# while in fact it affects 3.1.2 and 3.1.3-development
> > +RSYNC_IGNORE_CVES += CVE-2017-16548
>
> Indeed commit 47a63d90e71d3e19e0e96052bb8c6b9cb140ecc1 which fixes this
> CVE is part of the 3.1.3 release. This means the NVD database is wrong.
>
> Instead of doing a workaround in Buildroot, can we report this to the
> NVD maintainers ?


Thanks for finding this. I have sent the below information to NVD,
will post back once I hear more:
There is an error in the cpe version information for:
https://nvd.nist.gov/vuln/detail/CVE-2017-16548

The correct range should be:
From (excluding)
2.6.9
Up to (including)
3.1.2

Details:
Commit fixing the CVE:
https://git.samba.org/rsync.git/?p=rsync.git;a=commit;h=47a63d90e71d3e19e0e96052bb8c6b9cb140ecc1

Versions Containing fix:
$ git tag --contains 47a63d90e71d3e19e0e96052bb8c6b9cb140ecc1
v3.1.3
v3.1.3pre1

Commit introducing the CVE:
$ git log --oneline --diff-filter=A -- xattrs.c
16edf865 The improved --xattrs option is landing on the trunk.
Version introducing the CVE (excluding):
$ git -c 'versionsort.suffix=pre' tag --no-contains 16edf8659
--sort=-version:refname |head -1
v2.6.9

Thanks,
Akshay
