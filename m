From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Sep 2015 23:37:51 +0200
Subject: [Buildroot] [PATCH 1/2] dos2unix: add target support
In-Reply-To: <d04d05bf5fb09fd02747689fe348375cdff4fc6a.1441089817.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 1 Sep 2015 09:43:36 +0300")
References: <d04d05bf5fb09fd02747689fe348375cdff4fc6a.1441089817.git.baruch@tkos.co.il>
Message-ID: <87a8t5q0r4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > From: James Knight <james.knight@rockwellcollins.com>
 > Allow the `dos2unix` utility to be built and installed on the target
 > system.

 > [baruch: properly handle target gettext]
 > Signed-off-by: James Knight <james.knight@rockwellcollins.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > ---
 > v2:
 >    * Fix static build with gettext
 >    * Support build without locale support
 > ---
 >  package/Config.in            |  3 +++
 >  package/dos2unix/Config.in   | 11 +++++++++++
 >  package/dos2unix/dos2unix.mk | 24 +++++++++++++++++++++---
 >  3 files changed, 35 insertions(+), 3 deletions(-)
 >  create mode 100644 package/dos2unix/Config.in

 > diff --git a/package/Config.in b/package/Config.in
 > index 914b83833d3e..7c5fe4ec36b2 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -115,6 +115,9 @@ menu "Development tools"
 >  	source "package/cvs/Config.in"
 >  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 >  	source "package/diffutils/Config.in"
 > +endif
 > +	source "package/dos2unix/Config.in"
 > +if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS

Busybox does have a dos2unix applet, so this should also be inside the
conditional.


 >  	source "package/findutils/Config.in"
 >  endif
 >  	source "package/flex/Config.in"
 > diff --git a/package/dos2unix/Config.in b/package/dos2unix/Config.in
 > new file mode 100644
 > index 000000000000..fdcd0700509b
 > --- /dev/null
 > +++ b/package/dos2unix/Config.in
 > @@ -0,0 +1,11 @@
 > +config BR2_PACKAGE_DOS2UNIX
 > +	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 > +	depends on BR2_USE_WCHAR # gettext

This looks odd - If wchar is only for gettext then we should allow
non-locale builds without wchar. A quick test shows that dos2unix uses
wchar several places, but this can be disabled if UCS= is passed on the
make line (wchar_t is still referred in 3 error prints though).


 >  DOS2UNIX_VERSION = 7.0
 >  DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
 > -DOS2UNIX_DEPENDENCIES = host-gettext
 >  DOS2UNIX_LICENSE = BSD-2c
 >  DOS2UNIX_LICENSE_FILES = COPYING.txt
 > +HOST_DOS2UNIX_DEPENDENCIES = host-gettext

If gettext is optional for target builds, why do we then force it for
host builds?

-- 
Bye, Peter Korsgaard
