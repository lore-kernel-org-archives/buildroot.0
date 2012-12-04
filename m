From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Dec 2012 19:09:24 +0100
Subject: [Buildroot] [PATCH] package/crosstool-ng: update to 1.17.0
In-Reply-To: <20121204101228.2e78f9a1@skate>
References: <1354564065-24388-1-git-send-email-c.schoenert@t-online.de>
 <1354564065-24388-2-git-send-email-c.schoenert@t-online.de>
 <20121204101228.2e78f9a1@skate>
Message-ID: <201212041909.25267.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Carsten, All,

On Tuesday 04 December 2012 Thomas Petazzoni wrote:
> On Mon,  3 Dec 2012 20:47:45 +0100, Carsten Schoenert wrote:
> > From: Carsten Schoenert <c.schoenert@t-online.de>
> > 
> > Updating current crosstool-ng config files to 1.17.0
> >  crosstool-ng.config-eglibc
> >  crosstool-ng.config-glibc
> >  crosstool-ng.config-uClibc
> > 
> > Signed-off-by: Carsten Schoenert <c.schoenert@t-online.de>
> > ---
> >  package/crosstool-ng/crosstool-ng.mk               |    2 +-
> >  .../crosstool-ng.config-eglibc                     |   73 ++++++++++++++-----
> >  .../crosstool-ng.config-glibc                      |   74 +++++++++++++++-----
> >  .../crosstool-ng.config-uClibc                     |   71 ++++++++++++++-----
> >  4 files changed, 165 insertions(+), 55 deletions(-)
> 
> Thanks for doing this work. I think ct-ng now supports minimal
> defconfig files. Would it make sense to use that instead of
> full .config files in order to reduce the amount of churn when updating
> between ct-ng versions? Yann?

Indeed, but the defconfig support in crosstool-NG is not perfect yet, so
I think we should keep complete .config files for this release.

The problem with defconfigs in crosstool-NG is that there is no guarantee
about new symbols coming and going between versions, so this can result in
strange behaviors when a new version comes out, and a defconfig from a
previous version is used. Here's what may happen:

In version X, we use the latest stable 3.6 linux kernel, which is 3.6.2.
This is also the absolute latest version of the kernel. So we have this
symbol: LINUX_VER_3_6_2

The user did select this version. As 3.6.3 is the latest version, it is
the first item in the choice, so it does not appear in the defconfig,
being the default of the choice.

Now, version X+1 is out, and the stable 3.6 kernel is updated to 3.6.7,
so we get a new symbol, but the previous one no longer exists. Also,
kernel 3.7 is out, so the 3.6.7 is not the latest version available.

Now, the default symbol in the choice is not 3.6.x, but 3.7.x, which
is probably not what the user expected.

Thus, using the defconfig from the previous version will yield a
completely different .config.

This can be even more anoying with the gcc version, as we only have one
linaro release per gcc /generation/ (eg. 4.7). If the user did select
the latest linaro version (eg. 4.7) which was the default of the choice,
qnd the new release has a more recent mainstream version (eg. 4.8), but
no corresponding linaro version, then the gcc version will be bumnped
to 4.8, when the user did in fact want the linaro 4.7.

I have a pending change to fix this issue for all components, but it will
go in only for the next release, and that shall make using defconfigs from
a previous version relatively safe to use with a newer version.

Then, we can switch buildroot to using the ct-ng defconfigs, but until
then I think it is safer to use full .config files.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
