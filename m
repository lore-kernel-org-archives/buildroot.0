From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 14 Apr 2014 14:56:28 +0000
Subject: [Buildroot] [PATCH] libglib2: fix compilation for aarch64 and
 arc
In-Reply-To: <20140412160057.38777048@skate>
References: <1397141196-1316-1-git-send-email-abrodkin@synopsys.com>
 <20140412160057.38777048@skate>
Message-ID: <1397487387.9266.50.camel@abrodkin-8560l.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, 2014-04-12 at 16:00 +0200, Thomas Petazzoni wrote:
> Dear Alexey Brodkin,
> 
> On Thu, 10 Apr 2014 18:46:36 +0400, Alexey Brodkin wrote:
> > Copied from here - https://github.com/openembedded/oe-core/blob/master/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-Fix-Werror-format-string-errors-from-mismatched-.patch
> > 
> > Initially posted here - http://lists.openembedded.org/pipermail/openembedded-core/2013-October/085174.html
> > 
> > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> > ---
> >  ...ror-format-string-errors-from-mismatched-.patch | 56 ++++++++++++++++++++++
> >  1 file changed, 56 insertions(+)
> >  create mode 100644 package/libglib2/0001-gio-Fix-Werror-format-string-errors-from-mismatched-.patch
> 
> Thanks. Is this fixing an issue reported by the autobuilders? If not,
> under what conditions are you seeing the problem?

This is definitely not an autobuild reported issue.
I faced this issue while building "libglib2" for ARC architecture
myself.

As it turned out I was not able to reproduce the same issue for aarch64
as it was mentioned on openembedded mailing list.

The issue itself only happens if G_GSIZE_FORMAT differs from
G_GSSIZE_FORMAT. And this is only the case for ARC because "size_t" for
ARC is "long unsigned int" while "ssize_t" is "unsigned int" (which is
the type of "ssize_t" on most 32-bit arches).

Still this issue needs to be fixed for ARC in buildroot and and
fortunately it was fixed in upstream right after 2.38 version was
released. Here's the commit in question -
https://git.gnome.org/browse/glib/commit/?id=0167c3340d8201dca8e9031b61703bbc5ed6ce33

Another good fix of this problem could be in bumping glib version to
recently released 2.40. And I indeed may send a patch that bumps glib
version to buildroot mailing list but since I don't really use much
glib-based apps on ARC I'm not sure if I may make sure this bump doesn't
break stuff for people.

If you think that something simple like building and execution of
"gtk-demo" app is good enough test then I may try it and if it work I
will send a patch - what do you think?

Regards,
Alexey
