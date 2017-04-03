From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 3 Apr 2017 15:17:54 +0200
Subject: [Buildroot] [PATCH v3 1/2] e2fsprogs: keep util-linux's fsck if
 chosen
In-Reply-To: <1491154114-14797-2-git-send-email-casantos@datacom.ind.br>
References: <1491154114-14797-1-git-send-email-casantos@datacom.ind.br>
 <1491154114-14797-2-git-send-email-casantos@datacom.ind.br>
Message-ID: <437eef66-f26d-9f08-46c1-cf157c366194@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02-04-17 19:28, Carlos Santos wrote:
> Since e2fsprogs depends on util-linux, it's built after it. So you can't
> have e2fsck from e2fsprogs along with the fsck wrapper from util-linux
> (which is better maintained and compatible with systemd) because we end
> up deleting the fsck from util-linux.
> 
> Fix this issue by disabling e2fsprogs' fsck if the one from util-linux
> is selected.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

 Darn, I replied to v2 before seeing this.

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
> Changes v1->v2
>   - Add depenndece on !BR2_PACKAGE_UTIL_LINUX_FSCK to
>     BR2_PACKAGE_E2FSPROGS_FSCK
>   - Add comment telling that the fsck from util-linux has preference.
>   - Pass "--enable-fsck" conditionally to configure
>   - Remove the guard around the removal of /usr/sbin/fsck, since the
>     fsck from busybox and util-linux are installed at /sbin
>   - Improve comments and commit message
> Changes v2->v3
>   - Pass "--disable-fsck" conditionaly to configure too, since enable
>     is the default.
>   - Do not attempt to remove $(TARGET_DIR)/usr/sbin/fsck, just the
>     $(TARGET_DIR)/sbin/fsck from busybox.
> In the long run the e2fsprogs recipe deserves an extreme overhauling
> like we did for util-linux but right now these changes are enough to
> fix the specific problem of fsck.


[snip]
> @@ -24,11 +24,11 @@ E2FSPROGS_CONF_OPTS = \
>  	$(if $(BR2_PACKAGE_E2FSPROGS_DEBUGFS),,--disable-debugfs) \
>  	$(if $(BR2_PACKAGE_E2FSPROGS_E2IMAGE),,--disable-imager) \
>  	$(if $(BR2_PACKAGE_E2FSPROGS_E4DEFRAG),,--disable-defrag) \
> +	$(if $(BR2_PACKAGE_E2FSPROGS_FSCK),--enable-fsck,--disable-fsck) \

 That's indeed what I meant :-)

 Regards,
 Arnout

>  	$(if $(BR2_PACKAGE_E2FSPROGS_RESIZE2FS),,--disable-resizer) \
>  	--disable-uuidd \
>  	--disable-libblkid \
>  	--disable-libuuid \
> -	--enable-fsck \
>  	--disable-e2initrd-helper \
>  	--disable-testio-debug \
>  	--disable-rpath

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
