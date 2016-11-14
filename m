From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Nov 2016 22:10:24 +0100
Subject: [Buildroot] [PATCH] dtv-scan-tables: rename file to have only
 ASCII characters
In-Reply-To: <1479156903-486-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1479156903-486-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20161114211024.GC3399@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-11-14 21:55 +0100, Thomas Petazzoni spake thusly:
> Since the bump of dtv-scan-tables to version
> ceb11833b35f05813b1f0397a60e0f3b99430aab in commit
> b1c8794d8ac0eb3895d13ae91d8e912ec469a105, one file contains non-ASCII
> characters, which causes encoding issues tvheadend. Since no other
> file in the dtv-scan-tables code base contains files with non-ASCII
> characters (despite having files named after cities in various
> countries that definitely do have non-ASCII characters), we rename
> this file so that it is named with only ASCII characters.
> 
> This fixes the build of tvheadend, which was failing when the host
> Python interpreter was python3, due to a file name encoding issue.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/1ae8bee297edb089535a2fb6ec724ebf7976888d/
>   (tvheadend)
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

At first, I was not very happy about this, because the filename is also
displayed to the user, so it would make sense to keep localised names.

However, you are right that there is no standard way to encode
filenames, so this is not very reliable to depend on the filename to
provide a user-visible representation of the city/country/... Instead,
the location should be encoded in the file itself, possibly using the
filename as a ascii-only fallback.

I'll take on me to reach to upstream to discuss this with them.

However, I still ahve a little comment about this patch...

> ---
> Note: we will separately submit a patch to the upstream
> dtv-scan-tables project to rename the problematic file.
> ---
>  package/dtv-scan-tables/dtv-scan-tables.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/dtv-scan-tables/dtv-scan-tables.mk b/package/dtv-scan-tables/dtv-scan-tables.mk
> index 8ef42b9..2be0eb5 100644
> --- a/package/dtv-scan-tables/dtv-scan-tables.mk
> +++ b/package/dtv-scan-tables/dtv-scan-tables.mk
> @@ -17,11 +17,16 @@ DTV_SCAN_TABLES_SITE_METHOD = git
>  DTV_SCAN_TABLES_LICENSE = GPLv2, LGPLv2.1
>  DTV_SCAN_TABLES_LICENSE_FILES = COPYING COPYING.LGPL
>  
> +# In order to avoid issues with file name encodings, we rename the
> +# only dtv-scan-tables file that has non-ASCII characters to have a
> +# name using only ASCII characters (pl-Krosno_Sucha_Gora)
>  define DTV_SCAN_TABLES_INSTALL_TARGET_CMDS
>  	for f in atsc dvb-c dvb-s dvb-t; do \
>  		$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share/dvb/$$f; \
>  		$(INSTALL) $(@D)/$$f/* $(TARGET_DIR)/usr/share/dvb/$$f; \
>  	done
> +	mv $(TARGET_DIR)/usr/share/dvb/dvb-t/pl-Krosno_Sucha* \
> +		$(TARGET_DIR)/usr/share/dvb/dvb-t/pl-Krosno_Sucha_Gora

Can't you do that in a post-extrat or post-patch hook?

Regards,
Yann E. MORIN.

>  endef
>  
>  $(eval $(generic-package))
> -- 
> 2.7.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
