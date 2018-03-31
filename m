From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 31 Mar 2018 11:10:22 +0200
Subject: [Buildroot] [PATCH] skeleton-init-systemd: Work around for RO
 root /var/lib not populating
In-Reply-To: <20180227221628.8283-1-tpiepho@impinj.com>
References: <20180227221628.8283-1-tpiepho@impinj.com>
Message-ID: <20180331091022.GB25161@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Trent, All,

On 2018-02-27 14:16 -0800, Trent Piepho spake thusly:
> When using a RO root with systemd, it is intended that /var/lib should be
> populated at boot time by tmpfiles system mirroring it from
> /usr/share/factory/var/lib.
> 
> However, this will only happen if /var/lib does not already exist at the
> time systemd-tmpfiles runs.  If it does exist, then tmpfiles will
> (silently) skip it and do nothing.
> 
> It turns out /var/lib will exist, because some part of systemd creates
> /var/lib/systemd/catalog on boot before tmpfiles runs.
> 
> The fix used here is to also create tmpfiles entries for the contents of
> /var/lib/* and /var/lib/systemd/*.  This way, when those directories
> already exist, the entire tree is not skipped and instead the
> not-yet-existing contents of /var/lib and /var/lib/systemd will be still
> be mirrored from the factory dir.
> 
> And if /var/lib/systemd, or a prefix of that, stops getting created and
> does not exist, it'll still mirror properly.

I believe that we fixed that in another way with that commit:

    6e5df928539 package/skeleton-systemd: invert factory logic

As thus, I've marked this patch as rejected.

If your use-case is still not fixed, please re-send it.

Thanks!

Regards,
Yann E. MORIN.

> It does cause some warnings from systemd:
> systemd[1]: Starting Create Volatile Files and Directories...
> systemd-tmpfiles[148]: [/etc/tmpfiles.d/var-factory.conf:7] Duplicate line for path "/var/lib/systemd", ignoring.
> systemd-tmpfiles[148]: [/etc/tmpfiles.d/var-factory.conf:8] Duplicate line for path "/var/lib/systemd/coredump", ignoring.
> 
> But they can be ignored.
> 
> IMHO, I think a better solution would be for systemd-tmpfiles to gain a
> "merge tree" operation that is like "C" but doesn't abort if the
> destination exists, but rather merges the source into it.
> 
> Signed-off-by: Trent Piepho <tpiepho@impinj.com>
> ---
>  package/skeleton-init-systemd/skeleton-init-systemd.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk b/package/skeleton-init-systemd/skeleton-init-systemd.mk
> index 93bff9d27b..0ff3c774ba 100644
> --- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
> +++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
> @@ -42,7 +42,10 @@ endef
>  define SKELETON_INIT_SYSTEMD_PRE_ROOTFS_VAR
>  	rm -f $(TARGET_DIR)/var
>  	mkdir $(TARGET_DIR)/var
> -	for i in $(TARGET_DIR)/usr/share/factory/var/*; do \
> +	for i in $(TARGET_DIR)/usr/share/factory/var/* \
> +		 $(TARGET_DIR)/usr/share/factory/var/lib/* \
> +		 $(TARGET_DIR)/usr/share/factory/var/lib/systemd/*; do \
> +		[ -e "$${i}" ] || continue; \
>  		j="$${i#$(TARGET_DIR)/usr/share/factory}"; \
>  		if [ -L "$${i}" ]; then \
>  			printf "L+! %s - - - - %s\n" \
> -- 
> 2.14.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
