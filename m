From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Wed, 12 Feb 2014 19:00:48 -0700
Subject: [Buildroot] [PATCH V4 2/2] i.MX: Update versions to match
 latest Freescale release
In-Reply-To: <20140212234144.GE17804@free.fr>
References: <1381287931-7070-1-git-send-email-eric.nelson@boundarydevices.com>
 <1381287931-7070-3-git-send-email-eric.nelson@boundarydevices.com>
 <20140212190351.GD17804@free.fr> <52FBC72D.3090706@boundarydevices.com>
 <52FBD772.40900@boundarydevices.com> <20140212234144.GE17804@free.fr>
Message-ID: <52FC2750.7000602@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On 02/12/2014 04:41 PM, Yann E. MORIN wrote:
> Eric, All,
>
> On 2014-02-12 13:20 -0700, Eric Nelson spake thusly:
>> On 02/12/2014 12:10 PM, Eric Nelson wrote:
>>> On 02/12/2014 12:03 PM, Yann E. MORIN wrote:
> [--SNIP--]
>>>>      $ make imx-lib-extract
>>>>      [...]
>>>>      Unpacking file mkdir: cannot create directory ?imx-lib-3.5.7-1.0.0?:
>>>>      File exists
>>>>
>>>> This is only a warning, but still: maybe extract the EULA _after_
>>>> unpacking the archive?
>>
>> Re-arranging these commands doesn't get rid of the warning.
>>
>> It appears that the directory is created by the bit of
>> structure using IMX_LIB_EXTRACT_CMDS, and the warning
>> message is from a 'mkdir' embedded within the self-extracting
>> package.
>>
>> I could 'rm' the directory inside IMX_LIB_EXTRACT_CMDS,
>> but it's not clear that this is the right thing to do.
>
> No, as pointed out by Arnout, this won't work.
>

Right.

> However, The cleanest in my opinion would be to extract the archive into
> a subdir of $(@D), like:
>
>      # Blurb about auto-extract in a properly-named dir
>      define IMX_LIB_EXTRACT_CMDS
>          cd $(@D); \
>          sh $(DL_DIR)/$(IMX_LIB_SOURCE) --force --auto-accept

And then move them?
i.e.
	mv $(@D)/packagemname/* $(@D)/
	rm -r $(@D)/packagemname/

>      endef
>
> Since we are anyway using the generic-package infrastructure, we do
> provide the build and isntall commands, so it is pretty easy to use that
> sub-dir in the build and install commands:
>
>      define IMX_LIB_BUILD_CMDS
>          $(IMX_LIB_MAKE_ENV) $(MAKE1) -C $(@D)/imx-lib-$(FREESCALE_IMX_VERSION)
>      endef
>
It seems like over-kill to keep the directory around.

And what about the patch step references?

> ... and so on.
>
> Also, to be noted: the warning probably pre-existed your patch, and is
> not related to extracting the EULA.
>
It did.

I've been trying to figure out whether I can split this
into a separate patch for the purpose of a separate commit
message.

> Speaking of the EULA, since 'make legal-info' will copy the source file
> as-is, the EULA will be present in the generated legal-info directory
> structure. So, I wonder if we really care about extracting it in the
> first place.
>

I don't understand well enough to comment, and this too seems like
the subject of a separate patch.

> I'm a bit uneasy with the awk trick to begin with, since it would break
> without us easily noticing when we bump and the self-extractor no longer
> uses EULA/EOEULA (since the awk script will happily process its script,
> and will just print nothing and exit without error).
>

There may be another way, by executing the extractor first without
the --accept-eula and re-directing the output.

Again, this seems like the subject of a different patch.

I'd also like to get Freescale to comment on this.

Perhaps we can get them to provide a "--showlicense" in the
next release, and change things then.

And while we're at it, we can suggest "mkdir -p" when the "--force"
option is specified.

Regards,


Eric
