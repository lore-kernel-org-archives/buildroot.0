From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 16 Nov 2018 16:22:45 +0100
Subject: [Buildroot] [PATCH next v4 6/6] core: implement per-package SDK
 and target
In-Reply-To: <20181116144735.19585727@windsurf>
References: <20181114105557.12599-1-thomas.petazzoni@bootlin.com>
 <20181114105557.12599-7-thomas.petazzoni@bootlin.com>
 <de9da9af-71f4-cfe2-f691-5aae17e3ca0a@andin.de>
 <20181116144735.19585727@windsurf>
Message-ID: <CAAXf6LWM0dcCJSVTSerox320PWKkpPcOXORF2cTaWfHitgRguQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Nov 16, 2018, 14:47 Thomas Petazzoni <thomas.petazzoni@bootlin.com
wrote:

> Hello,
>
> Yann was already in Cc, I've added Thomas De Schampheleire as well.
> Yann, Thomas, there is some kconfig related discussion below, we
> need you :-)
>
> On Thu, 15 Nov 2018 17:41:35 +0100, Andreas Naumann wrote:
>
> > This is much clearer to me than v3, however there is a problem with
> > kconfig packages. Unfortunately, the kconfig infrastructure is running
> > the 'make xxx_defconfig' step before the configure-step is "officially"
> > started. This is due to the kconfig_fixup target being a dependency of
> > -configure. This in turn requires availability of the toolchain and
> > other prerequisites that are part of _FINAL_DEPENDENCIES earlier as
> > prepared in your above patch.
> >
> > I made a patch which moves the _FINAL_DEPENDENCIES preparation to an
> > additional .stamp-configure-prepare step just before .stamp_configured.
> > That works but is not particularly beautiful.
>
> That is not too bad actually. Semantically speaking, preparing the
> per-package folders is not really part of the configuration step. It
> could be logical to do it in a "prepare" step.
>
> The only thing that I dislike a bit with this is that it would no
> longer be consistent with what we do for download and extract
> dependencies: we prepare the per-package folders with download and
> extract dependencies respectively in the download and extract steps. So
> it would be quite logical to also do the same for the "configuration
> dependencies" (which we name just "dependencies" in Buildroot).
>
> So, this leaves us with 3 options:
>
>  - Keep the dependency preparation within the download, extract and
>    configure step, as proposed in this v4. This will require changing
>    the kconfig logic to prepare the configuration file inside the
>    "configure" step and not as a additional step injected before the
>    "configure" step.
>
>  - Keep the dependency preparation within the download and extract
>    steps, and make an exception for the configure step, with a separate
>    "prepare" step that comes before. Not nice in terms of consistency,
>    as explained above.
>
>  - Introduce "prepare download", "prepare extract" and "prepare
>    configure" steps that would do the dependency preparation.
>
> > I guess a more proper solution would be to somehow move the
> > kconfig_fixup code into the configure-step. Maybe use the
> > pre-configure-hook, any suggestions?
>
> I don't recall why they need to be done before the configuration step,
> but I'm pretty sure there is a reason for that.
>
> Yann, Thomas, do you remember ?
>

My mind triggers a big red warning light right now, so let's be careful :-)

The goal is that one can run 'make foo-menuconfig' from a clean tree,
without first processing (downloading, building, ...) the dependencies of
foo first.
If you put this stuff in the configure step of foo, you are bound by its
dependencies.

There may be other reasons too, not sure.

Best regards,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181116/705cfae7/attachment.html>
