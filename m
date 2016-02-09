From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 9 Feb 2016 22:46:32 +0100
Subject: [Buildroot] [PATCH RESEND 1/1] skeleton: Have /etc/profile
 source [A-Za-z0-9_-]+ files in profile.d.
In-Reply-To: <1455030388-10858-1-git-send-email-nicolas.cavallari@green-communications.fr>
References: <1890083.agaboDjt8N@hardbit>
 <1455030388-10858-1-git-send-email-nicolas.cavallari@green-communications.fr>
Message-ID: <56BA5E38.5010806@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09-02-16 16:06, Nicolas Cavallari wrote:
> Instead of sourcing all files ending with .sh (which is unexpected
> enough that /etc/profile.d/umask was missed), source all files which
> matches [A-Za-z0-9_-]+.  This way, backup files from most text editors
> (e.g.  umask~, umask.dpkg-old, .umask.swp~) will not be sourced.

 Actually, I'm with Yann, it's better to keep it as *.sh. In addition to the
reasons he quotes, I'd also add that the code with this patch becomes a lot more
complicated than just sourcing *.sh.


 Regards,
 Arnout

> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> ---
> 
> Resend with the correct list address.
> 
> diff --git a/system/skeleton/etc/profile b/system/skeleton/etc/profile
> index 3a97427..2fb7743 100644
> --- a/system/skeleton/etc/profile
> +++ b/system/skeleton/etc/profile
> @@ -12,9 +12,14 @@ export PAGER='/bin/more '
>  export EDITOR='/bin/vi'
>  
>  # Source configuration files from /etc/profile.d
> -for i in /etc/profile.d/*.sh ; do
> -	if [ -r "$i" ]; then
> -		. $i
> -	fi
> -	unset i
> +for i in /etc/profile.d/* ; do
> +	case "$i" in
> +	/etc/profile.d/*[^A-Za-z0-9_-]*)
> +		continue;;
> +	*)
> +		if [ -r "$i" ]; then
> +			. $i
> +		fi
> +	esac
>  done
> +unset i
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
