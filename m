From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Jan 2021 10:51:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/ssdp-responder: new package
In-Reply-To: <20210123231559.3036505-1-troglobit@gmail.com>
References: <20210123231559.3036505-1-troglobit@gmail.com>
Message-ID: <20210124095108.GL926565@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joachim, All,

On 2021-01-24 00:15 +0100, Joachim Wiberg spake thusly:
> Small (35k), and stand-alone, SSDP responder with built-in web server
> (on port 1901) for serving description.xml when Windows scans for any
> network devices on the LAN.  Also includes ssdp-scan (31k), similar to
> the mdns-scan tool, to probe for SSDP capable devices.

This package uses pkg-config, so it should have:

    SSDP_RESPONDER_DEPENDENCIES = host-pkgconf

It also has an optional dependency on systemd, so maybe it needs:

    ifeq ($(BR2_PACKAGE_SYSTEMD),y)
    SSDP_RESPONDER_DEPENDENCIES += systemd
    SSDP_RESPONDER_CONF_OPTS += --with-systemd
    else
    SSDP_RESPONDER_CONF_OPTS += --without-systemd
    endif

And since it comes with its systemd service unit, it would be nice to
install it with SSDP_RESPONDER_INSTALL_INIT_SYSTEMD.

[--SNIP--]
> diff --git a/package/ssdp-responder/Config.in b/package/ssdp-responder/Config.in
> new file mode 100644
> index 0000000000..d6d374256e
> --- /dev/null
> +++ b/package/ssdp-responder/Config.in
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_SSDP_RESPONDER
> +        bool "ssdp-responder"
> +        depends on BR2_USE_MMU # fork()
> +        help
> +          Simple Service Discovery Protocol daemon (SSDP) for networked
> +          Linux and UNIX devices. Useful in any setup, big or small, but
> +          targeted more at embedded systems that need to announce
> +          themselves to Windows systems.

    $ make check-package
    package/ssdp-responder/Config.in:2: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
    package/ssdp-responder/Config.in:3: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
    package/ssdp-responder/Config.in:4: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
    package/ssdp-responder/Config.in:5: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
    package/ssdp-responder/Config.in:6: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
    package/ssdp-responder/Config.in:7: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
    package/ssdp-responder/Config.in:8: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

Care to fixup and respin, please?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
