From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 16:13:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/libtorrent: annotate
 CVE-2009-1760 and CVE-2016-5301
In-Reply-To: <20200301200049.211453-1-fontaine.fabrice@gmail.com>
References: <20200301200049.211453-1-fontaine.fabrice@gmail.com>
Message-ID: <20200425161318.00ee0b62@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  1 Mar 2020 21:00:49 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> CVE-2009-1760 and CVE-2016-5301 are misclassified (by our CVE tracker)
> as affecting libtorrent, while in fact they affect libtorrent-rasterbar.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libtorrent/libtorrent.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/libtorrent/libtorrent.mk b/package/libtorrent/libtorrent.mk
> index c8310cab65..17c6f92ab4 100644
> --- a/package/libtorrent/libtorrent.mk
> +++ b/package/libtorrent/libtorrent.mk
> @@ -14,6 +14,10 @@ LIBTORRENT_INSTALL_STAGING = YES
>  LIBTORRENT_LICENSE = GPL-2.0
>  LIBTORRENT_LICENSE_FILES = COPYING
>  
> +# CVE-2009-1760 and CVE-2016-5301 are misclassified (by our CVE tracker) as
> +# affecting libtorrent, while in fact they affect libtorrent-rasterbar.
> +LIBTORRENT_IGNORE_CVES += CVE-2009-1760 CVE-2016-5301

Here as well, I don't think this is the proper solution. You're just
papering over the actual problem, not solving it.

CVE-2009-1760 is described like this:

      "affects" : {
        "vendor" : {
          "vendor_data" : [ {
            "vendor_name" : "rasterbar_software",
            "product" : {
              "product_data" : [ {
                "product_name" : "libtorrent",

So indeed, since we currently only match on "product_name", we believe
this CVE is for libtorrent, while it is for libtorrent-rasterbar.

The proper way to solve this is to have better CPE matching logic. Your
patch is just removing the CVEs from libtorrent, but not making them
appear for libtorrent-rasterbar (even though they probably wouldn't
appear as they are quite old).

Let's work together on a proper CPE matching logic instead.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
