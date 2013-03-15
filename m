From: Simon Dawson <spdawson@gmail.com>
Date: Fri, 15 Mar 2013 07:30:56 +0000
Subject: [Buildroot] Adding a patch in a different directory
In-Reply-To: <CAE21AQoQPni=ck0LN1W=DRRdWWw6jjvFf9dxvX6cK5fmZV_+XQ@mail.gmail.com>
References: <CAE21AQoQPni=ck0LN1W=DRRdWWw6jjvFf9dxvX6cK5fmZV_+XQ@mail.gmail.com>
Message-ID: <CAHt8ZCMY=kbSmCg8r7BWFZ1GFuXutRjBDov+wWCa_ZGMncUMtg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15 March 2013 00:50, Charles Manning <cdhmanning@gmail.com> wrote:
> What I would like to do is get buildroot to use the patch in foo/patches.
>
> Any ideas how to achieve this?

I submitted a patch a while ago to add support for custom package patches:

http://patchwork.ozlabs.org/patch/222260/

The patch has not been accepted as of this writing, but you can
achieve your goal by adding something like the following to your
local.mk

# Base directory for patches.
MY_PATCH_DIR = foo/patches

# List of packages to have extra patches applied.
MY_EXTRA_PACKAGE_PATCHES = bluez_utils lcdproc cairo

#-----------------------------------------------------------------------------
# Extra patches for specified package
define my-extra-package-patch

$(info Setting up extra patching for package $(1))

define MY_$(call UPPERCASE,$(1))_POST_PATCH_FIXUP
  support/scripts/apply-patches.sh $$($(call UPPERCASE,$(1))_DIR)
$(MY_PATCH_DIR)/$(1) '*.patch*'
endef
$(call UPPERCASE,$(1))_POST_PATCH_HOOKS += \
  MY_$(call UPPERCASE,$(1))_POST_PATCH_FIXUP

endef

$(foreach pkg,$(MY_EXTRA_PACKAGE_PATCHES),$(eval $(call
my-extra-package-patch,$(pkg))))
