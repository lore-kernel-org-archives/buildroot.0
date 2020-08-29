From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 23:55:10 +0200
Subject: [Buildroot] [PATCH v3 01/13] package/gettext-gnu: add msgfmt
 wrapper
In-Reply-To: <20200725230618.3640682-2-aduskett@gmail.com>
References: <20200725230618.3640682-1-aduskett@gmail.com>
 <20200725230618.3640682-2-aduskett@gmail.com>
Message-ID: <20200829235510.5c747013@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 25 Jul 2020 16:06:06 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> The msgfmt provided by gettext-gnu uses a default GETTEXTDATADIR path of
> /usr/share/gettext, causing problems with msgfmt, particularly if the host
> does not have gettext development packages installed, or if the host has a
> different version of gettext. Install a wrapper that sets the GETTEXTDATADIR
> to ${TARGET_DIR}/usr/share/gettext/ to ensure that any package using the
> msgfmt utility uses the proper GETTEXTDATADIR path.
> 
> This wrapper is not needed for gettext-tiny, as their implimentation of msgfmt
> is written completely from scratch and does not use the GETTEXTDATADIR
> variable.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Could you clarify which particular package needs this, i.e which build
issue it fixes ? I've build libblockdev and libbytesize successfully
without this, and NLS enabled.

> diff --git a/package/gettext-gnu/msgfmt b/package/gettext-gnu/msgfmt
> new file mode 100644
> index 0000000000..06f1a523da
> --- /dev/null
> +++ b/package/gettext-gnu/msgfmt
> @@ -0,0 +1,3 @@
> +#!/usr/bin/env bash
> +
> +GETTEXTDATADIR="${TARGET_DIR}/usr/share/gettext/" ${HOST_DIR}/bin/msgfmt.real "${@}"

It feels odd to use ${TARGET_DIR} here. Are those files in
/usr/share/gettext typically used at runtime on the target ? If not,
they should be removed from ${TARGET_DIR}. Shouldn't this be using
${STAGING_DIR}/usr/share/gettext ? Are the files in there installed by
gettext-gnu itself, or other packages ?

Yeah, lots of questions :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
