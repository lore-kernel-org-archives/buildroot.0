From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 2 May 2011 15:02:44 -0400
Subject: [Buildroot] [PATCH] net-snmp: fixup paths in net-snmp-config
In-Reply-To: <1304350565-1948-1-git-send-email-gustavo@zacarias.com.ar>
References: <1304350565-1948-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <201105021502.45233.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday, May 02, 2011 11:36:05 Gustavo Zacarias wrote:
> Exposed by commit 7e3e8ec040b06d6e2fb69e55c004f1ebc02c76d0
> net-snmp-config goes for -L/usr/lib thus things break since this wins
> over the sysroot if we have a host net-snmp library around when we build
> packages that link against net-snmp.
> 
> --- a/package/netsnmp/netsnmp.mk
> +++ b/package/netsnmp/netsnmp.mk
> @@ -68,4 +68,14 @@ define NETSNMP_UNINSTALL_TARGET_CMDS
>  	rm -f $(TARGET_DIR)/usr/lib/libnetsnmp*
>  endef
> 
> +define NETSNMP_STAGING_NETSNMP_CONFIG_FIXUP
> +	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
> +		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
> +		-e "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include\',g" \
> +		-e "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
> +		$(STAGING_DIR)/usr/bin/net-snmp-config
> +endef

this should really be a common bit of logic instead of net-snmp specific.  
just about every -config script can be fixed in this way.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110502/1e9077b4/attachment.asc>
