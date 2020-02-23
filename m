From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun, 23 Feb 2020 22:23:06 +0100
Subject: [Buildroot] [PATCH v3 02/12] support/scripts/pkg-stats: store
 patch files for the package
In-Reply-To: <e98028a0-9e0f-bfb7-0bd0-d70ef2a1bbfc@railnova.eu>
References: <20200222085715.23769-1-heiko.thiery@gmail.com>
 <20200222085715.23769-3-heiko.thiery@gmail.com>
 <e98028a0-9e0f-bfb7-0bd0-d70ef2a1bbfc@railnova.eu>
Message-ID: <CAEyMn7ZwKzgELhQ3S07xDHCjMQfwQ3N8mJvUPv5JBF6_2AxyGg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Titouan and all,

Am So., 23. Feb. 2020 um 14:35 Uhr schrieb Titouan Christophe
<titouan.christophe@railnova.eu>:
>
> Heiko,
>
>
> On 2/22/20 9:57 AM, Heiko Thiery wrote:
> > From: Heiko Thiery <heiko.thiery@kontron.com>
> >
> > Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
> > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
>
> Same as the previous patch, signed off with 2 different email addresses.
>
> > ---
> >   support/scripts/pkg-stats | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> > index 8cc78f2f66..4c963cef0f 100755
> > --- a/support/scripts/pkg-stats
> > +++ b/support/scripts/pkg-stats
> > @@ -65,6 +65,7 @@ class Package:
> >           self.has_license_files = False
> >           self.has_hash = False
> >           self.patch_count = 0
> > +        self.patch_files = []
> >           self.warnings = 0
> >           self.current_version = None
> >           self.url = None
> > @@ -131,10 +132,10 @@ class Package:
> >           """
> >           Fills in the .patch_count field
> >           """
> > -        self.patch_count = 0
> >           pkgdir = os.path.dirname(self.path)
> >           for subdir, _, _ in os.walk(pkgdir):
> > -            self.patch_count += len(fnmatch.filter(os.listdir(subdir), '*.patch'))
> > +            self.patch_files = fnmatch.filter(os.listdir(subdir), '*.patch')
> > +            self.patch_count = len(self.patch_files)
>
> We can compute the patch_count only once after looping through all the
> files, no need to update it at each step.
>
> Maybe we can also entirely remove this patch_count attribute from the
> Package class, and define it as a property:

This is a good idea. Just to mention then we lose this field in the
json output. I don't know if there is another user for that. I can
change the fields in the buildroot-stats app to use the length of the
patches list. Has anyone concerns about remove the attribute?

> class Package:
>      # ...
>      @property
>      def patch_count(self):
>          return len(self.patch_files)
>
> >
> >       def set_current_version(self):
> >           """
> >
>
>
> Best regards,
>
> Titouan

Thank you,
Heiko
