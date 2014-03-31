From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 31 Mar 2014 19:12:04 +0200
Subject: [Buildroot] Patchwork cleanup #7: submitter notification
 (feedback deadline: April 12)
In-Reply-To: <CD43324F-6F9A-40AE-94AD-DD25A435DF7C@armadeus.org>
References: <CAAXf6LW5stEOk84f-SiPvnYSxazu7vBgM-cNpQStV7j+dcMrbw@mail.gmail.com>
 <CAAXf6LUAvi_C5NvSa6=mEhcipkBYM6XwPLHhRCZtxBccq05i0g@mail.gmail.com>
 <CD43324F-6F9A-40AE-94AD-DD25A435DF7C@armadeus.org>
Message-ID: <20140331171204.GB5004@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2014-03-31 10:58 +0200, Eric Jarrige spake thusly:
> Hi Thomas,
> 
> >> [v2,1/1] u-boot: allow to pass a custom configuration file
> >> http://patchwork.ozlabs.org/patch/276286/
> >> Eric Jarrige
> >> Yann Morin gave the feedback that this patch allows to overwrite
> >> u-boot sources, rendering the declared license possible invalid.
> 
> AFAIK this feature cannot overwrite the U-Boot license files and
> according to the U-Boot licenses/README - "You can redistribute
> U-Boot  and/or modify it under the terms of version 2 of the GNU
> General Public License as published by the Free Software
> Foundation."
> So, it should not be an issue as long as the new config file respects
> the terms of the version 2 of the GNU GPL license.

Hmm. There was maybe a bit of misunderstanding in what I said. Lemme
quote it here again:

    ---
    This is likely to overwrite a uboot source file
    with a local file, so we won't be able to generate conpliant
    legal-info when a custom comnfig file is used.
    ---

What I meant was, when running 'make legal-info', we will end up copying
the tarball of the sources, and we will miss this file (since Buildroot
is not recreating the tarballs from the build dir, but just copies what
was downloaded.)

So, this indeed can not overwrite the license file, but the sources in
legal-info will not be the exact sources used to build U-Boot, so the
legal-info will not create a compliant distribution.

That's why I oppposed the change as-is.

> >> Eric: are you still interested in pursuing this patch? If so, I think
> >> some further discussion on it should be ignited.
> 
> I submitted this patch because I think it is generic enough to support
> custom U-Boot configuration file for any board without using a patch
> but I can understand I am the only one customizing bootloader for
> my boards.
> So feel free to reject this patch if there is no interest to manage
> U-Boot configuration files within BuildRoot.

I did not say we did not want to be able to provide a custom config
file. I just said we need to be careful on the impact.

However, I see that it is possible to declare post-legal-info hooks in
packages.

So you could complement your patch with something like:

    UBOOT_CUSTOM_CONFIG = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE))
    ifneq ($(UBOOT_CUSTOM_CONFIG_FILE),)
    define UBOOT_COPY_CUSTOM_CONFIG_FILE
        $(INSTALL) -m 0644 -D $(UBOOT_CUSTOM_CONFIG_FILE) \
                   $(SOMEWHERE)
    endef
    UBOOT_POST_LEGAL_INFO_HOOKS += UBOOT_COPY_CUSTOM_CONFIG_FILE
    endif

I'll leave it to you as an exercise to find what $(SOMEWHERE) should be.
;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
