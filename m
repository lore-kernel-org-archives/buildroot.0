From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 13 Dec 2015 21:59:12 +0100
Subject: [Buildroot] [PATCH 1/2] package/wireshark: Fix libpcap detection
In-Reply-To: <1449998185-15082-1-git-send-email-bernd.kuhls@t-online.de>
References: <1449998185-15082-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <566DDC20.5000104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13-12-15 10:16, Bernd Kuhls wrote:
> To reproduce the build error I had to install libpcap0.8-dev on my host
> system, then wireshark configure picks up
> 
> checking for pcap-config... /usr/bin/pcap-config

 To fundamentally avoid this type of issue (we have a bunch of fixes like this),
I think we should add an additional directory that is put in the _beginning_ of
the path in TARGET_MAKE_ENV. This directory could then be populated through the
_CONFIG_SCRIPTS mechanism.

 What do the others think?

 It will be a bit of work to revert all these fixes again :-)

 Regards,
 Arnout

> 
> and fails.
> 
> Fixes
> http://autobuild.buildroot.net/results/7e3/7e363d18866057df0db3d0d95fa8d9116728f6ce//
> and many others
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/wireshark/wireshark.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
> index 534131b..2b06699 100644
> --- a/package/wireshark/wireshark.mk
> +++ b/package/wireshark/wireshark.mk
> @@ -24,6 +24,7 @@ WIRESHARK_CONF_OPTS = \
>  	--enable-static=no \
>  	--with-libsmi=no \
>  	--with-lua=no \
> +	--with-pcap=$(STAGING_DIR)/usr \
>  	--includedir=$(STAGING_DIR)/usr/include
>  
>  # wireshark GUI options
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
