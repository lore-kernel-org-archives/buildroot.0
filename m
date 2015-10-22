From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 22 Oct 2015 23:19:03 +0200
Subject: [Buildroot] [PATCH 1/2] Makefile: use root-relative -f path for
 /sbin/ldconfig
In-Reply-To: <1445502151-25735-1-git-send-email-bjorn.forsman@gmail.com>
References: <1445502151-25735-1-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <562952C7.30708@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22-10-15 10:22, Bj?rn Forsman wrote:
> Without this, the -f path argument is ignored:
> 
>  $ strace -f -s128 /sbin/ldconfig -r /home/vagrant/buildroot/output/target -f /home/vagrant/buildroot/output/target/etc/ld.so.conf |& grep "ld\.so\.conf"
>  execve("/sbin/ldconfig", ["/sbin/ldconfig", "-r", "/home/vagrant/buildroot/output/target", "-f", "/home/vagrant/buildroot/output/target/etc/ld.so.conf"], [/* 61 vars */]) = 0
>  execve("/sbin/ldconfig.real", ["/sbin/ldconfig.real", "-r", "/home/vagrant/buildroot/output/target", "-f", "/home/vagrant/buildroot/output/target/etc/ld.so.conf"], [/* 61 vars */]) = 0
>  write(2, "Warning: ignoring configuration file that cannot be opened: /home/vagrant/buildroot/output/target/etc/ld.so.conf", 112Warning: ignoring configuration file that cannot be opened: /home/vagrant/buildroot/output/target/etc/ld.so.conf) = 112
> 
> Proof that using root-relative path -f path (/etc/ld.so.conf, without
> $(TARGET_DIR) in front) picks up the correct file:
> 
>  $ strace -f -s128 /sbin/ldconfig -r /home/vagrant/buildroot/output/target -f /etc/ld.so.conf |& grep "ld\.so\.conf"
>  execve("/sbin/ldconfig", ["/sbin/ldconfig", "-r", "/home/vagrant/buildroot/output/target", "-f", "/etc/ld.so.conf"], [/* 61 vars */]) = 0
>  execve("/sbin/ldconfig.real", ["/sbin/ldconfig.real", "-r", "/home/vagrant/buildroot/output/target", "-f", "/etc/ld.so.conf"], [/* 61 vars */]) = 0
>  lstat("/home/vagrant/buildroot/output/target/etc/ld.so.conf", {st_mode=S_IFREG|0644, st_size=0, ...}) = 0
>  open("/home/vagrant/buildroot/output/target/etc/ld.so.conf", O_RDONLY) = 3
> 
> Tested on Ubuntu 14.04.
> 
>  $ /sbin/ldconfig --version
>  ldconfig (Ubuntu EGLIBC 2.19-0ubuntu6.6) 2.19
>  ...
> 
> $(TARGET_CROSS)ldconfig behaves differently (at least the ldconfig I
> tested, which was built by Buildroot) and should not have root-relative
> -f path. If it does, it will pick up host /etc/ld.so.conf file.

 This makes me worried that it will do the wrong thing on some other build
hosts. In fact, using /sbin/ldconfig is fundamentally broken since we can't be
sure that it's compatible with the target dynamic linker.


 Regards,
 Arnout

> 
> Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index dd8959f..61ce1f9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -607,7 +607,7 @@ endif
>  					-f $(TARGET_DIR)/etc/ld.so.conf; \
>  	else \
>  		/sbin/ldconfig -r $(TARGET_DIR) \
> -			       -f $(TARGET_DIR)/etc/ld.so.conf; \
> +			       -f /etc/ld.so.conf; \
>  	fi
>  	( \
>  		echo "NAME=Buildroot"; \
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
