From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 23 Jan 2020 14:03:30 -0700
Subject: [Buildroot] [PATCH 1/1] package/nodejs: bump to version 12.14.1
In-Reply-To: <b25a1221-50a0-4915-9b73-1b304f033f87@codethink.co.uk>
References: <20200121023242.94475-1-james.hilliard1@gmail.com>
 <b25a1221-50a0-4915-9b73-1b304f033f87@codethink.co.uk>
Message-ID: <CADvTj4qNBoJBm1nPfKJ+=0qBWda+-XSU2LQ=FD0WHaYHF-_TsQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I thought that issue was caused by the ICU 65.1 bump, not the nodejs bump.

I have a pending pull request to nodejs that might fix this issue by
the way https://github.com/nodejs/node/pull/31433.

On Thu, Jan 23, 2020 at 6:46 AM Thomas Preston
<thomas.preston@codethink.co.uk> wrote:
>
> Hi all,
>
> On 21/01/2020 02:32, James Hilliard wrote:
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/nodejs/nodejs.hash | 4 ++--
> >  package/nodejs/nodejs.mk   | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
> > index bde0ac0167..92369105ff 100644
> > --- a/package/nodejs/nodejs.hash
> > +++ b/package/nodejs/nodejs.hash
> > @@ -1,5 +1,5 @@
> > -# From https://nodejs.org/dist/v12.14.0/SHASUMS256.txt
> > -sha256 088a217ba2af641b8cc15be29f6e2956b8a33e6badb85596bbc2cdea9df9be71  node-v12.14.0.tar.xz
> > +# From https://nodejs.org/dist/v12.14.1/SHASUMS256.txt
> > +sha256 877b4b842318b0e09bc754faf7343f2f097f0fc4f88ab9ae57cf9944e88e7adb  node-v12.14.1.tar.xz
> >
> >  # Hash for license file
> >  sha256 950bbc741dc021489c47683e34e7637e9b96fb4a1f430b2f77a744130516e293  LICENSE
> > diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> > index 62c4c1abb1..e6eb73d576 100644
> > --- a/package/nodejs/nodejs.mk
> > +++ b/package/nodejs/nodejs.mk
> > @@ -4,7 +4,7 @@
> >  #
> >  ################################################################################
> >
> > -NODEJS_VERSION = 12.14.0
> > +NODEJS_VERSION = 12.14.1
> >  NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
> >  NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
> >  NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
> >
>
> This breaks host-nodejs for me. Looks like an error with icu-small conflicting
> with host-icu, but I can't tell for sure. It works again when I revert this
> patch (nodejs 12.14.0) and clean-rebuild.
>
> I can reproduce with something similar to this:
>
>         docker build -t "repro" support/docker
>         docker run \
>                 --mount=type=bind,src="$(pwd)",dst=/home/br-user \
>                 --user "$UID:$UID" -it "repro" \
>                 make host-nodejs
>
> The error looks like this:
>
> make[2]: *** [/home/br-user/output/build/host-nodejs-12.14.1/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/number_multiplier.o] Error 1
> In file included from ../deps/icu-small/source/i18n/number_types.h:11:0,
>                  from ../deps/icu-small/source/i18n/number_decimalquantity.h:14,
>                  from ../deps/icu-small/source/i18n/numparse_types.h:11,
>                  from ../deps/icu-small/source/i18n/number_currencysymbols.cpp:12:
> ../deps/icu-small/source/i18n/unicode/decimfmt.h:899:13: error: invalid covariant return type for ?virtual icu_65::Format* icu_65::DecimalFormat::clone() const?
>      Format* clone(void) const U_OVERRIDE;
>              ^~~~~
> In file included from ../deps/icu-small/source/i18n/unicode/decimfmt.h:39:0,
>                  from ../deps/icu-small/source/i18n/number_types.h:11,
>                  from ../deps/icu-small/source/i18n/number_decimalquantity.h:14,
>                  from ../deps/icu-small/source/i18n/numparse_types.h:11,
>                  from ../deps/icu-small/source/i18n/number_currencysymbols.cpp:12:
> /home/br-user/output/host/include/unicode/numfmt.h:271:27: error:   overriding ?virtual icu_65::NumberFormat* icu_65::NumberFormat::clone() const?
>      virtual NumberFormat* clone() const = 0;
>                            ^~~~~
