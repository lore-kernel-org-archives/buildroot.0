From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Feb 2019 14:30:19 +0100
Subject: [Buildroot] [PATCH 1/2] package/libid3tag: fix id3tag.pc
In-Reply-To: <20190215224207.15546-1-fontaine.fabrice@gmail.com>
References: <20190215224207.15546-1-fontaine.fabrice@gmail.com>
Message-ID: <20190216143019.6e58ee27@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Fri, 15 Feb 2019 23:42:06 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Add -lz to id3tag.pc, this fix is needed to be able to use pkg-config in
> madplay to find id3tag dependencies
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libid3tag/id3tag.pc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libid3tag/id3tag.pc b/package/libid3tag/id3tag.pc
> index 845eb3276b..c8b248766c 100644
> --- a/package/libid3tag/id3tag.pc
> +++ b/package/libid3tag/id3tag.pc
> @@ -7,5 +7,5 @@ Name: id3tag
>  Description: ID3 tag reading library
>  Version: 0.15.1b
>  Requires:
> -Libs: -L${libdir} -lid3tag
> +Libs: -L${libdir} -lid3tag -lz

Is it libid3tag that links against libz ?

If that's the case, then this fix is not the most correct one. It should
instead be:

Libs: -L${libdir} -lid3tag
Libs.private: -lz

Thanks to this, it's only in static linking configurations that
pkg-config --libs id3tag will return -lz, which is what we want: in
dynamic linking configurations, we don't want users of the libid3tag
library to directly link with libz, as it is not necessary.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
