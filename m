From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 11 Apr 2019 13:11:03 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/wpa_supplicant: add upstream
 2019-1, 2, 3, 4 security patches
In-Reply-To: <20190411111103.19705-1-peter@korsgaard.com>
References: <20190411111103.19705-1-peter@korsgaard.com>
Message-ID: <20190411111103.19705-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security vulnerabilities:

- CVE-2019-9494 (cache attack against SAE)

For details, see the advisory:
https://w1.fi/security/2019-1/sae-side-channel-attacks.txt

- CVE-2019-9495 (cache attack against EAP-pwd)

For details, see the advisory:
https://w1.fi/security/2019-2/eap-pwd-side-channel-attack.txt

- CVE-2019-9496 (SAE confirm missing state validation in hostapd/AP)

For details, see the advisory:
https://w1.fi/security/2019-3/sae-confirm-missing-state-validation.txt

- CVE-2019-9497 (EAP-pwd server not checking for reflection attack)
- CVE-2019-9498 (EAP-pwd server missing commit validation for scalar/element)
- CVE-2019-9499 (EAP-pwd peer missing commit validation for scalar/element)

For details, see the advisory:
https://w1.fi/security/2019-4/eap-pwd-missing-commit-validation.txt

Notice that SAE is not currently enabled in Buildroot, but the patches are
included here anyway for completeness.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpa_supplicant/wpa_supplicant.hash | 14 ++++++++++++++
 package/wpa_supplicant/wpa_supplicant.mk   | 15 +++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/package/wpa_supplicant/wpa_supplicant.hash b/package/wpa_supplicant/wpa_supplicant.hash
index 5b5d5fcab2..2e6cd6f226 100644
--- a/package/wpa_supplicant/wpa_supplicant.hash
+++ b/package/wpa_supplicant/wpa_supplicant.hash
@@ -1,3 +1,17 @@
 # Locally calculated
 sha256  76ea6b06b7a2ea8e6d9eb1a9166166f1656e6d48c7508914f592100c95c73074  wpa_supplicant-2.7.tar.gz
+sha256  86979655f1c5a9578acbf83e8acdf69a36dcc0966a8819f3b6918530ad3e0c67  0001-OpenSSL-Use-constant-time-operations-for-private-big.patch
+sha256  5663da175ecc344c90bea8c95ab831ad47a8002ccbb834f6c091705b92e90e71  0002-Add-helper-functions-for-constant-time-operations.patch
+sha256  e5a6bc9f587351d4495740239ceb0a64958a59b3e875722dcaeb4c93fa517f64  0003-OpenSSL-Use-constant-time-selection-for-crypto_bignu.patch
+sha256  aa5b722bebbaf175ff89a3653c3d048afe0d0f866989fca6b4c8e882a864392a  0004-EAP-pwd-Use-constant-time-and-memory-access-for-find.patch
+sha256  bad9eeaeb118f88303a7a718820b3ba03d705e99b6183b3c44556bedf99db423  0005-SAE-Minimize-timing-differences-in-PWE-derivation.patch
+sha256  ae7be450f652f6f77ad868856ab61ba6cb6d7e768585cf5f9f9f674a66e05b40  0006-SAE-Avoid-branches-in-is_quadratic_residue_blind.patch
+sha256  86b731c787ca58ac001d20fb769b136e2ca76bf81a8465a8e72c50573cfc4b09  0007-SAE-Mask-timing-of-MODP-groups-22-23-24.patch
+sha256  ff7305005217a34818dae247886b9fb1b1db781ab31fb5eac9ebdd9cb0d1edfe  0008-SAE-Use-const_time-selection-for-PWE-in-FFC.patch
+sha256  707057cc0e60fe763350f82135dbe407bc289a4958879c8ff1e9413243a1caa4  0009-SAE-Use-constant-time-operations-in-sae_test_pwd_see.patch
+sha256  82d8ae4fabfe3674bcb5412befe3a74e40d6485906589c219be72e4fd1e70baa  0010-SAE-Fix-confirm-message-validation-in-error-cases.patch
+sha256  ff8d6d92ad4b01987be63cdaf67a24d2eba5b3cd654f37664a8a198e501c0e3b  0011-EAP-pwd-server-Verify-received-scalar-and-element.patch
+sha256  d5ebf4e5a810e9a0c035f9268195c542273998ea70fd58697ee25965094062cc  0012-EAP-pwd-server-Detect-reflection-attacks.patch
+sha256  7156656498f03b24a0b69a26a59d17a9fcc8e76761f1dabe6d13b4176ffd2ef8  0013-EAP-pwd-client-Verify-received-scalar-and-element.patch
+sha256  69926854ec2a79dada290f79f04202764c5d6400d232e3a567ebe633a02c1c66  0014-EAP-pwd-Check-element-x-y-coordinates-explicitly.patch
 sha256  76eeecd8fc291a71f29189ea20e6a34387b8048a959cbc6a65c41b98194643a2  README
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index f56637f42e..a60f097801 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -6,6 +6,21 @@
 
 WPA_SUPPLICANT_VERSION = 2.7
 WPA_SUPPLICANT_SITE = http://w1.fi/releases
+WPA_SUPPLICANT_PATCH = \
+	https://w1.fi/security/2019-1/0001-OpenSSL-Use-constant-time-operations-for-private-big.patch \
+	https://w1.fi/security/2019-1/0002-Add-helper-functions-for-constant-time-operations.patch \
+	https://w1.fi/security/2019-1/0003-OpenSSL-Use-constant-time-selection-for-crypto_bignu.patch \
+	https://w1.fi/security/2019-2/0004-EAP-pwd-Use-constant-time-and-memory-access-for-find.patch \
+	https://w1.fi/security/2019-1/0005-SAE-Minimize-timing-differences-in-PWE-derivation.patch \
+	https://w1.fi/security/2019-1/0006-SAE-Avoid-branches-in-is_quadratic_residue_blind.patch \
+	https://w1.fi/security/2019-1/0007-SAE-Mask-timing-of-MODP-groups-22-23-24.patch \
+	https://w1.fi/security/2019-1/0008-SAE-Use-const_time-selection-for-PWE-in-FFC.patch \
+	https://w1.fi/security/2019-1/0009-SAE-Use-constant-time-operations-in-sae_test_pwd_see.patch \
+	https://w1.fi/security/2019-3/0010-SAE-Fix-confirm-message-validation-in-error-cases.patch \
+	https://w1.fi/security/2019-4/0011-EAP-pwd-server-Verify-received-scalar-and-element.patch \
+	https://w1.fi/security/2019-4/0012-EAP-pwd-server-Detect-reflection-attacks.patch \
+	https://w1.fi/security/2019-4/0013-EAP-pwd-client-Verify-received-scalar-and-element.patch \
+	https://w1.fi/security/2019-4/0014-EAP-pwd-Check-element-x-y-coordinates-explicitly.patch
 WPA_SUPPLICANT_LICENSE = BSD-3-Clause
 WPA_SUPPLICANT_LICENSE_FILES = README
 WPA_SUPPLICANT_CONFIG = $(WPA_SUPPLICANT_DIR)/wpa_supplicant/.config
-- 
2.11.0
