From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 13 Feb 2014 00:41:44 +0100
Subject: [Buildroot] [PATCH V4 2/2] i.MX: Update versions to match
 latest Freescale release
In-Reply-To: <52FBD772.40900@boundarydevices.com>
References: <1381287931-7070-1-git-send-email-eric.nelson@boundarydevices.com>
 <1381287931-7070-3-git-send-email-eric.nelson@boundarydevices.com>
 <20140212190351.GD17804@free.fr>
 <52FBC72D.3090706@boundarydevices.com>
 <52FBD772.40900@boundarydevices.com>
Message-ID: <20140212234144.GE17804@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric, All,

On 2014-02-12 13:20 -0700, Eric Nelson spake thusly:
> On 02/12/2014 12:10 PM, Eric Nelson wrote:
> >On 02/12/2014 12:03 PM, Yann E. MORIN wrote:
[--SNIP--]
> >>     $ make imx-lib-extract
> >>     [...]
> >>     Unpacking file mkdir: cannot create directory ?imx-lib-3.5.7-1.0.0?:
> >>     File exists
> >>
> >>This is only a warning, but still: maybe extract the EULA _after_
> >>unpacking the archive?
> 
> Re-arranging these commands doesn't get rid of the warning.
> 
> It appears that the directory is created by the bit of
> structure using IMX_LIB_EXTRACT_CMDS, and the warning
> message is from a 'mkdir' embedded within the self-extracting
> package.
> 
> I could 'rm' the directory inside IMX_LIB_EXTRACT_CMDS,
> but it's not clear that this is the right thing to do.

No, as pointed out by Arnout, this won't work.

However, The cleanest in my opinion would be to extract the archive into
a subdir of $(@D), like:

    # Blurb about auto-extract in a properly-named dir
    define IMX_LIB_EXTRACT_CMDS
        cd $(@D); \
        sh $(DL_DIR)/$(IMX_LIB_SOURCE) --force --auto-accept
    endef

Since we are anyway using the generic-package infrastructure, we do
provide the build and isntall commands, so it is pretty easy to use that
sub-dir in the build and install commands:

    define IMX_LIB_BUILD_CMDS
        $(IMX_LIB_MAKE_ENV) $(MAKE1) -C $(@D)/imx-lib-$(FREESCALE_IMX_VERSION)
    endef

... and so on.

Also, to be noted: the warning probably pre-existed your patch, and is
not related to extracting the EULA.

Speaking of the EULA, since 'make legal-info' will copy the source file
as-is, the EULA will be present in the generated legal-info directory
structure. So, I wonder if we really care about extracting it in the
first place.

I'm a bit uneasy with the awk trick to begin with, since it would break
without us easily noticing when we bump and the self-extractor no longer
uses EULA/EOEULA (since the awk script will happily process its script,
and will just print nothing and exit without error).

What do others think about it?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
