From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Sep 2019 22:02:23 +0200
Subject: [Buildroot] [PATCH v3] package/pkg-utils.mk: add dl_dir to
 show-info output
In-Reply-To: <20190803140433.27967-1-arnout@mind.be>
References: <20190803140433.27967-1-arnout@mind.be>
Message-ID: <20190925220223.12bc3db7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  3 Aug 2019 16:04:33 +0200
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> wrote:

> It can be useful for scripts to be able to access a package's source
> file after download. That used to be easy, just DL_DIR/PKG_SOURCE.
> However, with the subdirectories in DL_DIR which can be overridden with
> PKG_DL_SUBDIR, that is no longer easy.
> 
> Therefore, this patch adds dl_dir to the package information. It prints
> just PKG_DL_SUBDIR, to avoid dumping absolute paths to the buildroot
> directory in the show-info output.
> 
> It can be used with the following jq script to get a newline-separated
> list of all downloaded files:
> 
> make show-info | jq -r '.[] | ("dl/" + .dl_dir + "/" + .downloads[]?.source)'
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
> v2 -> v3:
>  - Remove accidental change

Applied to master, thanks.

I asked on IRC to Yann what was the difference between this and "make
external-deps". make external-deps only returns the file name, but not
its location inside $(BR2_DL_DIR). Perhaps we should change
external-deps, as it is no longer very useful as it is ? But of course
that's kind of an API breakage... but moving files into subfolders in
$(BR2_DL_DIR) was also kind of an API breakage anyway.

Thoughts?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
