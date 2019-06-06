From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 17:26:41 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/mender: update
 readme.txt
Message-ID: <20190606154047.E7731800B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=601d2b356d96904418a1c2302a013d8cbebd8475
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Provide additional details on how Mender works within Buildroot.

Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
[Thomas: remove duplicate "Default configuration files" title, rewrap
text]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

(cherry picked from commit a10d911788717a226762013951aa0d76b9ac5164)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mender/readme.txt | 154 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 145 insertions(+), 9 deletions(-)

diff --git a/package/mender/readme.txt b/package/mender/readme.txt
index 329b2a42f2..c884524a1b 100644
--- a/package/mender/readme.txt
+++ b/package/mender/readme.txt
@@ -1,18 +1,154 @@
 === Notes on using Mender on Buildroot
 ======================================
+
+Mender is an open source over-the-air (OTA) software updater for
+embedded Linux devices. Mender comprises a client running at the
+embedded device, as well as a server that manages deployments across
+many devices. There is also various tooling around the Mender project,
+such as 'mender-artifact' which is used to create Mender Artifacts
+that are compatible with the Mender client and server.
+
+Mender aims to address this challenge with a robust and easy to use
+updater for embedded Linux devices, which is open source and available
+to anyone.
+
+Robustness is ensured with atomic image-based deployments using a dual
+A/B rootfs partition layout. This makes it always possible to roll
+back to a working state, even when losing power at any time during the
+update process.
+
+The official documentation is a good resource to get an in depth
+understanding of how Mender works:
+
+    https://docs.mender.io
+
+In Buildroot the following packages are provided:
+
+- BR2_PACKAGE_MENDER
+    - This will install the client on target rootfs
+- BR2_PACKAGE_HOST_MENDER_ARTIFACT
+    - This will install the 'mender-artifact' tool in host rootfs.
+
+To fully utilize atomic image-based deployments using the A/B update
+strategy, additional integration is required in the bootloader. This
+integration is board specific.
+
+Currently supported bootloaders are GRUB and U-boot, and for reference
+integrations please visit:
+
+    https://github.com/mendersoftware/buildroot-mender
+
 Default configurations files
 ----------------------------
 
-Buildroot comes with a default artifact_info and device_type configuration files
-in /etc/mender. They contain default values, and thus they should be overridden
-on a production system.
+Buildroot comes with a default configuration and there a couple of
+files that need your attention:
+
+- /etc/mender/mender.conf
+    - main configuration file for the Mender client
+    - https://docs.mender.io/client-configuration/configuration-file/configuration-options
+
+- /etc/mender/artifact_info
+    - The name of the image or update that will be built. This is what the
+      device will report that it is running, and different updates must have
+      different names
+
+- /var/lib/mender/device_type
+    - A string that defines the type of device
+
+Mender server configuration
+---------------------------
+
+The Mender server can be setup in different ways, and how you
+configure the Mender client differs slightly depending on which server
+environment is used.
+
+- Mender demo environment
+
+This is if you have followed the Getting started documentation where
+you launch a Mender server locally and to configure your environment
+to connect to this local server you need to provide the IP address of
+the server on the local network.
+
+By default the demo environment will connect to 'docker.mender.io' and
+'s3.docker.mender.io' and we need to make sure that these are resolved
+to the local IP address of the running server by adding the following
+entry to '/etc/hosts'
+
+    <ip address of demo environment> docker.mender.io s3.docker.mender.io
+
+This is required because the communication between client and server
+is utilizing TLS and the provided demo server certificate (server.crt)
+is only valid for 'docker.mender.io' and 's3.docker.mender.io'
+domains.
+
+- Hosted Mender
+
+To authenticate the Mender client with the Hosted Mender server you
+need a tenant token.
+
+To get your tenant token:
+
+- log in to https://hosted.mender.io
+- click your email at the top right and then ???My organization???
+- press the ???COPY TO CLIPBOARD???
+- assign content of clipboard to TenantToken
+
+Example mender.conf options for Hosted Mender:
+
+    {
+      ...
+      "ServerURL": "https://hosted.mender.io",
+      "TenantToken": "<paste tenant token here>"
+      ...
+    }
+
+
+Creating Mender Artifacts
+-------------------------
+
+To create Mender Artifacts based on Buildroot build output you must
+include BR2_PACKAGE_HOST_MENDER_ARTIFACT in your configuration, and
+then you would typically create the Mender Artifact in a post image
+script (BR2_ROOTFS_POST_IMAGE_SCRIPT). Below is an example of such a
+script:
+
+    #!/bin/sh
+
+    set -e
+    set -x
+
+    device_type=$(cat ${TARGET_DIR}/var/lib/mender/device_type | sed 's/[^=]*=//')
+    artifact_name=$(cat ${TARGET_DIR}/etc/mender/artifact_info | sed 's/[^=]*=//')
+
+    if [ -z "${device_type}" ] || [ -z "${artifact_name}" ]; then
+        echo "missing files required by Mender"
+        exit 1
+    fi
+
+    ${HOST_DIR}/usr/bin/mender-artifact write rootfs-image \
+        --update ${BINARIES_DIR}/rootfs.ext4 \
+        --output-path ${BINARIES_DIR}/${artifact_name}.mender \
+        --artifact-name ${artifact_name} \
+        --device-type ${device_type}
+
+As you can see some properties are extracted from target rootfs, and
+this is because these values are used for compatibility checks,
+meaning that the information must be present in both rootfs and in
+Mender Artifact meta data.
+
+- device_type - must be an exact match between rootfs and Mender
+                Artifact meta-data to apply update. You can set an
+                array of devices here as well, e.g if your image is
+                compatible with multiple hardware revisions
 
-The simplest way to do it is to change these files in an overlay or in a post
-build script.
+- artifact_name - must be an exact match between rootfs and Mender
+                  Artifact meta-data to apply update.
 
-Configuring mender with certificates
+Configuring Mender with certificates
 ------------------------------------
 
-Mender uses TLS to communicate with the management server, and if you use a
-CA-signed certificate on the server, you should select the ca-certificates
-package otherwise it doesn't work.
+Mender uses TLS to communicate with the management server, and if you
+use a CA-signed certificate on the server, you must include
+BR2_PACKAGE_CA_CERTIFICATES in your configuration to authenticate TLS
+connections.
