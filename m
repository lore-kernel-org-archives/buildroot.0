From: =?UTF-8?B?QmVub8OudA==?= Allard <benoit.allard@greenbone.net>
Date: Mon, 6 Mar 2017 16:57:20 +0100
Subject: [Buildroot] [PATCH 1/1] dc3dd: new package
In-Reply-To: <043238f2-3640-b9c7-c86b-28c31e8c44d5@mind.be>
References: <1488607456-30096-1-git-send-email-benoit.allard@greenbone.net>
 <043238f2-3640-b9c7-c86b-28c31e8c44d5@mind.be>
Message-ID: <20170306165720.28face21@armant.office.greenbone.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 3 Mar 2017 23:42:49 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

>  Hi Benoit,
> 
>  Strange timezone you live in, GMT+32 or something like that? :-)
> 

That's a development virtual-machine. The date in there was somewhat
not synchronized.

> On 04-03-17 07:04, Beno?t Allard wrote:
> > Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
> [snip]
> > diff --git a/package/dc3dd/Config.in b/package/dc3dd/Config.in
> > new file mode 100644
> > index 0000000..0a2a32e
> > --- /dev/null
> > +++ b/package/dc3dd/Config.in
> > @@ -0,0 +1,9 @@
> > +config BR2_PACKAGE_DC3DD
> > +	bool "dc3dd"
> > +	help
> > +          dc3dd is a patch to the GNU dd program, this version has
> > several
> > +          features intended for forensic acquisition of data.
> > Highlights
> > +          include hashing on-the-fly, split output files, pattern
> > writing, a
> 
>  Help text should wrap at 72 columns where the tab counts for 8, so
> this is 4 characters too many...
> 

Will do.

> > +          progress meter, and file verification.
> > +
> > +          https://sourceforge.net/projects/dc3dd/
> > diff --git a/package/dc3dd/dc3dd.hash b/package/dc3dd/dc3dd.hash
> > new file mode 100644
> > index 0000000..edd75c2
> > --- /dev/null
> > +++ b/package/dc3dd/dc3dd.hash
> > @@ -0,0 +1,2 @@
> > +# From
> > https://sourceforge.net/projects/dc3dd/files/dc3dd/7.2.646/dc3dd%207.2.646/
> > +sha1 3d3d9ba5f3b18fbf4798e1f3554f2d34d0ce5e2c dc3dd-7.2.646.zip
> 
>  If only a weak hash is available upstream, please add a locally
> calculated sha256.

Sure, will do.

> 
> > diff --git a/package/dc3dd/dc3dd.mk b/package/dc3dd/dc3dd.mk
> > new file mode 100644
> > index 0000000..5a25bee
> > --- /dev/null
> > +++ b/package/dc3dd/dc3dd.mk
> > @@ -0,0 +1,19 @@
> > +################################################################################
> > +#
> > +# dc3dd
> > +#
> > +################################################################################
> > +
> > +DC3DD_VERSION = 7.2.646
> 
>  There is a version 7.2.641 which is identical except that it has an
> older (!) Changelog, and a different version number...
> 
> > +DC3DD_SOURCE = dc3dd-$(DC3DD_VERSION).zip
> 
>  and that version has a proper tar.xz.

Indeed, I will use that older version.

> 
> > +DC3DD_SITE =
> > http://downloads.sourceforge.net/project/dc3dd/dc3dd/$(DC3DD_VERSION)/dc3dd%20$(DC3DD_VERSION)
> > +DC3DD_LICENSE = GPLv3
> 
>  I didn't do a full fossology but it looks like all files have the
> 'or later' clause, so it's GPLv3+

You are correct, most files have indeed the 'or later' mention.

> 
> > +DC3DD_LICENSE_FILES = COPYING
> > +
> > +define DC3DD_EXTRACT_CMDS
> > +        $(UNZIP) -d $(@D)/.. $(DL_DIR)/$(DC3DD_SOURCE) || true
> 
>  || true? You want to succeed in case of failure?

Yeah, the zip was somewhat malformed that we need the '|| true'. As we
test the checksum beforehand that didn't hurt much.

> 
>  Also, we normally extract within $(@D) and then move the result.
> Cfr. e.g. espeak.
> 
> > +        chmod a+x $(@D)/configure
> > +        chmod a+x $(@D)/build-aux/install-sh
> 
>  The tar.xz has execute permission set on all files. Not sure if
> that's an improvement :-)
> 
> 
>  Regards,
>  Arnout
> 
> > +endef
> > +
> > +$(eval $(autotools-package))
> > 
> 

-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170306/47cd5bcb/attachment.asc>
