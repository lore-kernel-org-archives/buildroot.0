From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 14 Jun 2012 00:26:35 +0200
Subject: [Buildroot] [PATCH v3] busybox: install S41inetd and inetd.conf
 if inetd is enabled in busybox.
In-Reply-To: <1339570179-29586-1-git-send-email-keguang.zhang@gmail.com>
References: <1339570179-29586-1-git-send-email-keguang.zhang@gmail.com>
Message-ID: <4FD9139B.2030604@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/13/12 08:49, Kelvin Cheung wrote:
> +define BUSYBOX_INSTALL_INETD_CONF
> +	if grep -q CONFIG_INETD=y $(@D)/.config; then \
> +		[ -f $(TARGET_DIR)/etc/inetd.conf ] || \
> +			install -D -m 0644 package/busybox/inetd.conf \
> +				$(TARGET_DIR)/etc/inetd.conf; \
> +		if grep -q CONFIG_TELNETD=y $(@D)/.config; then \
> +			if ! grep -q '^telnet' $(TARGET_DIR)/etc/inetd.conf; then \
> +				echo -e "telnet\tstream\ttcp\tnowait\troot\ttelnetd\ttelnetd -i">>  $(TARGET_DIR)/etc/inetd.conf; \
> +			fi; \
> +		else $(SED) '/^telnet/d' $(TARGET_DIR)/etc/inetd.conf; fi; \
> +		if grep -q CONFIG_FTPD=y $(@D)/.config; then \
> +			if ! grep -q '^ftp' $(TARGET_DIR)/etc/inetd.conf; then \
> +				echo -e "#ftp\tstream\ttcp\tnowait\troot\tftpd\tftpd -w /files/to/serve">>  $(TARGET_DIR)/etc/inetd.conf; \
> +			fi; \

  If busybox is rebuilt (and the inetd.conf wasn't modified), the #ftp line will
be added a second time.

> +		else $(SED) '/^ftp/d' $(TARGET_DIR)/etc/inetd.conf; fi; \
> +		if grep -q CONFIG_TFTPD=y $(@D)/.config; then \
> +			if ! grep -q '^tftp' $(TARGET_DIR)/etc/inetd.conf; then \
> +				echo -e "#tftp\tdgram\tudp\tnowait\troot\ttftpd\ttftpd -l -c /files/to/serve">>  $(TARGET_DIR)/etc/inetd.conf; \
> +			fi; \
> +		else $(SED) '/^tftp/d' $(TARGET_DIR)/etc/inetd.conf; fi \
> +	else rm -f $(TARGET_DIR)/etc/inetd.conf; fi

  If netkitbase is selected and busybox happens to be (re)built afterwards,
inetd.conf would get removed...

> +endef

  I think all those conditions are just trying to be too smart.  Just copy
a default config file from package/busybox if inetd is selected, and leave
it alone if it is not selected.  Anyway, if the telnetd executable doesn't exist,
busybox will just close the connection immediately after accepting it.

  You could update inetd.conf in-place to add/remove the comment
marker.  E.g.

if grep -q CONFIG_TELNETD=y $(@D)/.config; then \
	$(SED) 's/^# NOT SELECTED #telnet/telnet/' $(TARGET_DIR)/etc/inetd.conf; \
else
	$(SED) 's/^telnet/# NOT SELECTED #telnet/' $(TARGET_DIR)/etc/inetd.conf; \
fi

  However, even that is problematic because it doesn't support a configuration
with a non-busybox telnetd.

  Bottom line: I prefer to simplify it to

+define BUSYBOX_INSTALL_INETD_CONF
+	if grep -q CONFIG_INETD=y $(@D)/.config; then \
+		[ -f $(TARGET_DIR)/etc/inetd.conf ] || \
+			install -D -m 0644 package/busybox/inetd.conf \
+				$(TARGET_DIR)/etc/inetd.conf; \
+	fi
+endef


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
