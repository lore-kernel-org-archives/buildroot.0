From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 7 Feb 2018 23:35:28 +0100
Subject: [Buildroot] [PATCH] package/openssh: Add tmpfiles.d snippet to
 make /var/empty
In-Reply-To: <20180123232451.6236-1-chris.lesiak@licor.com>
References: <20180123232451.6236-1-chris.lesiak@licor.com>
Message-ID: <145330a6-befd-c579-a403-855120946b5d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-01-18 00:24, Chris Lesiak wrote:
> This is useful in volatile or stateless systems in which /var is empty.

 This explanation is insufficient for me. Why is it a problem for openssh if
/var is empty?

 Regards,
 Arnout


> Signed-off-by: Chris Lesiak <chris.lesiak@licor.com>
> ---
>  package/openssh/openssh.mk        | 2 ++
>  package/openssh/ssh_tmpfiles.conf | 1 +
>  2 files changed, 3 insertions(+)
>  create mode 100644 package/openssh/ssh_tmpfiles.conf
> 
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index fc82300ab7..bb43b2edec 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -73,6 +73,8 @@ define OPENSSH_INSTALL_INIT_SYSTEMD
>  	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
>  	ln -fs ../../../../usr/lib/systemd/system/sshd.service \
>  		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/sshd.service
> +	$(INSTALL) -m 0644 -D package/openssh/ssh_tmpfiles.conf \
> +		$(TARGET_DIR)/usr/lib/tmpfiles.d/ssh.conf
>  	$(OPENSSH_INSTALL_SYSTEMD_SYSUSERS)
>  endef
>  
> diff --git a/package/openssh/ssh_tmpfiles.conf b/package/openssh/ssh_tmpfiles.conf
> new file mode 100644
> index 0000000000..9d1370a930
> --- /dev/null
> +++ b/package/openssh/ssh_tmpfiles.conf
> @@ -0,0 +1 @@
> +d /var/empty 0711 root root
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
