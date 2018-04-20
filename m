From: Chris Packham <judge.packham@gmail.com>
Date: Fri, 20 Apr 2018 08:28:17 +0000
Subject: [Buildroot] [PATCH 1/2] syslog-ng: bump version header in conf
 file to 3.10
In-Reply-To: <20180419231745.66f6b641@windsurf.numericable.fr>
References: <20180419191418.28285-1-ricardo.martincoski@gmail.com>
 <20180419231745.66f6b641@windsurf.numericable.fr>
Message-ID: <CAFOYHZBWKhC2vbEMkpAw9CwTmJAA9uFk1WuTRv8EnpHG2JWa=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 20 Apr 2018, 9:18 AM Thomas Petazzoni, <thomas.petazzoni@bootlin.com>
wrote:

> Hello,
>
> On Thu, 19 Apr 2018 16:14:17 -0300, Ricardo Martincoski wrote:
> > From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
> >
> > Remove a runtime warning message about configuration file being too old.
> >
> > Do the same as commit 3dad25466d "syslog-ng: Bump version header in conf
> > file to 3.9". Package version of syslog-ng is 3.10.1, so bump version
> > number in syslog-ng.conf to 3.10.
> >
> > Also add a comment to avoid the same warning message reappears when the
> > package is bumped.
> >
> > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
> > Cc: Chris Packham <judge.packham@gmail.com>
>
> I've applied, thanks. A suggestion below, though.
>
> > diff --git a/package/syslog-ng/syslog-ng.conf
> b/package/syslog-ng/syslog-ng.conf
> > index a3384eebc3..e767255d71 100644
> > --- a/package/syslog-ng/syslog-ng.conf
> > +++ b/package/syslog-ng/syslog-ng.conf
> > @@ -1,4 +1,4 @@
> > - at version: 3.9
> > + at version: 3.10
>
> Why don't we replace this by:
>
> @version: VERSION_MAJOR
>
> > +# When updating the version, please check at runtime if version at
> > +# syslog-ng.conf header needs to be updated
> >  SYSLOG_NG_VERSION = 3.10.1
>
> And then:
>
> SYSLOG_NG_VERSION_MAJOR = 3.10
> SYSLOG_NG_VERSION = $(SYSLOG_NG_VERSION_MAJOR).1
>
> and do some $(SED) logic when installing syslog-ng.conf ?
>
> This would avoid the need to manually sync this stupid version
> number :-)
>

That'd work until there is an actual meaningful change in syntax.

Ideally syslog-ng would have a separate config version number. Even then
the default buildroot syslog-ng is so simple that it's more than likely it
won't be affected by most syntax changes. Last time I looked there wasn't a
simple enough default config in the syslog-ng repo that could just be used
without enabling optional features.

Realistically anyone wanting to use syslog-ng in anger will want to supply
their own config file(s), possibly with a local commit rebased on top of a
buildroot release. My only concern would be that the sed thing masks the
real error from such users. Given that buildroot has other mechanisms for
customising the root fs and no-one has asked for a "don't install the
default syslog-ng.conf" option I'm guessing that such a user doesn't yet
exist. If/when such a user appears we can tweak the seding to suit.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180420/79bf9eee/attachment.html>
