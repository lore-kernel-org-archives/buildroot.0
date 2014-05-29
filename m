From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 29 May 2014 13:56:23 +0300
Subject: [Buildroot] [PATCH 3/3] gettext: optimize build time
In-Reply-To: <1401360028-10423-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1401360028-10423-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1401360028-10423-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140529105623.GN20069@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, May 29, 2014 at 12:40:28PM +0200, Thomas Petazzoni wrote:
> This commit significantly reduces the build time of host-gettext and
> gettext, by using the capacity of gettext to handle build things in a
> certain subdirectory:
> 
>  - For the host variant of gettext, we only need the gettext-tools,
>    available in the directory of the same name in the gettext sources.
> 
>  - For the target variant of gettext, we only need the gettext library
>    libintl, available in the gettext-runtime directory in the gettext
>    sources.
> 
> So by using appropriate values of GETTEXT_SUBDIR and
> HOST_GETTEXT_SUBDIR, we only build what's necessary. Moreover, by
> manually patching gettext-tools/Makefile.in and
> gettext-runtime/Makefile.in, we make sure to not build and install
> things like examples, documentation and so on.
> 
> In addition to this, these changes avoid the need to autoreconfigure
> the gettext package, which was particularly long.
> 
> Thanks to these changes, the build time of gettext goes from 1 minutes
> and 37 seconds to just 24 seconds, and the build of host-gettext goes
> from 2 minutes and 18 seconds to 1 minute and 13 seconds.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  .../gettext-03-option-to-disable-tools.patch       | 42 ----------------------

Why not remove --disable-tools from GETTEXT_CONF_OPT then?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
