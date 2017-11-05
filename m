From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 5 Nov 2017 13:52:29 +0100
Subject: [Buildroot] [PATCH] pkg-autotools: explicitly use /usr/{bin,
 sbin, lib}, with merged usr
In-Reply-To: <20171101033627.26253-1-casantos@datacom.ind.br>
References: <20171101033627.26253-1-casantos@datacom.ind.br>
Message-ID: <14c66d15-281b-8701-697c-d869581c8706@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01-11-17 04:36, Carlos Santos wrote:
> Prevent packages from using /bin, /sbin or /lib when those paths are
> symlinks to their /usr counterparts.
> 
> This is useful for util-linux, whose installation attempts to move
> shared libraries from ${usrlib_execdir} to ${libdir} if both paths are
> not the same, leading to error messages like this:
> 
>   mv: '$(TARGET_DIR)/usr/lib/libfoo.so.1' and '$(TARGET_DIR)/lib/libfoo.so.1' are the same file
> 
> Fortunalely that error is not fatal but other packages may do similar
> things with bad results, so let's avoid possible problems.

 Well, since the default for bindir is <exec_prefix>/bin and exec_prefix is
/usr, for most packages this is not going to be an issue. It's only util-linux
that overrides it.

 Therefore, I don't think this should be done globally, but specifically for
util-linux.

 Regards,
 Arnout

> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  package/pkg-autotools.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> index 45de99356f..32e76b54c2 100644
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk
> @@ -189,6 +189,7 @@ define $(2)_CONFIGURE_CMDS
>  		--build=$$(GNU_HOST_NAME) \
>  		--prefix=/usr \
>  		--exec-prefix=/usr \
> +		$$(if $$(BR2_ROOTFS_MERGED_USR),--bindir=/usr/bin --sbindir=/usr/sbin --libdir=/usr/lib,) \
>  		--sysconfdir=/etc \
>  		--localstatedir=/var \
>  		--program-prefix="" \
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
