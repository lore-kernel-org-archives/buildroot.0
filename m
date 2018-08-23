From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 23 Aug 2018 19:35:08 +0300
Subject: [Buildroot] Package with dependency with another git
In-Reply-To: <ea-mime-5b7ed395-49e5-1bbae393@www-1.netcourrier.com>
References: <ea-mime-5b7ed395-49e5-1bbae393@www-1.netcourrier.com>
Message-ID: <87a7pdujlv.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Louis-Paul,

lpdev at cordier.org writes:
> Currently adding a new package to buildroot, I have a package "A" that
> fetch its sources on git, and is a cmake-package. This package A also
> require another git repo "B" to be fetched, and a CMake a path in
> _CONF_OPTS that points to repo "B" must be added.
>
> My solution was to create a new package "B" on which package "A"
> depends on, and use generic-package with no build rules. Buildroot is
> taking care of fetching the sources automatically then.
>
> However I did not find any way to point on build directory of package
> B from packagea.mk. Package build are named with the following:
> package_name-version. I am currently pointing to the path manually in
> my script like this:
>
> PACKAGEA_CONF_OPTS += -DREPOB_DIR=$(BUILD_DIR)/packageb-$(PACKAGEB_VERSION)/

You can use $(PACKAGEB_DIR) instead.

> My questions are:
>
> - Is it a good practice to do this?
> - Is it a good practice to create a package that only fetch sources?

Sometimes you have no other choice.

> - Is there any variable to point to the build dir of a specific
>   package?

See above.

> - Would it be better to add a pre-configure in packagea.mk hook that
>   calls git and fetch the repo B?

Don't do that. It would circumvent the Buildroot package download
infrastructure.

> Thank you for you help.

You can see the example of the boot/mv-ddr-marvell package that is a
source dependency of a certain version of arm-trusted-firmware. See
boot/mv-ddr-marvell/mv-ddr-marvell.mk and
boot/arm-trusted-firmware/arm-trusted-firmware.mk.

baruch

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
