From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Wed, 12 Feb 2014 13:20:02 -0700
Subject: [Buildroot] [PATCH V4 2/2] i.MX: Update versions to match
 latest Freescale release
In-Reply-To: <52FBC72D.3090706@boundarydevices.com>
References: <1381287931-7070-1-git-send-email-eric.nelson@boundarydevices.com>
 <1381287931-7070-3-git-send-email-eric.nelson@boundarydevices.com>
 <20140212190351.GD17804@free.fr> <52FBC72D.3090706@boundarydevices.com>
Message-ID: <52FBD772.40900@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On 02/12/2014 12:10 PM, Eric Nelson wrote:
> Hi Yann,
>
> On 02/12/2014 12:03 PM, Yann E. MORIN wrote:
>> Eric, All,
>>
>> A (hopefully!) better review this time...
>>
>> On 2013-10-08 20:05 -0700, Eric Nelson spake thusly:
>>> Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
 >>>
 >>> [--SNIP--]
 >>>
>>> +# The archive is a shell-self-extractor of a bzipped tar. It happens
>>> +# to extract in the correct directory (imx-lib-x.y.z)
>>> +# The --force makes sure it doesn't fail if the source dir already
>>> exists.
>>> +# The --auto-accept skips the license check - not needed for us
>>> +# because we have legal-info
>>> +# Since there's a EULA in the bin file, extract it to
>>> imx-lib-x.y.z/EULA
>>> +#
>>> +define IMX_LIB_EXTRACT_CMDS
>>> +    awk 'BEGIN      { start=0; } \
>>> +         /^EOEULA/  { start = 0; } \
>>> +                    { if (start) print; } \
>>> +         /<<EOEULA/ { start=1; }'\
>>> +        $(DL_DIR)/$(IMX_LIB_SOURCE) > $(@D)/EULA
>>> +    cd $(BUILD_DIR); \
>>> +    sh $(DL_DIR)/$(IMX_LIB_SOURCE) --force --auto-accept
>>> +endef
>>
>>      $ make imx-lib-extract
>>      [...]
>>      Unpacking file mkdir: cannot create directory ?imx-lib-3.5.7-1.0.0?:
>>      File exists
>>
>> This is only a warning, but still: maybe extract the EULA _after_
>> unpacking the archive?
>>
>
> Sure. I'll re-work.
>

Re-arranging these commands doesn't get rid of the warning.

It appears that the directory is created by the bit of
structure using IMX_LIB_EXTRACT_CMDS, and the warning
message is from a 'mkdir' embedded within the self-extracting
package.

I could 'rm' the directory inside IMX_LIB_EXTRACT_CMDS,
but it's not clear that this is the right thing to do.

Please let me know your thoughts on the matter.

Regards,


Eric
