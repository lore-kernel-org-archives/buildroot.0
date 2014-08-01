From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 1 Aug 2014 21:22:46 +0200
Subject: [Buildroot] [PATCH 1 of 6 v2] infra: introduce a
	kconfig-package infrastructure
In-Reply-To: <20140731204201.GG3960@free.fr>
References: <patchbomb.1406750281@localhost>
 <83a2e5f2641a58449f47.1406750282@localhost>
 <20140731204201.GG3960@free.fr>
Message-ID: <CAAXf6LXrPNyJJ6V__FXO9Xv-AsOTJWKmsD8movu93e3OJKPi0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Thu, Jul 31, 2014 at 10:42 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Thomas, All,
>
> On 2014-07-30 21:58 +0200, Thomas De Schampheleire spake thusly:
> [--SNIP--]
>> diff -r 4ee2201e6e6b -r 83a2e5f2641a package/pkg-kconfig.mk
>> --- /dev/null Thu Jan 01 00:00:00 1970 +0000
>> +++ b/package/pkg-kconfig.mk  Mon Jun 30 21:08:13 2014 +0200
>> @@ -0,0 +1,82 @@
> [--SNIP--]
>> +# The .config file is obtained by copying it from the specified source
>> +# configuration file, after the package has been patched.
>> +
>> +$$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) | $(1)-patch
>> +     $$(INSTALL) -m 0644 $$($(2)_KCONFIG_FILE) $$($(2)_DIR)/.config
>> +
>> +# In order to get a usable, consistent configuration, some fixup may be needed.
>> +# The exact rules are specified by the package .mk file.
>> +
>> +$$($(2)_DIR)/.stamp_kconfig_fixup_done: $$($(2)_DIR)/.config
>> +     $$($(2)_KCONFIG_FIXUP_CMDS)
>> +     $$(Q)touch $$@
>> +
>> +# Before running configure, the configuration file should be present and fixed
>> +
>> +$$($(2)_TARGET_CONFIGURE): $$($(2)_DIR)/.stamp_kconfig_fixup_done
>> +
>> +# Configuration editors (menuconfig, ...)
>> +
>> +$$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $$($(2)_DIR)/.config
>
> Should we not depend on .stamp_kconfig_fixup_done instead of .config, so
> we present to the user a .config that is already tweak to our needs?

Yes indeed, that is more logical.
I will add an initial patch to uclibc to do this, then take it along
in the kconfig-package infra.

Thanks!
Thomas
