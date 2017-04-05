From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 5 Apr 2017 18:32:14 +0200
Subject: [Buildroot] [PATCH v3] board: Add support for Engicam i.CoreM6
 Quad/Dual boards
In-Reply-To: <CAD6G_RQ-ouaXSUkK-On+WkbmY2kVBz_EPXDfyZJTk6DGpB-Aew@mail.gmail.com>
References: <1491329412-5660-1-git-send-email-jagan@openedev.com>
 <20170404221750.41125e2e@free-electrons.com>
 <CAD6G_RQ-ouaXSUkK-On+WkbmY2kVBz_EPXDfyZJTk6DGpB-Aew@mail.gmail.com>
Message-ID: <4c896d5e-923a-ab19-a016-5dc978cbcf3d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-04-17 17:56, Jagan Teki wrote:
> On Wed, Apr 5, 2017 at 1:47 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Hello,
>>
>> On Tue,  4 Apr 2017 23:40:12 +0530, Jagan Teki wrote:
>>> From: Jagan Teki <jagan@amarulasolutions.com>
>>>
>>> Add initial support for Engicam i.CoreM6 Quad/Dual board
>>> with below features:
>>> - U-Boot 2017.01
>>> - Linux 4.10
>>> - Default packages from buildroot
>>>
>>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>>> Cc: Matteo Lisi <matteo.lisi@engicam.com>
>>> Cc: Michael Trimarchi <michael@amarulasolutions.com>
>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>>
>> Thanks, looking better.
>>
>>> diff --git a/board/engicam/common/post-image.sh b/board/engicam/common/post-image.sh
>>
>> Why do we have this 'common' folder, and this very flexible script? Do
>> you intend to submit the support for other boards?
> 
> I would like to add more boards in couple of days, the main intention
> of adding common is to place file for common if any specific board
> have any specific changes I will create board name file.
> 
>>
>> This script is exactly the same as the one in
>> board/freescale/common/imx/post-image.sh, I definitely would like to
>> avoid duplication.
> 
> Same, but calling genimage.cfg is different in engicam vs freescale common.

 Then it's better to add the path to genimage.cfg.template as an argument to the
genimage script (with a default of the current template, so you don't need to
update all the existing defconfigs).

 Better yet, factor this feature into support/scripts/genimage.sh, by adding
extra flag arguments for the dtb-list and linux-image features. That's a bit
more complicated, of course. If you do this, it would be nice to also update the
existing freescale defconfigs, but not strictly necessary.

 I'm adding Etienne in Cc, he's also working on defconfig refactoring for genimage.

 BTW, a better way to get the values is to use printvars (which works now). In
the script, you can do e.g.:

eval $(make -s O="${BASE_DIR}" printvars VARS="LINUX_IMAGE_NAME KERNEL_DTBS")

and you get the LINUX_IMAGE_NAME and KERNEL_DTBS variables in your environment.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
