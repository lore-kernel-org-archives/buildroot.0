From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Apr 2020 10:50:43 +0200
Subject: [Buildroot] [git commit] package/wireguard-linux-compat: depend
 on headers < 5.6
In-Reply-To: <20200424122241.994F08FEC1@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Fri, 24 Apr 2020 14:37:03 +0200")
References: <20200424122241.994F08FEC1@busybox.osuosl.org>
Message-ID: <87mu70t0d8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=da5afc10a45d1e1b5ab7ab6f9230ed7ba44581e7
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Since wireguard is built into kernels 5.6 and later we can't build
 > wireguard-linux-compat on them, so we need to depend on
 > !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6.

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 >  package/wireguard-linux-compat/Config.in | 6 +++++-
 >  1 file changed, 5 insertions(+), 1 deletion(-)

 > diff --git a/package/wireguard-linux-compat/Config.in b/package/wireguard-linux-compat/Config.in
 > index 4ee214be63..6e41a0951b 100644
 > --- a/package/wireguard-linux-compat/Config.in
 > +++ b/package/wireguard-linux-compat/Config.in
 > @@ -3,6 +3,8 @@ config BR2_PACKAGE_WIREGUARD_LINUX_COMPAT
 >  	depends on BR2_LINUX_KERNEL
 >  	# kernel module requires 3.10+
 >  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
 > +	# kernel module incompatible with 5.6+
 > +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6

Maybe a better wording would be ".. in upstream linux since 5.6" rather
than incompatible so it is clearer what to do if you use 5.6+.

 >  	help
 >  	  WireGuard is an extremely simple yet fast and modern VPN
 >  	  that utilizes state-of-the-art cryptography. It aims to be
 > @@ -20,4 +22,6 @@ config BR2_PACKAGE_WIREGUARD_LINUX_COMPAT
 >  	  https://www.wireguard.com
 
 >  comment "wireguard-linux-compat needs a toolchain w/ headers >= 3.10"
 > -	depends on BR2_LINUX_KERNEL && !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
 > +	depends on BR2_LINUX_KERNEL
 > +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6
 > +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10

If the headers are < than 3.10, then they are also < 5.6, so this is
redundant.

-- 
Bye, Peter Korsgaard
