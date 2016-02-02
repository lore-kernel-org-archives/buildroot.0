From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 02 Feb 2016 21:18:49 -0200
Subject: [Buildroot] [PATCH v6 1/1] package/dhcp: bump version to
	4.3.3-P1
References: <1453736110-11878-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <56b13959cc789_bb93ffc40199db8503a@ultri2.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Doug,

On Mon, Jan 25, 2016 at 01:35 PM, Doug Kehn <rdkehn@yahoo.com> wrote:
> bind source tar-ball is now embedded into the dhcp source. The embedded
> bind tar-ball is extracted after the dhcp source so cross compiling
> patches can be applied to the dhcp and bind before the package is built.
> 
> The embedded bind configure is called as part of dhcp make instead of
> dhcp configure; therefore, needed configure parameters are set in the
> make env.
> 
> 0001-dhcp-cross-compile.patch and 0002-bind-cross-compile.patch have
> been submitted upstream as part of a cross compiling enhancement
> suggestion to dhcp-suggest at isc.org. Reference ISC-Bugs #41502.
> 0003-bind-hos-cc.patch is already scheduled for the next dhcp release.
> 
> Buildroot thread
> 	http://lists.busybox.net/pipermail/buildroot/2016-January/149079.html
> has related information.
> 
> Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> Changes v5 -> v6
>   - patch configure.ac instead of configure/Makefile.in (suggested by Arnout)
>   - rework dhcp.mk for patch changes.

The patches are much cleaner now!

[snip]
> --- a/package/dhcp/dhcp.hash
> +++ b/package/dhcp/dhcp.hash
> @@ -1,2 +1,2 @@
> -# Verified from ftp://ftp.isc.org/isc/dhcp/4.1-ESV-R12/dhcp-4.1-ESV-R12.tar.gz.sha256.asc
> -sha256	53265d1bf5e2073379df03c73a1a34d38a904307609c0f9cb77223912e753e5f	dhcp-4.1-ESV-R12.tar.gz
> +# Verified from https://ftp.isc.org/isc/dhcp/4.2.3-P1/dhcp-4.2.3-P1.tar.gz.sha256.asc

There are typos here (s/4.2.3-P1/4.3.3-P1/g).
It should be:
# Verified from https://ftp.isc.org/isc/dhcp/4.3.3-P1/dhcp-4.3.3-P1.tar.gz.sha256.asc

See:
$ wget -q https://ftp.isc.org/isc/dhcp/4.3.3-P1/dhcp-4.3.3-P1.tar.gz.sha256.asc
$ gpg --verify dhcp-4.3.3-P1.tar.gz.sha256.asc dhcp-4.3.3-P1.tar.gz
gpg: Signature made Sex 18 Dez 2015 10:51:04 BRST using RSA key ID 911A4C02
gpg: Good signature from "Internet Systems Consortium, Inc. (Signing key, 2015-2016) <codesign@isc.org>"
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: ADBE 9446 286C 7949 05F1  E075 6FA6 EBC9 911A 4C02
$ sha256sum dhcp-4.3.3-P1.tar.gz
c11e896dffa1bfbc49462965d3f6dec45534e34068603546d9a236f2aa669921  dhcp-4.3.3-P1.tar.gz

> +sha256 c11e896dffa1bfbc49462965d3f6dec45534e34068603546d9a236f2aa669921 dhcp-4.3.3-P1.tar.gz
[snip]

Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Build test for arm using both external and buildroot toolchains, with
all package flags enabled (client, server, relay).
Basic run test (calling 'dhclient -v' gets an IPv4 address) using a
qemu-system-arm target.

With the typos fixed:
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Regards,
Ricardo
