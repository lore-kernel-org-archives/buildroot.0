From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Feb 2017 15:36:39 +0100
Subject: [Buildroot] [PATCH v2] package/xfsprogs: fix static build
In-Reply-To: <20170226143311.1a60f588@free-electrons.com>
References: <1488107943-17075-1-git-send-email-yann.morin.1998@free.fr>
 <20170226143311.1a60f588@free-electrons.com>
Message-ID: <20170226143639.GB4043@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-02-26 14:33 +0100, Thomas Petazzoni spake thusly:
> On Sun, 26 Feb 2017 12:19:03 +0100, Yann E. MORIN wrote:
> > xfsprogs links to some libraries from util-linux. Those in turn may use
> > i18n functions when locales are enabled.
> > 
> > When doing a uClibc build, those i18n functions are provided by the
> > libintl library from the gettext package.
> > 
> > xfsprogs does not use pkgconfig to find the util-linux libraries, so it
> > misses the Requires.private field from libblkid, and thus misses the
> > Libs.private field from libuid.
> > 
> > And so a static link fails because of undefined references to i18n
> > symbols.
> > 
> > Furthermore, xfsprogs does not use automake; the hand-made Makefiles do
> > not make use of the LIBS variable set by configure.
> > 
> > We fix that in two ways:
> > 
> >   - pass LIBS=-lintl to configure, so that the configure step has a
> >     chance to succeed  (as suggested by Waldemar)
> > 
> >   - patch a Makefile to link with EXTRALIBS, and pass EXTRALIBS via
> >     XFSPROGS_MAKE_OPTS
> > 
> > Fixes:
> >     http://autobuild.buildroot.org/results/503/50314716a9f72e8bb238e52e9dc342c68f7e0b8b/
> >     http://autobuild.buildroot.org/results/253/253a024698b55dece992b2631e30edf4ff9092f7/
> >     http://autobuild.buildroot.org/results/3fe/3fe0d96cf13af12b0051a95f7865d4e38f4a78af/
> >     http://autobuild.buildroot.org/results/d48/d48e61785d25d33106b7dab1b5cb200cf27d4044/
> >     ...
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Waldemar Brodkorb <wbx@openadk.org>
> > 
> > ---
> > Changs v1 -> v2:
> >   - add commit log to patch itself
> > ---
> >  .../0004-build-add-EXTRALIBS-to-link-with.patch    | 53 ++++++++++++++++++++++
> >  package/xfsprogs/xfsprogs.mk                       | 17 +++++++
> >  2 files changed, 70 insertions(+)
> >  create mode 100644 package/xfsprogs/0004-build-add-EXTRALIBS-to-link-with.patch
> 
> I've applied to master, because it fixes a build issue, but I'm not
> super happy with the proposed solution. I think xfsprogs should be
> using pkg-config instead (at least if available). This would be much
> better.

Indeed, but this is a much bigger endeavour... :-/

> Maybe this issue can be reported upstream, and we can explain them the
> value of using pkg-config in such a situation?

I've sent the patch as-is to upstream. Let's see what they have to say
(URL not yet available on their archive page).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
