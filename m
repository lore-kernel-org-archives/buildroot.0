From: Andre Przywara <andre.przywara@arm.com>
Date: Mon, 4 Dec 2017 15:03:38 +0000
Subject: [Buildroot] [PATCH v5 03/11] board: Add Bananapi M64 support
In-Reply-To: <CAMty3ZDAHW7OKSfrJXgLLncpOj8H_XCVDeBFSWaXtVqh5tGEWQ@mail.gmail.com>
References: <1509559553-26544-1-git-send-email-jagan@amarulasolutions.com>
 <1509559553-26544-4-git-send-email-jagan@amarulasolutions.com>
 <20171202155818.0d04f798@windsurf.lan>
 <CAMty3ZDAHW7OKSfrJXgLLncpOj8H_XCVDeBFSWaXtVqh5tGEWQ@mail.gmail.com>
Message-ID: <3669564e-b1ff-1ad3-80bd-3d0f021c7735@arm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 02/12/17 15:10, Jagan Teki wrote:
> + Andre
> 
> On Sat, Dec 2, 2017 at 8:28 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Hello,
>>
>> On Wed,  1 Nov 2017 19:05:45 +0100, Jagan Teki wrote:
>>
>>> +# Firmware
>>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
>>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
>>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/apritzel/arm-trusted-firmware.git"
>>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50iw1p1"
>>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="aa75c8da415158a94b82a430b2b40000778e851f"
>>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="bl31"
>>
>> What is this "bl31" additional variable doing?
> 
> Source build varies based on the exception levels switches, like bl31
> we have bl31, bl2, bl1

Those are not exception levels, but just stages of ATF: BROM loads bl1,
which (optionally) loads bl2 and possibly bl31 (if bl2 does not do this).
Various platforms can implement only a subset of these stages, the
Allwinner port chose to only implement bl31.
Technically we should express this in the Makefile snippets, so that
"make all" just builds bl31, but that's not easy to do in the Allwinner
port.

>> Aren't you hijacking the ADDITIONAL_VARIABLES thing to call the bl31
>> make target ?
> 
> Since ADDITIONAL_VARIABLES resembles to use additional parameters for
> ATF build, I've treated bl31 as additional variable for this ATF

I have the same feeling as Thomas: bl31 is just a make target (instead
of "all" and/or "fip"). So it should be treated like this. Using
ADDITIONAL_VARIABLES sounds like a hack.

Cheers,
Andre.
