From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Jul 2021 09:46:31 +0200
Subject: [Buildroot] [PATCH/next v2 1/1] package/icu: Add support to
 generate a subset of ICU data
In-Reply-To: <05gfshxehp.ln2@ID-313208.user.individual.net>
References: <20210601060608.5531-1-bernd.kuhls@t-online.de>
 <20210718231120.76adc4e3__4803.22810342244$1626642706$gmane$org@windsurf>
 <05gfshxehp.ln2@ID-313208.user.individual.net>
Message-ID: <20210719094631.51970599@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Bernd,

On Mon, 19 Jul 2021 07:45:36 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Yes, it is true that the upstream URL to create custum data files
> http://apps.icu-project.org/datacustom/
> no longer exists and no new data files can be created this way.
> 
> But our option BR2_PACKAGE_ICU_CUSTOM_DATA_PATH still works when using 
> already existing data files to overwrite the tarball version of
> icu/source/data/in/icudt69l.dat by ICU_POST_PATCH_HOOKS.
> 
> That's the reason why I did not touch this buildroot option because I 
> focused on the new option. I do not have any objections to remove this 
> option however.

Since the website no longer exists and has never allowed creating
custom datasets for recent versions of ICU, I doubt anybody has such as
custom dataset pre-compiled, so I would be in favor of dropping the
option.

> Another idea just came up: What about changing my patch to a comma-
> separated string option like BR2_PACKAGE_ICU_DATA_LANGUAGES with a 
> default of "en" and icu.mk creates the corresponding json file during the 
> build:
> 
> {
>   "localeFilter": {
>     "filterType": "language",
>     "includelist": [
>       "en"
>     ]
>   }
> }
> 
> Users could then use this option to filter more languages are change it 
> to an empty option which will provide the full data file, like today.
> This way we would lose the more detailed filter possibilities offered by 
> the icu build system but I guess most users would be happy just being 
> able to filter languages.

This is unfortunately more "limiting" than the mechanism you propose
today, which really provides the full flexibility allowed by the ICU
custom dataset creation mechanism.

Should we have a "choice" between 3 possibilities:

 (1) A custom dataset created based on the list of locales enabled by
     the user in the Buildroot configuration. This would be the default
     possibility.

 (2) The full dataset.

 (3) A custom dataset based on a custom JSON file provided by the user,
     for advanced configuration.

What do you think ?

> >  * When a custom dataset needs to be generated thanks to your new
> >    option, we need to download the source of this dataset as an extra
> >    download for the host-icu package, replace the source/data/ subdir
> >    with this source data set, and ask the host-icu package to generate
> >    icudt69l.dat. Then the target icu package grabs this pre-compiled
> >    icudt69l.dat.  
> 
> Correct, you need host tools, which are configured using --with-data-
> packaging=archive, to build a new data file which is then injected into 
> the target package by ICU_PRE_CONFIGURE_HOOKS.

Indeed, that's what I understood. As I mentioned, would be good to have
this explained via a comment in the .mk file.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
