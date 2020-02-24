From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 24 Feb 2020 09:22:50 +0100
Subject: [Buildroot] [PATCH v3 10/12] support/scripts/pkg-stats: set
 status to 'na' for virtual packages
In-Reply-To: <8bdee953-2805-0ca8-79b2-4d55d374a9a5@railnova.eu>
References: <20200222085715.23769-1-heiko.thiery@gmail.com>
 <20200222085715.23769-11-heiko.thiery@gmail.com>
 <8bdee953-2805-0ca8-79b2-4d55d374a9a5@railnova.eu>
Message-ID: <CAEyMn7Z3_ofSh+ZeACxoKTrk1JXeNnwbTsSZTwm9CuJ-OHXQ1g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Titouan and all,

Am So., 23. Feb. 2020 um 17:11 Uhr schrieb Titouan Christophe
<titouan.christophe@railnova.eu>:
>
> Hello Heiko and all,
>
> On 2/22/20 9:57 AM, Heiko Thiery wrote:
> > If there is no infra set or infra is virtual the status is set to 'na'.
> >
> > This is done for the follwing checks:
> >   - license
> >   - license-files
> >   - hash
> >   - hash-license
> >   - patches
> >   - version
> >
> > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> > ---
> >   support/scripts/pkg-stats | 26 ++++++++++++++++++++++++++
> >   1 file changed, 26 insertions(+)
> >
> > diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> > index e954dd125e..be3b6d7e71 100755
> > --- a/support/scripts/pkg-stats
> > +++ b/support/scripts/pkg-stats
> > @@ -125,6 +125,14 @@ class Package:
> >                   self.status['url'] = ("warning", "missing")
> >                   fp.close()
> >
> > +    def is_valid_infra(self):
> > +        try:
> > +            if self.infras[0][1] == 'virtual':
> > +                return False
> > +        except IndexError:
> > +                return False
> > +        return True
>
> You might want to make a property of this (like CVE.identifier).
> I would also suggest has_valid_infra, because a package is not an
> infrastructure :-)
>
> > +
> >       def set_infra(self):
> >           """
> >           Fills in the .infras field
> > @@ -146,6 +154,11 @@ class Package:
> >           """
> >           Fills in the .status['license'] and .status['license-files'] fields
> >           """
> > +        if self.is_valid_infra() == False:
>
> if not self.is_valid_infra():
>
> (or using a property, if not self.has_valid_infra:)
>
> > +            self.status['license'] = ("na", "no valid package infra")
> > +            self.status['license-files'] = ("na", "no valid package infra")
> > +            return
> > +
> >           var = self.pkgvar()
> >           self.status['license'] = ("error", "missing")
> >           self.status['license-files'] = ("error", "missing")
> > @@ -160,6 +173,11 @@ class Package:
> >           """
> >           Fills in the .status['hash'] field
> >           """
> > +        if self.is_valid_infra() == False:
>
> same
>
> > +            self.status['hash'] = ("na", "no valid package infra")
> > +            self.status['hash-license'] = ("na", "no valid package infra")
> > +            return
> > +
> >           hashpath = self.path.replace(".mk", ".hash")
> >           self.status['hash-license'] = ("na", "no hash file")
> >           if os.path.exists(hashpath):
> > @@ -180,6 +198,10 @@ class Package:
> >           """
> >           Fills in the .patch_count, .patch_files and .status['patches'] fields
> >           """
> > +        if self.is_valid_infra() == False:
>
> same
>
> > +            self.status['patches'] = ("na", "no valid package infra")
> > +            return
> > +
> >           pkgdir = os.path.dirname(self.path)
> >           for subdir, _, _ in os.walk(pkgdir):
> >               self.patch_files = fnmatch.filter(os.listdir(subdir), '*.patch')
> > @@ -558,6 +580,10 @@ def check_package_latest_version(packages):
> >           pkg.latest_version['version'] = r[1]
> >           pkg.latest_version['id'] = r[2]
> >
> > +        if pkg.is_valid_infra() == False:
>
> same
>
> > +            pkg.status['version'] = ("na", "no valid package infra")
> > +            continue
> > +
> >           if pkg.latest_version['status'] == RM_API_STATUS_ERROR:
> >               pkg.status['version'] = ('warning', 'RM API error')
> >           elif pkg.latest_version['status'] == RM_API_STATUS_NOT_FOUND:
> >
>

You're right with all of them .. I will change that for v4.

>
> Regards,
>
> Titouan

Thank you,
Heiko
