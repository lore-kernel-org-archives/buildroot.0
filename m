From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 11 Apr 2019 13:47:53 +0300
Subject: [Buildroot] [PATCH 1/2] package/hostapd: add upstream 2019-1, 2,
 3 security patches
In-Reply-To: <20190411104215.8317-1-peter@korsgaard.com>
References: <20190411104215.8317-1-peter@korsgaard.com>
Message-ID: <20190411104753.v363hzqtxdo6cgxn@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Thu, Apr 11, 2019 at 12:42:13PM +0200, Peter Korsgaard wrote:
> Fixes the following security vulnerabilities:
> 
> - CVE-2019-9494 (cache attack against SAE)
> 
> For details, see the advisory:
> https://w1.fi/security/2019-1/sae-side-channel-attacks.txt
> 
> - CVE-2019-9495 (cache attack against EAP-pwd)
> 
> For details, see the advisory:
> https://w1.fi/security/2019-2/eap-pwd-side-channel-attack.txt
> 
> - CVE-2019-9496 (SAE confirm missing state validation in hostapd/AP)
> 
> For details, see the advisory:
> https://w1.fi/security/2019-3/sae-confirm-missing-state-validation.txt
> 
> Notice that SAE is not currently enabled in Buildroot, but the patches are
> included here anyway for completeness.

What about CVE-2019-949{7,8,9}?

https://w1.fi/security/2019-4/eap-pwd-missing-commit-validation.txt

baruch

> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/hostapd/hostapd.hash | 10 ++++++++++
>  package/hostapd/hostapd.mk   | 11 +++++++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/package/hostapd/hostapd.hash b/package/hostapd/hostapd.hash
> index 833c7aca02..1cb330c667 100644
> --- a/package/hostapd/hostapd.hash
> +++ b/package/hostapd/hostapd.hash
> @@ -1,4 +1,14 @@
>  # Locally calculated
>  sha256  21b0dda3cc3abe75849437f6b9746da461f88f0ea49dd621216936f87440a141  hostapd-2.7.tar.gz
> +sha256  86979655f1c5a9578acbf83e8acdf69a36dcc0966a8819f3b6918530ad3e0c67  0001-OpenSSL-Use-constant-time-operations-for-private-big.patch
> +sha256  5663da175ecc344c90bea8c95ab831ad47a8002ccbb834f6c091705b92e90e71  0002-Add-helper-functions-for-constant-time-operations.patch
> +sha256  e5a6bc9f587351d4495740239ceb0a64958a59b3e875722dcaeb4c93fa517f64  0003-OpenSSL-Use-constant-time-selection-for-crypto_bignu.patch
> +sha256  aa5b722bebbaf175ff89a3653c3d048afe0d0f866989fca6b4c8e882a864392a  0004-EAP-pwd-Use-constant-time-and-memory-access-for-find.patch
> +sha256  bad9eeaeb118f88303a7a718820b3ba03d705e99b6183b3c44556bedf99db423  0005-SAE-Minimize-timing-differences-in-PWE-derivation.patch
> +sha256  ae7be450f652f6f77ad868856ab61ba6cb6d7e768585cf5f9f9f674a66e05b40  0006-SAE-Avoid-branches-in-is_quadratic_residue_blind.patch
> +sha256  86b731c787ca58ac001d20fb769b136e2ca76bf81a8465a8e72c50573cfc4b09  0007-SAE-Mask-timing-of-MODP-groups-22-23-24.patch
> +sha256  ff7305005217a34818dae247886b9fb1b1db781ab31fb5eac9ebdd9cb0d1edfe  0008-SAE-Use-const_time-selection-for-PWE-in-FFC.patch
> +sha256  707057cc0e60fe763350f82135dbe407bc289a4958879c8ff1e9413243a1caa4  0009-SAE-Use-constant-time-operations-in-sae_test_pwd_see.patch
> +sha256  82d8ae4fabfe3674bcb5412befe3a74e40d6485906589c219be72e4fd1e70baa  0010-SAE-Fix-confirm-message-validation-in-error-cases.patch
>  sha256  e204da659d0583c71af23cb9b55536fe99598ee26a44104344f456e4d17350c6  rtlxdrv.patch
>  sha256  76eeecd8fc291a71f29189ea20e6a34387b8048a959cbc6a65c41b98194643a2  README
> diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
> index 0b3fa0646f..3ad4a04f2a 100644
> --- a/package/hostapd/hostapd.mk
> +++ b/package/hostapd/hostapd.mk
> @@ -6,6 +6,17 @@
>  
>  HOSTAPD_VERSION = 2.7
>  HOSTAPD_SITE = http://w1.fi/releases
> +HOSTAPD_PATCH = \
> +	https://w1.fi/security/2019-1/0001-OpenSSL-Use-constant-time-operations-for-private-big.patch \
> +	https://w1.fi/security/2019-1/0002-Add-helper-functions-for-constant-time-operations.patch \
> +	https://w1.fi/security/2019-1/0003-OpenSSL-Use-constant-time-selection-for-crypto_bignu.patch \
> +	https://w1.fi/security/2019-2/0004-EAP-pwd-Use-constant-time-and-memory-access-for-find.patch \
> +	https://w1.fi/security/2019-1/0005-SAE-Minimize-timing-differences-in-PWE-derivation.patch \
> +	https://w1.fi/security/2019-1/0006-SAE-Avoid-branches-in-is_quadratic_residue_blind.patch \
> +	https://w1.fi/security/2019-1/0007-SAE-Mask-timing-of-MODP-groups-22-23-24.patch \
> +	https://w1.fi/security/2019-1/0008-SAE-Use-const_time-selection-for-PWE-in-FFC.patch \
> +	https://w1.fi/security/2019-1/0009-SAE-Use-constant-time-operations-in-sae_test_pwd_see.patch \
> +	https://w1.fi/security/2019-3/0010-SAE-Fix-confirm-message-validation-in-error-cases.patch
>  HOSTAPD_SUBDIR = hostapd
>  HOSTAPD_CONFIG = $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/.config
>  HOSTAPD_DEPENDENCIES = host-pkgconf

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
