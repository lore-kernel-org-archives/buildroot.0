From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Apr 2020 23:53:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/rsync: annotate CVE-2017-16548
In-Reply-To: <20200301192727.209357-1-fontaine.fabrice@gmail.com>
References: <20200301192727.209357-1-fontaine.fabrice@gmail.com>
Message-ID: <20200423235315.24b6e0e6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm adding in Cc: Matthew Weber and Akshay Bhat for the interaction
with NVD.

Also adding Titouan Christophe for the discussion about our script that
does the CVE checking.

On Sun,  1 Mar 2020 20:27:27 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> CVE-2017-165484 is misclassified (by our CVE tracker) as affecting
> version 3.1.3, while in fact it affects 3.1.2 and 3.1.3-development
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/rsync/rsync.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
> index 52875e428a..95d19a7f4c 100644
> --- a/package/rsync/rsync.mk
> +++ b/package/rsync/rsync.mk
> @@ -13,6 +13,10 @@ RSYNC_CONF_OPTS = \
>  	--with-included-zlib=no \
>  	--with-included-popt=no
>  
> +# CVE-2017-165484 is misclassified (by our CVE tracker) as affecting version 3.1.3,
> +# while in fact it affects 3.1.2 and 3.1.3-development
> +RSYNC_IGNORE_CVES += CVE-2017-16548

Indeed commit 47a63d90e71d3e19e0e96052bb8c6b9cb140ecc1 which fixes this
CVE is part of the 3.1.3 release. This means the NVD database is wrong.

Instead of doing a workaround in Buildroot, can we report this to the
NVD maintainers ?

But now that I look at https://nvd.nist.gov/vuln/detail/CVE-2017-16548
I see that the affected versions are 3.1.2 and 3.1.3pre1. Even the
latter is not correct: the commit was merged before the 3.1.3pre1 tag.
In addition, I don't see this "pre1" information in the version
information available in the JSON in format 1.0 we use.

Perhaps the JSON in format 1.1 has more detailed information, and we
should switch to using JSON in format 1.1.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
