From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 22 Jun 2016 23:58:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/quagga: Add systemd.service
 file and helper script
In-Reply-To: <1466269320-23938-1-git-send-email-nroach44@gmail.com>
References: <1466269320-23938-1-git-send-email-nroach44@gmail.com>
Message-ID: <61af7059-9ada-1f88-e03b-a6586d499d18@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Two more things...

On 18-06-16 19:02, Nathaniel Roach wrote:
> +	$(INSTALL) -D -m 644 package/quagga/quagga at .service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/bandwidthd.service

 I believe it should actually be installed as quagga at .service, and then
symlinked from /etc.

 I'm not so sure of this, but wouldn't it actually make sense to install all
services that are selected in the config? Like

QUAGGA_SERVICES_$(BR2_PACKAGE_QUAGGA_ZEBRA) += zebra
QUAGGA_SERVICES_$(BR2_PACKAGE_QUAGGA_BGPD) += bgpd
...

	$(foreach service,$(QUAGGA_SERVICES_y),\
		ln -sf ../../../../usr/lib/systemd/system/quagga at .service \
		
$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/$(service).service$(sep))

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
