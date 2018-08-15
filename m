From: LP C <lpdev@cordier.org>
Date: Wed, 15 Aug 2018 14:06:37 +0200
Subject: [Buildroot] Intel MediaSDK package w. Quicksync (h264,
 h265 HW encoding)
In-Reply-To: <20180815133808.53f62baf@windsurf>
References: <20180815133808.53f62baf@windsurf>
Message-ID: <1534334535.local-4ba41dde-fbd1-v1.4.1-b1028ad4@getmailspring.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Agreed. I will work on this. Thank you both for your feedback.

On Aug 15 2018, at 1:38 pm, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
> On Wed, 15 Aug 2018 12:45:32 +0200, LP C wrote:
> > > Really? 4.14.16, not 4.14.17 or later? That's really unlikely... Or do you mean
> > > that it needs a specific fork?
> >
> >
> > Indeed I did not saw the statement on the official website. Any
> > kernel newer than 4.14.16 should be fine then. I will conduct further
> > testing next week to check whether I have issues ton encode with a
> > really recent kernel version.
>
>
> First of all, you need to check whether you have a build dependency on
> 4.14 kernel headers, or only a runtime dependency on having a 4.14
> kernel.
>
> If it's just a runtime dependency, a mention in the Config.in help text
> is good enough.
>
> > BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 is not "strong enough" here. I
> > would like to specify a precise 'starting' version of the kernel.
> > Maybe this could be an additional feature that might be addable to
> > buildroot? Maybe it is too over engineered though.
>
>
> We can't do that, because Linux kernel versions are sometimes specified
> as a Git commit. How can you determine that
> f1d2d2f924e986ac86fdf7b36c94bcdf32beec15 is older or newer than 4.14 ?
> You can't without fetching the source code, and fetching the source
> code only happens at build time, i.e wait after the Buildroot
> configuration is defined.
>
> > > It really depends on the plans for upstreaming the changes, and how much
> > > changes there are. If Intel's libva is really the libva version we carry at the
> > > moment with some innocent changes to them, and it is intended to be upstreamed
> > > in the very short term, then I'd be OK to just temporarily switch to the Intel
> > > version. If, on the other hand, there is a risk that the fork will stay a fork,
> > > then I think we need to add libva-intel and libva-utils-intel and virtual
> > > packages. That would be really annoying though.
> >
> >
> > Tough to say, I did not studied the Intel's libva repo specifically.
> > Maybe we can ask directly to one of the maintainer. That said every
> > version of the Media SDK is tightly coupled with libva version, and
> > AFAIK there are no forward compatibility between an older version of
> > the SDK and the libva version of a new MediaSDK release. I think the
> > best would be to create a virtual package. Intel has slightly
> > modified the way libva is built, and I needed to add some lines (not
> > that much though) to libva.mk. Virtual package would allow to not
> > bloat the current libva.mk. I can do a PR on this.
> >
> > Naming convention:
> > libva - virtual package
> >
> > libva-mainstream: current libva impl
> > libva-intel: current version validated to work with Intel MediaSDK.
> > Any thoughts on this?
> I am not thrilled with the virtual package idea here. I would prefer to
> first see an approach where everything is done in the existing libva
> package, and depending on how good/bad this looks, take a decision from
> there. Going immediately with a virtual package sounds like
> over-engineering to me.
>
> Best regards,
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180815/b3f104af/attachment.html>
