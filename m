From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 15 Jan 2012 19:45:21 +0100
Subject: [Buildroot] [PATCH] Improved git download method performance.
In-Reply-To: <54DB0A5039192D48A770D406992C75BC28EC825859@DFW1MBX21.mex07a.mlsrvr.com>
References: <54DB0A5039192D48A770D406992C75BC28EC825859@DFW1MBX21.mex07a.mlsrvr.com>
Message-ID: <201201151945.22178.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

On Friday 06 January 2012 23:56:58 Theodore Witkamp wrote:
> Instead of cloning the a complete repository, git archive is used first.
> If git archive fails because the remote host does not support it, git clone is
> used with with --depth 1 so only minimal history is copied.

 Great idea!  BTW, is there any upstream that actually supports git archive?

> Also the $($(PKG)_SOURCE) default is changed to .tar instead of .tar.gz.
> This removes unneeded compression and decompression.

 Bad idea.  As noted elsewhere, this uses extra disk space (remember that
.tar.gz will stay in the dl directory).  With gzip the cpu overhead is
fairly small - unless you have an SSD and a slow CPU, disk access will
probably dominate (since downloads/extracts are anyway never in parallel
with anything else).


> Relative file paths are now relative to $(TOPDIR) not $(DL_DIR).

 That's of course a better idea, but may be an incompatible change for some
people.  So Peter, make sure it gets a big fat warning in the Changelog.

> ---
>  package/Makefile.package.in |   35 ++++++++++++++++++++---------------
>  1 files changed, 20 insertions(+), 15 deletions(-)
> 
> diff --git a/package/Makefile.package.in b/package/Makefile.package.in
> index e85eb15..14f1ba1 100644
> --- a/package/Makefile.package.in
> +++ b/package/Makefile.package.in
> @@ -146,14 +146,14 @@ domainseparator=$(if $(1),$(1),/)
>  
>  define DOWNLOAD_GIT
>  	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
> -	(pushd $(DL_DIR) > /dev/null && \
> -	$(GIT) clone --bare $($(PKG)_SITE) $($(PKG)_BASE_NAME) && \
> -	pushd $($(PKG)_BASE_NAME) > /dev/null && \
> -	$(GIT) archive --format=tar --prefix=$($(PKG)_BASE_NAME)/ $($(PKG)_DL_VERSION) | \
> -		gzip -c > $(DL_DIR)/$($(PKG)_SOURCE) && \
> -	popd > /dev/null && \
> -	rm -rf $($(PKG)_DL_DIR) && \
> -	popd > /dev/null)
> +	$(GIT) archive --format=tar --remote $($(PKG)_SITE) --prefix=$($(PKG)_BASE_NAME)/ $($(PKG)_DL_VERSION) \
> +	> $(DL_DIR)/$($(PKG)_SOURCE) || \
> +	( \
> +	$(GIT) clone   -v --depth 1 --bare $($(PKG)_SITE) $($(PKG)_DL_DIR)   &&  \
> +	$(GIT) archive --format=tar --remote $($(PKG)_DL_DIR) --prefix=$($(PKG)_BASE_NAME)/ $($(PKG)_DL_VERSION) \
> +	> $(DL_DIR)/$($(PKG)_SOURCE) && \
> +	rm -rf $($(PKG)_DL_DIR)  \
> +	)

 I would like to see the two git archive commands refactored into a single 
make variable, but that's not a requirement for acceptance.  Something like

define GIT_ARCHIVE_CMD
	$(GIT) archive --format=tar --remote $${remote} --prefix=$($(PKG)_BASE_NAME)/ $($(PKG)_DL_VERSION) | \
	  gzip -c > $(DL_DIR)/$($(PKG)_SOURCE)
endif
...
	remote=$($(PKG)_SITE); $(GIT_ARCHIVE_CMD) || \
...

 Also please use some indentation in the shell scripts.

[snip, since the rest of the changes are unnecessary]

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120115/28471606/attachment-0001.html>
