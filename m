Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90796C5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FDB740B55;
	Sat, 31 May 2025 16:54:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pRPuTLQgMDob; Sat, 31 May 2025 16:54:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 705DE40B56
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 705DE40B56;
	Sat, 31 May 2025 16:54:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C441C235
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA8756072E
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P_8QxMLZxB6z for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:54:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ECAB860640
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECAB860640
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ECAB860640
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:54:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DEF291C00E6; Sat, 31 May 2025 18:54:39 +0200 (CEST)
Message-ID: <3f85eeeb-58ab-4c36-9d7a-abd4e0f616f4@rnout.be>
Date: Sat, 31 May 2025 18:54:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Fiona Klute <fiona.klute@gmx.de>
References: <20250515121027.561571-1-adam.duskett@amarulasolutions.com>
 <20250515121027.561571-2-adam.duskett@amarulasolutions.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250515121027.561571-2-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748710480; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ZuO47rJJRCOE0zCr61D7Ix4O9geYa7DtBTx+NY59Y0M=;
 b=VefMrndyvpfClpGyc+2qZKSbr7LlXxtVJLvdSemwd9bo7UuVn9QNzaQTJ+13S7ZIweXjeA
 VY/8nTfCvRKw3AE4hCQ6V6zsI6LEhY/QchesDEms33SurrRZgOakqr9xpJTvRyMMJSkTTb
 KZTpikQiDIRG+LCLsIFmVBjW3NLVvYUiapTLJf5Hg1+HAelCYLqVZxX4msXOlrIOelHMrD
 r/S8bWB5spcib/t7LQNnLX+CrsQhN21ZZ6jz+Zw9ztFl3xVXFxpPAStTCUEkiDmGgQtk+s
 xt91bGJ+OkNEgSlXNPlwO9EmG1p53t2v3ExAsTFI2Dh9qT6/ti6Y+Sq3ODb2zg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=VefMrndy
Subject: Re: [Buildroot] [PATCH 01/10] package/audit/S02auditd: fix
 shellcheck and check-package warnings
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/05/2025 14:10, Adam Duskett wrote:
> Fixup S20audit to pass shellcheck -oall and check-package. The file now
> closely resembles package/busybox/S01syslogd.
> 
> Tested with qemu_x86_64_defconfig. start, stop, restart, reload, and rotate
> all work with busybox ash shell.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/audit/S02auditd | 66 +++++++++++++++++++++++++++--------------
>   1 file changed, 44 insertions(+), 22 deletions(-)
> 
> diff --git a/package/audit/S02auditd b/package/audit/S02auditd
> index dd3dc22d6d..f32f01714e 100644
> --- a/package/audit/S02auditd
> +++ b/package/audit/S02auditd
> @@ -8,52 +8,74 @@
>   #              will be sent to syslog.
>   #
>   
> -NAME=auditd
> -DAEMON=/usr/sbin/${NAME}
> -CONFIG=/etc/audit/auditd.conf
> -PIDFILE=/var/run/${NAME}.pid
> +DAEMON="auditd"
> +PIDFILE="/var/run/${DAEMON}.pid"
>   
>   start(){
> -	printf "Starting ${NAME}: "
> +	printf "Starting %s: " "${DAEMON}"
>   
>   	# Create dir to store log files in if one doesn't exist. Create
>   	# the directory with SELinux permissions if possible
> -	command -v selabel_lookup >/dev/null 2>&1
> -	if [ $? = 0 ]; then
> -		mkdir -p /var/log/audit -Z `selabel_lookup -b file -k /var/log/audit | cut -d ' ' -f 3`
> +	if command -v selabel_lookup >/dev/null 2>&1; then
> +		audit_log_selable="$(selabel_lookup -b file -k /var/log/audit | cut -d ' ' -f 3)"
> +		mkdir -p /var/log/audit -Z "${audit_log_selable}"
>   	else
>   		mkdir -p /var/log/audit
>   	fi
>   
> -	# Run audit daemon executable
> -	start-stop-daemon -S -q -p ${PIDFILE} --exec ${DAEMON}
> -
> -	if [ $? = 0 ]; then
> +	start-stop-daemon --start --background --make-pidfile \
> +		--pidfile "${PIDFILE}" --exec "/usr/sbin/${DAEMON}"
> +	status=$?
> +	if [ "${status}" -eq 0 ]; then
>   		# Load the default rules
>   		test -f /etc/audit/rules.d/audit.rules && /usr/sbin/auditctl -R /etc/audit/rules.d/audit.rules >/dev/null
>   		echo "OK"
>   	else
>   		echo "FAIL"
>   	fi
> +	return "${status}"
>   }
>   
>   stop(){
> -	printf "Stopping ${NAME}: "
> -
> -	start-stop-daemon -K -q -p ${PIDFILE}
> -	[ $? = 0 ] && echo "OK" || echo "FAIL"
> +	printf "Stopping %s: " "${DAEMON}"
> +	start-stop-daemon --stop --pidfile "${PIDFILE}" --exec "/usr/sbin/${DAEMON}"
> +	status=$?
> +	if [ "${status}" -eq 0 ]; then
> +		echo "OK"
> +	else
> +		echo "FAIL"
> +		return "${status}"
> +	fi
> +	while start-stop-daemon --stop --test --quiet --pidfile "${PIDFILE}" \
> +		--exec "/sbin/${DAEMON}"; do
> +		sleep 0.1
> +	done
> +	rm -f "${PIDFILE}"
> +	return "${status}"
>   }
>   
>   reload(){
> -	printf "Reloading ${NAME} configuration: "
> -	start-stop-daemon --stop -s 1 -p ${PIDFILE} 1>/dev/null
> -	[ $? = 0 ] && echo "OK" || echo "FAIL"
> +	printf "Reloading %s configuration: " "${DAEMON}"
> +	start-stop-daemon --stop --signal HUP --pidfile "${PIDFILE}" 1>/dev/null
> +	status=$?
> +	if [ "${status}" -eq 0 ]; then
> +		echo "OK"
> +	else
> +		echo "FAIL"
> +	fi
> +	return "${status}"
>   }
>   
>   rotate(){
> -	printf "Rotating ${NAME} logs: "
> -	start-stop-daemon --stop -s 10 -p ${PIDFILE} 1>/dev/null
> -	[ $? = 0 ] && echo "OK" || echo "FAIL"
> +	printf "Rotating %s logs: " "${DAEMON}"
> +	start-stop-daemon --stop --signal SIGUSR1 --pidfile "${PIDFILE}" 1>/dev/null
> +	status=$?
> +	if [ "${status}" -eq 0 ]; then
> +		echo "OK"
> +	else
> +		echo "FAIL"
> +	fi
> +	return "${status}"
>   }
>   
>   case "$1" in

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
