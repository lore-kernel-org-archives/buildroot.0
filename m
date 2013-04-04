From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 04 Apr 2013 22:51:53 +0200
Subject: [Buildroot] [PATCH] openvpn: adjust iproute2 logic
In-Reply-To: <1365094499-21046-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 4 Apr 2013 13:54:59 -0300")
References: <1365094499-21046-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <878v4y3tp2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> As reported in bug #6164 when using busybox iproute2 openvpn can fail to
 Gustavo> locate the 'ip' utility.
 Gustavo> This was correct until busybox 1.21.0 was released since it changed the
 Gustavo> location of /bin/ip to /sbin/ip (what iproute2 proper does).
 Gustavo> So adjust the ip path accordingly.

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/openvpn/openvpn.mk | 10 +++++++---
 Gustavo>  1 file changed, 7 insertions(+), 3 deletions(-)

 Gustavo> diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
 Gustavo> index c911465..28f7238 100644
 Gustavo> --- a/package/openvpn/openvpn.mk
 Gustavo> +++ b/package/openvpn/openvpn.mk
 Gustavo> @@ -17,10 +17,14 @@ OPENVPN_CONF_OPT += --enable-small --disable-plugins \
 Gustavo>  	--disable-debug --disable-eurephia
 Gustavo>  endif
 
 Gustavo> -ifeq ($(BR2_PACKAGE_IPROUTE2),y)
 Gustavo> -OPENVPN_CONF_ENV += IPROUTE=/sbin/ip
 Gustavo> -else
 Gustavo> +# Busybox 1.21+ places the ip applet in the "correct" place
 Gustavo> +# but previous versions didn't.
 Gustavo> +ifneq ($(BR2_PACKAGE_IPROUTE2),y)
 Gustavo> +ifneq ($(BR2_PACKAGE_BUSYBOX_VERSION_1_21_X),y)

We'll most likely forget to update this next time we bump the busybox
version, and not notice it as it's a runtime issue.

Could you invert the logic so you explicitly check for the old busybox
versions instead?

-- 
Bye, Peter Korsgaard
