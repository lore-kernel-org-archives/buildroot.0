From: Wolfram Gloger <wg@malloc.de>
Date: Wed, 13 Jul 2011 18:59:40 +0200
Subject: [Buildroot] [PATCH] new package: minidlna
In-Reply-To: <20110705230018.01be536a@skate> (message from Thomas Petazzoni on
 Tue, 5 Jul 2011 23:00:18 +0200)
References: <0MKxYi-1QcgdO2zs8-00018x@mrelayeu.kundenserver.de>
 <20110705230018.01be536a@skate>
Message-ID: <0MLT3m-1QhakY2PJK-000gV0@mrelayeu.kundenserver.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

> Could you sent your patch inline ?

Sure, will do.

> Your .mk file lists multiple dependencies, but your Config.in forgets
> to "depends on" or "select" them.

Ok, thanks.  I suspect "depends on" is the correct one?

> Your minidlna-1.0.20-cross.patch file must come with a header detailing
> what the patch does and why it is needed, along with a Signed-off-by
> line identifying the author of the patch.

Will add.

> This patch uses STAGING_DIR
> in several places, which makes the patch completely unsuitable for
> upstream inclusion. Isn't there a way of making this a little bit more
> generic so that there's at least a hope of getting this patch merged
> upstream in the minidlna project ?

Why do you think this makes it completely unsuitable for upstream?
_Some_ form of cross compile support needs to happen, and whether you
call the base dir STAGING_DIR or anything else really shouldn't
matter.  I was careful not to break anything generic in the patch, and
keep it minimal.  Actually, I do intend to propose it for upstream.

BTW an autotools patch was proposed for minidlna some time ago,
but it is of course much bigger and wasn't so far applied.

> In the .mk file, remove all useless commented lines.

I see only one, but ok.

> Also remove the
> 
> +		BR2_DEFAULT_KERNEL_HEADERS=$(BR2_DEFAULT_KERNEL_HEADERS) \
> 
> line, which apparently is useless.

I'll try this.  Grepping I could not see where
BR2_DEFAULT_KERNEL_HEADERS is automagically environment-exported to
config scripts.

> Regarding the dependencies, is it directly minidlna that depends on
> libvorbis, flac, libogg, etc. ? Or is it libav that depends on those ?

You have a good point there.  minidlna actually only uses av_open()
and not any of the vorbis, flac, or ogg library entry points directly,
AFAICS.  So I would say that this is another shortcoming in the
minidlna config script.  Since libav has had native demuxers for
ogg/vorbis and flac for a long time (there is a libvorbis option but
that only enables an alternative encoder which is irrelevant for
minidlna), I think the best solution is simply to get rid of these
dependencies in minidlna.

Thanks,
Wolfram.
