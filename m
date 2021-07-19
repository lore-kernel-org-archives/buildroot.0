From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 19 Jul 2021 07:45:36 +0200
Subject: [Buildroot] [PATCH/next v2 1/1] package/icu: Add support to
 generate a subset of ICU data
References: <20210601060608.5531-1-bernd.kuhls@t-online.de>
 <20210718231120.76adc4e3__4803.22810342244$1626642706$gmane$org@windsurf>
Message-ID: <05gfshxehp.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Thomas,

Am Sun, 18 Jul 2021 23:11:20 +0200 schrieb Thomas Petazzoni:

> We already have BR2_PACKAGE_ICU_CUSTOM_DATA_PATH which was also meant to
> allow building ICU with a smaller dataset, based on pre-compiled .dat
> file. It points to using http://apps.icu-project.org/datacustom/, which
> in fact seems to no longer exists, as it redirects to
> https://unicode-org.atlassian.net/browse/ICU-12977/, which says that the
> feature is no longer available since ICU 58.x.
> 
> So I guess we should first drop BR2_PACKAGE_ICU_CUSTOM_DATA_PATH which
> is already unusable today.

Yes, it is true that the upstream URL to create custum data files
http://apps.icu-project.org/datacustom/
no longer exists and no new data files can be created this way.

But our option BR2_PACKAGE_ICU_CUSTOM_DATA_PATH still works when using 
already existing data files to overwrite the tarball version of
icu/source/data/in/icudt69l.dat by ICU_POST_PATCH_HOOKS.

That's the reason why I did not touch this buildroot option because I 
focused on the new option. I do not have any objections to remove this 
option however.

> Then the second question is whether we can provide/generate some kind of
> default file in Buildroot that would in a default Buildroot
> configuration generate a more minimal ICU dataset. For example by
> building only the support for English ? Or based on the value of
> BR2_GENERATE_LOCALE ?

Another idea just came up: What about changing my patch to a comma-
separated string option like BR2_PACKAGE_ICU_DATA_LANGUAGES with a 
default of "en" and icu.mk creates the corresponding json file during the 
build:

{
  "localeFilter": {
    "filterType": "language",
    "includelist": [
      "en"
    ]
  }
}

Users could then use this option to filter more languages are change it 
to an empty option which will provide the full data file, like today.
This way we would lose the more detailed filter possibilities offered by 
the icu build system but I guess most users would be happy just being 
able to filter languages.

> It took me quite some time to understand what was going on here. My
> understanding is as follows:
> 
>  * In a normal build, the pre-compiled source/data/in/icudt69l.dat
>    provided in the ICU tarball is used.

Correct.

>  * When a custom dataset needs to be generated thanks to your new
>    option, we need to download the source of this dataset as an extra
>    download for the host-icu package, replace the source/data/ subdir
>    with this source data set, and ask the host-icu package to generate
>    icudt69l.dat. Then the target icu package grabs this pre-compiled
>    icudt69l.dat.

Correct, you need host tools, which are configured using --with-data-
packaging=archive, to build a new data file which is then injected into 
the target package by ICU_PRE_CONFIGURE_HOOKS.

> Is that correct ? If so, then I'd say it would be useful to add a
> comment above this code, as I find the logic to not be that trivial.

Ok.

Regards, Bernd
