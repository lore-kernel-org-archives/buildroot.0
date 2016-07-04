From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 4 Jul 2016 09:27:17 +0200
Subject: [Buildroot] [PATCH 04/24 v2] system/skeleton: update etc/mtab
 with a more sensible link
In-Reply-To: <4be6668a795a8af830d18094decfffdf18e5090f.1466622379.git.yann.morin.1998@free.fr>
References: <cover.1466622379.git.yann.morin.1998@free.fr>
 <4be6668a795a8af830d18094decfffdf18e5090f.1466622379.git.yann.morin.1998@free.fr>
Message-ID: <09a92af1-1125-ee42-1e3d-5f3a007b3a3b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22-06-16 21:07, Yann E. MORIN wrote:
> Currently, our /etc/mtab points to /proc/mounts. This was all neat so
> far, and was good for a sysv-like init system.
> 
> However, the way today is to point it at /proc/self/mounts, the
> per-process mount tab.
> 
> Additionnally, that's what systemd expects. If /etc/mtab is not a
> symlink to ../proc/self/mounts and the rootfs is readonly, systemd would
> whine loudly (and a service unit would be marked failed).
> 
> Since it works well for sysv-like init systems too, just use that.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 I was worried a bit that /proc/self/mounts would need a relatively recent
kernel, but it already existed in 2.6.18 and probably earlier, so that's OK.

 Then I worried about the relative instead of absolute symlink (I prefer an
absolute symlink for something like this), but is seems systemd really wants the
relative link, so OK.

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  system/skeleton/etc/mtab | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/system/skeleton/etc/mtab b/system/skeleton/etc/mtab
> index 4c0a094..5c4677a 120000
> --- a/system/skeleton/etc/mtab
> +++ b/system/skeleton/etc/mtab
> @@ -1 +1 @@
> -/proc/mounts
> \ No newline at end of file
> +../proc/self/mounts
> \ No newline at end of file
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
