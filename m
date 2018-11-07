From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Wed, 7 Nov 2018 17:08:29 +0000
Subject: [Buildroot] [PATCH 1/1] Added local directory as source of
 kernel code
In-Reply-To: <20181107174411.0b67a064@windsurf>
References: <20181107100605.13141-1-nicolas.carrier@orolia.com>
 <CANQCQpb6BYDMXJTDKEXKgpmBG1jHjOt2G1_eDF_cSVbCM=x=nw@mail.gmail.com>
 <PR1PR06MB49557D35D7EB1F1D03DEFDD784C40@PR1PR06MB4955.eurprd06.prod.outlook.com>,
 <20181107174411.0b67a064@windsurf>
Message-ID: <PR1PR06MB49552DC5F79CB5C801B824F384C40@PR1PR06MB4955.eurprd06.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I think I understand better the issue.

The thing is there are 2 sort of packages, the ones managed internally by buildroot and the external ones. Linux and u-boot are special, at least for us, because they are internal buildroot packages for which we want to manage the sources like we do for external ones by using the "local" method.

I think the solution you propose will work and I'm going to use it if the patch is refused.

But still I find it a little bit hackish compared to the possibility to use a local source tree, which is an alternative which makes sense, when we already have the possibility to use, a custom svn, git, tarball...


If you end up deciding to integrate the patch, I have the u-boot patch, originally written by Adam Duskett, rebased on top of master and ready for submission ^^


________________________________
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Sent: Wednesday, November 7, 2018 5:44:11 PM
To: Nicolas Carrier
Cc: Matthew Weber; Peter Korsgaard; rafal.fabich at gmail.com; buildroot
Subject: Re: [Buildroot] [PATCH 1/1] Added local directory as source of kernel code

Hello Nicolas,

On Wed, 7 Nov 2018 14:40:39 +0000, Nicolas Carrier wrote:

> I have a workspace managed by google repo, which fetches the sources
> of the external git repositories for which we have created .mk
> buildroot Makefiles.
>
> Because the sources are cloned by repo, I don't want them to be
> fetched by buildroot, hence I used "_SITE_METHOD = local" for all the
> packages.
>
> For linux and u-boot, I can't do that because they dont support the
> local method and I think there is no reason to make these two
> packages an exception.

Well your patch is actually making u-boot and linux be exceptions. What
if someone wants to build busybox from a local source tree ? And qt5 ?
And openssl ? And then this other package ?

As you can see, this approach does not really scale: we would have to
add Config.in options to all packages to say "please build using the
source code from folder XYZ instead of the normal upstream source
code". That's why we have chosen to support this use case using
OVERRIDE_SRCDIR.

> As for modifying the local.mk file to put some LINUX_OVERRIDE_SRCDIR
> value inside, I want to avoid it because it would force me to version
> the local.mk file for things to work out-of-the-box. Versionning this
> file is problematic because developers needing to modify it
> temporarily may commit it by error.

Here is what you could do:

 - Set BR2_PACKAGE_OVERRIDE_FILE to point to whatever file you like
   instead of local.mk, say package-overrides.mk.

 - In this file, you set LINUX_OVERRIDE_SRCDIR as appropriate, but you
   also do

   -include local.mk

And then you version control package-overrides.mk. Then your developer
can continue locally to tinker with local.mk to have their own custom
OVERRIDE_SRCDIR, and still have LINUX_OVERRIDE_SRCDIR used.

Alternatively, maybe we should decide that linux and u-boot are special
packages, and just like for those packages we support fetching from
custom tarballs and custom Git repositories, we should support fetching
from custom local directories (this is what your patch implements, but
until now, we have resisted going into this direction).

Best regards,

Thomas
--
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
Bootlin ? Embedded Linux and kernel engineering<https://bootlin.com/>
bootlin.com
The Embedded Linux Conference Europe edition 2018 took place last week in Edinburgh, Scotland, and no less than 9 engineers from Bootlin attended the conference.


ATTENTION: This email came from an external source.
Do not open attachments or click on links from unknown senders or unexpected emails.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181107/8bf0a47e/attachment.html>
