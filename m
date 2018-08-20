From: Mirza Krak <mirza.krak@northern.tech>
Date: Mon, 20 Aug 2018 15:09:02 +0200
Subject: [Buildroot] [[PATCH v2 02/14] package/mender: provide sane values
 in mender.conf
In-Reply-To: <20180820130914.22377-1-mirza.krak@northern.tech>
References: <20180820130914.22377-1-mirza.krak@northern.tech>
Message-ID: <20180820130914.22377-3-mirza.krak@northern.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current values that are in mender.conf will actually
cause the Mender client to fail to start because of invalid
values.

Provide sane default values that at least allow the Mender client
to parse the configuration options and start running.

The values provided will actually work in a "Demo Environment",
see https://docs.mender.io/getting-started/create-a-test-environment.

Though an entry is required in /etc/hosts to resolve the URL to the
local IP address of the running demo server.

Example:

    echo "192.168.0.10 docker.mender.io s3.docker.mender.io" >> \
         /etc/hosts

Above is required because the demo certificate
(/etc/mender/server.crt) is created for https://docker.mender.io.

Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
---
 package/mender/mender.conf | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/package/mender/mender.conf b/package/mender/mender.conf
index a5c7c545c3..979f16aaf6 100644
--- a/package/mender/mender.conf
+++ b/package/mender/mender.conf
@@ -1,14 +1,10 @@
 {
-  "ClientProtocol": "http",
-  "HttpsClient": {
-    "Certificate": "",
-    "Key": ""
-  },
-  "RootfsPartA": "@MENDER_ROOTFS_PART_A@",
-  "RootfsPartB": "@MENDER_ROOTFS_PART_B@",
-  "UpdatePollIntervalSeconds": @MENDER_UPDATE_POLL_INTERVAL_SECONDS@,
-  "InventoryPollIntervalSeconds": @MENDER_INVENTORY_POLL_INTERVAL_SECONDS@,
-  "RetryPollIntervalSeconds": @MENDER_RETRY_POLL_INTERVAL_SECONDS@,
-  "ServerURL": "@MENDER_SERVER_URL@",
-  "ServerCertificate": "@MENDER_CERT_LOCATION@"
+  "InventoryPollIntervalSeconds": 1800,
+  "UpdatePollIntervalSeconds": 1800,
+  "RetryPollIntervalSeconds": 300,
+  "RootfsPartA": "mmcblk0p2",
+  "RootfsPartB": "mmcblk0p3",
+  "ServerCertificate": "/etc/mender/server.crt",
+  "ServerURL": "https://docker.mender.io",
+  "TenantToken": "dummy"
 }
-- 
2.11.0
