From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 29 May 2019 23:18:04 +0200
Subject: [Buildroot] [PATCH] package/gpsd: update systemd service file
 binary path
In-Reply-To: <1559086884-14807-1-git-send-email-hancock@sedsystems.ca>
References: <1559086884-14807-1-git-send-email-hancock@sedsystems.ca>
Message-ID: <6990e02f-7317-2109-1489-d8056a299a07@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Robert,

On 29/05/2019 01:41, Robert Hancock wrote:
> The systemd gpsd.service file supplied by gpsd specifies a binary path
> of /usr/local/sbin/gpsd, while Buildroot installs the binary in
> /usr/sbin/gpsd. Update the path to match the actual binary location.

 Note that this is not sufficient for proper systemd support. Indeed, we don't
pass any configuration option, so gpsd will check if /lib/systemd/system exists
to decide if systemd support should be enabled or not. So in addition, gpsd.mk
should be fixed to set the 'systemd' option depending on BR2_INIT_SYSTEMD.

> 
> Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
> ---
>  ...3-update-systemd-service-file-binary-path.patch | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/gpsd/0003-update-systemd-service-file-binary-path.patch
> 
> diff --git a/package/gpsd/0003-update-systemd-service-file-binary-path.patch b/package/gpsd/0003-update-systemd-service-file-binary-path.patch
> new file mode 100644
> index 0000000..32feb18
> --- /dev/null
> +++ b/package/gpsd/0003-update-systemd-service-file-binary-path.patch
> @@ -0,0 +1,30 @@
> +From c4c314f23bc6fec8d3ddadb49090eb3a2e84881d Mon Sep 17 00:00:00 2001
> +From: Robert Hancock <hancock@sedsystems.ca>
> +Date: Tue, 28 May 2019 17:13:25 -0600
> +Subject: [PATCH] Update systemd service file binary path
> +
> +The systemd gpsd.service file supplied by gpsd specifies a binary path
> +of /usr/local/sbin/gpsd, while Buildroot installs the binary in
> +/usr/sbin/gpsd. Update the path to match the actual binary location.
> +
> +Signed-off-by: Robert Hancock <hancock@sedsystems.ca>

 In general we prefer upstreamable patches, otherwise we have to maintain them
indefinitely. This patch is not upstreamable, because  /usr/sbin is just as
arbitrary as /usr/local/sbin.

 A proper upstreamable patch would add a substituter in SConstruct and replace
@sbindir at . See for instance how it's done for gpsd.rules.in.

 If that is too much of a challenge, I would prefer to not patch the source, but
instead do a sed on the installed file. This can be done in
GPSD_INSTALL_INIT_SYSTEMD. Normally, that variable copies the systemd support
files, but it can also be used to modify them.

 And finally: the gpsdctl at .service file has the same issue.

 So, I've marked your patch as Changes Request in patchwork.

 Regards,
 Arnout

> +---
> + systemd/gpsd.service | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/systemd/gpsd.service b/systemd/gpsd.service
> +index c1f193c..2707ff9 100644
> +--- a/systemd/gpsd.service
> ++++ b/systemd/gpsd.service
> +@@ -8,7 +8,7 @@ After=chronyd.service
> + Type=forking
> + EnvironmentFile=-/etc/default/gpsd
> + EnvironmentFile=-/etc/sysconfig/gpsd
> +-ExecStart=/usr/local/sbin/gpsd $GPSD_OPTIONS $OPTIONS $DEVICES
> ++ExecStart=/usr/sbin/gpsd $GPSD_OPTIONS $OPTIONS $DEVICES
> + 
> + [Install]
> + WantedBy=multi-user.target
> +-- 
> +1.8.3.1
> +
> 
