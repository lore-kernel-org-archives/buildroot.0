From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 24 Jul 2019 10:35:37 -0700
Subject: [Buildroot] [RFC PATCH 3/4] toolchain-wrapper: add linker override
 option
In-Reply-To: <20190724173538.22913-1-joseph.kogut@gmail.com>
References: <20190724173538.22913-1-joseph.kogut@gmail.com>
Message-ID: <20190724173538.22913-4-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 toolchain/toolchain-wrapper.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index c73a0cc079..131a239f7f 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -360,6 +360,17 @@ int main(int argc, char **argv)
 	}
 #endif /* ARCH || CPU */
 
+#if defined(BR_LINKER)
+	/* Specify our linker if it's not already set */
+	for (i = 1; i < argc; i++) {
+		if (!strncmp(argv[i], "-fuse-ld=", strlen("-fuse-ld=")))
+			break;
+	}
+	if (i == argc && !getenv("BR2_NO_LINKER_OVERRIDE")) {
+		*cur++ = "-fuse-ld=" BR_LINKER;
+	}
+#endif /* BR_LINKER */
+
 	if (parse_source_date_epoch_from_env()) {
 		*cur++ = _time_;
 		*cur++ = _date_;
-- 
2.22.0
