From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Apr 2018 00:40:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/gdb: don't remove support files
 if python chosen
In-Reply-To: <1523389042-66122-1-git-send-email-jzaddach@cisco.com>
References: <1523389042-66122-1-git-send-email-jzaddach@cisco.com>
Message-ID: <9d52d1d0-ddf4-64c2-a7a4-5fb5ec28bb2c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-04-18 21:37, Jonas Zaddach wrote:
> If one wants to use GDB with python support on the target, you need the support
> files installed by GDB. These get usually deleted to save some space, so I just
> wrapped the Makefile code deleting them in a conditional block depending on if
> python support is active or not.
> 
> Signed-off-by: Jonas Zaddach <jzaddach@cisco.com>
> ---
>  package/gdb/gdb.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index 7e86ba0..5c915da 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -164,11 +164,13 @@ endif
>  
>  # This removes some unneeded Python scripts and XML target description
>  # files that are not useful for a normal usage of the debugger.

 Are the XML files also needed, or only the .py files?

 It's especially surprising that you'd need those syscalls files for different
architectures than the target...

 But anyway, it's just about 200K.

 One small nit: I'd leave the comment within the condition. Otherwise:

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> +ifneq ($(BR2_PACKAGE_GDB_PYTHON),y)
>  define GDB_REMOVE_UNNEEDED_FILES
>  	$(RM) -rf $(TARGET_DIR)/usr/share/gdb
>  endef
>  
>  GDB_POST_INSTALL_TARGET_HOOKS += GDB_REMOVE_UNNEEDED_FILES
> +endif
>  
>  # This installs the gdbserver somewhere into the $(HOST_DIR) so that
>  # it becomes an integral part of the SDK, if the toolchain generated
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
