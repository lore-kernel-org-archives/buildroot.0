From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 21:49:31 +0200
Subject: [Buildroot] [git commit] package/rtl8821au: fix build against 5.8.x
 kernel
Message-ID: <20200919194016.9719A8B4F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff14e08fe5b6b52e56a1d5a235be1ec78c477367
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...56_state-to-rtl_sha256_state-to-avoid-nam.patch |  79 +++++++++++++++
 ...e-rtw_mgmt_frame_register-on-kernel-5.8.0.patch |  47 +++++++++
 ...nvert-file_operations-to-proc_ops-for-5.6.patch | 109 +++++++++++++++++++++
 3 files changed, 235 insertions(+)

diff --git a/package/rtl8821au/0004-rename-sha256_state-to-rtl_sha256_state-to-avoid-nam.patch b/package/rtl8821au/0004-rename-sha256_state-to-rtl_sha256_state-to-avoid-nam.patch
new file mode 100644
index 0000000000..41cee2b247
--- /dev/null
+++ b/package/rtl8821au/0004-rename-sha256_state-to-rtl_sha256_state-to-avoid-nam.patch
@@ -0,0 +1,79 @@
+From 19aee91e45788d594615a9be58fa5d0879ec816a Mon Sep 17 00:00:00 2001
+From: youcai <omegacoleman@gmail.com>
+Date: Tue, 18 Aug 2020 00:43:16 +0800
+Subject: [PATCH] rename sha256_state to rtl_sha256_state to avoid name
+ conflict with crypto
+
+[Upstream: https://github.com/abperiasamy/rtl8812AU_8821AU_linux/pull/338/commits/af6f6c1578f16145478326a939bb7593bbcdb4e7.patch]
+Signed-off-by: Coleman <omegacoleman@gmail.com>
+Signed-off-by: Christian Stewart <christian@paral.in>
+---
+ core/rtw_security.c    | 10 +++++-----
+ include/rtw_security.h |  2 +-
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/core/rtw_security.c b/core/rtw_security.c
+index d54e6af..de2d91f 100644
+--- a/core/rtw_security.c
++++ b/core/rtw_security.c
+@@ -2200,7 +2200,7 @@ BIP_exit:
+ 
+ #ifndef PLATFORM_FREEBSD
+ /* compress 512-bits */
+-static int sha256_compress(struct sha256_state *md, unsigned char *buf)
++static int sha256_compress(struct rtl_sha256_state *md, unsigned char *buf)
+ {
+ 	u32 S[8], W[64], t0, t1;
+ 	u32 t;
+@@ -2249,7 +2249,7 @@ static int sha256_compress(struct sha256_state *md, unsigned char *buf)
+ }
+ 
+ /* Initialize the hash state */
+-static void sha256_init(struct sha256_state *md)
++static void sha256_init(struct rtl_sha256_state *md)
+ {
+ 	md->curlen = 0;
+ 	md->length = 0;
+@@ -2270,7 +2270,7 @@ static void sha256_init(struct sha256_state *md)
+    @param inlen  The length of the data (octets)
+    @return CRYPT_OK if successful
+ */
+-static int sha256_process(struct sha256_state *md, unsigned char *in,
++static int sha256_process(struct rtl_sha256_state *md, unsigned char *in,
+                           unsigned long inlen)
+ {
+ 	unsigned long n;
+@@ -2311,7 +2311,7 @@ static int sha256_process(struct sha256_state *md, unsigned char *in,
+    @param out [out] The destination of the hash (32 bytes)
+    @return CRYPT_OK if successful
+ */
+-static int sha256_done(struct sha256_state *md, unsigned char *out)
++static int sha256_done(struct rtl_sha256_state *md, unsigned char *out)
+ {
+ 	int i;
+ 
+@@ -2363,7 +2363,7 @@ static int sha256_done(struct sha256_state *md, unsigned char *out)
+ static int sha256_vector(size_t num_elem, u8 *addr[], size_t *len,
+                          u8 *mac)
+ {
+-	struct sha256_state ctx;
++	struct rtl_sha256_state ctx;
+ 	size_t i;
+ 
+ 	sha256_init(&ctx);
+diff --git a/include/rtw_security.h b/include/rtw_security.h
+index d41014e..98feb69 100644
+--- a/include/rtw_security.h
++++ b/include/rtw_security.h
+@@ -233,7 +233,7 @@ struct security_priv {
+ #endif /* DBG_SW_SEC_CNT */
+ };
+ 
+-struct sha256_state {
++struct rtl_sha256_state {
+ 	u64 length;
+ 	u32 state[8], curlen;
+ 	u8 buf[64];
+-- 
+2.28.0
+
diff --git a/package/rtl8821au/0005-disable-rtw_mgmt_frame_register-on-kernel-5.8.0.patch b/package/rtl8821au/0005-disable-rtw_mgmt_frame_register-on-kernel-5.8.0.patch
new file mode 100644
index 0000000000..6d09153b82
--- /dev/null
+++ b/package/rtl8821au/0005-disable-rtw_mgmt_frame_register-on-kernel-5.8.0.patch
@@ -0,0 +1,47 @@
+From 9421b0763e5f20babb2c0fd437979a71fbac1739 Mon Sep 17 00:00:00 2001
+From: Christian Stewart <christian@paral.in>
+Date: Tue, 8 Sep 2020 22:46:45 -0700
+Subject: [PATCH] disable rtw_mgmt_frame_register on kernel 5.8.0
+
+rtl8812au: fix build for kernel 5.8
+
+[Source: https://github.com/lwfinger/rtl8812au/commit/ec1591b90dd323185717fa42887f96444cca5921.patch]
+Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
+Signed-off-by: Christian Stewart <christian@paral.in>
+---
+ os_dep/linux/ioctl_cfg80211.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/os_dep/linux/ioctl_cfg80211.c b/os_dep/linux/ioctl_cfg80211.c
+index 019daf9..13238cb 100644
+--- a/os_dep/linux/ioctl_cfg80211.c
++++ b/os_dep/linux/ioctl_cfg80211.c
+@@ -5177,6 +5177,7 @@ exit:
+ 	return ret;
+ }
+ 
++#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 8, 0)
+ static void cfg80211_rtw_mgmt_frame_register(struct wiphy *wiphy,
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 6, 0))
+         struct wireless_dev *wdev,
+@@ -5205,6 +5206,7 @@ static void cfg80211_rtw_mgmt_frame_register(struct wiphy *wiphy,
+ exit:
+ 	return;
+ }
++#endif
+ 
+ #if defined(CONFIG_TDLS) && (LINUX_VERSION_CODE >= KERNEL_VERSION(3,2,0))
+ static int cfg80211_rtw_tdls_mgmt(struct wiphy *wiphy,
+@@ -6021,7 +6023,9 @@ static struct cfg80211_ops rtw_cfg80211_ops = {
+ 
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,37)) || defined(COMPAT_KERNEL_RELEASE)
+ 	.mgmt_tx = cfg80211_rtw_mgmt_tx,
++#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 8, 0)
+ 	.mgmt_frame_register = cfg80211_rtw_mgmt_frame_register,
++#endif
+ #elif  (LINUX_VERSION_CODE>=KERNEL_VERSION(2,6,34) && LINUX_VERSION_CODE<=KERNEL_VERSION(2,6,35))
+ 	.action = cfg80211_rtw_mgmt_tx,
+ #endif
+-- 
+2.28.0
+
diff --git a/package/rtl8821au/0006-rtw_proc-convert-file_operations-to-proc_ops-for-5.6.patch b/package/rtl8821au/0006-rtw_proc-convert-file_operations-to-proc_ops-for-5.6.patch
new file mode 100644
index 0000000000..607d00d604
--- /dev/null
+++ b/package/rtl8821au/0006-rtw_proc-convert-file_operations-to-proc_ops-for-5.6.patch
@@ -0,0 +1,109 @@
+From d3bd26812728c9ac2249ea29bda674dd31034ac6 Mon Sep 17 00:00:00 2001
+From: Christian Stewart <christian@paral.in>
+Date: Tue, 8 Sep 2020 23:08:39 -0700
+Subject: [PATCH] rtw_proc: convert file_operations to proc_ops for 5.6.x
+ compat
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+---
+ os_dep/linux/rtw_proc.c | 40 ++++++++++++++++++++++++++++++++++++++--
+ 1 file changed, 38 insertions(+), 2 deletions(-)
+
+diff --git a/os_dep/linux/rtw_proc.c b/os_dep/linux/rtw_proc.c
+index 048080a..d944649 100644
+--- a/os_dep/linux/rtw_proc.c
++++ b/os_dep/linux/rtw_proc.c
+@@ -65,9 +65,15 @@ inline struct proc_dir_entry *rtw_proc_create_dir(const char *name, struct proc_
+ }
+ 
+ inline struct proc_dir_entry *rtw_proc_create_entry(const char *name, struct proc_dir_entry *parent,
+-        const struct file_operations *fops, void * data)
++	#if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 6, 0))
++	const struct file_operations *fops,
++	#else
++	const struct proc_ops *fops,
++	#endif
++	void * data
++	)
+ {
+-	struct proc_dir_entry *entry;
++        struct proc_dir_entry *entry;
+ 
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,26))
+ 	entry = proc_create_data(name,  S_IFREG|S_IRUGO|S_IWUGO, parent, fops, data);
+@@ -167,6 +173,7 @@ static ssize_t rtw_drv_proc_write(struct file *file, const char __user *buffer,
+ 	return -EROFS;
+ }
+ 
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 6, 0))
+ static const struct file_operations rtw_drv_proc_fops = {
+ 	.owner = THIS_MODULE,
+ 	.open = rtw_drv_proc_open,
+@@ -174,7 +181,16 @@ static const struct file_operations rtw_drv_proc_fops = {
+ 	.llseek = seq_lseek,
+ 	.release = single_release,
+ 	.write = rtw_drv_proc_write,
++}
++#else
++static const struct proc_ops rtw_drv_proc_fops = {
++	.proc_open = rtw_drv_proc_open,
++	.proc_read = seq_read,
++	.proc_lseek = seq_lseek,
++	.proc_release = seq_release,
++	.proc_write = rtw_drv_proc_write,
+ };
++#endif
+ 
+ int rtw_drv_proc_init(void)
+ {
+@@ -776,6 +792,7 @@ static ssize_t rtw_adapter_proc_write(struct file *file, const char __user *buff
+ 	return -EROFS;
+ }
+ 
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 6, 0))
+ static const struct file_operations rtw_adapter_proc_fops = {
+ 	.owner = THIS_MODULE,
+ 	.open = rtw_adapter_proc_open,
+@@ -784,6 +801,15 @@ static const struct file_operations rtw_adapter_proc_fops = {
+ 	.release = single_release,
+ 	.write = rtw_adapter_proc_write,
+ };
++#else
++static const struct proc_ops rtw_adapter_proc_fops = {
++	.proc_open = rtw_adapter_proc_open,
++	.proc_read = seq_read,
++	.proc_lseek = seq_lseek,
++	.proc_release = single_release,
++	.proc_write = rtw_adapter_proc_write,
++};
++#endif
+ 
+ int proc_get_odm_dbg_comp(struct seq_file *m, void *v)
+ {
+@@ -1030,6 +1056,7 @@ static ssize_t rtw_odm_proc_write(struct file *file, const char __user *buffer,
+ 	return -EROFS;
+ }
+ 
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 6, 0))
+ static const struct file_operations rtw_odm_proc_fops = {
+ 	.owner = THIS_MODULE,
+ 	.open = rtw_odm_proc_open,
+@@ -1038,6 +1065,15 @@ static const struct file_operations rtw_odm_proc_fops = {
+ 	.release = single_release,
+ 	.write = rtw_odm_proc_write,
+ };
++#else
++static const struct proc_ops rtw_odm_proc_fops = {
++	.proc_open = rtw_odm_proc_open,
++	.proc_read = seq_read,
++	.proc_lseek = seq_lseek,
++	.proc_release = single_release,
++	.proc_write = rtw_odm_proc_write,
++};
++#endif
+ 
+ struct proc_dir_entry *rtw_odm_proc_init(struct net_device *dev)
+ {
+-- 
+2.28.0
+
