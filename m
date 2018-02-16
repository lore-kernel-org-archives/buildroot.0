From: Markus Mayer <mmayer@broadcom.com>
Date: Thu, 15 Feb 2018 16:56:07 -0800
Subject: [Buildroot] [RFC 1/6] support/scripts/check-bin-arch: improve
 architecture check
In-Reply-To: <20180216005612.69593-1-mmayer@broadcom.com>
References: <20180216005612.69593-1-mmayer@broadcom.com>
Message-ID: <20180216005612.69593-2-mmayer@broadcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 64-bit targets, allow 32-bit binaries of the same architecture
(MIPS64 -> MIPS32, AArch64 -> ARM, etc.)

In order for 32-bit binaries to run on the target, the corresponding
32-bit libraries need to be present in the target's root file system
and the kernel needs to support execution of 32-bit binaries.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 support/scripts/check-bin-arch | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/support/scripts/check-bin-arch b/support/scripts/check-bin-arch
index 887b6613cdb8..31711769eabd 100755
--- a/support/scripts/check-bin-arch
+++ b/support/scripts/check-bin-arch
@@ -58,6 +58,21 @@ while read f; do
 		continue
 	fi
 
+	# Didn't find a straight match. See if we are on a 64-bit architecture
+	# and our binary is a 32-bit binary of the same architecture.
+	if [[ "${arch_name}" =~ 64$ ]]; then
+		if [[ ${arch_name} = "AArch64" ]]; then
+			arch32='ARM'
+		else
+			arch32=${arch_name/64/32}
+		fi
+
+		if [ "${arch}" = "${arch32}" ]; then
+			echo "Accepting ${arch32} binary on ${arch_name} ($f)"
+			continue
+		fi
+	fi
+
 	printf 'ERROR: architecture for "%s" is "%s", should be "%s"\n' \
 	       "${f}" "${arch}" "${arch_name}"
 
-- 
2.7.4
