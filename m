From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 01 Jul 2014 08:09:45 +0200
Subject: [Buildroot] [PATCH 1 of 5 RFC] uclibc: menuconfig: take into
 account initial settings from config file
In-Reply-To: <CAAXf6LVkiOswF-Hb=QGLH7rrNyX4S+bH1dU1rde+HWomn-dL8Q@mail.gmail.com>
References: <patchbomb.1403444739@localhost>
 <97d74ccbe054d9a16465.1403444740@localhost> <53AA6938.80303@mind.be>
 <CAAXf6LVkiOswF-Hb=QGLH7rrNyX4S+bH1dU1rde+HWomn-dL8Q@mail.gmail.com>
Message-ID: <53B250A9.9000707@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/06/14 21:31, Thomas De Schampheleire wrote:
> Hi Arnout, all,
> 
> On Wed, Jun 25, 2014 at 8:16 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
[snip]
>>  In order to cover all requirements, I think we should rely on real dependencies
>> here. Something like:
>>
>> uclibc-menuconfig: $(UCLIBC_DIR)/.config
>>         $(MAKE1) -C $(UCLIBC_DIR) ...
>>         $(UCLIBC_FIXUP_DOT_CONFIG)
>>
>> $(UCLIBC_DIR)/.config: $(UCLIBC_CONFIG_FILE) uclibc-patch
>>         $(INSTALL) -m 0644 $(UCLIBC_CONFIG_FILE) $(@)
>>         $(MAKE1) -C $(UCLIBC_DIR) ... oldconfig
>>         $(UCLIBC_FIXUP_DOT_CONFIG)
>>
>> uclibc-configure: $(UCLIBC_DIR)/.config
>>
>>
>> (I renamed SETUP_DOT_CONFIG to FIXUP_DOT_CONFIG which I think is more accurate.)
>>
>>
>>  This is obviously just a skeleton, but you can see where I'm going... The
>> important thing is:
>>
>> - all config targets depend on .config
>> - .config depends on the the CONFIG_FILE
>> - all config targets and .config itself call to FIXUP_DOT_CONFIG
>>
> 
> FYI, my plan for this patch series is to first fix all issues for
> uclibc, then extract that to a kconfig-package, then convert busybox,
> barebox, linux to this kconfig-package, one by one.
> 
> With respect to the skeleton above: you moved the FIXUP_DOT_CONFIG to
> the .config and menuconfig target. If a user manually edits .config
> (or copies over a new file) then these fixups will not be applied. I
> think they should be applied nevertheless, so moving the fixup to the
> configure command and letting configure depend on .config makes more
> sense to me.
> 
> Would you agree?

 I don't really agree that we should care about a user manually overwriting
.config (so _not_ using a 'make xxxconfig'. However, if we can support that, so
much the better of course.

 Moving the fixup to the configure step has the disadvantage that there is a
difference between:

make clean; make uclibc-menuconfig; make uclibc-update-defconfig

and

make clean; make uclibc-menuconfig; make; make uclibc-update-defconfig

(the first case will not have the fixups applied, the second case does).

 Also, with 'make clean; make uclibc-menuconfig' you'll won't see the result of
the fixups in your menuconfig, which is pretty strange. Especially for e.g.
linux-menuconfig, because 'make clean; make linux-menuconfig' would give you the
config options for i386 instead of your target...


 That said, it doesn't hurt to just put the fixups everywhere: in the .config
target, in the -menuconfig target, and in the PRE_CONFIGURE_HOOKS.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
