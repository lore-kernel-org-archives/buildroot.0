From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 13 Feb 2014 23:52:18 +0100
Subject: [Buildroot] [PATCH V4 2/2] i.MX: Update versions to match
 latest Freescale release
In-Reply-To: <52FC2750.7000602@boundarydevices.com>
References: <1381287931-7070-1-git-send-email-eric.nelson@boundarydevices.com>
 <1381287931-7070-3-git-send-email-eric.nelson@boundarydevices.com>
 <20140212190351.GD17804@free.fr>
 <52FBC72D.3090706@boundarydevices.com>
 <52FBD772.40900@boundarydevices.com>
 <20140212234144.GE17804@free.fr>
 <52FC2750.7000602@boundarydevices.com>
Message-ID: <20140213225218.GC3259@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric, All,

On 2014-02-12 19:00 -0700, Eric Nelson spake thusly:
> On 02/12/2014 04:41 PM, Yann E. MORIN wrote:
> >However, The cleanest in my opinion would be to extract the archive into
> >a subdir of $(@D), like:
> >
> >     # Blurb about auto-extract in a properly-named dir
> >     define IMX_LIB_EXTRACT_CMDS
> >         cd $(@D); \
> >         sh $(DL_DIR)/$(IMX_LIB_SOURCE) --force --auto-accept
> 
> And then move them?
> i.e.
> 	mv $(@D)/packagemname/* $(@D)/
> 	rm -r $(@D)/packagemname/

No, we would not need to move it. We'd just use it as-is in the
following commands, like I showed below:

> >     define IMX_LIB_BUILD_CMDS
> >         $(IMX_LIB_MAKE_ENV) $(MAKE1) -C $(@D)/imx-lib-$(FREESCALE_IMX_VERSION)
> >     endef

> It seems like over-kill to keep the directory around.

Well, maybe not overkill, but not-so-clean, yes.

> And what about the patch step references?

Boom! :-)

> >Speaking of the EULA, since 'make legal-info' will copy the source file
> >as-is, the EULA will be present in the generated legal-info directory
> >structure. So, I wonder if we really care about extracting it in the
> >first place.
> >
> 
> I don't understand well enough to comment,

Basically, Buildroot provides the 'legal-info' infrastructure:
    http://buildroot.net/downloads/manual/manual.html#legal-info

> and this too seems like
> the subject of a separate patch.

Well, it'd be a good idea to provide the bump in one patch, since
that's pretty easy, and the extra EULA stuff in a separate patch,
indeed.

So, to sum-up:
  - provide a patch that bumps the version;
  - just keep the directory layout as-is, we'll live with the warning
    but be sure to add a comment above the _EXTRACT_CMDS stating that a
    warning will be issued;
  - provide a second patch that extracts the EULA; your initial solution
    is OK.

> >I'm a bit uneasy with the awk trick to begin with, since it would break
> >without us easily noticing when we bump and the self-extractor no longer
> >uses EULA/EOEULA (since the awk script will happily process its script,
> >and will just print nothing and exit without error).
> >
> 
> There may be another way, by executing the extractor first without
> the --accept-eula and re-directing the output.
> 
> Again, this seems like the subject of a different patch.
> 
> I'd also like to get Freescale to comment on this.
> 
> Perhaps we can get them to provide a "--showlicense" in the
> next release, and change things then.

If you have your ways inside Freescale, then it might be a good idea,
yes! Unless they're already reading us. NSA, you there? :-]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
