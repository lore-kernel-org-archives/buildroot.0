From: Simon Dawson <spdawson@gmail.com>
Date: Thu, 21 Mar 2013 09:27:29 +0000
Subject: [Buildroot] [PATCH v2] rework patch model
In-Reply-To: <514AB600.1020009@mind.be>
References: <1363518489-1065-1-git-send-email-spdawson@gmail.com>
 <514AB600.1020009@mind.be>
Message-ID: <CAHt8ZCP+g8d5i-NB+OZ8tcZC_xEMC6CzdQptiwoMMZ38NvJXBg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout. Thanks for all the suggestions.

On 21 March 2013 07:25, Arnout Vandecappelle <arnout@mind.be> wrote:
>  Note that this patch will break any remaining packages that still have both
> $(NAMEVER).patch and $(RAWNAME).patch patches. So watch your autobuilders!
> There are still more than 200 $(NAMEVER).patch files:
> find package -name *-[0-9].[0-9]*.patch

Oh dear...

>> +The +BR2_GLOBAL_PATCH_DIR+ configuration file option can be
>> +used to specify a directory containing global package patches.
>> +
>> +For a specific version <version> of a specific package <pkg>, patches
>> +are applied as follows.
>> +
>> +First, the default Buildroot patch set for the package is applied.
>> +
>> +If the directory $(BR2_GLOBAL_PATCH_DIR)/<pkg>/<version> exists, then
>> +all *.patch files in the directory will be applied.
>> +
>> +Otherwise, if the directory $(BR2_GLOBAL_PATCH_DIR)/<pkg> exists, then
>> +all *.patch files in the directory will be applied.
>
>
>  Could be nice to add:
>
> The patches are applied in alphabetical order (the order of 'ls' in the C
> locale). Therefore, it is advisable to name patches
> <num>-<description>.patch, where <num> is a 4-digit numerical value that
> enforces the order.

Sounds like a good idea.

>> +$(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS =
>> $($(PKG)_DIR_PREFIX)/$(RAWNAME) $(call
>> qstrip,$(BR2_GLOBAL_PATCH_DIR))/$(RAWNAME)
>
>
>  Since GLOBAL_PATCH_DIR defaults to the empty string, this will by default
> look in /$(RAWNAME). Fortunately we don't have a package called etc or tmp
> or something similar, but you can imagine the weird fallout waiting to
> happen...  So, this should be something like:
>
> GLOBAL_PATCH_DIR = $(call qstrip,$(BR2_GLOBAL_PATCH_DIR))
>
> PATCH_BASE_DIRS = $($(PKG)_DIR_PREFIX)/$(RAWNAME) \
>    $(if $(GLOBAL_PATCH_DIR),$(GLOBAL_PATCH_DIR)/$(RAWNAME))

Okay; will fix this.

>> +       for D in $(PATCH_BASE_DIRS); do \
>
>
>  Since this is the only place where PATCH_BASE_DIRS is used, I don't see
> much point of creating a variable for it.
>
>  Also, if you remove the /$(RAWNAME) from the base dirs list and add it to
> the uses of $${D} below, then you remove the need for the GLOBAL_PATCH_DIRS
> condition.

Good idea.

I'll work up a patch to fix these issues.

Simon.
