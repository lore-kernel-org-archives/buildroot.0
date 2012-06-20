From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 21 Jun 2012 01:38:47 +0200
Subject: [Buildroot] [PATCH RFC 1/2] Add configuration item for custom
 JavaScript install path
In-Reply-To: <1340088964-10630-2-git-send-email-spdawson@gmail.com>
References: <1340088964-10630-1-git-send-email-spdawson@gmail.com>
 <1340088964-10630-2-git-send-email-spdawson@gmail.com>
Message-ID: <4FE25F07.6020103@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/19/12 08:56, spdawson at gmail.com wrote:
> From: Simon Dawson<spdawson@gmail.com>
>
> Signed-off-by: Simon Dawson<spdawson@gmail.com>
> ---
>   package/Config.in            |    1 +
>   package/javascript/Config.in |    5 +++++
>   2 files changed, 6 insertions(+)
>   create mode 100644 package/javascript/Config.in
>
> diff --git a/package/Config.in b/package/Config.in
> index 1044e9f..b60ba2b 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -378,6 +378,7 @@ source "package/libv4l/Config.in"
>   endmenu
>
>   menu "Javascript"
> +source "package/javascript/Config.in"
>   source "package/explorercanvas/Config.in"
>   source "package/flot/Config.in"
>   source "package/jquery/Config.in"
> diff --git a/package/javascript/Config.in b/package/javascript/Config.in
> new file mode 100644
> index 0000000..c837e9e
> --- /dev/null
> +++ b/package/javascript/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_JAVASCRIPT_INSTALL_PATH
> +	string "Target install path for JavaScript"
> +	default "/var/www"
> +	help
> +	  Specify a target install path for JavaScript files

  I would instead define a WWW_INSTALL_PATH, which can also be used to set the
wwwroot of the various http servers.  We could still have a javascript path
to point to a subdirectory of the wwwroot, but I don't think there's much point.

  Question is where this config option should go then.  We could put it next to
the webservers, but it is possible that you use some javascript libraries without
webserver (e.g. because it's custom-written in another application).  We could
also put it in target/generic/Config.in, but there's currently nothing similar
there...

  BTW personally, I'm in favour of defaulting to /www for this path instead of
/var/www.  However, the Linux Foundation's draft Filesystem Hierarchy Standard [1]
puts it at /srv/www.  Sounds even better to me, but it's a big change from our
current layout.


  Regards,
  Arnout

[1] http://bzr.linuxfoundation.org/loggerhead/lsb/devel/fhs-spec/annotate/head:/root-filesystem.xml#L1700

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
